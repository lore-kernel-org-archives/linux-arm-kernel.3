Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DEBCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vo148tLRdvHB4Hf8KQfkCKci/SYla3jkLQmLRXKSwIw=; b=MJsU5fBr7f6XWrQ4HFiiRk3nxT
	MHC1gouCnbz2QuE5sj3Y2XqLG907Mu8eYK/hmjs9LBCX5OyFsgDnmlq360yVKuXddjKFFp+zcFlS9
	mMDZr0ldI8Y/hka5RhS2/NS/F5DhiqAmy3NuU1igplincZCxhNMxzjw1hFvQt+lL/z/AUX6wOr6gH
	oRpE7P+fC0ANr2TqxUD5pUllvcjavchZ0WPCgVoh5M5JgWycpulx5C2ZkMdabqTK4yw6WO03sxIeS
	dtDRperyPpjw8hnGXI7atvUHQuzLEh1OruBOztjZYYx4ep61R7IWxv2Ur7dwiQ/J1/sxOGxGVrRZk
	Cayvk6OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXJe-0000000BxPy-2LuJ;
	Fri, 22 May 2026 21:21:58 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXJB-0000000BwyE-0lRR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 21:21:30 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso18624945e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 14:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484887; x=1780089687; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vo148tLRdvHB4Hf8KQfkCKci/SYla3jkLQmLRXKSwIw=;
        b=DXBeTeloIX/eITpb4x8jkTD5VHK+WfPzgbzrdUg9Ct1ySfiJQowruf2BBAKY/kdp8g
         kuX4mXyUxh21LkBDNuUfyEhzETW2inRM2/0iXouJDQ0SQ4YtN3Nxi8ZHGbDtMe0ll69Y
         inCLjBZT1qkiJUveCQ+iqiRBwbf3JOccLfIducCYfEe25i7IpsFxaBqWDzkSMmx1K3x8
         Nu7dGBkMUYIhLP5fOMBzTDPcKFQiCkt4cQS2PUj3H63ICVB3+Brfq0bp0q+3nsQpemIo
         ashjNvyaIEmZgmyMS65y3uaawXO9VzqWBbOCFinYEAhfwVox7m47ijSplDfCXVZVZKHV
         a7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484887; x=1780089687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vo148tLRdvHB4Hf8KQfkCKci/SYla3jkLQmLRXKSwIw=;
        b=N7Pb6gj7899iDT/yp5hthmj62znk4t+jbN7cuXSb3oyU4B/SkQaZ6993QOFh3407KY
         MPXVbLtuCXj8tYhJstlpQ7YBZERUF99phWYqSP+mZGdBAQfS3WNBkcA4KfiYElI2Jwxt
         r95rvzAW/ZzSvjcLHPojQS7EfPf7HjSkweXFUqpRnj7Wg93bvYio6XgwwgVbViV4c738
         QvGWuuIqRkyY0LFopV9LtrIKBU8jt65wyj8B9LfvLiaJtxYq3yAltJEJUEnbw4Y9Rqj3
         xs5xa/QMhjrc3IZO9+i2BFcVfcykvbuQuglFcuHiXX5NZteNyAS7v3R9XEfxQUhcrV3u
         uEnA==
X-Forwarded-Encrypted: i=1; AFNElJ/vVHokfYfjrBPcf+uYest35sN4uzQq2WLEoiTmVBB7JMN32eO3TXW33fkYoj99gyJ86cBS9iNLaS+blmT9GN/C@lists.infradead.org
X-Gm-Message-State: AOJu0YwcjBuqNo8zX67Fz3tmZUryU9HJdyZI8LW6rL2w+1WtK65918px
	TlI41NQLCjEqdZv9M3Feh3gqnhM/W+g0SBk7ldtNNE/9BCyYVBJCq8DNSLTPkFb2BNE=
X-Gm-Gg: Acq92OGk2OQDVZ9FcukUtBhlFeRogiqZunGTqG8qNnc/w5Sw6p66CPWnlS7I1JBVsGG
	LG6m3MYbPcW7oMhFMw3kJXm6bPhyZIl98wPtJbVhcKskQ0fJZVmiOXsUX89BILjiwYlC66Q6SxL
	wdvdyzJVgzrTPRUE+dwQYd5KNuBbtjI/NxkOQIDF1BXc2aS1dGiYpUixmjnwMqepaNH9YLLRqzE
	HRzLNxMLvLQ5f24IF1X9nELoU6OQS0xRE+lFQgq+wnymAvwIRoe+bVTq/1JSuWEwhQcxUOSVK0A
	DylL2bgGGNtDHW8n3S0nOgPvdgifkco/vzSxfl9+jaIdK3LO2esY/2jtxQuBpRDeCANiFeeX8kt
	D/TNtYsibYv6oL7wckbNLjKquwPq+NfOylIz0r93uuSIn2K1CVkUhPeogO5RcSEhUDu2aI3cKRt
	9+SbpT9Zlf9+2Z5xNIeWaxQcZK9nuLWyzDhsue6Bm8GQ==
X-Received: by 2002:a05:600c:3e88:b0:490:4ee0:82ff with SMTP id 5b1f17b1804b1-4904ee086a2mr18391895e9.27.1779484887170;
        Fri, 22 May 2026 14:21:27 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:26 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:38 +0200
Subject: [PATCH v3 10/11] m68k: stmark2: enable DACs outputs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-wip-stmark2-dac-v3-10-16be0ad35a67@baylibre.com>
References: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
In-Reply-To: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
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
X-CRM114-CacheID: sfid-20260522_142129_286376_0EED2BE2 
X-CRM114-Status: GOOD (  10.97  )
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
index d3be4b2953fd..8aa9286e85d2 100644
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


