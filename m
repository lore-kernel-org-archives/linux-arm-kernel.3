Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C58CD8CAC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 20:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aa+ndaOgUThxNdHVB0ASmJ3j4g2yeUEnhZvQ4B/J6e8=; b=q2liWhJk/8tCUjGAc4BWXax6q2
	GTFVdytXsyTfXnmKUNcycD3PSNEkc9+RACbxfPlikeK/Kc9jaWVI8hSA7cCvEidXYizSd21GUOsyR
	Z5CdKhvsyLMiEtSN8P2fKEQPC/pk+m9ySgMcDKKwQIxBIojq/j/QJjb3nAMpZjksgjZaChnzvioUD
	e3yIEa1tRbY0b8xBhuaGl9rFQX00XHYqTKQOtMdcfidNlUpbSIKetrFDJWl1gnA0HSYee4NGBpDXg
	wPw/+a3Osq4TuXOH23a9iuB41EPCBQe55XNOg8e1v8vfqMLWsU5HRRzFnhRqlr9dIkY+klOqjLdZa
	TKFaXu/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgpx-00000004NLC-2pDC;
	Mon, 08 Jun 2026 20:44:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgpt-00000004NG0-1643
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 20:44:42 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658IxBZM346375
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 20:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aa+ndaOgUThxNdHVB0ASmJ3j4g2yeUEnhZvQ4B/J6e8=; b=UxqmRTY9puFB7LWL
	ZMu0Qiib4RidpT67QVHaJx2XWnplGgMlJDqfKD+FGvqkOGj77M2IhfxwqatB3Bh6
	MeAf4wYyOGmzSi0oSa3FK7lEHss0rngDg95X8K1nywjpEmgKCuAiqFQ+ONKNH1Ud
	ScjuO2ZDFawf0CTjKgY2LE8K6QdrArARPhp0oQZj6oDAFZ1EwOylfi+IfUKOBtoy
	3onE4g7R4BmbKCdZurEZArH9podQMV73f6cSVxds3g7DT2AIhIJ0jmZ/EQmQwwxq
	+FkX9f+XnfAEPJJQcwup7UXe9Yl/DaaPNiCll092tEMxTZCmQIrpIf8XB9SHUcSe
	v31jAQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxee235d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 20:44:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517c65e497eso9094091cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 13:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780951479; x=1781556279; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aa+ndaOgUThxNdHVB0ASmJ3j4g2yeUEnhZvQ4B/J6e8=;
        b=HYqL/Jop9Llpu3W1aV19NnbGiFjqvPIHOOIXURUlCPBlnwYylN34JX9VVGDqCwyROK
         c5sMwyjUXO2g7g/2VxWREaemY8eEM8AuW+ioJClRzdd5dOfDAnjBHcYs6EaiQ2rm49cz
         z8HnXfJ7g+aHbYPzV/EMqVD4tNpaq9CA/QWYnvu8aySUr5haStBqYYwb2vZHzSJE42of
         UZhWiiKQSPS4kjkyDjUCbfyFK9RRyzZLNHCfsuA0RW7P1kpPvceeSrZHATn7ALkXb5cq
         6PcjUQIXFvz1cpD95NToMN/oxw2hNdDERqJsT9y+Wz4yFoY4Ls1grrLltQ6qEhUH2RHL
         89Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780951479; x=1781556279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aa+ndaOgUThxNdHVB0ASmJ3j4g2yeUEnhZvQ4B/J6e8=;
        b=gIzUp4cJkMOq6TyBx0uvVkwoqnlrwNNNyzkCRNTj/z4cToqdQKG+GVi/qu8C7KSFqa
         qgLpPBCsfBvqvEQOTz8Tm40S1S0MtrAcXWCN/rZWVG+povhIFpQrnOxU+4zWkMFmo5mS
         34VjJXFQZoepHt6Dcwq0osLdWGNkzMJpaOcI1PPIYYslcAUXHyUH6yg7T0AZmhbRVU0c
         Omce+3Ia9mgKce5p9myB3uQZrLaVIC5PEH11Rwfdv2hwFqJzlBaSX/Pp2RrOXHhmWMMS
         IOm2y4x9A7OwEoQEpnjT5vxAWQLqLYXVir8oDRU8bDdRx6miTuTDW3kkEWp3C8Nkejve
         TJ1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8mnMX9AORhdkndJra4sgZaFVgL2aLSBwfAPtad9iVsQLHEbfWhfDRB1cLJjaJiCDWVsgdMH/SiZDtWaCErOhFF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa/Df5xmQhsayRLfNIMS4pGsSFaPotQ4tIU6AdgFpW2ZuCkhjD
	pIOaCJqQ5htgWAqvG1YmK6hn6pP7FH7Wp6EDiQc23K3qeF+mqw8TDth49k4ikBensu5alLtEzjF
	fWu0yxj4ppktVwfiXFh2MUmAkIGPQEOp02ufo7ZJ7gkb5WI8piLrTspBC93c7oWkAGKwRZl/AHf
	8UVV2SkOraZw==
