Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79CCC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 12:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A2rjxWclf+WPEXBHSO1PTiJ94UtgJfvYGJjqmycRMCQ=; b=hOV7KxybxsqagFYDcfs3lc3tkN
	3GZmruUx/4+1cwEP8/KrvqYNQSM3VqlWftki68qIOQYiyktM4RhQHOfyCpAZlscFGwIRDHoZz1MlV
	bkKnU/yxF7SSOtK/Ze2RrdjChOdvepMEnVdD+UasNiiltqX7NBkBo0fBgmYlUIRKZ8ZsurBpQE6pW
	gK3TWiILpljjlJB0PZ4lYqx6kOMG7xUIJap5AQuWPUVvERHnAykjLMW12utDJ/o6H5pzRFwu7FW2u
	gUFmCR6LjBBMYXVvECZwggrNcaRbo1hTeOcBMVWZRgmmJIL6HQyuvBJONOphdhPRWca+Zvis4D5PN
	IqSZjQSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taD7A-00000007pPM-42Pk;
	Tue, 21 Jan 2025 12:12:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taD4d-00000007ozV-2Eco
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 12:09:41 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L8YsKd018009;
	Tue, 21 Jan 2025 12:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=A2rjxWclf+WPEXBHSO1PTi
	J94UtgJfvYGJjqmycRMCQ=; b=jYWBEdns2p3qGhvX5rFqZFbUxDuXamJ7lM5F4i
	m+51ZCgqkUMlBORRJh1WmynbtwvzfioobXu3tuG6EmUCUzV8MQQJVEyoMcrOKxCH
	n7gy6lzp7c3YgTqCV98AsUVy9N7IsgjqfwpgJS8TVAyz0URkE8gzp4hDvRZiepKt
	48lMT/cMnFuNxQq5BxLoLpBtsRRpa+3h1gs5ZjJeHiWbHNENa2rqVBQxlyEw3yG6
	USW9Wng3FXTiIHQPX0JE2bTHbUWq5WDSus85QjHV4ohcArRL0eBTS5d22aNkJ7HH
	tdSpRR2b6IvSK43/9h7b0ENqdvgSpSwKH58LXdGmaUgRHBDQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a85r8sed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 12:09:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50LC9Pwd015782
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 12:09:25 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 Jan 2025 04:09:16 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v1 0/2] Update clocks for sc7280-camss 
Date: Tue, 21 Jan 2025 17:38:59 +0530
Message-ID: <20250121120901.1841142-1-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iLj2eIVwCmQD8f6xHerIgWtpfvpRjaOq
X-Proofpoint-ORIG-GUID: iLj2eIVwCmQD8f6xHerIgWtpfvpRjaOq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_05,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=889
 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501210100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_040939_692005_463CFA67 
X-CRM114-Status: GOOD (  12.93  )
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

This one is a follow-up change for series.
https://lore.kernel.org/linux-arm-msm/20241206191900.2545069-1-quic_vikramsa@quicinc.com/
We have got comments on our dtsi change to update clock names as
- GCC_CAMERA_AHB_CLK is always enabled clock so it can be removed.
- Change clock name from gcc_cam_hf_axi to `gcc_axi_hf` for consistency.
- Add gcc_axi_sf as missing to enable it can have undefined hw behaviour.

So to handle these comments in our base series we need to update
documentaion and driver (already merged) to work with dtsi.

We are not breaking ABI here because the ABI hasn't been cemented yet as the dtsi changes are
not merged yet also there are no users for this driver as of now. 

Used following tools for the sanity check of these changes.
- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml
- make DT_CHECKER_FLAGS=-m W=1
DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml dt_binding_check
- make -j32 W=1
- ./scripts/checkpatch.pl

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Vikram Sharma (2):
  media: dt-bindings: update clocks for sc7280-camss
  media: qcom: camss: update clock names for sc7280

 .../bindings/media/qcom,sc7280-camss.yaml         | 10 +++++-----
 drivers/media/platform/qcom/camss/camss.c         | 15 ++++++++++-----
 2 files changed, 15 insertions(+), 10 deletions(-)

-- 
2.25.1


