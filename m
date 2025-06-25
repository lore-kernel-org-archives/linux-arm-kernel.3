Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98004C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 11:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOHLr8D9V4NN9mFAr1BTUycpg0tsYamgkXBgt1W/9eI=; b=W2J8z11Gp+XNP7sP4Rwbe7QdD6
	o0MwKMVloPg2A+CA72dKiJVdX195Vd322uPGGPPDN+Ud5CxfxejevUC9j3Is/VG4Pa5TY0qwFAXoN
	b73mbWeLBomNYb6l3KX3Uk8BNw344Tu4WHOwgmNNhf786l1JZlzWmbLSfiXnyb2LiQLGOcQObT2C0
	4/2wfaUK49Ov6AiMhfHn9Daso9fMhP26sGmpByojJyzNgRevRtg1A02vYBpozWZl30+WoR535MCMx
	Fck4s2n8ykAV92z8zpn23hT3F9qJJWULP7WBT2hQ8WSZCC54ZWD0EgEXaiF7zH1/EbdrD9xMDJRY3
	VsrPWKXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOSl-00000008VYN-3zJA;
	Wed, 25 Jun 2025 11:38:47 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMLb-000000087NL-0W4d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 09:23:16 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-acb5ec407b1so1057103166b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 02:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843393; x=1751448193; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UOHLr8D9V4NN9mFAr1BTUycpg0tsYamgkXBgt1W/9eI=;
        b=DfzqI7mR9mNBsWF2wsqlBc98kzcpH9f3nGGP+pFml2ea56G/LlJt7P0As2e92Eml+y
         iNw3uqoKTW/VUf9xvpxHx6V2Qmbq73kG8kPJD3qvc8jJaXpl2D6wU08exODstS+BIQKN
         d31SZ3gO50iF7OSQgIWgf95jpmeoAS5kSzkZl7E9BBgKDGCQKzN1eGcI/oMaiZzlyjit
         C8RRHLGkPdwmM8cvVA13JE73ZVmFwORXDCiMU+1INgE9R6GT6W8jL/a6MqoYdFSffbRj
         eimxacYkGUfcSSKqZTGhBXFYs+FnvBxTWaZkca0ZWKh2lQZaRHXE8Heq463fy7pF4AYR
         IorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843393; x=1751448193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOHLr8D9V4NN9mFAr1BTUycpg0tsYamgkXBgt1W/9eI=;
        b=SciONYHJkw5EDjuMe5CeaeWhjsYuqU0fvbSPa3exOr3nfX4HR6NrgafFrrMU+Cpzsp
         3qaeEAdx33+RnGF5vrIpCsNe78kDBXPhK44euxxlqd+iqhjLdie7t/h4EvDvkqlyjn3m
         N7eOU8TSt2Ymu7QB0AUikkSvw7kW65KW9LvTOi5CUAYqG/MrFgC1YiMqyjFKXctJyMWJ
         /6Z/K5eRx07kVhQalLlrRN5AMGkeaMtJKRhC8WbYvRmWalDh2IWRwnA5iaSDy51gd+5l
         w/CbhYSRh1TnQgBaFSj4cbE8k/1895uh8AFXvkLRdfsVAOjkMhERqVdGc2jAof/KMi20
         XDHg==
X-Forwarded-Encrypted: i=1; AJvYcCVDoaV6j5T+VFCI3gSwznFnVGAw4MJqFkYhvDrR8BnS+7rtj6xzfVIxE7rZhWTpMv3+qRoPzrNgxFVEwmqM04/2@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ45KA3dWzablTv+I8cdiEAOnxzx9NzpHNouebskR03oCRUv1t
	7ccGZzOauMRvPYTtkK8mmsQUSHH3rVoQQ3Uima+e3lvbh4M6fD8RDW9rjvHdHjXANEE=
X-Gm-Gg: ASbGncsY/h3hCN6cepEoGIf1nNpXroY1g8WrLh/V1vL8FM9rnmpWb5TXe3K5fMwo+6d
	dRhs79ho3X2fQPRKAC2PJFbTyPepWrgU/p/Nrgg4eOfI3158czOsTm+6Himq3gjx7a3v638lEB1
	/t8YVO+/8GAHiB+Cwt9SrUXWKHiqG0sNUBwLjp68RH+8HOwpT0DGS69S60Xn02+PwTPZbwagher
	SPRKZgEfJwZ3ZGUG8+7C1zQR/9ro+2rsf/3uz9vSqOv4GDcUqxNh8G/QzIc9N398fXMPNkr6nOR
	5LTGJmOCjBmLnZHXrwzXsE06jvsvNqkNsD9ePSqJOkGNun9lNZ2qm87x9xSeyFQkJ5Mbs7XtT0e
	HLKWeNdbgDTcroAgzhkku6UfiWMckbNP1
X-Google-Smtp-Source: AGHT+IHB94tY24lAu3oQO4eGRW4BZuV+A/oDZCQK+b5Z9Mh+mG0nksh62lt/+F3W7DxAhvn4P2IzDA==
X-Received: by 2002:a17:906:d0c5:b0:ad2:417b:2ab5 with SMTP id a640c23a62f3a-ae0beba2300mr176480866b.60.1750843393322;
        Wed, 25 Jun 2025 02:23:13 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:23:00 +0200
Subject: [PATCH 05/14] dt-bindings: qcom,pdc: document the SM7635 Power
 Domain Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-5-d9cd322eac1b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=893;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=kMLBa8XpPsXDlevy1KezXuXVxIBGJ+gP0d2yYQ8HaFg=;
 b=mdr+a+luUjX7AFv2DO5FQDsLMYgOBVUahwjTho7Ooy7Ze3zZt8tNJoSuRat0p8SJ/e1grPELu
 6pVuw/hE3yPB2VtbzJkUjC9SFW/NHJPRSwLMfmGq3pXJPW/wvwZrJgp
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_022315_167013_E81A7BB4 
X-CRM114-Status: GOOD (  10.05  )
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

Document the Power Domain Controller on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index f06b40f88778929579ef9b3b3206f075e140ba96..e809f50734bc3136a8915a12a1a1cba2bdb62890 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -43,6 +43,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7635-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc

-- 
2.50.0


