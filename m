Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03AECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFn9XvZtZPEGTj9t2BnjXK4luHThGGfwDBXWSpVah9s=; b=HyZU/i3HJaGnW0ufOMtcpkANpu
	j/GDqpR0FYqGfSK309udLV7WduzwIWQDe1Jk7zH/lTs2MWneHXNpZKK18kbh7cpcpwZ+j96NyLedJ
	mXwYvGOJiRpJyySuZkgRddgRuxnrjhL2d5eFvDRaNMCMcxEeqhjhcJKTv5TeMWXuULOYrYDHuQ+nH
	5JtybC9fz6wtbFejyiosrD17ZQNcWoand8YJIpKM+19C8fh9DvHCco9Pt1cUyHFEGwz+7q6VpLs0L
	plkYLGWgWGAfEoNQyX+Ss5o51Jb0uHeKSog/m0uH/x41XvEoRA0Ed3bDSw3nBRkfkP27D3IwTqzNb
	ZQEVhukg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1xI-00000008pvx-0Dmj;
	Tue, 09 Sep 2025 17:16:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwl1-00000006pGj-4BII
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 11:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AFn9XvZtZPEGTj9t2BnjXK4luHThGGfwDBXWSpVah9s=; b=Kd6ZXhGvmIHgkzbtu33XygtsYm
	jwSkdzt1H0ZF0DLXTYrCTGG/2la/6vsBiATNMtLF3lvMqfm+mem0ezcIRRx1447Wix/JoCVgrzqrk
	wZEqaQOPLxi/Gk5eD8pCi6oV6tb5HtzYwC818G0G2FTihwQ5XAX1wq917R/oy3NY7KO0XBk51Ek/h
	XbFCw08IwvDGDKYr+pqr6hRd/3T8BcKPuHiZT86o73SXb1PZxfdkQ/XOL7AXyT/ncI0l4BE8Lk4BV
	TlkzYYAH3gRko+Osw6zhYgm/vh7kDq6g+squgmCKoFgRybVIDUFwwx5sVZ3w2BR5w0l+AxXMmAwtx
	cmTObNmA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwkz-00000005KMa-0Mpe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:43:30 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LmX0024975;
	Tue, 9 Sep 2025 11:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFn9XvZtZPEGTj9t2BnjXK4luHThGGfwDBXWSpVah9s=; b=MoC6RnCBP25Xg6V2
	pSCb3TmyYe5bq1Il3j32tnbV/KqaWus5Ujj9DaBZCjvETR+PGQs5lTgMasQtRfbn
	6Ca0yELLUDloKVMTNZG1HXxJjtSxE6bCGb7FJnU/pse0NeNeBJwDaUEUt6RZWVMX
	csl4FKxXgGQK8ruKs4gF3NaBa8YEAJ7WqkhBqVJhTsE54hb9SLOsSEThhOYcEP70
	+oMFYl8k0hXY0nQn4jHnHby8nQ4qV15xXJtuOpZoBvoWHPIfZji7/WLvBzxR9wa0
	f3gVGX3G51HXnX8oiq9K0Hgus1eGgYCaluZIxZXEMhi6/Y4qHq4Kz3mph6ssmsAZ
	fhCVoQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by9041m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 11:43:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 589BhLPw024823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Sep 2025 11:43:21 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 9 Sep 2025 04:43:16 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] dt-bindings: media: camss: Add qcs8300 supplies binding
Date: Tue, 9 Sep 2025 17:12:41 +0530
Message-ID: <20250909114241.840842-5-quic_vikramsa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c012da cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=QciY1cZ01I9P_ZE3WJ0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hsSpPUbIlVcNGr1oiRaCKJffsbruv8ZM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX8z52DWK0t7fS
 A0Scxyv/I0RuBFnkPZ2nYcJJutUHpOzC/KTOguVhxCLTytY/H0SFmOnOjlWX5ahzPtbwDXCWshp
 bz0jMsqB0YLLAQYJqlrEhgiuf36WqYpNFx9rVRUl5yu0J0i1UgqvNOTcP/6yFsfd59NN4gCTEnB
 B3KvCOXmoRGp+e52vdhkxVSuXNOHfd1SCH8Hx5qJZdRUcXlhx5aodml+NsmjfodEeCRkZrmdutk
 SbbmvpgrfGJs+rAE6Z7ULNtFfvbsP83qCFCopEkxl4kBkyD6aOjUNV+4z3L1jJF9YKOjTKOlirq
 +y4+gbetL8G+dD3iJlWnOH1rA5IQV8dkbJEK3KUnrAb6BD7m7w0ATZLsm9DcrksUl9rWi1wwNY7
 V0qwdH7K
X-Proofpoint-ORIG-GUID: hsSpPUbIlVcNGr1oiRaCKJffsbruv8ZM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_124329_478291_DABFC88C 
X-CRM114-Status: GOOD (  11.92  )
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

Add vdda-phy-supply and vdda-pll-supply to the qcom,qcs8300-camss binding.

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
index 80a4540a22dc..559db6d67f06 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
@@ -120,6 +120,14 @@ properties:
     items:
       - const: top
 
+  vdda-phy-supply:
+    description:
+      Phandle to a regulator supply to PHY core block.
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.8V regulator supply to PHY refclk pll block.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -158,6 +166,8 @@ required:
   - interconnect-names
   - iommus
   - power-domains
+  - vdda-phy-supply
+  - vdda-pll-supply
   - power-domain-names
   - ports
 
@@ -328,6 +338,9 @@ examples:
             power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
             power-domain-names = "top";
 
+            vdda-phy-supply = <&vreg_l4a_0p88>;
+            vdda-pll-supply = <&vreg_l1c_1p2>;
+
             ports {
                 #address-cells = <1>;
                 #size-cells = <0>;
-- 
2.25.1


