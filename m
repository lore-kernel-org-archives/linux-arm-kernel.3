Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98DBCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 08:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/v17OB+uu1Bptl8Y2P1tJ6IR6+Du0yDfzTF368Kpd3Y=; b=g5md8k1kA3APM4BCuZ4fDFqwEN
	uysmL+bVjM5A/k+N618lFQCumrAlbzxl8YLgQjFldQmzi9whXgNRfpIohD/FnNS16JJpZX4fppV96
	5/n3y1y8GbnK0CeqqscilkPS/wJtZpAoHE6HF5EmIvdz+OpQObMUcy84V3h62E6C8viQE32uxtCbA
	mPU4Gqnk6merzPIQKVdpK4XvemWRxNwY5E6a5EWGKwcIcmjL8fEajztTIgYqDNblhKNhk3oOKF3Ll
	An4c3pW/AUlhmKC5tUMd7PEg/9flOrS3lSNp850G0gql4URLIa1tlC12onbrxuCKwcVjbACFJZoEG
	eV46xLgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8E1I-0000000CcVC-0UrU;
	Mon, 13 Oct 2025 08:35:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8E1F-0000000CcTu-34Mm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 08:35:02 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2n6m3000378
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/v17OB+uu1Bptl8Y2P1tJ6IR6+Du0yDfzTF368Kpd3Y=; b=cwZvIsb1Ltph8lOE
	d0A2CwHMpOI3JuTDPnAx76N7szM/7QdgVFn8Ors3a5cCA15ie71Y9lDPlctLq4it
	xL4mA6W3/IsepDeHjUAfy+NX7ollrM160wW8z3nZVvUNY4cXA+OXEribCRIMn5Qg
	d1Tv8K5AnOIdfl73PCo0gIP8gXcRngde43KiKnQ8Ul+2f4YRmnbcoq9A70m75X/9
	e1bMgiWKuyP9/w56K9+5w5yDKWxkZDtKJDpqnAQljHUMfS91VZVVj3VgHqP2T2wh
	w+Jh0qo9ZNIppMpEGK1ecBEmyLChcNwZbkhABAuCnjwzkhIPW4s8o0JXFjifaPqU
	JR8u1g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qferuwfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:35:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-780d26fb6b4so5359665b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 01:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760344499; x=1760949299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/v17OB+uu1Bptl8Y2P1tJ6IR6+Du0yDfzTF368Kpd3Y=;
        b=Ja9NklQ6xhnh15yEGwdF/ejN8DnIXnsY3YTSFtK6nkHzLyT0U0Vea9uB9pNR1hjO7w
         0faP00c13cLmNr8+idOdHrt0ovxl/QibLGtau/cn7OrbOEzHaHH4lKn7Xl6aWmpxoaU2
         B8HJ6T8y8uyMn3mBXxhfZ8verSn5HPvKrCbqM4ic0Qs9poBrI3nXIEdvcGZ5KtPp/Oeh
         vxFlM01kadxL+1550FBUbIgSYxQgncFJVJn4fbI5DusJO3s8N1UIKGUph/Vh29PCLb5v
         L1T7+3tEBgeGYLsUEPoaQ/8fN+QgsP2lxqtxlzyZ1E88C48coNgpiabUISbcLrMv39iS
         zYQg==
X-Forwarded-Encrypted: i=1; AJvYcCX0IuaASSGq5GpNNf7rKeq3zdWzb2ZcI0oSRGuSNBKTF84aI2N/wPF150LF7nYSOV+pcaREQ1SbsBFnHOv7F6a+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2qooxx6zCE+5rY2GSQfHN0yD994xI1rFJvtuIWeB7N/sSnOH9
	+xV1WdGtWCniEde77monP3qpeLuZ3OwWoP+b/SkGAX2Kqj4IzgUYZVe0WBhbQrrAzDGnucUx6PM
	qjznlMfi2LvcSXOB/G4Nw0DBJvGEBDD6B+gSp/0lYRI9atl3C5Ab5IYdmwj1ZVS3+q8QBXGkz9Y
	8zfg==
