Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2DBC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 07:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0TEPPXgHP97qr/cFTbi2WII06m9YnzLfHQVRRK4PYs=; b=HW3OK3mqc+/jPI0paBJiHY2dhD
	9h3ki2C+9GX/pCUzeg+SMEIn+SZ4bBB3U7Zi0tLorivWtexeWdPPsJw6lYOpfwWddmfTwChDNIuqi
	hiCgAozpH6kDoMLah1uEE3icCsyUnofFnEM49O7U6Nme9kPxkCifTBw3VyimSqzRptoh7BXoxAK2G
	0s63gPtpGbdLMNrAeHvIH3KRAltwdWFwce5YBJ17Zig9JYTbBawU3S21Xpa7qAp/a11UgfFztGWfY
	5Aoxy3axByjAz5EgjqGs6NYsfIZbT9kLgT+8YF+XT9iIho2MBlSsw8B2k2C1t00vUxMvV49y7cQ5z
	m9xM/1bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kRr-00000003lOb-05Lk;
	Sat, 05 Sep 2026 07:04:23 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kRl-00000003lKH-2cmY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 07:04:19 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-482e067e908so1572158f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 00:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591856; x=1789196656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r0TEPPXgHP97qr/cFTbi2WII06m9YnzLfHQVRRK4PYs=;
        b=WqBwSuQccdhTMBVVEp6rdQ62KgFh+8hjFEr0To82JYKsHxTI9my2AbaGLr+cxvaZrW
         QDIVe+Ox9PELZsc1pqCO4fBmn1DbY/CmD2M4gB/zGLSnbRVCXou20+JNOKDkPlS4u7DD
         wGUW2MSatIa0hvHwQUfou7L1vKulXUmPzlQThKxy1uHPza8Q7Ix1YFlwJdAF5Dqs+6hs
         5kUAW4TVS/r2yUrqZOxlrsA95my3xtDSd18yhJ12x75R8EeZIfsYWRwGyg7qnTXKnLsl
         aieBKKcpdDh+duqkTmNpNrfwAYXDWUyP52KqVjo3bcCZhsCJBpet4/ly96i7kbpA3Yud
         nNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591856; x=1789196656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r0TEPPXgHP97qr/cFTbi2WII06m9YnzLfHQVRRK4PYs=;
        b=DG1rrUuR7M2L0Kk6c1jvcUH1hQntPLx5tCW0UjMs56gi00iGcfJQcmxawZ5Wh5aD0L
         8MUXby4kGE86J8mBoBctFUAoAk/LbdodrqwusdIYsJBPZyVbraq0vqOtVcCV8I/7vhg0
         dg+nn68MBAAq4Uqgqpeytq0nIrYiCR9CJ4EFZBTw6xcdzd0TC2soOzTgSmmdKkSislug
         OqXEksSJ9uEOOUNI05mF2KLUr1ffwV8+47DThqaQTdVIXH58VUvA3VsWWkXvLnYYA3ok
         inCeJuC3AtvertA7R0HeDpYNERaokDsruxYHX2cJSGbJ++G8MOIEhewp0zLY5U0Sg/Hx
         QATA==
X-Forwarded-Encrypted: i=1; AKwUvBzQglGS4/6Rae0IqxuLp7wuvvqMaqVlZrIZsvNnT2xLB+kJkqBSd2jguo7bX7x7DEMEWo9CuLqCTF6mzTeL9czH@lists.infradead.org
X-Gm-Message-State: AFuF++kJ62agN25JtR3jlV3l6isxWqU/uqBLd1Izu+N3o4T/0yf27Zj8
	qAoOhJw36p0M3ipPXKmdjWp6iwtOlNqwUCJbkhcFfFm6yCk4L6jsqqi0
X-Gm-Gg: AYBFou210dnrF+JMAJ1Ww1dzEFbCgRQ/hWL04lMshYlb0S1v2Y0EWpr0WFbmRZTSZyF
	PNfRZ/9TP6lwIicKvMsAHAmFq8ymPkAc+SAgz9ox5qTIzFctcqqt/lS8YOSUvjSM8yU8PYZDbI7
	5DO3vJbMXM/Mz6qYZ4YCwdCo97Ar+F/yoDn+we9eoP0KYPI2vTwnr/L0ahySXKWRBN3Jyi5CIl6
	rzkQh3ZHMCLP4XWcbqfY199LtBpmGFsWKYCqzpWG/9eYllDD3KwAgH53Z0usCzp5pz23NlAGJCL
	SJYhSIXtAv5p/f5Si7ywShpkqW9FFEXcygaFWA5s+Nx81jx2ypHtO8Z40wq13uo73uPchpz/daT
	5NaUWeS4nKz3TUXN4RPUsIY5AP6Ti1eIndZJL0KDkOXexpqpVMzF0UOF1PBAZUbhRfXLAJ0IVt1
	o0Tgl2OILrNdDczLPM2Lh6iKRlTVjrN3uUcnnaeS/U/G0focAmuE2EReKwFvsbz1ecMQ67t9Sbr
	29fvymZQnMG+nLVBU+xRGqPWYz5I/LDPvYEpI5pEt0oXWd2x1AhKitgG3okf9ykusCbRs9j/X8W
	E5U+frvGBVFA1WD3n6FZfgCBoe4xrZEns5f5gbQQZ/QTqXDsb7UxdD/RsaNZy6ya3DCU2iPj
X-Received: by 2002:a05:6000:24c4:b0:485:8a46:7053 with SMTP id ffacd0b85a97d-4858a467176mr9452131f8f.37.1788591850939;
        Sat, 05 Sep 2026 00:04:10 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:10 -0700 (PDT)
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
Subject: [PATCH 9/9] docs: kernel-parameters: Drop the pata_legacy.qdi and pata_legacy.winbond entries
Date: Sat,  5 Sep 2026 09:03:47 +0200
Message-Id: <20260905070347.25902-10-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905070347.25902-1-kmehltretter@gmail.com>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_000418_560352_33F66755 
X-CRM114-Status: GOOD (  11.24  )
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

pata_legacy no longer has qdi or winbond module parameters. The QDI
support went away with commit 0dcd0a76370a ("libata: remove no longer
needed pata_qdi driver") and the Winbond VLB support with commit
3c4d783f6922 ("ata: pata_legacy: remove VLB support"). The entries also
refer to CONFIG_PATA_QDI_MODULE and CONFIG_PATA_WINBOND_VLB_MODULE,
which do not exist either.

Drop both entries.

Fixes: 0dcd0a76370a ("libata: remove no longer needed pata_qdi driver")
Fixes: 3c4d783f6922 ("ata: pata_legacy: remove VLB support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4864e37005be..33298da28b55 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4994,19 +4994,6 @@ Kernel parameters
 			the first port in the list above (0x1f0), and so on.
 			By default all supported ports are probed.
 
-	pata_legacy.qdi=	[HW,LIBATA]
-			Format: <int>
-			Set to non-zero to probe QDI controllers.  By default
-			set to 1 if CONFIG_PATA_QDI_MODULE, 0 otherwise.
-
-	pata_legacy.winbond=	[HW,LIBATA]
-			Format: <int>
-			Set to non-zero to probe Winbond controllers.  Use
-			the standard I/O port (0x130) if 1, otherwise the
-			value given is the I/O port to use (typically 0x1b0).
-			By default set to 1 if CONFIG_PATA_WINBOND_VLB_MODULE,
-			0 otherwise.
-
 	pata_platform.pio_mask=	[HW,LIBATA]
 			Format: <int>
 			Supported PIO mode mask.  Set individual bits to allow
-- 
2.53.0


