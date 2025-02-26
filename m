Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176E6C19F2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s/LD16G1ckmo606r8mTAAXLS++qBREtl47/upA6EvrE=; b=zjYti3+oLbM+EuAfz8Cf+MuqdS
	zjX5WlBSBdEK87p0754FthMpivLt/QH7uQ7p+C+/+Pu69w9kG4jNXQWB1VdFhCsHT9iZNFDTi7g4h
	vqdDg+Le5n3QzSrvWoFC05PO0D50GAmmdgP88e20vdgQ319nOQ6sl9B4lJ3fKyCfiZW/IBR2ouA2L
	e/Jy2RvAdquYS4IrjsHKBL7w0hJQoG3YPyKOMgBkCUUfq5oBvLMqPAUha1AI8XmGoJzvoo5nN/IA7
	9UCYzY4N0z4dPuIDcTBkNPm9U/dGYZc2rq8dbNRPFXMs5Ge1avsRFYSjM/JcX/J/YHgr2jdMVfjQc
	x3XMSvug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHPK-00000003pl5-1xvZ;
	Wed, 26 Feb 2025 13:25:02 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnFbM-00000003Te0-0icp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 11:29:21 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5ded7cb613eso1290774a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 03:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740569358; x=1741174158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s/LD16G1ckmo606r8mTAAXLS++qBREtl47/upA6EvrE=;
        b=C0HCioN+qk+sekd2P6Dn8GBOj9tFLpjPjRgry/udupV+amOLf+hvynQEnezGl8PBmy
         o+9elYPkkz6jDTBZt3x8yAmCYTLhOLIiM8JMrfNpjTCrM5AKivTWEKpxlLbFb1qaArXP
         R9wUVQOUjf1WS5REfEr++LwSl6vrAbJvLz2gIqFeAZXJgcWcuZQhlRNSCn2kgw8ypJoQ
         dIhPwAJNXNwY5/+uxF8Zi9tWvKtAas9mxc3sOpOxQLuD68FrXXgY0XUPs3wH/KWV1QcJ
         xkud5qVTE7/BAIJqZwXF6JLzkULuC9uL9u1PParJyP2ylRdtEBk+kExwKlPmoI0Lh5DW
         qu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740569358; x=1741174158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/LD16G1ckmo606r8mTAAXLS++qBREtl47/upA6EvrE=;
        b=GsmlwmD0wVmSffvOBfCmaHj04/fP28BIBU0D5pmT9+ZMYxxvlmZRN9FVdZXXZJyWLg
         gtlmNP2ilohEDAyqyqmZpAUQIXyXStN9Ms2Y8/9S5jJwr3rKHwguvQlSHUDY0NgKPcgc
         KH5fyZG56589U+w4kcMJKI4Pf5Fsw0RDd0zL2rcAQW1HgQ+163cSN1FkWwGbQ66viq33
         slPX1w/vgDWvqud+/gwMYkFzJwbae4/RsMVHj+NJepBid5pVGQ/Rh7axZz8BAU3MZBpe
         /Ljh9tKTJoXNovoT5sPRNLLYzCtSQc5JSDv/LI4DFOj7JZGq/NdQkRFzzgo24lD+lY4N
         IJZw==
X-Forwarded-Encrypted: i=1; AJvYcCUVEHI2awQ4eUBcST6P0jJjXleUzE3O2XdWyHGlZJ7/mOpXhNHUXDEZMQYp9OTl4onIvVoZHSQd1bgGjgHs2BkV@lists.infradead.org
X-Gm-Message-State: AOJu0YzBe2JCa3sHnzdo4UX7sONTVHnMJJMxLlz4xgsF10IMowWUcohm
	e9QkLOsQVX4rp5U0gFVQqGpJGVDW9A0ZvYkkN+LUytIQGo+SY7TkQE4BKIpKF0s=
X-Gm-Gg: ASbGncuUdNPBeAmNbJtRuogxMkA1xIXdXqq3fMz2q8YvOcJvFb2W/CWjO+onxEkhOP0
	Oxls+S7YO4eZ6+5Q6/YHfIyIMQniA6aKSpdGEfn/oEPezuOGp6gj0jLMoro7tdMJmAybXq8uPCM
	j6KI4yLrJ7N0L7DZb0HH3RCOK4q8HI1RMbIRC5xl0425iuY1nG+jvJj37FhBIWMV/GKDWDryF94
	inIQRPI9ZLdMA8oJBHjHDVAjdj9MMaci1ewfVoIOP/D4JHA1RWKegmRs44eRWRQA0PrytryX5TY
	2e59IK3R3ItpgH8dy6kHAWFR9TGHndWVXVGNnyNtYSDt6giIdEA/0HnBcont9UUM4mIsCmTh4mQ
	=
X-Google-Smtp-Source: AGHT+IEfpVAmUdzqLH8Eb8qd4lEgmjl7ga6R1U3aAJPOZ5WOBG4ayDyk9a/gfYM6yY4U7qdRUnbeng==
X-Received: by 2002:a50:ee19:0:b0:5e4:afaa:8d6a with SMTP id 4fb4d7f45d1cf-5e4afaa8f65mr292393a12.0.1740569358168;
        Wed, 26 Feb 2025 03:29:18 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e45b7174cesm2610049a12.34.2025.02.26.03.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 03:29:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: coresight: qcom,coresight-tpda: Fix too many 'reg'
Date: Wed, 26 Feb 2025 12:29:13 +0100
Message-ID: <20250226112914.94361-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_032920_269134_EF2E02BD 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

Binding listed variable number of IO addresses without defining them,
however example DTS code, all in-tree DTS and Linux kernel driver
mention only one address space, so drop the second to make binding
precise and correctly describe the hardware.

Fixes: a8fbe1442c2b ("dt-bindings: arm: Adds CoreSight TPDA hardware definitions")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
index b748cf21a4d7..4539a67d8bf8 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
@@ -55,8 +55,7 @@ properties:
       - const: arm,primecell
 
   reg:
-    minItems: 1
-    maxItems: 2
+    maxItems: 1
 
   clocks:
     maxItems: 1
-- 
2.43.0


