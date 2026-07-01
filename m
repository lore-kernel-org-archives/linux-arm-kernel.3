Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8195C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 10:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZP71cCTtjFAT7ABrPSL1FD1hgHY+ifVGUdigE+dsC8=; b=ESFE9PewLQ4TS1fSkHGLFa0xdG
	bkJkd6oHFPBGkxaSSbGrE89EOMVfRgR5clBp4/kULeAdf1c7tJnRKPvKGWDe4Xx0I+StZED+bh+WJ
	MstsfMq8k5nPLTSK56lOjpE9Lq3dbcJidVWs5+A1f/yLgF/mPFsqz0uROf+t3f75O57fyuAYjOYnl
	FliFBQOE1F7USFhe4GEiMCHL7oQdNTXanJhr3LGe3wHgLBNRiSk7At/7p3mrrpjVsziWC9mpqBV50
	pKAl27XURQkQDxAVpqg65o5k+yarF5qK2bZr7sZcFLoNxG/6YZ+9kRfwf4ET0w/Ofd/Vjsx6oAl+S
	AmEEZv3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesek-00000001OGf-1Vg1;
	Wed, 01 Jul 2026 10:59:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesei-00000001OFw-1MtA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 10:59:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8lAu681875
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 10:59:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RZP71cCTtjF
	AT7ABrPSL1FD1hgHY+ifVGUdigE+dsC8=; b=fPyuabJqhW4sB6R/PCNXbeQfFct
	v28johzREnukowS/9kAUPeY1Lnf1WIMrXxzJ6xRj7IV0UzBP1Rm9X1BHYO2DZoRo
	jRCDsznbWnHdIypLKqFHbFmIs+q4zhpjmFakLVIbd4z7ZzRgxqDnTB56WUjRTnnM
	4cUL2YEFofMwgpcRkVwHFYCuP9yGLf6TJp/o6Ly2s37YG3SDFaEHfBe+GE8vwLUk
	95rBDQ2wgPZWxNjvYzXOMQkuZuz+kcUgdve/ClNV1mWiAfEf4c2h0UhaEcTDyivj
	jYA9qhnmLHrClhwjk0c30BhzcIn2nhULkh+F6W2Vtz6wAc/DcCKM3iVKxsw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sksnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 10:58:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e61b38eddso105149385a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 03:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782903539; x=1783508339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZP71cCTtjFAT7ABrPSL1FD1hgHY+ifVGUdigE+dsC8=;
        b=ZtTsarROPpdt1opB1DaclrNDKiSbqB1y/ukDFdBtCWIhSUZT7wbYsmOHCAwnwr6BcJ
         vWlMlVISagpr9slTE7sxM1eJAI78hioBC1pKnK9WVFouhWXjYTx9mguw3knTCJakmGFN
         6+SQgJI61iljRZVEfFh4LdCCtMk/t4Hi0bwvHWNf7ur1o9xilV6QMEDLxbvs89Lm/Jn0
         zNCi6odi4rcEGxJdQIVpESLqiaNihd3Qj/JAgX0qaMRXmGLnWNXdTF5ctEEzMROnUyz+
         /3/uIZ39ejaZockzs5vNMvf/+3l1metK9lXu9p7eR7a7MNGB92ZgCJlj4Mvv5pL84pcJ
         3log==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903539; x=1783508339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RZP71cCTtjFAT7ABrPSL1FD1hgHY+ifVGUdigE+dsC8=;
        b=QH5Wle560+rkYom9bX87H3hWWvY7k+s2V7FyQ784wGbMf2j3Y0sSuR+pGt0GbTTcHc
         4dfTbPAelVyT0yhfv4c+qAOfUV3RfsVzTwo5xfWzeas9jNynuTyQOsmR5AsAlAmrG77k
         NpQBa564dTapA57lqYkzDV4yMeIM4FTTJ3o7UKv89n2Fm7WiD7ywTXc0vJPoFl9yK+8A
         hZ4h0xHJgCkfC7ShNNhY+/vS//ndfmLwJWuYuvnX8UDPPBJL6NJE3X8hse2mDGwVnd7T
         RNuEMmFbUsvv1uIcHkNTi9JUBqkvnODzWTfaBaeHFtJIFmxIRlGWymH4rnkico5IYW6e
         4klg==
