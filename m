Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B59C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 00:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlDk5N2GB9mCp3K6OJvLJ8k4vH/W+90nGfvSZBoofS0=; b=tUEptBeN9CWBoxricubB9icygf
	vcyidlD3S7fWszQlxLTWTsuL+nMUSOoHWBnULjx2z1jNNZLs2vow4T2NnL5KE8b4nTAgkQ3VB1u8w
	2lyLjxfLU1/YhFZ3jtuDcZ2eJW4vCu56RH1s3gCdtsd1fm2Bh1dwcc9XeZBPdgktaH55PMMoRxdlW
	yZ9xVxAp4MZAC5g6kWR8qDb9uenZshUWF5xLOoY1TDQ6tmmYz/NgCW/VxxFFxhtck/r3c5mZZgfS6
	dWuBakTx0OvLNG4cAdAY5jgAsY82HEZBHq2F7sM04d7Qb3RtA/394c8aM9ByCdKNRX+XLdh7y6D/K
	sovHwb2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnnsD-00000009EVV-1Gsw;
	Fri, 28 Feb 2025 00:05:01 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnnkY-00000009DZn-06XR;
	Thu, 27 Feb 2025 23:57:13 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-2bca6017608so1091070fac.0;
        Thu, 27 Feb 2025 15:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740700625; x=1741305425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlDk5N2GB9mCp3K6OJvLJ8k4vH/W+90nGfvSZBoofS0=;
        b=BeXtWWUA/T0YtitJa+Ers1wuYDSdBwaA+3H3e4N4qzwBmVFpaVnZxdVyxxNruB5mXC
         oVRyUwtzgDNSIIKNJA0o7LCoZBCUneokV1nIcLO5G6DjwM9qaQq0vxd8gMG+v1Jy2LV1
         TFqZkbqfSdzEDouMEqFCUTY64VzHqWTazYnjBnczZ5zDArFRmJi9ZOb95Jh6SLvxeB6o
         jRXmsG0eQugBqtZfEV94erauMsJFBxz9rnD+CAMOPhFDVi5iZfWOp2doFzX7QY+wvs2Q
         Y2/YkLbXV8oQkwQpZkrZdh7cX54oUFAN97ppShKxYQI6Lk1imFaHyMm2MWUeU39muKzZ
         TTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740700625; x=1741305425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlDk5N2GB9mCp3K6OJvLJ8k4vH/W+90nGfvSZBoofS0=;
        b=HkM1eEpBQai1FFsx+MUytAkCja0yOu3fmjY+fbXocEx1+Ez32YRruU+9a08UFwOHUC
         vPQTzIZzRtbuiEZ4L6OhI5ZF45Wdy6kV5Lmk1eWVpHXizFzWa8LVq/62I4pFFfZXrzG/
         h0BK7w028w/Mx55LvTbSNPv1W2gamQqzKOMy1YOrGYTq3ul8axM8J5iYru5t3/jAScIu
         CsMtZv1WpuIvSDFPLW4f70T3i/Gq6m3auIJj1Jmdk1OSL8C7X87hUl4XZ4H/wp7iZyv7
         mHZfA4WmxswjtgD0L3TSJiW8Ch9Xep5cDqslBIGnbyZrXBTsMUyI/QpmPeuuoZ/jk8Dl
         0TDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyZD9h5lCVIp9PFeD5r4iLttime+utw5VuE6MV3PANoiSGeeUoyIj5OiHn//HnUDhxbvOTTu3lqINUDxoBCq8=@lists.infradead.org, AJvYcCV2u3DIJApUDMApoC3glGILPDKz7NHYBXIdynArXvWbDy7bTYixiaQta+XeRv9O9HYvnPnvdBiBTnHqjqsPiAlW@lists.infradead.org
X-Gm-Message-State: AOJu0YxgE9aubiYpBy2X7/B9QkdnU3NohOThO62u/tlR22ywkZckZHQ8
	buF2VH2m4ZxO/5aWENCr9iyYJ8rCOrjpdEwHxnwQdiiCn9BdUHcq
X-Gm-Gg: ASbGnctX4DLt3j0MSxbSh5KnMRU9ViOp8viYSpJ9KCPynuuI0HU6FrZlwOapiPMh405
	pOB4hSIYuqAUSLMpDTcXZrbkXxhMUgqG9Ax4FeodPt/ExBjX1uqKlfC5Ci/w5b4cUolVW19oxbq
	ggo0lFICuUvTxMNHRjTfN5fSbtDy7z87gQTvbrnGPid4/H7FDbSpT6Zd8+ZhwdPQgzLUcIVusle
	2AJOSJWIqGIarasi6ucIue0NnmwheVZjUA9zgIM1phor4uXcFNjaGpDSIxmZsCW0tmdVyvFn5fb
	Z00+vhM172EtLl1Qhij1IkwemdXd6Ca9ekU=
X-Google-Smtp-Source: AGHT+IF3zsxZysqy4mQrajdDPKqBlf67QpxzEWnybkW16XIkXogKUJuTCIaYSQ0OXdfMVpVrnx9FEQ==
X-Received: by 2002:a05:6870:a686:b0:288:18a0:e169 with SMTP id 586e51a60fabf-2c178437544mr717463fac.19.1740700625041;
        Thu, 27 Feb 2025 15:57:05 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:87c8:8ae4:f338:6188])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-728afd7694fsm443893a34.50.2025.02.27.15.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 15:57:04 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Cenk Uluisik <cenk.uluisik@googlemail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Florian Klink <flokli@flokli.de>,
	Muhammed Efe Cetin <efectn@protonmail.com>,
	Ondrej Jirman <megi@xff.cz>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH UNTESTED 4/4] arm64: dts: rockchip: Enable HDMI audio outputs for Orange Pi 5 Plus
Date: Thu, 27 Feb 2025 17:56:23 -0600
Message-ID: <20250227235623.1624-5-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227235623.1624-1-honyuenkwun@gmail.com>
References: <20250227235623.1624-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_155706_059379_B83F608B 
X-CRM114-Status: UNSURE (   9.39  )
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

HDMI audio is available on the Orange Pi 5 Plus HDMI TX ports.
Enable it for both ports.

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
index 53797f633d3a..121e4d1c3fa5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
@@ -124,6 +124,10 @@ &hdmi0 {
 	status = "okay";
 };
 
+&hdmi0_sound {
+	status = "okay";
+};
+
 &hdmi0_in {
 	hdmi0_in_vp0: endpoint {
 		remote-endpoint = <&vp0_out_hdmi0>;
@@ -152,6 +156,10 @@ hdmi1_out_con: endpoint {
 	};
 };
 
+&hdmi1_sound {
+	status = "okay";
+};
+
 &hdptxphy0 {
 	status = "okay";
 };
@@ -220,6 +228,14 @@ usbc0_sbu: endpoint {
 	};
 };
 
+&i2s5_8ch {
+	status = "okay";
+};
+
+&i2s6_8ch {
+	status = "okay";
+};
+
 &led_blue_gpio {
 	gpios = <&gpio3 RK_PA6 GPIO_ACTIVE_HIGH>;
 	status = "okay";
-- 
2.48.1


