Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C93C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 10:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ty1qg4MgFp/1KipjRpIWVF3P1K5EDIoLCixxlG+pA4=; b=BApILEqQSMsdNWNciE11+ql4Qt
	yLQ/JCr9S0PDdFuGgwYbCGFDOHGOvLHMlI8JHu3g/i7dYKdP6tRmfGOgEEbbJJXysucQvpfBeXmWV
	sA/fR/vebOTlT1eErA9j4r5To51HIVUvQ02xPAzx0xBN4jdwXfdg3s4Blo0KBANDLhn4bccrCskjR
	6nhEw2H96OOObkCyLJd3qXLvIP4wXA1VLoTj7WFjyLDr0AdPborui2exZul4IsrYm3DPYWTEPU1E0
	CJxvLzxyxicf3DOkahKpKooBnztE/qQ4ENQTiGncx1rLQyd5Jt01PcPqwwEU1qQFHANpPslx5putR
	a7S75P/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoei-0000000BVOx-487s;
	Thu, 10 Jul 2025 10:37:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnPh-0000000BJmq-3Uvi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 09:17:58 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A8mJHA015336
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ty1qg4MgFp/1KipjRpIWVF3P1K5EDIoLCixxlG+pA4=; b=dmIfAR97TkwUQ7Lx
	RnPSqBd6MFiaq/ha9POQEwKOOxDLFMXwItwBfB7t+S8E+OcVlnLQQcYZtKe0ReYA
	OF9pKO366O8724350FYgb4Kwacsi5oJVnpdxufv/kGOeJrQ0mQr74g+8Bm3AaMDb
	DwiWWhHUmMys1IfijrkU/TBXVYpziQl1l3xZj9lfbp9jxbAyP8F1qak3bAR6A8he
	KCkhN/ILC08Rrng235FTL4y0eSAnGWwX49oDBo9y6mPKd8vEXGjodyjzk9RLk0st
	t8P5q33CrixLGGswukojELhulegDKWVgY2P35xajEekZ2nwErH/5Z9g/SdOFFcXi
	k6S9nA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b15945-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:17:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b31f4a9f67cso1037170a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 02:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139076; x=1752743876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ty1qg4MgFp/1KipjRpIWVF3P1K5EDIoLCixxlG+pA4=;
        b=IDjkYHajKnks/IquUbIHmccuCbt0PhJtIXmFtaN0opwlBSWdwwKPOQPIqNmdRP3s0k
         VHTmkFO60qZ50UaFoqk14UOJ5WwaudZ7IWYkSBGklUkbv51muk5ck0+OfH092bzCNqeR
         WZwWQMLCPPo2bV0e8LW1r8yYzLsuEn1HXsbVpFrExYYwou4uGqQLfkSKuscvJB3Co/yg
         kVbAujOu/l2NcX/o1awQL2RV4KszKutWKdxRyBLg7oS96187F03SBWQTvRYnZuep+JdM
         9obd09VjWmjO+PKeHcjUr5crkWKQ8wKZMPm+vo5/xEDS9YBr5Nvh0pSMW+/UD5qJA8WH
         Al/w==
X-Forwarded-Encrypted: i=1; AJvYcCVqKF8q/PtJ3DZQ73zsGGp/Wb4OTH8Cexm7vwsoRzal5qoTqdotsmUREcLQns4Y8JHhs5IgrmdJhsvFl9lH4Gao@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe0GWBuW/kVwZ586qjF37O0qJXpTGr9VOeCi5mMtA414bJ3UPD
	KpSng94T1vBUwJDsCmOVAfIXaURGbxqYvr8RN1lG/HIezGBaDDpk3vvCsS5/zs5dAYBp0gHSquE
	DXQunuOsRcS0nug0ah2BszHvS22XMPyW4Ik6MA68/srKJoZ3HIBhasddkPpeGsk5Ok5Nwqsl3BN
	XvYA==
