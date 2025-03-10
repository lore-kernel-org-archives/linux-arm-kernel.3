Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6767C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 09:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s49Atmly5LVy86/6MSFzA0DMXmK+NDkq01cV3U4w3Iw=; b=ix0NjMCunaDbDA4jQL8dlEMCy0
	J46mVpMlO3oeStqpN+g2X+KxKNwRtACeimJVj/CGYC+y9ei/o740qoHRwH9QmpzUJAKxePxP18QZS
	BjPLNm7iuaZVLoqXLDB77Na3+wTvZoT2EB0cM7VLWLjX7tQEjUK6ucDflPBLRMW2NIvlQYM3L+UZ7
	QOeMw/TJz/z3znXxXHL361ikfIbrHnX7e97BmTO5FkBQaJ48gyFQrD05y6nKO60GIRHXMrW6+npB1
	GWBoXGD09oUiUxsbE12jB+Pq6Crrr+SHrzxj1dTKWIxTvby95hjLqcM19h+ltKsXJDRtWoIZyoY3D
	mgxbXzRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZCI-000000022F2-27AB;
	Mon, 10 Mar 2025 09:13:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trZ56-0000000218m-3mW9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 09:05:54 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 529Nms97013087;
	Mon, 10 Mar 2025 09:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s49Atmly5LVy86/6MSFzA0
	DMXmK+NDkq01cV3U4w3Iw=; b=oCr79E2bIhpoiEIP19MNknwEyL2wUdLwDCntAb
	s24uDs+iPVB4A/6axwfagsGWoUf/EaDxsbSG4OTwYizWIp9Zby6GypsmgzFvsMB9
	cDoeNbyQoo15c+6zDujo/9Uas2BNIJ6MkozSH29ZehZkHXa8UDEo14M8fnX/V9FH
	V1Xm5jVepfTV+BuPOEdQYJhSUIqqGavWqr1uxQtpOR+thQZazXdkwDmLiLmUdRW6
	1XJ5WBa1i2DYZUyM8lY+412w4BmFhxRmZIBBUf3atiWfOrdEg+ch1l1e0MvJS2Ga
	1MQ1Q16g8hAh/G3inJZ0bVfMrP9GhrDIaa6nG2OS1G7u3h4w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eyuc819-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 09:04:34 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52A94Xfx016957
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 09:04:33 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Mar 2025 02:04:27 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v1 0/4] coresight: ctcu: Enable byte-cntr function for TMC ETR
Date: Mon, 10 Mar 2025 17:04:03 +0800
Message-ID: <20250310090407.2069489-1-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=cbIormDM c=1 sm=1 tr=0 ts=67ceab22 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=q84l4z8eQnR1JnLPIRYA:9
X-Proofpoint-ORIG-GUID: VtgdnORooybB3KdVXiA59o_6IXutvLdR
X-Proofpoint-GUID: VtgdnORooybB3KdVXiA59o_6IXutvLdR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_03,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_020553_061878_AF3A9C14 
X-CRM114-Status: GOOD (  19.46  )
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

From: Jie Gan <jie.gan@oss.qualcomm.com>

The byte-cntr function provided by the CTCU device is used to transfer data
from the ETR buffer to the userspace. An interrupt is tiggered if the data
size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions and the read function
will read the data from the ETR buffer if the IRQ count is greater than 0.
Each successful read process will decrement the IRQ count by 1.

The byte cntr function will start when the device node is opened for reading,
and the IRQ count will reset when the byte cntr function has stopped. When
the file node is opened, the w_offset of the ETR buffer will be read and
stored in byte_cntr_data, serving as the original r_offset (indicating
where reading starts) for the byte counter function.

The work queue for the read operation will wake up once when ETR is stopped,
ensuring that the remaining data in the ETR buffer has been flushed based on
the w_offset read at the time of stopping.

The following shell commands write threshold to BYTECNTRVAL registers.

Only enable byte-cntr for ETR0:
echo 0x10000 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val

Enable byte-cntr for both ETR0 and ETR1(support both hex and decimal values):
echo 0x10000 4096 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val

Setting the BYTECNTRVAL registers to 0 disables the byte-cntr function.
Disable byte-cntr for ETR0:
echo 0 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val

Disable byte-cntr for both ETR0 and ETR1:
echo 0 0 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val

There is a minimum threshold to prevent generating too many interrupts.
The minimum threshold is 4096 bytes. The write process will fail if user try
to set the BYTECNTRVAL registers to a value less than 4096 bytes(except
for 0).

Finally, the user can read data from the ETR buffer through the byte-cntr file
nodes located under /dev, for example reads data from the ETR0 buffer:
cat /dev/byte-cntr0

Way to enable and start byte-cntr for ETR0:
echo 0x10000 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
cat /dev/byte-cntr0

Jie Gan (4):
  coresight: tmc: Introduce new APIs to get the RWP offset of ETR buffer
  dt-bindings: arm: Add an interrupt property for Coresight CTCU
  coresight: ctcu: Enable byte-cntr for TMC ETR devices
  arm64: dts: qcom: sa8775p: Add interrupts to CTCU device

 .../bindings/arm/qcom,coresight-ctcu.yaml     |  17 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   5 +
 drivers/hwtracing/coresight/Makefile          |   2 +-
 .../coresight/coresight-ctcu-byte-cntr.c      | 339 ++++++++++++++++++
 .../hwtracing/coresight/coresight-ctcu-core.c |  96 ++++-
 drivers/hwtracing/coresight/coresight-ctcu.h  |  59 ++-
 .../hwtracing/coresight/coresight-tmc-etr.c   |  45 ++-
 drivers/hwtracing/coresight/coresight-tmc.h   |   3 +
 8 files changed, 556 insertions(+), 10 deletions(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c

-- 
2.34.1


