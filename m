Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E6CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=me3s5KtnGfnPX3nQQuFWMWrdf93eGrA2nAX6p7Z51Aw=; b=LuwFTztfJ/Y6QMzeaTlbvx0MSV
	q+93WTvw+t69VDCN30lYXeu+JEaly0BqaAHgPyiqIXCjoUxOF71YwUMyhJjKntPStyomXqHImCFXZ
	oY2xUNVx7xIoSc0UM/rr0+qSmkN27sEdfkME4hehBBM9y86r9gJGj1Pgx8REQJ0awsVU8kP0oQC7F
	e+jE49OB8yadlLIK0QTDZ8O4Me2qneE0XhH+NDI1emcAqId52/8eRXcJghegxCZXZ25mOK8oweJCl
	ppfOgD1fG0ipH71s+iKoJZjp9kHHMoE7jD1uyGwZCLTptzUqcUzEIdHmB9hCAulwRwrQNWxmoEITe
	gScljGmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1x5-00000008pe3-2MBa;
	Tue, 09 Sep 2025 17:16:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwkn-00000006pEA-1KWU
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 11:43:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=me3s5KtnGfnPX3nQQuFWMWrdf93eGrA2nAX6p7Z51Aw=; b=LfKXO22+IFM8H4LI6ly0MW7daN
	FLMa7MyanVRPOjALT4Yz1fO2M9qpDLgRVORcXrLm6E/t9CrYwJzWtCgwisGpgY+Zc6GSkR8RT4bcz
	8kaoaIcaUGBuw5ovnUoBA0RU8SZl5NXhHVuDb8klsouanUSsBz4WyyMGNhIG/9/y7PlZgx2kni4Ex
	Grb5Oj7SgUQwqNKpXq9EvZaZ0Rlr/Cu7oLtQ0Y8WCjCzd2mi8saIX2HylwPjp+Q/bqUKr6lEg2gY/
	GrbPlA291PYKqgcZU7MIzVw2lJ2g9TR2PxvmJuacmPgI3nsxTmiOkNMKUKa3CoMVLbXcgyUcCs4Qh
	uz/A3VDg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwkk-00000005KJ6-12Wd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:43:16 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LURA020161;
	Tue, 9 Sep 2025 11:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	me3s5KtnGfnPX3nQQuFWMWrdf93eGrA2nAX6p7Z51Aw=; b=cgQW5vbBqMBhkvw5
	Ne4lkwu5yLdGI6q1shOiXs4hpmWoNlstZefYLUzysjokXWBfBcXD59z6KspkhrVL
	0weyisiVnzgHVicbDyqwDsydE+bBtjqWxmsFFFiznTdMoLJiAUKg1Yqes/VLqSYA
	AxcdiYHcC3QrgQOE4iEpQF2hOYn43Wcf+UA1ocYs2JhQSzcsgT5MR6mAwFyijIFT
	ZeH1iEEr2A042YmxZ7Lffwu+g04iNZM5UlAa8XFpJq5bl6KUpJytUm8P5E8MBo2X
	B3ZwureU89Myc6MnUIp6VtpStBL5CI4/wmT3rr7LyPjGD1VwoBuyKQjBLLMOAu0i
	REfWWA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2436q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 11:43:06 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 589Bh5ad020131
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Sep 2025 11:43:05 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 9 Sep 2025 04:43:00 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] dt-bindings: i2c: qcom-cci: Document qcs8300 compatible
Date: Tue, 9 Sep 2025 17:12:38 +0530
Message-ID: <20250909114241.840842-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c012ca cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: lmNws11Z61Ia6VwWHaFCnrzzZlGpDzkr
X-Proofpoint-GUID: lmNws11Z61Ia6VwWHaFCnrzzZlGpDzkr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX7KU+vljVLFYu
 i73wCLcdBN1xAgEd3i/TtH9nCaOWndVvwGY8DvZa3bfFFxlpk+UO5SVSfKaVZBDQKifNiP1HJXk
 tJiJGnRRWmSs/OHRJ4A5H+qLHRGRIzKTDJToIEK/b/oADEXZj466MDQE1zBc2IT5d2a0Qyf1cnl
 y8hRSHDBA1X4yZ8OWCwWgi0YD+/gZgUtTe/ItxNYq47vmBwTSFqYLJX2w7Asn4oH2zOO9o2xw5r
 KChVTL54nC+NyejRihPdmTKuWAabtAW23UyvcpE1EiVppomVNJFZkt5lxxt44ol3HdTvZdoSKC4
 4WzTt3eilyEomtH6buVo6wV17CyXta9CdrtrhNCNpaC4tD405Zjo0BubxX/w1YUO98xXliNT5Xg
 MhIBkR0E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_124314_535359_5D06286C 
X-CRM114-Status: GOOD (  11.28  )
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
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 73144473b9b2..d50359019501 100644
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


