Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32DACA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5l8fao5tyyCXjqpBW/epFwUkG6rVSrLdqtcUPVUunrE=; b=QYyMkDhomJ+AE14C4lLYr5jboW
	lowW4xP8y9XsR0kIyg37yEEViYY2en5B6T8/5IwZjTtezeHitcb/LPlsGocUwI7klSkauN1cyvmZa
	B222yfWqWuPsvacepjBVh/QFfXxIkwWX3Kq/eRaTcKjyttKPveiXuYFxC9NyPB0FWhG7A4i5lhNC/
	XLn4ZMgLLtpCVnrzqRLGGc1zcZnNPoI+LZXlTzJcioMkqFh4TF0VNrQFOsVJCjgJZ/4DIHYBv62xN
	lcOjAZucBuxAJIrsgdOu2f0bX84vcpWePh2ZTwiwzfgM/PkYeYXb5sbIIqC8l9gyZbDislIXYU8kc
	Lep/GIpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3i2-000000089qY-0uzF;
	Mon, 18 Aug 2025 17:31:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1b5-00000007thC-1P4L
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Aug 2025 15:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5l8fao5tyyCXjqpBW/epFwUkG6rVSrLdqtcUPVUunrE=; b=KkwdAT3WzrdWOkDOeyFnKZCw+u
	f2aEnnJtUdm96WejVF+fWj0bqOHmcdWYAkmIPZdIXWcxaXc2lkxl/pDJ9NwSskOAP2rdlLStE08UU
	t07jeuM7QcsmYw/jf6x47do7d0vTkNOtp7yc7KiWp277kMIM3+sSXzC8ObOWMixU76GnCDmUBjhSF
	GaAYf1e0hSEBR7MO/Cp+ZQ8iXoK3m/kJiMWb/rk+b9Ykl7/2lJ0Jlsfsf8QkYERprTxiSBld9rZ6b
	96zJcVTOemQ/KlLyQVG8MD6ddFOflLnotsAYm6TUenLWgcjkMn/ZjeUiNOYpPG1mr2YX/O37M2MuW
	Ligr2YlA==;
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1b0-0000000HR6N-2cPX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 15:16:29 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-333f92f1911so31292791fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 08:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755530184; x=1756134984; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5l8fao5tyyCXjqpBW/epFwUkG6rVSrLdqtcUPVUunrE=;
        b=e/PXjlou1K5YIH1/L0yrt07SFk54UMQ29ZLRZ3Gl+fMZX7298N/foDpyyfFe+h3/k6
         5lRfm+7WQJ4NwuyE5dg/q913tJWouPiBlyQutTOypzUUckxUWRM2ANiIhRWm2yNO9uz+
         EteS+DkQNg8FS3x3TwqDh/bYY/7QpE+drbfVQuqxamC3GVC8vBSH6Qeh1ytLShDlqE4y
         k7PX+tai3tKUtrxuIcLxz5YwQQcw8UNIANdhtkoaZ3hzj5yr4qNo02xI3luALXx7tviW
         zuDDmk3T6CTGFo7dii9p9NX8S68k4AQqdvZk/uLzA18kci/bOVkDbkdUx3WgWcEwhNDf
         1ZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755530184; x=1756134984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5l8fao5tyyCXjqpBW/epFwUkG6rVSrLdqtcUPVUunrE=;
        b=Z+k0EDN39iewZNsO+U94kZUt7rEUPVP4SH33xjp5RKZFiDz9bMoJEdqafOk7ZSyN7S
         XjRxMoKCAcg0PRtIqeNW9qQQN1UhInY9XzugFJjoC5irWV7SYUb0t0ha5z5C7C45PVic
         yJGtfOIrcjZEG9s5l0pukdXL0QCBerRQfJ4v4lvgyHi6rA6M8ODHoFhInbvYakmWzGb1
         vs0tHNHEfDpQ3638F9lOPCfioTIK01i002mRv0VUeEsVt5xe+Qkz90l+uzLxRNOoZXmq
         x+BAj9VIqkFfKb0pvKUpp84u1x9QKm8A8aAh7O9F8/XOtxk0d3k9tdAsIRGg6kzuAMgh
         kBlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFzS2dYPsZTUNx2SCM3PEKxPlPb+3gKcojfU1OJeGBDrx7qls8vakZ++4goQv9JBOCptmNVb4IHuWfsPA07AvH@lists.infradead.org
X-Gm-Message-State: AOJu0YwBKt3zjgdu1H0nrMfap3p1A7X7Ombp7XMdc6XNSX1LLourDod0
	5qZuJ0Q+74j0eIxpBEXIKVfWpfDqG2e3wfulWoaJwa7tZGF8uuAOxcse/M+e1u0/cfz9opEtWyQ
	OB58i5/eOENtV8pGbptWgB4/XQRq962hvbZyAZrcIcg==
X-Gm-Gg: ASbGncvygkbFm4Qi4WzInDB3TE7LakneZHtGBn+SAeq8DjFZiZjLsPu78VCBitVuzLj
	LMvcAtas/xAonHv0WGMQ9BC/ALTGat/XfMOSycyjB8uTxQzutinI1E/0JkN1XPkj9Nx6sRisTcy
	j1YXOT3m0pITyw59Xx6Lx/4HvSjmEFTujBvwu7NjanrCWLwzUb9QnxXs4VNEMs+aK1uSto4QVwU
	/Fj7/I=
X-Google-Smtp-Source: AGHT+IGzqxCnqLVvPxKCko2DlB85KniY6TF5HHlMzLUiXgvNhvXoucfmnrbgjKUH/ALtayc9hnqKx6ybbX/dLc1uNDE=
X-Received: by 2002:a05:651c:198d:b0:332:4528:c0e0 with SMTP id
 38308e7fff4ca-3340996011cmr37441011fa.32.1755530183649; Mon, 18 Aug 2025
 08:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com> <20250801-mtk-dtb-warnings-v1-7-6ba4e432427b@collabora.com>
In-Reply-To: <20250801-mtk-dtb-warnings-v1-7-6ba4e432427b@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 17:16:12 +0200
X-Gm-Features: Ac12FXxjGtIqn77Wg-HXxURZEtSYdu71ByUfcWhpILl9XIWrUY16-cZaSQJoAaQ
Message-ID: <CACRpkdZpUhPERPFvNTwormrqz-H-5VUDaOrRQQ2ap+Oe6YN2Qg@mail.gmail.com>
Subject: Re: [PATCH 7/9] dt-bindings: pinctrl: mediatek: mt8183: Allow gpio-line-names
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Enric Balletbo i Serra <eballetbo@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Weiyi Lu <weiyi.lu@mediatek.com>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_161626_769874_73B8088D 
X-CRM114-Status: GOOD (  11.37  )
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

On Fri, Aug 1, 2025 at 1:18=E2=80=AFPM Julien Massot
<julien.massot@collabora.com> wrote:

> Add support for the 'gpio-line-names' property in the MT8183 pinctrl
> binding.
> This allows naming the GPIOs, which is already done in several
> device trees (e.g. mt8183-kukui-jacuzzi.dtsi, mt8183-kukui-kakadu.dtsi,
> mt8183-kukui-krane.dtsi), but was previously generating DT schema
> warnings.
>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

This patch 7/9 applied to the pinctrl tree.

Yours,
Linus Walleij

