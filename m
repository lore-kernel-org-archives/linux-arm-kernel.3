Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BABCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 20:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KL7s4MPM/6KRRYwpVkRdhAUbHaRI876v8WnTKEx4jhw=; b=lzMLQOeTcivl6Xo3fhfBhnqg2e
	cghLqSKZLXrFcbgx762085NXTJ4Ro3fSkYmCdaSpiw6eTMUVL7EgG5A2H/G03M2oN0CbAe4r+RG4e
	09EJulgctZa2Q8lY9K1aakeW8lx+V/LQ/Gv9CgIG70Ifs/MCPNNXNrxpi0NIRt/D4spfzI7luepl0
	Tw85tSebPsyw6CIeqbeT/hHOyVCa6w+z5gHISGy93oAizEM0Nh5no7HtTf1J5hbqdSJPgBCfF5RJ2
	CP3k+TVNSSLKVrI1/D3SaXChjAFpiBMLSMY8oaIuxtvPwLBdZ/s3sKDDbcGPbzhvfP+CgVjdvwDyj
	A32mWr6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPe1-00000008KgU-1q0Y;
	Wed, 10 Jun 2026 20:35:25 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPdx-00000008Kc9-3crc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 20:35:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so45990935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 13:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781123720; x=1781728520; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KL7s4MPM/6KRRYwpVkRdhAUbHaRI876v8WnTKEx4jhw=;
        b=PXaUKMgH9mOHqmMIVY4lZtCy63xU5Arc0gMBdpJJbJf7SLdE8cJZcQt8LLFj+l3ijp
         D/Sc21ILgUTwy1JtZnKCEATHdL2iS2DYeFCZpcL+NmA4TFxQrNcGxYV9nzuV0o09ZPPX
         mUMy/7/PyL6HGFr2TOwX9L8XSKUPvb/8t8bnlukH02WXOTMAjBzfeXb1JQj/jwcbJtz2
         afen4bbvPQJjMhfOV4UtFAOojAQFwk3XvPRC5jE1hjVgEy6XeSGWZePX++kQDRuc80Sx
         c7QWD/D2mnAXvcAfZ/cGXU2EedGrw/gJ1OIIOO/JH16lqOi5QxSIcSYRT6grZf/LknaL
         /m4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781123720; x=1781728520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KL7s4MPM/6KRRYwpVkRdhAUbHaRI876v8WnTKEx4jhw=;
        b=T5NXt/a3uDl2WHrAhZkk6sSHVTWWsnJXYhwJC/DpHAiHQJg0fvelAZnO9cuaNx1wz6
         Ip9n9+PiEZrpe9mVvy9dVgu2mjLPyqiq9ybRpn05areaI0EkS81qXisOj4ipklyvIUXL
         eBMwqZNWRatJLBTFwTgajJvDZfOKovrUH8bgUQ5XGJhTAivCLURTVfOQ83PTNkI0T7Nj
         gb1QIRGsINwZJjI1ik4qnkflxnmmeWwT9EDN6Gckl0dhDvivaf05PgEcIHUXYrCIeYhh
         JAsImIT9dQDiCh5SxEU396yBhleXgKy3YnHjpFv8xTZALi0fpQg1/1jJoHBPP/RtNsXX
         Uehw==
X-Forwarded-Encrypted: i=1; AFNElJ/ndcuP0rTG1ovzrv+dXt4ppx2ASlh2F5Rv8oJyYiKTd3KCTsa0dSrTgJgPh3ivokDM8fw51QXCJAQxBj9bJoCr@lists.infradead.org
X-Gm-Message-State: AOJu0Yz06/2rZesdRMANYPC4eVe9GO9p4lAD9D1Esvh2MISaKnQgN9Si
	g1BT6W942z/mhcnP77rICOtvp7tHCL56UXLsloAzv5hVWjmkuNA5FOgdXVVGun1SPgyquxgdXZZ
	HHyPE
X-Gm-Gg: Acq92OEVD3g4Dvpr6x8wKXfSE03cs4M+SjjcZTsoi7xoHj62VEsqeGm29GZ+hu5qBn4
	Jg3kNkvJJqFIlqvgeMJd0wU74X7Ld9PAoCIxtMQdRYgDvbpZn1JJ2UpVNR+D4Xv0iJ+X8k05ds7
	pjkhD2g89wBH7L4LTYK6hYQxricNg3NprM3IU5BHo3IL0ysEZWM497HnjExY8mKemfqbGe/Dirn
	1cUBT9Nsoo20Dw2I2FgquBmT11hR5Z4bBr77cQ74xsRhq+F18u7OmDb6M/tu/rUkLzFxsBtQJu+
	jTCol36VL4krrVtXXwCm8NuzPckpbwomsoXdY/izghI7t3MWyQBjmt0KItehHuSDlqZ+/0qy0F0
	x8TmLGo969/ZN5Bgo5NNS3MGgNM3vJCdw6nOGZkdENQa482tDXB5O6ajap9ICBGsUy1im9gWHhX
	t1HL4UZRCjoQ6p/p80BM7exkl/RFIVXk9XgP3qtqpBOw==
X-Received: by 2002:a05:600c:1d99:b0:490:b8c0:d470 with SMTP id 5b1f17b1804b1-490e2e58474mr5692325e9.19.1781123720314;
        Wed, 10 Jun 2026 13:35:20 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 13:35:19 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:13 +0200
Subject: [PATCH v5 08/10] m68k: stmark2: enable DACs outputs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-wip-stmark2-dac-v5-8-b76b83366d5c@baylibre.com>
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
X-CRM114-CacheID: sfid-20260610_133521_944615_01CDEB70 
X-CRM114-Status: GOOD (  10.94  )
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

Enabled DAC0 and DAC1 outpus disabling shared ADC inputs on ADC3 and ADC7.

Reviewed-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- using mcf_read16/mcf_write16
- remove unuseful comment
---
 arch/m68k/coldfire/stmark2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index a6f9eb3a75d8..25452079056b 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -113,6 +113,8 @@ static struct platform_device *stmark2_devices[] __initdata = {
  */
 static int __init init_stmark2(void)
 {
+	u16 val;
+
 	/* DSPI0, all pins as DSPI, and using CS1 */
 	mcf_write8(0x80, MCFGPIO_PAR_DSPIOWL);
 	mcf_write8(0xfc, MCFGPIO_PAR_DSPIOWH);
@@ -125,6 +127,11 @@ static int __init init_stmark2(void)
 	/* CAN pads */
 	mcf_write8(0x50, MCFGPIO_PAR_CANI2C);
 
+	val = mcf_read16(MCF_CCM_MISCCR2);
+	val &= ~(MCF_CCM_MISCCR2_ADC3_EN | MCF_CCM_MISCCR2_ADC7_EN);
+	val |= MCF_CCM_MISCCR2_DAC0_SEL | MCF_CCM_MISCCR2_DAC1_SEL;
+	mcf_write16(val, MCF_CCM_MISCCR2);
+
 	platform_add_devices(stmark2_devices, ARRAY_SIZE(stmark2_devices));
 
 	spi_register_board_info(stmark2_board_info,

-- 
2.54.0


