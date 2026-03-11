Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574001125842
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 15:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0zBKnpre/AVifMQIjMP6sp+9Bc+YCFuHJyoCZtCgTs=; b=kP0F/BuOYg9yGm/jPsLjBMFScB
	SOhNC3C99MQFqo0lnqjlHJTIehGtqCjex4J67X6LSlR0KYdnRMTKEk0Y7K5QQyrUJCMf/ork/JXQ8
	bgGw1xBWY73UCRnNb4kzRE+OXE7KBIFukeAhjQ1a153Mb/GtI1sQ5Gx/aaSQqSbQUoxzTygEZzZ75
	A/KmJSvfABbCkDC+xu4EgPddJANadhEcbio+iQnijo1sXc3oB1NGeudwQWEHTyjFT1Sz0V1i7Iv40
	dpT09CMGvmTW4a5Fu3egk6V1C6A8cxThe2gSJFYS9L90tVeY20JFPM42rJT3YRHHoDs7BWyHC3O1V
	XXAXkdfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Lp5-0000000BrKP-0xUA;
	Wed, 11 Mar 2026 15:50:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Lp0-0000000BrIh-48Sv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 15:50:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B9s7CF248937
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 15:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=n0zBKnpre/A
	VifMQIjMP6sp+9Bc+YCFuHJyoCZtCgTs=; b=hEAPOrAPW1i03yZZKc1uLUc5Mc8
	jCitr5K900sVwctNz6ouq2oXEqXcY3ofCBsLe122knmkJ+t1kIseBcT3c9EPsNC/
	4y256W+vBzru1GxmnvWWTAGsSFu1bdkaxezYWOEauwCn+G1rLjyEzCY3YJtJd6xK
	xHgKqbjnvCPMjXr6IEuLzucOmhUeuxW3Y+TNQjZU24KK9hXYFgRkvIqpGcR4MZRj
	AJ2WAU5qAuiAq2fkXyuf1zlehFczbgbdWl2mpHSYPsAb4PlK5kdafziOlg7MHuyQ
	I+lI9njMwSgyc3PsP9KWDwverFX7Ud/N5oz8qDrm/5OG3xgC77onyeWmNSw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv1494g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 15:50:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd77502295so2506935585a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 08:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773244205; x=1773849005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0zBKnpre/AVifMQIjMP6sp+9Bc+YCFuHJyoCZtCgTs=;
        b=TAqLJg9IcB3k/gAaXAgm/UcHfYIc9kwJXh04dpNFoywE4srGft414dBOY+P9UGQu7C
         0f6EUbp6hfamW44eAZlPHPWRwt5WkN+BLs48oIRN2aZVffyu5NLmQXl7aNwxWtSo5EJ8
         O1xWamy6gc3r0A1mWFp3vjlEowAcgt3iBsF8x7kVvmNPdyANbmEX0Ec6tfMUzIgDj4Ev
         aylzjXVvkg3vZNWmSSalVgWJ9nAFIzgzc/wZUIFFn7llzIPqkqR928W6Yv88S7J1TNJ5
         jGS6VmLn4kD2+m27wlWU5UgxLZc/v0rbhhqvVF5Q7Q3sKPJ6jGnX8DUFPw3Ldtxtf7hf
         pFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773244205; x=1773849005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n0zBKnpre/AVifMQIjMP6sp+9Bc+YCFuHJyoCZtCgTs=;
        b=Yx21OMTfjP5yRrxG7WOOJFg9WggqRGSIrG1+F/5kDY5Gsc0NUs390cEnYAr8/hy1cS
         xBIHUPU3TOkQgyvZUFpJNyLSxcCfehSAkcvKm/xu2ep9AuywmJ8DSnTl3C1EEDVHK/FZ
         g98tbchsiYGFU1Wp6Wv1U5oRwzC5sdTONRv78vm8nClJFWrIl6XuX+uh3uuK1pzRAiXV
         UHyEAg2XI1UYv/mck/LgllFOJemKXIUN/TIP1XwA5mZx1/0OhJJkUwymEZXCcYzpyuwA
         VrP4Y6zlW+4LaDKgkTGgTD3/1HyiMlW7KjMLHs9xw8BDgM+g1uQ/jocA2GL6KX7g8v/q
         WWUg==
