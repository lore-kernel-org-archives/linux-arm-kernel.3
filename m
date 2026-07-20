Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B00C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 08:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfCf51RUqorXyFdsLGdUkQI+nh5Md50HAkZl5LCPKlQ=; b=tuw2x3f7ebqmicVk3YuNelZGr0
	9jaPxlzItBJ44yuIiqKbtI23QTqdW0xasSaA4ffSWY8F7y/LmzksERa+hjo2+tTz3gJ1s2+5z8Fz4
	84OP6XvMV84kNRH8terb9c63NVM/gfZ5u2RqmB1KUHyVHtSUrekcakmCKXi8//17IvDUPyr1I/cli
	UZ0HXKQKum8/C4+8FhaL1vbRhvbz3XkBAvphlVqFcbuxRh6nCFRydFZ5aCM/lA2yQUZHGJ9lMgdDl
	hucXpfQGEOW9HNdSwO3cOrzIuJQZ1apJPMeCJjRKkZBnKgumf77Uke/wwJA7gjJCvdzgjuf0nem18
	SwjjwbhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljEo-00000006BE3-2r0W;
	Mon, 20 Jul 2026 08:20:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljEh-00000006B9m-1Lm7
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Jul 2026 08:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NfCf51RUqorXyFdsLGdUkQI+nh5Md50HAkZl5LCPKlQ=; b=BK9EJwrXqwFMGB9yyORIwn6XvS
	ZKl0o6nzY9/3+UxD9WCgt4SKr4W10vYQda1xQC6QAzgCnJgVbxk8b2vefYCChgOAkq4utgM2mRNPj
	PT/5FErk3WRYZjBtBVZyyLhMxE8YllpeCO82oWk4vBUd5WVcA/2OXtrXUY4xrPowBwj1l+ssxuTyR
	MhOHp/WdlP9D19EbkRCMJny2ItXs+UlIjANK+X3k/Mi+4BV9+ZCQTAc6mooyjh29DhZHu7nEeXkvu
	cMKMpcZLhL5PDo8HxD3Rfpl7Mjn2DbJ8JWXtNJjzBm7ghELdawJT3Bi56k1sHxv5DWLk+5X8fL895
	9lCUXj4w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wljEe-0000000GNmY-0cQ9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 08:20:26 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RgX51774809
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 08:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NfCf51RUqor
	XyFdsLGdUkQI+nh5Md50HAkZl5LCPKlQ=; b=TgiQ0gpRl1uVJFXlCuHqBR+t/kE
	0rcRDizbw6p1LpqnEqV16LB5z7n09pK3ru+4QI1V5TyFpm/9OO+DvLZuzq8uisDY
	WYQvxhhXuktnpHzXhIfczeHNAp/n46dyNqgZsUBum/TbZup0TW5LwFnEmRKajTCS
	bFRQ99ldAbk3h/jfRq6lMLZPWiHPOaQuhsNB7bsncDLASXJWnn0QVhUMrxLkxCta
	3CBV/WVqNiHhSumZq9E0o86l66JTG8wlIgMIkUoGI9hMvICIVLKldDJFVWRbWDZr
	DRU6TfBczFXMfKVG/9cQ0CJ/+9MjjfH6/fu0s4Wcmk8iywQqIe6YCRkYasA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2af557t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 08:20:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-384cb1637c2so2892522a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 01:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784535619; x=1785140419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfCf51RUqorXyFdsLGdUkQI+nh5Md50HAkZl5LCPKlQ=;
        b=DA0DG17BmQ8Y9s1UU9D7S9Jvdvld1g1cIY3+8UST3lBOJk0ody6v+iwTNv1l91uXdM
         ViTZKw8WwDs+QQooCnL8zM46HCLBN85S+siIhPG5na7uHMhzSBs9OXwlsAKFJE1PAsBA
         tOrCxw1GB7tJWW+bwl72sMInXD5Vuo7TjahP3ssp82QQuFWoU9AdaXgCBX96t5pmDMG2
         JVBT9EvYPVz5H8c+XVGx8Posb6YtTynwpmLtTBGggjiZmw2vuLvfxn9Cxi+ayBc00Q3O
         iKrSJIPo9/rIkHvlaL6f5N3SVHl22x7oRsQNxGavJewtH854KbqM7dCquou23aKnw4L5
         zD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535619; x=1785140419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfCf51RUqorXyFdsLGdUkQI+nh5Md50HAkZl5LCPKlQ=;
        b=SRSRTjUnh/ZFiFVDhG7EQM4KtAiWwj6RKynSYQg5jcfCyJ/7b+sqUobrCwbo++guWS
         F8xqEsZk2RSjR+hiw0IQonjebexYx2e3tVjymHIX15ac9Tu2kuJpCit+fyVU3DQ1NInt
         pQ9K0umUSD31WKJxn4tAJOpcZmH6fMHFZSsmeK+4QFFlVEIsS/CK6zcn2n9zR9ffF5ou
         mh1syL4XZaS2FkliX3uGeFZ555t490Wn6J/kKc4C+yhp5vl538i467KDMXarVDUO3JR/
         HZ6mp3Hk+gdSUcXAVfsk2XjUoLWCkzuIOMSNJB6mPs+PgXVMhJlotBUF9tVC/kY6Kc/x
         Q42Q==
