Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20AECD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 12:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzGCiTeCStiKkPzefQJeYM5JOvHm2x+evqxUb+M6NvM=; b=BxAmNubrsVttMs5JquH6daGCNs
	PIOdNsqg7pa7QkCaiyntpVxwf4l4mplU3zklLTzhpV1UILQoIVUG0X6gtsrWiTdwUdpwxROMnOpJn
	ChnH/HedoGX9Ib6yCM1i9eucNq/6cWPjwmC1f5ZtTw4KpXsxjiBoAfJ0DgR0/W2deAvAgPMQB/W4r
	3GbCndgpWwamN6pT/XUtB7MsBj23uxKjw0eIw+YWPV1RFMdqU5E5J6Vn22mR5W2GOL4a3HrxQ5q67
	F1ifgyHaJfKG4kOpT0rd/mPiHPyD8asSIwVwCFBCGSi72ZgxPpZdzzQPEcIi5BprQvndewVoeS19F
	DRDy9DCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8q3-00000002VhK-2VIg;
	Wed, 13 May 2026 12:37:23 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8q0-00000002VcR-1Rck
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 12:37:21 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso3958249f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 05:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675838; x=1779280638; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzGCiTeCStiKkPzefQJeYM5JOvHm2x+evqxUb+M6NvM=;
        b=ZSlNSKzmP8JnZv6cp5lXHGTLbX7YGjKq3ANGKuvfVXtiYKv+uOCbfiThLRUgjQh5fq
         SwKZOYyTvCIMZ1lVcihSeihU/FuuKtt9Lu9tRTnp5GcVjmhXWXuGkCmFe4mgEeCbXkRu
         HkBjRkeh9qvFPCUNKtM8y/0KfIditPXfTANyNqDYAsPuxd3lK9/xfhzcwxkV/bE5tnWh
         mfScgLfR76mxzXVym/Ze7Kt9yIaJ+5zybZAj++BPiiIDEN2VVgpynpi8yIfFrHGPvyyV
         zuvfOKsXIlDgWXfzoHu5y+K2drDGzmw0l8/XNsagka/ycrJahr8BdKJar7CBjTgXAcrx
         5EKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675838; x=1779280638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzGCiTeCStiKkPzefQJeYM5JOvHm2x+evqxUb+M6NvM=;
        b=ZvfTL1vfXSRTF+DUzGdupFKGW694hGvW5f/OorDEXdSqOMRJWbWwlugm3n5v6cwHVp
         NLnzKSsAP7VDQNyS1ZgU6hbxNJG9cSL8O74wuXDCoS1WNfVBhdWwC/nr/zmtV+Kt0Bh4
         Ms/C0vuotOdVReNUQdwVUG+BtM6rHmhLjvwhUhaLtXNpaeEhZ4StQBvPWZYZn7ye0enX
         QfrDJMB28ZnLP9sAZ0tK5fqM6c5UBob47SW5kk0Ux8jQC89j1kQAhnft3Z8MssO4v7dV
         m/PPBoOcqiRXzGc0sS3yfeKUsH4WB8/IVhZKtLnNO3F5gZBrY37jVSnL5bUDrnn1/s7Q
         RemA==
X-Forwarded-Encrypted: i=1; AFNElJ/cx/vgdOX3mN+52EPUzDMZksngEfdmB1DdqvKs1Xx4yRUx02yqMPWY6RO5vPn7JZuHPYiQSk8J6bjz62mcOpNv@lists.infradead.org
X-Gm-Message-State: AOJu0YwqrcuCHomqmChQC/IdEJZBUPxbPYhWRPzZ7UznI65+tl3gk3fV
	Yn1VokQPCZuwjgN3py6zTI55NV13WZIKO3CJRDla7H3Iu5h6Th3lp6aqmm7g0OsdAdg=
X-Gm-Gg: Acq92OETzwo5RNp6Pxk0Je81D8fYZccljJLDdSpAXz/z5dkEQsBxgfWpbL3/KcJWrqE
	FgyDZjn7wUYTxUE/MZB4iTPftHbZu2CYTFL5J/EgTqp0ar74lACotUwroZqMFLVT37peOIihta9
	wjjeFy3An+BFYFKHo0jObdZyna5+MCi/wev5/8fdVV8iG8PZNsnxhdReN/OyBaEqP8HK+AnwS0u
	d4uHI/TMogXFfl5btMOpMrv0FnMBLLgjF6r2IGqOLGoO4GGZM51MsNnKVaY1CGfb+4a+aAzooY/
	02Qoe6g9JHy3kLKLnGpEWCDveSPQVL/tS5aL5Iegq2bBas6yefAMwvjBqT2guiIAegNmHG9O88H
	84eUNNUfKFXZaAFpxFq1UzCKFxuppp3fikQmorChYVvxDoxHD40P4Ma9tO5lg/umek9bAfJpOMi
	VkS7IzJm3nkCoaxMMh7LnrGlowQOv37obUjD1w8zmcIpi6ikd386CXuLFJcI35nCKG3qttUuQkC
	HpGA0y+9NaRXo67
X-Received: by 2002:a05:6000:228a:b0:43d:70de:1c71 with SMTP id ffacd0b85a97d-45c58a70c86mr4450704f8f.11.1778675838428;
        Wed, 13 May 2026 05:37:18 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e4bb87bsm38899725f8f.2.2026.05.13.05.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:17 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 13 May 2026 13:37:14 +0100
Subject: [PATCH v4 2/6] dt-bindings: soc: samsung: exynos-pmu: Require
 pmu-intr-gen-syscon for Exynos850
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-exynos850-cpuhotplug-v4-2-54fec5f65362@linaro.org>
References: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
In-Reply-To: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_053720_416026_70FD9ECA 
X-CRM114-Status: UNSURE (   9.80  )
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

Update the Exynos PMU schema to mandate the 'google,pmu-intr-gen-syscon'
property for the 'samsung,exynos850-pmu' compatible so the driver can
obtain the necessary syscon regmap.

The Exynos850 PMU relies on a separate system controller block to handle
interrupts generation, similar to the hardware design of the GS101
SoC. To ensure the hardware is correctly described, this syscon phandle
must be explicitly provided.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 76ce7e98c10f..6550c3736a3b 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -182,6 +182,7 @@ allOf:
           contains:
             enum:
               - google,gs101-pmu
+              - samsung,exynos850-pmu
     then:
       required:
         - google,pmu-intr-gen-syscon

-- 
2.51.0


