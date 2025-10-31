Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7380ACCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0M1HrUEsEWAYtX+bmlZLBJ9NI4B7ItCBmyvB4tSMhI=; b=gqumdPUlvShDzrIz2cKcEDQesK
	donhuegz7DLoOwHtcbSjUbHCoCMki0zQgkDGrEf3OKKaiTGDckUjyd3s2WAxN3HkRNAoV8Q+CcXhB
	Cls8aBSqrrOpEVOA1Et2esvf4Z2UtxJN9gji24qVR2I2S6kwLYFS71nz2V9j9iBgWMhvRYWYyqQQJ
	T/57wVbC4pMbJZcZxzqYqJPOnHtBZKjIM3JZH5VjavxTFNhDhNRN78t99tjFVwsUkNDiYEgsN8F3J
	+Y+V9Hhxs2H5K9qlr7ERtYnzLdiIcyVmIeRpdowzU+cjGl+GenLw/NaNRGAmO3RoocsmHQFhbtwtD
	t8eqISbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEob6-000000066qt-1ZgM;
	Fri, 31 Oct 2025 12:51:16 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEoaz-000000066nW-2otv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 12:51:10 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-421851bca51so1969435f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 05:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761915068; x=1762519868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0M1HrUEsEWAYtX+bmlZLBJ9NI4B7ItCBmyvB4tSMhI=;
        b=jRZSsvIETTKFeXq71vP8UjFwY8pdgKvpDdsrSH9xKtl3s8QieDofbgPqkjl/+jOIIq
         adhX6ozIwmteaiIIxzqIGxhdu2jcQ9+UrRqrL9n2Mn6yslKOraBzhL/wOA8MnC9slcrI
         zXKhKKus+lM9woKPo9C3OwDflbA9pTMIoa5EpYXI1Mmf03fsS+kKiaxUAP5G2zwe2sAb
         W73iykimzJ8CTmjyoKipnG4FKNa9sU1g6/3xVNNpBYvZC+IhgHRg2RAhlFMIZ3dqra6k
         X2iNUXjGvroUkEB7hxd0zbKDtAE6l+TeZgeD0/ilHob3/iidooCO+g2kW5X2zip1AvFe
         bCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915068; x=1762519868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0M1HrUEsEWAYtX+bmlZLBJ9NI4B7ItCBmyvB4tSMhI=;
        b=YhBHAZYwujKJTXahJ95RRTKcrJUmlSVAk+VjqcUieNr1atmHb0bPZV2t4qpcYmL1YO
         YRd38AneGO0Td4KMN6cVUa7fMZdlpJ2aEzDOkU9VrvorQ5Hr5Xt3lMf7Usw1Z9lhw5DL
         J4vzfiW0i4X/HQyuwGtdRDs7NSlhzB7uflSJDVEEpZ9C/y6GapFeAy92wLFHDtq1uzI8
         MrvhjKrUeJCXvJQHvNj3bDjkztmrQbMitvv//CEeBlkNltpgMzPK9y1ATHcbhsbsrw2f
         +TFUw4fjqmQOpWJAfZ0jsBHsfOAcajTw4pL1wNOPMC4QLmz1Q0+s4Zhy0arh1zgwiXX5
         sCqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLbvihsrTb4WNtYQoFdoUvpsCmvKW1Vqan8Ce33gWeGMufgzXSLYgkLDguTC6BnnKfSB8gsIy6RGcRdwg4xAdF@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2MXvPZpvC97Rz2aZ+0coFq0KiB9+xXindnn7qUO1T887WWGG0
	zn4YMcTnzIBpumCQXconphyPuJMi2YnoWZd935SLg5z/drWBbvyfD7gg
X-Gm-Gg: ASbGnctfk9M3xwG2tGrb1w0eniJkoSoSqH9u4pKnXdnrvWMJ0BgOOfMeGI5TlQ9mbep
	09+HpdUEDEG7L0FZwKpO4mX5NnUD/8d0RqHXcxBsydBPhNJ6KejtHpQSzxbot7cXeKOFWVlKEHH
	cFY20+HNnKb8DHjSD/cRLd+j220lcb36bJaaH0OrQhXA4A83TCqDdHu5XgtWXDNBOLN9CLWi8HI
	ccABuur0aZd52sxxL8Oge03LaCEnd9AGsvBIrUb4iOz1YNoPZaxajBmOtr1iUGJ8okNOwt0VDYE
	j+gWHRmRo0GG0f9U5WB6YNmQYB6ZLi+fP0gxkBOBhoiaeGcpGr2BQQBRrXL8i3wIBQQ9wvey2WP
	+sNjsuZmxwqopdD6m4u1syvsG7j9OgNSr/emusd2nlg5JO9X9ogLDylgV4tTFXg3buMZhX/Za5r
	6Aa+0uRhwyLKIm5pGgmCd/tm9RQSu4J2AXUwiWgdlCRfkpShb5b8ZygN5ShTB7wytadV5V6x9YM
	ugNiKt8CgglwBqs
X-Google-Smtp-Source: AGHT+IHSXX4DYRrtxww9sHrkDWOZg/LLH6sryU74L9AN/Ia96ozwZZVUVNQDnIRYpK3dD0oTSYgkpw==
X-Received: by 2002:a05:6000:2407:b0:429:8c31:84b7 with SMTP id ffacd0b85a97d-429bd6a0004mr3158228f8f.39.1761915067646;
        Fri, 31 Oct 2025 05:51:07 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13f1d4csm3144559f8f.39.2025.10.31.05.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:51:07 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>
Cc: Philippe Schenker <philippe.schenker@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] arm64: dts: colibri-imx8x: Add cma memory
Date: Fri, 31 Oct 2025 13:49:43 +0100
Message-ID: <20251031125003.275033-4-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20251031125003.275033-1-max.oss.09@gmail.com>
References: <20251031125003.275033-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_055109_729964_D2874CFB 
X-CRM114-Status: GOOD (  12.41  )
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

From: Philippe Schenker <philippe.schenker@toradex.com>

Add CMA in device tree and set its size to 416MiB for all
Colibri iMX8X.
The size is tuned to be enough to play full HD video using gst-play
and to fit in the SKU with the lowest amount of RAM (1GB).

Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index 32bca4c6f37e..d4bf30d91d69 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -86,6 +86,19 @@ reg_usbh_vbus: regulator-usbh-vbus {
 		regulator-name = "usbh_vbus";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			linux,cma-default;
+			reusable;
+			size = <0 0x1a000000>;
+		};
+	};
+
 	sound-card {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&dailink_master>;
-- 
2.42.0


