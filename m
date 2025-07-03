Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DE9C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYPU+QrHu7GztEOPs6vHQ6hfFFnPNE06a3D5RQIIWjA=; b=qZrmAdshfX1xCZSjfz6tI1q1Qm
	EMPkhrhg6iUHjDU/ZYdI5kRUd6+kIRVdXPLXyzw/lEr0pNB3mq4GEj3HdulRrWtp4HJ7JCCWU8YiY
	ddExnPr716/1jh58SHGQtl2dd8k19DDqmO/Oxs2e7k5a2gr/tLkZl9aSdCoNPMsvmNbA79SpksI/h
	Y7pFNTcNzaK9GBivZWzrtcgaD0SNK1Olshn6qXk1ZyYGbM3XDFmJpqO5QrHjXjfXe8AI6VL92dzKj
	PtcZMPeY7vcBS4I+5qKawXs46oF8kaUrE5cEcAQdEb8hjxbIs+1DXPOkVqArWXLXj5mln//vyGlKm
	3ctCIy7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXS4f-0000000CgCd-0Rnj;
	Thu, 03 Jul 2025 22:06:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNcL-0000000C7Hq-04Tk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 17:21:02 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563GDdtX030091;
	Thu, 3 Jul 2025 17:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GYPU+QrHu7GztEOPs6vHQ6hfFFnPNE06a3D5RQIIWjA=; b=ib0J3V6ZY9Jg0PcQ
	acvfsXbFvAUj44Sg0kxGL3iK04CyRNNwutigcHnz0jW1+qMCbZKXjzshwBRuqtma
	jEpetSrKL72lQFguL4AtEaok+7P5rQao2SMxTB/h84vEopTHt98GvC4td4DrFFsE
	W20nbWCmMXeVzB6Vr9a+uSaWaTvIlRCs1IqtzHZKxrwuF/N35Ukb4rpKdS4Vo8OY
	0dPPfDDDoI0VQndbN3TKIhdoeqw+GHr6gS31MQcid+7Kx/ixdD+2C6pIsIR0oWdN
	8tMnqMhIwVsYDL/rnR7DyiA7IH906YuNC3BWvaXsdAI8C5ho9FSPJ+q2BMwyA7mD
	f3gqOw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn7wf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 17:20:54 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563HKrgC028766
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 17:20:53 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 10:20:47 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <quic_svankada@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 9/9] media: qcom: camss: Enumerate resources for SA8775P
Date: Thu, 3 Jul 2025 22:49:38 +0530
Message-ID: <20250703171938.3606998-10-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE0MyBTYWx0ZWRfX2eZwezeml638
 bI3JRKvDtufWnNWyvjvEA9zP1nshBm9d1gnKTWG4Tj0GQaxyYz8kYi8TefOBApeuF+/tOWnGhaR
 ToffxlBeF0d3ZyD75OuNzYd1EVWYcmfKNDghy32X29AU8cG0iEeZu+fG8B2mdsKOhZbIzmxrARL
 FveTBiZMfTn3PyjuyKyGX7by9CP/Z3sQbdJFiu0dMW8NG5aHfKG2wLXmWuyuEisSMantkjovOTM
 lQbwFDxiUGkP3ggdXYbOhK7D46rRMz5lwP4hd03N6jvIv/QRtjNjxX+hoXwJmyY4PXHII7ecNZw
 ImR85BCnpnS2KvkRqcmoM6uwwxZ92j3TyrYHkmpnMb45rThWGzRiGOMSyKJhy7qd98B+UNTp5Rn
 +yU6kuHhZOwfvdJ4WBenClhaFugbuiVOpvcljtcxZLvwtQx5n9ByzrmZhTfhS760gBGUOFEK
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=6866bbf6 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=SWFg1dtF3-VgytXPzhIA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 24654YBo-TEG_Vfg8g132KMET8klpd8z
X-Proofpoint-GUID: 24654YBo-TEG_Vfg8g132KMET8klpd8z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_102101_173847_A81F34D8 
X-CRM114-Status: GOOD (  10.73  )
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

Enumerate csiphy, csid and vfe resources for SA8775P.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 3a11c0a98eb1..b6e80088d1df 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4185,7 +4185,14 @@ static const struct camss_resources msm8996_resources = {
 static const struct camss_resources sa8775p_resources = {
 	.version = CAMSS_8775P,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_8775p,
+	.csid_res = csid_res_8775p,
+	.csid_wrapper_res = &csid_wrapper_res_sa8775p,
+	.vfe_res = vfe_res_8775p,
 	.icc_res = icc_res_sa8775p,
+	.csiphy_num = ARRAY_SIZE(csiphy_res_8775p),
+	.csid_num = ARRAY_SIZE(csid_res_8775p),
+	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
 	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
 	.link_entities = camss_link_entities
 };
-- 
2.25.1


