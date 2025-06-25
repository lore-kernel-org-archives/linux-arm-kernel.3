Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B13C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 11:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3nipzKoLXU+khkgMT/iFK8MpGbKtAwTRvPNEeh+QTo=; b=tDG+tKfCqpbLSKZk/gkx0ZhNTo
	zDD/H1jmtE2lW2z69JVG3thajR18kqZxftYZxmYADFxpDH7RA62//pbYjpZQcL4j07pgApriA0lkV
	khH1b25BipENU/v0jQkV9eIlRpGAqNPfaQIEp0J5DzELKlZkjshZLbk9/mpRDK58/sRMrBOE+Zqxi
	cLJAiG2lrqrm0xVKT6eXRG5Qmmii78whEjUnv0AkPhSn1h1NJZaJWdFgGbhiz8xlXe7vQfoIgyHnx
	asAWCpekBg4EcJYjvizwvAcb71Hj0omnMtbcwGBQpzVOpVKYZ17OrOfxirpvHa7GHipFoV6FF3RP4
	MGogzQiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOSm-00000008VYf-25Nk;
	Wed, 25 Jun 2025 11:38:48 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMLg-000000087PE-0RmZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 09:23:21 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-60c4f796446so682939a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 02:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843399; x=1751448199; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w3nipzKoLXU+khkgMT/iFK8MpGbKtAwTRvPNEeh+QTo=;
        b=ZFRxM2gg5uWZEetpJXNVEQsEjUMppKPshs/4uYf6weEMMixRGjTTQx4grOvTTK08xJ
         FmI5riqsDxQwIqJ2wP0TnQDtnFCkuYxcJvNNAs7io6NNwi9f4Is65e0ViDBGRh8vLb2S
         dCRq9Q6hh1o3XRbVHHbcG4o51FmLxjObqVGm88RnQajt6l1Sqc4rPtJy/w8Q2QtAZGEg
         gZdPimf+VSVdmb74bIoszc/t+lgap+VxdhhvM63nmKrByiXH/gAhWRReeJrED8+t0kBn
         x8m5aAyAfzv0nikyFdTAG6covqySKFlJKR1rJHIAjXguxWVFxxGO/pf4C+jwgpTjM3l+
         n04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843399; x=1751448199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3nipzKoLXU+khkgMT/iFK8MpGbKtAwTRvPNEeh+QTo=;
        b=Rl4StrYIPLFiAHO5caQvqdp4i2uTE6nBHJLLOnStd3q2I4RstsJVhQrX4BEFXpBj8t
         krUuvv/s949pmYWKMDISgSKx/FIt3l4bZdcanaOpJ5UjFF26bxdbgRpoKM6+Ly4hpGXg
         lhqzSaTICFxRDDKYG3L4mHgVJ3Qgg4W4WKITAs3kKuHbDigniJyYrgmOWdCT6Y0fDhW/
         b5vvOxfj2COG+SQvtkp7BMvDuQgm3F+En7rnHF1+hFFm87mLX7QRGo7eYAeqtv/xxe9S
         gw0AyoP1gaj+48Q1kx+Yo/e8apAIfBM/t0cj4FUy1SF/X7ZkX81PMTkGaW+noXKIgLSg
         ZZfg==
X-Forwarded-Encrypted: i=1; AJvYcCWgTt63Zq74jCEFFw3v6nkEFerQRQzpRzRzN3BX/3uW6Xt9jUKLdoKL8JuifQbGu8Goe8tfqL+n99ESTJf6qWmP@lists.infradead.org
X-Gm-Message-State: AOJu0YwEBuFfwl69rqVy9zTnOJ08sVyRz1c3Dnk0ZrTPUBhV74xZR9u+
	AJbx1C3/3NWmINLzzGpYeB0BKzhBTUIKREP0i7yAgafZ0+iVS54J61t0HxA8s57yZ2U=
X-Gm-Gg: ASbGnct98nVDqJqmDZ8+9JohpJCcnfPoUZdR41ZB4GqPxdKvYrH9Pc5nazMwQXrKf/e
	Yzft8mCZ6eruBNvpTFYJ6sFtTcGeUnIpJxTtPQu2QJQfh84txUOoEJWzPhzsyfWvdD6wLsmRG60
	hgYF3fVn53PGXLpCBmOVUIpp6ZyXPgPelgRvx7HRKa1b3friMbStaPWUqwX5uLY90Uurhj3JeP0
	uiuoDTXVjuJV7vOnBYAj1dVO2zZ7y28K/f8xNJKmR69RR0qdb8h2TZWR7hLiFr2CLkLVhOqV/cD
	HlEAsucooe3bJx60KPh9VcersCS6h6E+t4Squ962KMRh5yvIbfQfwSbZLyMpMQ6aRD+9l3fmIDw
	9DDtccigCENfOVtqcnkIZcS7vAqmX65YZ
X-Google-Smtp-Source: AGHT+IGVifY90ul/kd9o3o6inz9kogKyytkNR1Mkk0jMmIxV8Ntq/CDmQ5WF/k7Z2pC/kCZPojhuLA==
X-Received: by 2002:a17:907:1c0a:b0:ae0:ca8e:5561 with SMTP id a640c23a62f3a-ae0ca8e5732mr22602266b.13.1750843398619;
        Wed, 25 Jun 2025 02:23:18 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:23:05 +0200
Subject: [PATCH 10/14] dt-bindings: mmc: sdhci-msm: document the SM7635
 SDHCI Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-10-d9cd322eac1b@fairphone.com>
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
In-Reply-To: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=849;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=9mNvIjwX0GVg9+8QJn8ze4jldqNBVe9LJDYJHk6E7+Y=;
 b=ffd4klj28huseDrq2t0Ois6nd1kBF/j9T3yy2ZWpgFwV8hBk7iSpc/UKSVR/3ZIG3wkyYCYpY
 +TzW/dweg55BSVxNB51nndNlAVdd6s43fdl8zY73JdwEi8CKF8/opnC
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_022320_157763_16D48A21 
X-CRM114-Status: UNSURE (   9.96  )
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

Document the SDHCI Controller on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 2b2cbce2458b70b96b98c042109b10ead26e2291..bde69ee1554642b8c2ed74b1fa0f68b421d7d64e 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -61,6 +61,7 @@ properties:
               - qcom,sm6350-sdhci
               - qcom,sm6375-sdhci
               - qcom,sm7150-sdhci
+              - qcom,sm7635-sdhci
               - qcom,sm8150-sdhci
               - qcom,sm8250-sdhci
               - qcom,sm8350-sdhci

-- 
2.50.0


