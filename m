Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B32C61DFB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 18:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vi+zTY3v+XYAN7MEQwL4QN54NaCqF12xnryOs65hhBU=; b=X/S7zSY3V+oQtFEUEsjhnp9X61
	n5lnMPxRT89W0zz2o1BYQZzxR8U3lDgAaA5bdyi4xSMrQS64lXOtNRbAZJmLy9p6e2UNqyXxA3zuT
	JbJH1Zp3ujGXAtxVpMXDXKhdnWXmHjwzVG+wXFHC2v7DJGpBW96JZrEYDxWvH95iz1jY6YnIFVtPg
	O3uut5Xvzj74VHtUoPQD7Grv3xyiJ8Y/NCfI+w/Sjh0yCii798YXkZwxlbnCDxZdlMiKFlquBT9Yb
	vEvx+nQmGBvvFm71nVfniYIKyw31Hzwy4mdm5MqhO5CyGFTRAxkUceiDpCUUWqMCxGoAJfZQ2E+vt
	T7yYhmCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtrqd-0000000GFeH-3jbA;
	Sat, 21 Feb 2026 18:36:59 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtrqb-0000000GFbe-39D8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 18:36:58 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3870dec27f4so36794691fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Feb 2026 10:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771699016; x=1772303816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vi+zTY3v+XYAN7MEQwL4QN54NaCqF12xnryOs65hhBU=;
        b=OIgOf1QfBqhxz/3M7OQZmYuHfxd0ouVFI3UtnhAfzznM54NCsaJoX/QJJknzvYJ74g
         +mohxx8SSK5KMQ2dd2I5hre9rcoXJ28hHwK0uLHaiqPAgKPd4DFEufHtr/3SOT+zOfWw
         Q3AZ/1AooNm77RkTUZLALMlJZ1Njj2XCZMigpXeqw7dZkZjImNpFsG3Fhp3HlvFeEejo
         Wf8CIgUYoZRSuyIs3sPlWCH8ukspZzKPzhhDGVC0KdrgR+XDOch2F/IqmUYlNYAEot/t
         DPc0VjCeJSqC09wJ/VThbwD/5+ex6wn6lTxJ6ueUtUJc2tJDGhwbnF3bsx9FLROjbs+k
         UI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771699016; x=1772303816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vi+zTY3v+XYAN7MEQwL4QN54NaCqF12xnryOs65hhBU=;
        b=u3lcq+VhXdmH0tDjcCuTjPRT7Bu4QukXCULtWsJMsrmUsb5a1c4989LvuANlWIrt+t
         Zah1SkFsRB7ORBHPnSVHxMmnWMi7cwJGzWIoC6CXMcWQFlAZ4a6rQMvqWILqFHpdFgxi
         hSnGFKg3fOslqpAqzEkfcLRA9gEeCFylNL/c9rRzJc/EdomQXGNunQUk6pFWbRQZO+UZ
         XGSHa6iEr5rXvyjzfdunyoGKjehxicwmN/K1ziofP0OrrvPbVjppzSutylVRJ/HFlKiN
         DSx5BQ6J/n8JwOTw5GvkWPPjJYFbdbiY/ufSsFpB+My7xsW9dqiFwxWVnuDbTNUoBcqy
         JM9A==
X-Forwarded-Encrypted: i=1; AJvYcCU6YuCujJoLjRXctwFLpdfA4SZArzbgFEXwkJd1VOD+M8LT5I78wxW48hcC0/M/HzyCR3R6FXTDKbx/7F0HBEIE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw25hGAeuXQUTLOCAscu9hGkp8kHTNidVy98LtAt+tHrd/g3aXc
	qPGe+r+svWgT8OXQyz/OHRuKgkCANbVRBLoOXvd3tk7L/EjPJ37bvXc=
X-Gm-Gg: AZuq6aLK09VXutWLcRnep9biQ3mpQCFtr9TQ7rKLuMyt5w39XdrZf0gHsRFFNa08xPI
	VZLVeNdaGuXuYfBKsLRZX/NOmu+8jXgGEEIWpmJDt0XhOgy0Ehmd50k7u7YAw5zElVd30dQLMQY
	Ezgyj+/qVjL16XGdY0SlUSVxBCcIoPvNwawAOi7bBs9wxdhoyouHvwj2wZt8sGUz2auFwIZ1sGZ
	m6mseFwJWb0kHcZD//dmYU494qxv9DasQhIGmUM6uXybxAN6jWtw77COH7n1Y2k9rdLdF1oI1je
	1rpxCxzYn1v8JVigNKjPud+uPjVwVz53RH4/2bYaAOyOa5yoIuvporXpJDqng0NWSKizJBxcrGb
	B1MNnCFOgYZ6nNmyCPE+s5bGPJtaysmI6PjqRBvc4zrOu42AHCHkSM5JPqYgVGot6ukM8Es2zwv
	LL0a/3nLXjlHVB++4yH4yWTUW2URFIBxPf4TGH
X-Received: by 2002:a2e:9853:0:b0:385:b4ef:f667 with SMTP id 38308e7fff4ca-3885335b418mr22967171fa.0.1771699015563;
        Sat, 21 Feb 2026 10:36:55 -0800 (PST)
Received: from localhost.localdomain ([178.176.177.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7af19d4sm5006841fa.42.2026.02.21.10.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 10:36:53 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v13 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Sat, 21 Feb 2026 21:35:53 +0300
Message-Id: <20260221183609.95403-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260221183609.95403-1-privatesub2@gmail.com>
References: <20260221183609.95403-1-privatesub2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_103657_806364_3B555B64 
X-CRM114-Status: GOOD (  12.32  )
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

D1 and T113s contain a pwm controller with 8 channels.
This controller is supported by the sun8i-pwm driver.

Add a device tree node for it.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 63e252b44973..8e38a0d95f5a 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -193,6 +193,19 @@ uart3_pb_pins: uart3-pb-pins {
 			};
 		};
 
+		pwm: pwm@2000c00 {
+			compatible = "allwinner,sun20i-d1-pwm";
+			reg = <0x02000c00 0x400>;
+			clocks = <&ccu CLK_BUS_PWM>,
+				 <&dcxo>,
+				 <&ccu CLK_APB0>;
+			clock-names = "bus", "hosc", "apb";
+			resets = <&ccu RST_BUS_PWM>;
+			status = "disabled";
+			#pwm-cells = <0x3>;
+			allwinner,npwms = <8>;
+		};
+
 		ccu: clock-controller@2001000 {
 			compatible = "allwinner,sun20i-d1-ccu";
 			reg = <0x2001000 0x1000>;
-- 
2.25.1


