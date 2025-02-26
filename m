Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123A7C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 06:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q6KRKhgiFSyppJoyuQD2m7H324VXci25W2Tl1Ha42rg=; b=2UERvOSF3OVgAM5vVnN9BucRiN
	FCkJuYaWZV0iTEXdFyXHo7bMA4SO5aGSDprzzGFEePtnE5TLgyfFR+zvpqeQEAsZJiGr0HHc64vRg
	XFKNYy8saKvTpjxnu1AXE9QIaE0PRLyA8Nzy32qEbhOc9mq5w2bnk4I0mbKaXEQcB0Af71VdjJza6
	uaoc8XB16Muh8b5QKrW3BQNIOdNKnQJ9qQREq02y+dQ2zs0OQ7SNaXzQIQ7DeS838RtlKq5Gox4/A
	2gH6YrM0TC2fNnNndw5ik9lMrV2XyyhoFkLoEfOaSQiLaLtySr8Xlsj9/wT1nLZyFjbSd6BIH5JfI
	5tivhihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnBCE-00000002aTV-30mX;
	Wed, 26 Feb 2025 06:47:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnB5u-00000002Z7Z-2T8i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 06:40:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMX2Nh011930;
	Wed, 26 Feb 2025 06:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q6KRKhgiFSyppJoyuQD2m7
	H324VXci25W2Tl1Ha42rg=; b=KwSTyPY8oBBR1eK6gwSJGqHwV8neRtiv+HN/x8
	ze7/jZS0P4bG0SiSqrRBmW51ptRnxuTmxbWctwXC8E6cQzXxkzQo7zZWX0VzFLVN
	7vB4hUzDEXqE9wJoY2N9yDUQz0wqoBsbCBSsq/RNJV4c4dRMHevbEgiJcN7Yl+DX
	NaJl9vkbcf7qJT+zabJdj6KB5J/J5HDZBLL7npox9cDzhXYHbPc+BBmisEHsPzCp
	5pEJ2sn9VZTwlop+IJ/0JaHWkU+dynUUlOeWseOOmN97jbjSzWwWxCKFjV7LyjmZ
	wMv7gBrLJBA40z5PrhSCZkbnxSQQfs/FqKl1BAumOitBqVnQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prk90hm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 06:40:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51Q6eQpA016207
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 06:40:26 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Feb 2025 22:40:26 -0800
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v4 0/3] Add support to configure TPDM MCMB subunit
Date: Tue, 25 Feb 2025 22:40:05 -0800
Message-ID: <20250226064008.2531037-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oJezr4Xre9TLScOU74gDakWWLUZPp_ZB
X-Proofpoint-ORIG-GUID: oJezr4Xre9TLScOU74gDakWWLUZPp_ZB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=832 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_224034_780726_CB2E8749 
X-CRM114-Status: GOOD (  12.43  )
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

Introduction of TPDM MCMB(Multi-lane Continuous Multi Bit) subunit
MCMB (Multi-lane CMB) is a special form of CMB dataset type. MCMB
subunit has the same number and usage of registers as CMB subunit.
Just like the CMB subunit, the MCMB subunit must be configured prior
to enablement. This series adds support for TPDM to configure the
MCMB subunit.

Once this series patches are applied properly, the new tpdm nodes for
should be observed at the tpdm path /sys/bus/coresight/devices/tpdm*
which supports MCMB subunit. All sysfs files of CMB subunit TPDM are
included in MCMB subunit TPDM. On this basis, MCMB subunit TPDM will
have new sysfs files to select and enable the lane.

Changes in V4:
1. Update the date and kernel verison in ABI file.
2. Update the year of copyright. 

Changes in V3:
1. Update the date in ABI file.
2. Remove the unrelated change.
3. Correct typo.
4. Move the CMB_CR related definitions together.

Changes in V2:
1. Use tdpm_data->cmb instead of (tpdm_has_cmb_dataset(tpdm_data) ||
tpdm_has_mcmb_dataset(tpdm_data)) for cmb dataset support.
2. Embed mcmb_dataset struct into cmb struct.
3. Update the date and version in sysfs-bus-coresight-devices-tpdm
Link: https://patchwork.kernel.org/project/linux-arm-msm/patch/20241105123940.39602-4-quic_jinlmao@quicinc.com/

Mao Jinlong (1):
  coresight-tpdm: Add MCMB dataset support

Tao Zhang (2):
  coresight-tpdm: Add support to select lane
  coresight-tpdm: Add support to enable the lane for MCMB TPDM

 .../testing/sysfs-bus-coresight-devices-tpdm  |  15 +++
 drivers/hwtracing/coresight/coresight-tpda.c  |   7 +-
 drivers/hwtracing/coresight/coresight-tpdm.c  | 120 +++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tpdm.h  |  33 +++--
 4 files changed, 155 insertions(+), 20 deletions(-)

-- 
2.17.1


