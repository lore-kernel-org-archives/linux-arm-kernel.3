Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB64CDE00A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 10:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=kUnd/QQHwQxSiL1dTB9UaF+fH9
	BUrcjMYV/PRQwXcT9qKgzhlPVEFjjkJB1SZC/Cdo86RTJq3RlWunaDl9IKC7o8+jZur8xm36UjEJX
	GmL06HrGK4FgOYe+CJxzOV7VCHxHpNBJRxQ0JE+XiORkpC/f78FxlBo/3fj2QZ5BfY918PYsOFB/2
	qHhtT1NULt4e39foXOGe06bhQicF/ol02KgQo+phabP6t+sLKetDt2E3uu/pEXaJ013paMK/Qvdif
	IerKAjPaYGfNt915pI2qbkUGXcOG3wIaP/4dxoNZtpmrC+3hGwHCK5UBBOzXDctJucuc+vZ7B9+TH
	JFNEbjMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchbh-000000091DB-0hS1;
	Thu, 25 Jun 2026 10:46:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchbf-000000091BP-1GSr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 10:46:52 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9kBkw2011058
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 10:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=nRfvZ60Rlqp9rNcv
	oHgd2pHed7vU4J3YzF3pnvOY4Na4PjKZwiF8sYjhElRIBdebz/u5NmlB9Q8ufid+
	fmTfC01MewRQS075QIm3VdEKATwOGJfMXyChmrpqW3kw1wXAeO4WC9So0Bz/Jhel
	ASDiuB2m0fN+De5JhZvrxVdYXTOyC4dBOrldkdgpScabNKAnXo16YuYW++Jucetx
	N+fPQaCAGWGIqypHj03R8GUrbZAx2enTofHbUwGEpKQwoKfPJiuNpQapqLUAFVln
	egSOU313amuWxKoxA1Ix8lUdNMhKlLBVqmoyxUQnSrciTpEVc1XW/4Nt/PnEN+Jg
	0PssKQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uhmht9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 10:46:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c2d0a8b5beso17844945ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 03:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782384409; x=1782989209; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=SitsgVDNs4ZVEq2TUDf1duBUqC5ZlKP08qyF0iXSzJFomy0kJ8zotaC9S4EwRNTiNE
         X9bvfgBr5NqWoCG31sZJH1V8VY6dFIa7R2ikYHB5ILquVZQSN6JnabRKpdQisbEQfk+9
         JYYwsPs2OfIt2Y7B6+KctjKwgjt4NlZjZTc5TWBbJRF8qBA+NAYcZ2oMdUbWps9x8khr
         52/XjwlVIXcH1SVZ5nriAvMshY8ehe77wSsVhgnzlUfp4KDWH3geKPJySTETB5Eoe4g7
         Pa75sY7Hg9RZhDcyOFaC4KL9BUf1FpvzajG57DaKjI7kKLE2RCO06KlmlGkK+50Iegud
         1hvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384409; x=1782989209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=AtcVYhzk4bTr4oFcOWYSDZYU06PtHcJZ4lP/aDmXHuhZmxzKClZEtj/SLY6y+97xCk
         hVq/z2taVGOpJXsSfpJTxZbOCD7s2J/tPflS/nWkZh71tkuTu2dCOvUQwPmwtMP9mYvt
         SYcxokg6kUVJvrv58/iOo2bWgkl1ZqVqKa48o6zQFGvbLgpwjOUgaQ4sKkwhocRrkhoW
         XTXhlloOXWRNCdvI3NczHU0z+TNccgZqPPo0HIgiUzDrkOE9OvAryQvi67HXMogI9JuR
         PFDjg62uEA+Ot64wZ9aaKTsJEumfK4tmhp0fwgk1ukF6O3d39kPxnIjbTaCKnytK+yaz
         o/8w==
X-Forwarded-Encrypted: i=1; AHgh+RrXNtmv8o23HqFnYkUhUV3UlBQrX9BAV14C5B8KaV2MBzJQTQ3OXDr2kGaD3p+8fRuNCyRkJt3/+8iZFkBYqCk1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7rCze1fw99n054TuSf1wlmkjvLHUYxsXTGnMJjBAHWqeyzeoo
	Zur8yDGM2TAnkjwt3oHHRk4VNNSvy5woKN0BqZcPdH3L0lCjOcN8GDnBo3ldRXnkipnJ31dw+Z7
	TEYNNW3t+wby6OVddja9uzbLfhVL2blhBDB6wOi395fkjpeNABVxkHlvgL8GAn9/dD9VPSRUgPv
	xgXw==
