Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC29FC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 03:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RG1AnyOxKmwDUpZcPc2IKbNw10n9kgNLeHV6feZXOnA=; b=2D1aj0W+V/0DM+ryCi7W0zF7A3
	oycgpS02OnNbQtHoCQC65NQIj0PQPRDlZn5k8hyJ0A9xyCXtQsO2bpLuNv/1c7A1OFs6660NuzPeg
	yKQ0YQ+TcjgWwj7SwYH2YBlWkMfDwZyALPC0XIsHCUoDJ1huYN7NQ37J+/Rh0cZWj3R7m6Qe+u5Kw
	B87hgOdTmTJQprYaN81sz/23IObXwa9KdXx8f7qKmSuA2ajt6csGP7gvqiHAUS8pMT26VFsWBwO4t
	sTxGrAU9cQTQDogIahiCOgKHQlXLDM74BbO1swVq4eV4JMAast7Sa7gbC6HRaUqFBjMUpLpSKPC8d
	gjyFcCzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1towYc-0000000H4hi-2rCg;
	Mon, 03 Mar 2025 03:33:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1towVV-0000000H3wm-0UOa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 03:30:18 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 522K9vTZ010214;
	Mon, 3 Mar 2025 03:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RG1AnyOxKmwDUpZcPc2IKbNw10n9kgNLeHV6feZXOnA=; b=kfX99ROaAvHCq8zL
	TOFgUPd+bBpo5bOE1/kq9tAWDZzKyjw/WTNR5Jz4ku/CErCLFcWzLUrasW8UhKaA
	FP6en8qOVZS+R1CJYQ4Xhi3q+RlKXiOiRuQHYJNKjco2Cdy8G3HZvfH3t2E2eT+L
	SIr4ZvUR72gJWKL/27spWVoq15frZKkTchbFu6ot4op/xJgQOeVcP2zMlB2WHQcY
	VJdfkLc3iuu7zIk9DKDdLkp6YPUIzMcWWWjIVE2xT2owTmx2gksFIg3qvUIKIYA6
	ELOCZ0fFl0mQBTHIlBIh8c+t297A2WtaH6ymQmFBdSQAjEPps8iNiOANeeXCouem
	XLS0HA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453t89ufvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 03:30:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5233U2rS003747
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Mar 2025 03:30:02 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 2 Mar 2025 19:29:55 -0800
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
Subject: [PATCH v15 01/10] Coresight: Add support for new APB clock name
Date: Mon, 3 Mar 2025 11:29:22 +0800
Message-ID: <20250303032931.2500935-2-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pkmGJKp-Szt6rufct9_rysZiNn9Pwibd
X-Proofpoint-GUID: pkmGJKp-Szt6rufct9_rysZiNn9Pwibd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_01,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 mlxlogscore=880
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503030026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_193017_277952_4E5A9D03 
X-CRM114-Status: GOOD (  12.93  )
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
index 3eef4e91df3f..c7cd5886c908 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -471,8 +471,11 @@ static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
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


