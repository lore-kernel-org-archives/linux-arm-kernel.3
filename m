Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFF2C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 09:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UF/kDvW954cskV6VTtZlG+ZJZtMcv/59sgPBL3REqE=; b=2hKmOkmrgVdkrlgQCM0b2gef7g
	w7DAYI3SDxaLvdbL2s8+3so5CH/mAZjluHHpgulzDgnjG8KeYD+h8mzFSBxnq1FNZ6dGhkmiZaPQ9
	YmRueMga9PLwUAxuhiLg3oZ91XPk3GflGOYf689D6riR3vbBSukafHm7cgWor8xqGNUVQSF1bVoCh
	dDvYCM/A0pYeiow2k/GDsjcdZqsZUwyQ+YqgJxDLZxlanxLWipauod0IrxOLB0AYCWMRQF2fQc6Qx
	oAuGJz+4Q6LZfMi496Lj4RCgDUeTwPGgebqmlrPdyqRw+Q28xRC/d9qpBK1eKEiHWIbS1E/wQQ7bu
	tjlAejlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mzU-00000003wKc-2YUi;
	Sat, 05 Sep 2026 09:47:16 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mzP-00000003wE9-1TTy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 09:47:13 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48431648f33so2093287f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 02:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601629; x=1789206429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2UF/kDvW954cskV6VTtZlG+ZJZtMcv/59sgPBL3REqE=;
        b=X9YzbE4+4BNyFciG23BXGPCZo0EGq9U+AdIWWg0HSouSuBFgbIlzinOVuBv0ZzMzJn
         q2Mg7C2DatPPP3ZZSmhMg9Y4JIEHiP+P1XMr9KejRTBN38driJaJdc+lU6FTNvSy7oMB
         W/BjyG7PlDF7LbTqlqZaArR6iAF0BAl1/tqFrHIElFcv9wYW3rOgO210E27zSmvOv1zc
         aTD8HFh3S7I53bpMb6G7zhNcN2voU3uT1+/9PAyg2GTjUCHWPTlOe+SSBJ7PA7YRN3Og
         YiWrDMUtxMt9bGTY+x3lnkfqXzE9A+054qgZYHPSsVKN8Dkp/j3u0H3GxxUZIza6/a+2
         5IeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601629; x=1789206429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2UF/kDvW954cskV6VTtZlG+ZJZtMcv/59sgPBL3REqE=;
        b=hOhuaRccpY2PRxFGhnrtm35BiOhFggldkZrI/mufNbh5IqE9Jddipk8S4NY51v9lvg
         1krI3UHM6DTMEkY5QKLPmHpH6HR8aDq517O77bSH5VQmwfeEycOGnAb+g3R54sMjWJtX
         mtdWin39Pku4tfDWypvjTsW2vJtHH/pNuNHey/6JPu+oeV5hw/fdkCJSRAGUeNEDArFP
         ai5H/I/6sXm2YpKZNCqk90loG6VyUPkEchO7udenrgtfKACg7WydqhjfwB5i97YUsbDW
         OD0sY7qtexl8TfnedFXSFrDykzDHe9WLFBk5X4dKFM/spOda8fMPdV8AxKTowgvMQcj4
         V5Bw==
X-Forwarded-Encrypted: i=1; AKwUvBxgCXvWrPDlh9ubAqfirB76xxBJvYRDVEaA0jVwlX10Wr61uztS88ruVekj7JCns91kbf9j9TwSVTTj1mHZbITR@lists.infradead.org
X-Gm-Message-State: AFuF++lyVgp5okxlGngcAymrZbKQGEIjrGrwNCr9pWNnEZKLXIcQkbUy
	uxuwVMKFF3z/Eu0i0lv0lZRdHVuno4pxQXrn6e8kNa7MueDjqa2At93u
X-Gm-Gg: AYBFou0M4NkQ+c5K+oKwV78Yk7/jWpZVUdxKvSHSF+uNjanqrj3MHzRhv9UAHMNRCGO
	3kDKIv3yr5VRLVbaQFYtyCjRnrTuAi5yySEb0AtyuH23WfRSqEtzPspXywMdkpJEgeLWAlPiG0Y
	WjwwUwKd2iaoShSKoVCViXm2sO4VyzxhQqy0NbocfimUxbI0nSN8GjEF5Oc2FZ0RgCROBco7y6u
	UIh3p/RlNlZEuWbRf4GvnPMZRWUpUrX6CZ86rGpNxh6FUphZgMgz92kNxuLaRhdDlkBhwVeWZxl
	bf/y5Ws3reFbP47Q30vbD9mglAjtU9HEEkCp1kXmT9na6xhAPlyGZvbDfVVSIt48ERcyGNfMLJs
	8Wh88iMvbeIC+590low6314lludYdWzYAzLfGi43fFFzLxev76Jbx4Y4N+PDU+SgQnu06vKSrHV
	LSEIItdVaypqT/U8qcgpZNHwimNHTkYXUc3Jj2MWoQnR82/B+9LlRXO4NEJji4o35pcd/PVVBct
	Kdeh1hYJF0QBuRJBjTCAcJhECkdXYQ4tESxmkzNy74PT7TWKjGz/rkBNr+YUxY9ro0osa5gOoUe
	wYWtJx1rtu33/NnoildMtJDWgZAZFxzT04m8wlE/FnVMBCoJWr5BZDH5dT8rz7Slbx4=
X-Received: by 2002:a05:600c:3544:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49cf82bea0amr94305605e9.3.1788601629194;
        Sat, 05 Sep 2026 02:47:09 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:08 -0700 (PDT)
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
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 5/9] docs: kernel-parameters: Drop the mini2440= entry
Date: Sat,  5 Sep 2026 11:46:45 +0200
Message-Id: <20260905094649.41996-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905094649.41996-1-kmehltretter@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_024711_434767_D2A6D4CB 
X-CRM114-Status: GOOD (  15.42  )
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

mini2440= went away with commit 61b7f8920b17 ("ARM: s3c: remove all
s3c24xx support"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../admin-guide/kernel-parameters.txt         | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f4314492953d..2ed1e2c03c61 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4052,27 +4052,6 @@ Kernel parameters
 			Enable or disable the microcode minimal revision
 			enforcement for the runtime microcode loader.
 
-	mini2440=	[ARM,HW,KNL]
-			Format:[0..2][b][c][t]
-			Default: "0tb"
-			MINI2440 configuration specification:
-			0 - The attached screen is the 3.5" TFT
-			1 - The attached screen is the 7" TFT
-			2 - The VGA Shield is attached (1024x768)
-			Leaving out the screen size parameter will not load
-			the TFT driver, and the framebuffer will be left
-			unconfigured.
-			b - Enable backlight. The TFT backlight pin will be
-			linked to the kernel VESA blanking code and a GPIO
-			LED. This parameter is not necessary when using the
-			VGA shield.
-			c - Enable the s3c camera interface.
-			t - Reserved for enabling touchscreen support. The
-			touchscreen support is not enabled in the mainstream
-			kernel as of 2.6.30, a preliminary port can be found
-			in the "bleeding edge" mini2440 support kernel at
-			https://repo.or.cz/w/linux-2.6/mini2440.git
-
 	mitigations=
 			[X86,PPC,S390,ARM64,EARLY] Control optional mitigations for
 			CPU vulnerabilities.  This is a set of curated,
-- 
2.53.0


