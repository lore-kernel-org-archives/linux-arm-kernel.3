Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39CEC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 11:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WqvtqUh1LHeQpHXN4IBNM8PORr3tuNK9976jM9larZM=; b=I5LQ/eP/o/G7yxqoP30OsGsuR/
	HDGmEiMmQ82iOXJflKK6ajWraLLAzctkqDovc0Tb77j11B8dfZ8Y73BDWga8SWcogEx5bYAmAyHre
	5I/w2/LVZE9+nHvMvme9EfqPENyCQ+5zYp2pQzjTvLXZcnVzzHr1AKB9yr3xfZf/LXDlvpSmkr3Zz
	CUSH3G/nvOskCSnC6tT2TdFquUHOPY2glC7AQgUQk6j7OOULPCltqrhdACrp7JPTlM2+nmKvqtGkt
	HBtRsEZxH5Dm9A9cNorYH+eTmEUyOTjsZtEg/Kx2nttxrje7q3j/NM0KKS9QzyfFm2NiKuuLFt0wL
	VElv/4tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Tq-0000000Bf0m-0C9A;
	Wed, 15 Jan 2025 11:22:38 +0000
Received: from mail-vk1-f178.google.com ([209.85.221.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1SI-0000000BeiB-2wNH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 11:21:06 +0000
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5174d53437eso3854908e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 03:21:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736940060; x=1737544860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WqvtqUh1LHeQpHXN4IBNM8PORr3tuNK9976jM9larZM=;
        b=bugANmdBUgaGy3spPeipd9TY7QqjfVSLla83mC7iw9EwAJ5MGykBhOPiw+Bdh1BP6+
         wTc6kwrjqE8zPAjctiAdgrjyIuhSl8j70mRQIhFYpDb3FKYPQHEhowDD38gJH+DuAeZI
         Xq56uKTV2gZJruIJPuWe4eA84EBcJPKQii7nFeksNEP9oAUyTNsFqrHn9v/gLs0j7tgx
         OsZWbv1ui2R193QYbtYia+W6wZgL3B6UfZ2OAuMFEg+THmmI8kv2QTipBYyzk51tJQDc
         mUKa39mS+FzF9IkYuS7lszDkYekuiK5uiFHExjvRibK0cyKIYv4rRcuY+TULVtlqdIPw
         4fMw==
X-Forwarded-Encrypted: i=1; AJvYcCXpks/ES83BoVCWFc1/6/1hhUEj/nxsXk+FNtkkku5F2e3blwGfVH42JbS7W88MEPFMs7NsVFJUd1VspVC+r2DH@lists.infradead.org
X-Gm-Message-State: AOJu0YzsCeQdv4nv3ptu82yvZ6+ZyI/RNaYoDTOvjY1bdm/+1NNrI3WP
	/zah3oPYDMP1uUWUiA4xWt9XnFCtcI58wqghM7B7BxJvRQFcj/YfiNzdnkfY
X-Gm-Gg: ASbGncsSvOvdTwZ2d/WonADVWhI/Ts2GqveLNpWZG0SOIAGNFDldCFvSDNfyuxc+JM5
	XMFeDepV7AorBnfetEAo+9Gb9FEDTntCSZU65xkgqH4BINM7/dcF4mv3qedaZLC29cS3PGo9jOQ
	Y3UEk3ToAUFC4y0Filb9Rmwvia6OmsqdJ4T0tgTrq9eCR2ZBp0M7sNXOPVOC30wuBLR2rEBXJmw
	QR5OmYBuv1rLi/alT9MDd/Nwi3ihSHnDKGStLz3SL3SvaS85+cnhX+UORuPytmt+UAHGX63Mo9k
	1a+6ceq2jBxUyQXv574=
X-Google-Smtp-Source: AGHT+IHBG0uYkBVYnKF+jR+YDW49bg7UJ/tTJxSiyiA9gvAsw8U/2loA2M6mZaIkgT7mMkSjyjZY4w==
X-Received: by 2002:a05:6122:318c:b0:518:a287:56e3 with SMTP id 71dfb90a1353d-51c6c304a0amr16564690e0c.7.1736940059526;
        Wed, 15 Jan 2025 03:20:59 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51c7fbd3a6csm4335200e0c.18.2025.01.15.03.20.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 03:20:59 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4affbc4dc74so3921367137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 03:20:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1jMUAyg4d88xYy+fa7v6iiA6qji84AhFFb2pLMB/U7SdhNIElMNJ9hjFt1rVaCCTq7xnIuQZ9ItvDfarbtHSG@lists.infradead.org
X-Received: by 2002:a05:6102:38c8:b0:4b2:5ca3:f82a with SMTP id
 ada2fe7eead31-4b3d0dd08b6mr25382508137.7.1736940058390; Wed, 15 Jan 2025
 03:20:58 -0800 (PST)
MIME-Version: 1.0
References: <20250109-dt-type-warnings-v1-0-0150e32e716c@kernel.org>
 <20250109-dt-type-warnings-v1-2-0150e32e716c@kernel.org> <CAMuHMdU=QR-JLgEHKWpsr6SbaZRc-Hz9r91JfpP8c3n2G-OjqA@mail.gmail.com>
 <CAL_JsqJNgxLgvB502Bk=5aMeP2rY6KVL_FykeSyN1tsDRXi9cA@mail.gmail.com>
In-Reply-To: <CAL_JsqJNgxLgvB502Bk=5aMeP2rY6KVL_FykeSyN1tsDRXi9cA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jan 2025 12:20:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZsQ9UbwVub=36P_2DCPEN0aORz9FxCbivKkOyeWkuww@mail.gmail.com>
X-Gm-Features: AbW1kvZXi5Smb2F45PP21ukpGGJBUJHR6GTKRuyvhrKiJT6HDjTDpB8juhwGWRY
Message-ID: <CAMuHMdWZsQ9UbwVub=36P_2DCPEN0aORz9FxCbivKkOyeWkuww@mail.gmail.com>
Subject: Re: [PATCH 2/2] of: Warn when of_property_read_bool() is used on
 non-boolean properties
To: Rob Herring <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_032102_743226_DD0E8AC5 
X-CRM114-Status: GOOD (  30.99  )
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

On Tue, Jan 14, 2025 at 8:19=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> On Tue, Jan 14, 2025 at 12:35=E2=80=AFPM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Thu, Jan 9, 2025 at 8:42=E2=80=AFPM Rob Herring (Arm) <robh@kernel.o=
rg> wrote:
> > > The use of of_property_read_bool() for non-boolean properties is
> > > deprecated. The primary use of it was to test property presence, but
> > > that has been replaced in favor of of_property_present(). With those
> > > uses now fixed, add a warning to discourage new ones.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >
> > Thanks for your patch, which is now commit c141ecc3cecd7647 ("of:
> > Warn when of_property_read_bool() is used on non-boolean properties")
> > in dt-rh/for-next.
> >
> > I have bisected a failure in secondary CPU bring-up on R-Car H1 (quad
> > Cortex-A9 MPCore) to this commit:
> >
> >      Detected Renesas R-Car Gen1 r8a7779 ES1.0
> >      smp: Bringing up secondary CPUs ...
> >     -CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
> >     -CPU1: Spectre v2: using BPIALL workaround
> >     -CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
> >     -CPU2: Spectre v2: using BPIALL workaround
> >     -CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
> >     -CPU3: Spectre v2: using BPIALL workaround
> >     -smp: Brought up 1 node, 4 CPUs
> >     -SMP: Total of 4 processors activated (2000.00 BogoMIPS).
> >     +CPU1: failed to come online
> >     +CPU2: failed to come online
> >     +CPU3: failed to come online
> >     +smp: Brought up 1 node, 1 CPU
> >     +SMP: Total of 1 processors activated (500.00 BogoMIPS).
> >      CPU: All CPU(s) started in SVC mode.
> >
> > Reverting this commit on top of my work tree fixes the issue, too.
> > However, I do not see how this commit could impact CPU bring-up?
>
> Strange. Perhaps the of_property_read_bool was inlined into some
> special section before?

I re-added the old inline of_property_read_bool(), but with a different
name.  CPU bringup starts working again if I replace at least one call
to of_property_read_bool() in arch/arm/mm/cache-l2x0.c:aurora_of_parse()
by a call to the inline variant, or even if I just add

    pr_info("xf_property_read_bool(np, \"wt-override\") =3D %d\n",
xf_property_read_bool(np, "wt-override"));

to that function. Note that that function is not called at all on my platfo=
rm.

This small change causes quite some reordering in arch/arm/mm/cache-l2x0.s,
so it looks like a layout issue. More analysis will follow...

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

