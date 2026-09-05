Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F312DC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 07:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8I1Jlm5MucKkfjFwaOiA/wi4L8q8pr7cNwUH5XJFU8M=; b=2wYJniTx4OP8TytKdxcFytofb0
	jImQaSLs44Ls9pw8rNkmHFP0CiYeGUH2SGMUh6YOHVYVlQ7YuzGUPbDw2wetyWPvKDKYe4WzdYJLT
	Fg2r+GGGRjdATz2pAlEg6H6u9xViWHJ6evn7G8zYeHI8vZoZk9CfEpySYaMw/s8QtKVgFz2fe5KdJ
	sLGizg3HzJLM92OsG5alfbwucVi0cobJH3L7rp15Jro1WDB/nt67DKbb4KpBhxUkxtrhavxG9dNzG
	4gqaycmlPcsZPDNvjRZOyJdHFnQfqogW7yukB7Dpk/SecXLkFQpy9VT/3W6ftPOK5x68mATdbiOxJ
	ifBhUBSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kRX-00000003lCA-3CUC;
	Sat, 05 Sep 2026 07:04:03 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kRU-00000003lAg-1oCQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 07:04:01 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso16516475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 00:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591838; x=1789196638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8I1Jlm5MucKkfjFwaOiA/wi4L8q8pr7cNwUH5XJFU8M=;
        b=NPdOq/E1SdX2SoYHnAlryzl/isrtjV3cS2+jfJxASaS9QZKym1cQ/RuoKrBoSAglD7
         bAOyh4IbXZdD9xBfvgWl9e5QenowCM45I2OxbnOW/XbQt9whmLD9DKBd849NNePbZoKa
         f3dI8R/lc6LiQI/t5J4v/hutMzI6mbtQm/qWcZfgXdyOGJ1ttOtQVCmurpsV2Urmqjcu
         xLe++5pkoEdD+DsRgQu60MjCV149OAbADzuNTa8yo7QG8p7BIK1pSJBzOeQMRZGICHY+
         n1781itTHT8HwkP9mxtQRB26grPk/Pn40jlfwPIUj8LwHU0tye9qSIuTEdgzMmlc09DF
         ibXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591838; x=1789196638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8I1Jlm5MucKkfjFwaOiA/wi4L8q8pr7cNwUH5XJFU8M=;
        b=HD8qB0HwAPt+rrkvlVYpRkAHyu2nsMyEtuUvhpt3S4+3GRJCogEJYmmj6NoHs2JJBK
         9Q1hFDSWMp/D+zevGsBwtH7IwV3vVTM4mRuC8urQgiIOoMbjOSiR38jxuaxTDueyEMHw
         sBBsQmH9D+RIU2EkVGe1/CnjOOLpLo2vWzdQEXh4WTEWY4IN7g1Ld7DzpEE1xmppYIut
         qdXdzUQ4p+AH1d9VbZNOZ9Q9AenuyEzRw4Se1EeeReHAmffkwM5Lx/AUGh3i6t91eQXT
         luI5opAisQUiN/G8w5i4Rau8oMCHZNN39HkRndQlXrIzeaZPu/F6sUUqFj4PnfkNAZnf
         LVTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnZngTM/hIXqjZGDKLlXq5RjPcPcDdWgIym+3Fk6dnEzIGU2EdojiwjNUWM0caxo4oASsFH9ilcOH8FkbQJhuR@lists.infradead.org
X-Gm-Message-State: AFuF++l81FNs15DcGeN+uvKC/MXfdEi6C4MDlKOtzJJlt3jeEp8TfP8k
	nOLXRggE8YcTpj8om6RCMwQv6NU0GwdLCCGK9MCXGSG52VE6VhUO2K+A
X-Gm-Gg: AYBFou02zhEm+4z22Rf838MfptVGgWIxiqNak6Pr8ggNrVXtRpNPgvl0GG/hJNRQLTy
	/Tcszjr3frFVTfesxVm42A0dgR6KZO0pUmkqB6PHKwvKvglZ2C7FW+Wsq8WCiqzrsm3GskJF+BC
	cweqr45563RJJiAFW6SKQP/XI0OhTblqCRsKXVXfCsJOMTbFuxQ0kmWuwvVNdYLhw/8dslX+KUq
	fnQPMxjDCriZ5Uh2wlOZ9fZ7D+A9mm+Bc+VoQ5BLtj5M3dDqoGJrE0bwkLbgDcnx6Hcsfuu22SR
	nZey2k9PtisZUaJ4o9Ubr079hqg9l2K6b2WKHVfJFFR5M5n44VGuMqqAR9aImOOQFaG53V2LQYc
	TMUU0J2lhPjFd83fBjomuL021zhtea1sDFrbdOyfralznP2qRNW2h+cizLoED1peNC048OsGm2u
	OMXHE+TfA6rGrBnuIPoQXFIw5y5RfR9yO1rdFNhdSOpPo/lGE11ZTLJpFwXhD8J7VU/45m6sFDy
	6FCIelK9wVLcpuczt99Df474rlTLj0xj+AZ1Eq8cy02C3xHCcTcLurb3QwCEZenm+8YLa1r8iut
	4pWes8WhWm8/6BnomAMroIPK03EpFdR7fYrO5z0bFecMgSjklhDPlcHjW+WJwn6Jf8Ur3v42
X-Received: by 2002:a05:600c:c168:b0:49c:edfa:15a with SMTP id 5b1f17b1804b1-49cf826c5f5mr97941975e9.13.1788591838387;
        Sat, 05 Sep 2026 00:03:58 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.03.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:03:57 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
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
	linux-ide@vger.kernel.org
Subject: [PATCH 2/9] docs: kernel-parameters: Drop the bau= entry
Date: Sat,  5 Sep 2026 09:03:40 +0200
Message-Id: <20260905070347.25902-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905070347.25902-1-kmehltretter@gmail.com>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_000400_485177_F4404EFB 
X-CRM114-Status: GOOD (  11.26  )
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

bau= went away with commit 39297dde7390 ("x86/platform/uv: Remove UV
BAU TLB Shootdown Handler"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: 39297dde7390 ("x86/platform/uv: Remove UV BAU TLB Shootdown Handler")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c8d96de4c00d..99d5bb68968a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -624,13 +624,6 @@ Kernel parameters
 			Format: <int> (must be >=0)
 			Default: 64
 
-	bau=		[X86_UV] Enable the BAU on SGI UV.  The default
-			behavior is to disable the BAU (i.e. bau=0).
-			Format: { "0" | "1" }
-			0 - Disable the BAU.
-			1 - Enable the BAU.
-			unset - Disable the BAU.
-
 	bdev_allow_write_mounted=
 			Format: <bool>
 			Control the ability to open a mounted block device
-- 
2.53.0


