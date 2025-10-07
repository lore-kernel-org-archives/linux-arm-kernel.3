Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43CACCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 20:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOJGm4xHo9yLpjNqGa0Z0pDqyLUjWX3aXbAIUsOlMvA=; b=2B+6nHLAdaiLXiVwBo7L2ck9PT
	Yafx7KOJ2mW/lfn5UCCC1IawPr+7tdTQ30j8cYS+AY9E/n6r0AXZkyCRBt3hUjMN/eJyIYd0qUC28
	Z/iNEJ5SOxWGbixjG6kCn9ONpWsniKamlhdTkPjRrkrqH2UpQf+z9RPUfvqKJuwS6gzAsHPv/Uizj
	uNlKZTllBfnU1cEgU5MPQop0ffsE1mfAVN+poSxVC5bMM3k/FpDoVn77WCK/R9zc2+wwfFdLxUXBz
	z19kCC41nY7sCYYrUQnut5LlEp+3kKrVxxHupXLvLgPo6LI6cdlc4oWD7sUOX3k1YRVPwNWL+q5lE
	8HEgf1cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6EAK-00000002jwx-1wzV;
	Tue, 07 Oct 2025 20:20:08 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6EAI-00000002jwF-130x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 20:20:07 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-43f50c2765dso3666271b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 13:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759868405; x=1760473205; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOJGm4xHo9yLpjNqGa0Z0pDqyLUjWX3aXbAIUsOlMvA=;
        b=YZ3tOdrLKy7TWeY1yAdC3TciW+pB+smc+lfk1EyC6EZgybdqVCgDkCoEJG++oIZ9cR
         b+w6WMc9Yy+VvjPrbj0Z436HB8uhJG/ts4PsR50xGbQbrMzoHHt9ZHCZc5QQt0jzij3L
         3Lcaj2bxbc81PPHAXrGWBo055mUr8jARjx0xfIn0MXUn7e16f/Av1C9XTk/xZCSQsEJv
         M1tUBRX3+wkEW8Iv7hx2UElvhJmdxsmOIGNP+pC2HXuTFx9Pa+DlojSUYC9TVPuUMPG5
         Rf+Qxsi9jXaDlLkYaWkLFM/V1COirWztNg/b+ctMIj05jXdUyHKzPYvfZxmHFNw8IFlk
         zIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759868405; x=1760473205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOJGm4xHo9yLpjNqGa0Z0pDqyLUjWX3aXbAIUsOlMvA=;
        b=WuF1IMnGU9OAudhkkMtgInROc/7rXeHkE5NvwdJWei/hbzwNYW5lTpHwaOm6co69DY
         oRM14XtKmVMMxUrWcXZnD75F2e0NexR3KUA8WzH/30ke2VuoM4SnIjza9oOlypgtxNk+
         H64vuEzto/9U7cwZrKYGwhKbnzJTzMEs6uUTq41lgjcL+Wku/48Gf3P/ZPRUJW+sZKnP
         8rJ9eG/6oikH5eI8TQg9gfBXYM/3yrbCHCtx16XjP+31QFxGEupCy4kR/Etq/X6R2jyD
         jkUCLRddU1Fcy0WqE8+LDFZ6a6A2lnhJfKoslNittWf1tp8v75oditFrU4gN3PfKsgq2
         seGg==
X-Forwarded-Encrypted: i=1; AJvYcCXWARQwTgtcrvYphc1Iqo0bPvvmZACnWj5S0zfcv7f65VZ9qoLyn03gP+hBRsDnEL2GAbP67NiDcCqx7yyw3TAS@lists.infradead.org
X-Gm-Message-State: AOJu0YzcbZM3VNYc/vCghiB0J+PwCVOCR4m/3TSVtAfPorOv00vfe0S+
	5gKdlt7xD9ITWKQnOqBdszZiU3xxcfVYF4vxvX1NR7odq5A+Y1P6DoPZfddQlcHPBPuM1fClgvV
	bzhE30Ya3D6wDoTO+IUokdVilokri+4KKWcH3xi4Uig==
X-Gm-Gg: ASbGncvN/+Q/qAgyibOQLLcbbwJ2gxl8zldyd7sCnJDjbXWnX+c92Cz5OWAI6BR4T4v
	OX+zPsdGByI4NBVXa642Z49B3YPQyoGAEKlWgJ7LuhkGPvFoozwJ3+1fc9qQD1i1QKPT65lff/L
	cNqZFYBbXxeo4UA9xg6cnuXLgAh1kH7iyZQSG3+TM2OKQC1c7NCVN2rBLJg26JdvEncwHgVcPMf
	fukT+5ED7mcBYptl7ViJ/sZ8+kG22wFhZGw43o9wa3G71uW
X-Google-Smtp-Source: AGHT+IEHI8U1dVlqnhrsS6fP0FmSa3idf/Em/3CBdgaLIh3/qrBErYExCYpSsQBQQgzXfSMxAukwo27BHqZsQjbeUds=
X-Received: by 2002:a05:6808:18a7:b0:43f:5b28:f0a6 with SMTP id
 5614622812f47-4417b2c48f6mr450890b6e.1.1759868405185; Tue, 07 Oct 2025
 13:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <20251007-power-domains-dt-bindings-usb-samsung-exynos-dwc3-v1-1-b63bacad2b42@linaro.org>
In-Reply-To: <20251007-power-domains-dt-bindings-usb-samsung-exynos-dwc3-v1-1-b63bacad2b42@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 7 Oct 2025 21:19:54 +0100
X-Gm-Features: AS18NWB4avL22wQ3_NUeMTQbUpbAXczc7-BwaaCDEfZe2LaYa7fnIVbjvyZG6LA
Message-ID: <CADrjBPqeucFJw5kH7YKK=PEOOYFJkQbmZ_CORu62FoFwqySsTg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: samsung,exynos-dwc3: add power-domains
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_132006_296702_35626965 
X-CRM114-Status: GOOD (  10.47  )
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

On Tue, 7 Oct 2025 at 16:55, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> The DWC3 can be part of a power domain, so we need to allow the
> relevant property 'power-domains'.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

