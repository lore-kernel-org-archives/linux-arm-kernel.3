Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AF2C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 04:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbNhV3sGP6oWXmNCm4cU9gjHDsysd2+OUMzLU54oMEk=; b=s0hUPfklyeUffBbVWB1LgI9NQs
	8kSxgPfoZWqUVh2z0/Kt//4sT3HgCOYXd+KkAqnf6gRPdmbaokhr0/jB9faun4g13/ILRQpaj3Das
	TgYcu/52Kd4gnTHvSGUkGzvnxiZsNJDdnk/noSbpdrO7SiyIRlDV6lRF4nMqEtLU7qhSc5aRkQUQS
	hznbmYKxGPpPpezIWKq3YozOT/BYr4EeEHfSE43/megb8qIAn2j4s5ZRuIMfbm5csQvwwD1hNItTA
	/FMAgnn13hetksRtk6ANCZG8yzP913uBkUjLkyYtfkcjMwd5HDt1WX6HSBY1E/68focMlBEGHq2fW
	Y3NsGBgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1cET-0000000DkG9-31zR;
	Wed, 02 Sep 2026 04:05:53 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1cER-0000000DkEj-2MtU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 04:05:52 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so4098445e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 21:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788321949; x=1788926749; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbNhV3sGP6oWXmNCm4cU9gjHDsysd2+OUMzLU54oMEk=;
        b=t2/4YZbVun6LajgakBrj4kB2PgMgNn2Ht48xNVGBA6fTb/Iilw6kOkUK2LrotBXa+H
         x0rnb8RJSOY6Jt8TbJzpPMsZOUNfevtiVKsf+Jpu3eetMm/aRjE2aAs4FC04yLEFSWVW
         eNIZJIAHldbG7puLBcZ4oDNUtnNxGfE2Wt5FFjl0V+YdjS9wFLc+7eckSzjfQa4caGVb
         RceYBTGfCwr6/vXTHFhSdqu2BuSNSWxJVxGV0eAquDdhcgxOxpQ7ddXCxQ+YthRuOaq0
         PswLoMlRk/DP4nEoEy7oc1Kuvt1Sh/tTTIA0u6QFerN+eHQHQR4Aq8mzma3L3slhjwir
         z1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321949; x=1788926749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bbNhV3sGP6oWXmNCm4cU9gjHDsysd2+OUMzLU54oMEk=;
        b=fB3a8P+RbYqjA1URi7ecWpR6SZoZthIIBLWVQinStov33tv99v1tkgHQC1nQ0y3RmS
         23Ew6sDs1R6GcTaz+9TBM4R4uMG5LKtWHDQmDXormto7HFfFirBOzQy9/uEOG0Uxn+Us
         qUoaQQyC2bRqehvU8EML9B9EMc0J4g/lO9xu5Cx79NS+0EA/Q9I3RGRnv6Sc7v9U5wAy
         qadMK959mQFCmKw8yZ+s5bS5DABDhgUp2740VX/xPuRavb654SlbPFdKeLrJz1fvtWIj
         eziACIgtE5xXfKPdg6GNunAWdR3XqE2XoiHONdAvzX1fiCshF2X50m0E7Jxb4IMDuZ1K
         +45w==
X-Forwarded-Encrypted: i=1; AHgh+Rpel+iffE8sXXzQQvbuhP/8oXx7y+wHQRQVaE22X7c/Ira4PilqtlFz+hoD05VOfvNgDslJEtEMBBtMlUofyWc4@lists.infradead.org
X-Gm-Message-State: AFuF++m77UrSFOE3CcK/xpibnZK20XGyuvhZzNsSsgVVVZLtopE2fHtu
	75o/vXpENd4ZKXA4D8tLix14gIFVI08cc//9IGYcagYxygjyb5QldDawGhobzDN1tUA=
X-Gm-Gg: AR+sD13MTb5bFJBmD7TokHJSkkmWlJNyMUtTvKh4QMediKo7i0YCBtVrq2L7Iu/EjUP
	8CYXY5r3j5fJTiVdOw8USgjqNbob7WHTdU0FTEVrkucukKHOUDLwEPo2PiXmjTKi9YFC8zYXa3R
	CMBSFmalzmU3zUFBRpDr+UO3FD1Z1Q7FnhzUK0xjT6wvRaQnB0d74WWITBEx0GrPgQLKce7WBbL
	5RZ9XrITrZIRKjpGX0EsuMO2noaEGeHxtmmve3sKzZWzeLiVdRUvmq7i4AzbmD637frxb58A4aK
	OjsTDsTsfpqpafKKH03V6UX/FKzpyhE+r8IVJ20pjRlXrdN046QPNB5C3a0NS/+A9+fo0obHm3+
	ET0hxL7dGZqvPitp2kQjI+i8YiSx1m2bJmevbu+BJmQIZrWBxKJpuz2B2XScCL3b8Z7DyuqRz1+
	2InONxtxI1sYQSCWv6+mUys3xp+7shxKZjNYl+DyzbQdVkfA/Qzm0qbjQmmlkUx2Xd1pGWVNLP5
	9IlRkeh1K1aE/9RICkxoYwLnMhNjwOatspSW/1TZi+7HnWwh1yp
X-Received: by 2002:a05:600c:3e10:b0:49b:9433:ea44 with SMTP id 5b1f17b1804b1-49ce57fe002mr33589265e9.4.1788321948081;
        Tue, 01 Sep 2026 21:05:48 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm42979395e9.0.2026.09.01.21.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:05:47 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 02 Sep 2026 05:05:39 +0100
Subject: [PATCH v6 2/6] dt-bindings: soc: samsung: exynos-pmu: Require
 pmu-intr-gen-syscon for Exynos850
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-exynos850-cpuhotplug-v6-2-a85bb55bb118@linaro.org>
References: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
In-Reply-To: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_210551_657226_A39D3429 
X-CRM114-Status: GOOD (  10.84  )
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


