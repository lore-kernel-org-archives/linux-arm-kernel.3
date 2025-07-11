Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5C9C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 10:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MA07l9FmpGczpoSTMauVWq0Uzfsbk2Ip1qlrg9BU980=; b=l2AIko/UtwmX2Q6ckqHbzlJG9e
	juQW13mki1z2h1GdE2B2oUu9bqG6nKHZto6E1KS/2fvEov9GBFVLCYLvHOSr2s6136C/KkEOfQ8y8
	prjfHDEjXx4Dlp8UZWWuVyo70O9gRV/FAT1RYzHHlxA4tDDcvbAD7OT9VyROPv6OANHtj2xWmFuYH
	9meB8NQDi9MUEryfQhhWSK8Oojk6nmbfcol7JC7IGbvdaw726P98xb+UZsnhNby4VoWaAVoHTeCkO
	/ZnTLtH/D5Xho94vMopL24LqMvJtD887KpCuL2vgvx3DcC2mSu5OX0c6mNpmcSzjGEHsDfNC7Zx3a
	PxlbKe7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaB7T-0000000EV65-0CvO;
	Fri, 11 Jul 2025 10:36:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAFV-0000000ELOS-0EdC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 09:40:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1X3MD012022;
	Fri, 11 Jul 2025 09:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MA07l9FmpGczpoSTMauVWq
	0Uzfsbk2Ip1qlrg9BU980=; b=AWYfEiBUFJYXUnc2auC4uhsRy8WHMCCpgARYt4
	2i8kZGnLmg67tA3TJzx7Gc2NTzO5s+S/phXo1cySuAh1U7Ea50EjKDLsbqFWrS50
	LuzSKyrWy6gZvB+Vb/JHG6798sEY0L5eyai6TXsVOzY84BYIgbD3rs0XyeCissbg
	gcT6WWTefG5RaCtYf1zOFqWyiQzcH5+wm9nv94s6iintwY28KIiorIBh6Iv1zzc0
	+hpeAwIhjfDwSztIVtCSIoW6AgtoAqZiqJqrghPYhQtmewvTQBmQmwpYGcdmZ330
	pUDFt4Up13MaetOGqeMe+oWRAKOGDcIH4Ex0wxrqeHM3/ezA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9e01v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:40:47 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56B9ek8A010472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:40:46 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 11 Jul 2025 02:40:45 -0700
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
Subject: [PATCH v6 0/5] coresight: Add remote etm support
Date: Fri, 11 Jul 2025 02:40:26 -0700
Message-ID: <20250711094031.4171091-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jG5-B5-Sc7km8FmPZAf7znFYe5jKPfuI
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=6870dc1f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=3H110R4YSZwA:10 a=Wb1JkmetP80A:10 a=07d9gI8wAAAA:8 a=COk6AnOGAAAA:8
 a=Kq4fDhYDckEUxlu27kcA:9 a=e2CUPOnPG4QKp8I52DXD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: jG5-B5-Sc7km8FmPZAf7znFYe5jKPfuI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA2OCBTYWx0ZWRfX6BEVW175zuaD
 lnxY4ctxY9TQTwS0Tc7ph0llP4eVFjuB37Ak7NmF7UBy8VD4dl4hRqXcnR4LFdbzP4fMjuXQs6z
 Z4h4AWazBoRcHy63a6evU4ATnpn/IPviSxCFHiP3Bjb9QhLOjGvR9UJzMtmec9y3GTTOwgsJtxi
 GdfWUPYO+AcoT/9/s4RhM0s1dj9JHL/SZdmIOLlh+KLoehtnBSOojVGpoIYMU4w+OUzElGGckg3
 djr/BryvYwj9JJ09IiNZf1UFEZYomf2ELbOg9VU/483SKelWsBMI4cRAw82pF0A0w3JLavCfL9B
 82kz50ZOGVQxKWEfPgzogp4IAqxzQMYuT/U/hXK9GjXrkyhcIsCusrBEAfZd7PZeAGELJ/1wJUN
 1ekGYtO0yMcJ/xC6oe6XiEiuMfaejtOMoLY4CVwq5ddJBOXA/HpQ5sYKB0FFW1av9gk9PN9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_024057_242453_979E6742 
X-CRM114-Status: GOOD (  15.46  )
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

Changes since V5:
1. Fix the warning and error when compile.
2. Add traceid for remote etm.
3. Change qcom,qmi-id tp qcom,qmi-instance-id.

Changes since V4:
1. Add coresight QMI driver
2. Add coresight qmi node and qcom,qmi-id of modem-etm in msm8996 dtsi
V5: https://lwn.net/ml/all/20250424115854.2328190-1-quic_jinlmao@quicinc.com/

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
 .../arm/qcom,coresight-remote-etm.yaml        |   9 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  11 +
 drivers/hwtracing/coresight/Kconfig           |  23 ++
 drivers/hwtracing/coresight/Makefile          |   2 +
 drivers/hwtracing/coresight/coresight-qmi.c   | 198 +++++++++++++
 drivers/hwtracing/coresight/coresight-qmi.h   | 101 +++++++
 .../coresight/coresight-remote-etm.c          | 262 ++++++++++++++++++
 8 files changed, 671 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml
 create mode 100644 drivers/hwtracing/coresight/coresight-qmi.c
 create mode 100644 drivers/hwtracing/coresight/coresight-qmi.h
 create mode 100644 drivers/hwtracing/coresight/coresight-remote-etm.c

-- 
2.25.1


