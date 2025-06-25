Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753C6C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 12:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFtr36P+rCcWPRSy5N2MbhYZaAtcWKoXHXQTaJufVVw=; b=B0TPdY1bIDbWdnLfAVA48gT8GO
	AbPqK2Upfray2bibqehhFF1aZO4E1Oz/JZXbLwkR43nExIziCh/uUPk3URAf10mJ6k3W5WZR5clvV
	3z1NpxnrMqTh1/ae9Fkg1291jt5XcDqf/3L9e3yBy7ZTGC2106df3lW66blW2zEdvkKhCgLcAymLB
	bhDgc0QVYINp0Xji0Ochfk1/lAGxCiSKtOBEtkfZqGZzJoDwn/zYSckeNSqWoIrjZxfC03rW0EqY7
	h/nbF5yOwhGPRQAYHmbZBcoHneZyiewdtT6v+qitPivpQhD7Ep7cG8sqw7Z/+Hdk7jFeE0R6T4clB
	Evp2L3sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPOt-00000008eAJ-2uxh;
	Wed, 25 Jun 2025 12:38:51 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMLY-000000087MB-0Xlz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 09:23:13 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ade4679fba7so240807566b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 02:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843390; x=1751448190; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFtr36P+rCcWPRSy5N2MbhYZaAtcWKoXHXQTaJufVVw=;
        b=H9XVKldavPPrU8SdILb2QGNVQHKwtePSzsr95t+FZM40QGh5fliQmMuf9Yukgj/O9E
         WR9Ujlze2TKLZISgZKwfL5aNtCFlzVd9+ENWkyxuqYUjaJZ+DufvuzNvobUZ2DmO6JBB
         6XOjvr6jiwHHhU6PTJLXmxBtX3y20eVvt3cUWCU4qJVY9qWUn4nTyOKWxlPcbGUWWTEh
         yWy8NBjG6sq4EQYWuD10ak9xdwI5JqwZbm25lnLzx0uOQh5EyCrUQuOVjb4VWWCVdB6B
         /yiq7ML8Gj8sSZOzDxC9B7jaF15MeW/qOb6RCnTlIjrDKQTu1jMDaTGEL0FwbBNxG0EY
         XUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843390; x=1751448190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFtr36P+rCcWPRSy5N2MbhYZaAtcWKoXHXQTaJufVVw=;
        b=UuWgJ7jvptd2wB/wX7LOCLHgIHa32BraE0cS04Zbjg1jjBylGuP45BO+38JJSpZCep
         WOLPaDdCudfIrwRWPQukkzG7T0E1lbYAVl0/jfnFYr5h1b7yFZAPZIH1D5L2yDV8lRkW
         kV10zi6Lv717jaxBVbIzy0kzu/AapObWl4zH/LqRH2ya/BYbP6mlMlaaxvz0WgjecURu
         Gk8YV5xX3RBcIOQUkIsw56HQ8QGLbJzcD5SM0jN6t1Cj7vad9fyPDCMogdPuJnwtrIUO
         b5ktVHdR7sQg9TLJb4WAHh3yaBR50wPJ7UZfRNv5SzvRW8wGawRdJt5rUIXeFIMKWpql
         b2Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVulQGm9nnl8tFmo/jJysyXxn8qx3xXhoU4meqnsoQSV32QEMF85oQ3mlKjQYa9oswR+miVamoGUvsC8hUr8p98@lists.infradead.org
X-Gm-Message-State: AOJu0YxbAzPlPZ1ZtNuijCRZXAds1l8mWTIM+Alg1YRH4qqK+wJRsEvc
	ILOPj0lOu8eWpFpmSRSkGpPFUGNZvW+qkb3gKtG5zRbNzyJgiWmo+NGzv8PjsgKVN5c=
X-Gm-Gg: ASbGncu5Z5QrFrN0WjmWLNJKDB2bxPxAX7wr209LijSv0+amD/lUfDjoRoxMpd+n+BL
	zbtMcEoAjPZtNxQJ9uSrrreQ2MsU1mNcufC4XYbvWpEnJrrqc5zTC8ImJUliP2/s1XDfpGXw1le
	DA2GmgY/dfNvu/WsBM3ofUEiyBNEiJofAoyTuQPJxx1MLenZ27c81wWfxV3nV7d6K4q+PgPmlsg
	mWA8nqput9tvrSGK3+3vl9q1RI84qsi6yX6cZ4OKjrneQzRPznNjMa7hV70hUlEvZTRbTr5VXSw
	0xdw2A9F/wVwlNkwVikCUz16R+7UBXbPIf90y0q9PlHxUB+NiMmEekiD7D3mZIAAvVfuf6BN7pq
	CAQh9gh7YBdpp3u01XlqLnIprtPT+UDga
X-Google-Smtp-Source: AGHT+IFJ9o4JWl7lIDkFxyVHQOH8cM1/pOAHHQWQqVQ98/eGA7Vc8alvEQuTG6jNWUZwYJgy53sTvw==
X-Received: by 2002:a17:906:ae88:b0:ad5:3a97:8438 with SMTP id a640c23a62f3a-ae0bf1b4c54mr195255066b.41.1750843390328;
        Wed, 25 Jun 2025 02:23:10 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:09 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:22:57 +0200
Subject: [PATCH 02/14] dt-bindings: cpufreq: qcom-hw: document SM7635
 CPUFREQ Hardware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-2-d9cd322eac1b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=1256;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=cHqszQuBCaVtspU1t7iOjEc+5vwmG2p0Bi0y4m/DFOg=;
 b=kCR5siUeapo7dxDWp4dWExqPF+lGnBc97GFA4dxfQD8XoZ1lE5aOP6CJT2iAzeOSwdIFhC4/p
 Z4uY5ayq4rUBb21sP5ZjkiYsj+KLEC4ZuYf4Q18vGbyiwI2d+IWW6Oq
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_022312_170997_206FC981 
X-CRM114-Status: GOOD (  10.21  )
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

Document the CPUFREQ Hardware on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index e0242bed33420a39b8a8cff4229ba9eee994ca30..58a2222574e57a8f9c114f5fc3f0aa19d9794965 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -44,6 +44,7 @@ properties:
               - qcom,sdx75-cpufreq-epss
               - qcom,sm4450-cpufreq-epss
               - qcom,sm6375-cpufreq-epss
+              - qcom,sm7635-cpufreq-epss
               - qcom,sm8250-cpufreq-epss
               - qcom,sm8350-cpufreq-epss
               - qcom,sm8450-cpufreq-epss
@@ -169,6 +170,7 @@ allOf:
             enum:
               - qcom,qcs8300-cpufreq-epss
               - qcom,sc7280-cpufreq-epss
+              - qcom,sm7635-cpufreq-epss
               - qcom,sm8250-cpufreq-epss
               - qcom,sm8350-cpufreq-epss
               - qcom,sm8450-cpufreq-epss

-- 
2.50.0


