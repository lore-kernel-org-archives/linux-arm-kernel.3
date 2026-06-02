Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB21C5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 09:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHDgS8AMhT4R95VWt+Yyv0IendpljPix7abNFklWbL0=; b=GFxZWNIFFhhH3xlujHu7M2oniT
	Do3lTqydYZhgUjCR9I1eLOolwUoOzfEFhjx8oC4ajN+HHtG3XjGFTSeByHMoVD1K4THHlCwecnxAy
	4ZU+YbL4460QOkFnCHjtHSF2reV8HSUYwvvCko6Yp9aLWVNcAaaKBknDoR3Ds0D1+OegyMATZ9E8t
	WrrLcQfgvKX+iT4y8DGLusNwXJS4hqH1kReZn2GqL6ei6FMVOqRs4X4oVPbf00jSOd7eET8MfRN1P
	5DVCkNNnK52UqHvQ8EZNNI5woTns8tHpq+vYFsDgeQQi3COAuRlj0XI1Jz8LQ3tIy1kbQM9YQ2YKk
	eU/AX9ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKz9-0000000CcH6-0ijV;
	Tue, 02 Jun 2026 09:00:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKz8-0000000CcGk-08FL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 09:00:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7771F6001A
	for <linux-arm-kernel@lists.infradead.org>; Tue,  2 Jun 2026 09:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30DBD1F00893
	for <linux-arm-kernel@lists.infradead.org>; Tue,  2 Jun 2026 09:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780390829;
	bh=FHDgS8AMhT4R95VWt+Yyv0IendpljPix7abNFklWbL0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CwFpFOlJSZDYsWyc5MnOra61cEb7iNH6oNV9Or6XaDikLzEZz45m3BwF9TsIsvt+N
	 7Ecd7gfoz7XnbYshQbKUZMV0DLzylwhmMqvlHoYwtHS8jbxBs5+qS9fcge01TOs+10
	 x/jnermS3EhLM4RCXfcCgnA8L1pTD+tXSRcQLEQHv5UOkUNFcMLQpvKtR1uD/ImgVR
	 0YLlIwr804Gxv4E/NXGZqbSl3Opz2PWe03k+xMccwgpmmocdO3M7G03L3faHjiQ6aL
	 8OmdNGA07Uvgg853nyKfAfr2P0m8NgXFIuSNivt0gwZk0V9XiObzVFeugYXlP7lswl
	 xJYL/1lrLmr3Q==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3966388b388so32065671fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 02:00:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8By2LuJF523gMg7JHklt3hWf40Ng9JTxZFSPFblskwG/+r92ws+strrntKzQiGBgmOAF78ifLN6yp6won7ps83@lists.infradead.org
X-Gm-Message-State: AOJu0YxTiS59eZ3TSnuwtgh0tChp96QZ2jiJ7ZAvTXFiw/kMc02FeIK6
	jtwn07N4wQoQHGlUSnQ3oPfLWIYiqedbZzw2YOISJxuEfjazgGs1XmJuTcW6YLCuhNJMralzHry
	yGj4rJGwmBy7B8xVYzkQjkj4SEkhVTxQ=
X-Received: by 2002:a05:651c:b2c:b0:396:a647:76f5 with SMTP id
 38308e7fff4ca-396a647a3cfmr3186821fa.5.1780390827982; Tue, 02 Jun 2026
 02:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260531020843.594892-1-rosenp@gmail.com>
In-Reply-To: <20260531020843.594892-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 2 Jun 2026 11:00:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLn9f4DdKp7Hwrfeaq0KhCNYXEjOs8+h7tyJMDNKUxDxXA@mail.gmail.com>
X-Gm-Features: AVHnY4LUYkGkjiqMzJmXJD25YPum2COv0RcAhRJ5_yU8NcSILWYb3quNRFCF5Ls
Message-ID: <CAD++jLn9f4DdKp7Hwrfeaq0KhCNYXEjOs8+h7tyJMDNKUxDxXA@mail.gmail.com>
Subject: Re: [PATCHv3] dmaengine: ste_dma40: turn d40_base phy_chans into a
 flexible array
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, 
	"moderated list:ARM/NOMADIK/Ux500 ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
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

On Sun, May 31, 2026 at 4:09=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:

> Convert the separately-offset phy_chans pointer to a C99 flexible array
> member at the end of struct d40_base, and switch the allocation to
> struct_size(). The log_chans and memcpy_chans slots continue to live
> in the same allocation immediately after phy_chans, indexed via
> base->log_chans. This removes the hand-rolled pointer fixup that
> recomputed phy_chans from base + ALIGN(sizeof(struct d40_base), 4).
>
> The ALIGN(sizeof(struct d40_base), 4) requirement is met implicitly by th=
e
> C compiler when using a flexible array member. With struct d40_chan
> phy_chans[] as the last member, the C standard guarantees
> sizeof(struct d40_base) includes trailing padding to satisfy the alignmen=
t
> of the flexible array element type (struct d40_chan). Since struct d40_ch=
an
> contains members like spinlock_t, pointers, and struct dma_chan =E2=80=94=
 all with
> alignment =E2=89=A5 4 =E2=80=94 the compiler ensures sizeof(struct d40_ba=
se) is already a
> multiple of _Alignof(struct d40_chan) >=3D 4. The struct_size() macro the=
n
> computes sizeof(struct d40_base) + sizeof(struct d40_chan) * num_phy_chan=
s,
> so phy_chans[0] lands at a properly aligned offset without needing the ma=
nual
> ALIGN.
>
> Assisted-by: Claude:Opus-4.7
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

