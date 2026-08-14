Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993AFC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDi5NsGbxyIFciNY6O3JO4DjZ5N5Ti4JWxUyYD9feU4=; b=tbldLrzKLhhXWHjHGPRapEGuw0
	aX/ewnv56BWf4f1IjbGpa7ZoUDBf08pcHAFxqDOuyNAlHdIyMA6ZiRPhYAfNe8jQN/4c/kpSFIrLM
	EiB/E/YCZF6aB7Y2rXdUtzYfopx/h5eGV1Pfa45ek4B+dxo9CAzHXDtKEsu7oKEP8PrtuWoV+f2Ha
	PNzYpYly4zz8zwJ6lRGMCaCP8CwphrAdd7nehIVOM40CcphY0DfO54YEug5LLbqUTI17CYrQSUO5u
	r87SCnAkcvjS84tG8hjKuZQdkexVikyMX8W0+wfC32u/+vEav7iS6j571zePQa2YNZhHd727jVM7c
	EZiqD8Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumQX-00000002BGc-2buL;
	Fri, 14 Aug 2026 07:34:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumQS-00000002BCh-44jV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:34:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QxTw980271
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GDi5NsGbxyIFciNY6O3JO4DjZ5N5Ti4JWxUyYD9feU4=; b=iBM7qggQJH6GlKGE
	RoyM7bsCwwIW23yScNYe/xWWIj/gDcu23CbE53thgM4y24K2Y+dUxq3fLUrIW4Ol
	2/B+94aXS/6ztYwEA1xXBQv20U/duE9iazZdH1i9d6MHg8qx6i07sAAovTFBYuqy
	FYA4zh+gVEYRd87S5KlMPMKQFBWPKKl/BJ7Ax7ibnBg3SGg3glA44SW7bD1bz7Hf
	MX/HKi09+wKRt5hOkcKQBN2k5xBVTJvdi4cH8NSpakoJfWL3N1jABYX/fTo9AaJw
	8xC6aGfi40IoR3JzMLCAzubsvVOj7rmEqU5re0neIn+UwI3oxjl7u417Yzq2VDM2
	cL3tVg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1pea1qre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:33:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc73f47bdcso10869435ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692839; x=1787297639; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDi5NsGbxyIFciNY6O3JO4DjZ5N5Ti4JWxUyYD9feU4=;
        b=ezkv4QlFUPezcgJ7P3wkgKPunKQq/DJ9AesyaT9ruFiEkVBym2iG75P9b7pkOL5q7S
         wEOfPVhYiCmZEBjfox69PwY1PaGnXwIWC6YukjLWhzgxbcdK+2PDj8CMv8WXhDtjYIod
         BTc6VkK94av0MJVJL1SF58cYDOOEra755SNzlGq7d69nV6sUl5pHb7BDvAbNXixwyck4
         94qYRT44OK/kGapvyTTmkkyifBf69VVA/rvITq64q35VNxUD3cGzGZt9pDXHdG+nQSR1
         6INJj3h/WxvqhGrIxmSahtBuWjgMIGuP2sGfDzVj/54w1aLicTCKybdYsomLeluL+Vm0
         wkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692839; x=1787297639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDi5NsGbxyIFciNY6O3JO4DjZ5N5Ti4JWxUyYD9feU4=;
        b=AnE/XaoEgAoHdtr2eWIaZG6yxB74Rk2IW8Q1GnZvCOC5E1Xd1cTlEACMRGr27ygKJ6
         AJyxuvwt/Q+hlm3Php/8BCH8RuTAficY2acjrugN5drZTy3AaK57+b0TmORZCiavYO/0
         OGv0SzqHlKFSG9YLWRwUk8y0eQPGWRCACqEOr6dz5CaszCr4eQ5CZcBclySKqnIYI8Tc
         um/S6+3AdZ3VIIGq8xhWwIkaYCH7l2qMbMKchD+sLQV2qrdPOy5cKbiZZ0aUEkmFAP5Q
         vYaL89j7VlyWpgx4iZ0AgNwfgvKGbw00198GYPu8E1hRzqg5xTDstgIOJm2W+PjW2NXN
         yGiA==
