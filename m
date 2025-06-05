Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF83CC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 13:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5F4J5fsk2zo51ye5xZxurgvmXqAk6TLsSVJ4G+IBpes=; b=HiI1Spg/D7y0FwuZ1D+WLDKnOC
	dsKHUpRbhivwocW96RxflT2w/sNhOZYPgIG/DRC4bilo07KG8uXfBwdbksC9Yht1xJ6jYiBAa2nDz
	bmADAqD53tME9gmT3IVtThTkP8cL8JMBMbsyp64ZJ7wnEop4zQvnHfdY64ePJsgzHnymuGQCOoZuo
	IMPVQdx1NeP1YHrdHsjy3YkJvMl72TXfC6XnqM0rE6WvT2ethw/F/cNlzj77BXvCWH7WjMX5XeYU3
	9HD914i4eRNs+sDqx/89vHxJnpRjSWC+WQnfg3Dp1ZIZwXRUmjkh3bpGdH5X/qTPe4EuncrGrYLIZ
	eLficasw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAIM-0000000FYNV-3g1u;
	Thu, 05 Jun 2025 13:06:10 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNABC-0000000FXE6-0R9C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 12:58:47 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-55324587a53so2050715e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 05:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128324; x=1749733124; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5F4J5fsk2zo51ye5xZxurgvmXqAk6TLsSVJ4G+IBpes=;
        b=hyWvCtIu/iWssTKhF7wW7p4Nq7YPrPlaNWYetr9IkBL5KAQXmYYLeZwwDE0qUOMII+
         Pa0RLl9Z2fq72AxFRerpLv370GAfXunqgATnjpCCj/EHbJ5JorFdnSxVNeg6q6/N1wsf
         PogBYHIhxHlnli4DTGyjHBzhcxoBtHQf4d53x1nTV+jQqvZv9rFk5leh/t1gpj7pwXRz
         bqyuTdCzXUci7GiqyqJXvAaBxW2iIvMixbHgnZi6mvk4OoAYSP79TUO1oNOhXssYMhTd
         Nv2q4FXht47bHyBinJR8NJs3WKSaouxYTpHhbl4FJSXpEgH899mXboHG8mhudgKAEam8
         /s2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128324; x=1749733124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5F4J5fsk2zo51ye5xZxurgvmXqAk6TLsSVJ4G+IBpes=;
        b=g72iUvVmo3+XivXg0F0Q/EIujuYLwsOO7/jiiYLyo4yok9/Voq6v96jTXtVpOAYbnP
         zXffOS2MN1yc1nXRNeRZX3Gd7JcFU3d2mZYQXLYIs8YHv4UmVgDVifvfOYF0SG7OB7v9
         YQJ+Oe307F8ebeMUqhsW7/dARYpmK/OMbj1azVPGJbeIgZeZSnGGkhySSEaJ22R/sI2G
         p4UB+FYWoNDqOohM65kelcteFHSHx7EqqRcjBLN85jdcB0D0595MzXhLHIxjlKbgP2yr
         HbU/3/7vPiaAh8vczJ3QulLPSqdfl4zK6s2erJYUBsks75p+4qy0/iNY2WRQIhjZBicg
         ZYQw==
X-Forwarded-Encrypted: i=1; AJvYcCVoHg1hYBESOkYBax5KIb50kIqKkj8LBe6Ayo9AN3JtMz03u3938iuccqa9IMdwNpGL/Bphy/pnXDIIpQQ9148p@lists.infradead.org
X-Gm-Message-State: AOJu0Yzftq1Dxt4Z9dV77BK8jmSpMwc+BS/OmJs1HtrzumCmZ2hbaiQ0
	NWAjyWAFFx/kJGSVa4PweBaPENsOuGtTOKnwgdnEJZmQYogv0FYveUjQElaMtOPekzPp5vQqOMu
	u589yO8pgjaiE9MiU2Q9BpdQLIrWvwaH6gEb5Vhn0Ug==
X-Gm-Gg: ASbGnctRhvdmhYvk5vCvRgKkwIgUE0Nk9jWMn7XBQ1Z2zG6QhqaNWKM0yRD4Gekb/E9
	NVW3Cn1Q76R4vGigBZLFdtPj0IOl+9eVhieP7S30pPq/HD967M0bDYE9PPXMCDybHKf/EzZaVWW
	H4CahZ7t0OAZzpnAnL/S8MpVW7e4e32m60
X-Google-Smtp-Source: AGHT+IGlsLgaz+OzrX7gChqfwNLu6aN4e02li+U7R1p+y1C1vMiENS7zjDEUb53JJ0ECcJmO7Mh9wmCUqhcTsFjS6Gc=
X-Received: by 2002:a05:6512:234e:b0:553:2308:1ac5 with SMTP id
 2adb3069b0e04-5535d8f54e2mr916430e87.4.1749128324545; Thu, 05 Jun 2025
 05:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com> <20250523-hdp-upstream-v3-1-bd6ca199466a@foss.st.com>
In-Reply-To: <20250523-hdp-upstream-v3-1-bd6ca199466a@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 14:58:33 +0200
X-Gm-Features: AX0GCFvp2kYXQryODv4yaq3ufj5OHSvi6P7gagdyzXCjgZwqYR5kV58IYRzsLbE
Message-ID: <CACRpkdYz5BaoTfG+y84Y=HQUxdSberU3qnaWDmv2=Fk8zcbm1Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_055846_147220_56A8DB53 
X-CRM114-Status: GOOD (  11.51  )
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

On Fri, May 23, 2025 at 2:40=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clement.legoffic@foss.st.com> wrote:

> When using bgpio_init with a gpiochip acting as a GPO (output only), the
> gpiochip ops `direction_input` was set to `bgpio_simple_dir_in` by
> default but we have no input ability.
>
> Adding this flag allows to set a valid ops for the `direction_output`
> ops without setting a valid ops for `direction_input` by default.
>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>

That's a good solution.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

