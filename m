Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176AFC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 08:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLEWsOGdQhM0Zjsf3h6/8bfBGD6fRYml+UveW8GvJwE=; b=bQX8Hps/srNLSW+UK5R3pyLsa2
	EDSVw/6qE0q+EnNf3kp9z1D9iQAJCa6HeGgwBE3Z1ezeqySq14gMb5XITNdtD6rekvQtLWTMpTEQZ
	0BxDlHwDXoLeULuYKgLlHgKhj5eiD0omjlG6OZcm7tj30iuZVGJBbuP4+x/ALX0hH1A67z2MWd6WG
	KQAfKVqsjt5zP+HY+v0tr9jtpwfILu5HXGiQq5QEp0tUTSZA7vCSF/v1WS+eDKPuNz7jQHHo8yJQA
	L/JX+9lcoOngYfs2GOVaTYPKvDW4rhCLxo+mp+QfJSHfPpb7iCa/vInbBsbqli0ts4IOceMhmdilw
	wq9XrjEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bZt-00000004yXn-22Eo;
	Tue, 15 Apr 2025 08:23:33 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bMh-00000004wFD-2MTn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 08:09:57 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-54af20849bbso6554685e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 01:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744704594; x=1745309394; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLEWsOGdQhM0Zjsf3h6/8bfBGD6fRYml+UveW8GvJwE=;
        b=v2WiGbVeNVLqZt/OpsTOQGKwjCgGV5by1FZH1aDsVUK88qr0tNalL9lBkC+v1M5MV0
         C/uAQAd9QgVhdxl2S4K7YmFh2VUa5nkMNhcNJ/n843U3dA9GXqviBSioASJV7YrQxC8Y
         mK/WGtj+vyzr+O7j4/mcP1p+O7L5sS4zALSHq2y3+x+prmYXAlwbz6H1UioJ/3z9owgw
         +/hn332X3p+90y7CHQbVA5imzcNGE6ZtPdQ/YEuvpSJG8cls7KTMx7etzzKXTqlEYBEX
         lC+uBkmr2GcSO6fYRr5IHZ1zOfGf5+++JAjM99I25HaQ8cGgPNRuhpc1ec5kUS7QIulm
         0r4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744704594; x=1745309394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLEWsOGdQhM0Zjsf3h6/8bfBGD6fRYml+UveW8GvJwE=;
        b=sLIduk0xU8+7/Kt0Cz/HRyZbim+xGZsMoWFsqTxu33rNFhmFwMCBVWmaFimCdVxQV1
         aOmy7t1eRiCmYTgyZVHNCf8jtihZAttPKQlp/ZKuGvsS0OW0CqerD0oLerDyzuc0UcLh
         qAS0c0njtHBpCBxChu5FBCTLevtJvwxLHyM//YD0VdpZ3O+0k0MDTkBJSFjJdAYg+4yL
         ZfIU4xmfcg0ODy6DypKQ2UQfSvynhYM3Gjm0RpRdAoV0yJk2/plOn4YTL4btkex+BpBg
         VJaqX8MmuE6Mg7RsNVH6k8jk+cwAGEuqR/lP4FnpbtLo1/ebeiN0t1ZXVAsPxuNbxLbz
         dv7g==
X-Forwarded-Encrypted: i=1; AJvYcCVhaJ1cH4NTGclsBebGzW6XjLveuVisB9pr1F22c4WU0JTCcbucYa2O6jT0AhdtbD0Nu1sWuMFhNSVjDtmeQPKR@lists.infradead.org
X-Gm-Message-State: AOJu0YwXPd0Ba2trJ3aLArB4or2UuJ+rJ8L9v5IudFs8mxNzVqF9ohGW
	wDsZzqCF2DEmniOwP3rW8BWT2rmvbqX3gS9Kr8yS5xC8CMcFGs3qKAInLDh/2UkDNkTr4uxLbYn
	9AnRrXvooXuEfK17YdzCsiP2Yet+aMsX/+Qj4fQ==
X-Gm-Gg: ASbGnctOV7AIhFyfRvghXhgmC+dAZLyX/5VAuSF9jmuGsHq0RwPjMiotW5yfUqgs6sr
	O3mGv2ugEbBuSF5eRrSYwQbt9ekMDVk/pODMDBR/+8kqCG6MvpeRbrwNzV7Dk8D2PMgJkut/O2t
	Par3BFXnCGuuXWm+2JkRjS7A==
X-Google-Smtp-Source: AGHT+IEMlMqsPAGJBzvZT2lPJQosRhpvoETScw1sCKukc31T9fTkGic2VsMp5FRUxyJuWIZeSw3pyLssyZGpIRA+vOE=
X-Received: by 2002:a2e:ad07:0:b0:30b:a187:44ad with SMTP id
 38308e7fff4ca-31049a80842mr52529351fa.26.1744704593653; Tue, 15 Apr 2025
 01:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org> <20250404115719.309999-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250404115719.309999-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:09:42 +0200
X-Gm-Features: ATxdqUEiPhEWajxjZ0u616Ca2IYOkRClv6g0V-9rh2iDXiM0Iv0_Uzdx0X_IW4c
Message-ID: <CACRpkdYJNLwKFyzjzOeuZofBzoHci39UH-0H5cEM=97koyW1FQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: uniphier: Do not enable by default during
 compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_010955_623128_6DB6170B 
X-CRM114-Status: UNSURE (   8.79  )
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

On Fri, Apr 4, 2025 at 1:57=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Enabling the compile test should not cause automatic enabling of all
> drivers.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

No comments, but the patch makes perfect sense to me, so applied.

Yours,
Linus Walleij