X-Gm-Gg: Acq92OHRaxJyffgFQZu8c+DFzY1jeMQl1uluVPiCD42CW61uy4KvkvQ37q5wSOwwGu3
	NzyKhqkM7hM4nSeoUMu8MA1C9CHYFyNs7o1yy9oRTblbjgqXfmUjF/b+zBO3M39+xVpn9kc4f5o
	heWvlrmTC6lSKfmGndTVBynlVV+Jg7AQo8PpzC+artf0v4zR+e1q6qIImo8nDsKH9bwssuhWaCB
	gczcP/iUrvs4WiV1uiZX7a5fUWRbHLMvUy1Gq7XmxN1kwDiJAWnUiz4qaWskJEbALHU5NuhoW+c
	RK5J2BYTKocE9Wn0FE/BR/Z/uDa2t08E0Nc37YWcDwZJhr0BzJ0+/GAWEOlpFNKXOKuAfAabQkz
	UsViOaeiKOhUrXQWq3jVIAh6k+EJoAfCclkEByHxryE5QzS+34HMr0Og=
X-Received: by 2002:ac8:7d94:0:b0:517:884d:3801 with SMTP id d75a77b69052e-51795b510a7mr238024321cf.25.1780951479308;
        Mon, 08 Jun 2026 13:44:39 -0700 (PDT)
X-Received: by 2002:ac8:7d94:0:b0:517:884d:3801 with SMTP id d75a77b69052e-51795b510a7mr238023911cf.25.1780951478802;
        Mon, 08 Jun 2026 13:44:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm44018439f8f.32.2026.06.08.13.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 13:44:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 22:44:24 +0200
Subject: [PATCH v3 1/3] dt-bindings: mfd: syscon: Disallow simple-bus with
 syscon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-n-dt-bindings-simple-bus-syscon-v3-1-4eba9ec1212a@oss.qualcomm.com>
