Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED093C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 12:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UX3YuH2coJK3Kbc0/Dp7wWrv+mWUT6cXY++OfYbGZsU=; b=CTZKGvVTCUQPpmKkhSBjAi/S7G
	FNS7E07JB52lSia6TAjlpGcusl7kjC5HFMmuj0Fjbkto/WVZ2LTs7zeHCCvcyPIjo7wEcp/MNmcbQ
	RLf4A48JLTs55tGrrRtGmdeHJqdsi5vhyhHJc4tsLMT1mrvkDXxnr5MK+P4s9eGHwIbBODBc+h6ph
	loB06ClWOkEU8pcCzDPAKBVPSOcbidfXRn3OcIgWf/KeOVDOAUDaVhNhSCEkchMJY1YyYxboyZGiW
	W5tFnQBhGDtpNdlzfL0YlnTPsf8Dgu0h8++2j8XeMDHZ64tsB8MAcQVznuwKV8KX7teFeOo/9YdUP
	bLxf9rcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVLx-00000007AoQ-3qXc;
	Tue, 17 Jun 2025 12:23:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRV5f-000000077r2-07MH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 12:07:00 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7ZfPb004810;
	Tue, 17 Jun 2025 12:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UX3YuH2coJK3Kbc0/Dp7wWrv+mWUT6cXY++OfYbGZsU=; b=T2NW+LZ+wwcrU319
	HV/IFBmWCY6F0i39DiDyYYB+wdRIAmZszkjZ3vPsZgUsAF5MqUR3IUTrWMU/5rdT
	NAblTsbAGG4fCETLC3X9httqad56bF1fkdFxPJw2S+hovEEq4kdK9k0LiH0TiLx1
	A3MBPb/bRi7kIrVpc3BBLyXeCchlm34hBZkQeTQNNYQBUlvhHTi3JYTQejsI7K4n
	Wl8upEVKfgqMFh02c2UmsTUuHGFkskhYaTdy85S9/VfDEnKuHs1tJR7A4wySy1TL
	m/Jwy8o+7SB1RK/vp4jQYO8CVjBbzG7mz+62I2k0KabnJOJUENiggshrGjd5xv/e
	J8x1VA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crr2aq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 12:06:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55HC6oEF001913
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 12:06:50 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Jun 2025 05:06:44 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 17 Jun 2025 20:06:32 +0800
Subject: [PATCH 1/8] dt-bindings: interconnect: Add Qualcomm IPQ5424 NSSNOC
 IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250617-qcom_ipq5424_nsscc-v1-1-4dc2d6b3cdfc@quicinc.com>
References: <20250617-qcom_ipq5424_nsscc-v1-0-4dc2d6b3cdfc@quicinc.com>
In-Reply-To: <20250617-qcom_ipq5424_nsscc-v1-0-4dc2d6b3cdfc@quicinc.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Anusha Rao <quic_anusha@quicinc.com>,
        "Richard
 Cochran" <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750161999; l=1008;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=CAJx+LDOx8JqdLevmt7vhooCxAIVeiFGGY/qLhy/pew=;
 b=ECOqOS6psuO2qI0KdoA0O+TrUnppMQSDIvSWBJAWq5v9UQgylIdFvQ2Wj3WddXnX7MV+aX9BI
 btYwl0YcWunBmN2ok0BYH6iDWz8DOinS6g46DeB7IQX3TOuhvqYN53r
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: miESH52Di3s1u8auhvIrbT8fSBQqYVSc
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=68515a5b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=h4eZJirXrH8_5HBWN60A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: miESH52Di3s1u8auhvIrbT8fSBQqYVSc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA5NiBTYWx0ZWRfX4CdU82H9YvKK
 n+VCI1muk/HM3fMYFuWPCfxEoB7ckiA7xCBi6UxZpjgDSPsiy9ILpX84vhCHHpHY9BHV6nrHTOU
 8nyQFOfZIjBGYs1s9bGblLWy2s1OlKyK7sig8qe3QK9bxRnV66N9Tpzl3RrNYk47a2cEpGbw/jY
 BO+7jRriAJg/vx9EDTYoociJhvKIGEy3tuxumsnw7lhArpww/MpDwF9KmyjdbW/WZpz/ErcRNNJ
 T6umv4e9YltBDKpk4yJcaCZDTgjlsT7lTH6p2poy+dkAmZsPnr9O9tcjNFO58HoWBxrAIJeadW7
 HrPEisLQZsMXJvmja1dvNivqKG65fqoOujG/yZtzymABidSc/eCdLQb4Olw9ef1r4MZFNwdL6Ry
 0veInaWMg7N5Yyhyf3aSCnFPhCSsjetfM5YqDd3daZJP5oIS/5Qf/nbowoECSSxeb/LEwIbY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1011
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_050659_195753_73675C2F 
X-CRM114-Status: GOOD (  10.82  )
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

Add the NSSNOC master/slave ids for Qualcomm IPQ5424 network
subsystem (NSS) hardware blocks. These will be used by the
gcc-ipq5424 driver that provides the interconnect services
by using the icc-clk framework.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 include/dt-bindings/interconnect/qcom,ipq5424.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/interconnect/qcom,ipq5424.h b/include/dt-bindings/interconnect/qcom,ipq5424.h
index a770356112ee..66cd9a9ece03 100644
--- a/include/dt-bindings/interconnect/qcom,ipq5424.h
+++ b/include/dt-bindings/interconnect/qcom,ipq5424.h
@@ -20,5 +20,11 @@
 #define SLAVE_CNOC_PCIE3		15
 #define MASTER_CNOC_USB			16
 #define SLAVE_CNOC_USB			17
+#define MASTER_NSSNOC_NSSCC		18
+#define SLAVE_NSSNOC_NSSCC		19
+#define MASTER_NSSNOC_SNOC_0		20
+#define SLAVE_NSSNOC_SNOC_0		21
+#define MASTER_NSSNOC_SNOC_1		22
+#define SLAVE_NSSNOC_SNOC_1		23
 
 #endif /* INTERCONNECT_QCOM_IPQ5424_H */

-- 
2.34.1


