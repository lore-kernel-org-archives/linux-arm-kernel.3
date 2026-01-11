Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21ABFD2502D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 15:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9yfz5VWJzjGgs2tjdJmygWfZrktON+3CXq/+Js3i0o=; b=cMOiiRvi2IUfVxX2NEMmE067ig
	+0NqH7xIF+sTCmmJ2jaSnXaS5eOK8OO7bSO5eSP94XraSK9V7LKfCoQM7qnY4Ivf4jY7tiT103JnD
	9NYRXZaig9RMxvzhjnHS/Lm++B/LUDrxaUrn1/hUVjEXBoZyAYfY8SBf1qZ9xu9NBf+851DVX7SLM
	7iUNvfUquKN7vgIkFw7KH4ifvPo+xH8V10EzJgwul8myLiQyM5N4Rma1OGg9oL8VcN0UqBWtWqt5f
	NFH+WbQGbqRVO0zlj/h67PaQVFH1DEsorbksQcg1XqlCJP3DuS6uKxa3z2wZWO1/pTUuQlErBNYMf
	wi28vmcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vexdS-00000004Ky7-1une;
	Sun, 11 Jan 2026 15:45:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vexdO-00000004Kwo-40ua
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 15:45:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BAU1NS2522428
	for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 15:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9yfz5VWJzjGgs2tjdJmygWfZrktON+3CXq/+Js3i0o=; b=AOHR5KQ6vk69cq0F
	Oisz2VcBT/2zKDiOrXp9JQJiF2Rd1YMqFY7n6wbDqOgpZujq3C/+YUY/0/k9d3x5
	fLXxbQaviuEwFK9/7BfOSj/T+EU4iu4wVO71taAkhKgWY7jf3W0JiJf/EJzfr2vx
	ma5rziSx1RCzuZQM678M/vx5lXDWlK9lCTQSE13Hwhmwy6Ndx3w5HyvB/M8sEVZV
	N9qu/nYXdnWYSjwCpQIkKfSq19hrOFuSYprtLveP7BaBGO+YKexYppUKHQqlVGGk
	o2hoxwYnyknR8JVIV/HAqynQITrRERXUeuDcpIJvTDGycK1FaGePL741z+VVskGx
	6X1kNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkeusjd9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 15:45:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b51db8ebd9so1902194985a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 07:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768146341; x=1768751141; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9yfz5VWJzjGgs2tjdJmygWfZrktON+3CXq/+Js3i0o=;
        b=DC8osoZ477l+tqauVmRlX3AaW21o+UwNexMYFaq4LAs7heOBLm5RT4jsJDIKOKamC4
         Pqe6FjlXOW1NEQpnSp2enCJ5oEAcHhxm7OLcHsVhTIRgNO7S8W8OQJLYnmVX8J3X+Dq7
         5Nfv5gOwKzWdyZzLV0mVbkJWZEPKeQUrrdreLvsRxlAku7aR1Yeq168jn9TKIipB0tP2
         8TZMH7tcfeyfya1OJOg7vYEa97Kk6JYU/HALDjWxPajh4MMD6RXx3TeDTfUzS7M3lo8X
         Jndpxm6+/GQAXRMbOc40tGbs9+6R6U9vHveaB/h1o81OKOt4TGND43VSv87k36KX01dT
         FFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768146341; x=1768751141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H9yfz5VWJzjGgs2tjdJmygWfZrktON+3CXq/+Js3i0o=;
        b=hEhxf6OD+ny/95yd05kxc/LGywX18c5WAKLgksC2W/xDFmqHHYChFZNBEyOYKqbCDB
         uEZY02k7SytJmFNFU0/Cdid788i9LUNhJ3biy8AWA1cEVLPH4ia+xFZsN6XVXl8yuvzw
         OrwstHD2nBAUZqeeflPTzjupJOyaY7tCjgxf0BYJPQ2C+XRZy1N7YpK+Ql0JECGgSjP5
         lYQJmNzMZpG66ngVqcLjVzT5W7XFuXvFlZgxRRzJ8y6Hil8itedDxCD4ZZ8KldBzoh9c
         UyyQ2RRSjoJAHpJe57XpBR1qQ72HJWcsQ0ucwWTcd6xou10LOCapKxBFDug4BQnlZaRr
         6APw==
