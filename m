Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3194CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKWmqQzdMPqFddVCcAzQVRWG47+T57+MG8ITHFHowHo=; b=oFscNP7SP6iogKgy8k6VAlx36S
	xYvbWlA7nHysUp9oeYHTO7HlKeqOKxm9+qZtppGdxHntkhuzknjr+DhIiOEAsFl4451hj6xtMu20t
	tggLm3/5o5AQJXQNrJgGTm26bC+geLPGYUrmfFgzaoDDqk11idgygqCVP+BGLEDPPrMgeGk18aPI1
	/nylWWTIZ2IC0TCmaGhuqBpUPnpueoLVAQGGrloGphMwq9upxf2vET5TBzSCBQVdNTih5yq7birjb
	7FhMO87CCN7z0A1qI/EfVEclreK1qxHRO3zLk/5365kodmZuQCucCDCsZiLRq3cmn6317PRyq3rGT
	DJL6kT0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloHF-0000000Al6w-1o1f;
	Tue, 12 Aug 2025 12:38:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkWc-0000000AGZP-35NE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:38:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5Zu1B005328
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 08:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xKWmqQzdMPq
	FddVCcAzQVRWG47+T57+MG8ITHFHowHo=; b=hq2rRye0T9cHP5DKcQeKgSDynMa
	EIhBIA1peD1eXbwpJmswOQ/xwm6Zh/jBe9zEO6wsitSXbDaLF2ZPj6YAaV6XHiuB
	7BNumW7iEfGa9OecXDNm4hYJ9wJ62wzMuAr39Wzejii/DWm3XH1Y3FJGhaldTHJY
	QYKX4bMIJKmCSQVpwljOb9O4XamLVrunA+Po5xxKayWqvVKpC07iVF8Um6uBjhpw
	UkBkFhfak2DSsIzwQf2i4okw/zJ32SASrOuJpnR8UEyFYYT6KiSXGA8PNr8hZCb4
	pxSZ3yieZMhJr3cKjZa1/q1YNFn2llKsq5n05vE9VbKD8OcT41tqTl1xdJQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx5mcy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 08:38:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31f3b65ce07so9224275a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987909; x=1755592709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKWmqQzdMPqFddVCcAzQVRWG47+T57+MG8ITHFHowHo=;
        b=N5UzYuRYAj+cB4RCGbOX1KN/oKqVxsdwXWZxl3nsdUHcSLyp+3eBLJ9t//WdtAYSkc
         81AzJFgUzP2eRoRQ3gGgvtCtvYRFbDQNPB6ORsShjMBueA56UKPQc9VwsGWeK9b4lAEE
         9I74fjHyY5JFHG8mMDw5Pl7GLcCyMOcYtvM//OVljwLJWf1Gp6vCm5YJgAncaPWT2+o7
         Ke7tU68Fc9kAf0nfjMDvA9qsPVsku8fV7d+clE6gw/uY/+pDbS5A10XMQwP9az/qilJ2
         6fe5Yx2nxjQGNXijXSB7px2K6T6FFIzwkATHq77ypwbvGp2wLUDFFrmIvW5WtmU/rjr6
         wz3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUq96PslcsHDGmTucaHM82aUiXAENyZzLIl2rzmq+2JMBrel70DAqVpa00JLe4AeAyMsh/gBe+9L8os5ui8JIr5@lists.infradead.org
X-Gm-Message-State: AOJu0YxyIP++QLk9YIWrjcYKxqVx6tCXWwwr17qGcM2DKSaTkaJZJlHG
	uif6jwwbV0NL1cQRet0YI49ANmT+3hphdh7Xp8vvz2nTlyJZ5zTDQ9j8FvjyrI9HqkiTIlJcv8s
	miR5TycyhxXTiv9eoK1UBpu2wsysZpKN5YQFeabDrjjEJOCwYv39qBrmMAHOYvAadT37hpVTDk2
	V49g==
X-Gm-Gg: ASbGncu17xWgRLgfFXlEDBSAgjEgcKpmhW05b5PoVFBfbGQfZvuiUEI1rMkELblWaqp
	1BRf1YLsEOG+frHrX7Ykr5NO4BV2W4UrW19ADOfsUDKa7JuxcpgfKdkb4P6kLewC5pg6jm3bHYw
	37HiPMr3PgGNUQ7wm5fnIvZK4ToRcWFCPcBDN4W8Dq5ASef1f2RjqZcIsTJHv5EtXzTEjuk+Iu4
	ZbIIuAiUF9FcCzLkOSxkqhdPF48ft2hPJHA2WhI7iF4H+XZmN0KbtbypUKQfyRU/8rMoGd5tI1I
	NcAitJu/QnSSFiLrmpequnChJKTw2+fqZIvVmx6XbfI/nCh3zVPwgos4eSZRkssFkvNqRQHF/RI
	NazKUhcxo3ow7dL16Da0=
X-Received: by 2002:a17:902:ccc2:b0:240:99d8:84 with SMTP id d9443c01a7336-242fc38ac30mr39407805ad.52.1754987908694;
        Tue, 12 Aug 2025 01:38:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoUSP4uUhj7WlazCHA59ecFxrurDGloo1nWYrazR2qhQPlOy/gay3zElJWlYEMBfhndfzVmg==
X-Received: by 2002:a17:902:ccc2:b0:240:99d8:84 with SMTP id d9443c01a7336-242fc38ac30mr39407435ad.52.1754987908254;
        Tue, 12 Aug 2025 01:38:28 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-243086849b3sm1915345ad.175.2025.08.12.01.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:38:27 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 9/9] arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
Date: Tue, 12 Aug 2025 16:37:31 +0800
Message-Id: <20250812083731.549-10-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
References: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX5Qqh5bBIyZyG
 gC89aiWHX6pCUq1uWKj08tMl99zG5b32OQm+/46m377l5WMYY1+8S6ZxWWHxM0p5zXNUMjks2FA
 CieBkR+mIScBX2pi4Xm6zOFRqCwmT+fUNb3uPb86xX2yuR77J19OcZ1DN6IJTtgB2e0uTryi3IY
 67k1f+nkDBOc/BnvxpYoaMweHUzGqYB1VujQ/xt/PA/lA9Y8DzSwJKaxHb494/me5GnIhj0u+4s
 8nloIeHnNllbRTOUBAPz6sCBuRc5XRccx+HwZY+oa9osO5IgBHwpBHlAmB5dLmAmqaWctVhbJqJ
 xac6BdrwfHQmL69iznVdHMzNH3Ep3e0umW5l4WrKonNu70C1b2z3u0+PcFOdMvwI+j4xmwSik+1
 wXzzwCT7
X-Proofpoint-GUID: lD7ZOLabKiLWrtMgptfrJxoKCR5DToTg
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689afd85 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: lD7ZOLabKiLWrtMgptfrJxoKCR5DToTg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_013830_889080_DD78304F 
X-CRM114-Status: GOOD (  12.92  )
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
index 9997a29901f5..4e6684a6d38e 100644
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