X-Forwarded-Encrypted: i=1; AHgh+RoPhTb1sDNpQGjS4BWdfkMbbCi90ip9fYczD8I1ptcb9RsDIBMU/ITXeuvUMKqYM3r5BQoOPOFoZGncLeP4wo1X@lists.infradead.org
X-Gm-Message-State: AOJu0YwEwm/gocmHJH8t8E8wu//JxtqMEdretHBDKWXToHsP8IPjGoLt
	nrqhE+jQbgTYVC+hanFG7xYHjWosPRO2a5zF/fs/kHiEIEcLB+r6i4KbAutNGDSqpuJcmQakoSf
	/N7v2xaIbkxW6YHNlQoQSVcDoi25AJuqBTBJ5gWvgCfiWGXsq6F9pSBAe3/fETm8c/ZlmHqEZ4D
	IbOA==
X-Gm-Gg: AR+sD13CAjoB51ALKK+h4iMdRHXoD81ep2dax0y384MIwOEbuPqUCwZtx/WHkPVvnK7
	C+IblawlIoQvZ7bxwejp5ccv+wc8Sj6dSO1NVlav36NREWoOggC9xFzGe0LFfgJN6jLUl/y4Vpc
	Dd/qVHJqo/n3yvXxd0UmSzVxlDYo4P67nMH5GO38l3FA56/D4FXxS4pb/reBT22zpCwreec9y52
	DjXRULF7qd6Xw6QQeyaJhrl0GEvj2LiNWFAiqUypmY4K581Bi3UTZKbqCuFA7Raz1LXl5b8zAlz
	IxwN0/NXiDzlal0dDKkytANAc1YcTd3qkXJEEq60/SHPvWoIy/5OEvlohChUn9FXjhA2datwySK
	w41a+myskzfRMOAOZCNwMXrwiU43rQKXwx9KPFharw3HzzWRlM7TbMUU9L8b84S0qQifzKtQiDl
	hq3WKQdqSJ979JhL1CEZmd8pI=
X-Received: by 2002:a17:90b:3fc8:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-3933b762b96mr4310478a91.7.1786692839049;
        Fri, 14 Aug 2026 00:33:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3fc8:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-3933b762b96mr4310435a91.7.1786692838641;
        Fri, 14 Aug 2026 00:33:58 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:33:58 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:45 +0530
Subject: [PATCH v2 14/15] dt-bindings: arm: qcom: Document Kuno IDP board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-14-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692714; l=2175;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=n8GV6PoSXN4cpLFiEq+a5b/GV3P0P7iPA8E23y6lTkM=;
 b=JnS955wsV2fvtkKSqmnST9ZqJcRZDmy4o5dUDkkHBhJd8gneTdqyf4wNaxSCaWi7HMrU16dfE
 hm42/mwko9nDFSCzQaIXYjmVgEsBn0PKq4PItkLcZdtJhhYwrynoaWZ
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=TbGmcxQh c=1 sm=1 tr=0 ts=6a7ec4e8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=vXfy1ps2I0IJequeNBIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: LcXcEMsHr8ry7c9mQryWagWNbfC3rTRG
X-Proofpoint-ORIG-GUID: LcXcEMsHr8ry7c9mQryWagWNbfC3rTRG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX1xdAsAB4CLRH
 hYT5D/OtMq6WE+/rhnNl4eA6yHytxDIAUpKu6SQs5N9kOymdk0gZuoBPicDgpGYjsQFI2S5a9lp
 Q7iNdXAm3/XXagFDj+a1uM+LUAzxwHEmkF5FHOP36qWgrrecPIdC5UyDcUF7rySKNKPEkubnq6k
 jpsq/qcjG/bUNyUd/vVOTJpXjXdgA4ww9OrcvMDjstUPAiBLRvJ6723AgvBwVdUx7tqvODjtx5Q
 lB71Rir6ycuKmQXq0e2VoxhIIeqS26BZnHt38CWc6ffztCIyTyYX5WfC2/HL/GNMXEVQMxoeC1O
 HzHcPCx/RvJ5cuUxhH1IRO9I4GnY1xQpc2Kx5IOorIaVv9ClbsekEdOLCAcfs1JsfM3UGRmPg//
 A1ek4h4gIhA9g8tHigEdON6jmVhyHOF8ZSr4Elc8gzZa8eI8puPxaT6uUsBBYCOuCcupMOyjjrh
 zZsqIRM4w/qMqvvPnsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX/uO49GwbesI9
 OTjUXYnhm+LZQbO2TEiRQs5tD1F3TnOxITThHaiiCOZWRDBi024j/OGh3JMjCrVp477cuyL7XY8
 QpUmL8yDg+3MtqCzNiMQel4ltzad85k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_003401_308931_FE35A710 
X-CRM114-Status: GOOD (  14.75  )
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


