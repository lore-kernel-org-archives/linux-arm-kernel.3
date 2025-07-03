Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BEEC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 14:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yZXE37DVoxiXxny10g4j6TmPnRi4VrKuMBShdSrCbIo=; b=d2dDd4cLi6wltwIDD+TcdA4ehU
	0M7Jfz9wxxebbKnOYqhAbAV4z94AnrYOftDn7MFXjrW53la50D/zjO+rgk3uZ4w8vX357E1sHHE0q
	hlaVXvZcbhZZq4zN2ayLb+YYOP6tBbQOYV6vQHi+ABvdP9vnrsI4jsqqirFc4zvJTO7PYSFTEdl+0
	tdVYZpujLBk+gju+V6x9SRLMRl1qXCRTtZ+0KYk8R0AN4Yvgytwf65HYm/J3Rudp9UrpiJscLrB96
	8mtG4CUIFkfc74SfiYMCIBcy07v+1KKyLE4xMrO1MtmB9Cm6krpQcowJBEjcCjGc66bfHD2S+JO41
	qOslsxLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXL8n-0000000Bhr5-3JKM;
	Thu, 03 Jul 2025 14:42:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJd1-0000000BQvK-3Isu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 13:05:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563CxU8R022911;
	Thu, 3 Jul 2025 13:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=yZXE37DVoxiXxny10g4j6TmPnRi4VrKuMBShdSrCbIo=; b=BE
	PjVVzGAibofbtMKs+bP5oKZURF9V5i0L05Dq+BvheVrfeAKmevbig0jRFLs8Z66M
	DuqqPFXJqacCRj2lJVvGfAphia4B9knp9C+DmnwPhxK00wZRAe9nQt+fu27FQjC9
	3Spm20w1NexHJE7ps/u1ElLQuXm9i9Pj+6tcicgmwcEYo5LUrRQGiw0JpYdzBr8D
	c6y7ivve0uIAzDb6elZx6rKMk9cspypRf+smZWUaB3Z8aJT53yjW9YxX7NAY8aHy
	nDyNgsva8geo+I1hWP+Wb+qN13nVTcO5S1qCOsVgi3aFfZlE3esZauGWcctEZMoy
	g98XuBqNcqGZnPvDuSpw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn77hc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 13:05:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563D5DwC014391
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 13:05:13 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 06:05:09 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
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
Subject: [PATCH v8 0/2] coresight: Add label sysfs node support
Date: Thu, 3 Jul 2025 21:04:51 +0800
Message-ID: <20250703130453.4265-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDExMCBTYWx0ZWRfX1U+HfRhzbHIA
 3sbfWc71VoOW2b7fN/Exd84W5kQUfgo8/+kMhE6JmGcWWuH1w5QIWQRe2aocMNhLRUoa+SxtHuh
 5Ty9wZl+2VHkQBdg0L1cCIo0AjZ1DAxoWA28wu5SK8LNXff8cAxVgd6RPCSYa80ILnbqZLyC0lE
 HzyuSOTFy2pI7/jh+FFo7PlfadO04Vkj/SkaYj8uvvmfD1P0hnOvqtLxS51L3Vvd5kibHZxSpSz
 /LyWrAEnzdPBVA6WkpBzERT+OrI0ejCvW4ua8/NT6PtOraFYkr7vE2qV7+2QGVP0MjiyT9q542R
 ilERgGNkpBRfYn8VndftXuzu7ilHCJfq88i4IOKcBEU0/5HF8VeAMtLn1oQdGORUq3tJoC3+1Sp
 tBMcRVsEi6TE3RC2uj7qpCuiPuDu1SibOTQ4ZAXu+WWfTktH1MeBLoFYL//KQZsrK0v0KwfZ
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=68668010 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=3Jbm9Zxj_fdaoH2CIgQA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: hlxxP5mOk5OJ1bvOh0o7duiDq9Ddq3xv
X-Proofpoint-GUID: hlxxP5mOk5OJ1bvOh0o7duiDq9Ddq3xv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_060527_945063_B1FDD5EA 
X-CRM114-Status: UNSURE (   9.98  )
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

Change since V7:
1. Update the conflict when apply to coresight next.
2. Update the Date and version in ABI file.
V7 link: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250226121926.2687497-3-quic_jinlmao@quicinc.com/

Change since V6:
1. Update the date and verison in ABI file.

Change since V5:
1. Update the kernel version of ABI files.
2. Add link of different patch versions.
V5 link: https://patchwork.kernel.org/project/linux-arm-msm/cover/20241210122253.31926-1-quic_jinlmao@quicinc.com/

Change since V4:
1. Add label in DT and add label sysfs node for each coresight device.
V4 link: https://patchwork.kernel.org/project/linux-arm-msm/cover/20240703122340.26864-1-quic_jinlmao@quicinc.com/

Change since V3:
1. Change device-name to arm,cs-dev-name.
2. Add arm,cs-dev-name to only CTI and sources' dt-binding.
V3 link: https://patchwork.kernel.org/project/linux-arm-msm/cover/20240131082628.6288-1-quic_jinlmao@quicinc.com/

Change since V2:
1. Fix the error in coresight core.
drivers/hwtracing/coresight/coresight-core.c:1775:7: error: assigning to 'char *' from 'const char *' discards qualifiers

2. Fix the warning when run dtbinding check.
Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml: device-name: missing type definition
V2 link: https://patchwork.kernel.org/project/linux-arm-msm/cover/20240115164252.26510-1-quic_jinlmao@quicinc.com/

Change since V1:
1. Change coresight-name to device name.
2. Add the device-name in coresight dt bindings.
V1 link: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20230208110716.18321-1-quic_jinlmao@quicinc.com/#25231737

Mao Jinlong (2):
  dt-bindings: arm: Add label in the coresight components
  coresight: Add label sysfs node support

 .../testing/sysfs-bus-coresight-devices-cti   |  6 ++++
 .../sysfs-bus-coresight-devices-funnel        |  6 ++++
 .../testing/sysfs-bus-coresight-devices-tpdm  |  6 ++++
 .../bindings/arm/arm,coresight-cti.yaml       |  6 ++++
 .../arm/arm,coresight-dummy-sink.yaml         |  6 ++++
 .../arm/arm,coresight-dummy-source.yaml       |  6 ++++
 .../arm/arm,coresight-dynamic-funnel.yaml     |  6 ++++
 .../arm/arm,coresight-dynamic-replicator.yaml |  6 ++++
 .../arm/arm,coresight-static-funnel.yaml      |  6 ++++
 .../arm/arm,coresight-static-replicator.yaml  |  6 ++++
 .../bindings/arm/arm,coresight-tmc.yaml       |  6 ++++
 .../bindings/arm/qcom,coresight-tpda.yaml     |  6 ++++
 .../bindings/arm/qcom,coresight-tpdm.yaml     |  6 ++++
 drivers/hwtracing/coresight/coresight-sysfs.c | 32 +++++++++++++++++++
 14 files changed, 110 insertions(+)

-- 
2.17.1


