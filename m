Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61091CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lV5hB7XFtZEK0KsQe6bDlySshUX68GMer0mInElakkE=; b=bkguO6OyUTTHKsKhybybFe+TxS
	306oRQFNv9IjI2c4coS5728jvramFphah3qvWT8lL0j1E7TOFjEFAZvFI8t8ignxKo31K5v+8SNP/
	UsJjNboEdXonVt64BsZSe+TaC+tLfEwvl+estJMFTYmRTYr3LqKQaWrWf+gHsgzmIK9HHnaBu5C4f
	gLddXTJIYoBM6exn1WLLQDYUi7vH19Lbw19MNZaj9BJ+JEEOB1t6rlsbDFIOVOJXO9vjKC1kvB7eQ
	/2/R1k5LtzZ6JyCzOLvqkEx6NuJfIwkM7fFDhQgXEjws4KsNqzPvSYvcmffN4JUTGmatUO2zoWe9r
	ceKOaSiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4VZ-00000009ldn-1VV1;
	Fri, 12 Sep 2025 14:12:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4VW-00000009lbc-1Jqg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:12:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fOsK012845;
	Fri, 12 Sep 2025 14:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lV5hB7XFtZEK0KsQe6bDlySshUX68GMer0mInElakkE=; b=WhIGuOTRuIIrd/rq
	I9bQvAlfdFaQy91do9zYxa91dLOt+jNKd7l+e3ZB22jBNsZPxDDLj9i7/R9QQng0
	cJRJEcEgdFo6aj5+eM+kK+GoAppE2oGfOtCVW6Zk+uA9qfRBjLOMYGnKyC4sdXbu
	zkF+OWrGdIG5Oqwn+4eGCFC0xdcsEtxZZBTMbAgXoDvfTHA/DJQ1HOyHFyT8tyRW
	QYSpjb2/fMREasvNTezBGYmDtMuLsf9cj3RQQZ5pP2VdaDeVW/j2I+z8HVdndVla
	cSD4gXM4A7zHsjJqH0QyxfziaO/LyD/G7JDabd0haX76GGrXQAC33v+OorA/yfaJ
	oo41Vw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqgbk4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 14:12:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58CEC2jn030911
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 14:12:02 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 12 Sep 2025 07:11:57 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <vladimir.zapolskiy@linaro.org>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <quic_nihalkum@quicinc.com>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: i2c: qcom-cci: Document qcs8300 compatible
Date: Fri, 12 Sep 2025 19:41:32 +0530
Message-ID: <20250912141134.2799078-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250912141134.2799078-1-quic_vikramsa@quicinc.com>
References: <20250912141134.2799078-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rygG1Lt8y4fswq58ITrmNvQZl7Q1uZIh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfXyx68UtRgm/Qq
 B1bhXV1U2ejwHfsf/ow+hpXOi+7T0qRVVSJhwoDwFteRpKH+Sp0JXc//4GuaU3fCoRWtoFgFRwI
 DIeoHgxvITI6868UnnLM6DqglzTwdDtpR/lDiJ3i5mNxkeQ7fqv6TwqRZk4egNHR2WF29TkLq+r
 24RXCj/L/du1CYH0B0qWPjaQn9wwTJot4JJK+smZez54XbgxfAk+k6pNDfF6qeroitBWMnYG6zV
 +aX8cyPBqNMvsx5Nu4wpp6PDfpX4sH5PuwjiJumMcWtdLZVNiHDBgvSwRMbvcaEF8gTVt9kcLzD
 SSGlmXEeI3R152xtgOkT6hZO/YSRt7G0Q+getHA1mmYAMwLHybbFhJbmUPA/z/6NOfdj91FjEov
 Jen+azrV
X-Proofpoint-GUID: rygG1Lt8y4fswq58ITrmNvQZl7Q1uZIh
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c42a33 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=phzA4CzYhpZqrDFsW3YA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1011 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_071210_356864_EBBC4A5F 
X-CRM114-Status: GOOD (  11.12  )
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

From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>

Add device tree bindings for the CCI controller on the
Qualcomm QCS8300 SoC.
Introduce the "qcom,qcs8300-cci" compatible string.

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 1687b069e032..edd2e77d717b 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,qcs8300-cci
               - qcom,sc7280-cci
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
@@ -223,6 +224,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,qcs8300-cci
               - qcom,sm8550-cci
               - qcom,sm8650-cci
               - qcom,x1e80100-cci
-- 
2.25.1


