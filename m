Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D864C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 21:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LiiI20XmZiZkLtdJaWOZkEQ+3eGld2Up6TgYEg78YLU=; b=YPyy0HZv0HDBsXEL3FBDTVQKMt
	JI7vvldjp5+zBPOMYK0RDD/LNDJ6OxQsjQf2ZudFt6H8dk9UvF6wccoNGW9hSlUx7/ioqGWbaenKz
	qyRdaBK3Fm4W/FcowHnpsyivcxRCe2zh0u2JEWH/5aloFgenst/rONntzqlKbgdOerVuH/5kFmL2E
	3VtP5R383Ttj7Hf2lJoNz3xgguDcHceF8QxNy8AEZZRcs2SeYTikOxxgrE27H6OIE7P3ww7uIu6EV
	07CPlmQRjQpidi48/JfBUWCCYqwUoP9M+CboTs3B0glzR0jvMvCpkdGZ1jFbJJH9kPbYMg0bG+0dv
	AJ6xRqmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x58gR-000000009qK-0ZMK;
	Fri, 11 Sep 2026 21:21:19 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x58gO-000000009nX-1tTE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 21:21:17 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254fa663c2so55481866b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 14:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789161674; x=1789766474; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LiiI20XmZiZkLtdJaWOZkEQ+3eGld2Up6TgYEg78YLU=;
        b=LsBbVs9CqhmeJ7ftJdFptJSppkh8ArFVSP3rhGBBjinutFiz7EyNiaVP/P97bodOnE
         fTacA/BRXx16rr8yVR96Fnv7E4m5oHCUzjGyptWoQc4As7AEGflGYOtuCnimuhPO7Hzb
         S6sN+MWt2owLcCY1VSVAc76iJlVUdJidBhcl82n/xwuixzxfnZWZPpgRR6JmLmGZ0E6d
         32/Ge3z/D1bHk2AZ/2f4xIfXAEu31a2/u+NX+quxEE3SnEqMlxMpWU+ItYpuo6kHnXhH
         CKXW1E6Nouwxb+dVefsEPttoa3/Zx6wcomlF4r1UhrEtSHiXCBnJN/hzqIMA9ZHXB/XK
         DpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789161674; x=1789766474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LiiI20XmZiZkLtdJaWOZkEQ+3eGld2Up6TgYEg78YLU=;
        b=Q7VeeAMC2m9n0LSVav6jLj7kYsUr7rEe3OtD0G5dXLurTpvfknIZ5i/+Oaoo1QM9QS
         sY1qltmh0xwj9SIDGEEcd95wtSYjBGdJ/1WLnJWClswQ/2lWIOm0qA3h4UDU8xDY58Yo
         VxnMjBTLjyrK5hWpMs6OR5IlWEiuZ5L+i5QG1JYfFJjwBqIupcK//zjq603XbHc8MtwO
         CyXJIceQSom3A4ni4HuoGvadnRj1AIw+J7G6e70KSZ31cB+Z8Z5M0kGwugCQVdaYe+AP
         Jw6pRUdEgMTO0S50SfItNnmBgI2/HULvD06BJePSbnHKhiB/rN+8t0la9CtxPu/VK8E6
         xxUw==
X-Forwarded-Encrypted: i=1; AKwUvBz9z1xPiEaF0I4Xai6XEa7E6/8oQWXByLJ1EWBB83sDXXnPXH9AhKpTHSYVBMao9+9qmMOl2bHrZ9n77NeW760Q@lists.infradead.org
X-Gm-Message-State: AFuF++kg/5IpSpFeJ6GqMOkN59UOCLKCI/PH5Su13n/g8PgBwc9OFm5v
	jv4ew6KM8peDDrbiYsIhGBCBSZjXsA954egQtbaOA8kHruH6eijTdFG1DomnuLOn43OWDodYmQ6
	OpSQz/xg=
X-Gm-Gg: AYBFou2xxCoJ4XomWqZOT92JL+sXao8BxNDdm+onRF1kWaTj+UMj6AIdr32Zw3/cR5+
	BlYWzjxX1B8ZNS0Giqe2IiUb+B34AYSYllGyOXCFeGQBs0mo6KidBdxZMFvzlFP+yFCtPeWn8Kw
	x7oDo15m+COVt30rbabiH1ZoxYgzZ5Xt8GHvOcKDDvUFnGAfHvIYDxTIA/MA4UM0G/L4qAjnva8
	2vwDDpYRjf2XBb2P3wgq5Eq4xpdEqq7vC80Ge7PiLEELmE7cruvPB/Y423u6MMdxbUcoutC7DbG
	Zitt9nSYlJd3XqxcRgNej5OgM/1OBdNlRwZnao644ZSbAXWpu8GND3cVjRke7cTo62tP8VmX81h
	6JYHejNZKIhzSPFT02oJNTiSkCFQk2hDkVc/utAZxTU/ec66YJiD9S+aeBlGoi2lfB7ByaFg609
	wH1/aNdecIYlTtLIn/k7Lc4YrV0J3O9ZOE877es3chXdzpm4hH5kET5uAOtVazbfXQbg5oiOtEQ
	SaTYimHB6iJ8LTqJHsRswIlmnm6ofRaBa//lza9qz7YVKFXjGTMvbAwRnvusISeAw==