X-Forwarded-Encrypted: i=1; AFNElJ8wI+cEgnzeWf/am+IJs3XkWIVTOIqGqQZaQpb3o9QORt1A9YT/aL6lmWvqLLX24ELHFHQsPGzh2UA6cmaMKC6t@lists.infradead.org
X-Gm-Message-State: AOJu0YyyckmaTIY/YtgRQUv9rrABgw0fB4ACKBgauTC9RIwwNsSdn9rL
	BoIrVZWgRZE1ZGLX3i90oWZewSOdQGH9tXSNnXUoCCDn4V6whOfzgF97zQpVXEAyQ71USOr4cPs
	ivdK/IxB0JhMT0Ns1R5HmHkKaZJ42jQKMhfaMhgR4Q3in8rRWAvSg6SuciIcfjcr3UIMcWlRphh
	ybow==
X-Gm-Gg: AfdE7clHB5JEHODlnZAZQNSCQ3KJLoW9bmBRePLvRmruDS648JB9vxSU2veM9BDyXxy
	cqkzGFDbOqkLA9mxFBlADmy61lUw+KV5O9O3V9BP0TjtzJnHk6yXjx+/NVyB643yaquYoVDX/YP
	l7+1tUP1nmPrI82h7eAxmr/8wZj9+CRcQnaSXTPRwmawc9lq1fyFgJ6IFvTZCNfMC32kS5DqS2G
	mXhb+sP/fHVowdcjWfl9T0srAsMsKw5SAdMRlLgKj9p1aLFR1u+saYufR/5rFo62tzjjrpOXGhP
	lxbQqZnipRk3yQ2TeUyIUTU7ZxiEmNbfhO5gRX51vao6HAfv191TYo5+w1+RtwkbjFZcowy15/m
	GBy3L65WkGJSyR9V/llncSNE/OwI=
X-Received: by 2002:a05:620a:468e:b0:923:8612:f15 with SMTP id af79cd13be357-92e7823fc78mr134301585a.18.1782903538980;
        Wed, 01 Jul 2026 03:58:58 -0700 (PDT)
X-Received: by 2002:a05:620a:468e:b0:923:8612:f15 with SMTP id af79cd13be357-92e7823fc78mr134299485a.18.1782903538589;
        Wed, 01 Jul 2026 03:58:58 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c0e92687sm33275565e9.0.2026.07.01.03.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:58:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Elaine Zhang <zhangqing@rock-chips.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: rockchip: grf: Narrow allowed reboot modes