X-Forwarded-Encrypted: i=1; AJvYcCX3bbiptgCd5YNNZit54LaSfNJsD0/4ow1TFq4U8FSOf1TaIxylhv8AHVt4cfXH1HHW9kzHaPmTHmJ8ww+x2Xc/@lists.infradead.org
X-Gm-Message-State: AOJu0YwpnrqBSwMOlBrvdUPlmrtu2XpyrwFVwDTCxIOK7S0YdxlxXuZ/
	GfjLOnTQ32GM7/uc5xIBbk42QC46w/5JBjKxnodhjaYkEahFWOF7TjlKepNLqmHmsefs3GpiCs0
	7+gValkBQ45+xLhQsOcxB1NhZ+XIo7s4eobPk5a5w2vTyjcVZ3aBmstVo2//9mlVH7Y3U5jySyv
	omuA==
X-Gm-Gg: AY/fxX4xovK0dMXLivnSFXKs39wSgSkYjfc104Zi1NuJJpNrqqNd9WCTO3ETRN2LWPk
	zMxUMppm7FAy8SroPijH3+X5CbJhrU1OncnbSWPXazBBrx5F9xj2CUhFHepHFxgW843uljerJbX
	7GMH7nM+/dzG0tEpaJ2s/u5X2g3tq2FpqAVRzjS82ja2gejt/GL/7WqW8KAAA0wgkjFWW9p0/Pj
	63QmldxfnKs7Ytl/HvlxvnPxYwAA0qOBANWT0TyDiYaHyQFYssvL8MpCAVzw2Sm7HoTDv5GUWub
	cwuQtA54LA9laRPUrx0/utgmZ701flI8zm/IaGLZwYLLVxdIkowB3weZ+8MnRmS+2dwWmWZ245F
	JvI4OL21kSYLqyijeKM2RLaIJm9afgSmC5w==
X-Received: by 2002:a05:620a:29ce:b0:8b2:d791:3d25 with SMTP id af79cd13be357-8c389379d70mr2236622485a.18.1768146341376;
        Sun, 11 Jan 2026 07:45:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHg4gxtJOYaXuSmuP0DZ68cvwexTmAhTOZDXnjdFWUYJSLhByLTbBVAtxG0UuMcfZJUIs3ExQ==
X-Received: by 2002:a05:620a:29ce:b0:8b2:d791:3d25 with SMTP id af79cd13be357-8c389379d70mr2236619585a.18.1768146340967;
        Sun, 11 Jan 2026 07:45:40 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5180bdsm1636605566b.57.2026.01.11.07.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 07:45:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 11 Jan 2026 16:45:30 +0100
