Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3EAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUpdZqfO185onp0pw74RHuTZBmHqg9gIbSRVhApYVuI=; b=IhnkPF3wEHbUkBLtHkHZQi8quJ
	wYLA+ybRFReiTg0eXfjhFu7tZ+ABPZo+tkBbn7/X+cSlSGJ3gr84kSeQUc3FmVfkLW7wxMbRh6AvR
	iJ5wJSnfqhB7+e41lQP4MAghHXODbYzixuGsgr4FHdq8ry7AN2idT3mW0DpXAlRtSH/nKQZsKkEVT
	am02rXzo6Bjzb4LkPVnl+CQDqmTaaGEbojEAxzNEVDXyQRHp3+MAW/p5Y147RovTE+Gx4I8rTAjhf
	nHm21bFdpkkf/SsH+MEtWGwybT0WwmFWibqIU9VHwnJxL/lozGqmBp0jn9gfJbz0D9jrPHMay42DN
	HnscmzYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVxu-00000008aMy-2Zov;
	Wed, 08 Jan 2025 13:19:18 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVbj-00000008W9l-040f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 12:56:24 +0000
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-71e2764aa46so9782557a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 04:56:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736340982; x=1736945782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUpdZqfO185onp0pw74RHuTZBmHqg9gIbSRVhApYVuI=;
        b=O3eFaz54xlQIG4cCb3dzeJUbE6KdVvZ3wiLqdoChiZ/LMbtJvlBBbhPBw0VD9vb1QT
         y7fTdwcWQFzXa00RgmfycJvW0DtEtHh2ImTmEQekKks84NuHOVlyeBp0H7wq95hsiW0u
         EOkcLNTYoc5Avd43WFQxJJ23qkPsidVStWZCCKXiwqZ2vI2Iyy3DuFO5cAI1iB8uoAaU
         uR66J+a78i+HfYACuhuo/pNoeFpVMrHqCPriu9sQyD3oQlJTnh7w9u06eHLmEXqQeyqn
         jrIsJ+lnCZEV2yVYaxT4oilg1DazG1S21yES4gawgHOPr+1rU+07eBGJjjD88E9Psn5U
         vc3A==
X-Forwarded-Encrypted: i=1; AJvYcCWg7Ugu0CwgAtQOtgl10eYmwIIe1PfzNQCnBwdxbCNhKZjH0/WUrX0sXnGF6DWwLFRDC2vefbt5TVt7Ezy0nHFo@lists.infradead.org
X-Gm-Message-State: AOJu0YzXJpQ20VACDs4ydEKq0mUzFZhWJwlnRqL8OY54vPJa4iolk/YU
	w9vW1Zu8lY8AMmlmQQofAWAmStU0OE8JklGzDFoLyBt/Lz3vsfHqv0Huggnh
X-Gm-Gg: ASbGncv5Mzuuilo0pgbgDFoWXr9gi65++9SOwMJWcGFd/U0l0ivvCgZmzz1w6U3ghDI
	iflbm21PZzXZuTJkw+LMuzdy/pXNGiED503L+zAmRPmpw88ulu6vfEtekxADFg0IPy+DcfkJEbZ
	rt4MY4bSefSjRabq7izTL3eRyc+VFDcg3IBhBT9F7/2uV5uZa5saQ6uX1aasZJxYJD788fOGQj9
	E+pwgnNFpoWLhVbUEH8A1xStHY3aGfG9mA28XLUt/PB0SLlsW/ruIvT+PW4z/DrVetzZJAPdIKw
	NQFP548e03DAoL9EriA=
X-Google-Smtp-Source: AGHT+IEcTP4ZmNXAaYxgV6TZ8BFcpPQz/T+Ea663GN5HPGPMnbCf2ihWFtnr906hYWC4dOAUfp7oDA==
X-Received: by 2002:a05:6830:670f:b0:71d:63fc:2ea6 with SMTP id 46e09a7af769-721e2e3103fmr1559872a34.8.1736340981594;
        Wed, 08 Jan 2025 04:56:21 -0800 (PST)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com. [209.85.210.50])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f4db7d475dsm10654995eaf.41.2025.01.08.04.56.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 04:56:21 -0800 (PST)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-71e2dccdb81so10910518a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 04:56:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNagTHqbXH2p1kUd04Ksd/MjSp3toxl4dY1KrLwXsconaMLOwjnEAQO7HyVqtLBW2YHUavX5hs9q4qEsNoXJjY@lists.infradead.org
X-Received: by 2002:a05:6102:e10:b0:4af:c519:4e7f with SMTP id
 ada2fe7eead31-4b3d10485b5mr1502790137.18.1736340575232; Wed, 08 Jan 2025
 04:49:35 -0800 (PST)
MIME-Version: 1.0
References: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2025 13:49:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVpDWFt+3EBeiGfia3DXDL+LNg976FBm32vNEnJdSx4uQ@mail.gmail.com>
X-Gm-Features: AbW1kvaX9wLk6edIIBJWmWkhpdJHnfaq_7CxFB_flrYoOUJ_oqU6wmphd1LCLQ4
Message-ID: <CAMuHMdVpDWFt+3EBeiGfia3DXDL+LNg976FBm32vNEnJdSx4uQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: Correct indentation and style in DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Justin Chen <justin.chen@broadcom.com>, 
	Al Cooper <alcooperx@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	Benjamin Bara <benjamin.bara@skidata.com>, Bjorn Andersson <andersson@kernel.org>, 
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Del Regno <angelogioacchino.delregno@collabora.com>, 
	Tianping Fang <tianping.fang@mediatek.com>, Jassi Brar <jaswinder.singh@linaro.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_045623_050903_52555B6F 
X-CRM114-Status: GOOD (  18.32  )
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

On Tue, Jan 7, 2025 at 2:10=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

>  .../bindings/usb/renesas,rzv2m-usb3drd.yaml   | 36 ++++++++---------
>  .../bindings/usb/renesas,usb3-peri.yaml       | 24 +++++------

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

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

