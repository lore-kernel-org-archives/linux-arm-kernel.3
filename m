Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E220BC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulPEDLH/C//NrEG8Ra6a2W7BH2SJyZZBWy1vtB32mys=; b=V5bPH4r5TBz/CgsMKVUDNEkz54
	jCnVO0jZPNCZ6AXWj8RONkW26cQpfZ0KshTQD8GVsZW2wpv3/15JQl2zNt/TM+MIQ8AbGYp2gFXlg
	5drrOsyIqw688ECsVUxjFgn/KhrvT+guVEZZqQT59j9WRxiuArsLI4rDm8IWmoJcb2cNNGpB6sBSI
	dbTUek+Cb+qWrSWUvuSFgm+rqO7Kyhliv9qvu7uHbVx4AyPlI8TcrfHSzYDRB/2/VZHaeTxW1q8s7
	eq7ffPXva5obvke/Wn0Y/glFcd5+V0F+eq5b2XILz5qWEZhiIUqNZLwC7z2gKVuQDqtFVD7jPxsi3
	9vAWoo/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4Aw-00000008YOa-2wDn;
	Tue, 21 Jul 2026 06:41:58 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4AZ-00000008Y1j-3Tzx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:41:37 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-494049206c6so4264745e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 23:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784616094; x=1785220894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ulPEDLH/C//NrEG8Ra6a2W7BH2SJyZZBWy1vtB32mys=;
        b=j+TuBicjnvPlLc0Fv93hDY11aR7Vm9YjpVk4MZoYdd6iyqpJrOZAURy7yKphGgh1e7
         BbYskZ8LMxR71h6fhq7ICOEhZYlE1dI7pfCCeQfZvnC0Qcp8fZrKn5nIwy+rdc2q60Rk
         q6ZQcS9eDB1Jlq3wzHuMUvUhvekIJZYK6kARZ+1pmw79ENip48TAleG/kCsUEgKAytPb
         25oSAKtept+xwgynkyCwrQCnZHi63pbui1ZEkIJzdD3YK2DS+9t0UdVMP5fVfW7XiWu5
         sgjiBup8VskWAPo5K1TCc8aG0kmvST7kZ9ZJS503rl3sQ3tp9iPXzvIiWmfeuUdvR977
         waCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616094; x=1785220894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ulPEDLH/C//NrEG8Ra6a2W7BH2SJyZZBWy1vtB32mys=;
        b=hhVwGLIMDQFat/dgXUn/Epz9/ea3nOhUBo0KCr0h4SH3DvNhUly253tYKYAQlWcNGx
         Pl15+Bn0IH1USJF/goYiGty4Hge9hMrsayJi/CBey+m7VrzRHJmob+16UZaawOsSwITM
         c+UIflUhIOu7X26+BwEtGA65WNkZ6ivW3GVsDHcdxWJ7kPMmLrU9m3//5DcUPoyUTQta
         PmrOU4H/g/Wgu2bD1MsWD6feI8lK9LBiFnJOzqV8tXcQtH8XVmKrB+175iFPoN8guHIt
         bI1lm9ehoFuyv8ROm5mNXtzd5ltEaEFCEp78JLu5sHw+1QuZRY8Mekc0CeVHrjMZRfou
         bAEQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRMiWg88/yAGMwTguN+lknRjrbtgRo1/R+1/ytz/WOLirvacIPUHQjmZZzpVXlN7eLfVmLnUAreIC1KinyLrYk@lists.infradead.org
X-Gm-Message-State: AOJu0YzPq6lvISu9oCMIDLF5kIKz3sXPZOUbYjsYCtAySa10jKvVADJ6
	AKX7+y6AHzDCImLSDi6jAp1qKKS8vxNnbVXgamuvNCYPCNqb8Hvr6Kx3
X-Gm-Gg: AfdE7cka2D9dK1hN3lJ/+3v1fXVc13H2ap/8qgX1NHBa0PSfuRfnXxaG3dPaZULCgWu
	VYgD5Aa1gSubsDtyQ94DAaZaRERdRdpgHb1UJME4eg7tLaZPCORg8cIBVnGtKyNvG9DVHWQPg7M
	W7pPZavQtWXvQvObA2zxqh/s2lbL+LlN2ZHqQn/1hBCUjTxiHgLC1Yd9UpFfaq+XZBJjMXxen6H
	lRCwBAnTVx5/kLJN/6iHvQvXOSJMkOPoZ23glGtmtL0WoCIIwPinMAfE8XwOvZ2voi5jyUOwa4Z
	IkWprJJRrngCfRwjI61LfN63XNJuNsR/B4cVcMQB+kj8uair6tuBbqkGDVL+veOVJxAMbGauFb+
	ihJU4IjEFp7e6/GYkY/kCaJxPs8sXX3KscqFEFEceAvi14RlSGzTDEZoMXKmNp8IeKtZQ+jG0A2
	zDKBsvC+mjGQuYi2QWCOGUnPF8KGRHhOtMpc9r8nms0OPuB/dEdDEJSOPHXb4ET809PcBZpgW+W
	PUsxJsavZo=
X-Received: by 2002:a05:600c:1911:b0:495:59af:7a5e with SMTP id 5b1f17b1804b1-4956598fb80mr11601215e9.5.1784616093905;
        Mon, 20 Jul 2026 23:41:33 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B88AD00DA0BF9DB4519DBD6.dsl.pool.telekom.hu. [2001:4c4e:1b88:ad00:da0b:f9db:4519:dbd6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed1911sm38837951f8f.22.2026.07.20.23.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:41:33 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v4 4/4] arm64: dts: rockchip: enable HDMI RX audio capture on Orange Pi 5 Plus
Date: Tue, 21 Jul 2026 08:41:15 +0200
Message-ID: <20260721064115.64809-5-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721064115.64809-1-royalnet026@gmail.com>
References: <20260721064115.64809-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_234135_910817_D5C5D46B 
X-CRM114-Status: GOOD (  13.65  )
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

Enable the shared HDMI RX sound card and the i2s7_8ch interface it
uses. Together with the audio capture support in the snps_hdmirx
driver this exposes a capture-only ALSA card fed by the HDMI input.

Tested on the Orange Pi 5 Plus with multiple HDMI sources: capture
follows the source sample rate and stays in sync via the FIFO-level
clock tracking in the driver.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
Changes in v4:
- only enable the shared hdmi_receiver_sound card and i2s7_8ch, now
  that the card definition lives in rk3588-extra.dtsi (Sebastian
  Reichel)

New in v3.
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
index 9950d11..9f9a303 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
@@ -171,6 +171,10 @@
 	status = "okay";
 };
 
+&hdmi_receiver_sound {
+	status = "okay";
+};
+
 &hdptxphy0 {
 	status = "okay";
 };
@@ -247,6 +251,10 @@
 	status = "okay";
 };
 
+&i2s7_8ch {
+	status = "okay";
+};
+
 &led_blue_gpio {
 	gpios = <&gpio3 RK_PA6 GPIO_ACTIVE_HIGH>;
 	status = "okay";
-- 
2.53.0


