Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CE8C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 20:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGqF7J9hCkWnDPN2ywa1l4c3bPKUIJ2p39BiR4jVq3s=; b=QXKAMJEZJ2wM0Ufzf+kJ8I8pac
	0QTs3mat+yCtxa/vcPnGflcZ6KTdtp2c7sRUrr+IIcQ2TwdJX/sCeqCfYZhKBIA2/RJ5K2THIMC0m
	zroQYD0QunzOTLIFm0N+hcFviup3tllZbbgsTswAawx3sgGkkdy8WjyNmv0twhB14ujo+BvQ5RJ7k
	zfgtvf9oW+g0VnoJXEVgMBuq0UJwhfnbC411KuRpfMB5BAWG9r69/DIVbslIS9jIfWmRU8TSiFHdT
	FPLa3O2uKEiOLQKlpbOfYPvnvG4mzi0k0ukrru90TBS2CN3yOEECWUz2zXLdnKeBrjk2fjuZr+teb
	kXS86btg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK0l9-0000000BV5c-01Vp;
	Tue, 27 May 2025 20:18:51 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK0j0-0000000BV0b-2ItR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 20:16:39 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-52f298abd9eso2138387e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 13:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748376997; x=1748981797; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGqF7J9hCkWnDPN2ywa1l4c3bPKUIJ2p39BiR4jVq3s=;
        b=QaU7SfXV/xyeWGpvFjVVmWQcCMTDJz9vgqbvjQUzh5piEZiy02ddxSM5RF219FQmdX
         DKHpHTkrPfyvIUd//+Ms9OaSc95wpn0T89w2gn0TQDY9U/tuh3hOmMRRNDAAuGaLHs7L
         zkqQBBCLLB+GvjjVI6wtwhOYj7FwoyV39wV8+EfkrxPnkNhHNZ4f6xaQSPk+OUpnqE0q
         UkfTvwByMdDDs1S83SOrJe9DRtQIkwT28EQ5CTVo97gbpHWo4ngggM+U9EPv4UCuGf0I
         DAF+ncFIUEimzcqbttzR2VbrWRczOc5fA9IsSsHyWqO4VEXdPcHCnAsNkYyoo2af9h5o
         vqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748376997; x=1748981797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGqF7J9hCkWnDPN2ywa1l4c3bPKUIJ2p39BiR4jVq3s=;
        b=GsothCsD9qTeLGFSJpJg5bxe4tSVjqhdqmZ375uyl9BFsWfR43TE0HLFHzeGy6EnyB
         74ScigQvyfcDSwtGn1N4NE6IY5KfVfwZn/qsxjZtX/V1F/vXQ2EFzP0szqaNww9MqPkx
         x6eCTq16Bgey0JrKqS7WJU19P8sN8oX7VWvVmPIJi7606kbeiK88lw966GydRoIBMlFv
         MFfCcVrqTkGSrp92NpjV9IBMvkIwxPDgwIY8IqodTMH4ghY+BLZTMA0v9OSKZ7dGpSvp
         7gQhiTcUYgj7fDwEZztmYVNG8yHuJMev8ENfw1UdM7p+ean69eCUxRvH6d5ajRYQ+KMy
         RrNA==
X-Forwarded-Encrypted: i=1; AJvYcCU6SI7kiaMCFaj1sZDOCGXExlo3SLBr05yrq825GNTLIQxRJOuvSERv0+L7RLRll60T1U7y7Xp8J3ZJa34oLqYW@lists.infradead.org
X-Gm-Message-State: AOJu0YyJENyMlp1e6ZmkdOdlFjkGrtlFLANmrV9W6sSpU/OjdxPmctDb
	X31VrMUgckSPKVr8YtUXWRRchUhUA+TBqCbn8wzugqPdU498oOF7cXpbtgCrtm0chbkRFlEd5mf
	yM2/iReHex8OMiIXDQkQfGhmueUO6/3w=
X-Gm-Gg: ASbGncssa+5bfERqjS4/LGiuZaHNfw3PxWwwMfOT9wwUtMkbVgtK30pLOxQWORz3ZTY
	ERpfYq0FdsBe4OYIeUKtIHJPhaZjqZ+IEL9evzqWaA+W2zbQlpr1QPyPtRpxX61NF8VQ7R6BPUR
	1CeF+mvmwSeDo7sYiu5vgFBmMtE+bEu2il/w==
X-Google-Smtp-Source: AGHT+IETycDNDAJyxv3VLNHb+TIrTja35S1519qoE+Q/rK9pDA/sheHZNaSXrhFkGJah8hc3P6ff0SwCLKvwf9KpQ8o=
X-Received: by 2002:a05:6122:3d0d:b0:52f:204d:4752 with SMTP id
 71dfb90a1353d-52f2c5ca414mr12169837e0c.11.1748376997259; Tue, 27 May 2025
 13:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch> <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
In-Reply-To: <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 May 2025 14:16:26 -0600
X-Gm-Features: AX0GCFv4cap4ZOGqZcta-siDQMwW0SvAemE-pnT7ig2Oyj0apu2kFeIEsXbam6w
Message-ID: <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Furong Xu <0x1207@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_131638_587068_CC08261A 
X-CRM114-Status: GOOD (  28.54  )
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

On Tue, May 27, 2025 at 2:02=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, May 27, 2025 at 01:21:21PM -0600, James Hilliard wrote:
> > On Tue, May 27, 2025 at 1:14=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > On Tue, May 27, 2025 at 11:55:54AM -0600, James Hilliard wrote:
> > > > Some devices like the Allwinner H616 need the ability to select a p=
hy
> > > > in cases where multiple PHY's may be present in a device tree due t=
o
> > > > needing the ability to support multiple SoC variants with runtime
> > > > PHY selection.
> > >
> > > I'm not convinced about this yet. As far as i see, it is different
> > > variants of the H616. They should have different compatibles, since
> > > they are not actually compatible, and you should have different DT
> > > descriptions. So you don't need runtime PHY selection.
> >
> > Different compatibles for what specifically? I mean the PHY compatibles
> > are just the generic "ethernet-phy-ieee802.3-c22" compatibles.
>
> You at least have a different MTD devices, exporting different
> clocks/PWM/Reset controllers.

I assume you mean MFD not MTD devices here.

> That should have different compatibles,
> since they are not compatible.

I agree with that for the MFD devices, but we still need a way
to choose the correct one at runtime otherwise initialization
won't succeed AFAIU.

> You then need phandles to these
> different clocks/PWM/Reset controllers, and for one of the PHYs you
> need a phandle to the I2C bus, so the PHY driver can do the
> initialisation.

Well this would be an indirect reference to the i2c bus right?
I mean the phy would reference a reset controller which would
in turn reference the I2C bus right?

> So i think in the end you know what PHY you have on
> the board, so there is no need to do runtime detection.

But we still need to somehow runtime select the correct phy
which in turn references the phandle to the correct reset
controller right?

> What you might want however is to validate the MTD device compatible
> against the fuse and return -ENODEV if the compatible is wrong for the
> fuse.

Sure, that may make sense to do as well, but I still don't see
how that impacts the need to runtime select the PHY which
is configured for the correct MFD.

