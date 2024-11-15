Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBF1D6A223
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 01:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zh7TTW8tLIxvXk1cjlASsZhsAqj2uXJLd5tfnba2ABw=; b=jOxBn7v/o/eBt6tBKG+qDY4JNF
	XfXdukVAKxB0v3Rzfqmr1THrZ+OUv/UkhzEnVCsNkVLy7M1zCJPN/ahFTxT5nzhLSkAh4/7ypKHHL
	sXPRrGYH4FEw03mBNDTFWgW02eMyw3K2Bam+peltGp0oaoaT5L3ew/JASgyKUO9lyt9LEB9CoYIKq
	XkW2s/F7kxmBXW0AWWGIX3Picx43Up5JDb3GPfTxfAuATpNG7T7CXFiLgL+1cByB6t60SqI+U7qN5
	EMxAT07gyE1PUsf6cgqaTYEoLI8Jlsc+eNsv1Si8fUaLNdupty++cay/XhdyX+BZme1vcxFGu4v2Q
	aRy1JPuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBkwz-00000001HRW-0gir;
	Fri, 15 Nov 2024 01:16:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBkw1-00000001HGH-3stT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 01:15:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEHHw9A000914;
	Fri, 15 Nov 2024 01:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zh7TTW8tLIxvXk1cjlASsZ
	hsAqj2uXJLd5tfnba2ABw=; b=BR0ya8wOwYhyS5yr9qA1PtlUHUZObw+i42OrMq
	W3uH/AHLNjGIsnx5n39SV0EeXThRSxolsdQboeUCqZW9FTtTxAoYWCCWJ02G6LKU
	3T1lXXZiYWNKLQuYPnRJ0ESrNNHI/xMEX3mfCJTi/fXVo8j3V54Him+ZeSKtnQes
	Cg+eL2tnxJWOEZvjv18POh+MxE9AL3xbGOlLKpE+kr6Ad2yqh/mrm+zlXmlvs59N
	zZNQVEx589JS9BEZd/ELBFbNgeUUMYTPaRFoS5/WbwVu4LvXxb4n+dd/zVg19akj
	eEX/9Y5X3WB7mElmk0PhqzcKEwGu/TCV8jql2gJf8ez9WjfQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w9sv4364-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 01:15:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AF1FXJj009013
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 01:15:33 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 14 Nov 2024 17:15:29 -0800
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <quic_sibis@quicinc.com>,
        <arm-scmi@vger.kernel.org>
Subject: [PATCH V5 0/2] arm_scmi: vendors: Qualcomm Generic Vendor Extensions
Date: Fri, 15 Nov 2024 06:45:13 +0530
Message-ID: <20241115011515.1313447-1-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zjtL2fq0-uBsnsOb6Yi41aMzSpjcu7mt
X-Proofpoint-GUID: zjtL2fq0-uBsnsOb6Yi41aMzSpjcu7mt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=959 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_171542_060682_76402F03 
X-CRM114-Status: GOOD (  17.78  )
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

The QCOM SCMI vendor protocol provides a generic way of exposing a
number of Qualcomm SoC specific features (like memory bus scaling)
through a mixture of pre-determined algorithm strings and param_id
pairs hosted on the SCMI controller. Introduce a client driver that
uses the memlat algorithm string hosted on QCOM SCMI Vendor Protocol
to detect memory latency workloads and control frequency/level of
the various memory buses (DDR/LLCC/DDR_QOS).

QCOM SCMI Generic Vendor protocol background:
It was found that a lot of the vendor protocol used internally was
for debug/internal development purposes that would either be super
SoC specific or had to be disabled because of some features being
fused out during production. This lead to a large number of vendor
protocol numbers being quickly consumed and were never released
either. Using a generic vendor protocol with functionality abstracted
behind algorithm strings gave us the flexibility of allowing such
functionality exist during initial development/debugging while
still being able to expose functionality like memlat once they have
matured enough. The param-ids are certainly expected to act as ABI
for algorithms strings like MEMLAT.

Thanks in advance for taking time to review the series.

V4:
* Splitting the series into vendor protocol and memlat client.
  Also the move the memlat client implementation back to RFC
  due to multiple opens.
* Use common xfer helper to avoid code duplication [Dmitry]
* Update enum documentation without duplicate enum info [Dmitry]
* Update the protol attributes doc with more information. [Cristian]

V3:
* Restructure the bindings to mimic IMX [Christian]
* Add documentation for the qcom generic vendor protocol [Christian/Sudeep]
* Pick up Rb tag and fixup/re-order elements of the vendor ops [Christian]
* Follow naming convention and folder structure used by IMX
* Add missing enum in the vendor protocol and fix documentation [Konrad]
* Add missing enum in the scmi memlat driver and fix documentation [Konrad]
* Add checks for max memory and monitor [Shivnandan]
* Fix typo from START_TIMER -> STOP_TIMER [Shivnandan]
* Make populate_physical_mask func to void [Shivnandan]
* Remove unecessary zero set [Shivnandan]
* Use __free(device node) in init_cpufreq-memfreqmap [Christian/Konrad]
* Use sdev->dev.of_node directly [Christian]
* use return dev_err_probe in multiple places [Christian]

V2:
* Drop container dvfs memlat container node. [Rob]
* Move scmi-memlat.yaml to protocol level given that a lot of vendors might end up
* using the same protocol number. [Rob]
* Replace qcom,cpulist with the standard "cpus" property. [Rob]
* Fix up compute-type/ipm-ceil required. [Rob]
* Make driver changes to the accommodate bindings changes. [Rob]
* Minor fixups in subjects/coverletter.
* Minor style fixes in dts.

V1:
* Add missing bindings for the protocol. [Konrad/Dmitry]
* Use alternate bindings. [Dmitry/Konrad]
* Rebase on top of Cristian's "SCMI multiple vendor protocol support" series. [Cristian]
* Add more documentation wherever possible. [Sudeep]
* Replace pr_err/info with it's dev equivalents.
* Mixed tabs and initialization cleanups in the memlat driver. [Konrad]
* Commit message update for the memlat driver. [Dmitry]
* Cleanups/Fixes suggested for the client driver. [Dmitry/Konrad/Cristian]
* Use opp-tables instead of memfreq-tbl. [Dmitry/Konrad]
* Detect physical cpu to deal with variants with reduced cpu count.
* Add support for DDR_QOS mem_type.



Sibi Sankar (2):
  firmware: arm_scmi: Add QCOM Generic Vendor Protocol documentation
  firmware: arm_scmi: vendors: Add QCOM SCMI Generic Extensions

 drivers/firmware/arm_scmi/Kconfig             |   1 +
 drivers/firmware/arm_scmi/Makefile            |   1 +
 .../firmware/arm_scmi/vendors/qcom/Kconfig    |  15 ++
 .../firmware/arm_scmi/vendors/qcom/Makefile   |   2 +
 .../arm_scmi/vendors/qcom/qcom-generic-ext.c  | 139 ++++++++++++
 .../arm_scmi/vendors/qcom/qcom_generic.rst    | 211 ++++++++++++++++++
 include/linux/scmi_qcom_protocol.h            |  37 +++
 7 files changed, 406 insertions(+)
 create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/Kconfig
 create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/Makefile
 create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/qcom-generic-ext.c
 create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
 create mode 100644 include/linux/scmi_qcom_protocol.h

-- 
2.34.1


