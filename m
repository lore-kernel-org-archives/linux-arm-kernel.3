Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EFBC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 19:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXwlkhSlbVtwXogPWWcb08IskVMbUMqFwrxRMdg6+Ow=; b=X8hX0S8jj4IzFQcdf2VovMby4j
	x+V9B1RQr0z7RooZFArGkNs0T+/NVBgpIgy6OSk6O7JSfh38Ero8eJfV6T8VkyBR0x5g12QJyM5KO
	2zJBJAivA9VO/swJcmaBlgOFvz2GP4dyCDLc+d7TxIIhiQC7v6xdxoYQtY9wK6fMVk4GaEWkNw8I7
	mcQvLpBoN0zCVE4JP0S6Rv1QekhG2fU5b+JsKsm08vCTciSAb0ro35drUiIlRlhsQ8DUNfEaIQ1d9
	FWDPv630OaOrYAZ4/fBjMi8ZKNDJ/W/oWSDCV0coLRt4rC0SLT6hhoOvBllI3v/8xrlTji2Y9AK0D
	13JzZ/eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuWN-000000095Bb-0oEL;
	Wed, 05 Mar 2025 19:35:11 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpu44-000000091Qi-2zpU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 19:05:58 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43935d1321aso8759805e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 11:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741201555; x=1741806355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXwlkhSlbVtwXogPWWcb08IskVMbUMqFwrxRMdg6+Ow=;
        b=PBHzIw7XbRqWs2CsxrLITWrQMNsqwxvyW9llg0K1e34VHte5Uu94SZaYlHK8FeKtB+
         C3ciBCzw9CVdboIQhs741WD3oo7jgfSytbZF7/FD8IKw2H3s5cf47COOjbj1Qd6XWZ0o
         gUVZoMgiNFfBDWp6Efkk1JP5fn6LmDAB2DOL0gq1BDQwlf9xc4SwI577+7SGrqnZm19N
         o8LukcPmXJJ0xP5m5Rprr/hgFQvf3/3FpDr56kX/NrSMeLbkkzjpC9mxeN6Z/LcBsNrr
         uG55b6H3BezU/VYBGyKA07YEQy76FYnoTWslFoicXCmLmInKZpp3y/9Q/8vul/Wg78Z9
         2kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201555; x=1741806355;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXwlkhSlbVtwXogPWWcb08IskVMbUMqFwrxRMdg6+Ow=;
        b=ZqDWVJC/6OERJJ5yuPJ1XlO7moZDU5D3VVYNVj6HPllZe7ui8uXmz+7tDEaDCGMn+F
         Xwzq96dUyY3+A2CcHsPJtPBOiLU8NIhreL2kq7xkdxuxR+tIwJ1sPt7rl2GtOXL1kIbg
         hG90UnyVPm0hRU7MNGgFV6HjojvPkyZksIR8Z/flaZrb21+Qa7zkfwbRNZJGEKAR9GJ2
         9qA4hGu7bYSvqWOUuYdtHCvqtvvvYdS2UnrN20S2IRk7vUwGR9ss1qVARgJExYxUaeGA
         ilImcUdkPeE6OCwXRQ0Xqy8jzspbASeadXfNbofld0DjHvhGwtQRATxkYdrD/VSImH+J
         qeBw==
X-Forwarded-Encrypted: i=1; AJvYcCWWgep7EXkj6EKzYWaLzlCEBhxPAT/HquQAvgbnKnKZBvN2pJj4wV3YmfPM2emNNpmVbvR8oBsipuE+XAFWLU7q@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2C1UL24bq26+5ZVjBDYG4Uf4+xEsaq/8iai7j/AWDr8f5QIIx
	Jz/OYXkT2MR12yEjQzd+i+DHpo0zSVJJDpsZ/4FptEHJZfx2mBbdw+NYrGyhSZQ=
X-Gm-Gg: ASbGncvkg8XOhF8OjuP6wcoZVzQsTOKUlkisiW1UdVh+PyAHw8h5RQcW7cxE4c2mQDa
	2inE4yENEhN0CSc0TuEH2da3TA8vVcNfTHm7+MBtlxV9e9zqj0hWdCqqP7L59i4+hnG78BVMHPP
	5HrWlHHs8/ZH8mo16iInCWCb/R5lIWK36b1Y/YmaGt5HGSWCZ6BzadnOIz4UHpseSp66sPc9dLk
	b6vz4/Y6Dd5VSDEg38bHVu1nRGWUd9fxYuV9uvwMgfwx1DS+gLaYVzmH8Q7tlb4h6yRV7x3o81q
	WsQqrgZjqjHYONTJLGXcDj69BQwV1ZQpMXj9aYN8dvDYLrWlDy9fNesHnQJE
X-Google-Smtp-Source: AGHT+IE3IjJeSMhwhYFQVkJODS8A0V92GzgNUXihhvb00RZvzc5AMKy+de2oOq6U0u17cQDNCmp+YA==
X-Received: by 2002:a5d:5391:0:b0:391:2886:d9bd with SMTP id ffacd0b85a97d-3912886dbaamr319116f8f.3.1741201553557;
        Wed, 05 Mar 2025 11:05:53 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47965e8sm21491662f8f.1.2025.03.05.11.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:05:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <20250301-exynos7870-v4-1-2925537f9b2a@disroot.org>
References: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
 <20250301-exynos7870-v4-1-2925537f9b2a@disroot.org>
Subject: Re: (subset) [PATCH v4 1/7] dt-bindings: soc: samsung: exynos-pmu:
 add exynos7870-pmu compatible
Message-Id: <174120155027.74217.562001377328469243.b4-ty@linaro.org>
Date: Wed, 05 Mar 2025 20:05:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_110556_756646_06D91027 
X-CRM114-Status: UNSURE (   7.60  )
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


On Sat, 01 Mar 2025 01:16:49 +0530, Kaustabh Chakraborty wrote:
> Document the compatible string for the Exynos7870 PMU. It's compatible
> with the Exynos7 PMU design. It handles syscon reboot, syscon reboot mode,
> as well as other system control registers (i.e registers for the USB PHY).
> 
> 

Applied, thanks!

[1/7] dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compatible
      https://git.kernel.org/krzk/linux/c/bf869ecfb8d3d0fef07ed2752df93c977cc257b6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