X-Forwarded-Encrypted: i=1; AJvYcCXOFWeW3tF1Dfkd0ZIoQ9bvAPPB3c8UpDuhEDAFxYI9yIdgua1BKcZmttAyOYTUiNZVmBLLaVEr3CgWjQrR/9z2@lists.infradead.org
X-Gm-Message-State: AOJu0YwDKUFQdUVqQzN+q/6qtHO3jhRAboBgU2/Jq+ZGgEFqwVB1iezz
	nwhZuoZKY5J89ovCkgLgjUdlRjDlppeV/amXYS7OZxPQV0iFB37q1j4P+mCyC7IPUMtCrrEdHhA
	NS+bFkKHAySywLXfLxKC1giji+mor9SeowCZko7D/wy/cMx+um7lIDApoeuZ2/kmLeZrUs1dMeH
	uZqg==
X-Gm-Gg: ATEYQzw/UcR/PCkbwPSB3r6oURXyI0V4FGDaRcJ+CSQ7ur8U2RbJ50mhgK0zO/N+taD
	SejjwRuk9fAkuxKx0utMHt8kxp1s3NaHYYib+CPpnum0layS+uzVDD2vRhgOqKsiqhDD0Z3Ty54
	GMsKN9seXTNuN8NeuEcmP0Ts2/dtEyqfMH4xkScw09zu3vTCt6mLTN/jYL2gOWxELO0sB5GPMfU
	O9zkhiYb3WLX43UKNGn8PiASwLm2KmnD7KApr9cdnZaIvBTWmq0BLk/9dLsj5CbmP0sNhzr6iZ8
	eUvD2gDRr0Eh7ZgZG6xhRBj9U4JQ6zT5B56j9PaYH1/jsv8e6pT400Q6vIOl6z4zPGfL6xsvEyM
	g94zrDpkWz14Plbp8k12yaM3UoWRDskVmGevL
X-Received: by 2002:a05:620a:45a9:b0:8cd:7ba1:cb with SMTP id af79cd13be357-8cda1adcf02mr363893785a.72.1773244205118;
        Wed, 11 Mar 2026 08:50:05 -0700 (PDT)
X-Received: by 2002:a05:620a:45a9:b0:8cd:7ba1:cb with SMTP id af79cd13be357-8cda1adcf02mr363887885a.72.1773244204626;
        Wed, 11 Mar 2026 08:50:04 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0c678asm25127285e9.13.2026.03.11.08.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 08:50:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: PCI: snps,dw-pcie: Drop deprecated reset-gpio
