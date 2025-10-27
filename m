Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FFDCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 22:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zc9UIv9/MZ8vS/A9E/+9Rzg7ZN5v4cfKPUZNZPqRWGI=; b=BFepUTjvz+Hy9zhzCqaAERBfkE
	tHsZwXKi7AUn6Aq3woa4oWzBSosBu+5pDlB0rsBdckA/nIO7djU3tBtXKHei0c6FuOM7dnX9dpwU9
	4yInA7KOI88CwByAJHT71WKb+W5v1xGy/yg6sVGPYDosUCSI1JUnE4KaaA5xyRlsWzdZhrumtAOH7
	WFy95RIF2DE04GXTotvh27vPhWYwVdCR+p3q9QsfYQ/9rUIDvRTcQeI2mTNHJaaRFCBQYmNXSi5Oa
	v+ZVGrEoFvNNAbqCN/nknTbJezUeqYDAZlcoEms/cndiaTn/MuzkwSOpL63jRVjNMCTiMuMOWBgQX
	Zer0vIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVVx-0000000Eql0-10s9;
	Mon, 27 Oct 2025 22:16:33 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVVu-0000000EqkD-37pM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 22:16:32 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-378cfd75fb0so55787661fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 15:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761603389; x=1762208189; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zc9UIv9/MZ8vS/A9E/+9Rzg7ZN5v4cfKPUZNZPqRWGI=;
        b=fhExeoWvDYCuhREvyfh3EHdSFU8+bSO+bB1lT0AiFm9/HobluD6JzaRlAildFUS1HR
         KtmMYdDIjEpf0oLeEnPKw7yYWXDbS1oy+mWJ+QzuRnVZFS70pp2FRBnxgWJ8myTrSmBI
         EFtBcYkgDvT27Z+hqvJ+9s/hNz5awDIWlrGYxU8BDRqThr+ok6PUW92OALDJXctM+jPe
         YTJ00j8SeaGMvtxIhO4KuKCrCfufpu1SPnB7QfJOmMZ63Fi6OSoxq5s7UtzXKt1nxhF1
         UzPcuGfaxZUUq2tR4bpn08fWi3xe6gyLCxYf49kGnRJv0NbEn5Y1JwU9twcL9UuhLySk
         XFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603389; x=1762208189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zc9UIv9/MZ8vS/A9E/+9Rzg7ZN5v4cfKPUZNZPqRWGI=;
        b=Dhi+p+vHjUqs87i/s5DQxcSyArF9NhACGr1MlAhkfNPklCVlFpF9N8fZBXdky5eTrr
         kxdLuCV3cPaMRzTb6TwCH0io+9tR1IqwS3IkU2PHGV8AOV/ZzBh5ULr5MhNLGsBaH/jM
         vev7oT3ATzoAuXFzU4twFG6erENwylvCyfOLrFL4e/44hdnVIMSbWJOXsmcWcIjA1de6
         UcVL0YhmG+3Y1uQLbHbvuHuOwYtCAObXzanJrP/p6/CqPo3JzWNC8uurnEGUBUWokjRw
         +dgJtSNCJqylEVwfXhR8aFufTqOUBOdLU6QvoGWd0xEbP4fHMg9/q2wpNQqMIrw2MOyR
         g+1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxu5C39WJShvenutH2OtjXMK1NV0AJYTOg3mlfcvcIX7H8OOcrvgqjmqTBIoa4V8AumVj98ERkPygwPqx30Kf4@lists.infradead.org
X-Gm-Message-State: AOJu0YyX/+AsOvwVJ9ljbc5uFzki6W0bAPze/9Zb9pGGX0LIX5LOHg7u
	jfqwZ1LDWI/kyss57ifAw8z8jTKmrN9bazri1YqwfSEcLRUUGplMlID/dND8Z97BoT4vZuOcTJW
	giAPKPCO6ZsiTVNd+VE/3Wp4x70tnWBY8d4/y8NwWVTytk9fOoC8ZD+E=
X-Gm-Gg: ASbGncsA+Q3xLmhhtjrUOCQfZhhgYpdV3NdrjQ8vJpoVX0YzxPfFE1DE7CMUx+qo2TR
	bjcYiucl+tulJVGxGax7UfiRGRcfpb4/MuMWlidFall1ZAkbFZekBjHL6110GFP05PCzSiJOyLS
	82JOeZb5qK4mF+qLTm8zcW2Z/7fRLMdDVVG+MCQ6A/GMz1ApxHLdLHPBASiIKJ46gyarBPAuI4n
	LFKmRqNrXeQ+wtL1VpJjRJXvQXXNrgNbY9le/8E6qZ0kBT4/DfA7uopLJNo
X-Google-Smtp-Source: AGHT+IFA8HV2G/sHhNwZvEShaiZsTM+MMwIFC3kj57n0Kcgm/A/zFAgZaU2xFGY5jATvp1YPW4KS9FCoawvfscRyh9U=
X-Received: by 2002:a05:651c:25d7:20b0:378:d690:5d96 with SMTP id
 38308e7fff4ca-379076a9b61mr3296741fa.8.1761603388859; Mon, 27 Oct 2025
 15:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com> <20251023132700.1199871-12-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-12-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:16:17 +0100
X-Gm-Features: AWmQ_bmBzMCqn0FgOeFfQ7QhGc6mfzGjYtXO83EFE5z1zNwN1wCq6PGHLCzury8
Message-ID: <CACRpkdY-e=KT+nOaVNaEB3nFkXTrZeJ7e47LLzD46xsfzm63sA@mail.gmail.com>
Subject: Re: [PATCH v4 11/12] dt-bindings: pinctrl: stm32: Support I/O
 synchronization parameters
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_151630_788669_F38F3231 
X-CRM114-Status: GOOD (  11.07  )
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

On Thu, Oct 23, 2025 at 3:27=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> Document the support of the I/O synchronization parameters:
> - skew-delay-input-ps;
> - skew-delay-output-ps;
> - st,io-sync.
>
> Forbid 'skew-delay-input-ps' and 'skew-delay-output-ps' to be both
> present on the same pin.
> Allow the new properties only with compatibles that support them.
> Add an example that uses the new properties.
>
> Co-developed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Patch applied!

Yours,
Linus Walleij

