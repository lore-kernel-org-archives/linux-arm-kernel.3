Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE6FCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 20:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwc20oinFS38+HtcTxr0JzZGF6h7M1rDzYuEvdtO6Lo=; b=Nzf6zcq1NgBRfZjt6XwPsXcTjs
	+xgIRKMIyhg2Q2cvJS9g/OXWHhvp3WOZ091mr261I1+ebt5lYPE0DGsY3b2ADrbUOBd6DeZbFH/Kc
	hWpqTNeRn84wXz1hkL1sco+bzd5qYSE4y1U3piJ3tcFWkteU6CUyT7W4nKphdNtC2R3AbhmDi6Fnj
	q+KgiRErF9h510JW3IX+EGbJv8+Ejdpc2txO+901oODjxT1VCP2jm9aqCjHgloeC52ijfhctZlK/b
	V/9ssgLcANA0J0D3lbva5wq/KLF+tQsoS6p7w+P63LNb5H5LfSD3ObeisNTYlxkxpXK56d7PFcm8W
	coXtQ3Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPe1-00000008Kg4-0c4q;
	Wed, 10 Jun 2026 20:35:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPdw-00000008KbP-2lXk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 20:35:21 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso82683105e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 13:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781123719; x=1781728519; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pwc20oinFS38+HtcTxr0JzZGF6h7M1rDzYuEvdtO6Lo=;
        b=XySY3/HZMxFqlYeLZkaU70/XYeBPb/kvV+x+097yOXlxlZ+9IUIFLYC+91p3m1/ZKH
         8tRWiU9Og4fHzDrf28KDhWaCeZ/cwU1IWYTikdDV4FWJ9NxJiVt4ScdmciqA5KUlJWpl
         SmYUuL8NceMHrJ65RVja4AeNtquIqeTpIJDFLcjN8fWIh13jSP2NJW8MWqDN86aSIoLU
         IDMsp7VVuQuyV3Mu0qYo/XRgFH+1bt0PqP7+SyXqV4T61/CCyUTJFc/6SPZxytDngEjq
         OsiSl7/w5hd3UP431Uig1Au6S+fgD/CJxGEPMZPMsmXnB2pR4wt3HiIwyFw6FVC8Zj9K
         EWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781123719; x=1781728519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pwc20oinFS38+HtcTxr0JzZGF6h7M1rDzYuEvdtO6Lo=;
        b=moQ7xtvWHmEAASJm+D6nKYM7c+pMfwjLtvoe5C/j2KI3e2RvTGcPNH1tabbNwjAao1
         FrNRBl/0d6vnaq00I112EAHvoe53LISlHEZQOifydQpOObvGo2EaDcSe+UF6Tu2JUKZL
         483ysmYT8+LipBzgpzOhYh/rpWIGlDFtqCB9Xz+OWb3+SUv6AmQ4JEhQ4IgWnkxdroYK
         JhRjXUhpHqbQRT1yJ9Jxf3rLx9fUxObrUgUJhCUtKEU/1hZPhGYiVG0a6ZTnsLShviAh
         7wca8Wbdb2pkE3XMs6ycrlwIhd7vLcLL0Myo3CysnE+xkMfNPIIOxNJUGVWy8lWISZ/c
         B61Q==
X-Forwarded-Encrypted: i=1; AFNElJ/VJRBNPDbB5XdB/ZIVJLvaXnR2LsMJdu63tcGbddonDaFO3yxLNzH48I8t7HbZ3k9dZSHhWcE3zwPYqfonYCEp@lists.infradead.org
X-Gm-Message-State: AOJu0YxXSObdmzsjSvlbByi1l4+KC2/4L0z5+uLsE2ZIPviRdjEEmy7/
	lmS++9jegO+tP0Ue/E8gG0slxsTvQgE1nfIaBl96MIkE22DhEfRVtdRgVgYlJgpB3Xs=
X-Gm-Gg: Acq92OHSH+UZSSFWenlye/feXMGXv1/6WhnJ7V0AeR3TS3YKVKLdDnbcfhIVuJ2xCbr
	A9evrBiqEkL9WOnRmcxLrjguffE3d/dmHYk/ERqrshu750VR8cKwCay+vahQ50P6KsGMHKhP+On
	dQTzE4Xvs2OqOUmCmSCuAstGe83oGbzLx0YPtmFhycJPhm42fhxSOnnHg73IXWYqa5c1cg+oYe/
	E4tra35xuMgDWc3CHu8dwpAS2oIQyuM5bJHVirmsoE9euRR4gWVZ2abHHEE2vLjk91o6anYljCS
	yVO1VEgOe/2UuUzBdNTDRNAzxg8tuGKV1FRv8eaKuF7rMu5+5jxou9zu6EVISX3xbSlHVOBz/2+
	WPDr9c7IpfP3S6rsLeAE1Q14/pat3e64RwlBMWmpfcIFNInSryHpQRnPDXrttNoeOGedY6p369G
	0L52t8wpTPnue/WbiupYVz6tCm/zRIGmEi9LtMOtHDqg==
X-Received: by 2002:a05:600c:6792:b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-490c25ee920mr437886825e9.24.1781123718858;
        Wed, 10 Jun 2026 13:35:18 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 13:35:18 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:12 +0200
Subject: [PATCH v5 07/10] m68k: stmark2: add mcf5441x DAC platform devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-wip-stmark2-dac-v5-7-b76b83366d5c@baylibre.com>
References: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
In-Reply-To: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_133520_724118_3EA1CF62 
X-CRM114-Status: GOOD (  13.02  )
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

From: Angelo Dureghello <adureghello@baylibre.com>

Add mcf5441x DAC platform devices.

Reviewed-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- fix copy-paste error on naming
- use DEFINE_RES()
Changes in v3:
- simplified DACs as single resource entries in place of an array
Changes in v5:
- move include <linux/ioport.h> in previous patch
- use predefined "mcfdac" clock/device names
---
 arch/m68k/coldfire/stmark2.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index 7eed6097f501..a6f9eb3a75d8 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -84,8 +84,28 @@ static struct platform_device dspi_spi0_device = {
 	},
 };
 
+static struct resource dac0_resource = DEFINE_RES_MEM(MCFDAC_BASE0, 0x100);
+
+static struct platform_device dac0_device = {
+	.name = "mcfdac",
+	.id = 0,
+	.num_resources = 1,
+	.resource = &dac0_resource,
+};
+
+static struct resource dac1_resource = DEFINE_RES_MEM(MCFDAC_BASE1, 0x100);
+
+static struct platform_device dac1_device = {
+	.name = "mcfdac",
+	.id = 1,
+	.num_resources = 1,
+	.resource = &dac1_resource,
+};
+
 static struct platform_device *stmark2_devices[] __initdata = {
 	&dspi_spi0_device,
+	&dac0_device,
+	&dac1_device,
 };
 
 /*

-- 
2.54.0