Date: Wed, 11 Mar 2026 16:49:57 +0100
Message-ID: <20260311154955.145120-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260311154955.145120-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260311154955.145120-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1538; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=RnYZxOGsa+mCQhaXimkmXMcqyAGJ/zUTqL1MBZy9xZU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsY8kxlRmURdHdtI8/0HVlJa7uUHbEQraOatEn
 +8Kw/6+6XeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGPJAAKCRDBN2bmhouD
 1wgND/9pfGkjEbEGF6IrwzNP4yJ24xfxyBFJUjvptxx/Sy6yznYf5jGO2gGp2gKf6eqFuP/4MOu
 Pt4hYMKECVRn8Xd66fqUavLMHj3DO2ws09f23c7BQ/zYs6hS1XU3Iv+dMsUZkFI3mrEwzf4jNAP
 dVaMhL6WiYPW7WfyfdVVGUep+phznFD51bSL81AmGlePRnwQnEuKwG1cJNHQMzoeCFzUGf7MYAh
 weRp6YL/+8mU9lenv4I1BZSn3QoTxnOS1pZqT+9bXFtKEytBTHQNioC8paw/50soFcd96P38vOI
 5KLims1oV6kPqPJyS1qcjzXxLUl5WNoeLgmRccv5LLKMN0nymWYRGz4JoZ2GomridKt6Uz019Aw
 lYuZZwAPPU6ZYrmtwKPXsz7RbWIqI3f2xXJ22YAV6rmKwYizQL2I199UtiTB8ApSboh6+s+iDuc
 O0/cN5NHgI3x+99M+NpaYunGdL6un/erDicM454JieZT6+qE2j3UkLWEJ2o8f28b2cxVy4OqZgP
 aoM4ORtYHorWhHo5GSGveVQtisdIT+ozV3Cq8k2WiQvW+mpXz05o2gArmjQG7vD/9oupKhnwqSR
 ahYcxMJ6JCHcQBT+Pl/0JeRK5cgjoZI8Wza/4/7ww3+erA78/AL891X8rCM9QYUOXrN7RUXl4oP pRypIFiHNZzQ/VA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNCBTYWx0ZWRfX5S3jrUirdctF
 4maLJgpKmTmExZ/8IPh/mXefh3CrEWfGQ3mrJOGP2AwridKXUFXNMQ2+dY1X35WtnS2Wzw9HAgC
 syCXN5fzzsrsZFUsBzUgEqjNuWw9RxZccBpVZofjzwcY52+1C4DxVfY9ZJ9Qlzhy9xuLWJi9woq
 wG/gC+fccLaPyZF1kz3UNv2QH+GG1BSN0KpRBVl0cIh//zfRlmUdq3XJuCD1W7fTl67txlWEU9M
 CYrYqdQj2pzR5E7Ni6tDqV82MFdU6hobOuApYmziY8IME+C7t5ryoVPV3l3KieVFJHlU78KQqLH
 +6N4P5JFYyOJDEbbkUOQX2wsPSp3JNmmMBD2YB7GZ1bEbQSDFCSxA3JLf2H8Q5MDoPZEfMkOxnK
 F96frKJz6wGTUBDGQw9YQgS6tsc6VlD6sAg2oj6gQoCKh+S9+eU2w45zjOkl+LZp8TARgGb5J9r
 AGe2w03DzutvnkDYQ1g==
X-Proofpoint-GUID: 5XTTv8HAOcu63nnZ3T7SNDzIRCZEN7hq
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b18f2d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=BpcZMUz7IwU92FFy25sA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 5XTTv8HAOcu63nnZ3T7SNDzIRCZEN7hq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_085007_160199_2B0D1E33 
X-CRM114-Status: GOOD (  13.28  )
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

GPIOs with "gpio" suffix were long time ago deprecated in favor of
"gpios" and this particular property was documented explicitly as
deprecated since commit 42694f9f6407 ("dt-bindings: PCI: add
snps,dw-pcie.yaml") in 2021.

Linux kernel supports both variants for a long time, thus listing the
deprecated one is redundant and instead legacy DTS should be updated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I will fix DTS separately, so after applying this patch there will be
bunch of dtbs_check warnings. That's expected and fine.
---
 .../devicetree/bindings/pci/snps,dw-pcie-common.yaml       | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
index 2c4dc04f9984..deba46d7a924 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
@@ -209,13 +209,6 @@ properties:
             - pattern: '^p2u-[0-7]$'
             - pattern: '^cp[01]-pcie[0-2]-x[124](-lane[0-3])?-phy$'  # marvell,armada8k-pcie
 
-  reset-gpio:
-    deprecated: true
-    description:
-      Reference to the GPIO-controlled PERST# signal. It is used to reset all
-      the peripheral devices available on the PCIe bus.
-    maxItems: 1
-
   reset-gpios:
     description:
       Reference to the GPIO-controlled PERST# signal. It is used to reset all
-- 
2.51.0


