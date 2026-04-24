Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CED0FB44C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 07:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLJFAArXCpjnjy9FT9OLaEJT/RIJF3bk06c131A7LVk=; b=bo3T1lbgT1mbfCV6FdVEofYazH
	kCINGcCCHaXeE6LJ7He5NZIJy2WSkQDtqIZzGZ5OeaYFEjGKgt8a4r4StYKVMCnmYJzAfaAQgfqZX
	ngppTH7fy0fgGTKaqj39fLl1Imd2GgwnunwyrSGOYpFvd3IruqVK6D+jhbGdQ0LUeLFhRQinkL8T0
	kVqIKbeUNldfU8GkEdg7D0UqqGrwaeG4dc9R0zq37MR+X2TbaonZ9rYxgnREWZ0QF5A74kBPMoiad
	j/SsoUjWlk+JAt6nqez8RohtW1SwjfkgfX8fK8ZMcvh8B9uWItJLwWyLFKYFM+2tf6bzd3D1bGoM8
	dz5OBANw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBJ6-0000000CpTT-2BbR;
	Fri, 24 Apr 2026 07:50:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBJ6-0000000CpTN-0fn0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 07:50:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E1746001A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 07:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C59C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 07:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777017035;
	bh=CNoygD0dv5JfT0nfE4Tj5Dbc6egyC7TCUBRqF/t8Ilk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TuldJeKdeaItWj2xl8/CEwnIwukeELht3ZfAHclYx6lOlwUx/g519CGLzHHItpNGl
	 ullVSRtf9+R7zUV1Np7bDCTtHodQhkQvy9Kv3h2dC5omUD2sAASbxwdPzrVfiqjjmd
	 lAktCR4k60i39gmih/EjCWXaIud3f9NcQTVCXzPplfRoROl0um2iYuZV4KHoO9HRlc
	 KFfgy1nMP5hKlpNh7gH4rTlLJoMOthQPc7cpfNWmtBc8Va6017z1ZV5iVSulj9vZ/9
	 Mqj3iqGi1aTPFMXRWs9WSwjtirGtS61azOfyjLub8J8X98BKLqpbhVBWud0dD8M6MP
	 rt+pf8jRd1GUQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so7364690e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 00:50:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/GF8mO5czFYHSIlANLbzoTZy0M1u8dxj+eW4UzCxhce6uqBNIEgq0bqDzTLdiel0uo2lid+Ek5WFW6QxhdqvX5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2U8v7KbAqL/MIDjSsVleYwZ74W601c+pecTRlgPk1KXt/YWkl
	+/zqY6VNA+uvIkZSPzi59bPCm4ImOo5ZATOQoC/hgOa4lu1iLIq5EJSic2oClKm57hO1AsWWFMo
	+lGcWR6GfQYQkydyTYhyWCaZPYg7xB8Y=
X-Received: by 2002:a05:6512:3d27:b0:5a2:b3dd:7a74 with SMTP id
 2adb3069b0e04-5a4172e7af6mr11159656e87.33.1777017033724; Fri, 24 Apr 2026
 00:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260423111956.185761-1-ruoyuw560@gmail.com>
In-Reply-To: <20260423111956.185761-1-ruoyuw560@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 09:50:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLkg3L=QJpiBzRR57yohb3LSBXgz1wXXCPcdwdNb=rg_xg@mail.gmail.com>
X-Gm-Features: AQROBzDoZz6qn_4vxmisrCCvKwCV3z7zWOcAxXt_ce1FEO95eQ_iWMXrWqnkSa8
Message-ID: <CAD++jLkg3L=QJpiBzRR57yohb3LSBXgz1wXXCPcdwdNb=rg_xg@mail.gmail.com>
Subject: Re: [PATCH v2] crypto: ixp4xx - fix buffer chain unwind on allocation failure
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Corentin Labbe <clabbe@baylibre.com>, 
	linux-crypto@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>, 
	"David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

On Thu, Apr 23, 2026 at 1:20=E2=80=AFPM Ruoyu Wang <ruoyuw560@gmail.com> wr=
ote:

> chainup_buffers() builds a linked list of buffer descriptors for a
> scatterlist. If dma_pool_alloc() fails while constructing the list, the
> current code sets buf to NULL and later dereferences it unconditionally
> at the end of the function:
>
>   buf->next =3D NULL;
>   buf->phys_next =3D 0;
>
> This can lead to a null-pointer dereference on allocation failure.
>
> If the failure happens after part of the descriptor chain has already
> been allocated and DMA-mapped, the partially constructed chain also
> needs to be released.
>
> Fix this by terminating the partially constructed chain on allocation
> failure and letting the callers unwind it via their existing cleanup
> paths. Also fix ablk_perform() to preserve the hook pointers before
> checking for failure, so partially built chains can be freed correctly.
>
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>

Essentially I think Corentin & Herbert are better at reviewing this code
but it sure looks good to me!
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

