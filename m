Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE37CD8CAC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 13:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7Ea94Rrz+UAH3itxmW5/gMgVCOZgJd2bHTd3ZfBZeA=; b=3IHsjsxzgx+Wiz2Ia8UanFJHrD
	YAHDqcDjJbDucFI/COeGFG34VCM6qXkg7b4hlBEo8dFBTvzUyf9/5a/JPfndq3kGvihYr3bqjnx+B
	aFSpDKqQPDNSxRBqxNhq7abmgDLg2o9DF4gCfEOJljhNc2m5tH4tVeIGjZ1KYJ+aCifwz40mTIrho
	mGMBAoy8kIM2N8vA9+Nei5hvir/gW4x0itEk3oYVKi/sWA4L84m+nBCLOsK9oANoGq4zH0KZjeAtj
	k43M3365aTYI7C9VYsGYKAGLigKgeP9MOmGKo0tJmD2J6ueN3kScBEzjDMISOh8P6qu+SH2fmi5e/
	vS7N9Xhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaRU-00000003fFJ-0CXa;
	Mon, 08 Jun 2026 13:55:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaRP-00000003fAK-2g7f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 13:55:00 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRG0X3336266
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 13:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q7Ea94Rrz+UAH3itxmW5/gMgVCOZgJd2bHTd3ZfBZeA=; b=hYpbfRSlRhjxcN38
	GnSZlzDqT2XzTYdZSGTisRorqCFjwIv9YzM7G2BoopwHnxrIVbonG0+6Nz7r0Xx/
	SShVIKSd0kEA3wQY7lC1WuNiQN0Ht8MUyKxj6irPGD2Wnz5bgkVk7P3qBjSogDx2
	h0v6kQuDACZskcJNkPV2ihMEVyJhj6Nk76C2JxGsahUfqBRTrG6bLe3PRfkMyH4f
	VTM/F5vvc7Fw05pQehhB4PwwlHhCbtQuDMOoVD/9LSvbfKjpBgw22C49NpdqJBTi
	gwa3AmccsdtuDy3KeYFhbifTPKXSZ9xTEOh/Q2gvmj8i6A2pnhAY1a46AHQCKsGc
	ZExAaQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun40ygn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 13:54:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51787404d3eso73873371cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 06:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926898; x=1781531698; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7Ea94Rrz+UAH3itxmW5/gMgVCOZgJd2bHTd3ZfBZeA=;
        b=dHqBMSGTkRhJU1k/pfW5zSVpp1TIr2auxIyFtfX9xCRDmDSfn8ZpZLikMddtiRxMmA
         4LubR3KwbUO1vEyqi+P8haoMk1fqfxNQWPup1vtN/BqbiqswQPln1BHvqTIVebWYIkgc
         6f0Elo3SoqHFHKwjT0haCyQ7CnNGJN8rxi211vQGxVk9dSY5xP9VVBmkQATbSEa3cOKP
         rnxAH65FDaR0+kD6DB+KMifebLSo4uNO2dAH6z0RBDwBwksm0+3KKQs1sXcyPaDZK4zE
         lQSYMZd3+egohC33EHIRbG8W8UG7FbJpT9dFAii3dTI5ynOvZL2yZT9mMYsKzOxdPIGi
         hRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926898; x=1781531698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q7Ea94Rrz+UAH3itxmW5/gMgVCOZgJd2bHTd3ZfBZeA=;
        b=Yo046kpwY4SlP6BJu6aBctm1fXJh9lJVbWUl+bzmHsqeskQ5jSX9bq1MlNU3aDV/rH
         OYxMu6agOgy1TXL+IXmvF4yalisU0wavTtp36yTC12cOp93BeTjAGVbZZaok03wDBP9q
         cN0T9PCixjgunCVg7aN7VJhbPJkWKJKHGv/E+YcOK3etislwRRTAcye4POw1NrHJT4C1
         kiCjNUB9LWPT0ae1oV/oeTTIL1pcaKdD2OXYFXeM2eZWTptVkX9mtLRBAKOtj2a2Nwze
         B1LLd8d857Wm5Zw/eESe84LAuJRbc09sex5JN+tobJ1J5pB8IldBeaRcmAk8B9sZ5rpJ
         tOjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9eO5h2EJ5PxPmfbemcYPp/9j0Og4h/3u2s1HGqevOyAwotV5jlC1ZFfd2D0BbVi/qugKwMkL1P3dlrJyWTCpwH@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9H3MddSe/m3WuL1uFyqoS9M7tvZA0J02whZdGiNv77Bdf9BTT
	S+4b0sa4rJETxMxxcTcuzQPw6Ri214Ww2vViqymRhQ9eg3xzzFXRESnbT8z/gLjXgCOPAac6PpE
	O3vBXPPbqxOdhGMXjE0du21r91uVENW8XfjyPPj2lvAgUCLR4iG0C1yat0A625ycauV69IclzJw
	4oKA==
