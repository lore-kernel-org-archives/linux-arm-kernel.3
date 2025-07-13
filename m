Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB09EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 08:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdkfO4ocsxOWvyOKIsWLa8yR7W3TV/OTXW4E8s0id9w=; b=WlD/TfWxvlBjA8xWLk3LdzrVgb
	DVMIfof6NRI9IQ6I1s+tYhNqnK5jbqY+0utySUgzGUPRGhVVxVftoQGkk4+/4yoDKS843HFj1d66u
	D0RWlhdNj/wlvm8pq8tFTwtL5uv4YgjSnUIovVLVlX/DRLvTZ1dzgewBfYF23k9WiiqW7O+JBvizj
	qE9qQYF4He7kKSACoZwRBfVxUKNfIuQEozM2F9mPrMrJbpKzuF/CNaFX6phe6xs7zkDHZL08gI7SH
	EwAu8bX6NdiyefEwb7Iorz/Ud4awE+nuCZKtUoJZrl3PppVSk2lQDzEhNbjTl/8BZUKTl7lTvqr+g
	n7bpflew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uarua-0000000HVjh-2B2B;
	Sun, 13 Jul 2025 08:18:16 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uarjH-0000000HUDq-2pJa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 08:06:36 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a6cdc27438so2884666f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 01:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752393994; x=1752998794; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdkfO4ocsxOWvyOKIsWLa8yR7W3TV/OTXW4E8s0id9w=;
        b=i7Q7dWGFLlxdgZFokAXjWnwUJlKrRfd23pnzj5TY15AcsKtrxzqIYAq9Ud1LVis1LK
         kibTta7kDaHXib7VQDZcJQ7VagUbkvOwx4Odrsr/118zHNb/e1RCsXDgEYVo99beUvrt
         yb0d2wiOYztTyhkz+7KrMXOMY1aNKWSQeNXQLd9k84qLdoX4Lzv0wyfAYDsa5KOnD7nk
         wEXQFT+hKR7nLRBy0u1zYrfeCG8CqO249POCoWDyDQzyud/WmRrQXb5BCWOP5bJcRllV
         f601rkKbTx0XABGLBARZNcsSQM6kM3zPSfXOsc6wc5WG1YsvMKRWhbv4VBWrsW2BuNgQ
         4SZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752393994; x=1752998794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdkfO4ocsxOWvyOKIsWLa8yR7W3TV/OTXW4E8s0id9w=;
        b=tBfQj+1I5rp9YUzx0Zb6WWUve0uT6/PdWrOw7hnjK0NFkESpRH+KSsRI6uVQQGmZfs
         B6xwnPlrOigrIWsWOYe6Os6UWRrBmaE1zdyn/dlRZBvH6DNvfWFnFQ83kFhemSFQQN9v
         9kh0aBw4RN3Au2bi4FYPv5IC3mlpSymQDY5yoEAshj8ps0olVRRYs5tW9GlSQz6I2Iwc
         XiRniZ9HrPGu9s6YMkNoSLl3NCttL4fBaQb1R6NgyUwZeu8VUwufXDl1PBH+bF6PQQEA
         YawYTrPCKu/ChrtGl3Z+A0tKXH6O0K85YaKy5awNebdCnK51vZ+z5+k8PZjvOHgwNQj6
         /rJA==
X-Forwarded-Encrypted: i=1; AJvYcCXvayGrFvbzjE4/Iuyp/hgH4p9H8jxuMv7lJUtC9403jBL4CLmwMVLcKI45pFpgciARg/HTG2FZl/wBu6P9oiFH@lists.infradead.org
X-Gm-Message-State: AOJu0YyNm0eBha/fai1aTq/B7S1LCxmxwyCdmUUNW31Uf5gS/I1H634B
	iHWxUOpjgyQCMANqKday567cje/vi+CdpzlMHxPoXw7xBBNyZZcapehVRejPZnYZZwk=
X-Gm-Gg: ASbGnctOBT1oke3WN2mOJKXoPdJ5jBND3wLPkZU59yk7b3cM93ebNvxGSVd1O/WDGFo
	jNimDxs7xOD0Vfh6LYa2KzT1b6HSchEN+pUFED+kuCH8RJyBWL7NCNhEQbKsIeh2gGdlYFKGRX+
	RZ3FjhyDbvMoHG7bh9cd0dtWZIbZ1ULMK1iWcJmqKfbTzio9UfC7SWSYXH548b1UQ6ENOTCEg/7
	v7Y9fQNUzQh4kAbROv4uA/KGPZYkhHtEmwiAqVs9wc+4ldUJWuSPGIcAZV2m8YUEy7+HnLWpggC
	pMjRgaGZmJ/3k2OupxTgWAh0IkZLMdUDzueXh5mGikNUv/zh1JM7jg6bl/TamRl4LWOUCvwxRQ4
	PFHtdKVLHSQOBi6VXeW8LDRPLP0T6D9KFnL0W
X-Google-Smtp-Source: AGHT+IETm4Mw4C1WYnuRN1dk6ybQZp+9JbAH95T21UPA3HATzrdU0KuRyY3yw2FY1OGAeUmBlJ7Q9Q==
X-Received: by 2002:a05:6000:2410:b0:3b5:f0af:4bb0 with SMTP id ffacd0b85a97d-3b5f2dd1547mr6813098f8f.23.1752393994069;
        Sun, 13 Jul 2025 01:06:34 -0700 (PDT)
Received: from [192.168.224.50] ([213.208.155.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm9386608f8f.34.2025.07.13.01.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:06:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 13 Jul 2025 10:05:26 +0200
Subject: [PATCH v2 04/15] dt-bindings: firmware: qcom,scm: document Milos
 SCM Firmware Interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sm7635-fp6-initial-v2-4-e8f9a789505b@fairphone.com>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
In-Reply-To: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752393945; l=1075;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=tMLsPA0quQvuGmIREPbj4TjYGghQCOz1jliVkGJZk/w=;
 b=wu4AXtzoN4ob1c0+EbjfVXv57Iq6e0C+uSlV0gsPf5gka7RfNfnS0ibFZYnFdL1sPEcYX22VD
 XbfEFfvkl6AB0MjF8vd/pEno76wGjhFqV0jo7S1Szl8EFehBgvQGvL1
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_010635_715590_B6694FA4 
X-CRM114-Status: UNSURE (   9.98  )
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

Document the SCM Firmware Interface on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 8cdaac8011ba499794ebc5b4291b7983c209821b..b913192219e40324c03f4ff1dce955881e7fb3d2 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,scm-ipq8074
           - qcom,scm-ipq9574
           - qcom,scm-mdm9607
+          - qcom,scm-milos
           - qcom,scm-msm8226
           - qcom,scm-msm8660
           - qcom,scm-msm8916
@@ -198,6 +199,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,scm-milos
                 - qcom,scm-sm8450
                 - qcom,scm-sm8550
                 - qcom,scm-sm8650

-- 
2.50.1


