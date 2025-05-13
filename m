Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4185C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 13:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lmyj3hP5CkRfmv8NZKBXt2FvgPVL/V2jgy3imsWNkMA=; b=Zx5v/d91GzSFWRz+bIscdL35Vx
	6esMenYLht+0PxGgBm3/CEBavWyN/VgIaGXI5OiIYWI8eEvOgffeMLDSYWYuwmm3ug1wKH4azXapG
	4+DzMJu8Ux/+XMl5EiR9x2jkb7AxfD/nZbIBx/33YxIIhtzjIDEJGkLHzQN5pASZZgX4vZEGU23G2
	oQa48uoPNMj24BQmu0PtXMaYlTrEor8RkwOBZMXnCdrgbKfgLn6iv855ZRTRLfQjbQp38XvQ9apUO
	Mn3QXdG84Tct+7f5F6hn0M1EvrU/JIz6ExinD0viizO9A/xyxECz2AlK+YnXlA6PCSpVcr/5RcOu1
	kJlBy0ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpi3-0000000CUbC-2O0A;
	Tue, 13 May 2025 13:30:15 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpfw-0000000CUMw-2OMq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 13:28:05 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e78f528aa8eso4730789276.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 06:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747142883; x=1747747683; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lmyj3hP5CkRfmv8NZKBXt2FvgPVL/V2jgy3imsWNkMA=;
        b=riC3+0Ph0W+ttSS/n4/4P/cbE8FXxd1aT3U/cATutXC5hZicOMgXZgIH71mtrdtYav
         DHjmx3YllZXRkNPwkQlLzPhrAecyCU5Te3GaLL4u1ocgv8GWWLz08F8F+jLuZexPqT77
         rC2dlrbgM+SgAxdigwm/F1z3oEnWoF3SQTtBfGYBYCmSxCufIMmpcP1pvZ70+0RuT1Tm
         JSStb957k3K9ZxuqbpwEPut+DlaHGKfjEHsC5oIe3Tkji/BEh5w1HMEHRt6IbdjZTO4P
         FjeIV3uGI5zV3XVd/4ARWQWF3FDLtLz+5DWgA52XPBGvOWLRPDiy+l3iYKw7yfKQkKxK
         RawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142883; x=1747747683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lmyj3hP5CkRfmv8NZKBXt2FvgPVL/V2jgy3imsWNkMA=;
        b=ktFVpX/Hm2d6AdERwVYTiTOTDdbp36lie0qVjA5Dkj0QtgcL9UU9w9Mbt0lqiXdfVj
         3+NFBh3ZBQsi/VmlHvY3GamjK40rf7TBYwg3a46BiQ6UgZ5rbRza6J3PNdG8Tq1GiCCM
         JL8kEuVEXaTS9x4TjVo5+CEzDkjrHyF15pxwa/QSBhMEJKJszq+LLg46PvkFzQxB3XuH
         OlGoa0WvMbhDMf1AkgoZfuE3/V2d6VIzr+xDAw78kQBkIfzjjSuIfCFaoI3uxb5naOnm
         Nidpul4Q6ogxuPAPGg+xx7Ta6Ppaer99tmFT5vHMDW025GLYmEcR+J4RSArkIex2yIEw
         TFdw==
X-Gm-Message-State: AOJu0YzQ06NyOZS60K07ujX/BLSlmZAxN3p/Kz9EWJac2PoWwiIBgbaq
	jS8ftCqWV2cAzgrHa3zVYebikEQ6jiyGv6HwqdcssML8W/esO1rNvn4So3xm4vP8gWgEYI/iqEA
	ltdqPK1sbvhlY2XVc0sXijbFJBVKyjunKuEPwaA==
X-Gm-Gg: ASbGnctXuEBc8MexctuqM6sxQfn7Lr4uadIBneq6lbonvfvCEky/UI4h6ssXkyiXf9e
	3tjAbesx6i73IoAXKOjTUDqsD1+emRUVyfj3cxOVf7kIZd6RV9b+x0Y0eA6aK4hxDV/ddVs3/Fj
	YATkOd7Xu9r56yvPfKdKNi1RjvTez88Ij3
X-Google-Smtp-Source: AGHT+IGwA9BFxyqwYNEBt7U5MGtywFT6puWcYgnlhrrQ514BRD+zuSEIuyxmPn0OaxGK/ficXJk/LrcOoaZiYWm0Zsg=
X-Received: by 2002:a05:6902:1893:b0:e78:f395:7d01 with SMTP id
 3f1490d57ef6-e78fdcd1532mr23000451276.28.1747142883341; Tue, 13 May 2025
 06:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250508200807.1384558-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250508200807.1384558-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:27:47 +0200
X-Gm-Features: AX0GCFtjRegm5A3xop934setnF5I9P9pPbOKoUABWT9UO5DUuWgk9ya_2vMnsdg
Message-ID: <CACRpkda+ouxrpUSbhk0OD5CRjorbQqg_1aGx0WgYw0X78eUutg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: at91: Fix possible out-of-boundary access
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_062804_609797_C27F6C49 
X-CRM114-Status: GOOD (  10.34  )
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

On Thu, May 8, 2025 at 10:08=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> at91_gpio_probe() doesn't check that given OF alias is not available or
> something went wrong when trying to get it. This might have consequences
> when accessing gpio_chips array with that value as an index. Note, that
> BUG() can be compiled out and hence won't actually perform the required
> checks.
>
> Fixes: 6732ae5cb47c ("ARM: at91: add pinctrl support")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied and hey, b4 just picked up all the extra tags for me!
Love this tool.

Yours,
Linus Walleij

