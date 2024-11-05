Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4DFD1269D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 12:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NIO7QJxPWoJ5mekrk8Cb+rOKsbGs5KoQoleroKLnPM0=; b=qnmtwE9Qqdm2oM/zxZXUXSFrGM
	QC/J9m3yVb9U4jBtUYdSCNhNXm1QZGxaqf/THFjCKI4eJtlUk9Y0Wdfx5CLnLYw3O2ngLwOWHkhK7
	J+0ZrqtgBX4Af+EvThhqtNLeNMKd+g5BtjlnYI3zcHxtcWdBUYpe2n1nTK1DFK0Up51CshZXhe7UH
	i8FXviVRv8xSm7mp1u+TQ/GA56h2TVVE6sZmgIKwZcfLW+cLYTkVQCR7jO3QQWwA9qj+VK1G9Dah6
	IZUXLZbOFoMmdjH43f1gYnqlYSd0wvSFo6J32afyT6+0+RDZUSleM3vSmAw8cYgvOt2MCHd2dt+dS
	HQUDXzrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Isd-0000000H12w-2O2v;
	Tue, 05 Nov 2024 12:41:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Iqu-0000000H0gS-3AyT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 12:40:10 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A59auqE027535;
	Tue, 5 Nov 2024 12:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=NIO7QJxPWoJ5mekrk8Cb+rOKsbGs5KoQoleroKLnPM0=; b=Bt
	AsYMZ1GRZe2vVIudIwYH+RHiCD+m+uZcOm4PLETLa6Lw8EFurl2FAbBgRSSsipp0
	i5YO2y9rn/aUJSPDyxYSPa3cKk2RfwWh0yuKqy18WQMLME5CeMJxqMX8Kgc34uZ6
	q8ZG2TqPi2gkmDMuv1C8QFik0MnqhA0lceL2CB/mKnCABAdYIHElchL6Ocw5FAre
	SRQDnToIu7odnlwElBRBZ9q+M1imvMx0bhV+3Dz/cEtpgmsXq2/eHKGZzWx33kjM
	jXpon87yiv27sl2moMmPrhj0wjiv7UnE7CM98xnU5w8H2E2R7Bn3C1CkLTwi+b7a
	GeZ3uFpFwFA0EG+l7IVg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd8hfjvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 12:39:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5CdxwK005378
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 12:39:59 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 04:39:56 -0800
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
Subject: [PATCH v2 0/3] Add support to configure TPDM MCMB subunit
Date: Tue, 5 Nov 2024 20:39:37 +0800
Message-ID: <20241105123940.39602-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2cG-WFxGk2XkZeBNfIlFNjADft_VvcsN
X-Proofpoint-GUID: 2cG-WFxGk2XkZeBNfIlFNjADft_VvcsN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=867 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411050097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_044008_826757_90F8DDC8 
X-CRM114-Status: GOOD (  13.62  )
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

Changes in V2:
1. Use tdpm_data->cmb instead of (tpdm_has_cmb_dataset(tpdm_data) ||
tpdm_has_mcmb_dataset(tpdm_data)) for cmb dataset support.
2. Embed mcmb_dataset struct into cmb struct.
3. Update the date and version in sysfs-bus-coresight-devices-tpdm

Mao Jinlong (1):
  coresight-tpdm: Add MCMB dataset support

Tao Zhang (2):
  coresight-tpdm: Add support to select lane
  coresight-tpdm: Add support to enable the lane for MCMB TPDM

 .../testing/sysfs-bus-coresight-devices-tpdm  |  15 +++
 drivers/hwtracing/coresight/coresight-tpda.c  |   7 +-
 drivers/hwtracing/coresight/coresight-tpdm.c  | 124 +++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tpdm.h  |  33 +++--
 4 files changed, 158 insertions(+), 21 deletions(-)

-- 
2.17.1


