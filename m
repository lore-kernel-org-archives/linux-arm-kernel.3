Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44213C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 07:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v19hfaaGbXr2BhC980RfNTWymFHwvdpU89uVG63T0wg=; b=m0rFqvDklpyBqyFGXb9dL5JU9D
	AcLKc6vfBy69cidYTANIWWU+t+rR5njk9X+2iPmXjFc7wdtaZKuuuP5oNLRt+n3JBdsayw1rJQpAo
	WYLOVJeydowEaXQXzyMvuwyiNcWiszeUrkLU6AZ9FTjiDwzvFxLzPoyfq+xSUEuufIkw2C5eCoxna
	ZFnmQWhXYwNrnzWpb+yeEyrzguAp8vNhKcKVPar2dKhj28hTHGJfcHv8/5CxG7/8G0xdDudisJumt
	Oxr6Fm62195IiWeYYt3dB3tzuQ7u+4TCg/mCI3kOTqFqdB66fT/ZqLIbMHNoNKUS3ITO9GyLVhI0Y
	8wiYE4CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyDk-0000000B0PM-45OG;
	Wed, 15 Jan 2025 07:53:48 +0000
Received: from mail-vs1-f43.google.com ([209.85.217.43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyBq-0000000B0Cz-46B5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 07:51:52 +0000
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4aff78a39e1so2099943137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 23:51:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736927509; x=1737532309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v19hfaaGbXr2BhC980RfNTWymFHwvdpU89uVG63T0wg=;
        b=OlRcnDie5niKBK5MSFL8EMbfqkkGe8eS8uOc9BxnYHvM5zvQJcIWxBRZfao+78Iopb
         qO2k1W+ngjo+NbEMtX48t8cf9zIzsJmD2j5xFxpaXnqwJ25ETbMTVa1ZGwCAxCuQJ3AY
         MmHDy/qSRY1YLXg/ZmhaThJBzzKGLE1dAdnHFzO+e2qrvjAwbiyw57NINUThhXU+kQzK
         1ZEzZv71jJqMPzZ5vxpl+e3MrcQM9cqi8g44ihsBVV1c05IE6C21sqOJnc9BlEGDhGTP
         pvuclVK1xQiixFjl73NePp/nMuQpF0rDXmpJBFP9idXLTFRNDSlDZ6Y6Bj6Yr+mMrKqQ
         RlFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN9jxL/PaAsLtNb9INfrrET8x2UwXjytUvhwfzDEw+89l+2p0CaPZzNbtB4m/qyOicKYdhrRzhCysXnjFUvhaX@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo8qoICwW/M5xDYqcZ0hNE6IiuLSpJsJNWr1lganRJVcetYWEe
	WgIUDwrAgq/uYoX0bhSPD++58M7eFfXbCuKErdyfYD3BGlaeUiQngQ+r1qi5
X-Gm-Gg: ASbGncvlfC0bVW2VBpWxz6FrOLel90ams/miupSzanSeks+HO2i4cGau47neOTRWIPc
	T73tPMF7tF7n9UqbOm0GyjMjRKv0vh6eUCoNOvZl9n3wWTljuHAWfo0vyp4E036+SGvRYR4j/K6
	e+ExXg43uD2SM5W9CTTQFMtn6WG+zPbmFOcJpwkCZNnWx/csu0Xj9+tErthzQOchj2kNttHtN3i
	97S97iK+xkNXegHdP4VswfTLHfGN05wWfQAdbmQvDLKka1cuAj4OK/JYfo+Eezze97JxofV1jB5
	cwmvAsEd2BhX+nORpc4KTrY=
X-Google-Smtp-Source: AGHT+IGD1575O3jXWjexXlE6ilDGTTF1gtznNrtPtWvDXoGK9SttqYfz/dqwo6LSRpRsmrq6EbKYxQ==
X-Received: by 2002:a05:6102:3910:b0:4b1:1abe:6131 with SMTP id ada2fe7eead31-4b3d1069d3cmr25218774137.25.1736927509315;
        Tue, 14 Jan 2025 23:51:49 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-862313620desm5670744241.9.2025.01.14.23.51.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 23:51:48 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-51cccafb073so682661e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 23:51:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWDgmB/11Dh5+ns83T9BCVn9cwQJ3njw5aKa663GkldgQeyA+SWr6xWe3Vgak9Lx3UwHgJS1OHCQNk2n2wPzI9O@lists.infradead.org
X-Received: by 2002:a05:6102:370f:b0:4b2:5d10:29db with SMTP id
 ada2fe7eead31-4b3d0f91911mr23485805137.7.1736927508552; Tue, 14 Jan 2025
 23:51:48 -0800 (PST)
MIME-Version: 1.0
References: <20250114203547.1013010-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250114203547.1013010-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jan 2025 08:51:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJ57mATWW4AnBedn+D7TQ4PadkJ642daquFtAo=wZFrQ@mail.gmail.com>
X-Gm-Features: AbW1kvbcwUXYFrN99m6XF1ITw2HmayWy5F5ubOu4slBH-XfFluPqW85u6cmBtL8
Message-ID: <CAMuHMdXJ57mATWW4AnBedn+D7TQ4PadkJ642daquFtAo=wZFrQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: Use str_enable_disable-like helpers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Walker Chen <walker.chen@starfivetech.com>, 
	Changhuang Liang <changhuang.liang@starfivetech.com>, linux-renesas-soc@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_235151_016332_47233F42 
X-CRM114-Status: GOOD (  17.38  )
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

On Tue, Jan 14, 2025 at 9:36=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

