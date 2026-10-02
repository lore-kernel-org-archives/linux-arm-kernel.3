Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB5ECA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 06:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AUVkIsWMw0dFcQIEGk+xgcjL36OGBgewX3HKO4TNcdE=; b=LimH4arBnHwYX3SDhHtSDkeBo+
	sdsDPCsz5qh6YAzW7RET7JVy07dMR0cmg0NiUAf+qsvwo8Pe3NSP3b8akhTlyxLwSJajx2phlaFnG
	lNxpHynSTRMGUQ3o2HN70B9wffhGIUBG5yvQg2tMSZ7yZc67zd8lbIbO3OXvMN334nkbOfucwlxQX
	iW1GZuEQwh0e7ZgQ3JLftJGAKT9gWt7R+1mIazokZj8mQjjb4KtwRpN3HSnALOp8DFOg8CfLySOHs
	GeBXeRjGL4F3EVBNWqo9X9/1T4fX7uX0/4HqUk9Zhn20C/LI/cycqhJMnrtsWs8zQiAQAGoJbE2Zb
	9Hyi8xug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWms-0000000Aijo-3Sf5;
	Fri, 02 Oct 2026 06:30:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWmp-0000000AihU-0xsb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 06:30:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925jEEj1068078
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Oct 2026 06:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AUVkIsWMw0dFcQIEGk+xgcjL36OGBgewX3H
	KO4TNcdE=; b=RpNYyUWWV76/CZ45UrJvQOahkxFYX6gC6ZsqM1GgZyVLb9QSO6J
	TlYoLePwdcO45gnQbBKw4jfbygXjdWNO4ZIkursTG17KCiqK8UbBAPNgmc9MVUcq
	SIEB0d2CwF5JDRXH4FJ1I8en0zZ3zpiVFL2nmEpT8/VQrJfSmTSYMQHHL7fbcOey
	P1ZbwIlVWhu4Oo6IyDdLXWz/xm0vgwFOOE7CjaGz1340BFFok5jn3Y+OxKTiJsfX
	DWGgGqUOSjCPBMI7r3zq2zYClDlPAUCQn2dVNqdRMVAtx3k3B3u/JIef7yFL/ztO
	UPpQ741liGrDwlfQasJmGiGPsVpmphwE88A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1qukbmsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 06:30:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338c59f90dso28296621cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 23:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790922625; x=1791527425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AUVkIsWMw0dFcQIEGk+xgcjL36OGBgewX3HKO4TNcdE=;
        b=Qr1occkw0EfWglgNBfLBwJu2SyfoA1lIVlOoI9Bc3b7bm2k8OjenGW3NENvYzY6isS
         e61YZ7IiU/OA+JEtDOK3QOWqnFl49tIDmr8RjHWxAlqFe006Rj9M2PTxTiCBasvIKHLU
         MhjjILX61O051T2+oyQBLGE6fb3Ks+rPOEjQJvEj7ly22FaGG3RyLOpubRSZcCigNJF+
         RB4TClNvEYk9zI3uRDWtHOOqRuGpyNF022gkb9EjH4uDZ6hBOyQtLbG3T8LTkClw6b1c
         HJ50V5UL7pZKHhrG1ce3J1j5A05vGej5v7F0lOWYdtK2iyGA38l7ptc+HL0s90qpeIJE
         c8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790922625; x=1791527425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUVkIsWMw0dFcQIEGk+xgcjL36OGBgewX3HKO4TNcdE=;
        b=ozumU0cJ6QcQ4OtLDungffhMHOSgKnd6ZQG9KeBL+vBNHWNK8plmlJr1IR2yB/bDF/
         INFe4Y37+QwZZj6FH23HeBpIPANYzgK6tksvU6DOnoplLhWA7AB8aKscQguLPz6veKNq
         6sLG7ja8TbbYztIW7WWnHgUfnQoFhhcmzB5BEj8mvavJZ8p0nSR93NENdGJts5H3hxOk
         DFueLztr0IpqnAfP4jFhd7BNdZar+ClL8EcaoXnE28Qicu4UBpCxyqENJlcHfwFGDGBd
         e02F/1awoh3z4FxSaXV2bX/qokFJ5JP2zpw+mWSFNb1UCqcbLwjsQEwPHtfDkzfd1NTF
         CjAA==
X-Forwarded-Encrypted: i=1; AKwUvBxBq9E+udPgRsv8D2Sb5RQaTG+AHJ6I86G8jMVUDNXQT8BcE5xuloHMwT0e9MXXkF7+EzylGXFCYcSgjiXGieMY@lists.infradead.org
X-Gm-Message-State: AFuF++mv1RwVV7ocsY533iYAjBJRDs6yxMiMqJ1DIfaFbObARNWk7Q7s
	pADC8uKaLa6WKxhBGd0GS1xiSFojIBpJ9ewhmKy96TreoIrIyRkRTS3G3PvcMLAuwGT9s0Z3tIr
	Po2PMlI858pyfWD6Q1ybWS4APTfemrdNpwY+uZvi8pwPceMXxkVwD7l0lGgBxgCWg57oH5otG/I
	jakg==
X-Gm-Gg: AYBFou1gQJ2+VVrOEyGjyz8WVSZbHAQJrJDKweZSsE0gpLc9/nu+T/nmkubxkSJ6uTn
	Gshlw0Zmlt1DXsDOyZuFu6hnhJD0GnKdYhjBYzQ72Q7nibJ5LJmuZQhlmFw3jET3hj1Scwjmk2H
	57VNskQQOB3YA96EagI2bZllJs9vSjF/JrcyNBEuWFtc/a2pYDJMvUP1ANn2X0wqnOno++dFELc
	cdXDw9AMa/WpPObqS5kCoGmRYPGEB2u15lPZY1KkQqfSbbOsSSKwSUWL5okvf9XOT3e4asi4/fY
	qBoPOdnj7j6iPZFgqcTmSdux9F722P/FBwVD1sF0gYD+fJe0yYkd02k6DbBclpA/B6eJT+mM59H
	FwqauB3n+Gg+i41g=
