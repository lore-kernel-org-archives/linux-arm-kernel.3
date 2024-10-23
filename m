Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A53D0BB47
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSBkWGpVe2U/Z9O5WeF9k+f5OatGtFBj22iPtlufGf8=; b=mfWTFVwknHrCcyyFt2slK2CSt0
	7IvioLvva42TE2n5+FoH+kpFTYCjNzhu8gLjlQjBNcc8CKtHGPy8DPzTeI4PEgGHhGHDQREwH9ycY
	+U2iD4Yx4RXIidW3QXR4PowZxfHfaa6JJV74OhT4D3KxUZkrtiAnHpki1yvqqHNyiT/6ITs02S1Q/
	BE6Ucyog39OBTcy2Fp9wygaQUgqHe0roHi6dQ/y6JZNAq32/D0URsMT3xtvY5jdHOzj0ryb2FtbVO
	S2ETJ2RTIJAjkbGZeMNbZ3jQp9nSUUuAwd46Jy+CBeTZUM9ATha4JuulX2MTW6PAvdeN7UNk4h3uR
	qT9C1wUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3kBw-0000000GA8h-31qq;
	Wed, 23 Oct 2024 22:51:00 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jyn-0000000G6xu-0wlW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:37:26 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2fb5740a03bso2633901fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 15:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723043; x=1730327843; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RSBkWGpVe2U/Z9O5WeF9k+f5OatGtFBj22iPtlufGf8=;
        b=dks4Fu6OkuQYTLGWTstV24VnRWcw05Wx9g7B9CvC/EY+ncDrSaBl2V1xJtMMrd5vkD
         00N6rpOEf+3vL/n2Szw0mLcIySymVw+fTnN83/UulSCp0pclXqiQPbwpxOKobEO+mV8H
         Car9HNZCVDNo9zd7B5Yl7geAuuwX/MKRiDEXle0+wN/P61TQ6RaZyzYSZklfLGx+xNG1
         SAJ9dpu1YDZGQeiks49tMo3hiPXV64Bn0q+zWpn1TawSoAQLC5IFp2qeYjSbNWyVRNLC
         VR87hBbEi3LkdarUObZLjCVHbmTYtPE2oIG7h9n/R3V6rLjR9Q1LS87PU5YjB4jTPZ0y
         vPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723043; x=1730327843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSBkWGpVe2U/Z9O5WeF9k+f5OatGtFBj22iPtlufGf8=;
        b=VoF5PZcezmqbclZv91EKDK46+C6TZ7rqW49BBio9cu11w8q7h34hvdaLgFeilA84Cu
         oWns4MSCxUNX2hjjrryXz5MYvrRj5jkwn8CcXWtDyd6yy7xXbddhlEAiRJH4bc1e9Oba
         Ldomzrr7e5v5hVwL1Pj+Ao827JZpMF913uTti4Dl6DW/HS02NihMVHPWWnER8L0XbC9V
         9d2/Vi67gVev9/rwiUwWHCaRjTJrQMT4jLr/aWOC7JFGEB8GDimMQ52F+4Y/eLoqbKTY
         E+jpATzl5qq/UkQn9x/FI74sQOQa2i02jMrRm/Zg2LRziIDtp/vkxeG4tOxgUEaPKuBk
         zN7g==
X-Forwarded-Encrypted: i=1; AJvYcCWtRYzoVItw2w/YKrWppJsGY+VelTVP9dWijX/Swvr2TWdtl+QLAHJgDa7Mcm5Ol4gLGYWuua8gqZFKLDgLRX0r@lists.infradead.org
X-Gm-Message-State: AOJu0YzV4Daea31m8qT3h5UZo8nuYnAYUnstx0lEA78RfE0/lANlOT36
	cVFGHo7QPWlti3aVtF7yioVKQLzXawUmUxP+7yE7S+hc/iKTLbkx+mPKP9vnJ7c=
X-Google-Smtp-Source: AGHT+IGjZMd7lNPSesBB4Tmg01Ndbwt3X3of4Q9ZQW1OG2xoTjgCMA0LpUoOoNcxpDKIH/SJlp8O9g==
X-Received: by 2002:a2e:4609:0:b0:2fb:522c:7ee2 with SMTP id 38308e7fff4ca-2fc9d3939bbmr19813691fa.21.1729723042928;
        Wed, 23 Oct 2024 15:37:22 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:22 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 24 Oct 2024 01:36:38 +0300
Subject: [PATCH 07/12] dt-bindings: arm: pmu: Add Samsung Mongoose core
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-exynos9810-v1-7-ed14d0d60d08@gmail.com>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=851;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=BfTwb75S2Hpyd9jfrJaq805t3UYzBkYWxGTpfUT2r8E=;
 b=LGLRAfnRMhJak84IWvBl+vHwIuNHJwU3Q21jyQ5Gtp1q1WY5CiQvm55D1fRhgNvskr6O0Xj6M
 G8tMiF3WTA8DWPz0QM5awsEsoiJ9w0LLKjnPmpo9A8Up2IOuQaSy5h0
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_153725_305533_F451C992 
X-CRM114-Status: GOOD (  10.23  )
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

Add the compatible for the Samsung Mongoose CPU PMU to the schema.

Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index 528544d0a1614c9f9bddaafa8dac4782d09ac7e9..a148ff54f2b8a92fa3fcfa78c1bcc525dba1c6dd 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -74,6 +74,7 @@ properties:
           - qcom,krait-pmu
           - qcom,scorpion-pmu
           - qcom,scorpion-mp-pmu
+          - samsung,mongoose-pmu
 
   interrupts:
     # Don't know how many CPUs, so no constraints to specify

-- 
2.46.2


