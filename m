Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693E1C02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 06:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQMOQZffzsMfKn3CfdTJ9UbXMyLWAPH3pYBo3aDkzCI=; b=39zPlfirM1Y2L0kekgGngN1ZNW
	uOVI1u/7ZkjthVP+hpTWSOR4B5KXqKGXmh8IgezbsH276uDhNuc0ZSUtcHbrbscf5Rax8P/LUjRRx
	zozLJyX4bwutJKyb41Ym9MYx3eRUk8PG3hkOT2fi9+iQHJwRD+yXVvAVxEEoYCnqUXg54Aa87sBdn
	EhDny9XMyISmx8MVGWVUp3bNx0Uz/VeH+AB3Ei7N1zGC70vXQYpq0xux4ouG4SEwPEdZuhu7BNZNY
	d+IzVRKGLHkuzyEyFwi3MXsIjP/uTHNsud2zo8MXk/wdPw0EFj+jMWNJmcYkK9KXPoSkmGPbzw7ZM
	TKOsbTOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgI7c-00000008Xke-3Jfq;
	Fri, 07 Feb 2025 06:45:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgI4w-00000008XDD-1h4o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 06:43:07 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5171PCdD028298;
	Fri, 7 Feb 2025 06:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qQMOQZffzsMfKn3CfdTJ9UbXMyLWAPH3pYBo3aDkzCI=; b=kUyjJGR9A2SDd9DX
	goDkkXqWt0Jbu6cFpZdPrmeOCUpP2U3CG22SAOyewBkwHpRvWhh8m6kVNhLOWwlf
	V0siUx+zSCkmEvw18+0Y/68laY7Z4d68H6ANz2VfT5o4pO/hsb2b7WqC7rF9/aCN
	G4Y65FKO3hFc1Oh5XCg0582MpfalZNjiHnK0hqXjIuLs4jo2uUpxyi8kSF0vr9xY
	uJZCpkLwsIw8GpjmsWTIOoOFc7Q2Zz087jj9RwS2oaVkAlvzG2sA6lAT5KH+F++k
	Oj/ohBt7eoEWYRN9Fph0H0jqOaNNVKq1naZ31efASO83xXQJHrlHi21HDDYuqCOR
	90mFRQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n7p7rrjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 06:42:48 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5176glYr002052
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 06:42:47 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 22:42:42 -0800
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
Subject: [PATCH v10 1/7] Coresight: Add support for new APB clock name
Date: Fri, 7 Feb 2025 14:42:07 +0800
Message-ID: <20250207064213.2314482-2-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207064213.2314482-1-quic_jiegan@quicinc.com>
References: <20250207064213.2314482-1-quic_jiegan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: u6xLoVi71VegeVr_NRxhqfq8laLAcE9p
X-Proofpoint-ORIG-GUID: u6xLoVi71VegeVr_NRxhqfq8laLAcE9p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_03,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=858
 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 clxscore=1015 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_224306_445389_93B4CC87 
X-CRM114-Status: GOOD (  12.72  )
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

Add support for new APB clock-name. If the function fails
to obtain the clock with the name "apb_pclk", it will
attempt to acquire the clock with the name "apb".

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 include/linux/coresight.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 17276965ff1d..157c4bd009a1 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -459,8 +459,11 @@ static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
 	int ret;
 
 	pclk = clk_get(dev, "apb_pclk");
-	if (IS_ERR(pclk))
-		return NULL;
+	if (IS_ERR(pclk)) {
+		pclk = clk_get(dev, "apb");
+		if (IS_ERR(pclk))
+			return NULL;
+	}
 
 	ret = clk_prepare_enable(pclk);
 	if (ret) {
-- 
2.34.1


