Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3EDC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 11:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCWuYRG63599CeGL0cu+BIdFInFPtoPb0KezmWqBc2U=; b=wtoxpSyK48jLYvIZ+rmbWv8gBl
	g8QSM3w1y+X45dXVWlTD/rHAeNXPQWuwzrvNoUqG45NnZzd0+p9RXZkQLoIPxPhgMDdsDGFKlOk6U
	BIzjjZd7VJjp8Qa/4wVKTRp28HkkaiDNJy3UB6vCZJWd/GhC5q+Gi7WSD77yC/H8MUfP6zfOqgvpl
	YdZywg2shv6q+tJPegz+hJ2qemd17CKB6M56LDLnojms6M60vilSmhTnZsVWTtIXQQpxfZXPIkQio
	U8hn5qrFQ+sYtXuGii5MtCBy/rT5QaooUo0Zf+TeuzR2t46ssFwOong8ycn4qjOl6Wov8tKQxTZJ0
	VhbWDYeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXfX-00000004o8I-0Kfi;
	Wed, 23 Jul 2025 11:29:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXd7-00000004nxX-00fT;
	Wed, 23 Jul 2025 11:27:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E1A46000A;
	Wed, 23 Jul 2025 11:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6568C4CEF5;
	Wed, 23 Jul 2025 11:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753270043;
	bh=hD86L6FsrlkjppEeAolQw2+wF9G9eL2p4jeufpqBKxk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SUdVHNc/aWpcFyqi0c/ImfOYjRQUiFP+rK1f80HK+AmhVgduX5msiRWhEhg1s+hiW
	 s7V5fsU/uhIBFeKySwzuXQ9BfdxVoYhid9ufOAKrdUj+5KF33m3lRUe8oxf0Cwfa3G
	 PAj6KQ4HGDysGEzUeqbGoXcEsGrTE+WGU8uiIskXtyhHc5ZVmHBzSVzbhah+PdKtkJ
	 B6bYI7NyCgjopp5nxtJIfyi2MQl9rYFcv0L6MFftn+yL2G/Azg205ACyhpuudVcnZK
	 Tw9kNx5J4K7v3JXj2/qR5a6ofMcynO7+qNQVdxzBIuF42MddOCjUhYN2cf+cvhsSyT
	 WFbNCzvSwVVDA==
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-615df2e8c27so1827056eaf.2;
        Wed, 23 Jul 2025 04:27:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdCmIcWioTq1EB+1IsWHMigfIVMOiQhe7XsdI9RpBxHh9C2lw3FIVAomO/cHZwPhcNAH987mAHGnK6QwE=@lists.infradead.org, AJvYcCXCGicThOq/26DLdKOgogVq8eD2S3SzJjFedyGBoyBcL7G5h4NbUJvF7aoATMwpckMPZ3ijGYa1D4doxhN8s7Fn@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+4FxfqPRex3Aa7zFs9t3XkidYA3XmAsAWhFkUi9MYPooARZQM
	xzEFHmeh3cGcMZeUWFBvFo1uSAF1m4TZU0c9hN46zzWq5k9ll5VbYuYL81LfvhrECo1bHrYrfhB
	hJMvX64vefDdbONMxf+mEPaNI1QQxMQg=
X-Google-Smtp-Source: AGHT+IFBBrTSzcKsgRsjEmVEi3AQj37BeFlkMYzSpLg5VvEYvowlyBOnql/yOqAWuu2WwDYjxLgaMwyjRGbr4TyyCQA=
X-Received: by 2002:a05:6820:1792:b0:615:d742:6672 with SMTP id
 006d021491bc7-6187d90ed5dmr1918110eaf.8.1753270043105; Wed, 23 Jul 2025
 04:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
 <2025071716-phoney-object-1648@gregkh> <rzbzah5iigz25jtxyqadnitkzkazxsaxntajhlfrfdslyioevk@pylcjkfh5n42>
 <2025071919-patience-cattishly-cf7c@gregkh> <l54i36uk33je744w4f47tehdopk5dsjotvozfv5b2hehmxrwpq@eins7awyq4dy>
 <2025072218-decipher-spree-327d@gregkh> <awvdox3bgabbc42aamezlg33k4cje6y75qoxn7ruh3nhd4qv5n@u3spdahehad4>
In-Reply-To: <awvdox3bgabbc42aamezlg33k4cje6y75qoxn7ruh3nhd4qv5n@u3spdahehad4>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 23 Jul 2025 13:27:09 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iYBOephv29sj0DSKZVyF3JLBsoUCckhTbGcbYHUUhYyQ@mail.gmail.com>
X-Gm-Features: Ac12FXzC6e4YCoK78tnnsrW1OvCOkcpvLKri7HC2f5clbN5j5h64RJlwkH_QRPE
Message-ID: <CAJZ5v0iYBOephv29sj0DSKZVyF3JLBsoUCckhTbGcbYHUUhYyQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org, 
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

