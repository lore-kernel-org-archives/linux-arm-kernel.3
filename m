Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EFFC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 01:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8o3x+d+q5C2//4/0cnQtZkZuYSwuKh+AphADdTpHFDE=; b=k+hPl7LA2LLNeddXN/LBD1QtVM
	aR7U6iCCyaANuuzYqPsJClY/COVIFQXv/dBxS3UXq3Bvi21wmr4zxUJAwbiupWomd9ZfpA/Kd7cMN
	9Of3Hu2PB2XdhP/02NAdlDyQiXSfgUv6+872SNsHieucnwyfoIIl/Tcu5249sglNkMrmkHpR2XxPg
	cM5dxQ3hfOMFBdDULZsoc5cKUXOtkle/6eSArsvIjtypvO0a6pRyQfPdzoFuLRE6TbRo9rLOEKx2k
	0xP4W0JWO8Cbt3vk2DsRjHMJ57wYQoDBJMqyyPxqVKfrMomoUKL+AWwGEtQxtjba/mqYuYPJiCfZP
	59kP6sOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rF1-00000007l1z-2T8Q;
	Wed, 16 Apr 2025 01:07:03 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4r9y-00000007jmv-1WYY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 01:01:51 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7c5e39d1e0eso598834585a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 18:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765309; x=1745370109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8o3x+d+q5C2//4/0cnQtZkZuYSwuKh+AphADdTpHFDE=;
        b=gxR6QyzK83lW9tfEovPzbU8HQdfBQnRaZ8dCgXDrrF4eiUPIo4qNWUIG6GzPKGrcqi
         QciTGQgUYczHmc9T/QMPO0i5W//TbWcowMRPYULKAjkjLhvi3go2meCOJJkBLz05FNqj
         47LmDoT3A7kiFDPAq3sccINc77yKX351Wzm45ruTHavfkCGg5olZIkifZanJ+qSLfRdj
         23iieA3zvVmIl+HfxmGdSbIsQx2Ixm9Z3RHoLSMur6y1DsyzinLqkSpZqvyzU7R5i2e/
         b76XvebSnfsdfQ1WLs9yBTSWW2Mnl1LPPwuSy0VmIOXJ/VCLEYG2sd9X/2CQKxeHfel/
         1fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765309; x=1745370109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8o3x+d+q5C2//4/0cnQtZkZuYSwuKh+AphADdTpHFDE=;
        b=HK8FjiU1vGhyZhKJgQiuDbjASSLiWstiEMSmELmC6dbZF7kpOfavH6c5bN5cpNq7HX
         kfYZwSVIcMyyPM7fddF2IwBMtHPeBKNT4yVD7+peai/+NrSmG2aG/IacufHwmfW6ZHa5
         se6HCZVSoXG/o/gs7DX5L5IpIzfUvsjbVPO32pWE6h84mojcQh5Kc+SYlrMCxwzJKKq9
         1/6leiGlXgHW9+jerFTNq0M4MReSmuXfoHpC8QERLOERWbACGq+Z5npLrUK/TNn3gCg0
         kUh9aLgoWgUdcRzNs7LLnLO95esDl8lGS3dkEB5CZYNQL9ausjUXf0NvzMHTDCo8gIAT
         SjKw==
X-Gm-Message-State: AOJu0Yxf1H0gz44sWvDVT3ovIrnPW3KeCvyYkjFKaab2LhMZBDK3ovwi
	MphfIlaqrk14X439Ilw5GLjXkWCCmDhZ+IepSOHN4KluDw1E4MzOpLt+Jg==
X-Gm-Gg: ASbGncvZ2iJdTfYFF5njLHKfEf27eKejflKFltBVXHnZwuXuRcS2jF3A12Yt57dZRvm
	aOwRRSWs4LP8Q0uFomzG8cwjRg8S9XGTi2hbQHnrHW5rWF+Dabv9H9nOp85p6PmYTkNdKIPiEjo
	PGrGirK4xIDOyV4CPhS+dGnLaLaMZN+tdOUw3tSt3TVD9o2FKAAOXts4gmg99kWwlwBrdL6kUvl
	gbi7PtGDsLG5Mkx2fBnxM/udAxu/dGsLqU0mgIDGe5MJpnD6h5ZNjeDWACArgnQNTuXuQevAQZS
	hR+HXjqMIm4dx9AWfjNzpWbtW79BlRd520sGbsWW05SOt3dbj8ahK3mlzQb0iskJFM82dtvmiii
	VJtNZy5KRgAtlW68=
X-Google-Smtp-Source: AGHT+IH0AKG+p7mqeho6hFnJiQGk62QSOmDLzjL41pBbauOWKXT1WSK6KQ7uPvUqX7jO/stSSrNqEQ==
X-Received: by 2002:ac8:5f8d:0:b0:476:8c58:4f69 with SMTP id d75a77b69052e-47ad39fe5e3mr24329581cf.1.1744765308786;
        Tue, 15 Apr 2025 18:01:48 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:01:48 -0700 (PDT)
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
Subject: [PATCH V2 02/10] arm64: dts: imx8mn-beacon: Fix RTC capacitive load
Date: Tue, 15 Apr 2025 20:01:28 -0500
Message-ID: <20250416010141.1785841-2-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_180150_398742_E538DBEB 
X-CRM114-Status: GOOD (  10.97  )
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

Although not noticeable when used every day, the RTC appears to drift when
left to sit over time.  This is due to the capacitive load not being
properly set. Fix RTC drift by correcting the capacitive load setting
from 7000 to 12500, which matches the actual hardware configuration.

Fixes: 36ca3c8ccb53 ("arm64: dts: imx: Add Beacon i.MX8M Nano development kit")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Change commit message, no active changes.

 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
index 2a64115eebf1..bb11590473a4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
@@ -242,6 +242,7 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		quartz-load-femtofarads = <12500>;
 	};
 };
 
-- 
2.48.1


