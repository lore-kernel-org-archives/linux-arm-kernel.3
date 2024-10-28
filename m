Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20085D339A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 17:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p570CyCpET4jQOMvqTRvBlj0hjjJLO72psUJRNLRpe8=; b=aZbDnJq9cT/E790G+frsY0CKJr
	M3YS4frkB59kLc2CxlAoMFFJLRxtWVnYMo6oZi+DXXAlRB8vyexAoUxR5JgqXmkT9E8LxziSRDEhj
	+AueziCsa6+s6c23Rl4FWUwGT+GspgSfB6xK/rAnuuw8+gG2iL94EHAGUKmg6BO/s2bJYCPmpv4wz
	oDj/yLFroAe9umsr+1AP7gm2ckU+fAk/aYlL8Cm/YeivV8PSa+Ea/g3FjZ9ZTiEXvEKWZuMgJLisc
	BYchRy3uxPmvVxaxQcDMsHfMAvQV8+VO4Kz9x0cdAjaisQUb2KA4rcuLjR82wcToAuE2CEBJ1+ChJ
	JQ+ZAVxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TxI-0000000BilK-0xyO;
	Mon, 28 Oct 2024 17:55:04 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TjC-0000000Bg7o-35Ds
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 17:40:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43155afca99so38436335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 10:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730137229; x=1730742029; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p570CyCpET4jQOMvqTRvBlj0hjjJLO72psUJRNLRpe8=;
        b=t7qfzQ3bS20SsePeRhckNSSrahEdkh9EskmeiJgw95I4wXutJRZxq1BbEesR7m/vnB
         t2AR/0iAabZoIxo08AuIrCLombL01uboU940z6aeV12cKYkBUPzTJnHt6Rd6y/YltWv3
         dbNud7sYV9uJwo3dc+WHUnmv8WwWnQIT9eapgVRw2Srwhf5xlwOGrUXGhLcwF1kCGxfr
         PcT742E88vzOd6m97F4DUkh1rTv7CAQKYUdV7vMBZowHi4jxYs87i2CHA0mTW6pryBnL
         xLQDqRZOW84S58ORemY6L/b+mSFcvpxrf6Bj5RbRuS93EclNf7ETJ9qbSrqridHOrIov
         j8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730137229; x=1730742029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p570CyCpET4jQOMvqTRvBlj0hjjJLO72psUJRNLRpe8=;
        b=k2Iv/iLljitpM1coY3dbbUCC3T/sWuYfdABzqkmSzvqC9bAUOvFVFiZBq9A8KwZv7c
         OMMAhgspkpXsOMaHNZGr2llFpFuskIKofoEaw8gVcaTZ86mic0G+7DvKTYt6RwZOAc7H
         r8HkWyIZT7lMKlUvcEV64fvibRwra3qkmA6EWeJZsodvFjsO8j0Lwx59lGH7Yt6VNx2+
         Mm2dXTBQ9GLq0Sbe+vuhm4X5l4d3EoITmBdA4I+/Ww4z94nAsp+SNjQY3BF0SqL6hjPL
         sRyxMmvTVVSwVpJ4fypbBzIFUNQqv1VEk/DCI1Cd0JVJMlMcRsZF5J5OnpNLu4Gj8HcL
         Nt0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVg+8nJKzJKUiI0NtGYMqNpkSJUe7TVS3wAXmOdamVfctnN2+26M4gZXj6/RFhktHd1v6cEkjJFNjryDS8hh2oE@lists.infradead.org
X-Gm-Message-State: AOJu0YxCX0Y1MwPGRNPCUJ+m6VCvCH9EBAohJJCmOWrKlKniy79Bu3LL
	zRqrF1c1WYg0sibE2aRhlWClnOcEz9B/iXp3YOOLXs5ixEKWCWnzDCfUb7KZJ40=
X-Google-Smtp-Source: AGHT+IHJoT1Kru8t2gTjCW87GFlKfRhV5K1JOlejOdWGN1XWolqFZDApbwBdxFRY5yWNwO7g4PRChA==
X-Received: by 2002:adf:f84b:0:b0:37d:321e:ef0c with SMTP id ffacd0b85a97d-380813c9f8dmr327949f8f.11.1730137229455;
        Mon, 28 Oct 2024 10:40:29 -0700 (PDT)
Received: from localhost ([2001:4091:a245:81f4:340d:1a9d:1fa6:531f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4319360c10asm116567725e9.43.2024.10.28.10.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:40:29 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 28 Oct 2024 18:38:14 +0100
Subject: [PATCH v5 8/9] arm64: dts: ti: k3-am62a-mcu: Mark mcu_mcan0/1 as
 wakeup-source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-topic-mcan-wakeup-source-v6-12-v5-8-33edc0aba629@baylibre.com>
References: <20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com>
In-Reply-To: <20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028; i=msp@baylibre.com;
 h=from:subject:message-id; bh=lb40xLu/VXrpPNedn2QOJM+HYtvP+0chbzXXKOqoOlE=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNLlz5RsODMjKeDO7+xNd8/K/zh6sOuF8nNxG6+uE2UJE
 w6vDmXh7ChlYRDjYJAVU2S5+2Hhuzq56wsi1j1yhJnDygQyhIGLUwAmkjiL4X/djwWuh178yZz3
 8avSzEPBl7SzZy/b0Xxo/oX5rNv2eHAlM/zTiZgXyNKl9DBf4bGY4gabxKBnTDWH61TWhOXLt2W
 7b+MAAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_104030_815599_A40C0D3D 
X-CRM114-Status: GOOD (  10.17  )
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
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
index 0469c766b769e46068f23e0073f951aa094c456f..06361cfd7a8ee6f2acf2d15e8106087dd0f38008 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
@@ -161,6 +161,7 @@ mcu_mcan0: can@4e08000 {
 		clocks = <&k3_clks 188 6>, <&k3_clks 188 1>;
 		clock-names = "hclk", "cclk";
 		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+		wakeup-source;
 		status = "disabled";
 	};
 
@@ -173,6 +174,7 @@ mcu_mcan1: can@4e18000 {
 		clocks = <&k3_clks 189 6>, <&k3_clks 189 1>;
 		clock-names = "hclk", "cclk";
 		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+		wakeup-source;
 		status = "disabled";
 	};
 };

-- 
2.45.2