X-Received: by 2002:a05:620a:7088:b0:93b:d88b:ee01 with SMTP id af79cd13be357-93cb5c4dd5fmr1081006385a.34.1790922619629;
        Thu, 01 Oct 2026 23:30:19 -0700 (PDT)
X-Received: by 2002:a05:620a:7088:b0:93b:d88b:ee01 with SMTP id af79cd13be357-93cb5c4dd5fmr1081004585a.34.1790922619171;
        Thu, 01 Oct 2026 23:30:19 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104c09sm3361558f8f.32.2026.10.01.23.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 23:30:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: arm: keystone: ti,sci: Correct reg and mboxes constraints
Date: Fri,  2 Oct 2026 08:30:12 +0200
Message-ID: <20261002063011.38972-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1048; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Z1/5o4RAsawBPWmbuQWta9W6Sxz3I4lPmR4hBCTFPDQ=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGq/T3PIMt08WCCTfCYps6hW6Q2EK0e9V2qrHFO7b3EY+d8+d
 YkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJqv09zAAoJEME3ZuaGi4PXYHkP/i9+
 dnDT3YaZnTceK720Db+Z8zIZlt9zhYH+1bhxl2BGH/BoKesyPjeGX/3El0EU+8OB30eL5Z3/JZW
 98/1XU5cqVVCnGLl5djI+04v7dnktQ42j8H24sp9lu9bCrkb25SOIMJPhmWtXRe+15WpvzlEeEq
 mxfcws9C42w1TqRkcdQAeV32wwfnFcgODjROS4n+/tM03mbz60Kl/YxHTr7v1NQJhO8OgmnnjI+
 w28huJs36Pb5UqEbylYpzEIfsxKTgjPmV9iC1Iga8bCZeLJkA+IFmojL9S7IE7QQFjdPvLKaKWc
 q1Nmgbdo90GOegRy6N9kNPQE0O4MKK0hnMo1OvsvEwSMpk2fHdGdhtw3msp3rV9hCls3E8kOkxS
 a59z1dRw3jpmvb4EXNMv8OgP7heaF4HiOqIerT983yJN31Z//yq0A6wru6U7ULTtGsd43SICO3/
 htsYZAY5Ow7PPjlUPG9XoUzL6MX/5w1FVRkCqcD0lZT8z/PK6HdcZkdn8liP/4y3nkHqqACm7gy
 Fz1IfjQhRkF+yNoJ/eRwzPIvJ+FhjpeIa0xfUTBaehCC0nyzc3qS6LK6FSP2FVzFA0zEWxILynU
 Q8OcK607OfS8Q6ulNRcve0nj+wNC6iaVM/osUB7XHH9LWIGa0LKXrDr7ZScmumJZYXcPp0lqspv cGtW1
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAyNSBTYWx0ZWRfX9VhOqoxfOo53
 GVJOlpvSqiDXOnG9ukkMAiwCQbdtSUJvNxsfjMeYbalZbaYZQXwfxpPFU1Vu1PFwNF8O4QACSgM
 HHn5SZEm+C6KCLXkUnE1rQfz1bmX+Jg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAyNSBTYWx0ZWRfX7ZzFtJML91pp
 vrigFutiKmLYMJ/ulcetR/+kITXyxvS/SFksRVUCtIWuaAZmbOevTXPJ1r4W7n2LkHPNM09oTMU
 KMzzlu84pVOZ/uXz3fP4W7K8Wj/7Bfwu4qAziCqbX2SgF39Dvsl/qHTvCsko70U+sv6yV93ddmR
 BylMZeXYBJp/PKY0bRftfXkSdHFMP8GpLZ/h6D5SR2TAeh0hLTWKakvIPrZRYlw5KhAoJCXas5v
 44YUv2R0Gs3DIJo3+TGR5jN9i1jed1uppKmGInYXL/KV7OS4l1TngOOmfHRFtuPTUwrpzAETbE1
 agk3Rl+b5g0gAxSOe86cmZFjyRnBkYcOaUiAtpppMOwJQ0s6ySYRxHzEDPhFyfhyhcDZaKidEX9
 TEnITyTb/Hwcu5QMp7EiUNWvhFRmXphz32xELvoEZTdOJ48QXZvBOFzuD3r37IrDqj6CebktfBW
 z6Kb5fIGB/G841paxFw==
X-Proofpoint-GUID: 4ISn1ZyPwwu1NanBPbqxmfcN_ZGxKNJ2
X-Authority-Analysis: v=2.4 cv=TdADJhQh c=1 sm=1 tr=0 ts=6abf4f81 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=e2KClx-4LWyga-VmItEA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 4ISn1ZyPwwu1NanBPbqxmfcN_ZGxKNJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_233027_422918_A2310BED 
X-CRM114-Status: GOOD (  14.65  )
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

minItems does not impose any limit on actual maximum number of items in
a list, thus it needs maxItems.  maxItems on the other hand does imply
minItems.  Add missing upper bound on 'reg' and 'mboxes'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
index 25a2b42105e5..052e23966a8f 100644
--- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
+++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
@@ -48,7 +48,7 @@ properties:
     const: debug_messages
 
   reg:
-    minItems: 1
+    maxItems: 1
 
   mbox-names:
     description: |
@@ -59,7 +59,7 @@ properties:
       - const: tx
 
   mboxes:
-    minItems: 2
+    maxItems: 2
 
   ti,host-id:
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.53.0