Subject: [PATCH RESEND v2 1/4] dt-bindings: watchdog: samsung-wdt: Define
 cluster constraints top-level
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-watchdog-s3c-cleanup-v2-1-fab2d21a2048@oss.qualcomm.com>
References: <20260111-watchdog-s3c-cleanup-v2-0-fab2d21a2048@oss.qualcomm.com>
In-Reply-To: <20260111-watchdog-s3c-cleanup-v2-0-fab2d21a2048@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1270;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SX21PhGZicijazZ9aMiqBXstGUcTFn/+qwMSgUuCSYs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpY8WecilDnF+xz/UDkEdS6+upqb5/SbrTxKgVt
 HUxynBTRdqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWPFngAKCRDBN2bmhouD
 1yjiD/9rFks+Jd5fvoffAqWTEPjywYcIXmgt1FoS7GLxbxowMs6OHtEojkAwn89FUNSGIIsqKVz
 yGan5zpfFfhzSIQBXcpIMrRFZtvidwywmPsMdx7YkvpceIR83L0tFIILNi0NzFMhzQ/MTgJv3Es
 fQlQ988K5gJEmryRzMKCEd8ylkZKtzjGlGkwcMJDjtgciRMkYPYpBuT0z8eqWW6LgwfRfoyKbr+
 61NlUAMfVTq9MJH8iQIYj+yi5P/35PhA0BkPkbeyYLHLgKGr8oWe4/eYYAlV8Q0GyPAxaPKhIRo
 eDGiauC2ZLUQ41PdQz1YofB3GFcnY1red7Wqf3o7x0gekxW8gOJaGqOTri3xypweyzu1FzqvXtE
 FMnUuJWKmzeH0QCYYwudIBbTMbHMWtSwxoRSiBcMl37YjIZi0z3YqUOBAYQwQOViyRv5JPFb147
 w85ESzmeCodtNGFI9I3t7bRX0cy/NgSt6CPI3gfESYJsXpft5xO3MwIhchgLCIhsb3EoikT85R7
 3ru9L/MWItx1j7MbFLlNSbjwdIgeqh3IDxf//arS0Qy4HNhoa4OLnSSsWXEbSExiH6qeNcyyOJP
 rnciTWI1Xn0TQx8Jqxdr9RE+TA2WjSSlyyRmp7/dmdlXiqZX3X2wluRk46+A0hdl05Y/7d15j/3
 fA3dwUn1+p3W8tw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: C3UEp80W5wL5NQSt_S8nwMgU02M__FEq
X-Authority-Analysis: v=2.4 cv=GNMF0+NK c=1 sm=1 tr=0 ts=6963c5a6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RUZyBBiHXQlI0l-aNaAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-GUID: C3UEp80W5wL5NQSt_S8nwMgU02M__FEq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE0NiBTYWx0ZWRfX1/nwb3lmp0e1
 Ev5PgAF+VX+/HBDVfAfv6whBVCi8mfa8yyXT6axNo5nGWYHujtHVVpVH17Lu3Xd8xP9nunBkOkt
 2MEe9qiK95mFAnZeOZ7oe5Qo8quK51XJCv6f2+5R6QZu2hcRRVmL6s/e8VcyepcjmH9ynWkYCFc
 wP4AjcwnalQa4eSn+OvmqUxc4XOGXNGVEKWJzeTa/u3+emnQhz+id8wCQyD1LRBEeb9vV7dWRVu
 7VwZnSrvWwnfE0slZO+OODo/QXGGA7bmWorvYW+GTz+bKDxtq0oLX2ZmhwjrcfuzBPOxZHUX0Hs
 be+GD8kaPl60q8Ur/8TqlAlIhgeITAWhGHFoT2QKGHXkzGUIgvhF5lID9TMb0mWMtCh8lk/ZlCa
 fJ7j/Pg/SKXIc91ngr/bXzVG840sk6oWdOa6LVgHJ7hMwKac0pvQ/j/qmVfWQTFdk6iImhoqGoL
 qD0Sv67iGM6qF9WiVKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601110146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_074543_140467_22C5A4B7 
X-CRM114-Status: GOOD (  13.32  )
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

Properties should be always constrained in top-level part of the
bindings, so move the samsung,cluster-index constrain from if: block.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 53fc64f5b56d..445c5271879f 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -49,6 +49,7 @@ properties:
 
   samsung,cluster-index:
     $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
     description:
       Index of CPU cluster on which watchdog is running (in case of Exynos850,
       Exynos990 or Google gs101).
@@ -104,8 +105,6 @@ allOf:
           items:
             - const: watchdog
             - const: watchdog_src
-        samsung,cluster-index:
-          enum: [0, 1, 2]
       required:
         - samsung,cluster-index
     else:

-- 
2.51.0


