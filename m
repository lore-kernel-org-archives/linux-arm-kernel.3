Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA82C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 19:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FHPrpo9d42nRJm72Dq1MnICc6IUuyfQPRBp7KXTIMQ4=; b=SNUBF5Avro36J1XXKmMgWTyz3T
	ZjR/rIJ+L08MsHV2RbbscJ1lrvxoOX8VfMUVPIUBMXaQHHy6C1VYOkxnqyZKN+IrhxtaKh+QIgO0M
	wZlxOi3xrvrModjBu3jxHGCXt3B0e1U1tfBAF4a91CXpzA93S93USkOydvBeewtZkrEh8Ns3CFL5G
	oiAww0r0k8ctZC1Haw8X40Ge1WeANxSHv3jZXvgM+ohIDcm73xwA5r48T5h8br05RITtlAepoMp9o
	mOeVdjnV9BEMjtRTXJvylQDnnxdc1GE3i4ZapEY0a5AGxUUsGjGD59JydAYDx7OqH3BKOIC22vADM
	oP5t0+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9h6-0000000HNXb-3faT;
	Fri, 13 Jun 2025 19:04:04 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7NC-0000000H42b-2Dw2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 16:35:23 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3138b2f0249so2224040a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 09:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749832521; x=1750437321; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FHPrpo9d42nRJm72Dq1MnICc6IUuyfQPRBp7KXTIMQ4=;
        b=JW5GKALwdD48TwCqJkJQGTv/uCWlYztmmdbLhTpYnaJV0zn1Mj1iMirL0JVfQ9i71n
         BQjHV5w4+22ipfz25MDPNhwMsu2fettHeiZi1VCz9R6nON1taHfLNtoaPom8xhmb25jx
         M79g6qHghWUzWKm9uI0Rr4dp3LmqEyjg6uNGv5NTAEOiCy+dyGrFLEXCPG4gT4RPYs0J
         jlr2koN2XZxjcHc0iByfLlt3C/9AyjXh1LmIy1Mccb3vvV11GLv0xF2CZp0ICQTcBYXn
         O50AZXDPH2HDJEoneFP3fwykD3Uvy7uL2AyVRMdHAig5AF8ymAmALE4CF0ShniLgQPQT
         b1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749832521; x=1750437321;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHPrpo9d42nRJm72Dq1MnICc6IUuyfQPRBp7KXTIMQ4=;
        b=XiuJ1Oan/7VIdZGwVcFTrayljqm1pHItu2G1r+NdP4u4rSTwcq60abG7s7S5flkT39
         oLXNMFTTu8lZARn1B4fnrG3KeeFw89U+RCLh1eGH64ltmfADhtGErdPWDgRviM/ev6uu
         ODJR/5U6VMJwCJm+7a6nVaWQQrjnR2wEtMWQHQZzTkKQ/SoDeilLuq97UEn0TbcSWgvZ
         gFCcfYnrxgJxf7qB2wxgD2ud8fM7sPWq1rv9P4P0SndBjM6VOYB0Q9u6+g48gQVwddHc
         1QKvcL1gRKUVcjplUnhRJKU1VrKK7Vivb5sH8CLO187hZ86vlOxQ+DIOt5kOHBxI0m/x
         ZZMg==
X-Forwarded-Encrypted: i=1; AJvYcCVU3pfGaJL2QC3Ag1f3zriCeb0KhABReqShAb5WoyfWiQWt36umf28lLwVrYK4X+2UQEhCuNMXEaTNhT8l3ECEg@lists.infradead.org
X-Gm-Message-State: AOJu0YwZh+QcYdp7tRJeThfSILdl5XT5HQrCXSdYfnzG32Rz4g5AD61U
	nHo2kXttsdd8iBPxMQgW6ZIRjkGzxtVGJFbTNRKGzrHQehObXFB0Z4nH
X-Gm-Gg: ASbGncurSfZz2ngVlGo5RDgWus2tPO08V1uol3c650gAITqlJDA31OR2s7KKTzakV+w
	iBdnmQRo3dzl9nHvPpBZ9JA6YBHs58jwhj/7uwnPes/5lPjefGFYlIOiQcICAvC+Ur8we/NqAYU
	7ICnG2zfFDzM8BiP9Am1EvsBvpkISLrndN4mi9PlSbPm5R1J49k5S4/QkUckQ2P0n6XC5fZn3Ci
	66w/iNhr+NVgI1qWNbG8SifilP8l7cR/d6RP7HItGzHHE7hgLj6ZKFNqEPm0RtcNNBOdf7JO9oh
	I85cCCkIE9025881w4gON0j8th5Ls8bquQsowZG96KsDm7Dzj6kEh5nPvFX1Y3XLM7/iDWTdB+W
	4l64Mq+6hC2DZxqo2og2u
X-Google-Smtp-Source: AGHT+IGIuAqQa292qV7dqgToWK54149pBTrBaPodmpn2s350eBZtY87Pv6smrPbvL/pWn7OY37TTsA==
X-Received: by 2002:a17:90b:1c04:b0:30a:4874:5397 with SMTP id 98e67ed59e1d1-313f1ca7f9cmr519630a91.9.1749832521202;
        Fri, 13 Jun 2025 09:35:21 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b5a85dsm3568672a91.38.2025.06.13.09.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 09:35:20 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Fri, 13 Jun 2025 13:35:04 -0300
Subject: [PATCH] arm64: dts: freescale: imx8mp-toradex-smarc: add fan
 cooling levels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250613-tdx-smarc-imx8mp-fan-cooling-level-v1-1-59aae8fee2db@toradex.com>
X-B4-Tracking: v=1; b=H4sIADdTTGgC/x3NTQqDMBBA4avIrB3Q1KTqVUoXMRntQH4kKRIQ7
 25w+W3eOyFTYsowNyckOjhzDBV924D56bARsq0G0QnZqf6Ff1swe50Msi+j33HVAU2MjsOGjg5
 yuKi3UFKTMMMENbQnWrk8k8/3um7Lrur0dAAAAA==
X-Change-ID: 20250613-tdx-smarc-imx8mp-fan-cooling-level-b67265ae2c49
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_093522_570517_78CEA198 
X-CRM114-Status: UNSURE (   9.41  )
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

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

The fan controller on this board cannot work in automatic mode, and
requires software control, the reason is that it has no temperature
sensor connected.

Given that this board is a development kit and does not have any
specific fan, add a default single cooling level that would enable the
fan to spin with a 100% duty cycle, enabling a safe default.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index 55b8c5c14fb4f3e7407243760ac01b0aca0dacf5..5f233304cea747d3f04a748265f96696668c9d6b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -213,6 +213,7 @@ fan_controller: fan@18 {
 		#pwm-cells = <2>;
 
 		fan {
+			cooling-levels = <255>;
 			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
 		};
 	};

---
base-commit: 1a2ad59da68dd294f994efbf68c5d671f6b42fad
change-id: 20250613-tdx-smarc-imx8mp-fan-cooling-level-b67265ae2c49

Best regards,
-- 
João Paulo Gonçalves <joao.goncalves@toradex.com>


