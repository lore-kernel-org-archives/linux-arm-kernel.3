Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF04CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/JC/lCvJB29DmlH+qRhnlQ7JKVcjCcbMoFC+b+6/88=; b=W13hYzDIEUHPq5LYg8o6hLaATq
	JJxgMOPID1E9X9/XwC5QkmctTn53V2bvnLthG4v3tW3xB5z4Yhy2+xNGTcEJgXgFTaQo0yuWlyoH9
	9TRtTktUUnz7RTKHHltLxqAQeCN+vrj4q3A76jse6vOv3pcqfdqk5ox7IJsvveEv3iN5ZG2A3kO61
	94QaaFmGVU9OgB6VOwMS5OvlE6tili06ocX4xQA03o9uDBlFMtbvsdml+KURZuOFEsH28EAj2iZOF
	/eELRfzcDOj6bP3yhssirUb1agjgvsJ8sIQrS1/OYGuIuXWoNxecJVHnzBFWf8tGIQ8yq2r/aydxT
	ud385ERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5fz-00000001rmZ-3QYg;
	Wed, 13 May 2026 09:14:47 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5fw-00000001rkt-411f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:14:46 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-44a044cb827so5170913f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 02:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663683; x=1779268483; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/JC/lCvJB29DmlH+qRhnlQ7JKVcjCcbMoFC+b+6/88=;
        b=TyN9fKN1C1BKkffJEBH5/TYl+kBj8/DjZDWbhYeV+ABDolKFAtVMBeYBEuJNl7nsx5
         NIYIyob6tZzO/VNLez+36s1OqfqVbscizp2fD21nfe/nLpcpQuGctq76wRrcs7uOpUv9
         nG4Yhi0fvZoPMpdGSSE4tzY+nnxvbN7c0UnMwXroS3lYx8MePVlDfbLb8xvS0sJrd7sJ
         54eUn1Aojptzh4Q6NvXpb1lChvuFSmLF6kVE3zQw9mlEoIrFVzudwZIHe6Uzx2QYtgqd
         KYa4x+RHyyb4UCoN4q5EeXmFJLFCt5Tvj1tqvOLa3488t+K+1hA7L/ouwGoQPVk3axri
         PBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663683; x=1779268483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h/JC/lCvJB29DmlH+qRhnlQ7JKVcjCcbMoFC+b+6/88=;
        b=pho2b4UCAzCDtznjLSuRxp+mcNiM08O4m+G1ulyPD1UplYgi6+46w3Gn5U5ouVRRsh
         qiZ1kFa2yVznjqJfqewDWxZICJkZuspGPxDfhDrB8Jq6lCrBbAdBaAbeO8tGsM0934Bn
         5CAmz8FzeS4EZgi1rEZpM9VECsXYpLi4GsSQTIkHUawUKljWusszfu1Xqy8XJvnmEhcZ
         VPjvtZ6emmdxaQW7NfizaiNjPI6WQb7zSCiGC8TBr4JEPphtNhhvoxvpKNpG3DnMLPXR
         xV/P1KuMiCVWlWm3IkBOGZnNV9VCTigyQS1OmtVRIKjVDoccxv44e1+G3MITrUrMx4J+
         g2vw==
X-Forwarded-Encrypted: i=1; AFNElJ95Xjt3USFrYfTZG3dg1OZ5INTiJMg/dgVplibhwPoMmORUeHwNKTbi8NjcqgBRP2Kcj0HitLwt21nAGdqmzR8A@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ1IrXAdU+lh4PZKsHaeokX6nP+7M/v+XiFZ+IPrd53bgsUex7
	0CY65dCIpXeWHeDrGXUxFnhhYqX5ZKIpBURXM7edCws+OPH2NjFO0u9ataJ8mWxy7ZY=
X-Gm-Gg: Acq92OEwOCZRquFvqp0Hkkvic5q8yMXGZZ5LYaTl5UTIbhm/ksCsX3R4rwPEMPm5szF
	toYPBTWsNUXDa3aLmVxz2tq+uSMzy0V05vNpshhi2sIQ1fzqZrfrBYAdmEi1DtDS+6fKJu2EexD
	4cmDvjmuf8+8jWrKoP+8SFtSBp5V93ZsBnTBJghYqVCSyeijIVqCJcX5STicB1Dm0GFZp5/ttWX
	d2C8C6iF3TU25Ps1afghPoXbK6UNxsH58O9d5JcXxLXGr0EPLwBNHEO1ylyVnJ3ihEeAiaPZAuw
	ZAIn3UstHvotXZYl2V83DUX2hqOSlqnmrDZGCG1wsxQ+EDRG452934/HPmhfcYdw5jahPkgVScZ
	SdyZm0iZM4fY7oJRFcx4w0W3FQ0EFn95n/9X7XnggyhmdvrJR+fN3QIbdlB6k/KRNJaqyLE0g3i
	KIhy/uy3a6iPe83dy4GLIM/GKU/dTQ2fg=
X-Received: by 2002:a05:6000:400f:b0:45a:c0e1:37b with SMTP id ffacd0b85a97d-45c7b470819mr3099954f8f.32.1778663682506;
        Wed, 13 May 2026 02:14:42 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:14:41 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:26 +0200
Subject: [PATCH v2 02/11] m68k: mcf5441x: add clock for DAC channel 1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wip-stmark2-dac-v2-2-fcdae50cf51a@baylibre.com>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
In-Reply-To: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
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
X-CRM114-CacheID: sfid-20260513_021445_016506_D261D94D 
X-CRM114-Status: GOOD (  10.84  )
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

Add missing clock for mcf5441x DAC channel 1.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/coldfire/m5441x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 613b0275d9d8..5b5e09ecf487 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -44,6 +44,7 @@ DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
 DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
 DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
+DEFINE_CLK(0, "mcfdac.1", 39, MCF_CLK);
 DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
 DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
 DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
@@ -106,6 +107,7 @@ static struct clk_lookup m5411x_clk_lookup[] = {
 	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
 	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
 	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
+	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
 	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
 	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
 	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
@@ -176,6 +178,7 @@ static struct clk * const disable_clks[] __initconst = {
 	&__clk_0_35, /* pit.3 */
 	&__clk_0_37, /* adc */
 	&__clk_0_38, /* dac.0 */
+	&__clk_0_39, /* dac.1 */
 	&__clk_0_44, /* usb otg */
 	&__clk_0_45, /* usb host */
 	&__clk_0_47, /* ssi.0 */

-- 
2.54.0


