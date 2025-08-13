Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6CFCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 11:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/uSEHyOY8TPjXVXr20mUPgAnYEaOn2OIFqZC7pMk9s=; b=whPgaRjBXqYygn3ZbtvK8ngsPt
	XPM2C2/5VHO3vHsE9ozHVFp8IzTMUCrq8zYaRrHFSHCy3vvzIxQdyg5DRGy6c6hNYagNB4+uuVVxw
	jGhvKn+upiP0hq4oxMwmbfOVoUksGRbHjU+gW5CVOWm6HQYfQe7IWHbJp2kUCQdjW4O+tSHjU4L6W
	CwBU/YZTfUxEeedlnuo9tiS8y3DfvyVldDgCNTYGFojv/AR/ys5JzJ/XznUXRfsGznvZDBUh2+tDu
	C010rLjseaxmnfxpJ5qANkgNwA0HljCJRgBnWfc0hEjEM2QYVqevuTpXM+nbUmSBwgVaJKFQDc6ok
	g4A9KyAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9SQ-0000000DUlP-3q3t;
	Wed, 13 Aug 2025 11:15:50 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8kC-0000000DNod-1tZZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 10:30:09 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-af968269b97so107575566b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 03:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755081007; x=1755685807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/uSEHyOY8TPjXVXr20mUPgAnYEaOn2OIFqZC7pMk9s=;
        b=lL026BEOjnIBqdgphVk+aqhWSCLjVazAdvsu7B2ukIFDoVbhAAvOYW+QMH0P2Vha4z
         gWqzazsq3j9ec7U3Sky5vEFgmnOqz5nPH1gZgArk3mAcXB5o528hHXwuZazTxwA5WXfn
         Bmjn4/Y1yWjIcQaIODxPwSci+Se39EX0eO1naSCcW242HgT8Z17h4DvhDACTCvUaosQl
         POUupTjdQxomUlJqf8aVk1YXsFGqUPJQI/hk9BtTKAPE3fHxCAlHEtaZ7LsKxVU3otL9
         bgZJmkl6OiMrHQfAnUzpEDHAP0KQKBe3sUNd30+AnvkTLy4zO3ptzseewfSoFusSOVur
         iBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755081007; x=1755685807;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/uSEHyOY8TPjXVXr20mUPgAnYEaOn2OIFqZC7pMk9s=;
        b=ROVogoah7AHMU6g6hl/Irx9Upa6eMUWBZIeYvh4eENDC779Ht8EL5YwxDCGWt4jVoR
         Fd4T8ahZ6aTTLjG4Tozo+6Gjr9xdkHNhS5O1LK+VK2nJlKB47vLiVVxwL9vXGsDx+ZNv
         wvzVyElpita0cmNmJOuZvTm0iVj551iNMTE1iGsxTBsGI4FIKqUApfMGHHcWfHA03GI5
         QatYzf7XndYm/GOQo/rTcerwJio2zrEKK2osJlHnEfp5EEmErUISbbbyxQ39rFvOFWrb
         2QxZ5PQmm6U7/30lZhGDxY2xLicvYsytUJ3bYIbm9qiDitk3hKqXFjan8bT9taKUUy5f
         knyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSFuBmUt0hD2wFe7rZHk15D05PnR8yfv2LPA5NDxBHnJMvahkBcRIaz+3+ZfqfMO6wrBXWOEbY0Lv5rIQQcIqh@lists.infradead.org
X-Gm-Message-State: AOJu0YzHgbtwMLRNVs3+m3DpN1EVb2lFOKgo7jkWczprQszC70VKWbiU
	roPdl6aubzo86V0jwMhAUkQO0FI/BC26oll+biHNsL8TsbSNhPCMqecE+RXfAOOzVp8=
X-Gm-Gg: ASbGncupVAeUv0sjRAp4pgopotl8AHbfMFsRBd/P3x0WFgatFE++UIPiHZYmJ0VdYHb
	zU6qgpDAbedJa37QVVY1Lt6ftnVTguT0HJAxKvNUwyM4db1PBFn1YFLU8X2LwTKZ66uSGPnjV+p
	7Zh9SSHIFNAJvjkk0OHb4U8+t3VKk7asoI0RNGjMXkyMfj79T42bko9RgPceEVn/XqJD8ABxzq4
	kb7jwBO7TKV+X+S8x0fgmSITgPSBErtYn9BaYMiEiWWRTCef0WzkfzETvZ4/G65bV9GaAqIh40A
	/HXuiXYe1pOznCf1V3X9zhTs2jdZJvDC2shZlP4INUGAJv4Ovdot5yK8fJEpDTlUgu/uao0JcaQ
	H3if60IWtvuQC4aa++h5ZHg/8XWoBzI9MNzvE8ic=
X-Google-Smtp-Source: AGHT+IF29cdNPOBhCMcj9Obj9AvGdSJsCml5B5sk74SLW18u0La5OP66JPcnqGI8eEVOZWoaJs2nkg==
X-Received: by 2002:a05:6402:1ecc:b0:612:f2fc:2b9b with SMTP id 4fb4d7f45d1cf-6186bf79c06mr842428a12.1.1755081006695;
        Wed, 13 Aug 2025 03:30:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f15d9fsm21466335a12.17.2025.08.13.03.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 03:30:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, alim.akhtar@samsung.com, 
 Zhen Ni <zhen.ni@easystack.cn>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20250806025538.306593-1-zhen.ni@easystack.cn>
References: <20250731083340.1057564-1-zhen.ni@easystack.cn>
 <20250806025538.306593-1-zhen.ni@easystack.cn>
Subject: Re: [PATCH v2] memory: samsung: exynos-srom: Fix of_iomap leak in
 exynos_srom_probe
Message-Id: <175508100520.39785.3470511038407039138.b4-ty@linaro.org>
Date: Wed, 13 Aug 2025 12:30:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_033008_511886_CD07A4FF 
X-CRM114-Status: UNSURE (   9.65  )
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


On Wed, 06 Aug 2025 10:55:38 +0800, Zhen Ni wrote:
> The of_platform_populate() call at the end of the function has a
> possible failure path, causing a resource leak.
> 
> Replace of_iomap() with devm_platform_ioremap_resource() to ensure
> automatic cleanup of srom->reg_base.
> 
> This issue was detected by smatch static analysis:
> drivers/memory/samsung/exynos-srom.c:155 exynos_srom_probe()warn:
> 'srom->reg_base' from of_iomap() not released on lines: 155.
> 
> [...]

Applied, thanks!

[1/1] memory: samsung: exynos-srom: Fix of_iomap leak in exynos_srom_probe
      https://git.kernel.org/krzk/linux-mem-ctrl/c/6744085079e785dae5f7a2239456135407c58b25

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


