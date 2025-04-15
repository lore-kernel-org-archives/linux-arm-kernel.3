Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888D7C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 22:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31qWf8KQERvl8g/dbn9h2rj4EmG6eTFJ1VCVzlLhv5w=; b=PAxkGxtv17yrnWjmqFO3Kctt4a
	qOUX9fnUchi/yVKQZGm++BkuHVuCmqq3MacUUgbBJCqNxu6BGDlfl8GXs+hjQFojK5PrRKwv9oh+u
	yim2hvE8oBKqxbU4x/WjbjQ1VQdXFRivDqervFn3/TFPX4Sy6Rc0JP2eizPU3PONTdQFn4E4AfG5A
	8rIZsZ/rZYZqcOjLmguSIer2StOFq90I2EnuEW+LWW0oC3SMOAIohOYT1FsAX7Y76xFZuHWm0BYrL
	ExzAJIaqCQ5YqnoExfHqgidNN3FbCxsWg9naB46S7KnagoHw6G3bkmoONyFAZd9uvDqR+wT7W52VB
	VEAjZluw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4oXV-00000007IlU-3Wd1;
	Tue, 15 Apr 2025 22:13:57 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4oUa-00000007I9x-3dph
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 22:10:58 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3104ddb8051so38848581fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 15:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744755055; x=1745359855; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31qWf8KQERvl8g/dbn9h2rj4EmG6eTFJ1VCVzlLhv5w=;
        b=lVT8fQXmc63YO9wMs75pVgMuUNbJmv2qioIA3bz42sHuccwll/JmW5R+IfzK/eYCYz
         GM0oHycfyyxxQJkYIciuta1zBevwEiW243e/KzfARq4PbPmmsCofaSprqR0WDll1K3yP
         4f5jRlrKJ0dU9OwokUtwA6Jn0S+VQetLn3oyTk/6ZClhmZQF7ZaWbVOkdSVc3HapPcrr
         t4WfSSTHpOxWuQtS3AYy/B1WArTdDUB/OW6KooMdR1Zym6jrkBLMMcMrZeXPe6SokRI3
         naGDh1eimmJYUdtrh8CG07vSeZfGyBuaaHxd8/McCv684v/USAoudfmT2aLPzid96tB3
         vmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744755055; x=1745359855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31qWf8KQERvl8g/dbn9h2rj4EmG6eTFJ1VCVzlLhv5w=;
        b=W2AUaDkPsmTAi0kipLhBAoYR4OLYawF4NZNhkbHwyrmG26mYarhxT76FAZy0MeHp6e
         MwDeKgWChQd9cgNnddD0RbNkFtdIytZdxrwtOVUKZZdct7yJd/oOCJ0mD8EBYiNuc8EY
         3ipx99iJEE8EUK7gYdfWyJzAqt+MwyOGv41nzeARbvJ4jbm6IvIT1BNDES3c9EMhavPc
         ylFWxnAynNTDKRHymREBma+oTy+5GuoecVy2vGq7Sz4tgtNtQHltbggRCQOkPEmWYrI7
         u2805s0Du7L36URxePfuxkPnTpBfLSOUB1Tk4/iV5jdcMgCUkeap+IgelGjBubPwSZ0n
         l2cw==
X-Forwarded-Encrypted: i=1; AJvYcCXNujwO+Cilxj1L6wleiZPIgVk1VPueC0OhUBRoQ6WHDkSX2AOPgh10xH1bCSj/qvnUsjvMA12fBmeVwl/dnURM@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8KK71iFAkH2sIPsdLBKH4crzBNWzxzrAbs7tklsS7QjoB9qFg
	tUAEF43E2NkvkojCNjkaC7aLJg1oSpyeckCL2/edKcpr5nqFQv6Ug0i0G1HceW67vkDCVJLlMGy
	36wtb5GBhJpcn9zHUbCjZU6L9Oy5Te9Oj4keCOQ==
X-Gm-Gg: ASbGncs1FXq06noaScZmTkpVRMAZf9DjVwFTBNgz/egVYiwnnX63LSreaNTuQmITgg+
	pjlnhx2wiR3S+/UXYtALeRHQhirDrH6oTqLUoma/47V2Y2OJyXIaZRI9lfepz3ZXm6hBZfg8zZW
	qCE+UPObLFjhjEGGhQ3wfhZA==
X-Google-Smtp-Source: AGHT+IGZJzLOwnZ9qpiWHcIF+V8TMR3nGOqkOptHc/Gl4TE7Nw9LgOL4ju4wMFEnKHYqcQfWgSEgPkmfn705OlR6U1Q=
X-Received: by 2002:a2e:be2c:0:b0:30d:e104:cd55 with SMTP id
 38308e7fff4ca-3107c35dcf8mr1584751fa.38.1744755054882; Tue, 15 Apr 2025
 15:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 00:10:43 +0200
X-Gm-Features: ATxdqUEUFUOJ2tt2s7fnA8fXcqPXcCQqJSFMlzS_sbWB5FOT4EwR_LV0iDgZ9D8
Message-ID: <CACRpkdZC40M9p0VsygE4fWeybdHYD6OJ2b4BJufbCA4LVW1z5Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: mediatek: Drop unrelated nodes
 from DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_151056_910921_600FA8FE 
X-CRM114-Status: UNSURE (   8.83  )
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

On Mon, Mar 24, 2025 at 1:51=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Binding example should not contain other nodes, e.g. consumers of
> pinctrl of, because this is completely redundant and adds unnecessary
> bloat.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Both patches applied, thanks!

Yours,
Linus Walleij