X-Received: by 2002:a17:907:c1a:b0:c15:e8c8:340 with SMTP id a640c23a62f3a-c296674a92cmr569758566b.23.1789161674200;
        Fri, 11 Sep 2026 14:21:14 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660234f2sm126375166b.12.2026.09.11.14.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:21:13 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 11 Sep 2026 21:21:05 +0000
Subject: [PATCH v2 1/2] dt-bindings: iommu: arm,smmu-v3: Add
 arm,instdata-override property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-arm-smmu-v3-instcfg-override-v2-1-5804e4f400b5@linaro.org>
References: <20260911-arm-smmu-v3-instcfg-override-v2-0-5804e4f400b5@linaro.org>
In-Reply-To: <20260911-arm-smmu-v3-instcfg-override-v2-0-5804e4f400b5@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Pranjal Shrivastava <praan@google.com>, 
 Daniel Mentz <danielmentz@google.com>, Mostafa Saleh <smostafa@google.com>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 willmcvicker@google.com, jyescas@google.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1506;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=tUGaS29lFsJmXAHbJSfhfRBSAtNRDMY5NM3rTaPK0XI=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqpHDHk57NrYBKK636xbBtxQC8tNbhZKUpKQNvp
 K2QlPCh/LCJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaqRwxwAKCRDO6LjWAjRy
 ujZ+D/9tMuGPJ4rap7PJdDNlZUe1EQphmU7tRCCP/H5j5mI5j/BtybzMKyMpMeCjerkf+UTKYCO
 CYDG+K+6mov6T+mBwrtr0OV/soVu59lG+DCmTfa25FF7vHpDRlkOACuS0zygn3411nOr5XNGYKy
 ijLCk9JanRujXZSesqesVLBQP4fspZf2EI6kfZwB4F2bidH5mf7oery6A5avsaDOvuIRiJnPqfS
 8jcBSTwwVpeOrA9JGuuCIukNcTawPWlqJQs2yLraj/tENoamHvfvET+OrWyNEP8ekgjoQIK0FNX
 Mv51GQNIqjFSggDGxgfmEMTTd4LMm8R8xbvh/DU8x2kvNpLnRKfZBrG1IQnQelMwzsLLu1uc2lD
 dUg+whEhSIcd5iVwYHHde+2d5Z2cfbcUNa64+gz+1Di2oxp5Aap0Akpqx/PiviD4H5vdCVj77ID
 QP8Bv6r6UV4S0juavx1X43AvOvexroAdYTnPadqZQtT+OlhMKf8174TVhLgNR1gUBSBFvCnLJlq
 lJvf5hlkcFLIkbU4214oVDm4p0nISi6n0mKC0Ioel7TyyFCF0yfa2gmFG7vG/YMKRPbgVwd/SA1
 5NJGxrU3nldN418CZgg7Qg1LHi8xSPi5EUeE4zYwmLTuHNQsTOuI2CsIEzhd+2W1m1FgUyOmCS4
 QD5KHOaZtDsTSGw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_142116_514614_8EB1B4A7 
X-CRM114-Status: GOOD (  11.41  )
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

arm,instdata-override DT property is intended to be used for SMMUs that
have a silicon integration issue with the AxPROT[2] signal always being 1
making all transactions appear as instructions.

Google Tensor G5 (Laguna) is an example of an SoC with this silicon
erratum. The DT property can be specified to enable a software
workaround which overrides the incoming attribute to data.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
---
 Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
index 82957334bea24..3c044e4f03d4e 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
@@ -83,6 +83,16 @@ properties:
       register access with page 0 offsets. Set for Cavium ThunderX2 silicon that
       doesn't support SMMU page1 register space.
 
+  arm,instdata-override:
+    type: boolean
+    description:
+      Some SoCs like Google Tensor G5 (Laguna) have an SMMU integration
+      silicon erratum where AxPROT[2] signal is always 1, making all
+      transactions appear as instructions.
+
+      This property enables a software workaround to override the
+      instruction/data attribute of incoming traffic to data.
+
 allOf:
   - if:
       not:

-- 
2.55.0.1007.g17ff1f9808-goog


