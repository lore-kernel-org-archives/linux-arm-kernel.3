Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC97E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kERBNtWX+gVIWdJRM3C+ADzPLLP1nd04Km7skhGlVAs=; b=hmAy1LAg3VAgevtlI8ioMLCSXP
	96KSyFwaAcCE9oQXZdNJpmi9bLymcuF4KPd5vh7PX0MkpusWCy2DXvgeDbE1WaUJS1T0v48BgXRqN
	EOa9p4naKs/vk2BfnFOAbn2NUmBC8PN8VrTEJdYtmsQ1uEeHqw+VmrC1tsO+a7p5Cn4juxC2QOiSr
	kSLSvGot3WHG8Cg1QMPnKNOBCfHxREnpglyVqAOXFqJathY46M5tDqTEiQGHtcStqDd69A/32pECh
	AZSvrR8y2FQVdFGRIaa/n23ZYXG197Z4OOLLyWsWN2JnnS2vZOhXvE5au3h2xHWYMAR1E1ZEefCfu
	noA6vKkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6UC-00000004GVY-1jvp;
	Tue, 07 Jan 2025 10:06:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5SL-000000040zW-3FmQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:01:01 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50742Y96015469;
	Tue, 7 Jan 2025 09:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=kERBNtWX+gVIWdJRM3C+ADzPLLP1nd04Km7skhGlVAs=; b=ch
	GxbntCC/jNqwfAE3/nFDDlNljR8v9NWA3BcwNQc5Hz6txk6yJkjw2E+/D5IokXHc
	+NNgIzXfhmxTLQ2oCXjP4nzlKlDMr9wgYD3PRVZay4zQr/fvNXkGwRblOKbcumMl
	Q4VFJ2OIb8aAtEtj94n+gC2ziCITzgKYnCIk31nCOeouyrr/CUY0xJ5+fOFWOtEq
	kr1dkwpUy7JqpHZ0BKZIVvtokHTIPIAZplrUXK3UI4o+K3+0Lj8CnDWzMexAGN2t
	j2v53FkseYD+gQW7djYBOUFTla8hloo9sA59absDSS5mFYeP3MLlztna6cqV0MYU
	zC/bLZhvIU8CdoyY33uQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440vw60kud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 09:00:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50790mrf015384
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 09:00:48 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 Jan 2025 01:00:44 -0800
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v6 0/2] arm64: dts: qcom: sm8450: Add coresight nodes
Date: Tue, 7 Jan 2025 17:00:29 +0800
Message-ID: <20250107090031.3319-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cldEeC_rc8UCt1LsnKiiLFNDfS58PYog
X-Proofpoint-ORIG-GUID: cldEeC_rc8UCt1LsnKiiLFNDfS58PYog
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 mlxlogscore=916 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_010057_929484_D496CEDD 
X-CRM114-Status: UNSURE (   9.87  )
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

Change since V5:
1. Fix the &CPUn vs &cpun issue in device tree file.

Change since V4:
1. Use ^ete(-[0-9]+)?$ for the pattern of node name -- comments from Krzysztof Kozlowski <krzk@kernel.org>
2. Update commit message --- comments from Rob Herring <robh@kernel.org>

Change since V3:
1. Use ^ete-[0-9]+$ for the pattern of node name -- comments from Rob Herring

Change since V2:
1. Change the name in binding as 'ete'.

Change since V1:
1. Remove the pattern match of ETE node name.
2. Update the tmc-etr node name in DT.

Mao Jinlong (2):
  dt-bindings: arm: coresight: Update the pattern of ete node name
  arm64: dts: qcom: sm8450: Add coresight nodes

 .../arm/arm,embedded-trace-extension.yaml     |   6 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi          | 726 ++++++++++++++++++
 2 files changed, 729 insertions(+), 3 deletions(-)

-- 
2.17.1