X-Forwarded-Encrypted: i=1; AHgh+RqDcc0NnKbJ88TXQM23aPo2fsnGuwn6fPgwT6cObvDER+GjtMHih66beiPmNOnM4QctK18yoK3bI/PvjrI8WKl8@lists.infradead.org
X-Gm-Message-State: AOJu0YyDqnOIyfVOgLPTK8Nn5zJLRCQnOPl/Wf+JgXKJcKjr2BqqLuRJ
	/Ms1mCWskUIZ7XxyqkBYl6HVR5GVxA9m5egIP714URpKnJWUZlo/j780hmGF8WWMwdFVwM/Y9xG
	AsqKmBNovz1weKHoj3HF6tNQ0bRl26f7x5461ZztnniJ2RbdTUp7ncxzn9IiDwpKGyFDfaxv3rp
	pKHw==
X-Gm-Gg: AfdE7clJ62bI63R+8DjieNqYnT6GW1etp6oKeMjLJdk5M5fu1nHhSp74GKl8BQYfQ30
	EJEF3CJCmY4+aBw92HSiZ67q8P3rVZvqbLHz7aS4ySmNpXk06enViJ+gyfoDSW3kJCXqmaPbD60
	Xj01GFHxvZbSKP4T/5ezHSBMUDetXeVjxoorZr4kWHsoIJm3g9e3Nk1C+V8Q9y29WKTT/N4UkFj
	r52leOLNNsB0PShYchvYqGwYDPYKdZJ3C/9cRPn9L+yAIixAWDvXO2Si20uw1TsflqBwz3nXrL3
	q3p1pBj3gtitTH06R1coh0hTDipcsJV6+2ghjk2FsS6lXDGRo65buGPjIBCCaWFaYysD2vhHjwh
	8Ja+MbOkeIqbjxmv67yfZKGMqFgI1PoU=
X-Received: by 2002:a17:90b:48cc:b0:381:2788:a437 with SMTP id 98e67ed59e1d1-38e4b45428bmr9482090a91.1.1784535618691;
        Mon, 20 Jul 2026 01:20:18 -0700 (PDT)
X-Received: by 2002:a17:90b:48cc:b0:381:2788:a437 with SMTP id 98e67ed59e1d1-38e4b45428bmr9482052a91.1.1784535618141;
        Mon, 20 Jul 2026 01:20:18 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39e0531asm7233688a91.5.2026.07.20.01.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:20:17 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        faruque.ansari@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
Subject: [PATCH v2 3/4] arm64: dts: qcom: monaco: add RAS error source nodes
Date: Mon, 20 Jul 2026 13:49:53 +0530
Message-Id: <20260720081954.1858180-4-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
References: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MSBTYWx0ZWRfXzWTg5UZH7U08
 g+76oqNdy1OYY0nQFFGZYVGFC2FlMhWMmKryLmZRGFWqILaH/gXANakRMMcvoKo4C6uGdwmvRbL
 hU9JKdp0yUyOe9ODvrW6bEFT3DipeX0=
X-Proofpoint-GUID: RUIHiuj4Bn08GZkw8C9ArPK0Xndp7VfI
X-Proofpoint-ORIG-GUID: RUIHiuj4Bn08GZkw8C9ArPK0Xndp7VfI
X-Authority-Analysis: v=2.4 cv=a+sAM0SF c=1 sm=1 tr=0 ts=6a5dda43 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=hf7YQE2i2jH5Ah-ZJM4A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MSBTYWx0ZWRfX+tdYpvrPS/H5
 atd7pfHUMvx5XlhOgTkRsvcB2wZtUM5vFERP+py9D4crEC8r11Wzcq74DyGN8tC38VXMzudRsGN
 YFrSWX9Pv1qdR+0GoN7l5vgT5OzqxnCflAHBXXPNng+C8UZpdi3R32JRGVOC4pBn4jDlNPeczwe
 49nRmXmLnk3PhbQV1jMOBzvlsGdVo0XfDjHZCDWL/WFbmIROT1unvsrVmQudOVz72OBjqgV7dWA
 Z5gI++ifWVawT2F6zTIlv0IzawP6tKmzLT4BGOkaGCodqKoIhxxGeRHL+m2DO/zkI8+VGF88iKA
 dOl/F0cowyIXLhQnX/eSHN28/9PlXOL+MqYGSRFjhglx9VyPlKtBjaguZohrafBDYz5z0Vhw+wv
 03HKyy6O64/yRBRQVtL4baE/zMj4PMrTldjJ92054WCLVrIGisHIVOnVQCX62DVAiyeCDFmL3sy
 drk8Zti8X7Fkbzdsu3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_092024_533498_63F773EC 
X-CRM114-Status: GOOD (  13.51  )
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

Add RAS error source nodes for the Monaco SoC.

Two processor error sources are described: a per-PE node covering the
L1/L2 cache hierarchy using a PPI, and two shared L3 cache nodes for
the two CPU clusters using SPIs.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 64fc0d592282..4fbd1dc9a147 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -724,6 +724,36 @@ system_pd: power-domain-system {
 		};
 	};

+	ras-l1l2-0 {
+		compatible = "arm,ras-processor";
+		arm,num-records = <1>;
+		arm,record-impl = /bits/ 64 <0x1>;
+		arm,status-reporting = /bits/ 64 <0x1>;
+		cache = <&l2_0>;
+		interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "fhi";
+	};
+
+	ras-l3-cluster0 {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		cache = <&l3_0>;
+		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
+	ras-l3-cluster1 {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		cache = <&l3_1>;
+		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
--
2.34.1


