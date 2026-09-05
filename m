Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B4BC624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 07:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVDepIdvewIAkDae/qknvPHnA6zOWa1HlsWKZdzZmcw=; b=rkYWOihOIR9IpqVz7LusbbZWLd
	x7GLp1ut1BB4MIFIx3HYEmVBFckGG+18Gid7PyWTacsAIq9om0a+O5DSFHCE43nNDfppFQmJ8Wo5z
	JxzTVLKXpyA79bTgBH/hQoWC+2DTFP6oFPaQv3QTH6MOnTN9istRcZVyDMN1hAKc3eCHqEvS8Ayqq
	amY5yDUmn1GaWAWF8kPnLoIbTo2Zw9ZwJQmlz7qzbMoYW4jkcFW/HDjI8HkGIhhzaXDdz8F7Sc/2y
	iEfAESGcBn0UMEDTiep8+EbbDt+BHxPRFCe35slEkJWfU+esycYo+3tc0bFe4kUlq86iXejPe/+Dk
	eI+lz3NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kRh-00000003lI8-1tyP;
	Sat, 05 Sep 2026 07:04:13 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kRc-00000003lDa-07Rj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 07:04:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so13338235e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 00:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591846; x=1789196646; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVDepIdvewIAkDae/qknvPHnA6zOWa1HlsWKZdzZmcw=;
        b=R/ldErFGSkaWALRPfBT0IZAwN8q+hXu+7Ydu+4mNMH/U6983oG7HD728KyjABJcpaf
         JHMu+ReImBtUbuhxPBCf9eLCf433zbHPDLCVj/eKv2VXoFCDVow+CVmTInhki4W9xZGt
         uayDSLHaItoXE4tOrofTFYM06+ZYzCZtmcQqzoASn4BL4TkALSlsBiIOF3NK/H5iYEyR
         ODH0738xedW8SBWAmidBwmiCb74HKrc5tedNih6SfErvAfQ7N6l2UG57rGzul3umSVLw
         j4PcqqB6r1wnd8g1cQgJVl+mr58ynlMWpzimgvYepaVTgCslISaRs418lmiGLIvWDJoM
         /dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591846; x=1789196646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OVDepIdvewIAkDae/qknvPHnA6zOWa1HlsWKZdzZmcw=;
        b=GYHIERwIGACvPq/jvYz/8thXc34tuw0kXOPNtTHrnqT4TOhOkquf4tIwaX9Oa6Aa9a
         qDRziMeCXfieYJ+LWP1szkJujNbGNflx0j7/POnIvOm5DkPkhpQQzn2/cjh1jP0y5icK
         39pklEZoXqmX85syiUjMvj1Q1AJWlEcnfITBtSFUdnZpMDobpWY8bn+fv7EgkTyJQYLW
         r1PlgPPGfHwrOKgKek9TD8+tIAf3mrlIAU9hYd6W8L1MPa5dEf5QNcMvhQyeUWZAPCgJ
         09jR/EqBNE1SV2m8T7/pg1twUygP/g+rF1lIlk3bRsgelxnqQ8pL+g3cVZzmTz7I9R++
         pWlg==
X-Forwarded-Encrypted: i=1; AKwUvByUrrpThQZt6/H0xMh1IW/4D9rUx+4SF6W41HeFmldhoKCt1P/Z7RRXjWSGXvrzUd4SOHiBlQeSHrDr3koE3yXY@lists.infradead.org
X-Gm-Message-State: AFuF++lckQ9iCKY3ez0vWh6Zz4FnonuNPPwVKRVNeMJJbpEfgHZhCEjz
	b42SRU8fgSwFc5k31XtmqEt/Y4513NecpTuxiTpoyK3RydhPKcVWSwrl
X-Gm-Gg: AYBFou2/SKglkktsufAbKcgnyTpe70YRjanQbPZs5+QCgosEOMstei223OYICUiMUFX
	aX2Z4GlbVGCUjO3XVgxYbxaGFwFZtE6evV0PQg9FhMqzkPzBZ8COvl2kv0vbpw07YgTfyesCec3
	Fpn19SyZ6/ahlrc3mzJeHOXv/2MG+Q7eGEJdRODLUGtbSwQkCjBlp6zUF5v5Efz4dB84mbeXgcs
	DU+UlXQ9266NHeIVFa3vExZQIiExfR3eo6dLUiY5XKvTIDXUA9qNaubdKnjjsnYdSORFBxcDSQp
	rpOFFVDyb4+1k7LH5ZgNVyQKtEyCuJdMm7Kp9wKfOnyvRfRTsS+rH9tz3FKoBF6/euMJ/3vFXEH
	9LrSGmmIdJTUcZxqlMbPcB7YnVO1qJx5Wy/irgDAYmegXvWxEakw7Chk0vx0ayoFt1/NUqCAuej
	yQTpmtEDc2/87+2sAnaCqgtx7Cj2Dq7Q77wF/1ayymnXGjOb40+dBbl2NBApBuJa/KH5emO5KhU
	u9hrFfTDC5e2ksbI2ithgDjDZshEbTw+1OVFDjkmIpJXiwn4o4UDieyNZk+YHnRDKYVoclOdlFg
	JYK3MmcYSMeaBK08mDZ8in7OznfDWfJXBImLCG5+FF8r6QRUTCRZ1fOFBYSZnmdxnIwsX+NR
X-Received: by 2002:a05:600c:46d5:b0:49c:fc6c:be06 with SMTP id 5b1f17b1804b1-49cfc6cc142mr76992175e9.29.1788591845868;
        Sat, 05 Sep 2026 00:04:05 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:05 -0700 (PDT)
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
Subject: [PATCH 6/9] docs: kernel-parameters: Drop the nomfgpt entry
Date: Sat,  5 Sep 2026 09:03:44 +0200
Message-Id: <20260905070347.25902-7-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905070347.25902-1-kmehltretter@gmail.com>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_000408_090722_5EE123FC 
X-CRM114-Status: GOOD (  10.09  )
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

nomfgpt went away with commit c95d1e53ed89 ("cs5535: drop the
Geode-specific MFGPT/GPIO code"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: c95d1e53ed89 ("cs5535: drop the Geode-specific MFGPT/GPIO code")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2ed1e2c03c61..d44728a45506 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4553,9 +4553,6 @@ Kernel parameters
 
 	nomce		[X86-32] Disable Machine Check Exception
 
-	nomfgpt		[X86-32] Disable Multi-Function General Purpose
-			Timer usage (for AMD Geode machines).
-
 	nomodeset	Disable kernel modesetting. Most systems' firmware
 			sets up a display mode and provides framebuffer memory
 			for output. With nomodeset, DRM and fbdev drivers will
-- 
2.53.0