Date: Wed,  1 Jul 2026 12:58:51 +0200
Message-ID: <20260701105849.197086-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701105849.197086-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260701105849.197086-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1298; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=CKhIr/XIg69RF6pyT8Nxp1+2IRvTyjEQEEoYXrd4vzk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqRPLqT+HVdGxTyuJy8eAd2Wn/Uhlrtj1ovCLM7
 BMUbZ1oUgiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakTy6gAKCRDBN2bmhouD
 16zcEACXyQvU8T+J2XLmlZsBMkv95lOYp63lNjg/KDmsamJNi8lYJW1Qk8ivFzChnUXr0WoOXqs
 W+pe1tO/n2h0YO46JNxv+TYi800gp/BRU0GFp0hjmKw7EHGe4Q03K3BalxH78Qs/BNFhjbXWvSc
 E0GaH+/CNbqqKJTWVvzLCPcmcX160qolrYphYRLEpLUv9BwWfPlwFo0yzRHwdN6eMTPwfevUNuX
 N2gVVSAMjrjBMw9BUzhswNNEF3pGFtonJAJa6AGotkPfUXSrKnZTStOAgoOGUe/DNB+2tmDpab2
 ep0+URrhDd6Ceqcne5xIR/DzQtLmJQIC0ffZBn80MrsnTdF/9EkTNmIpE5Is4s8RLE8rehky3WJ
 IPzgQiT/6VZdyZPfYz3fJ//+C0ebjWg6IPeXRVxzvJC52f6P5ydArAvanUUgjjVkU3gWM1xIGaz
 P4zi+aeC6Y7ZdiQxURrPgJgzqCpJrQCV2k1Ty3/0MNPybKjFtdStOj3aIL2IBNqUFnJ0I5Wad7v
 sU3/WsfDxh+dczj9SAkVrlJXPC3rWX4Zu6DiZZ5JbRx+6S0QO2sj63AyU4XZm7wpCa2y1GpyObT
 bRRauSCLf+gB86D8whCr3Qtq36AebBWRE4KCWqse4Na3VJ3/Pq219sfDfcEE03E0f3fayW9GT7j TMb8dsW6NcipuFQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: l4oN45O9rmNr2rvsozx5YgAGQmzuQbyH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfXx6l9noVr1+ZY
 TMcbGgN6PJJAvQR+e1JsEZHPKq9IrQETr2IaZNgPTVQlA1fvJirxTdaNnJSXUKh6gXbUAj8vaW2
 ZoJcb6TyfzxuUg5EJ2GA5iGSFqPosNO27vY7RYPr0HzJ3mft/uY5B6UJB2To4G6h+G5J4/+jIGR
 yFQe9WAfdBt9fRLDI4s8Jp/v7j44is/do1x2J+Cpl1ZPqqZfFu8/Gtr95x1oztG9AFE8R5Z8QcL
 JiL/w1qdc+WEC0s/lU/wBG3Wmwn+TWcI92bRGHPvBeK4CsudETLKJpQ29HHO3EansBQNiXWsCLQ
 FuopvJ8hypEDADdSjDLygEdf9QveB+vLbAoGrCAoO2glhwPxyGadFkGO69DdJbQXZ0a+cXytr8k
 jxOstI+vPJVPMdCFuxe2GzxQoAUz65R+ZPVrYQu5NVpBoLO7THwHq5ODtqGa08cGjuIUIXnLV2d
 Fg6ww10/m4A+t9C4JRw==
X-Proofpoint-ORIG-GUID: l4oN45O9rmNr2rvsozx5YgAGQmzuQbyH
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a44f2f3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=uYWl5qKCkACiJsL7rIEA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX0+OQp9ZbsgKq
 d2Zo+B+EzZeF9utRpgqhmM2Li3tp9WyHqO8sQxn97EcdB0h72Ks0tfIk/HwTC+fMT/hCkT3mrUg
 DFdY6wj6nV9sXNbXjEUEBu595rV+Y1U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_035900_364203_7276B55B 
X-CRM114-Status: GOOD (  15.16  )
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

syscon-reboot-mode schema allows arbitrary "mode-.* properties but only
a subset actually makes sense and is valid.  Provide negative look-ahead
pattern to disallow any modes not supported by the device, which
tightens the binding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 2cc43742b8e3..7bcb4e2f47ec 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -239,11 +239,14 @@ allOf:
       properties:
         reboot-mode:
           type: object
-
           $ref: /schemas/power/reset/syscon-reboot-mode.yaml#
-
           unevaluatedProperties: false
 
+          patternProperties:
+            # Negative look-ahead to disallow unsupported modes. The '$' has to be
+            # part of lookahead group to work, instead of trailing outside of ().
+            "^mode-(?!(bootloader$|fastboot$|loader$|normal$|recovery$))": false
+
   - if:
       properties:
         compatible:
-- 
2.53.0


