Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF6FC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 09:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQMOQZffzsMfKn3CfdTJ9UbXMyLWAPH3pYBo3aDkzCI=; b=SAfTta6eFJWoxyasXFRaz97+uk
	jj79a1J6ORvEdcZ6+/OakiqI2nfzUpnhwgMOXwmYmmoJSFTWoQqSk11hdWkvK/8sQnLG5Vy6X5mt0
	udx5NiltOQFHWJcOgb+cJdMzeJNiQ/6CNoDVgzywxAYyoh0tlv3WqNqHgNuiLBFZu0nXWz2yepkor
	KCKRhBxr62JIiUQRbJlwASaCh5tjCocTEfgL8Sdne8rswX+2rzl5ELCC7P/LNWvE22iPeg4LDs04I
	lZ3GQ78RWNa8CpTBRkydK6BEIwmmVMzmpNzCRVMLaVJF8w7uu2ZAPIgTKV1+w0JfFOmp5GlTedAPT
	nhCskkEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxiG-00000003zF0-1pWP;
	Mon, 17 Feb 2025 09:46:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxT5-00000003w3n-32jP
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Feb 2025 09:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qQMOQZffzsMfKn3CfdTJ9UbXMyLWAPH3pYBo3aDkzCI=; b=if6XQ2iOajRN5epSumiAtQboeG
	L9PjSpacySjyEMbfWliQ0QbQR3hWqshXD2SBhOddY67v5WJE+4ZlQeSyVxu18kC1uu+Uys05xbYi7
	qVwuCljJJvegQXNh1EkScVdVUmunSoUBFLbYOdQVT3hE+Jr863Xlao7IypF+yqoXe9ji+34Pdyci9
	r/vEwkpbcgGpzFn6nvQfO9XWPc1ckU1ULow40VdXEOOt6z9dduPzXfTz3+EA1UXqHV95v8XRuZq/x
	h2JkEwCk96eKpbkiUtT/XBvZIjUycEubUnSBXMSkv5JV6vXZGAGOhEuCIE2KxAvta0gXrKm8MsuEg
	QxN1FipQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxT2-00000001kx3-3dK0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 09:31:10 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H037iS016856;
	Mon, 17 Feb 2025 09:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qQMOQZffzsMfKn3CfdTJ9UbXMyLWAPH3pYBo3aDkzCI=; b=IN+woOZvZ4riNJDc
	0ISQxdd339uG0ztevjE4ygi9+lU2ovL9ngNjZqW9bmCaLw2cZkO5J29L6gsc31Sd
	+xSKV0ulQxMs1yeRGceWMSf14qpFzrTJ6sUybZkvYofq1oLmyRo5u9pWLeuwQCpz
	Om3YrMJixT7qKi69REsEVl7Vh/doHydaiyhkfKW7hFj0e1r45yRgliDrXwvQ8rL7
	44VUYUhJmQWuFx4+h8wMhGnoOmkqwFDTsIQPhYXt/dw3SLKI7KIQYDTqIjam3Oup
	5xxE5SGyAXXVanMo+bsnGYaof5ipM4LhCQKUpPOIlKCRbWN54xi8h8JtFqNpXfBX
	OboE2A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7us5pu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 09:30:53 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51H9UqSB023604
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 09:30:52 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Feb 2025 01:30:47 -0800
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
Subject: [PATCH v12 1/7] Coresight: Add support for new APB clock name
Date: Mon, 17 Feb 2025 17:30:18 +0800
Message-ID: <20250217093024.1133096-2-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217093024.1133096-1-quic_jiegan@quicinc.com>
References: <20250217093024.1133096-1-quic_jiegan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8yxdoxNEi5Mq-Ob60YfP-Y0adY6bmR1Q
X-Proofpoint-ORIG-GUID: 8yxdoxNEi5Mq-Ob60YfP-Y0adY6bmR1Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_04,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=853 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_093109_214763_AC4AFF81 
X-CRM114-Status: GOOD (  13.23  )
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


