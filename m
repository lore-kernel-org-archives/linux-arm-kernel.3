Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CFDCA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6P+spmMmmlUm27GqFei7PSvg2i8zHuoJmMtTND1pM0=; b=b0t4L8jKpyyTYLCXdL5OJ5cAEd
	WlBy6GIkqLfKQ3XE2jLlAIZwqTmCmvPUEg5RwlOS+EwONzdacTk3+iCdDoAtY/9v3R7RqGCcv8nF8
	+VAhEs6ErHj+//6rxObo+2booeO6DN+8KjtImLrZstXzWZc/k9IccOOCpNOiLJspnS4T7NcBJRRIU
	bkTmhoi9puVBSneKLWRpz3h9ihZ56+LSM4rA/V8yS3Caw7pG/KTyfUowusdqWsnxMR+Us9WQsOa+u
	wjT2thjYFIK3+U8Sjjah5gg9SHQ9YG/TtUAjBaJjSo3e9Z9z/udw+yj8/GFf5k2joe+A7gTD7M9Zm
	M/OUUxMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPs8-00000002JvM-26Mt;
	Wed, 07 Oct 2026 11:31:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPs7-00000002JuJ-1ykY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:31:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 984DD60219
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4801F008A2
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791372702;
	bh=g6P+spmMmmlUm27GqFei7PSvg2i8zHuoJmMtTND1pM0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jC6/zyQh9ODKwfOcpqoO4mtMRkqQMCJucyGcR6GXptshw+GURUSMyeBn4lWmiWa2U
	 BrNgESCGY3cr2zlNEAYXcMTZYJrHqNr8puETHH2U10uupAiL2xaNUQPxsilMLUrFH8
	 fK9Lle9Cz/efba9vdUYtTMM8+jXYxJcisfNF0CX4IlMgfOLYOHa4QhFjJ8f+BgObXh
	 N/GAfqt6dKc8Fcd24DzzHIhf8ymAvi1a0Xol2sg2z3m2GS+fLkSdxbeUCtGAyXQItN
	 twPEegs6RvVfhosT4JI4Mxg6Gr7EmB35d/FYY/fy8jLVkOJkTuJSUfAyTOXCuKJhub
	 CYEDbfTkKX84w==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-46556b9e02cso1351914fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:31:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxz/UxHXi9xuCf3/rRS+SwCDJ1EmiZ092tqw5bcGs0XAEt4fBRCqHO0mitQ/fbQkbYbQX0U8DcAgTxPTXRhffML@lists.infradead.org
X-Gm-Message-State: AFq9FYJyGVIXLNTTqjRoUA+6EzxF5u8+Dhx6uOeMDIe31H39XznhwL85
	iKX1v98Sg5XS56s+ngbqeRQdmair8ztTNQKoYhLuNouCv7x7OQOiZgNVRTdb3lskRcTI8WGsrSe
	1xyFC5IUVd1hvhhd3v8LaDHahUntaFog=
X-Received: by 2002:a05:6871:7d8f:b0:48f:e0f6:bd4e with SMTP id
 586e51a60fabf-49f4f0b8d3dmr3544055fac.35.1791372701659; Wed, 07 Oct 2026
 04:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260925-mt6735-pinctrl-v9-v10-2-cc042983c565@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v10-2-cc042983c565@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:31:26 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Lf5NQh1s543XS6ZMTuV6dKD1ebVJYcHcQjvLN2sv8jQ@mail.gmail.com>
X-Gm-Features: AclHuK91yzMdnow7AVBRSKC7FQKTFDXkxwc5yS2wNsCnGspgKIcoIoO9YB0evBI
Message-ID: <CAD++jL=Lf5NQh1s543XS6ZMTuV6dKD1ebVJYcHcQjvLN2sv8jQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Improve pinctrl subnode and property descriptions
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Fri, Sep 25, 2026 at 8:53=E2=80=AFPM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:

> Change "subnodes" to "subnode" in subnode description for better
> grammatical accuracy, wrap all descriptions at 80 characters, and remove
> literal style indicators from descriptions that don't need their new line=
s
> preserved.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Acked-by: Rob Herring <robh@kernel.org>

Patch applied.

Yours,
Linus Walleij

