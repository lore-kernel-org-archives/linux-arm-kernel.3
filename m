Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6665DC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6e0CuKO+gMRclt1VJTiG7s7VdbGf2b3bc5vZVAaf7s=; b=G2TbTbMTtW/HWBkz4URr50lhgq
	f2MqLII5+2Q6t4GN3gtoJa3D9uFvt8H+NLr/3COpmE+SNuLLg3dLK6BH6VinYm1FElXdw9A76h6d9
	7ZQ0yDPc8y+Cvjw3wQoNCt+dkFV2VI4Q1vAaCuIMaZEwtGs1n/pwrl8/c++cKzSfk5LYvxoxd50pR
	7yBcz10t2AeeZJuTs/Q8CvlLsp4Nqy0lN/Hlqqi7D14BV+p+hAwbm1Ig+yHfUwAgn6YqUb44/zQtI
	mXRrjZct9km7iEHg7g+xGUGH+D+EIU0hmavcgjOQp1NgSIj0jDTvOB+RLjOGwphRTmUhxHIHNNg7v
	iVxOqmaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeID-00000004WPp-4Bcj;
	Thu, 27 Aug 2026 17:53:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeHt-00000004WAT-0wBw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:53:32 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXdkJ1568341
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C6e0CuKO+gMRclt1VJTiG7s7VdbGf2b3bc5vZVAaf7s=; b=RkHbSgXez7KatwTr
	4FyAAyx7HlHKvwwXWKclK5ehgzUEX8GPZaG1PwKPW5brqgytQ1+6FlTccR0L167g
	aO8kSI57OUH8P1JlGgdmDH8bRhwEvnaAPI8mapMy324ajW+igDqlk3VcZSsJLJ5O
	YUFh55k6n6/NCgKS4QJZ1T0aSO/ffUU2ULuMEQim9tpiBa8/yHufcvUdK0a7KF7r
	74K0zSMt3QRQ7BCG5TMljp+ZTy/f8qyoES6OAnBLpDswdsajiGAS5sN1D/7gBqcE
	jnGsN+HeN7NuCOB6KNqr+OcscHsJlNw9c9wB+oCi4up1j90UXj9ggsMrexuUlVlm
	0LpWNA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga8m5mabt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:53:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc18ced1a5aso294318a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853196; x=1788457996; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6e0CuKO+gMRclt1VJTiG7s7VdbGf2b3bc5vZVAaf7s=;
        b=XqjB/8YhFicQxpuQ0DngTSMcUv7NCixpuz3irfuJJSAJVcV9x6MZXgKB34GxvkVP2u
         wfyTtXi3qNxL2y2854nC4uNQpetKhV+JPSHZOtwQdncNdRIKqDezQVC7ELzjHsmFcqHG
         wHas0xuzag8P3YZRgOdd1Y36xCj7SjZX8aCoAfa20mUPJjV53q7H8PXhIIyR0uniu87n
         SkwHudV71gHrB5cAZLCh8Lfjd5UfsPVhe9X2WQbYQEuThi7zB5omROSHlOeydsQxjIXG
         FzY3mNxIfVD/SoQjqsRrZ+u/38ahie2AS0UD/KWsRTq4dgTvpP4iGGBLk95Do9ZdYGoU
         lLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853196; x=1788457996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6e0CuKO+gMRclt1VJTiG7s7VdbGf2b3bc5vZVAaf7s=;
        b=Ib12J1Oe5a4gn6vpHWgAtWw/lQWT4Q7CpGnx9cHwyLg1jvc3E+S2+F+iNLqOnCVecz
         2sruX+job01DqgtgQwO518SP2INQYtd+LPKRIq0SbOCwK7a0xujYIbi9OEn0P6v3iU4F
         HITTtbfs/bB2RalamlU5MxURKV0CidNQ08MA6zwPsEUfnTJcjsUhvQzAwHhAFmkTDuJs
         Iqpfb1lKbsdAyew5qI5O/TLme/L2Kgkjcm2RDiAr5DPWkuLcMLeQNNi8jfmpcV0Unz/4
         INGtbiUy6+2UCmZqM4pa/02j0B/Ost0Nr5oRvfCC55vu9fwmK/yZMWxFgLAA0MMzjYfU
         gOtQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+VPdcQ4154XMrEk9E+ruIYNMccjKKQz7t3B5ojO9yaNLt1G1FsCJlwsLC/aHSs2Jki/382eJJLf4SgiCxMa8x@lists.infradead.org
X-Gm-Message-State: AFuF++moiNx2/9anUyWsdquFy2g45FgoJ9Qn3CoiQOHpy6kjKGDMMogy
	kypDsOKzFapr2HvtC/DoF1S+pzvf6cv7d4axq840TECsX01spwg/jm8NtFP2Yp/XWGDPB4GVVCP
	Px8D0qosAIhS7Dn3nZ8gQ0xQQjKEqhrrO5y2Te3frsKaqsRsaxnR8udYdjp3G8uHJSRTDtVYzpf
	gn3Q==
