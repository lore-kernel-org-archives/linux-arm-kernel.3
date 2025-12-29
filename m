Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E34E8FDB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 10:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hmvq8IpMPngxZJ89oRl/9976MSq6MvT7IIFrbZGP6LM=; b=L0kjd3TE8k1k9rIwgwqQqFnUYZ
	fqqseCyktsRkEiCnh1EQRhZAOwDv4spFpB4fuurdBAj+3mNpSXUSlwwaR8dIragHZ7KIfpdeW+6L3
	yNlQZYHZ4YHMY+0P78GcCaRf6c9ahiS+wJ8tBww3BcL49iWKcUshvsciSLdSql61XYfJcyAvlbZ+p
	HLezm7DexxiYFtfQMQp4H2glDWRKnDWNS/rpwAAumO1lg2MoLABt7DVnD9SB4OnonvGHMwwcJcbFZ
	Kw7RdWptIROHSzHYTU7Gipa3Nseo0drT7xOUPEIW7sN1sd7Gx2qUinBS5P77TXjzFxgnvSLFXvUP2
	48Kz/Xmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaAEn-00000003Xr7-38Bh;
	Mon, 29 Dec 2025 10:12:29 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaAEl-00000003XpB-2n3B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 10:12:28 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso56160025e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 02:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767003146; x=1767607946; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hmvq8IpMPngxZJ89oRl/9976MSq6MvT7IIFrbZGP6LM=;
        b=mmAYe9RQsmWq4Q6aLRLBQA0HglSTPPcZTr7047imqeFD9bKvM66bpB4Uyh7iZyDTFx
         25wG/HAqSbDr47v/OyH1CzbirbvggRf8HNScULrq0bpOjYJEJD8lj7IRZ6WlGUceO2CZ
         7EatqcyV50eeSN5fe6jthBO3jcAwJ1EqdjuTJbxwMHUt4JJzQXDZsATpkE2R6oLCNGvU
         jbN7D/dWkxC4VdbpMd1koUq6BxjA9F7RpA3ogJzgL9Jo0Q+ttsoM4FEypkZIKT0+F8Gj
         p/vB9jt/e9OoTtsz2xzd3EsRuYox929JcDKWIoP72UetqyQBVDZl7e+r3uBEWbsBOFBh
         DDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767003146; x=1767607946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hmvq8IpMPngxZJ89oRl/9976MSq6MvT7IIFrbZGP6LM=;
        b=tzhQMnijpvZh0bmMVBdXHgVMDfMpt98TXY8XzyunXOU26C8Z2OAv42NPk2zGR6/JBo
         +rbsLo6Uw2/2JNQNSGR2VlZ4bwXHuiSzhsQpVf0bkfdYUGkmCbpn1A2kLmVd3/ubmZt6
         KGAU0HF6Pm5Ccp/4Okbj/7SOafA9bRcEbrKBhrnt3O3MXPHU5LLK94+JZxExxO/iz0CK
         XbUUpWqf7n/tYxgkw38OFHxpqa4Zmf5cWmgL81y6KP1RCknOUQ25RBVgPPs6Ix0uL91T
         VYU3YWAg7QrSeCSCZo7wvMt6Xuch8WabaY+oOWzSpbci7sodi1Ew/2wb62OtgwxhWE4l
         r2sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyHTKdxEkm7mT/ig7jjjc3g/TEkyE3Mx7Xf1XGGMjj0o3pqn9TTAnnwqrPyI3PKllgFCPY7KFzk3ceqd+sRqDd@lists.infradead.org
X-Gm-Message-State: AOJu0Yweu7fsTW8WQxnhOzqOwRKnhAoLMNsCGBwAingIFk4N2NfAEDV+
	b8WWRkhhcX9jpyYyvLdySw/ndnJcoS3+07IVgWyIMBkEe3ZuhBgUy6e1USkyYpiRpqI=
X-Gm-Gg: AY/fxX4wXzfz2dn8mzON0Ku0kbv2UcR0wg5t1a9D/GvEjtIucKcumMtFR1gL5vkTVP1
	cK+YlA0uwlVoPWW+P17Mbz8phzXJfQ/TNZ1yE+WtT5O76z/evsAi00Bvx8JqRRv/u3ZYFgyxdSk
	oVfEsxsj8QFQfMkS9o4/JK9o6roZ5hCJ1kBkmqBUeOsHpAT8XRatX12grMWsIo3gIetlBtkz7x6
	5DFSP+4PqwsA6zSNVer5gBTWemzLlv5zLwPlpwUNyU3mYvPTE0B1oGmayXst7TB6qT963jeNtHV
	Pq4hrHDe6VxXiz+TjDC+SB4VGdmg91JQe8HoTQn7HncIjSge+KCfEpMwXoy4g/e4Epo74j5OHI5
	7mpCCzdLsTdYze7N1/zSgrYmjFadQ6GaQgrc1FkuOaqedtbW1z+IAAdvgexVyzeXpSdViT115gw
	A1uYx285QMMipVRDuTTxdBGwm2W1GNUalDBSFF8ZfW5SfKr72I5FUennmcqtFp
