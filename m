Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9691CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 08:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E05iHIbrevOWCYE7OJG8GXkZLu9ViZ4PELOG+JHp3Us=; b=cT4Ra8w7Xy1iYY7SdxqCBdpYl/
	RLdlKTvNAgw9ZmNy7gOKL/EH4vAMESBkgFDhufIi9pZfsGglKWrWrboAkWWb5rLm6VelqRE6/8Cqt
	B7WpDJ0ouyTB2aoP0IBFqvsno1LP8O/yvZXpOuMVhWhSJn9fk1p1nPQ/5TwgFACO8dvL06ThO5TSQ
	rxvSYDUJO34FbXXmxnB1zBKw7I1goDqwWs1myU5Smyuquc2ZSZ/iDwljETQnSJ+LH9KL4GkY/XEoH
	nZ/I9ED6gYUHeds+D9oUNaSaW2fw3X2h7Z6sUeR1mrby10idCMcRLQ6c7If9LxILgqGtD/oKFOUk5
	QHKqE5Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVAB-000000034Mi-0Ro2;
	Mon, 08 Jun 2026 08:16:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVA7-000000034Jx-1R5n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 08:16:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F67F601DC
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 08:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260E11F00898
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 08:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780906606;
	bh=E05iHIbrevOWCYE7OJG8GXkZLu9ViZ4PELOG+JHp3Us=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=n6MJHNNPw/rdEQ9+/wX3e7sYwrJeF4CxEinDh2sL+Z4GuijMSbsR5Dza3YJU0oBXh
	 g2v/CHsHAp5LylgxEo6lI8SvRIbgPrJwZwTBCc4y7XL3sldmyIVN2ztGxeJgLk+GAO
	 qf/IoQ27vT25AeCxtGYu7WdYJyS/rlRuBDSaWMcf3hAwFuoxL+NkdjyNOUN00/+LYZ
	 WDFqmhOauGndRB0BYQvHkl9SjqGT9dYC7dUcD9QkWThF6FRKiDGbqjG/IxCjWtRLPV
	 uhg7QHxXf26JNhq9GK5ka3afHwFMHqCw1EzWeTSZVKsKzNWSvtxYsmOq9oM1CTzO5S
	 KZt47uQfgbIng==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa68d7d757so4304756e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 01:16:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ81GxTGkPmueTUsAopo2Poon1bFMsOa2uD63bRirCGR119ZyVhlCpzF1CtqELD3x2vx+GF3h2KRbv/QOPJdJs47@lists.infradead.org
X-Gm-Message-State: AOJu0YxALhiBiHoI5UrdSiMPCO+Gdti/EvOrcttabcWGGaJxePAdKLFm
	+MNQmLad4pZG0Etwj7Mn7bClzbllsf0ZsVxgMW1Bf7AQt5krqYylj/gEW3eptvAlOdU4wIu+NF1
	v5KrTcBB4A1N7MLt9dHWRpIZaEz/CzVs=
X-Received: by 2002:a05:6512:4158:20b0:5aa:6f89:9378 with SMTP id
 2adb3069b0e04-5aa87be9785mr2712017e87.33.1780906604512; Mon, 08 Jun 2026
 01:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260605071233.28873-1-ansuelsmth@gmail.com>
In-Reply-To: <20260605071233.28873-1-ansuelsmth@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 10:16:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLnSLnbt=haP75uu5R8uQCk2nWM4vT7=tH2ZZf5MyG45nQ@mail.gmail.com>
X-Gm-Features: AVVi8CdivXSw4jUoM7pdXrQFsczZzpyDzmpPsLaovwgdJGugxO38xZTv12y0Owk
Message-ID: <CAD++jLnSLnbt=haP75uu5R8uQCk2nWM4vT7=tH2ZZf5MyG45nQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Move Airoha driver to dedicated directory
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Jun 5, 2026 at 9:13=E2=80=AFAM Christian Marangi <ansuelsmth@gmail.=
com> wrote:

> In preparation for additional SoC support, move the Airoha pinctrl driver
> for AN7581 SoC to a dedicated directory.
>
> This is to tidy things up and keep code organized without polluting the
> Mediatek driver directory.
>
> The driver doesn't depend on any generic or common code from the Mediatek
> codebase so it can be safely moved without any modification.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Patch applied because it's a good idea.

Yours,
Linus Walleij

