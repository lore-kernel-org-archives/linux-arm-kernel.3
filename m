Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC15C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 10:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKX5DuiO7AzJ1dwZVvAVxWI3Xdt99v9P0wOhJICwjbk=; b=AhRMmBYuIAYHia8hpemhQNBLbV
	d4fTfNq5UfnNy3jFBFxKfZ5waBIwZRexnb25RC1VWb2mck3Irsd1F3yW1ul24v91IPIzVskSmGsYw
	5Ld8flp3nBnF6D/MfB69frPkmhGYS1WVKphR2atSUSedmXeJtP8BrkzqXWvsTScMcXrGY5VCUBATg
	I2j8qFHqgTE1vGswvbNqiWOsF8aU8f3zgzEmT93xRtS8efU5hGVZWyhfs83pefPIVMoqWc6CCfwHu
	ZF8pQtETi3TRdn3YVm+BtVg6h6Bq7SgAicDnibkCQQcNceYPEKt3mWtECnR1ZZmdPmlPvO9Tq7/Zu
	KC92zr+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNQg-00000008Jrv-1wCm;
	Wed, 25 Jun 2025 10:32:34 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMLd-000000087OP-3htP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 09:23:18 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-606fdbd20afso2695944a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 02:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843396; x=1751448196; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TKX5DuiO7AzJ1dwZVvAVxWI3Xdt99v9P0wOhJICwjbk=;
        b=pccc6DxGPld9H17kBzNNxKN6rUWGqvk6OOu9cpLPtFNG+jyaBUQGWghBcqJsIeM6HL
         o3m6QMiF+GF+NQtKJz/8BYYpKmJ9R4ZnnXYIIeHX4RqHWovDvzHkJSrbQPdCSlDQwTqd
         i+6IxNDw2oafIoXfJ2loKD/b3kpceb+m+xdYYHacUsaf4DsLQb848HXw9fkl7KGzUll/
         M7iTc9FSnMDs5HWvOqodE85dJXEyWAS8WLlAFEfwtghmkZqUz4v3WV0l62t2dqdRs9HC
         zCxIM2UwCAm5FNxEpCp5QbOugWU1LWudVpyADcdmPibFLnM5ar6RB0gVQMFlf0kl02nN
         ftIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843396; x=1751448196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKX5DuiO7AzJ1dwZVvAVxWI3Xdt99v9P0wOhJICwjbk=;
        b=a8NkXLWYXwUXsFVCw/mWQtdqKYuxQuFr8ofwAHyr2vlf658B7cvKsNMUoGkwSOtYX8
         wgLnqr+sb6NfZBFqJ4qOhCiA5MFywDl8grhpAlA/02gzxXOdjHrLxFYeC7ZuY0NAoBuR
         xh4JQA91d5SfB4fmBu2qtl9gBnpP1puC5jYses7S4cOMuP4N6dIDjzIgMgpsJCLRHLfJ
         O6ouPw2nef8w+VRGE4cKRxxhi+vdhiDHK1SFoBJR2l2gK8/BR0bZByDRI/y22hzWGb8A
         31piij70oq9+pyui4KXbyin/70kdXnlofde3c6FpPqWFforO6RdNsYBEKVZBehIQLqlA
         4XKg==
X-Forwarded-Encrypted: i=1; AJvYcCWRUE9XvSpm5pkyfFIMC6xzSs63JXPr6T5h63KE5jAANQSjTooGWI0WMlughLXGM5fb72xatK4BQy7O3aje1bDW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1hfnzBOBBB5Mar/onQ9oMHF44UZh8MDaQ8kYDFOoOME0EdPc6
	r8bK52iTJs45QmU9cmEsm25tS1vhM1WKVCyuUWpYYj3H0g35q3POxN+JQeoA//8OqMw=
X-Gm-Gg: ASbGncuB06t9sVghXw9XPkV8rq583CcG60YlrNYaJAbehl9xYO7jSHc85QIw00GDgRF
	jP+6KwSYibA3p5m3kxu06sswMsxAt5eW+tJajthdUkU0hH7b5NgPSx2I2OHlmY7C9bt4g+Jbf1p
	2gJXOKD9fwMyHctMGwXzr7nAmaXfGvSXrphfJT/hFfZEnMXwempgz4N5zBzUJifpH8YWfrJldY2
	JFpLYrdGHovAqLkI0mmf/QHXAZl7q8F03ZYKAfzGFQoW919Q4JSn0DkTsfwNls6VOtVgmqR3kC6
	TFyks0Mr2UNBNUpYjxldy9n7+RYT26P34A7P28zmerr2qopDtaKZCtX9saLvRxXzxfDcV79iqnP
	z97JcfACxPUa+eYlx9AuPdEbm45juTEOE4QiT10+wdlI=
X-Google-Smtp-Source: AGHT+IGiDFBoDucTPjUqqaMImeHSSI/9lZCbdCTgquH7Z0S3KEgQQwP7r3gJyT916kpPzaeBdGItbw==
X-Received: by 2002:a17:907:9808:b0:ae0:bf55:5c48 with SMTP id a640c23a62f3a-ae0bf55634bmr217592466b.7.1750843396185;
        Wed, 25 Jun 2025 02:23:16 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:23:03 +0200
Subject: [PATCH 08/14] dt-bindings: thermal: qcom-tsens: document the
 SM7635 Temperature Sensor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-8-d9cd322eac1b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=884;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=QF6zOzPisaNRx6UkDEnfUjzHboUeRh3pRf3riJuZ07g=;
 b=u4p3k6p/2j42YHb4XwcyOL+Rq/CqQjib4+cSu01z968A3xXWkhEPGtNDUd9b2G12MuzVho+Uv
 4c01+k5CLJPAHJpvg+Bz4qlPQ4Hme44CNKKgFxwQ8y5DARbiLPoZmDF
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_022317_923814_E843D34D 
X-CRM114-Status: UNSURE (   9.84  )
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

Document the Temperature Sensor (TSENS) on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 0e653bbe9884953b58c4d8569b8d096db47fd54f..76b3d4ab5a793a9bd675e52a348ca2d62077cf58 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -65,6 +65,7 @@ properties:
               - qcom,sm6115-tsens
               - qcom,sm6350-tsens
               - qcom,sm6375-tsens
+              - qcom,sm7635-tsens
               - qcom,sm8150-tsens
               - qcom,sm8250-tsens
               - qcom,sm8350-tsens

-- 
2.50.0


