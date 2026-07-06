Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E936AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yx4FBJmHhIhPwgpgVHtFQpg4a59/aBHMExozfwUf+P0=; b=Y5irwv6j5orA0DqByMYUj0k1vF
	grfWxfYeBLJ3UUxNZdp96CUg8JPwpUvpKcbnEqF5Oqu+BUccXOnLjx8+IQsvibD6rC200zu7T4fV8
	5xC+uv/cGGf8XHMP2WoG5GHoGWB0tvNH26Cm8ugOJ8lr3G4ZmeYbiiLWMVIi5x77kOnuxbzdDMfhM
	ABBWfQ9bTSPPgnv+sd8okKMkE0gbbzSiMyi7U9PPYu1KmQrtrQP3HKt5zPZuCrhMZ59jWVUUsyKVl
	+4mpdCef2Bwx8nfA1oEkmxYO/6bsi5hSJJt30WUJ4Esm58sl7UCZponuYC8A2Ry+XG+w08eihwWiI
	nxP1jeSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjb-0000000C3kP-0S86;
	Mon, 06 Jul 2026 09:35:29 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjG-0000000C3IG-1a7D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:35:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so21245755e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330505; x=1783935305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yx4FBJmHhIhPwgpgVHtFQpg4a59/aBHMExozfwUf+P0=;
        b=MGT+I+nnRv9m7b5q2ehrASHx+MwdxuTnAJcj5CTVA9peg0pEr+4+gX4ltS8EfcTwjN
         kWx+eQ2wvw2btalwF2hc3RQ7PRvIXlk6OCOdfxW7HX0fdwrmni3WPvvWu1JoFni/ZgmA
         16CPs7biI7gP7jm8wm5+SzU6oaDvNWWxBMyZq+JTgv62mo1ngSYuNnYFKrI5qlqDhWDB
         dqsV8CTvCmGDEEBcADLZdsPXRnWKDFUwQJQ0tq5S3xHO7kdWkqI2cTcDcc5SaIeLMTDc
         eOqWTjz5fr5oscIU46gnbD2Rm3xo/JPhKbfrW4eJ6ilbrcSJ/ot8c4jg6FduKrurOZq5
         Bn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330505; x=1783935305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yx4FBJmHhIhPwgpgVHtFQpg4a59/aBHMExozfwUf+P0=;
        b=GBxBQxCQhapw6MgXy5I/UWx1pbs8A3TNYsFDzmVksN2C/XWuwFvN6Bj8bNzco7qDbR
         F6gYoKNtGDd4f0Tu8CMdD8Zno1HczeKvn+fum/dR+qHww7l1LpdRPx+LV7u5I9LpknGd
         rLJs0eZA+92sHUxGH+Yp1w3Op2GZ85W0LDdNY94OaKaS8YiGnIuQzc4deRhEpghV6Q9w
         8r57U/go1AYNj5r0IfQyCAfmEgnt3FEoL431mK2HG1uD2OpOc7xE/o5DqrTezoF79NJB
         tNS7lfWWdbGJRb5pBFxxyH22ekMAV1kWiBWlwODYzZ+SglAPkfUC1LGKJ3Ebn8ESiIYh
         qSow==
X-Forwarded-Encrypted: i=1; AHgh+RqiGKjuvquBmlwiiVa+lRK0Al2WlKtdaz1qt9EQz3ajnNEIiqiGbkQxer5zk8xhjHGLklqim1xppewL5MuUyFNT@lists.infradead.org
X-Gm-Message-State: AOJu0YzwONt7bjL/LL0fz2gYlRyA7tBHoJbOjnZGQqnZ+glDhGwjsW0t
	cDgbSAkq19tDQkVJLS8sRnrPBikqqIHYo9Q/GNfzFJFWPge/+Sd5MzDI
X-Gm-Gg: AfdE7clIMVI1T6k0JGNPNHL66MCvUNeyNCk+IxzMVXnT1lvlHCCmVLUznbhBE09glcL
	yh4yl28w4oolmLNz8m8TbA52MlANrbaj989SrSnk0lP9mGNxAovepiD/FB6HQdQOODp2fegLLhl
	zCcygbmHazljMc5NXG7WzzwsamdX0sepG4+TZb7kc4bQAfOiIwLOsTLDxbW+szlQr+kCDyOF+hC
	CrDCW/8yQEaV+pttv04b3Mv5u3wVUGFIZ9UFlJURtkdrdfs4D08+1KeHZ+QUPhimbZAx8qNa4Wk
	g9klinO+Gf2uD6v4cUwWEDUfptpeBP/Sat7ldGnKU/HNXfxE8H2wdYk8tbQQB6AEunD8qNS5sy6
	VZaAzc5d2m5r5R2kneg7MX7VIfHxwG0Zm0/Thja7PBxU3wDo4anDhf81+jySJW1sQ3RVtqJcSOF
	QUkyug4F9tRQ6dVFkgSYbElp7KMlSJuLmVO5FXv1ikZqFDWOPOXhylUdXZH1EuGfxGjUgcSEiDb
	NAucQF4WBwRzlTskOAaDJqTfw==
X-Received: by 2002:a05:600c:81c5:b0:493:bd4f:510 with SMTP id 5b1f17b1804b1-493d11f02f3mr97319415e9.19.1783330504569;
        Mon, 06 Jul 2026 02:35:04 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:04 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 12/15] arm64: dts: imx8mn-var-som-symphony: add wakeup sources
Date: Mon,  6 Jul 2026 11:34:42 +0200
Message-ID: <af94dbb605a1c18f2cd2d1f86813c0c6e84eaedd.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023507_792272_3F4AE32B 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the Symphony carrier board GPIO keys and capacitive touchscreen as
wakeup sources.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 4898018f030c..c98dca8e7889 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -40,18 +40,21 @@ key-back {
 			label = "Back";
 			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_BACK>;
+			wakeup-source;
 		};
 
 		key-home {
 			label = "Home";
 			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_HOME>;
+			wakeup-source;
 		};
 
 		key-menu {
 			label = "Menu";
 			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_MENU>;
+			wakeup-source;
 		};
 	};
 
@@ -187,6 +190,7 @@ ft5x06_ts: touchscreen@38 {
 		touchscreen-size-y = <480>;
 		touchscreen-inverted-x;
 		touchscreen-inverted-y;
+		wakeup-source;
 	};
 
 	rtc@68 {
-- 
2.47.3


