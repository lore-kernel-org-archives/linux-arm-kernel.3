Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB2EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 01:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkcqt7j20Cq9gXaZ++SLKIGkgWo6g4XTTxRtlvgsjns=; b=ZksetHu/I187AWtvWsLIts30SB
	chs7oLbLnjB5/bFNNK9JlyIUkgycw4FrixHtzqf8VPl46RH7/BhCtXvtZiAgp4X6yWu1UnTxCZdtH
	CQpKS5sD66GPOWI/mNz5ri4mTC3Q7253HPBYKbj9j+/vyAB2iu2s/sK/oON+A6pRLphoMhI3MnjCo
	71MSHyPYTuRR/pkxjtwEaGFPEuhvF8ujfY6NJJFNwZ8TaxmpmdOpYO6Eehv3IRB5rV3lH1PGEXkJQ
	dubdKcTNyDLC6HqhJTotz8Cr8VSI6hq9QZ/xpoPz3UozT0hgMt9rr20Ihlp8P1wSx/4+jJZwTlrqY
	s9GpNbrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rKb-00000007lxf-46Ns;
	Wed, 16 Apr 2025 01:12:49 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rA4-00000007jpc-3HTb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 01:01:58 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-47688ae873fso61440821cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 18:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765315; x=1745370115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkcqt7j20Cq9gXaZ++SLKIGkgWo6g4XTTxRtlvgsjns=;
        b=MLRzdN5ofE/Pv50eDXX0+ZTxcIZzf97e02jfkEfVsxQrc5H+BnT7/p7mLPK8nbyS6U
         Xp1T1NJS6qWg0Pix+YX7TjxL87PRgG+EzICURDg6qvvFtYu7Cqqs6ynM5csb3gs1cj2E
         QYtwRFugmS8pLJveXXmh46xtKkQkavXRjryk8naG93UrnBmTWMysrNfo7YhWoLuhd/Jt
         yEXH7UyCQknAZSi+JW6QdZ1MJiHQPo2N7c6b1eZuTQ5uvRfHcJVKFBFgn1ZGPAHfpDIc
         GjSzEpDsVeIS2X8NZLoRgI5CY61qoLdlHRWA0P4YVBK8wwXs1W/JnqlJ0UamM1sK6wSm
         Hs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765315; x=1745370115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkcqt7j20Cq9gXaZ++SLKIGkgWo6g4XTTxRtlvgsjns=;
        b=uAfY/ZvBRMPueQnnHOZ9dz0p4jxFWj87E2+LR4FWN8pO91qnyGMCAGtFQlPSC60yMM
         clWAfHF7pReYrMA2w6u0Krp8Y4RGulWwj4cV91OBcz5kf0MKuKNOcVDw5R/cnTn4ZVbj
         4+xwyxxT61OV1GyYdIEWvwSRcpQobf0vG6dv3K2lQARzxy1PE7q6gNEfdQtfH8Pp/cJv
         sL3X56G+aohNxRDBnvqKHAB2aS1ibEUVjCjHH8pMuAhR0Tpv6btbk4whCkmzZwqu44dt
         iUJ0eYK9/Dtb8oJcSao+bmBS30ebThP/EgPqUGsHh+TiO3s6jLHUqWwwuQkKEDepn621
         mm1A==
X-Gm-Message-State: AOJu0Yy2V2upgGsqQ+iFqjO269EqYVXfdLN0+oRMGdajevk4zvdl94Oi
	rFobXKCw3ZiEEYluMseCPhz2OYe0rOCCzy7meGJqExfQBkawJjby/d2Kqw==
X-Gm-Gg: ASbGncvwViMMjj08QsNXYnemX0BPIbc41gU9nfM3+35hsbmFd++kKVpBSrCGRCMPKnw
	nGAl0BulhbG9mjlzkhKiiZxo/xV4HL7lhCBqMGieXSfSyl63PkSSNBzjpv62qZtWuym76y748L2
	ubLqjR0jsrA4jGdXvsDdAg9rC5JjsHRBJEVkgEcDq5CACFYPDIvKrM7y60fbJgwTUyVnpgJqxi9
	biGKj/KrR01PnflMaBXcEbEbOs6/MPThLbSABcbMcf1EWjiz0Mx9K+HVGT7cIMU6VvvVJSy9g+C
	WzWDVhKnw0w3/IkGdgg7dUddj73Oq4SectxmLWAZooO17lBLlvznqeBCRh+Nt7e0mz5j2fTjTSD
	4B26QMY5tWlkHv9s=
X-Google-Smtp-Source: AGHT+IGL61nVIyHlwCc5yIDgO8Ggv3BrMCi7sfU9sNUu6VGxyESewGpo9fushCvrmYo/ZJTSEOUl7Q==
X-Received: by 2002:ac8:5a10:0:b0:477:6e8d:6081 with SMTP id d75a77b69052e-47ad3a04fe5mr25016551cf.3.1744765315409;
        Tue, 15 Apr 2025 18:01:55 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:01:54 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Frank.li@nxp.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 05/10] arm64: dts: imx8mn-beacon: Set SAI5 MCLK direction to output for HDMI audio
Date: Tue, 15 Apr 2025 20:01:31 -0500
Message-ID: <20250416010141.1785841-5-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_180156_830109_1F485EAF 
X-CRM114-Status: GOOD (  11.59  )
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

The HDMI bridge chip fails to generate an audio source due to the SAI5
master clock (MCLK) direction not being set to output. This prevents proper
clocking of the HDMI audio interface.

Add the `fsl,sai-mclk-direction-output` property to the SAI5 node to ensure
the MCLK is driven by the SoC, resolving the HDMI sound issue.

Fixes: 1d6880ceef43 ("arm64: dts: imx8mn-beacon: Add HDMI video with sound")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Change commit message, no active changes.

 arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts
index 1df5ceb11387..37fc5ed98d7f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts
@@ -124,6 +124,7 @@ &sai5 {
 	assigned-clock-parents = <&clk IMX8MN_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <24576000>;
 	#sound-dai-cells = <0>;
+	fsl,sai-mclk-direction-output;
 	status = "okay";
 };
 
-- 
2.48.1


