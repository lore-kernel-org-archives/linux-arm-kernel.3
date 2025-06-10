Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF3EC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 08:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juVrDSxpmMtgoJh5pc1VP5Zj0Ly8Ck76E+2hldG+2FE=; b=WIQr/pJSBiKSkYVkOmAx0MJVjT
	PdHraovhbbPTRT6nWqXdJezsQxepMcO/NPiTd8pc87HCrw83WrDaeH8E2QGTF92Ki3RcJS9blnWr/
	TWsmKl+wsZIO5XX2hgCJjqKl/wwBH5Xw7oyAhgsEUn6+Tyn4UPXB8x1rlCbYYip39RjPQGSho1Ti3
	z7rvG1K0j3Mt/MmAdxqeLxhDvQLb4POP+5Pfy92N/WHTd298nZU6/1F0yL55XczAR1B0h5b53dIIW
	GiTEVV7WQXWtoHF79W5Ezf1F13pFFqCxaHgtGfxbekZLGfTE1XybY3kWW0zVms2DjmrXxP6KNOcwu
	NR8sl/qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOubK-00000006DJA-3Rgm;
	Tue, 10 Jun 2025 08:44:58 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOuGQ-000000069vN-1k3z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 08:23:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4531898b208so671635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 01:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749543800; x=1750148600; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=juVrDSxpmMtgoJh5pc1VP5Zj0Ly8Ck76E+2hldG+2FE=;
        b=lnCjIDNNIVstO3kUzVsfOnyIsB6qv2RYdjfa7T7BGfYmg+bvL7a5j44n/V/k8SLZ+O
         Q1jq1ZPfEpi/FueqZDTllGHDOGauOWoOspOpX+WBB5728JPMGVp2OVGneh+09ST5FKOZ
         ZVpIdWWLmYFCMCLL0/yeoWOVrNhsBbaviTbyRjmaiOKKG86d0I+5BFLmTMbcwtGTE/GV
         VKJUeKmCasyikd+mAvIkeisBN+s3p2qvcEHXovOmMfDi9yKtMpnbaGd2rzsWoj6Eogyt
         4FNmgf0rHN3H8B0Irq/R9UYPRG/m5nfGh/uh5l6TMItb/4zqIrt3osz0OANCapMUOaoD
         J2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543800; x=1750148600;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juVrDSxpmMtgoJh5pc1VP5Zj0Ly8Ck76E+2hldG+2FE=;
        b=uUYd15GBonP5iLQ6nPT0rkZAYkKRMX/G4W+GGqBVWpwE728vkmuZnyUHhJUgMGrvcI
         60hfB/mn1lx7WXnJvNrPcrfFRWuv3QQbA606VdWszqKkEGWPm32nV2sxvrTickI/7UKM
         JawnCccwtd1T3295NNh6KrqfEP1HGnOE4u/8pqjIsqAm8BgAVFCiGTDnYvwJ1CXTqY8m
         BKpC6IrZC04K9A3HxbgiYaPdVhtD6n4YmmEl+1GyL6AMGAsalmnnoLoRytVS61YBp0q8
         oP/1KOYCQt/DilLIT8f65InSqtjJNjxUxxou0cE+WyaeavlIBf5AfXnMHc9aq7qP069E
         pLfA==
X-Forwarded-Encrypted: i=1; AJvYcCWxZ0/csO2+3hrDQ2qVp2GD6ymU1v7eggq7YviJTrSx0hVl/oBUJq4sHNWS/lA1h9L0I3zoPmv/axnUt6rwjzEn@lists.infradead.org
X-Gm-Message-State: AOJu0YzFdzB9IkAcxAQVUxPEeYGHC7YrJZzQChm2YisrF7mzJGXQWRcM
	U1g7jRm6ay8GThH7MYQJsvNMnrArmPY7v/W8rkO8RxwYKbmuxE5gE3QOvtaPXri9hoc=
X-Gm-Gg: ASbGncvbo75qe96uXw4pxqZpdFLVQl3XdesM9/QZfAhZwOolqvB2ht8vBnAv8SCvJYu
	UqfM06swFV4+059KcxvLY5AXxuIbnw/JB7ntYCOWjDYzd8Sszsu93avi4LoO4YX4DlysgxHqaOZ
	r57RXv9OEWVEFg4AQsl7qm8yYMvNmH7rLG4gDbAesORVkBEqMSJvb/aCVBJTIPGOv3vSr+Jgy96
	5E68BhlHLCrQqOth9pyCYxS1VNKcnLq7Gj4/J04QBG+/hkVK7Pnyl46D83jtc8CvmLZO4ovmKPE
	bXovYtzl+VJy8iVp1D50TUvoKVywkD3nc6poH/N0v8guvwhTFqap2H12rkwX1QMIAEaNZl1sgnG
	SHceYTQ==
X-Google-Smtp-Source: AGHT+IHmkbNCG4AE+Jw0uIEU/GxFnvKzXvXYiz5T9eY+25yhF+FTVYqqY/1/ANURHD1E3O5PMpRiXg==
X-Received: by 2002:a05:6000:4313:b0:3a4:eb9c:7cbc with SMTP id ffacd0b85a97d-3a5331ae097mr4937643f8f.15.1749543800578;
        Tue, 10 Jun 2025 01:23:20 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229de01sm11895403f8f.11.2025.06.10.01.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:23:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250525190630.41858-2-krzysztof.kozlowski@linaro.org>
References: <20250525190630.41858-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: soc: samsung: exynos-pmu: Constrain
 google,pmu-intr-gen-syscon
Message-Id: <174954379928.117699.14584808679236287569.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 10:23:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_012322_463462_ED8C2EE9 
X-CRM114-Status: UNSURE (   6.77  )
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


On Sun, 25 May 2025 21:06:31 +0200, Krzysztof Kozlowski wrote:
> PMU interrupt generation block is not present in older Samsung Exynos
> SoCs, so restrict the property to Google GS101 only.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: samsung: exynos-pmu: Constrain google,pmu-intr-gen-syscon
      https://git.kernel.org/krzk/linux/c/952a81b137473cf679c229e7e7e175dce715cd2f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


