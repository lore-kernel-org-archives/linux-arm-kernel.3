Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6211CC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mEQHn9Lzi2oBulHTACKkSDfVZs9ArGx5jJBjivJoH5I=; b=c+WNWQGcWUe0CVNVCD4lgwAaE0
	262+ClHz6nQUAlc+jUsaChArqLsEjvzdLqdfq0zFJuRZ0cpU7eMRLKsy4O79iZgloWPwkx4yzwO3d
	uW7MByHHbNfYj13jha9Z3hNIOr93PIkKnn8xRMujtekmX4MpGNr+3GZtwbjNCeAjIHNYe77975VCQ
	m6ypIouso4Ngt6h12kKgVO4utgisiVy+XN06oVrP6uKiwlVEP2I5gsrgGVa35WuJwTeN0jJy5V3LF
	XigYb4E+vzLpkQIkPT6q6qajEYw2Na4QuXEJ4sL1bDQYC1wURUEXHGmqG2INukaY1ARPxHingOqEX
	qCxVM3aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wlr-0000000ECV3-2RjQ;
	Thu, 24 Apr 2025 13:37:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vEc-0000000DwSo-20Gy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 11:59:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OBobnb016314;
	Thu, 24 Apr 2025 11:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mEQHn9Lzi2oBulHTACKkSD
	fVZs9ArGx5jJBjivJoH5I=; b=M7C5lWsbpIlpOklc1/gJfG2jrOnHhKAXeNW3S4
	DZEK3yukUVkNnC5J9wphQB4vEX/ZEfZJkbH+IcZbh8H5TdKAbRS192wxU0r7y1Qm
	tJaDayBWYR6hhXldlc0Rk6UZ5tHWdHjRgk3Z32F6BxOzypckWbTS/pZ8GrvfW1sw
	arOFcT7VOKxle4rA/qq70cw6jwUkksDrNvhY+WRBNQeY4wOy3PgqfeifO2czRUZ5
	KnVklvzEFvu/G/iEb7tsQ5IIbcE4F7mbIKN79a2TaohX7vEwCezFYLP/lQaQwLyD
	RCl7rr2OsmtwPSx8fjRmXbOB6nP5Z9a2wcxzJBDLa19LE+mA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0dhgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 11:59:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OBx8Ab031191
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 11:59:08 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Apr 2025 04:59:08 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/5] coresight: Add remote etm support
Date: Thu, 24 Apr 2025 04:58:49 -0700
Message-ID: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: z9PfDY0Sucy_CnnLSDvmeUUYf3qyivAk
X-Proofpoint-ORIG-GUID: z9PfDY0Sucy_CnnLSDvmeUUYf3qyivAk
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680a278d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=Kq4fDhYDckEUxlu27kcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA4MCBTYWx0ZWRfX9YHt8R0ddnxh WjUMJkio8n8emcVyeFUny77nr2AbxRKi1+vcfqJO4OdOtgmQIQz6uDDtkKoNrurZk+CnmAU/LL5 Xil4b2P4+IqTuOvnOlaST1nFzp3dhWMJr/DFEQWQYgFcVwjKUoJzWWmDMJ/vFbMdUu8vWHRX1iN
 130HtWDrG1B6Z15SNtJcdFiozXCFzEhaYnt/aQ8FaB1X5ENVfBYfTiqECAljOhbLiFcKhQ1wDdV TItOzPq/At5ytgeIZXVUnZ1IRDeWY7tol6pFNHvGWq3psAgMW9OydQetl2mT4GLInuClAyMjt/Y +ZBLtOg4N6SpKkogZ6VAq2cnOZNX+nQTMqt5kNFRwB/TeplZDWU56q/RqSgTpa1i7M6aX/QULOX
 3nCtwipAhBSibpAIny5FkRmzkhSn9nMCSwidFqqHpdbDIakY5vRs8lfHxZbennKE/gt/0xAq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_045918_520428_ECA904F3 
X-CRM114-Status: GOOD (  14.47  )
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

The system on chip (SoC) consists of main APSS(Applications processor
subsytem) and additional processors like modem, lpass. There is
coresight-etm driver for etm trace of APSS. Coresight remote etm driver
is for enabling and disabling the etm trace of remote processors.
It uses QMI interface to communicate with remote processors' software
and uses coresight framework to configure the connection from remote
etm source to TMC sinks.

Example to capture the remote etm trace:

Enable source:
echo 1 > /sys/bus/coresight/devices/tmc_etf0/enable_sink
echo 1 > /sys/bus/coresight/devices/remote_etm0/enable_source

Capture the trace:
cat /dev/tmc_etf0 > /data/remote_etm.bin

Disable source:
echo 0 > /sys/bus/coresight/devices/remote_etm0/enable_source

Changes since V4:
1. Add coresight QMI driver
2. Add coresight qmi node and qcom,qmi-id of modem-etm in msm8996 dtsi

Changes since V3:
1. Use different compatible for different remote etms in dt.
2. Get qmi instance id from the match table data in driver.

Change since V2:
1. Change qcom,inst-id to qcom,qmi-id
2. Fix the error in code for type of remote_etm_remove
3. Depend on QMI helper in Kconfig

Changes since V1:
1. Remove unused content
2. Use CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS as remote etm source type.
3. Use enabled instead of enable in driver data.
4. Validate instance id value where it's read from the DT.

Mao Jinlong (5):
  dt-bindings: arm: Add CoreSight QMI component description
  coresight: Add coresight QMI driver
  dt-bindings: arm: Add qcom,qmi-id for remote etm
  coresight: Add remote etm support
  arm64: dts: qcom: msm8996: Add coresight qmi node

 .../bindings/arm/qcom,coresight-qmi.yaml      |  65 +++++
 .../arm/qcom,coresight-remote-etm.yaml        |  10 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  11 +
 drivers/hwtracing/coresight/Kconfig           |  24 ++
 drivers/hwtracing/coresight/Makefile          |   2 +
 drivers/hwtracing/coresight/coresight-qmi.c   | 209 +++++++++++++++
 drivers/hwtracing/coresight/coresight-qmi.h   | 107 ++++++++
 .../coresight/coresight-remote-etm.c          | 252 ++++++++++++++++++
 8 files changed, 680 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml
 create mode 100644 drivers/hwtracing/coresight/coresight-qmi.c
 create mode 100644 drivers/hwtracing/coresight/coresight-qmi.h
 create mode 100644 drivers/hwtracing/coresight/coresight-remote-etm.c

-- 
2.25.1


