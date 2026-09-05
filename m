Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BB7C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 09:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9h3cyhQ1bY0apuRrAImVycgRtlSF3vYdx1yKBS/SgnI=; b=XneY2GVYpneqseEZYoa/MP4LXM
	iWSWk4wxowiPG9PlqxVcqutzBMaPvRcDSmx4GXTYJLswV7yVBRr4ryuZj9jthEybE9X2xO9O3eTjb
	+/5DonHKxl5x5v7rwXKQDLrmjr7ZFUNwUkU3w7c4GnO2RWzFv1YTcT0j4erytv7Y4RHzxMgOkNV/9
	lZaFvXQ9c1iIBV0qidWdKafA2MO9P8UM5Gh3q2RdGpQpSRnVTEONeVkO8aYFB0px5z43sJNvadVHx
	oy9fCRXJzF0oUFhnpVM3grIk1ISKys43zDdOG0YqmRx74FYA8bq7s6lGge/N65kz13mm+hIgAHF/b
	ckLRNobg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mzP-00000003wF1-1usx;
	Sat, 05 Sep 2026 09:47:11 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mzN-00000003wCQ-2OZH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 09:47:10 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48431648f33so2093256f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 02:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601628; x=1789206428; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h3cyhQ1bY0apuRrAImVycgRtlSF3vYdx1yKBS/SgnI=;
        b=R3Of+tQqJC+jec/gSfKdNT7h3TN4st1/hTCKNmHFQLzrYqbP6/0sS1QHHJsCsxb+Fw
         jRxgi4QLYoAYK8L3Tt2kwrSMaFZTIWknHOuFLc3WKCgvG+ln3w5rGKcMXPVZUbLK8rAw
         zRPG17uJCiaxEgUIs8wIr/ECPPfJqNKhLXO/62UDlAN+BSxO9N6Yhx9aX3ctN/3/RzcY
         DLoEOaePJ3lXPldL8xx4UnS5I1G2Ngz/hLDI3t8mLE2O6ZpbDgSYyfvvKPMAy68TWz+q
         ztWXSEXpONb/N9vchrblvGn8mpw/arqYknnqOISERqTwOA7ks8E81MbytmHyKbhJ0MJJ
         mLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601628; x=1789206428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9h3cyhQ1bY0apuRrAImVycgRtlSF3vYdx1yKBS/SgnI=;
        b=qimIRlSJ9b/DBGIprseoooMyzB4fH5QX72tFB5N9nIeQHdauw8o2M7hoNWYoFbJ/+k
         uohI329MKmj3ezNAvU3A8VbhN7Pln5lj847qCuarAYyvYZse8CM8AhsvJcaoB2UVmr3H
         2rBu9ZEZ+syGHPJWRCsunrhnhQ2QYNxI8YLvbVa4zlBF2Rzo85A8LRvnAE8qBswRpRwy
         +AvW5Z6pFLqKJAWQaSNP0JZb9P4v/ik1n0IPbgYsB08jmaWJdSABk/Lilikn3Hea0xJS
         3c7mTMRzbQn1zkTscMH5I2yo222oo6eNAfumZJjDmrwt9nFzMWWsoemt71pwryZJyW4q
         wL2w==
X-Forwarded-Encrypted: i=1; AKwUvBwz5SCJmKCaJygjHfAAMyVz/hfzWDitz8sgI26lpz+Hfey/3UZWb8IS/KexwU6XlY1H+ynHntg/WlHZT3YNindz@lists.infradead.org
X-Gm-Message-State: AFuF++npUiRvmh27rXv4IwnwLKUUdlVwBBp4ZcYjM1cD4WP0CUXnTgst
	k9peYi+fFE+VbBOd7S8KMwDs7WgoC90kfFH5kIgGDOiqR2NvDQbaEeU1
X-Gm-Gg: AYBFou1/JeZo9ux7mRVdCoe6p5Nn8Qe06MeR2yCanB1ayL7BCE8d9X0f5TWOMC0G8Si
	fWCxjZTWl462X/4hmm60GRIZKJocGPDylS4OtKfuqMXoVzeyPt5F/EJTQOIfr+FLYPbK2YJgzT+
	5pCAFhHx/ML1W8pll3Eb6mF9bdwC5AjxzrY7j6y2DAFqLaUN0oHHiq3dFCYUwKawaJ2cSf1VzB2
	xTmSnO9MQjAkB3QV4akwpxdtnSeFnH3n42rnSGi2u0pnPO/HMLFHqu6Z+II+VejONz1PRn07tia
	LF9CFhhcCiBVcSvsaYb1hmg0KcS/VBcXyILf0xAuBao6QU+cv6o13xhvFN+ydtwj02WGtbPE04d
	Nnd7Apr9i0GuVtcJPQYoZSMydYZf9o/INDGI+yR/pmGotWY4FCRZeC6YCuHMjlqEno0FGUxFASb
	5jSgWNj1jWKvgFCics+QbsSyp5/dy9wWoxWdwYbZn6L6AKrDC0YLdfT9KftVq7hhXqZdlHJSs6g
	MOH7MjmqcVGOxjcLy1M4GxHjyBdyBChxv+ooa8O1/VPzmpZVo22te3NvcVTewjqU2oiCOh898Jy
	rKMLKmpNFv5ZEbo1BKbwVwNIVuN1TvxbwUnxrT7QIrq3Cvil9Z2jISrizmhh+GeQAtBmR6v4pJ3
	rcA==
X-Received: by 2002:a05:600c:a307:b0:49c:f13d:ffea with SMTP id 5b1f17b1804b1-49cf13e05c2mr154976805e9.14.1788601627485;
        Sat, 05 Sep 2026 02:47:07 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:06 -0700 (PDT)
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
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 4/9] docs: kernel-parameters: Drop the enable_timer_pin_1 entry
Date: Sat,  5 Sep 2026 11:46:44 +0200
Message-Id: <20260905094649.41996-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905094649.41996-1-kmehltretter@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_024709_622438_5322A161 
X-CRM114-Status: GOOD (  12.01  )
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

enable_timer_pin_1 lost its early_param() in commit efa2559f6516 ("x86:
order variables in io_apic_xx.c"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: efa2559f6516 ("x86: order variables in io_apic_xx.c")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2a8d862ef30f..f4314492953d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1647,12 +1647,6 @@ Kernel parameters
 			to discrete, to make X server driver able to add WB
 			entry later. This parameter enables that.
 
-	enable_timer_pin_1 [X86]
-			Enable PIN 1 of APIC timer
-			Can be useful to work around chipset bugs
-			(in particular on some ATI chipsets).
-			The kernel tries to set a reasonable default.
-
 	enforcing=	[SELINUX] Set initial enforcing status.
 			Format: {"0" | "1"}
 			See security/selinux/Kconfig help text.
-- 
2.53.0


