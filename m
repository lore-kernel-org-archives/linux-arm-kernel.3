Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E600CD0D17C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 00:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNPYNYhR1kjj2zWJy9oyiLEOrXpx0LEturTm7uRBNdo=; b=qDj3yTgNxNWI68/4aRKbN1PjVs
	lan0fzUuAb0Y9nzD+wabObd09IgqHKexSSg5bBsHALo9XkoOGw3GXfizKhHUOIfQ1kS4uFLkZTASm
	hi+5VvUB8xD2izpnv8uD2Tx9lYlI5vcKMc7Huf/FEeLOjfZUcxS++/93RH1ILMmd2qh85wqbavkRZ
	KAohEV5urBhlW9OvzmWWMLB+sRVevnMCXErmAkwSnu/PK2RHlSKy/20KdCVbKBCujkKWTXx0m3tpm
	0tNNNK47XLLmWHzVFNRDJV4g09sGHTu/3K2tiMYKhp+hHnHrUysO9nld1juuEEMuKrWokn6ypqEXr
	V1RzKfiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vddqQ-0000000Fm7g-0ugs;
	Thu, 08 Jan 2026 00:25:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vddqM-0000000Fm7E-3iRW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 00:25:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D7A2C6000A
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Jan 2026 00:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82457C19422
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Jan 2026 00:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767831937;
	bh=dKpvfWhR+ao6SRp4kUICqTTWzO7/JiKNMNbKfPilDpc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o+iSKdWJNZubEaw2VairlWyVdJTSZcyFCq6bk1fo2xRjoOO5sT3i3hwWH2fmu6Rwk
	 zijOFlsg3xed3WBwr3J33ccpgA8EnkIauMCZRzYwA7p6ESY6j2v42uUylZN7kfnRcP
	 x7Pm0+Nq6PvglbBH2Rk4Vk5R9ssqaVpJn6x4NC9paLe6RdOoAecV6VgNO+xCrcXahN
	 2RvoKIDI9NhhrwaN4tR3/WqqttK7IOSkF8cZ3KBIhLkhV+KdyT8v4wEA9s7YPavSoJ
	 SNZGV4QUOgv6MINP1Ei3GgiAxpwpzZWIaBdxYW9ZdCRVSKiXvUJbWCULo8B8Ew0iW/
	 +Ghf20BgfpCDw==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64d02c01865so4134687a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 16:25:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVlVRJm6wCWwBtSObyoygVHWW2lRZja7EJXwYdMTdaUPhcQ/wKw26UBRy7RKRayx6wq3zVZfTdr0BrXVVhM9XuT@lists.infradead.org
X-Gm-Message-State: AOJu0YyTUW6+KbKuOqLMJeCqR6QwOXNdYetSkKeiwyH4GGupdIVsQ3tR
	lifz7qHQxmeCeMd06B/B7SS+/LulamJnt9uHy1ELCk0QuSGDRLztT5/RDiidyGV7nS8Jcf/5LaL
	qXqpoBDvlMMRWmut15Xw3/U3JxbJJBg==
X-Google-Smtp-Source: AGHT+IHGbdOq9A7ht9GwHXUB0lkTxrQU8h32ytsd60tIWq2VQbXNaEf7DbGEZB5drNoTLCE118ndwLzIrKNWa4uD3U8=
X-Received: by 2002:a17:907:969e:b0:b76:4426:3a3a with SMTP id
 a640c23a62f3a-b8445218177mr472166366b.58.1767831936081; Wed, 07 Jan 2026
 16:25:36 -0800 (PST)
MIME-Version: 1.0
References: <20251119175124.48947-1-linux@fw-web.de> <176778436967.39195.1901837532049373497.b4-ty@collabora.com>
In-Reply-To: <176778436967.39195.1901837532049373497.b4-ty@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 7 Jan 2026 18:25:24 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLdLaS+9q7_BgtjH-ezX6Bd0r9_GaOM59CyUctCm84kZg@mail.gmail.com>
X-Gm-Features: AQt7F2of3BOU5fJm5dFNBkUc0jh06Bp6eZBJGWiAa-ihxq2BG_e8zm-MeY4S07E
Message-ID: <CAL_JsqLdLaS+9q7_BgtjH-ezX6Bd0r9_GaOM59CyUctCm84kZg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] build full dtbs for BananaPi R3/R4(Pro)
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Wunderlich <linux@fw-web.de>, 
	Frank Wunderlich <frank-w@public-files.de>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
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

On Wed, Jan 7, 2026 at 5:12=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On Wed, 19 Nov 2025 18:51:21 +0100, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Build devicetree binaries for testing overlays and providing users
> > full dtb without using overlays for Bananapi R4 (pro) variants.
> >
> > It is not required to build all possible combinations, only for
> > common usecases and to test if all overlays can be applied.
> >
> > [...]
>
> Applied to v6.19-next/dts64, thanks!
>
> [1/2] arm64: dts: mediatek: mt7986: add dtbs with applied overlays for bp=
i-r3
>       commit: 0516c548883bbe58a48d604e81e33b390986cdb6
> [2/2] arm64: dts: mediatek: mt7988: add dtbs with applied overlays for bp=
i-r4 (pro)
>       commit: d977b61d38030f50bae9f634049110af0a364d0d

These are already in Linus' tree. I picked them up because there was
no movement and he was complaining about the warnings.

Rob

