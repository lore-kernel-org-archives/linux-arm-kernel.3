Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9C8C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 10:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iV2ZnPzTHx850i93QH2RHh5n0N52PnUpwC+aDpzRmE=; b=noVwkZ5TxRfWIAu1M93Smfo2+G
	2VRbjkoKFJQAFZmZBHzj/iPOZNArvrxlbpYS/meKORWrXZM1c4pnanidSQrbwF49oP+U6BY1LNCFt
	z8fIxjTQ2DkYyOS2Asiii5NTtW5b34l8ZSFpB75Q4YddwjG6hzfy8qDhjiIWdWhU6epmDCG9KQPh+
	GzFkVRdTCA/AXN2VQUL/3mWXV72XeOwK419EvgaCa+iDUczQctewJtdtqtUyHFtu/NI95YQHrAkQl
	El+p0tm/Tb8J1bfL/WdgUn3684nnMCakoe1wUoCaki9bdj2QLzSCK3JT27wukRK1iPvLeJunGhXnu
	4a8yoi2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNM9-00000008JLU-1iIa;
	Wed, 25 Jun 2025 10:27:53 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMLZ-000000087Mq-3kQ7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 09:23:14 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ade58ef47c0so146484366b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 02:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843392; x=1751448192; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iV2ZnPzTHx850i93QH2RHh5n0N52PnUpwC+aDpzRmE=;
        b=LNs0VqPSghqwp9ktxGYQNkiBt6qz1W0bJg6sGLD3Lego9QhTl9EwCzUaGUfoEDs4qU
         j78+uks56WaLKbo4LNfSAPtiho/rVa6Lx/Ixd9OVpitBjD3HO0E9ag7pBRgYlM4E/PoG
         6R7iU2LuhtMerUfdCbsGRUNmyYil5NEZ/39dKQqiyB2CEz0qZMKM9rtnhY2eXrYT114P
         Yqni9zkSfU864jxj3bhigMJTti/ZiIRXHmpBNN+vXnp0RNf1lB+lU8L/0wSO6aVq3848
         euZTW9yYjCs1jZv6pL0WX2E/zQHrvjwMjRTeuAhfPOdU5KR5DPNbA+T6LRrPb77McEwJ
         vq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843392; x=1751448192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iV2ZnPzTHx850i93QH2RHh5n0N52PnUpwC+aDpzRmE=;
        b=Ba1pMNzjv+0c530FZfQNlvC/NmQIlE88wduPeXummz3QrG+EgzLdEu2GynbhxXP468
         7QhJpZYGP8c4e53iM5z3poOtpCzLl7CyUqPHT8eDqTli/D0s3l3tW+1nCO+242j0THzQ
         r6QfIMJPpmJpyF+0WKxD/MerPEvOO0S3l86QNwQ5dkaZXbOnpPLgyWLtNLXiiGsYyXzY
         n1YaTyu5WX3slRS3Q648+KO68dvN8pHlZbrVeSxJ1YIJCDdIbCrag8rmugsqJWx53ys3
         qmNp7/sZJRA0wFjtmYTBGe5ZtSr9O7u3IKJv7pHymsnvWBRACka63ai04LswTSpEXxUj
         aZ7g==
X-Forwarded-Encrypted: i=1; AJvYcCW3dfNAajcT1hjAnHpzw2p1Rzr/ZA6UycBJpCuKKYotG8Htv2VtmAlnp2lbUO+YarjjMtKCxH3a1VupyrB5hDfV@lists.infradead.org
X-Gm-Message-State: AOJu0YwM1neG22XooaUF0MPRSn1+LgbyRfG8xfk2yMfHQXwH6IjBHvkn
	Ukc3yXjTi47BWxMAWAOgAWOlaqnwjxUqxwrFNRKpjj1IVZL1QUy8IM2pb9T59E08Aio=
X-Gm-Gg: ASbGncsMCiqWtB3n0nwiTsCOP0MbnG2kNTG5PXxxA2xB3Ap//wcNJh9La2o6dqgb/O1
	W5nA5jRRVz8Vdl+x/iFAQF7KI7xsVX0ghs2FK3hyFJFqSIWLIwLEHyWoGvIbM1fTOi03Qu2caBy
	lAV5wn3RZDjzHQaUzBVYRtWJtDDHCswnM3B1ZIzonZjUlDsaN68SsTUfdu/XF3oU+ubRJr+x2Mk
	o8MfNwxKm80s2OAWWypvolG88bkFn4dCwhVvDL14c1mB/M3Sh7L7uKyfIJdCQUv+smNw3YcvjlC
	lzketctcTJUYsNUe4XxaOaJX4fPDyjbdJXsZDTFQuxTDwGBNRrugNX47DK0kn3jPsyyEe5/VVLQ
	1S4iaauQWzT/vkTytFaR6mnmOhvAvjx1D
X-Google-Smtp-Source: AGHT+IE1gc/uvw/ng78i+q8hHmGEhnihasoPg2pJuO7nZfnd78u9Q+SnvB0RXN8h+HquieGEdTPAUQ==
X-Received: by 2002:a17:907:c1c:b0:aca:95eb:12e with SMTP id a640c23a62f3a-ae0c082c6a9mr173270066b.24.1750843392378;
        Wed, 25 Jun 2025 02:23:12 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:12 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:22:59 +0200
Subject: [PATCH 04/14] dt-bindings: firmware: qcom,scm: document SM7635 SCM
 Firmware Interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-4-d9cd322eac1b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=1077;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=uhtUa6TuWWOeZjd4JmW5ZGjrlr6PTEqwVAXpwJZmwlQ=;
 b=P52I7QLzFA0XxGiWQVSrZWCETXtQVh8QX/bEHmeiiACmOITY5bmcMCEU3Bv0O7QmN53S50sov
 SnkXYx/JOQTDQpqfdQvrqFD3cdiTSWKxRGwqgKDTvPdxi2Nq493mxam
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_022313_938525_E601F63C 
X-CRM114-Status: UNSURE (   9.99  )
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

Document the SCM Firmware Interface on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 8cdaac8011ba499794ebc5b4291b7983c209821b..6ae7405aac658ed5c3524ffc394d845cd2f42798 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -63,6 +63,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7635
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
@@ -198,6 +199,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,scm-sm7635
                 - qcom,scm-sm8450
                 - qcom,scm-sm8550
                 - qcom,scm-sm8650

-- 
2.50.0


