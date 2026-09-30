Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B07CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 00:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbNhV3sGP6oWXmNCm4cU9gjHDsysd2+OUMzLU54oMEk=; b=IxGg+8Et0rs4/IJlsYa+oWwR1H
	SP9MOEcm8t6V5mgohFJXdaDbEZbA8/KACmHM8XePk0jpqSF7FLySy29cDCzU4h3ZnwLKkL3YGWml+
	d9VBTPEdj+7val6MNy0M+zF3YUxkp9FDHz4SBQkl6mvtvv1cFZdrwNEZigu54sPfxNFIs3AEYJ27l
	pwtvYdKQVl476Xm4rVlvfiJLL/kRlCkByI284aize289P+nWgpJdRIOiCkHIHHkJ2Q3eULJByRTS/
	HL0hJw2OTm6K684kRyUAzQMsq++uKUYJzK6aVh0yXeqTpMgADF7o4Q+ObNgQv1KOXmLH6L2Et+Gg0
	g0kn7E0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBhwp-00000004nge-11Z5;
	Wed, 30 Sep 2026 00:13:23 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBhwf-00000004ndJ-2YM4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 00:13:14 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so29358155e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 17:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790727192; x=1791331992; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbNhV3sGP6oWXmNCm4cU9gjHDsysd2+OUMzLU54oMEk=;
        b=VrMGn2B9nIE0dCM/ulOwgSRrrrCIVH+wa1tzYI8azJapAqln9CF3NuXzlMSM3uTlIN
         alhQV9WKpuEFxyE04npAnAishWD40szA2akLBrGASJn7wiakkUQsf/MJm3gYs591kaBr
         pboZdYErmevHpgX34kHO7UlEx6gg4SGd0D/c2cZmJioyAnCQ3qmk1lBZuXsH+aLOy8cp
         1Z/VEm2H6PG4Pqvc3w4NkhlTbXL7N5gDCgOu3wEW1hSbDQGqzVCOAdS3Q8pwLmMg6jqT
         MgwgFNCzaIjliueb2n0U7neIoZtYkFDxK+LkfjEu5FNvdDTDSq/ITJaYs2fwOccYU/e2
         5dlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727192; x=1791331992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bbNhV3sGP6oWXmNCm4cU9gjHDsysd2+OUMzLU54oMEk=;
        b=Nx85BGld6MXcQyy8OR8QHp2+Y8TpanrM38FtilpGvwqpVbxGem1j+eSjrpJjkvmeMN
         KrC01jSG2V4V6JvAzxVoOwHhDJmi3eYjOXVLkfEA5e0v//yb0jbPdGkgaHmW1xLtkBv4
         s8+DbZ5Vya5S1bN0mhUSqTlilxaE3xjMAWhjMYcW1NDvhWO4cT6FR/XnZbXo0ms4VMX7
         tsnfWA0tgDkwogBxjgq7BuE6mQRqMl4IaAZvkpYe+BUXI3wav+t11O3HkXaA2Fq7qaNa
         Yvz3mVb4UL3Ilaw9DbScme+IaG/z7ypQj4uQoAdtGIo9fZA94kj9uLFesrjZP5kwkoiQ
         aTPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRYzLtflBPmUPZ7lJsds1c7qPrm/86WLMh48NqeXUzzyfTzjyYZZg/Bvn+FYoxZp2+GtI8BLyrm/ZggsDr22Av@lists.infradead.org
X-Gm-Message-State: AFuF++lVPjIy2zPx8KINSEd6pFFm6bNQBE8LWLkOmGiaRRjALQGgRyTY
	MXy5K9kDYWwH+Lib3WSUswy3L/9X09lG2PVat/ADAOQuFUyjuumUxD2JruS6pN+dwPs=
X-Gm-Gg: AYBFou3Je54feXwCZlrm6oB7XrhPQ30N59ySdHL+q3gW+O+jEHqCNDcMwNwPwob/H+f
	PKQAdmm81U60nmVX/t6u2bmf9aXi9pdJeY5AxFTXAiVD+zz8ageRnkatgS3tXGmqdo/Y+cdmYW/
	VfvR84fEmh74nsCJ8JCS9XJ0fkM6C3qChn1LIRIgE0ma44foN04vi2/gvDCP4ZW0hz4jjBZ6E0u
	+EOqSbmEt/IWuz7kOm0eJTJ0B/UE4BvodmECeENLdzHe2FvuN7iH/13Gla0BvsoPsViRFc1DGN/
	+ZXcqUc2EVUEY2ryiYqCHigLuaPtprAhmUcgWY4yEfCyDV2BEEo9GTe6lRj0ljAO6JDZw8/AN+A
	/xE8QkoSyO6Gv+qEhGLDaffZUzj/4Pm7LdfnxKEUewmMiA1b0SXfPsbHsbHiLu3+bmMQCAWOLeb
	IhOrg4SCxKtt+dSg1mvG7ECHLg715UeUClLEcCF9Uz5y5tSv2+kHjf8vTRz8jV/pCikVnL8ZqCZ
	qFoLuYQU/+09+Z1WJnekRVizH9rpn/Ea9r0BEplLC1j0W1LRDqvZr2iRoKhSA==
X-Received: by 2002:a05:600c:8b0e:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-4a015028f1emr11800335e9.19.1790727191701;
        Tue, 29 Sep 2026 17:13:11 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015a89ffasm6320635e9.1.2026.09.29.17.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 17:13:11 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 30 Sep 2026 01:12:57 +0100
Subject: [PATCH v7 2/6] dt-bindings: soc: samsung: exynos-pmu: Require
 pmu-intr-gen-syscon for Exynos850
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-exynos850-cpuhotplug-v7-2-203245826333@linaro.org>
References: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
In-Reply-To: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_171313_671668_6A963852 
X-CRM114-Status: GOOD (  10.24  )
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
index 5bd39876e3b3..7d58976dccc4 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -196,6 +196,7 @@ allOf:
           contains:
             enum:
               - google,gs101-pmu
+              - samsung,exynos850-pmu
     then:
       properties:
         reboot-mode:

-- 
2.51.0