X-Gm-Gg: Acq92OGo48cMkgxcVLNI1V1bECCDllRqPIXVgAIbKA7MZhtiLyjcldOaSa4DIkTtXza
	v3BDJnfVeT8de6WtNA5rSExVXDj1cDwyHks1EHJ/uGgtDa3AlNziegfk/e51f5vmV9XueMaW2Ht
	jCzACYpJOtV6xwPV2IBNUWmBw1F2uxtNkoD+27cvc1aMs/AYdvmPLLIVmUzQ+xNl0ob/lmr6+uR
	aACDH2MIRl3m5HdcDum2sHb4z6/RXKDhOiaX8trOAksindSFYbRYbx5IAWBuXrtCrtSxnKKcj6v
	Ld8+nZDI4+VoqvG/EEVxyH4a5y9VSExKD+ravUHoQlU62qOnu2nDnj2N3nVkYcNXxBVKcVkYLyP
	jujd4t+V81wtuGjPDvFF1p/BFawoPLP5LJUXQGADKt39AHvmsV65OVmo=
X-Received: by 2002:ac8:610f:0:b0:517:8d76:5975 with SMTP id d75a77b69052e-51795afe67amr214335891cf.31.1780926898161;
        Mon, 08 Jun 2026 06:54:58 -0700 (PDT)
X-Received: by 2002:ac8:610f:0:b0:517:8d76:5975 with SMTP id d75a77b69052e-51795afe67amr214335231cf.31.1780926897572;
        Mon, 08 Jun 2026 06:54:57 -0700 (PDT)