X-Gm-Gg: ASbGnct1HCHs0rqeOoCjQP3UhjbP28nBaV/2Q+DfA2rklBNuvl7GOFpebaf/+ctQX8E
	zvzaBm4WLVCrr3IT7AGdBv6TWxTS+KIoD+gfX8L8DvKWhdqLhAhmgGCqGb2zKFNLDQ5x6ebr6/Z
	b5QG95cRXYZj8rZUnOETudbs4YNY7wOfPj5U5SUqKGEBUS2h8hE2pM1YxJv6lhE08cF8YzjQTC6
	7V2UognDz0lzo/KzajwRahIWbzaboDi+OXb39OY7KeQPr8hsWDEgnkWjrjVPnSnv6VxtoQZ2KjN
	WcPzLl+UlNhxpNbvLX8hDisjLuUGNX+vR6KaTUkJ+d8Euxm9tXxWz3gxVoY=
X-Received: by 2002:a17:902:cf10:b0:235:1706:1fe7 with SMTP id d9443c01a7336-23de47c3198mr27936315ad.4.1752139076522;
        Thu, 10 Jul 2025 02:17:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ5DuAv4hQzhi6yKoAY4RR5pKmk35nKETW7dTCDtaIHn7ZT+nH76uc5gC9jWo86sxbpSIxlw==
X-Received: by 2002:a17:902:cf10:b0:235:1706:1fe7 with SMTP id d9443c01a7336-23de47c3198mr27935715ad.4.1752139076096;
        Thu, 10 Jul 2025 02:17:56 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm14837765ad.189.2025.07.10.02.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:17:55 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:45:50 +0530
Subject: [PATCH v10 08/10] arm64: dts: qcom: sa8775p-ride: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm-psci-system_reset2-vendor-reboots-v10-8-b2d3b882be85@oss.qualcomm.com>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
In-Reply-To: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Andre Draszik <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752138982; l=1717;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=wgknhYAt4nROUs/wPHMPDduf8A/Qll4soAM+xxnL6qQ=;
 b=3xptDSMJeo3n/kz2bsmlg89oPR2D+s7/G71KUw980yLr9mXAK6CEeli4EB/FEKrVloHBfPGNw
 SkdWoG5CPJdB2Plv4VSr76tB6ulp/v0kXwZhRefVTk3eBv1h3UuMEBA
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686f8545 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=agHhT1tg99JF3qhwDn8A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfX53vFs+V6+nsC
 I2KHKiBwZsR06xkp4eluc9VmVL7Q0z9IQ05UxZ3DNA9G5D+3+73WUk3Y1kXJ/k7GFN7sUvQVLhj
 15K/voGL05eBp6IWDCcg8wXE5kjMxw33AyHKMcLe04f29CTZjso/MutclGqGZp+x/yT2cWYXQgj
 XSiBV5dPo/5tU+YO+6iSvKlJNddot5KLehnZw6k7hxwCmOoYxIQDcQH2tsO1wA1j3HsBOpPKaRo
 gYCvZVJQK1oqznwR/IAl6r69gwlq8jF0pIM1IDKbrm62l5+w2FZx9KxQjQkqxmRlhuaszodYJ9E
 adK+W3Qd5Q5k17sYQmRMC6U0gtghOuVhWGsX18JFk2vOALrTZCmCjNrGTQnQQOrhal6r6tjOUEi
 nPGobBNxVHzlDZbRkWoQkNkHEu9V0rEUpovswVfrHp4EHvFZ+5K+Q/h3QwNbBLG54AW4WC6/
X-Proofpoint-GUID: 35875CYXQlZSL4uedjyFJ-mn4TFhO1rx
X-Proofpoint-ORIG-GUID: 35875CYXQlZSL4uedjyFJ-mn4TFhO1rx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=994 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_021757_880744_71D0DBED 
X-CRM114-Status: GOOD (  15.67  )
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

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

sa8775p-ride firmware supports vendor-defined SYSTEM_RESET2 types.
Describe the reset types: "bootloader" will cause device to reboot and
stop in the bootloader's fastboot mode. "edl" will cause device to
reboot into "emergency download mode", which permits loading images via
the Firehose protocol.

Co-developed-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 63b3031cfcc15fe2cce58c0fb7502b19f058b80c..44840c37c2f102e7939f64c8eaaf8a872ba5a140 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -874,6 +874,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reset-types {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index fed34717460f060e6a9dfdd4e29ca4025c401b83..b1f151aff478dc268e3405ef5bdd85e67bc25cf4 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -622,7 +622,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