X-Gm-Gg: AR+sD13tVYhtAea8m8YjndAvbmgMhlxRTeea98+0N01XzNIVxZ7ZbVevD1CGtdYiOG4
	Op2n2EAEmJwQ5ZkkGXhvhDubF03Z869b2R+X0MMZpFx3WV36dsUowSq9+MnKMskrYYiR2wzTPUn
	jHtKKEQDBqjhuztNqPDWboZCNHQc4bq7ZlTFAUx5Qqsw6OYMm50NAK0IBlZEjNJGq1d/oprbd7s
	DyxSs/A2cLjU4XT7BCf3KnvdbxT81aVyJk22Lna4u1AZAYUH8Zqy4esBhFKkJczb4llh173RABO
	1otCzGbXiYwhWAX7fY4u/SyZz6PnhC+jrDLjmC0JLkBzemxEQ8CUSy4PsnIi1nhRCGuMRNFy0pj
	wPQzJNegz81/bwrFI5/FQ23E+x1ZXesveFBFgz0UZAcSMFN8gUlit4bLP1DGWasEQIGnxroeP22
	GEOsk4l6fc4s4btVluH9aY9+E=
X-Received: by 2002:a05:6a21:496:b0:3c4:1916:9d40 with SMTP id adf61e73a8af0-3d2672043dfmr1491379637.12.1787853196005;
        Thu, 27 Aug 2026 10:53:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:496:b0:3c4:1916:9d40 with SMTP id adf61e73a8af0-3d2672043dfmr1491257637.12.1787853195497;
        Thu, 27 Aug 2026 10:53:15 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:53:15 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:17 +0530
Subject: [PATCH v5 14/15] dt-bindings: arm: qcom: Document Kuno IDP board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-14-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=2321;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=ItYoLNnh/itsBdfqIb42AjjkJMdlnXNAkIHidF5zyeE=;
 b=C22RJD5sgzvXUOzBpV9SoyCEBIxzbYbYsy92vpBFw5E8Raay6bzCVz+AMEy5zCta5NZdYmEjX
 +fifQkm05AXCQk5irvSl1ZhVhXNOkL2Zm9HU3RI5mZzga5NYVGEcGxq
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: XclYi6QZAK5_BagJ8ncBNotEWJo2vSVQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX+tz8uDraUjwj
 bSo+316VNS/fOjJz3+g+FipTotrOeipDCNRWRjB9SBkrN94OAdvoOK0JVawqtoLzIZ1loVRoy7M
 mvEFqWUvmCUBg149F6YOQPd4hPyFk0Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX7/VyCi6O2eB3
 yFgWqqB3KeVJbuUmamm4xaA42ckh70H6aKH+rI8oltTeliIvxcojZxxxq1WJ0Msuz2bGJHcRjTz
 6ieENQp6RQTseUlPK+6I94ngqGpLgDjpvfkuivCfMOXVOZ5vaPQnpmxndog7/jXo9YDz0ZwOW2i
 dP6iLhz3yzkoZGMkVOd2N5Os95GUbxjB37NzhYVwYj2T88Ur7OnPlqJOeL+mEqTDyCw5DTjFArI
 JMS+w3JDQ2j+bRRWsdGZpaJsugfQ2WhjKoqjm8mE/Y2/0UeTRSmPxAOh0HM49T+j/eacz5GShan
 MLhFBMPKwyNvTHLkFrzDL6WLXcotR5W9+belBK/JIarZ8ZwjHGMzONt1aN7rw9H73+j2Bgar1kt
 DV/udjpETXXVwm+t6dSsVAJH/VAhDH84HnFFHt/c1ddpWLIE27Xcn7MO7AnSbnKNKwghUd6CLVh
 vgJ4G2rsr2Tw5odEmAQ==
X-Proofpoint-GUID: XclYi6QZAK5_BagJ8ncBNotEWJo2vSVQ
X-Authority-Analysis: v=2.4 cv=SomgLvO0 c=1 sm=1 tr=0 ts=6a90798c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=vXfy1ps2I0IJequeNBIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_105317_285319_9211E95E 
X-CRM114-Status: GOOD (  13.92  )
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

Document the Qualcomm Kuno IDP board and register the "kuno"
codename in the SoC naming convention schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 Documentation/devicetree/bindings/arm/qcom.yaml     | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index e7160b63d814..179aadc86a9f 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -30,7 +30,7 @@ select:
       contains:
         oneOf:
           - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-          - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
+          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
   required:
     - compatible
 
@@ -42,7 +42,7 @@ properties:
         - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
         - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
         - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-        - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
+        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
 
         # Legacy namings - variations of existing patterns/compatibles are OK,
         # but do not add completely new entries to these:
diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..ca02a2f0396f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -175,6 +175,11 @@ properties:
               - qcom,kaanapali-qrd
           - const: qcom,kaanapali
 
+      - items:
+          - enum:
+              - qcom,kuno-idp
+          - const: qcom,kuno
+
       - items:
           - enum:
               - qcom,mahua-crd

-- 
2.43.0