Received: from [127.0.1.1] ([213.55.209.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39def5sm385972925e9.5.2026.06.08.06.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:54:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 15:54:14 +0200
Subject: [PATCH v2 1/4] dt-bindings: mfd: syscon: Disallow simple-bus with
 syscon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-n-dt-bindings-simple-bus-syscon-v2-1-0203e6c249dc@oss.qualcomm.com>
References: <20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com>
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2763;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=H4Y30PW7n7YwDjrf08mPfxYtg1F+dQiEuh0m2Rr16mQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqJsmo2kW8tcedUBmp80JofuUehC79NguEf1PFh
 XcCbWPOMCCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaibJqAAKCRDBN2bmhouD
 14EOD/9xIcV/HQiHw1XWxvuHk2Qy87m3NTPa2K0+4RU1CP4cK1GoH+nzEBS/ufXxSxtt10zt1mk
 Fy4XRalyypu0RhdaJhAtKMLtpxpAIoFQKIFWIdRKbrZM1tPIhxG71dLTmu8wBXlS/TbTIfIarq+
 /G195Ly7XlZbsA0iqZ+djQbdPSw6FH9u6O7/Nm5cXsZ5OHUo4lhOaFCKZCWGrfMDZds4L3LHTmd
 ci8wqyYIKIHtVeXD7leuCoao/TZjklRZu2Mtr89T4UNkl+NEWeTTV0Yoqm0kIhqc4b3T+IRirNF
 pu8foaoHS2Gl5aC9POZ+aIg6lHM+PiaWyyoDzVRIx12hyT1MeNkczyxCgvvg6AzVhPiWR25Hk7L
 N43afrEN8pDRG2yLtFMGBD0LV+aDsRKZ7/Lkh8qaSEpdjnX64dCHtQHzZvNB6a3BqFZS2GxXoXi
 Zk+/N5t32NAGl0spVTiNXt7XaRqkVj87+bkdxz1g2d68N3Oa7GqkQpM/ZAXFlYz2e3JWoBJGF7K
 SG0GDpUY569JTrAZEZ0aYxkyDPHqPI4qO6M+lJdHLQXlxNh3J1ZI6vIpa+0HG55YhgjGMg48jU/
 MX1V8umG3wHBqRMKe7bLEAMiq16Xfj4PrfoREbeDpFxD7u2+niV0ph+kiyNGaV74xg1Gpvzq3Cr
 clwZfItBTLH+3jQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMiBTYWx0ZWRfX9uEBYWbznAIa
 rOAjJWFiDXW7iLo63BUZAG5lUivOZuT0ZalqevqDCFxLprmQRfppxrERNKSG7+FfaNbhqaepDuM
 JxW+mTGF6/zj4Q5sjOftXHeQ1HCzFtJw4ALZRbKC7pNRYPtOB6wAVIP3Lt9PdMkfGQ/uDqhIUjV
 vY0M36Qfvub4xwDnGSIsPTTgNSH7N59UxhxzpFxioKzhLUZ5ZO46ksdlJ7O11ZlE22OmHOlPm8G
 u2W4bspEe9goHvTLXvjBfkyDcSAm8j203oihFUBvN33156lHlK5YkjG6kESyIrSNgSMHl040L5p
 t68JIqylg/g+wZcZPZeIaqRewk+DL/MJa2tvxV0Q9yUxF/4MdBrTrE2lbaxecBTPGBqqzczykRn
 iQcL/bF60QqZMGOfBJ8PQbX4GeQXpyQuatU+Jm1wh5AqH0J2XcFpktkgkrJzFcseZbnfxEK1vQs
 OPPzn5yKYWbSTXZOC4Q==
X-Proofpoint-ORIG-GUID: AlyZXiPZzJv5BYftvoY2To5G45PJnyQa
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a26c9b3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=bD1TNsHgvEXzglPpcYW9rQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=YC08-fj938uaX1hd5_AA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: AlyZXiPZzJv5BYftvoY2To5G45PJnyQa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_065459_709724_CA3AE5BB 
X-CRM114-Status: GOOD (  18.17  )
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

"syscon" is a system controller with registers having their own
functions, thus not really a trivial MMIO simple bus.  "simple-bus" on
the other hand is just a bus on which multiple devices sit and the
"simple" means no functions are allowed here.

Combination of both "syscon" and "simple-bus" is abuse of DT for easier
instantiating of Linux device drivers so add a schema to disallow that.

Unfortunately there are a few old cases of that patterns, so add
exceptions:

1. "cznic,turris1x-cpld" and "img,pistachio-cr-periph" are already used
   in upstream DTS.

2. TI has several DTSI with a child of SCM device (e.g. "ti,am3-scm")
   using "syscon" and "simple-bus" but without a dedicated compatible
   documented anywhere.  Add new compatibles for such cases.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Complete patch. I accidentally sent only part of it, built on top of
   internal WIP which I forgot to squash.
   I received Ack from Rob, but change is significant, so please kindly
   re-review.
---
 .../devicetree/bindings/mfd/syscon-common.yaml     | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon-common.yaml b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
index 14a08e7bc8bd..315357da146e 100644
--- a/Documentation/devicetree/bindings/mfd/syscon-common.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
@@ -57,6 +57,38 @@ allOf:
           minItems: 3
           maxItems: 5
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: simple-bus
+    then:
+      # simple-bus conflicts with syscon - if a device is a system controller
+      # with miscellaneous registers, then it has at least one dedicated
+      # function thus it is not a simple bus. Allow existing exceptions.
+      if:
+        properties:
+          compatible:
+            not:
+              contains:
+                # This list CANNOT grow
+                enum:
+                  - cznic,turris1x-cpld
+                  - img,pistachio-cr-periph
+                  - ti,am3352-scm-conf
+                  - ti,am4372-scm-conf
+                  - ti,dm814-scm-conf
+                  - ti,dm8168-scm-conf
+                  - ti,dra7-scm-conf
+                  - ti,omap2-scm-conf
+                  - ti,omap3-scm-conf
+                  - ti,omap4-sysc-padconf-global
+                  - ti,omap5-scm-conf
+                  - ti,omap5-scm-wkup-conf
+      then:
+        required:
+          - incorrect-usage-of-simple-bus-and-syscon
+
 additionalProperties: true
 
 examples:

-- 
2.53.0