References: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3471;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GGm0AisNFCyHSk5n1cRU+JBiint9Mvk66lCZxnmAJS8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqJymuLrRKQk+tXDx2C3XILUa/Vb/m5SqeAMHbs
 hX701Fcl6CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaicprgAKCRDBN2bmhouD
 1xNzD/4owClN9H1JCOAoIzeu7RK56xSXZgce4N5pJJTSqM+cmLpO4VODAdnX9M90nuMT2mDNxlD
 SdZfpjjNTupJPwAZX5x+aSPrqbWsyQm1nVutsjB3jp7H6S8/1OnP5Z4BhuiwQEAhch5x6k4NVvY
 qL447Hya8vixLLsgY9sANwVmoXUKUmziA/9FQDpSgQUsoZsBPSZushtTAtPvFjdglp3PTDWJrSL
 QDkuLE+q61ip5Hpuble0C5lsc2dMCKrlXW6Lez7hvabG0BOoND5THfBuKNChvxJ4qRTArQF/VLU
 AAqUynQwJTUDLRNmHYcsvOuss3E1UqUdj45pZe23Wnlx/0WyPokJRUyqWtxelGER/rgEH4lAp3q
 qItSXbI1oiHviWpwFk0wcXYCZ28ekjTgqi6y+NctPbsPQk0mtADjQiu2eoA9gP6J/gR0fpYjBrC
 Q/en3j42uVe8KxZkbNTMCXke5RNveZKSbcz5vRoSFJiMNphlzRR382sRUXdhW8VSPf5cUIVjqlb
 cm/On61l90dg5x69fhEH+rDEK1Sc8U1+vsUhiYhWoq9jtHVBFEWUxcS5GFohZLrO5VrGSfJb2xe
 WRXhX3b9AoNrhcspfMTcxEmE1w2Z+SX9qPJ50ERHH5VTjFuC2lKRS09/TExgKqaabbdOzG+bCnK
 L1BibnK0fC/izPQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE4OCBTYWx0ZWRfX7spff6E1MN80
 vPzkUpEe8eE1rXYzXxwiFJCytzkXphpeqQWJbSY0tEYq+z5xUpEcIpa/JAooS3I+2/RqEBVyurI
 E2moe0WFaxJcIUZjFeSFlDh8kjwjQfNHAoG3QNCy+8838Tl4PtC01iSY3Zm1ZltzFm2/9WeIr/K
 rsIogxBWFvuE+F9E7YpETje5BGLcw3FeDlfgqh4sfhD/Lpu+mjLEAbCoBIFEPP86lRFJMTSZ3Bq
 4kPSuHU82+yNfdqTKVdHu3toyARJi/R+/8zwPryVSYqtGYIoKdZXmJ1QHIRjjcapplbWDlqYhNM
 UIHO7ThezB8CCCDOy57gXhksLKrtaAx/p428cfQ8tiF2hnowsR7kObYOKdzOy7NrM7xJhGk5gUy
 HQdhdSy+88QVLASZ34/Hj+JoOH2bewMaTKn+aA9vWackti8V0Y5L9dtD9JzUfATgVJdPIZjELXV
 MX89y/WWe/sYB1O7LZQ==
X-Authority-Analysis: v=2.4 cv=V6BNF+ni c=1 sm=1 tr=0 ts=6a2729b8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=SC3sQ6iH9rxi55wiDKQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: KwPQgok1U3mENhglo1ZPq5M8ZLNQq84f
X-Proofpoint-ORIG-GUID: KwPQgok1U3mENhglo1ZPq5M8ZLNQq84f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_134441_450398_C3C0A749 
X-CRM114-Status: GOOD (  18.84  )
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

Additionally, add comments around code enforcing two or three
compatibles: it is similar safeguard detecting incorrect bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
1. s/ti,omap5-scm-conf/ti,omap5-sysc-padconf-global/ because it is more
   appropriate (specific)
2. Add comments, why simple-mfd+syscon has dedicated if:then:

Changes in v2:
1. Complete patch. I accidentally sent only part of it, built on top of
   internal WIP which I forgot to squash.
   I received Ack from Rob, but change is significant, so please kindly
   re-review.
---
 .../devicetree/bindings/mfd/syscon-common.yaml     | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon-common.yaml b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
index 14a08e7bc8bd..2d5eef5add54 100644
--- a/Documentation/devicetree/bindings/mfd/syscon-common.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
@@ -32,6 +32,7 @@ properties:
   compatible:
     contains:
       const: syscon
+    # Always require a specific compatible for syscon
     minItems: 2
     maxItems: 5  # Should be enough
 
@@ -52,11 +53,44 @@ allOf:
           contains:
             const: simple-mfd
     then:
+      # Always require a specific compatible for syscon with simple-mfd
       properties:
         compatible:
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
+                  - ti,omap5-scm-wkup-conf
+                  - ti,omap5-sysc-padconf-global
+      then:
+        required:
+          - incorrect-usage-of-simple-bus-and-syscon
+
 additionalProperties: true
 
 examples:

-- 
2.53.0


