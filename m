Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DB3C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 06:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+EDEHFqKkjGqN2StGIjjiSlDJT77CrFI7R+bA+Neo0=; b=BtHclHHOPStpFDfMPPcQeATsKa
	mA/OYLMekupWissG5iDJ1AMS0IH5sjWftKRcllBZQcKNhcArfd9AIsPYECtAbxxnugcpskIa0IX7u
	lPavVFAlsTl5AkztHeyGGn8SpFOXhVbbw7tXHRPtUaNasdcHx/LnZSjAabxOzN+hYUCFEeZ90Alzk
	owUaXojxWMGUzaKMU7UzR2CJ+fkhF85QsEkpuVS73ntPjgsVd2BQZxI5ss3nRbHCugaY9vg9WnlC1
	t8wMRBTal3bP6ZBbHrcYOUf8+zvtBr0TPdNd4VPMOvn3sjvskcUNMNysCtKajIDbFiC16mINdWCdN
	raziLlZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxCR-00000004lfN-1sac;
	Tue, 24 Jun 2025 06:32:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTwmh-00000004jI5-2rxQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 06:05:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKlAOT012128
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k+EDEHFqKkj
	GqN2StGIjjiSlDJT77CrFI7R+bA+Neo0=; b=AvNc3dEu9OgdoCaoXkLzUHZ9gAj
	+LCOuG+Ek+3UbSK0O5HVWs3P7rPlKIuK06AzWOuJVuurAgScQlqx+6uwgqnbYwWk
	gMR4Xg0YvkJNPtddMgm3TeNbvjoXiH+14q2Uf6qbEqctSkKZmosPcQtH5SLj0drs
	O0LriF3PPIkkbALAq/zfaliTCFIhsVaP5e0rnXM1epymcQ0kSJY+c14kkr07XjdN
	DKHO1WLB9rjEng80kwup4oarH7sKQLacQRpFDuT6fNFiziY6DgeUIVyzU6dPqmiZ
	z0ykrvfoxoYX0De1qBYD9AqxSWXh+fFM+p5YoNHi1/57VuaGvimCWj0cppg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1sfew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:05:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31bc3128fcso6453182a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 23:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745129; x=1751349929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+EDEHFqKkjGqN2StGIjjiSlDJT77CrFI7R+bA+Neo0=;
        b=qEJ55oxgcLncQ1HXKXVw7HqGe47SIREz7YwXquNnX4mt//kovZGynBfno+AJmGDg4N
         GdHjF9LY5KG6EGaci6BnzKHoOY7KISE3N19gam7VbKYo63fJKwoCzvIrnx66EdwTkVEf
         zk8zqQTooerrDAmhaHNCRGV/20h8Y577JalXdVe9HrCnL2I7nDqTjw6A6OxWd1S0p6dF
         KX/Lkp6gqe1hI1eAyej4wCWXJmFOwiLgdu/E37h9bc7aUmDbdqA0Tvr9EhmPIqltBIRG
         6wzSMHhuVzaO/DBFoF4A2PHaNL8yvf21VK+AC+vF3Rq97vBL7SzZdjtZeCjMpWAj4ZOW
         DtCw==
X-Forwarded-Encrypted: i=1; AJvYcCW03zThxswPPMVMPAVK8jyRB0dgIOctDqJCwze6IEPisNN+mxakFiZgLdxHOJojrb+OhzaYmcArbgs8msklKLJ1@lists.infradead.org
X-Gm-Message-State: AOJu0YzX7aOxq+yzTWCHsjigFfqKLPMH7FQfmOLdz7pUK+8UJVcuTFVD
	oxLY4CX2jW/vlQ1gEJ+w7e4Nssnb6UvcDHdhcZQa2Yig+igMiQE+5e4comEZtPFO8hDpLrO2Vbr
	0tGsmAa3dZc4mzxBvF34T9jZOxeFrQaBKYlqpCqe2gTgBUC3jcvClH8xaGhKBDs1T58jCVpdIOl
	DX5A==
X-Gm-Gg: ASbGnct47I3GwduzUwxy3WI7Paz3Klv6dV21IaqxuQDKO+dz1WRbAk/6wkq/jf7AKXI
	Ig5mWiALKVRw3AVbQ449+MATifeAguyAk4KgQr970iRDmpDWjxiCxfMTZLwD6wZhVnuOxB+w30k
	9SQRRnzXjh/cTHZDt+YAt8+tYw/EHYyg+nbKVUKy3BYSIzlmTJtrh2ptnuSW4nt1uJtxtlyhy4U
	IZMD7bjeP9sBlfCnY96gMIqsN2O9OSlka2wf1fjdscCB5U2UxQWGXxkJJPLPuryIjMcPGXWSEwX
	4ZQpdpSaHluKH1LBRY7yCT5ZxVb+j6zobjtgxPtxxorjDqWEYxonsTqYHOxeoMjzp0Icg3KGySQ
	TTw==
X-Received: by 2002:a17:903:18e:b0:237:7802:da30 with SMTP id d9443c01a7336-237d9a74d4amr249677085ad.31.1750745129479;
        Mon, 23 Jun 2025 23:05:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+8VGvDMCZ73CeV5AtTxJ9YBH3JlGYKE++/duwsSfivQtp9438F3OMf8ih+tv26WkZtIRFKw==
X-Received: by 2002:a17:903:18e:b0:237:7802:da30 with SMTP id d9443c01a7336-237d9a74d4amr249676745ad.31.1750745129144;
        Mon, 23 Jun 2025 23:05:29 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:05:28 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jie.gan@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 10/10] arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
Date: Tue, 24 Jun 2025 14:04:38 +0800
Message-Id: <20250624060438.7469-11-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685a402a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: knorHK0RlmRLSgVXd1c4UiSFyvpBLT1l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MSBTYWx0ZWRfX1kCeAHX0mGFe
 ZBcclWS4Wg2NhoeJ474P5JK+qfJBHB5tHOkyxGK4maxxElKC6o+QzzALS7JiVYB4Qtl/zw8coGA
 04s5I2Z2GyAE+bIJU44QOW/YK70XCj1X9sj9ownYuxP8Fifh8uQhFnh9yb5LL+RED+0x4SQs8XN
 vNf6gHQnmp5DKtc7f27PU21N4DZMqFE34wWpFz2agPhXiJhSSo14/L1XY/103KZ7mvy/JMzCF2I
 i6Vs19AwT7rRZoYcy4LGutBGiM+8C40eyQdO6e6GzgftooGib6Mr30yebhamckaOf/XTnwEYcYQ
 /SpqBDO8vYVnSF86dSB1ms/nh8HYjrRz6VL6M0TNOYe1R/EwD3s3gQr2u2essrjqq+wgahzV2pR
 xby+1MpbSk/KduXrgAAH7MdmFPbqAwZcKmUHnw3dxprUXWmTL3Chjlh/w2cYg/DPZbN4PYZE
X-Proofpoint-ORIG-GUID: knorHK0RlmRLSgVXd1c4UiSFyvpBLT1l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=870
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_230531_859691_9EF71463 
X-CRM114-Status: GOOD (  12.11  )
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

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index fed34717460f..44da72cebcf4 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2762,6 +2762,11 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "etr0",
+					  "etr1";
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.34.1


