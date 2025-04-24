Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058F6C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 10:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8Rb8W9J7Qw3lwXkyUyMZqbY7uDV4UBFzYR28V4ttS0w=; b=0LwiFbp2kNH91C+iYFEcqb92L2
	SNhErBnLmQISWvJDYfv4OZnx+54HRSvNruV10d31ZRUggQ1xqVdDGD70Aa0JX5ZsbxQfXHLkrRNmX
	gkeIVTnxJNqfdg2ulKKsAW9FvBkfL9D3JtXCBRkv1IBitUSW7cEuz145iW5xslmdXPNt3+717Q3uZ
	6BvQ1KoXQnnHGHWizH7NV1YZdoS/fLg0X7s1RBfjEM2uUSmVjm/NPsvSVPWX+sm3ouXwvlUJb7Z/D
	zoGGA0piabC8MVZoUwshwQzyEBqV0f2BIlvBWPsi6k15ARjTH0NOnJkuCMdZNxHkUf1PnoEM6aCtZ
	VvjEQRVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uBm-0000000Dl0k-29Fx;
	Thu, 24 Apr 2025 10:52:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sFH-0000000DOoI-3zR3
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:47:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=8Rb8W9J7Qw3lwXkyUyMZqbY7uDV4UBFzYR28V4ttS0w=; b=cYaAduIqihTxJqB6b8gJwrez8d
	d2dCPT7h8L5yaKqQBdWyC0DNZbo52EXjahMwONvIho17vsECwdgDQOxQfUZ+2Q8A/rwwgPB1tDhZ5
	t/HMtqPNnv+IHZO0Pwjici0yFIqIAb2x4K1CvFvTsuHRpWVY1Nr2gws+4JxTJL/WLP55kwX+B9DyZ
	Asl/jy/xkjSWylbCtsxn11pKc60ixrLRV2Wxko9g0dDo9zMBZMq+WWSIwK0hWBVoCPVaE8HZ6uqFX
	Wl3PVSDuWNhrqUO/D4mrlF3O0ber4EMvXPiYAPLL/YiegjmQFeRsZP44Kj8Bi6fN6ZyS3vKPa2fzo
	w3z5CHSA==;
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7sFF-0000000BdsE-0ywb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:47:46 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5ebf57360b6so120238a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 01:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484463; x=1746089263; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Rb8W9J7Qw3lwXkyUyMZqbY7uDV4UBFzYR28V4ttS0w=;
        b=gY7WdKZrxuqPXwrWxmUYtjDOZsrbwzMYrYreVp7t/pI616ztJQPRxqM5pYrzn5xpxQ
         Vpl1IjgZUgp92qWxvjSAh13LupkABvkKqrJs47uKhkBPxNr88iPJbvqjiAsECM2W0LO4
         u5b6rtlbKzFlKwCWTveo88Got/IRelBL//ZRMKzGd+P2deUIACkd4AzAArRY8hYz87+f
         8UJpCDZtgQAS66KSxdMAdH3SDQyrzdL9UHZpT7geM0k9zsg0GzqN+o6dEI8lt0a1ERxN
         PQwUL5h8XhIxJSNd2MESSCJTq9GZ7s6keTy33j6c8IaNk15hNJyf+l9gnxvVVCIXSQe6
         ZrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484463; x=1746089263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Rb8W9J7Qw3lwXkyUyMZqbY7uDV4UBFzYR28V4ttS0w=;
        b=JIC4OrQy0bHfxMvq+bmS7j7mLjK0DmgxbF4Hlo67Ufb5BnNn7hft4adb2q6xOfTBz/
         KkVmMCBP/Bn3/jWeYUNXaWUccVvKzQpwJ0md8vcqz6QxUTn45s1dA0njr6L+XRoNCUEP
         dC8o5IpFTaOuQGuaT9ty0P+hxOMQLHeeCl2ieMt1sfK7phT/h2QQ7T2a/Rn/lNoV5KKt
         Q/UGsco2zxTsm11xsGX1mNyTGVLoenAHvsCa9cobNNIKqgWQ97I2IU06KzRbhLvlimH6
         8c96VXDy7iyjKBAMQ/VwBhS5q6o3GvI/58YCAiyw+iJ7clOAbGpT8U82KIemfKzmm74V
         NZFg==
X-Forwarded-Encrypted: i=1; AJvYcCUmp4HMwAt1g+GLpeWY23sRweDOLjM2DvTzoSEGrKBty9hb4eZ5zMxx0GejA0jZk/kiie9U0yf2I7BvpbZ25URv@lists.infradead.org
X-Gm-Message-State: AOJu0YxdRjK4NgNzlXeA1+cCDQgwC35h3AYnah4OBVpfWHmEYCEIJYCx
	xDmf2KXc0L4/x1yQH0Ry392Kd3YIDzGouc/RybkCibkXDSL1+/0qTtIfmyBy11k=
X-Gm-Gg: ASbGnctNdueFb+lJJ8OT3I9XBcPc2ETMrszyhXyKdCpNdfJkbi4kvMhNUaGRkq+tS7v
	QzV9BGIJSPGqNot5E0B4Oep/FLUAQkT4nwVrdpPXBXMj5l/UUFIJ7YmM8Zg9TjqI8Jsn90fYwJc
	Lw2bd20W29T2hIngATxKZG1w20Ai9218RJ3rC+05Quk0HcxA4xoLnxDQrfWEJwl90PixGNnNHhj
	NiLLPns0Eb3QkpOd8HYcih3Lb1p6zlQKgHUUVlIt6dpbXzDzkA/ekvpc7w9rx7eNk7ifJN9AbII
	Sn/wBuNbiZT6gH4iUKe/tkTwclNPpOlBcNXks/rVt5qptQsYLg==
X-Google-Smtp-Source: AGHT+IFODpwZkT/2DLzoJH0TEk8ECY5Db5Vvv11H7L13gvYc5UBCSm7T9un64cPNNQgwKu2fF3+X9w==
X-Received: by 2002:a17:906:7316:b0:ac0:b71e:44e1 with SMTP id a640c23a62f3a-ace57279966mr58846666b.6.1745484462947;
        Thu, 24 Apr 2025 01:47:42 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59830ff3sm71378866b.7.2025.04.24.01.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:47:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: allwinner: Align wifi node name with bindings
Date: Thu, 24 Apr 2025 10:47:36 +0200
Message-ID: <20250424084737.105215-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_094745_395631_3037FF79 
X-CRM114-Status: GOOD (  11.23  )
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

Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
wireless-controller.yaml schema"), bindings expect 'wifi' as node name:

  sun50i-h6-orangepi-3.dtb: sdio-wifi@1: $nodename:0: 'sdio-wifi@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts     | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
index ab87c3447cd7..7b2de2ac8b2d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -144,7 +144,7 @@ &mmc1 {
 	non-removable;
 	status = "okay";
 
-	brcm: sdio-wifi@1 {
+	brcm: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		interrupt-parent = <&r_pio>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dts
index a3f65a45bd26..0911c537cc6b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dts
@@ -28,7 +28,7 @@ &mmc1 {
 	non-removable;
 	status = "okay";
 
-	brcm: sdio-wifi@1 {
+	brcm: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		interrupt-parent = <&r_pio>;
-- 
2.45.2


