Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DDFE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 20:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gk8cThuOVr3SSVx4chFLhJB4lJSnrqBstxF8oe/bdWU=; b=I2qgdDg5GxWkd+Z1sa8ST8vOH9
	FU098yXAxuVImtl7o6qdo5KVVSgJC35mesINeb+duknn7ESzlXgpQeyqpKhnvB/0ha1ig2FcRygQw
	0Ncgbrv6Lv9cTe/XiuWgXyTIwOkFIeJLhCYZ6TUSPoosfy4kCpp8uJB8a/0/1sVOXs3SG4xZVcYzT
	lVia2KwBw1XE8cHQeoq/hOodMurMzGJUGMYKP2ve0A327KtUR+OSd7w/fCA0VVQxLqTX/Q+V6k/yV
	flXL971HWDFxdlTNkYzwYRrOsIB0fhgmIGjpiVD8wh6+gQZ+pen7bbgpcYhMrtZCzdDv18B1DMvXv
	3v7TY/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMn5-00000002y6u-08Is;
	Thu, 19 Dec 2024 20:06:35 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMfv-00000002wMv-3SFW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:59:12 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so1599454a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 11:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734638350; x=1735243150; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gk8cThuOVr3SSVx4chFLhJB4lJSnrqBstxF8oe/bdWU=;
        b=wt2SMglCjztgg8jxtT89pXXeZkwTtdy9beozG16V/H88ZcleiYjGlKFacv6bjJxyNH
         yYnFTMwn+6PQAnLPRBURLBLuQ8lbIT8r2UhAL3QoWXBxw1DJHARlHToP4J3OcHrTPNMU
         fNAkeoi4lT7Yo5BhtEnD6zfJUwJIG9uU9ePyLKPmaY9fOmyxf9Xk+OFRX91+y5x8kttB
         ymrr3j1aSCGYYvIDgWmpTlOxP5xCa7RsH+r4juJ1Ld1AA9um6usEqU9ZwzLZ7iKNj6tE
         eLIScBTYgUScuWNZ/nitQC2rCHKFBLq/d9zhfHp83EzT8Wd1eByoD8Y8qd+oar8KbIUB
         QDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734638350; x=1735243150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gk8cThuOVr3SSVx4chFLhJB4lJSnrqBstxF8oe/bdWU=;
        b=C/m1yMyglMShbrREuUlhX8P5WQHmr9DeblTbSR6XDmrgefhFea4hZOJFUeDof7Mq6r
         hbCO5iGOs53yC5bnRwFDQhSD/3Fl7C8FmnXS9NgB3e1dy7cr6Z4ma/PyFvkrbIXeC8a6
         y7jZh1iiHiMywcDl5upOzNpLv2khZMrw/dHc8w/UmUGxb/HSSquGydKfzIxyvnlLI5eZ
         SqgKjbybHAKq4WT6AKd+B5loV/BYe3yLc4a74g39zQPLCjp6a2Ppo71czYgBGF2qVCWR
         qMBdCnVBqljQ4wO3UFuhWDJdjKccODTjy63Kl3uh3VaIaKgDTEmSIffGGEavLLqlkLjS
         /GCw==
X-Forwarded-Encrypted: i=1; AJvYcCUaDTJ8KIVQxoMShJBXNJdphUOwYm4V4dm7AbRQEcvsunTmGk1g0YSke1o2iulsnA8/1m9G+TAwg2LmYp7jWO6v@lists.infradead.org
X-Gm-Message-State: AOJu0YyP8aO433Khi/dhoL9eQpL0XSwE3SPnwNfWNzNE4uhVWB8mAWgu
	YtHgTDKNc3uxFD0bxjmt1yozDwBOiIW78PSBUnW6eXdyiLfy4daIAHjyuKZWwbQ=
X-Gm-Gg: ASbGncvm1URbid1X8UQ9HoQV7sTFaigZrqE6Vot9+CjWHdBp2r9vBl3kcwteKYtnkjo
	qv0j7QQNbU/ACnlTd6RDmWvKvnIeEZavJ902/rb0/bjHAlu0rmfV60W6yrcg5UqQlLBaizNhlRV
	FVXeOSo6MQhg+kw/cE/hx0utRDM8eLF+tHb8y2rHclQ2kz2WWCP+VsquXrJtwl63vN4MwDgq4Ik
	BCBa9jmb3Ih2/l9c9ePnhCvNXD+H39zFXnnhH8jEDut4gCt4A==
X-Google-Smtp-Source: AGHT+IGYlDf+Xz6gFvbvHg+7Mk8TNFhqb5LHJUrSxJ853FDaHbi3aKQlIsQUWT9tR8k7sWykNjFhJg==
X-Received: by 2002:a05:6402:510a:b0:5d2:60d9:a2ae with SMTP id 4fb4d7f45d1cf-5d81de19afcmr122678a12.33.1734638349836;
        Thu, 19 Dec 2024 11:59:09 -0800 (PST)
Received: from localhost ([2001:4090:a244:82f5:6854:cb:184:5d19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80675a3d2sm953164a12.16.2024.12.19.11.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 11:59:08 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 19 Dec 2024 20:57:56 +0100
Subject: [PATCH v6 5/7] arm64: dts: ti: k3-am62: Mark mcu_mcan0/1 as
 wakeup-source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-topic-mcan-wakeup-source-v6-12-v6-5-1356c7f7cfda@baylibre.com>
References: <20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com>
In-Reply-To: <20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com>
To: Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-can@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Simon Horman <horms@kernel.org>, 
 Vincent MAILHOL <mailhol.vincent@wanadoo.fr>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1069; i=msp@baylibre.com;
 h=from:subject:message-id; bh=9hRKFs2Z9paofbu+as+4aAVd9C5fh/XVAfao6kHuNUM=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJTqr6//L3ocqJQt8MR14+vZWzlDx7cMUNDvnzjkt1Lw
 i2vtnyd2VHKwiDGwSArpshy98PCd3Vy1xdErHvkCDOHlQlkCAMXpwBMRHQuw2/WXJNXDTePmsXY
 i6R6NUUVXT9cvMnQQsMwuDRfOyIhP4qR4UKhdXb91Pbfc1f/qldn6BVTYvogYNBUfGn3/jWvV17
 5yw4A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_115911_867657_311923A3 
X-CRM114-Status: GOOD (  10.74  )
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

mcu_mcan0 and mcu_mcan1 can be wakeup sources for the SoC. Mark them
accordingly in the devicetree.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
index 68e906796aefebc5eaaa5a231e56105a9cdd13e5..cc693be47df080e8b8dba9f1aca2cd725f4ea85f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
@@ -160,6 +160,7 @@ mcu_mcan0: can@4e08000 {
 		clocks = <&k3_clks 188 6>, <&k3_clks 188 1>;
 		clock-names = "hclk", "cclk";
 		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+		wakeup-source = "suspend", "poweroff";
 		status = "disabled";
 	};
 
@@ -172,6 +173,7 @@ mcu_mcan1: can@4e18000 {
 		clocks = <&k3_clks 189 6>, <&k3_clks 189 1>;
 		clock-names = "hclk", "cclk";
 		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+		wakeup-source = "suspend", "poweroff";
 		status = "disabled";
 	};
 

-- 
2.45.2


