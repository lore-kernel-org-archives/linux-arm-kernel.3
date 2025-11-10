Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F792CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 23:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdSyniY2TEhD2jr7Knryt0myief09VrFFo+8PkG04XY=; b=Hne01gMY+fQPGSFfEVFnhzKXkK
	BSftbTd4JUu7mgp6gFRZqzmJku+al5eu06Hb1HAJETDV++E4UHckPTw7O7Cif6sB44/PybvNsmQU6
	skXJqb+Y+s8zjTC+iu2yXrJzU1uwC70qg+GN/yRmIJUpLxeXyw1vkYWVKNtwWqW84U80ncalEA2Fp
	cvu/JQiHTkhqX5/GcGmIe5wGqBdqYeUR/hNrzBMdkvguaDy+4HMy34qKUy0mj6G92ZeaS6VYgxvDX
	H3Pri/xwuaK1IRekU+iTXUw9ACoaAlcFGYLtXa1Pdgw4DneRUQ/4+3tMOk8PXO2IfXhPshEJTjkIo
	s5hmVgbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIbbD-00000006Gtl-279M;
	Mon, 10 Nov 2025 23:47:03 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIbbC-00000006GtB-0PJL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 23:47:03 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5943b62c47dso3216752e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 15:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762818420; x=1763423220; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdSyniY2TEhD2jr7Knryt0myief09VrFFo+8PkG04XY=;
        b=DDW50PcPnT7J5/0DVPv9aj7qjt+jCwbY1BNnSVd6NshP3MuxV7Y7a9TDZ0Cs9+PJGB
         Dr/8NGC/TOGRN7GutKkSsCtRvJrV9ucMFe9jJSkTrNDAaZ1+TULYj116jsXDF5avlb6i
         +U0RvI+BEnH2heW9z2bhEVBftlXNCEwLM5uLnzzt0o3PhIHY6wqTKarZgRV9E+ef0cp1
         KAyc0vEESJL4oGFS38ZX1Ar2g+wW3XO58cysIkQ71Qj+yGinbx8FIMwXQtS6CC8FUuDM
         xAjOeSbGS402S/fNa6b1Jiv+s6TfUpDHk9OobE2wE2tqvI3k22oDYWW6Qwb0lYudUTPQ
         PNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762818420; x=1763423220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EdSyniY2TEhD2jr7Knryt0myief09VrFFo+8PkG04XY=;
        b=UBubBmR4pdhMvj7UDN1ISCSNz34lkbYyYi6ikDGnKLZ770Zz2sbZVm9mqDrRtpUXuV
         GZAgA9xFCbW7rJWEip+1c9K2dRERZBK+9VmngcTi0bxf/v847ZHxS5ZpBQAfMkyT3JGU
         MDFO16tXVwHUunhdQ4IBGpm5+8rcmPQIdUYhgePg1ibOhbkbIBscvDMGaH8TZc4m3HcW
         TEroHQ6fkmlF8vPJdyjjm47tKqUvaB4owECuiYXI6eR+fa4n/pQk/v/2Ne6/Tf0vRv8d
         p+v+ZoNHjFIHi38U+qgfJIIGqQiJNpHdiz9SmiQOWK8aLE3H431bTbLrQgzL0wB1MHqq
         xMUg==
X-Forwarded-Encrypted: i=1; AJvYcCUR+yn7BfjCBzCzPl4Cy6jRB0pq7bV6LICWQRJw7R2sSOUG0wdJDD6VTmJ0bxCSjZr0ng2i4jY8RNyrJf+mRWaa@lists.infradead.org
X-Gm-Message-State: AOJu0YxeOluCxVYf6rXVObGYUlyQHOEgOl+rPPJuLX4s2AfypD3AMCuX
	PFothVyVV6olnLkGAXoORs+SNx0PBVicPYGwqvim77BbwsCqdxiF1S8jINWJBYmq9bNJ4PVvq2o
	JuLaCjreQslbBeTfTM6V0WxH3cm6Kji8Ck9QgNB/56Q==
X-Gm-Gg: ASbGncu23+G1q9gbFQw/3jo62BK6bXQ27GrdhtkR27ICXboGCR740wCb623HLgGbPUh
	Du53lcsYx4DvuUb1FscK6WB80tEENfHyjcRSxwtQliMvihzbQ8ACLT9u3H0WR6jmxrUddVYmuuA
	WjtxP//6OgcCr+fj1RMUe4sNrGIIroFCg7FUS8TSyjWTgn+sA+I7nYd1VehdIPNHGJnE/n+Dl/Y
	dfhDcr8IPZFCABqBIytRleahuZ7Er1XjbwEK7MEQF+hBYgyzuQz4dFEOb6MkfNnxZ4VVwS0v7qf
	5mo+pQ==
X-Google-Smtp-Source: AGHT+IEYlHtlcaIbYzh4uIcS3eRGPuN1bn7uG7yYIbKkIFRYhenhwAQ61nxtn9INckW1qFWU7tGOevIpEsnyQ+lU0tE=
X-Received: by 2002:a05:6512:b96:b0:594:5545:b743 with SMTP id
 2adb3069b0e04-5945f1f4346mr2601951e87.27.1762818419930; Mon, 10 Nov 2025
 15:46:59 -0800 (PST)
MIME-Version: 1.0
References: <20251106235713.1794668-1-ansuelsmth@gmail.com>
In-Reply-To: <20251106235713.1794668-1-ansuelsmth@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 00:46:48 +0100
X-Gm-Features: AWmQ_bmWEn6D47GtrYlRXbtf5iV6J32LnDgS7NEk87vjG42kQgZzdgtZdTywXVE
Message-ID: <CACRpkdYOXSm5BaHgij_=L32kq+fkx_ggSJ7G5a=064FDvMR4EQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] pinctrl: airoha: add Airoha AN7583 support
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_154702_175004_DC94C0C2 
X-CRM114-Status: GOOD (  12.94  )
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

On Fri, Nov 7, 2025 at 12:57=E2=80=AFAM Christian Marangi <ansuelsmth@gmail=
.com> wrote:

> This small series introduce support for Airoha AN7583 pinctrl
> support.
>
> Most of the changes are generalization and cleanup of the Airoha
> pinctrl driver. These are needed as all the array in the inner
> function were hardcoded to EN7581 and didn't reference stuff
> from the priv groups.
>
> Everything is changed to match_data and priv struct so
> adding AN7583 is just a matter of adding the structs.
>
> Also the schema is generalized where needed to address
> for the small difference between AN7583 and EN7581.

All looks good and bindings ACK:ed so patches applied!

Suggestion: since this driver has:

1. Exactly one group per pin
2. Use some accelerated GPIO operation, .gpio_set_direction
   in struct pinmux_ops

Have you considered implementing the new .function_is_gpio()
callback in struct pinmux_ops to tighten up the GPIO strictness?

Yours,
Linus Walleij