X-Gm-Gg: AfdE7cls6nAbpnjN28LPM31TsvBzDCXqWM/6lEIBMy8VQxcAUWGpV57ElBPRKqsRgO/
	ha8Dm8dq+jexYf0q3L6Vq8vfHwxBRaMLGfHRDdWOPSO7TikA7ZhuVbSKNIm7//1mu/iJYlXg/32
	M2EQ5BPv4FjIGjXzmrzbBMyIwly3p86vijeGX7hILiEW4dqM//W//iSjKSVrvphjsRgX3b1b5RW
	hAa6pDWdWoDHWwSpBpiyg1rPkLA1gr23AceqSKUOl7nCx0KxPmxfd1oQ/je0qWzNmQjxrPOS/Wy
	2zyscKSCg91uX+XdyaQ2uP5dTnm5HQ9j2EHY6cJgXDpZmmrG+Dl53YX/Te5JkkX6NFaefxkbu1O
	Ts5h09UHcipRkOGYdg8CFm2RrVZdsYPoKRxUguyzjfJTKDjXivADI/8SVUtQ1E35Tno76jUv5KA
	==
X-Received: by 2002:a17:902:f644:b0:2bf:211c:4980 with SMTP id d9443c01a7336-2c7fc8b106fmr21137505ad.35.1782384409155;
        Thu, 25 Jun 2026 03:46:49 -0700 (PDT)
X-Received: by 2002:a17:902:f644:b0:2bf:211c:4980 with SMTP id d9443c01a7336-2c7fc8b106fmr21137275ad.35.1782384408748;
        Thu, 25 Jun 2026 03:46:48 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d58e9sm17114035ad.60.2026.06.25.03.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:46:48 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 18:45:55 +0800
Subject: [PATCH v19 5/7] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-enable-byte-cntr-for-ctcu-v19-5-8fbbf22e8381@oss.qualcomm.com>
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
In-Reply-To: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782384373; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
 b=NzXxSe9YCbXAOvgLAW+bQfAw5hmoUMFjsQl9kHlNLjYZHW1EJko7qSAjLxFK6OuUzJFyZUeKl
 4BnzXZlDCyQCs8tj3LgEVmXHRuP7meAdUfgA7U0nC1dnKWo3CftEjyp
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=cqerVV4i c=1 sm=1 tr=0 ts=6a3d071a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX9EWZcFpBuBZY
 AUozBQ56s4xT7Iz7b3WhPPI1e8L8jQZn/xz9irbagMLLyPwVpSOqN4sjOWhmoKqKUHdMZehA0zl
 3E6BEbgPy8IVO8Hnw6BNEiCPzd1TZyyv+nrNhnxJ01OKOT2Ra9Nlkrp6ishMGGqlh5ybYC4CuNi
 ZAx3x7A294hQ1ISf4v2w1InOXSz03CDZXB7pHKRPr9eXjwFbt4fjxg3EwKZm3KCeIzTKHBscmKT
 YOQz7RVdHWUwJuDWqmlO640hoRlLvbQVUwRfrl8VsM2B3klmaTWPGtqv3gD4NDnbwJZVObQ3osZ
 HpQpR6IfU/hKDien1mY73CwMHqDYttBi5YdndpFER33405fueldfZ9mK32YruvOQc47hboG8Zzy
 34+P7NE3sz6+K1kuFkms6wY0Ml0Ii+kSaqaKjC/+lMIfvxovDg9yV9axeYVhYbjX7fhMw43aGnV
 KUimIk2cLL8Jp+ax1BA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfXwVP44OjbOB6E
 xX4istj6MAYBBU5SnF8x9P6QD4emvhH48KsOyd5hC7T+BzEqUFVGoZxBmJy4ICeR9pa7DLpmYwj
 K9H+Ygqn2bdXbVYOUF1dy2oxcAnj2b0=
X-Proofpoint-GUID: fRcNf1KEI9tkuXJ9KD3teuNP7d60QEkn
X-Proofpoint-ORIG-GUID: fRcNf1KEI9tkuXJ9KD3teuNP7d60QEkn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_034651_493362_85B27B7E 
X-CRM114-Status: GOOD (  13.79  )
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

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index e002f87361ad..2981001a7d7f 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -44,6 +44,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -65,6 +70,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -72,6 +79,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1


