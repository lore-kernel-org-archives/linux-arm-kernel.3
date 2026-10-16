Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA7CCCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 08:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m37LH0K2JtdkMATWovRMsFTjhjXw4zu/xnrVqxt3zQA=; b=Oa4YZ0PKNLEs8DC1jUNB2hqtO0
	tcpF+sb2Nfuiaukdnbsf/1B8n0bEsYcKNLFgRV123PfV1tvaqswnpfrsmLi79Jw202icdg1omnfOU
	xRh86CcEGPUWM5FtqjIRYMOv5isjLHHO3x/6OyWrD1I3RBrEfABYI2+uA1inzlig2aeDWllsR4PbH
	Qo8uLZ24W6Iyqqy7h0rrAMPF5ZQps9iABhbfKHpj9W5XBCtqM2GHF6jtulED3sKHoTCiogve5MOUE
	/TLTVTaEA0+XibDjLi98Ntld6jsFGxaiA6lt1yKzXGHB351otlcxyR3Zc6VKmEk7Mjwhw2AwawonN
	pT3bKRhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdUr-00000002Ly0-21T3;
	Fri, 16 Oct 2026 08:41:01 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdUp-00000002LwB-1WsF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 08:41:00 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48afbd2c386so3656998f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 01:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792140057; x=1792744857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m37LH0K2JtdkMATWovRMsFTjhjXw4zu/xnrVqxt3zQA=;
        b=VvAUM3Htnfp5hOo5EOnEX0/iEhD7Op0B9RNT/upJJQpiLT6CYUruu4I/cmXRNzFbay
         NxJfBedM6nVl1IgWj2invs53Zt9yLr3dWUhcptMhgwfq+ZUzTdOK1FmodhWqOdGmttwF
         bZ6CgVprdW/W4tfBdtP0s5+nc7d5ccUx84HYG+L+LAkpbntb8yKd2TN4/aGF+ThkjaWg
         6LUez7n4UHnAv10tg1Yx9votGD82Uddidy2/arWReA6Pmb77p+Q6I9yEEdalZA369Fvw
         59tcP+vpaxEqGZBlyGG/7w60k25RAte2zLKVM5kEG1Bc0PHcGhB3EalYM2jyBHh4d5qf
         52eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140057; x=1792744857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m37LH0K2JtdkMATWovRMsFTjhjXw4zu/xnrVqxt3zQA=;
        b=NlmDIg2I0F6KLQD73sAUnO2+HgZ7m/SjNx4IMzmC6uAeJskTqPYWRI7Pp5G1ioI46E
         z3wA5RqEfuOJ6Ez4ZzRzqHjq4Y/8k5KaGh3JDQBSUB5twBlx5mRFl9SnESM4E933/xJt
         FsB9EBMn6zguGKhVu13wbIeXWLc1pFbtLMOnw73l/Es8Dz0y8gks0iAQ/uCRguZkAOwj
         PM2S8DbDP6q5i8BxMS61rjGX+iF6zoWQ/2agN6q5zTovTaXx44s+w9knk9XQ7Mtn6EBQ
         Co6DdhyS7VEI2+fgCZlPl2h6zE2BXi1oZ1n1ragsx449zZkZ4FWQRdRFTiC+wlbBv672
         CZUw==
X-Forwarded-Encrypted: i=1; AKwUvBxD+wqI0ECYRWpwerCItxojF9zFeCQDgSwGKqixHyPCcFfMbpg/Ww8OVFhs5f/rWxuQ2+pIQjmiNDL4PmzAgcLJ@lists.infradead.org
X-Gm-Message-State: AFq9FYL6fplzzXAeflZAU6DxY3wb2cOX48HCMiWllbFs1HLwiQYLZQPs
	9b2gjNLsD5svVToXkD0bSXVEzhP3F95soq91Px3x5ufJfOhlsnon5lPQ
X-Gm-Gg: AYBFou2nKpX+gIY9maKqcpWGhHVkPoRNyKwMGltLc6nTld2/8kFVDTaDKYv+yRCgKPW
	DrozH6JHQLwWU/bESvlppLJkvn41uY8Q6SaRsFslxDVXvGyOZJvJqWBXDARO/ekMdjfe3otBBD1
	vEGCWo2gSuLB13tBGFEgG6qJoB27nT4r3UmokunHaWa1kKvlr0G7LOzKxUflj7Ed1NKq6RFW9zM
	+Ljua4y/WY5qtOkC1xfBV2pyVbT0Y5i9PueWO4vwuNCuAN3UC4RTVh+oGE5rV/iN7HRPvfB24hH
	ictXUyTQX3b1zBJYCG2WgHjKSKSrO4HryZ4v39UDjserYwV+kirt/TSxtA3dBgqSn6XbX7h7rUt
	+9MBBKjTKRWZZtWK/wTpl8/VgtPZmKiROQrayxAX8KskqLqV/yKQFGTjQnhEFN7GtTn6dDEUg4S
	/TSRFd1z/K5NlGEuiKimU3hCdlrq7q+z/0WIu/ZM8+gU3awTpZRhPtZc+64M9daqVU450QRDzEc
	q6mmSLUHpB472cfM/3FwkqbjlTZOhYvp+zjP/7tbb7dV3Cin80szzdUV6S8Xv3waCqlRe/7C1xX
	uRj7U4nR3/hKpbzOLpAPnw==
X-Received: by 2002:a05:6000:2912:b0:48b:5e2:52dd with SMTP id ffacd0b85a97d-48dbace9d5cmr40663215f8f.11.1792140057193;
        Fri, 16 Oct 2026 01:40:57 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm3715233f8f.45.2026.10.16.01.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:40:55 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 2/2] arm64: dts: imx8mm-var-som: Enable WM8904 DMIC input
Date: Fri, 16 Oct 2026 10:40:11 +0200
Message-ID: <9c0e289ab226609d99bee1bff4f175ff9796d8c8.1792139809.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792139809.git.stefano.r@variscite.com>
References: <cover.1792139809.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_014059_432753_4945608B 
X-CRM114-Status: GOOD (  11.14  )
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

The digital microphone data line is connected to the WM8904 IN1L pin,
but this connection is not described in the device tree.

Configure IN1L as DMICDAT1 to enable the digital microphone capture
path.

Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index d05b1ab17fed..514cc568fb71 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -348,6 +348,8 @@ wm8904: codec@1a {
 				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
 		/* GPIO1 = DMIC_CLK, don't touch others */
 		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+		/* DMIC is connected to IN1L */
+		wlf,in1l-as-dmicdat1;
 	};
 };
 
-- 
2.47.3


