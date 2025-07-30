Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECA4C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 18:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6r4c8nkwybj2LXJUlPp2AEc+KFr7lzVJbq1YiFmFnQ=; b=ueMIrVk544zeDXk6IOMXgplx7E
	oMJT+bRug8B8RRl8ywmEAvW3mekbCYh/rzWrx7tQYvhb49kxyGmposdZr1bXnaZiSlZ8/pNsjyhVg
	RZNVQMVgLEy3FEmeOBZcawlzgm/Yiswm2AIXlDTdA20/jyfICdbXOWDvzhL2opxmu8SZjpg+rtyTp
	1gsUeEzND7AseMd5PEeef8z0XEz9YdL9gH/Bjf9Eq1iXs35Y7SD3nzGyDwFsKrGwacLuk3Hdp4ffz
	SBnQn9jP1mhQD36+wKzBDNA81Zdr7LxBjlaU9jDqf1FJ7GZqZoCa48ykKqRW9BbO0agI1ROvcKfqI
	yvCDgmmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhBZI-00000002Co0-2Oqh;
	Wed, 30 Jul 2025 18:30:24 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhBWp-00000002CTh-2BzV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 18:27:52 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6156c3301ccso1512a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 11:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753900069; x=1754504869; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6r4c8nkwybj2LXJUlPp2AEc+KFr7lzVJbq1YiFmFnQ=;
        b=eO57v5DLJDZtyWLbF2agQtrGv9NlvRYFKj0JOUDINGg/IkEWkHVAyfh1KQdqvv9EU7
         wne5PhDvP9ChRfT0hlnVbARNRn9FzUrJgnZCoZU/Xv96cqGbSLX/W8cShZ2jkdNt2sBO
         +v163mBtQqsuFraofAYbY4nF8X+fmlTQZOMak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753900069; x=1754504869;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6r4c8nkwybj2LXJUlPp2AEc+KFr7lzVJbq1YiFmFnQ=;
        b=OPtd7gkCUhXloWfRoqyq2cmL9CQQsXQigTqiJpFl8wNx1TTdO+5AzqfB2J49765mpW
         PAqoz4AhvRIMWlst9BQZdwmHs0a5NjxqE2NH/KrbWpqTZZ6I8tX1oFzu7QOvjlT1TX//
         ZvQ6EVcHKv7iGGji93Bv+aUWOcYjedr7/eJAoowkTrDsFkDCV7ApiPnp209aDpPmOAUk
         DMtZNC9uw7msyy03Bo8DspIx+yPjS8ISiU+1W9pFfU2zj36PhZv61JrMoiIBCHqWqPlk
         PiVUP3N3IwnuvTjazYi8WEa2bppKoHM8rfR0Ll3f/9GPa3lY8n3CRb3Qlrk7rO5C7FvQ
         71Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVkF/iiE4kdhcZop8hDGNvMNz54dV40zmiMOyLZlF+Ckiad6ok5LMI0NMHyNiIOf6v5wJmGnf4eLiUPZhIus+Vm@lists.infradead.org
X-Gm-Message-State: AOJu0YxztWaX56V2yVr/Xav82l4BoyStOtAMaocWWsNVqG/j3xcKEF6q
	OCc8zBUih0X7H0xwJ5xDq6cgv9S0PpsxFgD9+PqTH7aQJMiiAlVpYnud+BL5AtdAr2w03NguMkK
	mVgXHRAhc5HUMF3IOFxsti8+OHT+UX1eCOEV8urgs
X-Gm-Gg: ASbGncvGYYPyg6OAKBQDQpw17G9czr9UpKRBk8ztd/WDsJuurxGmbMGiywaykEvQlJY
	pLGeqlj3vvM+qy42XjysTYsJ6dZZPQ6aIhWL99y5ci0nyFmyt1FLtPzRZxX6HkN6Lt+vRbPU5oj
	lpojZG9sx5RqrjP8UKzRV7eHPxucCxH6qa4eRlsT2YML0+kIhyojesa61U1vDB481cPX8RkMXdU
	TkHMA6slU3CE7R5KQ==
X-Google-Smtp-Source: AGHT+IH3UPStIjtEwhYQSCAV6DutX/5ZbdtIndLiNMPcdjaVtjZJm+vQdKhY+hsQZbuxeOMWz/367Av3WxhmS8SMryo=
X-Received: by 2002:a05:6402:2883:b0:60e:2e88:13b4 with SMTP id
 4fb4d7f45d1cf-615a62ab546mr9757a12.3.1753900068649; Wed, 30 Jul 2025 11:27:48
 -0700 (PDT)
MIME-Version: 1.0
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com> <20250728-ddrperfm-upstream-v5-5-03f1be8ad396@foss.st.com>
In-Reply-To: <20250728-ddrperfm-upstream-v5-5-03f1be8ad396@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 30 Jul 2025 11:27:36 -0700
X-Gm-Features: Ac12FXxlAvE9QxWzw-TPizj7qPTosxk0R2iemsaWz7FP_QlsARKGUQ4HcK2OYu8
Message-ID: <CAODwPW-FjCtPGYkNYozo0ybEjz_rVOeDqkvEPiCmQ6M2in0OeQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/20] dt-bindings: memory: factorise LPDDR props into
 SDRAM props
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
X-CRM114-CacheID: sfid-20250730_112751_579944_5D11AE23 
X-CRM114-Status: GOOD (  14.47  )
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

> +      Compatible strings can be either explicit vendor names and part numbers
> +      (e.g. elpida,ECB240ABACN), or generated strings of the form
> +      lpddrX,YY,ZZZZ or ddrX-YYYY,AAAA...,ZZZZ where X, Y, A and Z are in lower

If the revision ID is only one byte for DDR, there should be only two Zs.

> +      case hexadecimal with leading zeroes.

AAAA is not hexadecimal, it's a verbatim ASCII string (at least that's
how I would define it, for readability).

> +      For LPDDR and DDR SDRAM, X is the SDRAM version (2, 3, 4, etc.).
> +      For LPDDR SDRAM:
> +        - YY is the manufacturer ID (from MR5), 1 byte
> +        - ZZZZ is the revision ID (from MR6 and MR7), 2 bytes
> +      For DDR4 SDRAM with SPD, according to JEDEC SPD4.1.2.L-6 :
> +        - YYYY is the manufacturer ID, 2 bytes, from bytes 320 and 321
> +        - AAAA... is the part number, 20 bytes, from bytes 329 to 348

This should clarify that it is excluding trailing spaces (so only the
significant part of those 20 bytes, since they're supposed to be
padded with spaces at the end).

> +        - Z is the revision ID, 1 byte, from byte 349
> +      The former form is useful when the SDRAM vendor and part number are
> +      known, such as when the SDRAM is soldered on the board.

This inversion of the statement is a bit odd? I think it's more
important to explain why we need the latter form (or just explain
both).

> +      SDRAM revision ID:
> +        - LPDDR SDRAM, decoded from Mode Register 6 and 7, always 2 bytes.
> +        - DDR4 SDRAM, decoded from the SPD from byte 349 according to
> +          JEDEC SPD4.1.2.L-6.

nit: Add "always one byte" for clarity and consistency with the LPDDR
equivalent.

