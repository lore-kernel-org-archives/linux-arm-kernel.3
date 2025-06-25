Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1108C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QvC8vYW+AfbB/VDXT7aW0XL4OlqMpYtfCw/7F5yAwA=; b=arsN40yvTgTsBElYPM9cno9pP8
	5Mj0C6+WOFb9rYZFuNDVC1kL98ApCZ7yqMjC3uRaCLqW0FF6vdgb1QwxyFnxqVdgPwTxJC4D2Em3+
	YaR2+Nbi2uAv+AYUJzdLurF3NLp+hlJsbTh5CoyH67zwUp4A7QIePJsdn/eiFuEsqF+2+5hddUF1Q
	voqXU6hs5AJmnMfGmZgif505aSecwuMsCyeooA6XBjsw9dHR399DqzYT9tzhavDp6fZzi+rXGdSqC
	h3DxCRZ4IYlGvUN7YpZIzcCOj/eFcK0+8VGVoaV73nm1YjumAuAfFpdfuF8TN/lWjSTCSbHf6G121
	owtS6FIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUrn-00000009ZMG-3nFB;
	Wed, 25 Jun 2025 18:29:03 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUR0R-00000008whD-2U0S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 14:21:45 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-606a269d440so1436401a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 07:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750861301; x=1751466101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QvC8vYW+AfbB/VDXT7aW0XL4OlqMpYtfCw/7F5yAwA=;
        b=Cljgw842qVdU6C+T/D/kiWHx2tAfghyzWNYTOC4jSZIgnfq9LbhqksHt0XxTZZnPbu
         71I1dEH8epO2lBJmBM5Us1RG2bsYncXUV9bTPp73eI4itD3Y1kZZmXyCRxp7uxQ7+VYg
         lTRDvkiRU6+wG/QL4+nDDl7fHuMZ4Ws03smns8rts73Cy3WNshnWHxCwulUb6HOEG2DX
         Sz8K+ar5IzI4xyCuM5GtlWXHgccS3RejClEHJVb+l3AhCGF1TPenIIZ7dhov/U3n5Qg/
         nre2UyK16vr2KhVgmzEttr0BYsFngB6IJiSFwq5J3zq0z6wIARVn2jqnKYC1NlQlsALI
         0N6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861301; x=1751466101;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QvC8vYW+AfbB/VDXT7aW0XL4OlqMpYtfCw/7F5yAwA=;
        b=N2HL8nD83hf4A5AZw3iQ7G5nAmHuDMYLhsoagkawYQ2zWl8wkjE+syqllRtRSV6/Zh
         pj6Vv91joBW6j7MR+KZRJeuQp6gUnCTU4DCIyPnJusahPbAMCwdT3i59B2iLu40nHgkB
         ElOT97TrvmhOH+Y6VrT5lSlLOTygBlrStHgtjZhSUnp0yTezOQPUg70PyTYfa+mTf0Z3
         velzVVGVC96DdMMqlwbg0RICMybbpOx18PqCkUeyfzYU+5/gYbmq8nMV95FL6ZL8xhw2
         AUYve+skJ8piV21PMhg7/wAnGSfKiLChXtNIAYsvdpqIWdmTqhkbqfYSS5wxos6A0m2q
         Is/w==
X-Gm-Message-State: AOJu0Yxc6JYJuARUlir3tAg3oqfJet8xBOC4rM+l+1wV+0k00sGEVvX0
	STjMlUt2JKHDo5ahoflytJRln5wDkST7zWNLMAnDXFedSPjWzWMtYthN5WpwcHxf5Vo=
X-Gm-Gg: ASbGnctyIgVRusL/tj+KkXj3CZLhjsRO3o1hKbVm/wu0sH5tLtUbbns3vIZ0ZCiac/x
	MoIPhqDCTlOLz6xuJRK5WXSmGCS6k71P2jFH7U19l9BZmbFHVfOFfVMOpvO+qmDsEA6IldVLZlL
	aAFCCpblcm+am9GcDeyAkaP+uOegL9tbvY2bqTrvx02jPYlpkHtMjeGmgN6whI61zh79mfp8rkM
	QocBx0Ib9ZADA2v6w0WzgdMDtnJvnt/I9Rg/Z9SFMtp1UqbcpnDHnSYuomr69ZduZINnKN+BZMi
	GiuXdQzmHkOCvSBJb2mkAqOOjgrOalrjItolwmkEeD1LtdnU8SgwrJuWrX+/gTwOwgXgTQcmpl7
	npcQxhvWGhq+7kZAU
X-Google-Smtp-Source: AGHT+IFYm10YxIFhCnCipzjlfWjOLtuMr1BPt2912OnJxUKbMSfRM1bD7rOZCEZPooC75oZ3Fx2Jaw==
X-Received: by 2002:a05:6402:4003:b0:608:c773:8b3 with SMTP id 4fb4d7f45d1cf-60c4dde8f1cmr950949a12.7.1750861301433;
        Wed, 25 Jun 2025 07:21:41 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f1ae8cbsm2584006a12.21.2025.06.25.07.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:21:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>
In-Reply-To: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
References: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
Subject: Re: [PATCH 0/2] Add support for programming gs101 EINT_WAKEUP_MASK
 registers
Message-Id: <175086130008.117696.12548441312202680982.b4-ty@linaro.org>
Date: Wed, 25 Jun 2025 16:21:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_072143_639661_F60F0832 
X-CRM114-Status: GOOD (  10.35  )
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


On Thu, 19 Jun 2025 12:18:14 +0100, Peter Griffin wrote:
> The following series adds support for programming the gs101
> EINT_WAKEUP_MASK registers for the 67 external wakeup interrupts on gpa0 to
> gpa11 (alive and far_alive). gs101 differs to previous SoCs in that it has
> 3 EINT_WAKEUP_MASK registers
> 
> EINT_WAKEUP_MASK  0x3A80 EINT[31:0]
> EINT_WAKEUP_MASK2 0x3A84 EINT[63:32]
> EINT_WAKEUP_MASK3 0x3A88 EINT[66:64]
> 
> [...]

Applied, thanks!

[1/2] pinctrl: samsung: rename exynosautov920_retention_data to no_retention_data
      https://git.kernel.org/pinctrl/samsung/c/c8edb80494407f65a253ea63ffbae3fb831f397a
[2/2] pinctrl: samsung: add support for gs101 wakeup mask programming
      https://git.kernel.org/pinctrl/samsung/c/2642f55d44ce563f227dd9c620eda0dec8d882be

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


