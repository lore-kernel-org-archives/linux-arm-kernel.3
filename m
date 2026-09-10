Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5BCC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 01:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0noSNcNvP/+I+rxnaf4LKhy/qChedg87Os3I3Fnbpw=; b=1IxmwRY7ogy0ru3nxH7ODsRzQP
	qx5j4t2H4GAWq6u0FRHKV3uTwt7amBYACkbrfY/0v3KaNAMwjZEDI29sRM3ydNNbUpPRwmiS2WA8D
	k8mSeCtWcezQGjZAT6EvQExbkRVpTA2ZPafvGY/9QsicRgQIUPHzQVpn55JO4ENYmW9Yx1rI4X/nS
	qgE/kqGANRfUv43dLJjss561KHf0lwyFJK1CYhWyEsOL4vnC9P/3fmQvmSjtXjnh6etJpquDKV7wD
	ry+E4wmKk4/sdpPb2TKvXistp/qqr3uwuxIRfCZNBhdhoyaERq/Z73wkyDIP35Ya6afD63R1gGlnE
	tbaLdk4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Tex-0000000DBqL-0JFP;
	Thu, 10 Sep 2026 01:33:03 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Teo-0000000DBnQ-3EXT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 01:32:55 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso53320375e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 18:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003972; x=1789608772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0noSNcNvP/+I+rxnaf4LKhy/qChedg87Os3I3Fnbpw=;
        b=e3PW8YwDOJPHlWs4PODCxCr/0sS/kzzQYVtySWPC1qmamsK6EBzyRIbFfZTIHeDKOQ
         BvkVhCNdzA14H1Rn+gYEKLM8k/V84B0aT3xYUc2TOu2F21vsPkNW/cTkv2ROcXOxPwhA
         W9aVmEbhW2Wd9CVlqduPCReeXuBaxKEwyd7tmmMYJOCArIqREsrtbfwPK7u5co2ltdsE
         VHlPah0lhdSW0Xf/99a33oecMhRHs6LX9huM9n35zv1/XFZPEY43erZgTH8vAmjs6qal
         YTB7beIl8QW8wFpxGY98AA0rHaD25Tdfs0GZoR0syX3QErJ+Iqu2EjKksrNij5XgmA9W
         +M6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003972; x=1789608772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G0noSNcNvP/+I+rxnaf4LKhy/qChedg87Os3I3Fnbpw=;
        b=ESy+UuxrEYXUQddSVmmgOZOk7b1VhTHRY1gpaoOJtKaSwuMQpRKO0t29JZKvmjNNl/
         6Kl43t4pvHDJTynqC+CEpV/CagftKYJ9AKqbezpq62Jwehw/Wunf/qiu3qkW5AfTXgVU
         fGfKr/HJkm2t0ywzV1yKNHlfDfQA/1KSXMmRTCOx8UBbjgIU6o7RWS7WZc5E4QI4oUqo
         OzwsEFylQmQMtSXQSixfigAAFhamfodpwtlt4hFnYJr88zpLFBZwwv3U9uvscL7aWIDL
         Rk0cc0mC3xXlOisRmA7HAjR2mwPtpHJBgzjLfvf5qomOlPHuSXAZclVP3fQjN0OGfcrQ
         i1Ng==
X-Forwarded-Encrypted: i=1; AKwUvBw6FTtRB5KeW4Qvy/AXogmTmi5gwos4eY5pivIX4X7PdrymT3IGsX2IRs3LpOQRbPLUe0N0wCKqWOYCrwJI1uSY@lists.infradead.org
X-Gm-Message-State: AFuF++nPR3Gwp9xfYzI5dPSmeV5s/6yCVCyN1j9hfWjxLGaGzVyqEo4h
	kOmOMXcFVpyXLlPVEYQMZzJLh2jaTbl9ubhHGm23hWTQIohgGIIJIVS+
X-Gm-Gg: AYBFou04ZvsBkBtJ9fGl97DMy4XWaPmyjW2EnMX+3ffc4HYxeouUnj/QMlfbH+EWouV
	6hCc/WGbpDox7XwUJdI3goFLMDw8ZOBJavSwXB2gdgqcJMqbE6uHjCVk37bjsHs0exAhH4MOG4/
	xHdHgM/ONjmmhMvwitVSq5+alUt6saSAbRcp08BeCRExEW9h0xjqA2XJKdpIZkuBtHPDfIT9uV9
	V2yUSTqAqxkKyKWqitXSGhtho4JTB18/MafK3drRnhT7k9xvnET5j+ucZ9dX/hhyRMsYOmpunHT
	MQSg8ImtSAP9O3sJEjnJlaOJt6vdQLbGLegJMhu+t4Nw0OlVao51/YaQr4GIgrI4czVy5c0Jsl5
	uo8c5+B7TwMLirUqR8znHlEq0DtuLAlxHi4uSpupcmBK4Vm1OpjfQuKEBWvjy4yFSWBU6pDVAC/
	XcXTEGfTwnOjGKs0/OoKPive3AILHoGnDKCofnvmpyLHllCNUqBmQaCVZUSAQGhFaeCD8eE4ftV
	tdsy4FJgmS/+vQAd+/MnA6+DiGxQEB22mX4AH0uGofqmK7HjM4/EPZDqExYjjbeMJrwPdOsLJZP
	IIUG9Zlu3XmT0Mnr75h6HewmhqmOXMGloTCfLv0Ko4WAsvKHF7e7hFCKQoPiw5S2JkofXvGovM7
	9EQ==
X-Received: by 2002:a05:600c:3ba3:b0:49d:e79:612f with SMTP id 5b1f17b1804b1-49d0e79635amr237510065e9.26.1789003972418;
        Wed, 09 Sep 2026 18:32:52 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.32.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:32:52 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Mike Travis <mike.travis@hpe.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 1/8] docs: kernel-parameters: Drop the atarimouse= entry
Date: Thu, 10 Sep 2026 03:32:38 +0200
Message-Id: <20260910013245.8619-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910013245.8619-1-kmehltretter@gmail.com>
References: <20260910013245.8619-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_183254_821670_BBBB95EE 
X-CRM114-Status: GOOD (  12.70  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Nothing in the tree parses atarimouse=. drivers/input/mouse/atarimouse.c
only takes a module parameter, and git log -S finds no __setup() for the
boot parameter anywhere in the git history, so the entry has been stale
since before it.

Drop the entry.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd2..c8d96de4c00d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -591,8 +591,6 @@ Kernel parameters
 
 	ataflop=	[HW,M68k]
 
-	atarimouse=	[HW,MOUSE] Atari Mouse
-
 	atkbd.extra=	[HW] Enable extra LEDs and keys on IBM RapidAccess,
 			EzKey and similar keyboards
 
-- 
2.53.0