X-Google-Smtp-Source: AGHT+IFAiAe+PhS2idEv0Ey0iDrFQE5elTI+8IG4cgjiYqs9uTdQ4Loam7NpxEwNgCGYGm4L7lRjHQ==
X-Received: by 2002:a05:600c:1d1d:b0:477:9dc1:b706 with SMTP id 5b1f17b1804b1-47d19576d2cmr308387215e9.19.1767003145527;
        Mon, 29 Dec 2025 02:12:25 -0800 (PST)
Received: from alchark-surface.localdomain (bba-94-59-45-246.alshamil.net.ae. [94.59.45.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d583f42dasm19840735e9.6.2025.12.29.02.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 02:12:25 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 29 Dec 2025 14:11:59 +0400
Subject: [PATCH 2/7] arm64: dts: rockchip: Configure MCLK for analog sound
 on NanoPi M5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-rk3576-sound-v1-2-2f59ef0d19b1@gmail.com>
References: <20251229-rk3576-sound-v1-0-2f59ef0d19b1@gmail.com>
In-Reply-To: <20251229-rk3576-sound-v1-0-2f59ef0d19b1@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 John Clark <inindev@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1919; i=alchark@gmail.com;
 h=from:subject:message-id; bh=kx/5/gOv+LNdWrQToOMBSk2+QPj07MLFLi9t/6wsj9I=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQGhTCKJ9zceEbqxZ/308R56qbLu/Ra14Txnm7u0bLLq
 2y6xZrVMZGFQYyLwVJMkWXutyW2U434Zu3y8PgKM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoY6xgxcHEKwFSfUWT4wy8fvvBDn9NR65JzTw3m7Ar2a3y/fg+HZYS43d3Za85M+8/wT+nqtWu
 pwToNs8I/tjzh+vay0GnLrlszBc92pK9K+TBxCisA
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_021227_740772_EE2E8DEC 
X-CRM114-Status: GOOD (  12.23  )
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

NanoPi M5 derives its analog sound signal from SAI2 in M0 pin mode, so the
MCLK pin should be configured accordingly for the sound codec to get its
I2S signal from the SoC. Request the required pin config.

The clock itself should also be CLK_SAI2_MCLKOUT_TO_IO for the sound to
work (otherwise there is only silence out of the audio out jack).

Fixes: 96cbdfdd3ac2 ("arm64: dts: rockchip: Add FriendlyElec NanoPi M5 support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
index 37184913f918..bb2cc2814b83 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
@@ -201,6 +201,7 @@ sound {
 		pinctrl-names = "default";
 		pinctrl-0 = <&hp_det_l>;
 
+		simple-audio-card,bitclock-master = <&masterdai>;
 		simple-audio-card,format = "i2s";
 		simple-audio-card,hp-det-gpios = <&gpio2 RK_PD6 GPIO_ACTIVE_LOW>;
 		simple-audio-card,mclk-fs = <256>;
@@ -218,8 +219,9 @@ simple-audio-card,codec {
 			sound-dai = <&rt5616>;
 		};
 
-		simple-audio-card,cpu {
+		masterdai: simple-audio-card,cpu {
 			sound-dai = <&sai2>;
+			system-clock-frequency = <12288000>;
 		};
 	};
 };
@@ -727,10 +729,12 @@ &i2c5 {
 	rt5616: audio-codec@1b {
 		compatible = "realtek,rt5616";
 		reg = <0x1b>;
-		assigned-clocks = <&cru CLK_SAI2_MCLKOUT>;
+		assigned-clocks = <&cru CLK_SAI2_MCLKOUT_TO_IO>;
 		assigned-clock-rates = <12288000>;
-		clocks = <&cru CLK_SAI2_MCLKOUT>;
+		clocks = <&cru CLK_SAI2_MCLKOUT_TO_IO>;
 		clock-names = "mclk";
+		pinctrl-0 = <&sai2m0_mclk>;
+		pinctrl-names = "default";
 		#sound-dai-cells = <0>;
 	};
 };

-- 
2.51.2


