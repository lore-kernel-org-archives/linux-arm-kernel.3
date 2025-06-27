Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2D7C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 12:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZLmkylB7KOiH+S7TmQ73Uz0hsqumaOTQtRl5xns8ZU=; b=3X7IBP4i/BtsSi+FfFdPt0BBha
	XschSSnaaidEqDN3QWyezJegzgmYLzmZamjYqqn53Q6BpVItS+eIoXC2wRftup8Oi2+r7mtY9+Y99
	uQpwfrTODzvRJhXHcs55nLYAM5YBfQ6Yc9D+8nU/fS74QE1pn24EKQGb8G6HzI9PTcGO/kuu/cDQq
	yRdDH9chjWsHV3ccJKhc1TMrhNgCD2WGBxumIU2UUnZ4pih/CxIiwsS1Ej5gVyXmQwgQsZGidh1ej
	hsIKtl/XDxUqE/P4bGxKHSIljsTkfgChN1ITq4mrGLoOQ/0i67unPkRqSxmtyr3yRGBcAq5q1K8MZ
	LmI9Ympg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8bU-0000000EhSq-29d2;
	Fri, 27 Jun 2025 12:54:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7v5-0000000EbU4-1FU8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 12:11:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4DEfp007832;
	Fri, 27 Jun 2025 12:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZLmkylB7KOiH+S7TmQ73Uz0hsqumaOTQtRl5xns8ZU=; b=lEu2FVGlY6q6XtCz
	UK0KXwwt9nS5DHuJrZB0l+aDYKooTIoCkjE+vpomjju9pB4WIb5HoCGVvugnVFKT
	0NVgCUiTHzgoxfOP3PmPf8ndyth6g5wyBssuLHQ5KvdOB3osZ5116Vvztz8IBWoX
	m1od8xAJtdyVwit2/yxCnx3y5rC5r2qOApXgJr9nSAiOgt7/yDrthAyg9xo7hMWU
	C5WtFJGufI5AoP0VSVUYaXVEosjcIWJopp1tXLPBv+hTkNP96nbY/fwUWJZ9sAXr
	5kYepYVDoo9U2BJg5fQybmeNoujFjynkbRyIakcni6eOQohmqi/MV3exyiknfr0N
	/c5ZRg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqw4w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 12:10:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RCAuYH028832
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 12:10:56 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Jun 2025 05:10:51 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Fri, 27 Jun 2025 20:09:24 +0800
Subject: [PATCH v2 8/8] arm64: defconfig: Build NSS clock controller driver
 for IPQ5424
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250627-qcom_ipq5424_nsscc-v2-8-8d392f65102a@quicinc.com>
References: <20250627-qcom_ipq5424_nsscc-v2-0-8d392f65102a@quicinc.com>
In-Reply-To: <20250627-qcom_ipq5424_nsscc-v2-0-8d392f65102a@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751026208; l=769;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=oHwh9VFNs4yOYKQxh4Vg0eNBHFXcnSt+CiAnYWuEvd4=;
 b=aYXJUL52NGqwzNdg/HQiNLjEnDH5q/tTQ8Pucd1V0ZYjWeOWuB+JVGr5rHAtsDQ1JdPjMRx3o
 7ySuNXYyr3JCgyaWRu4aqT+or43nLPcb1gHY4egfTs3ExMu6VNjLgg/
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ak2jR7HqSZw3Q_mAqiC2zeZrqTR20VJl
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685e8a52 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=_akgYgN2Q3wxHyBukJEA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ak2jR7HqSZw3Q_mAqiC2zeZrqTR20VJl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwMSBTYWx0ZWRfX3dyjV1XduVeZ
 /BDb8RWs7Oov9EuSXjqTCSUa8IC4GKcjIDAHh2WYLHm4lvelm1MikfalY/6C0uZXCWOnIVfdzO7
 T4kT3Rii2XUAJdILw8YAitAW09fSWd2YSs4sDq2p3zh6YQGIT44hMmfLBB3umy17/okE734kzqd
 X2ZSdM+cWu8xbsLS4L/w8Xc3tKXhFspraF6a58XsAFI8QepTQ9cGmEUmQb+5A/bv74WeFvgKekH
 3ERoaAh2Mo8LW5hgTnMiWfmzyeWRUvuWGS+tOrhgg//rXtGBHmZ8Yj1cmNBl1EafU9IfIV1eOeW
 Ky/0kJfFCynEu4S0xZDlZFyrvAyv/q3EMDhpRaJ+mo33E+QcsxRbxq8o57hpf8ozzj0KBOK6gQH
 dRgJ8QxbBVZHiVmrJK3+I7QJB8bL7/sqm7kRh/yheI7oHv0MF9y+ZK0BJCUk1m990l/EmhaA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=799 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_051103_459244_5AAAB500 
X-CRM114-Status: GOOD (  10.51  )
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

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e071f8f45607..7454221fd21a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1365,6 +1365,7 @@ CONFIG_IPQ_GCC_5424=y
 CONFIG_IPQ_GCC_6018=y
 CONFIG_IPQ_GCC_8074=y
 CONFIG_IPQ_GCC_9574=y
+CONFIG_IPQ_NSSCC_5424=m
 CONFIG_IPQ_NSSCC_9574=m
 CONFIG_MSM_GCC_8916=y
 CONFIG_MSM_MMCC_8994=m

-- 
2.34.1


