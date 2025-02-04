Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9D4C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 08:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SL4WrTFt01P5kb4nbA+mR/wAIuzdlMsYyVAk52AYWQ=; b=CRPR+QSss0C66P0bmJWtoviYt5
	FyMyYz4spGV2sMvsq0YjqgiTmn4yJYVTfPE99B2f6xReklFW3FuZ8VQZaiL3TsxZnKmye+sUEj8ic
	RVVxF0eJx+Jw+0Yi1rtOBM3/iQvlHNQETkuG5wfjEw1x7HZpCRWLsiCnY5rIG+DFzv6q9NKdv6Cbn
	eAVtoQB+Zr+rxMEkcA3P2+H7cXkl2Mb4tfHMQjvj0IGkIKeBWPTm5t4uSb9aTh4gO6WQEFY/Cs2rD
	lup46r0G7Z3lSL+VLE9iD3RpaJGiDlPWX9SgQJ5YB4ihGh5P4zvPIw+uTZ5Cwc19f/2GBsRuDvDZI
	QMH1M9Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfEgU-0000000HZsw-48pj;
	Tue, 04 Feb 2025 08:53:31 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfEe0-0000000HZQt-3bMG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 08:50:58 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3862de51d38so194280f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 00:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738659054; x=1739263854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SL4WrTFt01P5kb4nbA+mR/wAIuzdlMsYyVAk52AYWQ=;
        b=z8vSZjaCiJQbY9p8iYRZbIztyzsxscxgcCY5JtWNDpiEHYSqwrA5HRRX2Qam5allXt
         z4+ocrg5JODTg51jv7fLGTTy2Kcu7S2e/bQqK55rk4ohnrVozhMaP68b1qKDW1xnfWZG
         wtTYh4S2prw4f+LWhjouhoJlqeqV6XFrvniSgkny7LDXLn2+V0qPvWA9xINugsEa3m+b
         SwBNzX2jaWCmmiNSO8UBZgQB0CxMll6VkuyW+cn1c5zsKpRWmL1VA0IDYDXY2SEcu29R
         BZaCIA1L41wQ9Y3hcxclAt0xSwKgy2SvFUM88FcdVYelEyOLzDc6dwJDASZaF0ORlf0I
         cdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738659054; x=1739263854;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9SL4WrTFt01P5kb4nbA+mR/wAIuzdlMsYyVAk52AYWQ=;
        b=i5i/sQOBH5x1dCVkH5xpvYCKYYX9G89hRRNANm09OR0/MyVH5kmPXkrQHKMy99PpS+
         jWjR5K5zh5Lum0KwzQyy/FceYHUYf/2KlZMt2PZ95T5K1fzbQQd+kms3VtfGkLOrFbLP
         /aGJgoUr0EG0c8f/Kx4CoGotRt2WjCiYDwCV8lKHBPzE+6JwpwZf1NPpt3ZXcjRSoVqX
         kNpMe0rjnzmOkRDW731AqNGnIRzw+b6vQ5eefsfsJE5riEE4KbyczKt2W0m7iUSvwrwr
         m07XjwTV60Z2wzIl3FL528HxWbcUw9Sc34g/9qyB6SzURDwbacHyHY653yMphaM9RrGY
         JoyA==
X-Gm-Message-State: AOJu0YzYNwEWiFp/PU3OuSaJVEVp9UG0HkWfUwiBScZrkP2GZNeHOP8p
	rtt+E5VoRD8MqZ/L1xJJiAgQezmstG0d1okClJm/yic12goAwJWZ77CVCWrBq2GsjFH3YDUuze2
	R
X-Gm-Gg: ASbGncsB+qrZDNKPT6eScr90N46AEwuGc3ycZ6ywnAqb9DNZbAqYJhWfnScRvAJ8aSf
	5i+ko3R6DI1BkazlkqlFhaVrWPtSUAq3NQZy27BVsy/j7ebOKesvTrqgXoIOahFyCyh5Fu3nIPb
	68NFsVnyhU4XX/O65tLn3+urK8ETCXjyn6HYYjDgY90VSinAsSWdHdhUqMYVrSWdYag+q9I5lOK
	QQXtlFdZ/kQkqdP8FJF8rGNBeOkU6aGVh1b83627eGl+AJIEn1SYR2n/MOjYtafEPKteU0GPSFQ
	hnpS/Jlu+AJ2RISAzFoDyGKkvjfyRYA=
X-Google-Smtp-Source: AGHT+IEiM4BEwyj9kJjGaATYMGTVdtTyQJ6Gai0nJrlUHfZWE9a3z3Pca5QvAuf1g0u3xA6mvsDd9A==
X-Received: by 2002:a05:6000:2a9:b0:38a:69a9:af95 with SMTP id ffacd0b85a97d-38da4e1c7a1mr784380f8f.7.1738659054614;
        Tue, 04 Feb 2025 00:50:54 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38daf27bbf5sm503066f8f.48.2025.02.04.00.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 00:50:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, stable@vger.kernel.org
In-Reply-To: <20250106-contrib-pg-pinctrl_gsacore_disable-v1-1-d3fc88a48aed@linaro.org>
References: <20250106-contrib-pg-pinctrl_gsacore_disable-v1-1-d3fc88a48aed@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos: gs101: disable pinctrl_gsacore
 node
Message-Id: <173865905338.26600.2847324274342938346.b4-ty@linaro.org>
Date: Tue, 04 Feb 2025 09:50:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_005056_914774_E3F6D631 
X-CRM114-Status: UNSURE (   9.37  )
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


On Mon, 06 Jan 2025 14:57:46 +0000, Peter Griffin wrote:
> gsacore registers are not accessible from normal world.
> 
> Disable this node, so that the suspend/resume callbacks
> in the pinctrl driver don't cause a Serror attempting to
> access the registers.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos: gs101: disable pinctrl_gsacore node
      https://git.kernel.org/krzk/linux/c/168e24966f10ff635b0ec9728aa71833bf850ee5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


