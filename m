Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82ABDC2A075
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 11:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuZu5WEc5Xcwrt64cAZL149TZtosHcJJHoEAhPJj8bk=; b=4lIsVOXAZusrobXc+b2+HHFIQn
	41tGhJcXOmKnIhzBQlmL49Ju11fo+hyAGEYyBgRb2osRpMyrGZ0v5FsA3EX5ZJPN0yygwhFmRIFro
	bABAgfcbUgJoHR2uOdM1hSZayEPY3yYYsCzcMrDd5UEdb/og9YycyEfVHeQUji9H5yW7Jozx1fR6I
	/fmaV0T5qzwuUgBaqL0Yyvoqc0qbbYEX9nK6zNEBEDObRvU16fcIU25zDAvjBeIr/ZyTWvflqQiEO
	2F4I7VO6HxE6S4iT+5Cz76xdojPdkKxfbncXGyNmdbQAuEZENQu+ImRR9ww4wh4uadkPHEVmSrJsv
	aqmkDBxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMSr-0000000ABzb-1yZx;
	Sun, 04 Jan 2026 11:40:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMSo-0000000AByn-3zLq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Jan 2026 11:40:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 944F044309
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Jan 2026 11:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CAAFC2BC87
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Jan 2026 11:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767526800;
	bh=4OlOxxutktzHnj47iAJg6lb1/kg6UJCstgjPUdHssPw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hyJSJ5EDQCgI/03F+MYNO93KhNLLP8NLLkVCB6stSSFPbPGXYuMrIbZ/qqWq9WL3G
	 YDonSDrxXoYN10wmBOrpUBAmr28DuD54Q9KjBjqNrB62lV2PvC1gCSxHIjVWLqWd8S
	 bNCWaBLyVG/jHfzGI5kw0WshYZp35yT646rPHUFuckTIubSF1bPtEKRyfh0zdjBX+J
	 ghmz1R3FfjfY+6w6NHLvgv5ulKfL+Gl/CxxhHiNl3keA++7ZRwlvgHm+qb7M9V3280
	 8cDSKZOsSNSaiwuCF8/YSRx1ig+rF0alihaa4tOSRDpfcwAa21PO33QSAtOWJXtQCF
	 75TwETjtqNvPQ==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78fc84772abso104216377b3.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Jan 2026 03:40:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXXgvi35DRRzG/Ha7iz9LnxkYBZwRRXLiUwUCfOkj5l123jLMY1AajHEnrzVa+z4wtWx4aFurgfJtymU1Kt/1p+@lists.infradead.org
X-Gm-Message-State: AOJu0YyDP+X0nPgVuDAAgaVxPdU6yR6WQKcJsTN0sgYXkozyGFj+BwhC
	tTcDuWLPxvJjBm584LHFqvGcpxPr+waGiOxoXe2fc6pBZHKS7VN5KMT9Bblx7mysGxq7MkCdpU9
	2sMBaLhAjG1nkqFlyd5XpRuGlwNpzz3g=
X-Google-Smtp-Source: AGHT+IGKIXjy7lexXGYCiKMkRPD8ggwV371jcFQdcHsITC/B9zTB3o/bAj5rEawF9HMxUDdZ3DoVx/M+caRG/RtXYBo=
X-Received: by 2002:a05:690e:1519:b0:643:33e8:11f1 with SMTP id
 956f58d0204a3-6466a859594mr34395536d50.38.1767526799488; Sun, 04 Jan 2026
 03:39:59 -0800 (PST)
MIME-Version: 1.0
References: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
 <20251216112053.1927852-7-ye.zhang@rock-chips.com> <CAD++jLntu4LY=VHOMSXeLKXOBD9MTNziv47B0qkDjxUa1xAsng@mail.gmail.com>
In-Reply-To: <CAD++jLntu4LY=VHOMSXeLKXOBD9MTNziv47B0qkDjxUa1xAsng@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 4 Jan 2026 12:39:48 +0100
X-Gmail-Original-Message-ID: <CAD++jLmLhgxagenhum0KQ1eDuzAa1E5DQqM-oN1VQUby3mTpZg@mail.gmail.com>
X-Gm-Features: AQt7F2rYKdQBghWjfGpof99Et6swSjlhX4OCTK6LrN1u1e2LW2ybvz55mCS36AM
Message-ID: <CAD++jLmLhgxagenhum0KQ1eDuzAa1E5DQqM-oN1VQUby3mTpZg@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] dt-bindings: pinctrl: rockchip: Add RMIO
 controller binding
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_034003_081593_B2C76938 
X-CRM114-Status: GOOD (  10.31  )
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

Correcting myself:

On Fri, Dec 26, 2025 at 7:07=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:

> > +  rockchip,offset:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The offset of the RMIO configuration registers within the GRF.
>
> Can't this just be a cell in the phandle?

This can probably also be determined from the comaptible, can it not?

Yours,
Linus Walleij

