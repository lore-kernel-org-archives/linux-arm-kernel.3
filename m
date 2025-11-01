Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5229CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 15:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h0Tk9dDcYmqBenbtFC0DeeXVXsg2rmtasPdJhxUdBos=; b=DNDV6OQiUh/exsUN5LgUF3TMxm
	bnM9tDRgBm+nA2CjwVFW+VykywI7R6N92TXVykaqadCVMqUZ6IbPb+wq0eW0Bq/7y3LkbLpZHKwbD
	KvmXRLs0EMt5l8YRgE9LZGrAxm+j5G5L5oNxS4IVLfyYpLNWLlWTl7LlrrwyiKdqSxevj3f5LroHP
	jfG1XPsSO/wEGJmVEh6xi0/3zG9s9Sh06UOQ1zRSO6DzSDBKBhUV0JteWOQbZv7ZEJbRQ4a598jXY
	gp+qrmk9mb6oSYLWgKE922FzkyJ0tcBBEX1De4ltoZr31sCTCaoWzg/kGUkNnnyyasmqdWPXtqWWP
	HsK2DEOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDdc-00000007sRv-1wt9;
	Sat, 01 Nov 2025 15:35:32 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDdZ-00000007sR4-3KLY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 15:35:31 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-63c479268efso656879a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Nov 2025 08:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762011328; x=1762616128; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0Tk9dDcYmqBenbtFC0DeeXVXsg2rmtasPdJhxUdBos=;
        b=TuLifoN+SfiZ8J8UV5RTJDY7lK59rE2x9yVRHKujbGpYIVlvqolNWNOG+2eqS2x9Sz
         cIg+NZhAtMeTXbxYjrAHef8IeHtc8eO3rNgRo3Wo2GlE+8oknrBIXWn/mbtB7Fi1q8WS
         EN3I6cTR8MEVlgA39SbBA7c6FLUsi45Qp/13f7FRFC+0pVszYuYsJJW0EicDQiIv+7CT
         f/LWi4efRXh4Yx3LG7QeITYyAq5r2OROwqnGms52jwEF4Eh1QME5zxNZJjpHIKI3rQ2e
         k+H98Ln4Wz153pdzOR8qgAN0SPfhQxmPmyXc5VAhCsokJZvGV4AB3i9c924x6L6dPFn+
         jogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762011328; x=1762616128;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h0Tk9dDcYmqBenbtFC0DeeXVXsg2rmtasPdJhxUdBos=;
        b=oa5NEfhGbM5W5JW91Hay2bc0sBCJ9oLp3YpbpYUUXPmDuN4vL1QTlamNuOBQYQ2aeH
         dwLHDe23zh5bDbzZGbqilBsFehdFo+vblYv9YRAAwB7YSR5DFgFP2ds+0hOOUoENr+IV
         28+1x0hFuPT6L+Os88nwx4CEYC+ueb/qJLZu69X9LOP147fY5p9eR9YJRQrdorMi8908
         Nm41GsNk4GLQwcH9kW37p2AdjTeccsVElvASjtB3+GWFq2efHBTnadUyBotdYOqNPjOK
         YPFGFNUxhVXlVvqzuxuCcYMOnR1bwF7skyHlZgOMALLB2STUqw9JzKVjrhUS/vgzw8/d
         AsaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuNV19houtZws2dywzorIZ2/jG5rGP8GZpaBJHmVxjvHG17/BXdSAPUVd/Sgzdyi9y7at/mQ9cGNLsjuYAXeZn@lists.infradead.org
X-Gm-Message-State: AOJu0YxQlKBnRq7lOgiSngQeOLDsdVjheCFPWReI5Afrq95Tp5MbSuJl
	eMoLS17ZNLie6C5wD5NK3fFGVZe4lWwXebVz603ae1NAE2OkYBPyYyET
X-Gm-Gg: ASbGncvarJ6JHtWrBICYMJB+ZjZCY96k4LHJclf/Ox6w9CgUIYKYUMNv41Xyi1EtJ8Y
	n9fFEaN90o15GWXkBlM3F0ojxHKJXIqyn1jZ/AOvRTcccRjIEP1Ne8Xli6X0DALBvwTNU4KWy0l
	42B+ZQioWHlCHx6d1WPpoCMBE7tGaf5xSoVDHA/Ddr04q4b3bpIsusH7VOEKHSTH8u/5oWP39Oj
	vkr3qS+ZhciFTLS7V0/hyKGRAagycr7UcD9RfuhynQ7py35/Ve3x0LIoo068FvFYhtr7zfTRbDA
	670YGMKuLcDiDA4Be5V5I9OzLZiuT/p8t2y7LvllwtHGiuQWvzHjL5uvcavPvtqDFGU6qs/mP9a
	o3ITjZsv2qxiZZCya0wbLg4QFIoEW2JmpF55UsBy8ZRoZ9KNTr/ZKR0LfyHkDzpnaUznpUOMZz1
	eZ8ufu4tk6qIufA0tw7H6yRnk5icKhz2JjrdEoF7ydCwc/xNRiZw==
X-Google-Smtp-Source: AGHT+IGGbZKmix+04v0yBeE+miuCe2f5O67VTMu7nJKCL7jr0B/QprRarMtQ6I/yofHU8ylwWgs/DA==
X-Received: by 2002:a17:906:730b:b0:b6d:5587:e336 with SMTP id a640c23a62f3a-b70708c8a6fmr418924566b.9.1762011327533;
        Sat, 01 Nov 2025 08:35:27 -0700 (PDT)
Received: from ?IPV6:2a02:a449:4071:0:32d0:42ff:fe10:6983? ([2a02:a449:4071:0:32d0:42ff:fe10:6983])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077cfa966sm478124166b.65.2025.11.01.08.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Nov 2025 08:35:27 -0700 (PDT)
Message-ID: <92714b6c-6c0d-4a10-afe4-73ed313c87c0@gmail.com>
Date: Sat, 1 Nov 2025 16:35:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1] arm64: dts: rockchip: correct assigned-clock-rates
 spelling
To: heiko@sntech.de
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_083529_874148_8D467507 
X-CRM114-Status: GOOD (  11.77  )
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

Due to some copy and paste from the manufacturer tree the property
assigned-clock-rate is missing a letter "s". Correct spelling to
reduce dtbs_check output.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

https://github.com/rockchip-linux/kernel/blob/develop-4.4/arch/arm64/boot/dts/rockchip/rk3328-evb.dts#L313
---
 arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts | 2 +-
 arch/arm64/boot/dts/rockchip/rk3328-evb.dts     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts b/arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts
index b5bf84322031..b9d4d78bff0f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts
@@ -184,7 +184,7 @@ &emmc {

 &gmac2phy {
 	assigned-clock-parents = <&cru SCLK_MAC2PHY_SRC>;
-	assigned-clock-rate = <50000000>;
+	assigned-clock-rates = <50000000>;
 	assigned-clocks = <&cru SCLK_MAC2PHY>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3328-evb.dts b/arch/arm64/boot/dts/rockchip/rk3328-evb.dts
index 3707df6acf1f..76715de886e2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-evb.dts
@@ -101,7 +101,7 @@ &emmc {
 &gmac2phy {
 	phy-supply = <&vcc_phy>;
 	clock_in_out = "output";
-	assigned-clock-rate = <50000000>;
+	assigned-clock-rates = <50000000>;
 	assigned-clocks = <&cru SCLK_MAC2PHY>;
 	assigned-clock-parents = <&cru SCLK_MAC2PHY_SRC>;
 	status = "okay";
--
2.39.5