X-Gm-Gg: ASbGncsp3WRMXBlKqwWLJi5JbY8DV+5SKdoq7P7trHPT4IWz04SVFyO/mUOdzXZcq67
	41HdXtk7F/eOAVG1h5d7uJ47V1ANf6N/avOpnC9x9LhjcP3YJ0fdL/1cqGMTvRCS92PL9UyXkgC
	IiivcHStdj6OPwIa1aSgVDEjtwxOM51SMlyOEvLaHKkku8uqhsE+gen5MyfOO7uWvDB4JwKej2y
	uJNvVpDHS5uo3lPXDKEJbf9qIwVxdCYj0ibWgxF9tjso9C4giRETmZ7WpJHDWlX4TGLYihjC1az
	hnilt/WtlkzKPLG88jC0XS4gymcuTSACgmWwuzYyIIdnODCJ6gA2k3oU3UbCjskZPOCNMQqvs6D
	5EpzbX+4Sb/ezBTnAIQsaq2c5aNU=
X-Received: by 2002:a05:6a00:1491:b0:780:ed4f:e191 with SMTP id d2e1a72fcca58-79387c18f99mr19637423b3a.23.1760344499593;
        Mon, 13 Oct 2025 01:34:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVDtAXNThQkixGUJDdp47AfSNM9/enQpQjoVqt6LA/SlAQ4k1D/FSKnPcCgyCzCcNttw9ZcQ==
X-Received: by 2002:a05:6a00:1491:b0:780:ed4f:e191 with SMTP id d2e1a72fcca58-79387c18f99mr19637391b3a.23.1760344499070;
        Mon, 13 Oct 2025 01:34:59 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09a87asm10773251b3a.46.2025.10.13.01.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 01:34:58 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:34:37 +0800
Subject: [PATCH v3 1/2] dt-bindings: arm: add CTCU device for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-enable-ctcu-for-qcs8300-v3-1-611e6e0d3085@oss.qualcomm.com>
References: <20251013-enable-ctcu-for-qcs8300-v3-0-611e6e0d3085@oss.qualcomm.com>
In-Reply-To: <20251013-enable-ctcu-for-qcs8300-v3-0-611e6e0d3085@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760344488; l=1067;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=r4zZxBjBVbvbXcB/D+W+e8OqRwsnVB6d/ZIuYC3/AKQ=;
 b=dTgAM397o822o2LVX3GSqKbj5db3ONamkKk+GoeX0PpDepoq2UzHAhdTaORBIkUNKIoPx6vZS
 u82cSjdu39TCQ5kHevAPZqxjciakCRPd3G9iR+fmc/gk3d7gxOdREiQ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68ecb9b4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Y4MeR5hM20t4b5WVKNQA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: dJjHOfp9J4PTH3b0A6iVsY4tyCN57H64
X-Proofpoint-ORIG-GUID: dJjHOfp9J4PTH3b0A6iVsY4tyCN57H64
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX0rG40ej+MD7e
 7InAth21OpwoEsTokBfH8LxTNak55P5ZbJ2zEZyw0Idvq20lFgPbYdCD+l37d2c24lfojdkM4bo
 CDTsPv+k2fGc3VKFQMPZIVfXR3dCBP1Yga4STCemaTL/RNt4I0fI+sOebb7kRWU0+fXS4k1xJyB
 iapeXwYonU8CibjlQQnONZEdBeWqbVItU1/pgLKVmBcaXiR2eV1K0uJJejxO+BxwPrYjgiaH1zd
 0XTPdbGGjAplS6vPJreHharECA4CXgcwCInnq/NI6XHalw969VgZ7XfCMRADfU9HeAfwgpDSWdv
 pJNuG5dfqkQ9Bbc4ouwAB7QGNf+MaBYLYIG96rjRRV06tUplNeLCMdWhR6rZwj4zvGZtNCoSKlQ
 aHfIevEzZjT6p73zhtwVE0VEC8oPfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_013501_903204_BFBC4074 
X-CRM114-Status: GOOD (  13.15  )
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

The CTCU device for QCS8300 shares the same configurations as SA8775p. Add
a fallback to enable the CTCU for QCS8300 to utilize the compitable of the
SA8775p.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index c969c16c21ef..460f38ddbd73 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -26,8 +26,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-ctcu
+    oneOf:
+      - items:
+          - enum:
+              - qcom,qcs8300-ctcu
+          - const: qcom,sa8775p-ctcu
+      - enum:
+          - qcom,sa8775p-ctcu
 
   reg:
     maxItems: 1

-- 
2.34.1


