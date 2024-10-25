Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8966D0C5F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 10:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujk9DybyKkZDF/2MtHXApKNICNk9/HaCwbVOr5hVCKk=; b=F6gdZc6va35nRk1Dj7qG5YYzz0
	Zni2AqH9WDAq9LxOC8WljlG1400hc6HCOVfZIsBWYADPNhlgFgwlwgABZwH+oUwbGiKQ6z0Lr2UhU
	JYq2hZGyG2mC0TDdHDvpkhKOgAAeqzidaw7iDBx6VpWZDK9rL4hvelI076mTA8gTuMR4KEWPQEwY3
	Ia4L5BPUBWpMYqky54xNjOEcmNtjommkYgWuXmYsQy/XswHqMo+khCrWMGnIvObpgrmitAJM5CqUf
	2A1vujhvNq21qUtN9lNsqaYvey/l66X8oORkMomdKG1FpAL56CCfwmf966t340rsBuBVa73+QPSSc
	mmPwPRQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HBx-00000003IQk-053L;
	Fri, 25 Oct 2024 10:05:13 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4H6I-00000003H2L-3hIX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 09:59:24 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-37ec4e349f4so1344179f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 02:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729850361; x=1730455161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujk9DybyKkZDF/2MtHXApKNICNk9/HaCwbVOr5hVCKk=;
        b=TW8TlVbCz6vrrOwfi0ZaPQAoPhCNk7huIv1K14H/jLW4y7JDCAQGbXmJYj33r7JVQJ
         pWYzMMoxywnP7g908Yaj1E/58SJLxfe9z7rkcP50jbh1Klxy/nhzg3U8amSkVPmDpvTS
         1W0zBTRZa9nZunlWV7JfqgA0r7fDr/TpWBzw9vJWS0RD3esfC2K4Rk82mL/ADXIWQ5pM
         jIXMZquXQwJ6RCJk6S9kQlHcgy5jVLj1t0qa8QecRJnt/oBl4zjJAxkedDj3P5YC5l20
         FNFmyHyEn9vQ+wvfrc0C0xGT5hGtuIORr06lPZu7dkSdT+eUpI09W+OFBn5ThMDGaTrH
         9BZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729850361; x=1730455161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujk9DybyKkZDF/2MtHXApKNICNk9/HaCwbVOr5hVCKk=;
        b=vUSCIn0GbWwDXrUqYEfrYCLXWcXYzFjkcq7FwERU6oqnM4QK7aPEUEU+5CRYWVyOSR
         zkCuETtInJjisHD+gx8elKVwwDeldKHtLHyEBqffcsikhupXXF5+e0NLEnEcclGQv5no
         eHME5i4PqsA7qPFvjJ93eYrHBGXoLSMmvs9Pvy1X11OAVqzOqQuV9yK/6u+DnVNG7SQL
         UbNVgUd+eby8R98xpAxTQJSiaqRnPVHzrjbk8HjFxkhFlr2ldH+aJMNvD5pArYnu14W5
         yHOLGOjSWiNfY9Y3M5piXEwga1PhyJODIxjR8vNd4BGn1HoMqxUIYd9HSbB+JurrW6ny
         BcTg==
X-Forwarded-Encrypted: i=1; AJvYcCWMlRBAVACVImACwS1MFiOSD2oOPmc9ywHOI6s/mEyDBjUhQQ8sqs1bQr8MgIMrAgevpMr3lX7PWJxbX8HceOAN@lists.infradead.org
X-Gm-Message-State: AOJu0Yy13/lpJQJYhHFTp2yOlyBL4Vn7CH4A9ev/w+dH+wBxZRRwb4Tt
	NNJ0wchAx4PXcEJFEuDggE8vwD1S9RVtrk0Tye6k2JpqI+dYl9yRpjAI+oEU
X-Google-Smtp-Source: AGHT+IGQ/FkY+lqoyXqrOcHuZexookS5gw8fVWByzJEmmycGhV4kbog53gMdjkWU0W54WsbGNSPHXw==
X-Received: by 2002:adf:a442:0:b0:378:7f15:d51e with SMTP id ffacd0b85a97d-37efcf7f306mr5781853f8f.43.1729850360713;
        Fri, 25 Oct 2024 02:59:20 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:7bc0:826e:69e3:7e40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3c7b9sm1098214f8f.32.2024.10.25.02.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 02:59:20 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v1 2/2] arm64: dts: imx8mp-verdin: add single-master property to all i2c nodes
Date: Fri, 25 Oct 2024 11:58:03 +0200
Message-ID: <20241025095915.22313-3-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025095915.22313-1-eichest@gmail.com>
References: <20241025095915.22313-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_025922_944849_6BBD9BDC 
X-CRM114-Status: GOOD (  10.87  )
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

By default we expect all i2c nodes to be single-master, we do not have
any module or carrier board that uses multi-master mode on any i2c
controller. With this property set, we benefit from optimisations made
exclusively for single-masters.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index a19ad5ee7f792..323b45bac281e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -478,6 +478,7 @@ &i2c1 {
 	pinctrl-1 = <&pinctrl_i2c1_gpio>;
 	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
 	status = "okay";
 
 	pca9450: pmic@25 {
@@ -669,6 +670,7 @@ &i2c2 {
 	pinctrl-1 = <&pinctrl_i2c2_gpio>;
 	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
 
 	atmel_mxt_ts_mezzanine: touch-mezzanine@4a {
 		compatible = "atmel,maxtouch";
@@ -690,6 +692,7 @@ &i2c3 {
 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
 	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
 };
 
 /* Verdin I2C_1 */
@@ -700,6 +703,7 @@ &i2c4 {
 	pinctrl-1 = <&pinctrl_i2c4_gpio>;
 	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
 
 	gpio_expander_21: gpio-expander@21 {
 		compatible = "nxp,pcal6416";
@@ -788,6 +792,7 @@ &i2c5 {
 	pinctrl-1 = <&pinctrl_i2c5_gpio>;
 	scl-gpios = <&gpio3 26 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio3 27 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
 };
 
 /* Verdin PCIE_1 */
-- 
2.43.0


