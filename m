Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2856C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 14:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1TC7OL6QmYBBMcwfPaJCbsNoDqxeC+lLH/AnYjZeqzk=; b=1H9kehEd7eumQUrkOGk98ECJkA
	E3UpLvTVMsQJEhhKe3h+AJuKuBeimy8QhASzqrB4+tN54zQD7vZ+WpaetUJkdlPoHRybl1sLG35g2
	zyLvgHOsEG8iRxf88td3TZ5k6BQ7+zAy2DyRhpZUx51Y4pvLSnGvVbEgfu0coQc24WtSwuy6tbq3b
	vKLAHGnhJIfMNr7fnGdkCOc31FI81HbiXxL7CalyR1pRtiLPSr8lothhyOTlX+T+UZXYYvFiP0fkN
	fqXYp7JvOceVChEhTrNCrq4bn8gGJgIQPmLBu3k6ixXUlmthJCystLwCdENTTycFvISieXcF6cNY9
	v9yvZvpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZs5I-0000000C5TQ-0Iur;
	Thu, 10 Jul 2025 14:17:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqPV-0000000Blwm-0Jol
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 12:29:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9GP9H012606;
	Thu, 10 Jul 2025 12:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1TC7OL6QmYBBMcwfPaJCbsNoDqxeC+lLH/AnYjZeqzk=; b=ndX2buqCM0ylFELs
	FOyYnQgr1d/PcE/wNsULwgbM3vi9Lb2+oT1V+R1FWreuGznoIzijUk058LTgo5Yb
	CdQQFPvjo0cuvFZ+Ep/xBA4w9ap8w7Wv0cHFEYr4cNBNuzauZnezdvFkcKIuzvoT
	M43zIR05kPD/TQxiseCwr18nPCpKik9wJknBrKWvh3HsILnGOf+QZtPPHeyDwJ4v
	hg/6dNbocWp/TXzxGqtZvYwxyOofSHeoIZu7UpTTNfIBxR/ku8Vise0U042qaS8q
	t9lYvIs3Q+504+eUJ4E2DP+/4XJax3yNTa70qv6ejF6jYhx8pGVPLe1N8KWUwjKz
	eEPDHA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucn8ehc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 12:29:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56ACTnJ9020838
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 12:29:49 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Jul 2025 05:29:44 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Thu, 10 Jul 2025 20:28:18 +0800
Subject: [PATCH v3 10/10] arm64: defconfig: Build NSS clock controller
 driver for IPQ5424
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250710-qcom_ipq5424_nsscc-v3-10-f149dc461212@quicinc.com>
References: <20250710-qcom_ipq5424_nsscc-v3-0-f149dc461212@quicinc.com>
In-Reply-To: <20250710-qcom_ipq5424_nsscc-v3-0-f149dc461212@quicinc.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Anusha Rao
	<quic_anusha@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Philipp
 Zabel" <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <quic_pavir@quicinc.com>, <quic_suruchia@quicinc.com>,
        Luo Jie
	<quic_luoj@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752150529; l=836;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=2us2rpGL9zkiRlp32RB/c3CJ+1+7vDtLGPfyKLPCbE4=;
 b=/i5R2AyHvoZMtzHjoerIZKqJOxQNoYwSiAdf3gy4YWJm38DIula2xkxFraSGcdPdFGufQhWgR
 fTRXhtMSExuBn2Wwo6uXVrGXAS/id3zEzFmUGd//sVCYQX9iD9EsKhA
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686fb23e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=ikIlBLl75NxfxiEf-eQA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: VknlAFBTCf3bG_y0vBip5fQVobo6ugMt
X-Proofpoint-ORIG-GUID: VknlAFBTCf3bG_y0vBip5fQVobo6ugMt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwNiBTYWx0ZWRfX9LIz1D+9fKm4
 0zZRFJqLT2Pe9E6x7z5z8oMEVrR2AxoW6vs5juKin3gT5mPirsaogzLYQws/+2WRGjuj8NuWs7L
 IKXJD6nzDmeHcn4aClsHhdEBtyC3orme0NIVKvtnEkYgywzeXGQRFENzp7nWg+Ngosew3lrpXq7
 ev58x9NvCaBa7YyIHJBmyb2YILOlgkiMPKhFXtceNpzY6NjsMjJ1aSUttDUkU9J3DwUxxtaPn8j
 1fKJ5owlTqABW82zBaGmg/jj7uVRHfJ4Dd/x6TKFp/4dyRaebCK4ljBsD6pz3VOr565yZ9jSfrk
 g9ZLFoalFYeZceEdmC7y1cnJ1C2AF4At6dxCv9QR7ZxbTLD+A8Zurf2wj4hDrqy6DnFoazgIRF/
 LCkNuENri9m26oVutwB4I0+8bd9ifZGNNtRs1YRn4EHx6Qwm/q4Kzz/VHsY/DDQXwN1F40mi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=809 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_052957_236468_9582D89B 
X-CRM114-Status: GOOD (  10.89  )
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

NSS clock controller is needed for supplying clocks and resets to the
networking blocks for the Ethernet functions on the IPQ5424 platforms.

All boards based on the IPQ5424 SoC will require this driver to be enabled.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f56a4ce84db8..b37addde371d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1372,6 +1372,7 @@ CONFIG_IPQ_GCC_5424=y
 CONFIG_IPQ_GCC_6018=y
 CONFIG_IPQ_GCC_8074=y
 CONFIG_IPQ_GCC_9574=y
+CONFIG_IPQ_NSSCC_5424=m
 CONFIG_IPQ_NSSCC_9574=m
 CONFIG_MSM_GCC_8916=y
 CONFIG_MSM_MMCC_8994=m

-- 
2.34.1


