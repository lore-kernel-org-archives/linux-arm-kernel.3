Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB48C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 10:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PueVIxrY0Lhx5OoYalpVzj7TJ+cyHwt+DTi/ni2FBMg=; b=JQBeYGvRN+0TZIZB+yia2ZJMJf
	PlIxku+lpHimANb785L7YIqhgc18F9d0rLptppIWAncnZyeqwUTxwp7lrh2jDPQMi0/di5bZdil5E
	GflK6HN/f18bQMyP3rrarFEfT55YU4XcHnLPaGQA2Rd70WIGtLfspqtXYSrRYNXPYbSwuxPvW42ur
	fGHzSAKtcyKSNgnRMQxaRHQM6ls+disgORSa1DurpXmN/Le2cXO3/EeeuD2CpKQEm9Dgu0lZyG2l+
	4MFn+/wJ6ir2EpvdcmScETRgtzO42M8M+3FkKl+3n9UAj1UOQ3sjTBFZAMnf1UYol69fchbnpaJmF
	ZWWl38HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNXV-00000008L4E-1IMi;
	Wed, 25 Jun 2025 10:39:37 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMLi-000000087Pi-39qJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 09:23:23 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-adb2bb25105so1004408166b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 02:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843400; x=1751448200; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PueVIxrY0Lhx5OoYalpVzj7TJ+cyHwt+DTi/ni2FBMg=;
        b=gfzRn5t6u/Xc61W/IG8wAeLd9vUTSdvaNVU1HtZ8lIR3jXn11fnEM2ZjUeyqQjANmk
         tE2QV7jelU26rzFQVrJWIcychp6D1e4j+ISd3o65sbUFYjVQIpRhRofP/UyphiDwEKCE
         P1KQF3WCha3IfbGmnChxajriV+RlxY3k3DMjgTxc+RSOIcEh4D29NWNSPRE+QJnA63BX
         4EupasmlReQcVStnRYjNbWDleNydL+/EL0hOBwAmgGriBYftvYjyWxzcxT2wJkumw8U+
         WQ0HieN1cuY7x3bLxwEoxUWc5rjrFjQ+ngV8fdHjaSiBzDZonoAc1ALrIBJJcd3s6NUu
         ReyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843400; x=1751448200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PueVIxrY0Lhx5OoYalpVzj7TJ+cyHwt+DTi/ni2FBMg=;
        b=Fym1+ZXNmFlDowZgK0qUD3ys4XA6R3xfjQi6cx+726o5aodLcHuclRWlxg9eqlMkMo
         O8qA/qjlYrC2sa2kZ800NJ4FgubYwzWg0N/kUDujTFWHMP4Pp/VdyhIIq+9nsLrT8N2U
         HqAudXHKj8ZqwVoouOHhqSrVorNnez6Q1kDL56Ba9oXToP4B1/Ofm6DYIIoLNeEpe8GK
         5d9c3uTZ8JkN4v5ftWoO8+pD4JITM2HqITRb1YSF2oJaK/3Zp/sYgt8BG56VCwNMZsyc
         EbVg3FD+qaPzewJidpiwHHmfoncaOO5zpuaJzs8kIA1pd2qPKJ86T7XKsvhOcC+MIThw
         e0Lg==
X-Forwarded-Encrypted: i=1; AJvYcCX8c8JtHJZE3H+MTSoeG1oN2YSHUio+LpJMjCOd8cb+403nqqi34/wIo3Uacef0ZsR+acr1OKxwYT+h2vtA0SAq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5eD7MKpa444Dn2Mo3g+zV6w/9kkCPhXWgsCfwTGxuIcF/3PIo
	i4ySeLorhTVApeu+gIjeLZ7aBI7SsAEBtH5GXSGN3bA84wxpPlNUdQiCugVe+8dszfw=
X-Gm-Gg: ASbGncueLmG9Sd2tyjRg6q1HpM1j/AwmgO/lUc0NV62XqtmF0N4zkykh6lSIYU3nUTf
	mDzZ4MQ1h2G/JspNASUCzTzV0pt+AQS3SHdliWNrNNjz3hFk5BYHMZ5OQIqpKFuWK5PgN5nuQeF
	uD/frGPPxtH33gFkBoeHhLyGtVj5EigLAmy7DrZBIOQDm3PLUtoAo/b9TC5ZI7PROgieDxgfHoi
	of7H814T6nqkK07bUND5qKgKSGEEIiuh4M/im4IC3y7h1hX0Osaw4CcjcqWXmzQ2DVR+WYK8UKF
	THIE/lRoRle/3UKuMMjWve1Wk3bCfLj3O8uFhbNYc6WWiYtGavDeUmn1uwHHoiaB/21VCY3cy2u
	kGjH4EuhJvcX8eRf9qAnoRWCmB8i49grk
X-Google-Smtp-Source: AGHT+IFufR/i6s8bQEjNP+fAneYyap2WFk8eT5JzaxB2nRH9U0X06huQYHvxc1UIF4P5JtCVtPmAUw==
X-Received: by 2002:a17:906:6a12:b0:ad8:8529:4f77 with SMTP id a640c23a62f3a-ae0bea790d5mr233626966b.38.1750843400340;
        Wed, 25 Jun 2025 02:23:20 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:19 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:23:06 +0200
Subject: [PATCH 11/14] dt-bindings: soc: qcom: qcom,pmic-glink: document
 SM7635 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-11-d9cd322eac1b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=920;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=jj4FXpnaY2L8qRW5W5/06pfPaCeBVQY5CbMDnnBtNOA=;
 b=QKOjYfcAGy5ZXnCmFyoCw5qgS3UKBJcYTNOrXIfiYw6DV7itFoCGZHGaadZiBNtQHiCfzjhFV
 Na8qSuO8OQ1DyaQjIxXMBvzPUgOVhYUCHVfApprHUM0Cz5utU9EaZ19
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_022322_796189_93184429 
X-CRM114-Status: GOOD (  10.13  )
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

Document the SM7635 compatible used to describe the pmic glink on this
platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 4c9e78f29523e3d77aacb4299f64ab96f9b1a831..2b77021b278dd9dca604cf31e39d9eca98f2aa7d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -37,6 +37,7 @@ properties:
           - const: qcom,pmic-glink
       - items:
           - enum:
+              - qcom,sm7635-pmic-glink
               - qcom,sm8650-pmic-glink
               - qcom,sm8750-pmic-glink
               - qcom,x1e80100-pmic-glink

-- 
2.50.0


