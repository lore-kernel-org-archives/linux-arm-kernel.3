Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4149C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 08:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cit3qNaFBhyClJVYY8maFQV5LaVQuv8NVExDNtVd3eE=; b=qb6jpTRIVdHEq0o09jT8mrrTs+
	v8E/CR4AgX4UVvZ0KGwZCcpPOPG5A7CDTt+XjB3F9yk0Qa5n6wq85mf3Za4ITbQirIi7nj2Wpsmgs
	nLK3K8yVj6TV3BmkTtbLGSSpUmRhWJFyhvPSDNkVsdRfOHLJ2vTeGZfxf9WdtrPOAM+dQ/DKj0TOF
	oNr0U3h6e3SdOoR/KunGSfMvkjaXDGI7rMdV3OykX0K4zklUzKBte0qPlkXZl6pPnoAj/XuoVfAU7
	wHKF9PMdam30k3SRHeNlanNkZHhGJAFfr2lMRmvMjtQqjKOFEkPDXTkTeCOyZrLBjPhcZKOQdxYeh
	NAZSqFqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8GC-00000001oSS-1O7O;
	Tue, 22 Jul 2025 08:22:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue88o-00000001mWx-30rO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 08:14:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7eClo010559;
	Tue, 22 Jul 2025 08:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Cit3qNaFBhyClJVYY8maFQ
	V5LaVQuv8NVExDNtVd3eE=; b=Uo6jUbtGl2ENSB0wo/dx4QazPl9VfcBZxM9uY1
	n9RgVG0OfR0/6hP/wcbL4S5QsnuX7UvJsX4fFbnTEQ1bPsUXfnjaobRXL32+BBii
	SeTo8vP1WK2FyFrjktpl4S+r1q9Czam/eSXe7Camb3JugsdsQWffEpjJfpeBKDKQ
	Eixfoeowjs9KA+7oTT7zQ7tvXKYa+jvug03WT125j/5//0i0UJOL30aRzp4IgbPZ
	ZKE7MwJNU43Zm2F6MddOWDn4sTdkCRiuLNXwgcYkchOHBBD2PP8ZULbAVFUHTYPJ
	lol/+XkQLHsE0tN/gyBcArRGQZQBjiHdWSww9fGPkUdPuOXw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480459q617-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 08:14:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56M8EH5Y018840
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 08:14:17 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 22 Jul 2025 01:14:17 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v3 0/2] Add Qualcomm extended CTI support 
Date: Tue, 22 Jul 2025 01:14:03 -0700
Message-ID: <20250722081405.2947294-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: G70P_n4C_ApmawawMerbJv1ni4tPAGmE
X-Authority-Analysis: v=2.4 cv=fdyty1QF c=1 sm=1 tr=0 ts=687f485a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=NlEFJK3W8fm6xuedzVAA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: G70P_n4C_ApmawawMerbJv1ni4tPAGmE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA2NyBTYWx0ZWRfXwBRdeZS4m+c4
 3GTot5i3A/dsZaLnGm9aQjhlK2wemazxQOXckkt5TiJIAngsPtyCpIs2UL6H2Exl7xEVLy/whgd
 5PEvXTFkjLpwXP7q40mfSmbc4TAI9drgCGZruTwlcEYddMZxYm1nnOp3BwjQEcYayYp1I7lGRi0
 L7LYI2SACdvqsc5Js/tN9CGTEcmFkut2iFT5q+rkThfneXmU/5fbXW0q0M1ZIKd6E/QdsVYx8dI
 IkEprIJwsqFosycW9PmVv3Ws0ezrikBy4pFXu8Z++tzdOyf0eWYtnkCWMkPJN3IMe1EXoYVF0I6
 2JRVcF+DMEEGzqtyblZ5eAbntLpnXWP73Y/jl3WcM1fnSsNAkseupf1Ijk5VrXcDAD4Dv6eOaPU
 jFFCmU3x6bcrwsH00JBlk6CM++7fGAfviPdvNQM6yiDrV5+L7Y5i1wgis7ul6rS7dxa5+A+H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_011426_764331_1D84D3D5 
X-CRM114-Status: GOOD (  12.73  )
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

The QCOM extended CTI is a heavily parameterized version of ARM’s CSCTI.
It allows a debugger to send to trigger events to a processor or to send
a trigger event to one or more processors when a trigger event occurs on
another processor on the same SoC, or even between SoCs.

QCOM extended CTI supports up to 128 triggers. And some of the register
offsets are changed.

The commands to configure CTI triggers are the same as ARM's CTI.

Changes in v3:
1. Rename is_extended_cti() to of_is_extended_cti().
2. Add the missing 'i' when write the CTI trigger registers.
3. Convert the multi-line output in sysfs to single line.
4. Initialize offset arrays using designated initializer.
Link to V2 - https://lore.kernel.org/all/20250429071841.1158315-3-quic_jinlmao@quicinc.com/

Changes in V2:
1. Add enum for compatible items.
2. Move offset arrays to coresight-cti-core

Yingchao Deng (2):
  dt-bindings: arm: Add Qualcomm extended CTI
  coresight: cti: Add Qualcomm extended CTI support

 .../bindings/arm/arm,coresight-cti.yaml       |   4 +-
 .../hwtracing/coresight/coresight-cti-core.c  | 127 +++++++++++++----
 .../coresight/coresight-cti-platform.c        |  16 ++-
 .../hwtracing/coresight/coresight-cti-sysfs.c | 128 ++++++++++++++----
 drivers/hwtracing/coresight/coresight-cti.h   |  75 +++++-----
 5 files changed, 248 insertions(+), 102 deletions(-)

-- 
2.25.1