On Wed, Jul 23, 2025 at 11:01=E2=80=AFAM Thierry Reding
<thierry.reding@gmail.com> wrote:
>
> On Tue, Jul 22, 2025 at 04:08:09PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Jul 22, 2025 at 03:56:40PM +0200, Thierry Reding wrote:
> > > On Sat, Jul 19, 2025 at 08:52:41AM +0200, Greg Kroah-Hartman wrote:
> > > > On Fri, Jul 18, 2025 at 03:49:37PM +0200, Thierry Reding wrote:
> > > > > On Thu, Jul 17, 2025 at 02:11:41PM +0200, Greg Kroah-Hartman wrot=
e:
> > > > > > On Thu, Jul 17, 2025 at 12:32:34PM +0200, Thierry Reding wrote:
> > > [...]
> > > > >         struct syscore;
> > > > >
> > > > >         struct syscore_ops {
> > > > >                 int (*suspend)(struct syscore *syscore);
> > > > >                 void (*resume)(struct syscore *syscore);
> > > > >                 void (*shutdown)(struct syscore *syscore);
> > > > >         };
> > > > >
> > > > >         struct syscore {
> > > > >                 const struct syscore_ops *ops;
> > > > >                 struct list_head node;
> > > > >         };
> > > > >
> > > > > Is that what you had in mind?
> > > >
> > > > I missed the list_head, so yes, this would be better, but don't pas=
s
> > > > back the syscore structure, how about just a void * instead, making=
 the
> > > > whole container_of() stuff go away?
> > >
> > > Yeah, that's a possibility. I personally don't like passing the void =
*
> > > around because it's easier to make mistakes that way. I also find it
> > > unintuitive because it doesn't immediately show you what the function=
s
> > > expect.
> > >
> > > My understanding is that the container_of() should get optimized away
> > > most of the time, so there aren't any obvious downsides that I can se=
e.
> >
> > container_of() is just pointer math, but a cast is even faster :)
> >
> > > But I don't feel very strongly, so if you have a strong preference fo=
r
> > > void pointers, I can do that.
> >
> > That's what you really want to have here, it's a syscore data type
> > thing, that the callback wants to reference.  Just like a irqrequest_t
> > function passes back a void * that the handler "knows" how to deal with
> > properly.
>
> IRQ handlers are different, though, because you pass the void * data
> when you register the interrupt. That void * then gets stored and passed
> to the handler when the interrupt is processed.
>
> We'd have to change it to something like this:
>
>         struct syscore_ops {
>                 /* parameters now changed to driver-specific data */
>                 int (*suspend)(void *data);
>                 void (*resume)(void *data);
>                 void (*shutdown)(void *data);
>         };
>
>         struct syscore {
>                 const struct syscore_ops *ops;
>                 struct list_head node;
>                 /* NEW driver-specific data */
>                 void *data;
>         };

I like this more than the original, but I would do

struct syscore_ops_ops {
                 int (*suspend)(void *data);
                 void (*resume)(void *data);
                 void (*shutdown)(void *data);
};

struct syscore_ops {
                 struct list_head node;
                 const struct syscore_ops_ops *ops;
                 void *data;
};

and change register_syscore_ops() to take three arguments, the struct
syscore_ops pointer, the (constified) struct syscore_ops_ops one, and
the (void *) data one.

Note that it is not necessary to change the signature of
unregister_syscore_ops() in this case.

> It ends up increasing the syscore structure's size, about 33%, though
> given that there aren't a lot of these that's probably negligible.

That's not a problem IMV.

> What I think is a bit more unnatural about it in this case is that we
> embed the struct syscore into some driver-private data anyway so that
> it becomes per instance, and then we have a circular reference:
>
>         foo->syscore.ops =3D &foo_syscore_ops;
>         foo->syscore.data =3D foo;

That depends because "data" need not be "foo" in all cases, but also
see above.  If the initialization of struct syscore_ops is all done by
register_syscore_ops(), it doesn't look circular any more.

> Which looks kind of weird. Alternatively I suppose we could completely
> rework it and make register_syscore_ops() allocate struct syscore, and
> hide the internals from drivers completely:
>
>         err =3D register_syscore(&foo_syscore_ops, foo);
>
> With that it may be problematic that register_syscore() can now fail.

Yes, that might be a problem.

