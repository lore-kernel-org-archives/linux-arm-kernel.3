Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322EAC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 22:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwvuUXqMXjlcbclmWLcZY6jJ7xmd1w9ykxymttXedcE=; b=HqxOVOt0zZRPHsRnHG+T6wFttx
	4t14CwnGEKRPIlshR22Mzau1XXbCuBYKRO+i2x2rBG4Fy7QWi8lIzbv5tAISPk0Wx56HZglF78YKy
	EZ8fuVCfiINUtNkSHMC5vYUqfUbamk8X9TLWEpY47Y0rl4YFWbTljmTv3gFVXhG9kIZtl84uk7/V0
	tCsZznJmUKSqWEidFSpyphw9SXm/iX79JMSImXLW4IC29+lQ5B+7DuaE7vYSQ3vx8RBuhELrrVJTL
	SMOX1w/h2SYGDgzoSX+CtEnPOP/2AZA41E1XrcglQm/eeDuFC97iZhaVCWAMArmYAYQPUnr5K9EVx
	j7/aKJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueL26-00000003Ypc-1IDh;
	Tue, 22 Jul 2025 22:00:22 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueKzZ-00000003YGE-0dHu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 21:57:46 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-609b169834cso4709a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 14:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753221463; x=1753826263; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cwvuUXqMXjlcbclmWLcZY6jJ7xmd1w9ykxymttXedcE=;
        b=aBiUYXoZsCCYjSa8ANgtrU+xbA28pLncEwN8MVc4cPz67pJn33SkpzhRDXfwhme6RW
         jmJclWBSLx+TshX5Vo1jfxgdOmAoqn2DqB48DenGFTZ58RShkgKF3xtuNkl9mPOTNNhV
         Ei8TQEljCKfwuFjTOocNe99BNlT0HUJ3ou41s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753221463; x=1753826263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cwvuUXqMXjlcbclmWLcZY6jJ7xmd1w9ykxymttXedcE=;
        b=fq9xQ1/nHIwCq/ARdE0Sg2XtOnHvjg0D24fRodEiH3bfdjEV/UMg/Ren6ODWdJidxo
         8B/Ph19fFxzGwjfZ1AEzwp7Vvlfq49opCkzaIVF8HY4/07OBv7oskYrGH2ZbjGsAc+T9
         AmEzZMh9hzHJIhvAa4kBMtUQtLUISO4hMLEpe/76qgEbLC3nldNgYs32ZIKV7HyWB/KI
         nRidSGC4uvN1uCWYbo4LA1VjT4kSumwLSOk1eeInkfokrW5qRFmfgLUNcP0a80Y6HzM8
         VVYcTjFPYyJkY5HrppXREpfyZGgnqXjEIwqghYVx31OC1J8ml5d0jKxQ+ghsQppiFF0u
         Hf8A==
X-Forwarded-Encrypted: i=1; AJvYcCVf5UyhGBndKe1d/5BWWJEk6qf/RQVsvbbDAmtYmU7MLRzjOQs1fzSQRL+8dmVwMz4wXbAWlSmmverPD4Cien0D@lists.infradead.org
X-Gm-Message-State: AOJu0YxXCLrRxCXVZ+1oMnMYiQw9C7OmtRJWeehVM+tEUjCfFFVdq7mQ
	0oH58yCVu4PRxcNqip9vqKHEaktPyvEigAXuqFVvxJzeWjAQ/aUjSmbrnHyJJFSVtggVSOZfWAC
	7OU9HJie0wH4ZTJc3V1cKXCcilLfoBcXMn1HJKzcY
X-Gm-Gg: ASbGncudJDKVo7BDQs7DCDe1Z/pcRX7CelyleAICRkCRL+2rt1TEhJG9C8jHWsgStz4
	AmpdAwKreSGVHBmIdr7lc4J2pL7OFPxp0K/+HIhdMf9x6/+mEcoRw1owQv4zMjxSeVG3JVv7G2e
	OauLymGzLA9AcOHpGui3v4tg9GHnCdFyyg2tRkIIDNwz+zUL7N9GXmN39DwKux5n7gmTtr6dYta
	1FbatZLUuhV009VMtC6cWXPEgSukSknlNwuD5Zmcl7e
X-Google-Smtp-Source: AGHT+IHkklfoV2jGZf2D1jPpYNy6n0EzpENuUlCVLYxgOK9YU79IkYyUGg7ZPnpy5rOLdzOyNuNgg4SRmVW6s9CMDc0=
X-Received: by 2002:a50:aa87:0:b0:609:99a7:efdb with SMTP id
 4fb4d7f45d1cf-6149a3beea3mr33693a12.2.1753221462404; Tue, 22 Jul 2025
 14:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com> <20250722-ddrperfm-upstream-v3-5-7b7a4f3dc8a0@foss.st.com>
In-Reply-To: <20250722-ddrperfm-upstream-v3-5-7b7a4f3dc8a0@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 22 Jul 2025 14:57:28 -0700
X-Gm-Features: Ac12FXxqqdXiBOsL8hY8DFhm2tyZoxR-txMizljLW540w1cjvBjPCidmbvKnAZQ
Message-ID: <CAODwPW_fDPY78bmwvLmLkt1yWpVdG=VC8h2NSdWtoiEknajhNw@mail.gmail.com>
Subject: Re: [PATCH v3 05/19] dt-bindings: memory: factorise LPDDR props into
 memory props
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Gatien Chevallier <gatien.chevallier@foss.st.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Le Goffic <legoffic.clement@gmail.com>, 
	Julius Werner <jwerner@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_145745_219796_21926247 
X-CRM114-Status: GOOD (  12.91  )
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

>        Compatible strings can be either explicit vendor names and part numbers
>        (e.g. elpida,ECB240ABACN), or generated strings of the form
>        lpddrX-YY,ZZZZ where X is the LPDDR version, YY is the manufacturer ID

When you say "in case of LPDDR" below, you should also change this
line to take other cases into account. Maybe the best way to write
this would be something like:

...or generated strings of a memory type dependent form. For LPDDR
types, that form is lpddrX-YY,ZZZZ where X is [...same text...]. For
DDR types, that form is ddrX-YY,ZZZZZ... where X is [...new definition
for DDR types, based on what's available in SPD...].

>    revision-id:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>      description:
> -      Revision IDs read from Mode Register 6 and 7. One byte per uint32 cell (i.e. <MR6 MR7>).
> +      Revision IDs read from Mode Register 6 and 7 in case of LPDDR.
> +      One byte per uint32 cell (i.e. <MR6 MR7>).

If this doesn't exist for DDR, then rather than "in case of LPDDR"
this should probably say something like "LPDDR only"?

>    density:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> -      Density in megabits of SDRAM chip. Decoded from Mode Register 8.
> +      Density in megabits of SDRAM chip. Decoded from Mode Register 8 in case of
> +      LPDDR.

Can you list here where in SPD density and I/O width are stored for
the various DDR types?

