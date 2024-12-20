Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC85AE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 16:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=av9B4J24iSkn+3gVD9YhMsMCbMdNI6QkecYKJAVC1Bg=; b=TeW3qeUL0277KVC34zQNrJTjcT
	UPL4AmEOsKxfbwdZSu1UB18LymEwfjZe+qUY/ise/ElVxOD929YSnEZZ3Ex1rKoPUn2Wkwyxl01IO
	uoQ/yV79f1X+umCrAtIlhGHVLPmWcYIKDUv79eF5XBEFM28OEg1j2KkZVfIv3sQI6ENxv0SSwt5if
	9K2fARqcBEGNl3lWT0MW5sgEu97EFJQsrzKX2gkOx9wNsuBZ3/zImgXh12HDUTeB12lkYPWBUIjoM
	E5F74r3ykVmf/hNUoYLmY2Am3UWgzHSIM+xI+0Uqb1N3gdnQoCw9+EaIWLOb4YSOAAJ4k7z5PeNaK
	bSj5hrRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOft6-00000005TEt-0VoR;
	Fri, 20 Dec 2024 16:30:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfl3-00000005RsD-1LtX
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Dec 2024 16:21:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=av9B4J24iSkn+3gVD9YhMsMCbMdNI6QkecYKJAVC1Bg=; b=N9FWmxj6A30vS730bACGkGaby0
	k6hPvTbEFinIBsrkCtkc7OBwFDIPocGHJM4jnkOrQwcC9JU4sy4PlNhjeN/oqcwafffODE65I21/0
	xKXj78HP/zMj0UUTUz1duZj/u2Mi1vanyedGVPBkTiXqS6TjQ8jbmYXMuaqiGGaOQma0nbEXCLQ01
	o9jcbtFftwtOJH33c4NOSmgZJKZeTfnpGQeV0k53a9fRnYax/Ej3orjRUHuXyEs38E1OchlPrOK/N
	U16/pfjaVDos1Ny/625l6WPMUx4had4uAeqQ2cGAIAr8KX6wsJ3/+mDSk1AWYURVFafDEAOvc5QJs
	YLInZfHg==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfl0-00000005iX2-1UVL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:21:44 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso16553935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 08:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734711701; x=1735316501; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=av9B4J24iSkn+3gVD9YhMsMCbMdNI6QkecYKJAVC1Bg=;
        b=bo+mZtxSU9AnWapi6wjiH7lHrV5JfVvVtB2JXnR759p9RwPeDhV5sNAw2MtHSQtgQ4
         VjPnF+ZaACERhFgZmrflg9QwKNEVwHWjUwmfcsTsogYyLrcIqZM4l+qryUKGp3X2HbHu
         4QaxfkDttvV+/O/vfwvivfGhuaBxJPnO+4Bk3k3Xkb+4Xi8Tx3PKNl+DSmzBxDvvDZbJ
         2VtM4CwN9A44zsiwrQHXM63Xd2dCZLyqi1WxB2sFE/q0bVKafSxekhDpx9gKYwRGQ9Y+
         M+bmE3yi1ICvB6rqhuU+XruZ3aFJhEu33Cg9xUWoFCN4WV4XJ+KSI7lm5/66rNLubh7u
         /kCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734711701; x=1735316501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=av9B4J24iSkn+3gVD9YhMsMCbMdNI6QkecYKJAVC1Bg=;
        b=jPqwcqyPqHIMALxXb0F3hDOrD6FfFhULDZdZZkXYIeG9/IiDTu69AtLfJIUPtL/G4h
         ZvQxfi1y94PLy6GBSdaK3Qk346VJM4U6JM2yxnB/fYynM+xh2prhKQiWCGFvH2QF8Z9p
         4bbUgh/EdsegmoEQyYSYDEa6HlhGSuvBhyo13W5a5DmV0osz5Eu4zwnxKB3iJTaTxE9v
         BHuPJAcI1FC1lL0gET0snDqGmBc6StibXaLqcAvGAKhqrw9V+EifaFO3I8vBkKflc++Y
         E62yidz3TcLjPoDiu/uvUQP94lzagKB4JA8s9waBf/tJKSewXydnQYwmzeJHqySfI1PQ
         DWZA==
X-Forwarded-Encrypted: i=1; AJvYcCWbm+avaAwWZjaD34PEz/DyX3TDL6qeaHNnlW6LCXTaGyzCE/Uy4n0TtUaWps45ACwytF5C15GteAjxolm2Ni8t@lists.infradead.org
X-Gm-Message-State: AOJu0YwfNvHlK9rOj/uDqyoB8TqhRRlgJlVQ1dzhWmp1DgD2u1YrQAPm
	D9Yxp3YrdxcVWMysXTxXTnMMRFGKZEnZRUrtvJkCOP3qYVePQOiyHCS4b2BcsCE=
X-Gm-Gg: ASbGnctnDinJkJWS/IueEB8wwnG6DhRVm4Pygzr7ueWt27hv/OzV3pWQo66BTE0EV1H
	lbWRWCf0DYbKS0R7MXrZ9pZN4uVs5PBYD8Mi1a4aHaVvBM8LJ8yXmDrK1qHy9RR+NItRinE73T6
	pZEclIYywFxX5NHDnsUeXTSLe2pteS/zmA/0OZ0sFNNI4fc5xsH56AHgrDS2jnp/9Xz0rzX8fIc
	RMzrNYQLMyJ/TQlGJSZCKde+8SrMf3S0eqOTg5T3oXbUDAg
X-Google-Smtp-Source: AGHT+IHg6VTmT54UYl9JM2Jsfkok9cq3oZeEbcD5pJ5HR0oeS3QenygH1VZpwXBGmdab27CtHTitYQ==
X-Received: by 2002:a05:600c:35c1:b0:434:a94f:f8a9 with SMTP id 5b1f17b1804b1-43668b7873emr26854825e9.28.1734711700897;
        Fri, 20 Dec 2024 08:21:40 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm82824045e9.12.2024.12.20.08.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:21:40 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 16:21:18 +0000
Subject: [PATCH 7/7] arm: dts: bcm2711-rpi: Add HEVC decoder node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-media-rpi-hevc-dec-v1-7-0ebcc04ed42e@raspberrypi.com>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_162142_531968_C54A8A2C 
X-CRM114-Status: GOOD (  10.34  )
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

Add the configuration information for the HEVC decoder.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi | 5 +++++
 arch/arm/boot/dts/broadcom/bcm2711.dtsi     | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
index 6bf4241fe3b7..43fa2d82cedc 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
@@ -105,3 +105,8 @@ &vchiq {
 &xhci {
 	power-domains = <&power RPI_POWER_DOMAIN_USB>;
 };
+
+&hevc_dec {
+	clocks = <&firmware_clocks 11>;
+	clock-names = "hevc";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index e4e42af21ef3..0a1f05a26a6a 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -628,6 +628,15 @@ v3d: gpu@7ec00000 {
 			resets = <&pm BCM2835_RESET_V3D>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		hevc_dec: codec@7eb10000 {
+			compatible = "raspberrypi,hevc-dec";
+			reg = <0x0 0x7eb10000  0x1000>,  /* INTC */
+			      <0x0 0x7eb00000  0x10000>; /* HEVC */
+			reg-names = "intc",
+				    "hevc";
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 };
 

-- 
2.34.1


