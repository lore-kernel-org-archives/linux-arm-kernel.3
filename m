Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE107C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 10:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NyeLesu/6qOxsTAaXie5nFM1At2JPy33BMSuqodw/Vc=; b=q2gybQHd/U2/AVan0Y2jBlHbvW
	MaSyMXbk6PXIxQFKS+NnMfNmhGuoOHwp0NEnm4exgx4UeuA0mSilXZrUcMveKpSAFMhA77N7HigkE
	1AM170B7CSulwNaN3kB3ZqYSvcYBROres3wOIYNsqDoawJbSJdba8+z71LDamRrmvgCu5+kl+jyc/
	bugZRxm8wgPi/3n4A3QV2u46yYcCae9te4l6STDuZVJ/bdPAHbRRe7GKxkVWrHF//4DELOrWjecSB
	03cSTT7FaEVYYDVrlRKAb29h1cL/KFBA/F7y37+uFrorojNJGGqWRU5iQWnxvJyFGDm6OXhfpeM0/
	SrlyrWwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2kf-0000000DvU9-1YQF;
	Fri, 14 Mar 2025 10:58:53 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2RP-0000000DsSo-3RLw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 10:39:00 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54943bb8006so1817857e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 03:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741948738; x=1742553538; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NyeLesu/6qOxsTAaXie5nFM1At2JPy33BMSuqodw/Vc=;
        b=zr/hGP4QLhE22oKMsJ6i37fkaJhwdGEHmbP1+JJIeDH8k0KvSdueMSD/Aq/OjcbFa0
         9DswKnRGEazOe35MS4tSicGNghiEd26Mgl4n7sOVMDidsqdwH6aNNU2wJGAgzfOAW8i8
         74Uup9M7lug3wiB+ENBwvBnDI4JFh0qT8r7AeUuwVY0pH8iHOlJLvhgbSiMR7zStyB99
         r6336d+CJrIJtDd5ZTfSLOI3qngymPHS+WR/7bJIKHva9OYLpGkqC1yaq1oM4hgfM6KE
         +3qHDORhv+sDLksFzLloHdZm1sfWvBo+FgoQncQq84PwtZMcyPlmV5Oec6SnTuI3Q0kZ
         dHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741948738; x=1742553538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NyeLesu/6qOxsTAaXie5nFM1At2JPy33BMSuqodw/Vc=;
        b=jIHnux/KulKpWSYzbvjBdfJ1gOyoamkZo4tOCsR82UbydcyAbD0kEyzBtlozMhCo9w
         6hDx7eXiErDVs7OM3EasSLsChD/4ZS3jPVh2Fiab8iAGznfFC7KOqThuR97s4XBQ1CCS
         XoJUrz772sRYFhCxSsWH0uUH0tAe47B0WbBNviCayDD/zh8/9B2B69oM/tnaIgAZ6/eU
         m77A7J1W0Txwn5ZuX1SW3tWkrpMcMu8CGkI0fAPddJtcaZQMI02ZJVJWR5+6GZl6wgtP
         7zUnU1FI4fb9rO3pLQTwxOtC/dg0BjXpic/xaQbutbbhi9fX9eW9miorJEj/z9QdeOOe
         4OVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGQ4d3f+uJleRSjYj6iNpHkxQO+gIovMbmNkxC+CJuGH3coXVoqhv9Fo2+HlG6SQ1tynPnEFIGTj7/Tg9T23tl@lists.infradead.org
X-Gm-Message-State: AOJu0YxtqUqVkvGiiEj3IddNOHNA6UrKUWH/b6eO1N735Z51Wc5zmJqt
	1sdUvWH26sDmjv4C0OGiHqZiMlM/G7TPJyHYY14RK8VIEcX421WH8wxACp/fwBHBYKadyLhq4b0
	TCYlWn5WbIqeuvwdrRgiHJQKOCaTace/vzuRVtw==
X-Gm-Gg: ASbGncsh5eZKlGEshSzvSOBKVr4I9SxVSNhb8Qt5SoLVx0GGsbjL7oiZ59R60bMpXgg
	G207ybWq3RkOgenm0FK11UBXPUb/Rl2tovuO13++cBx+UJCJ4IjGSQOJ55FeY8NrG7kbLHNbVwO
	7Mqv5TG/ymWb6Sn9FMouHuUpg=
X-Google-Smtp-Source: AGHT+IHxhAnR8E+RwasBnU+EVae5M55GP8ujY0PhZJ8YjGHRbmG1lTmcDhu2uwV0HMJdLPp8ZnEwtoKmC+WIjWFCG9k=
X-Received: by 2002:a05:6512:2343:b0:549:4de9:22df with SMTP id
 2adb3069b0e04-549c3612160mr635995e87.0.1741948738199; Fri, 14 Mar 2025
 03:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250307-en7581-gpio-range-v1-0-de1262105428@kernel.org> <20250307-en7581-gpio-range-v1-1-de1262105428@kernel.org>
In-Reply-To: <20250307-en7581-gpio-range-v1-1-de1262105428@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:38:47 +0100
X-Gm-Features: AQ5f1Jo9_mqBFukwygbuTda_hEtN2V8hjFmv1KBkHq8fVH1jsyHNXjQJZyWyfVk
Message-ID: <CACRpkdZpj9q+yH7VEQJ=tOjpR6S3GTeHbyYpqaTYxCOJgGd7+w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add missing gpio-ranges property
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_033859_859926_7ADDAA3F 
X-CRM114-Status: UNSURE (   8.05  )
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

On Fri, Mar 7, 2025 at 6:08=E2=80=AFPM Lorenzo Bianconi <lorenzo@kernel.org=
> wrote:

> Introduce leftover gpio-ranges property for Airoha EN7581 pinctrl binding
>
> Fixes: d0c15cb96b74 ("dt-bindings: pinctrl: airoha: Add EN7581 pinctrl")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

This patch 1/2 applied to the pinctrl tree.

Please funnel 2/2 through the SoC tree.

Yours,
Linus Walleij

