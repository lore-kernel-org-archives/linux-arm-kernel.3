Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABA8FEFB61
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdCPwqd3I1Oda3Lh95ge0A49tYvELGgPEvmK4+J0ABA=; b=JzezQOrtF0YJDff+Q9ZqG6L7FQ
	ZwtHijk7k3fOa535eL6vRROoCYgN+DPxser+TUXjTlpbjSEd4X0Mai12i8Mp2Q1tal6rNTpybuxz1
	8FNWzbbNtI9OcSZ9u8Ars4zi94KTKriIRpzAB2JaplOCJDIgpvvru9ZfMw3oKZkKb7L5PrnorHhKt
	qZLbx0TTIsha/Nz3M12u/aXOx9RFcZDpOyJOKi/ITzUzBMhbNUPCaciM2VxA1VTHhRnzV+rpWzNCf
	mfinhbQWGWEBdKNl6WmwhmFjEFLeSeOIxApZP5BbtHmHQn2h9HYe6jls3WhPA0Wf5+x+pZGC69+Ug
	UUCk6rRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzz4-00000008foq-2plA;
	Fri, 27 Feb 2026 15:42:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzz4-00000008foM-0tUz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Feb 2026 15:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sdCPwqd3I1Oda3Lh95ge0A49tYvELGgPEvmK4+J0ABA=; b=Qtg5HEMM4Vw2rXp0fJKMdSbj6g
	qhx9YY43ovCuZhPHvSuyCchc7eV/s8AqNcXUoE+BKg9P1u6z+uQ6ah+VU3kxzRqS83CPlW/780n0J
	IeRVbb08cgO2m/7B/dzb1/kJWhuFJ5X/b57HB2hivBG2eqA0nTNfmHBtnfBXRso3R7+OilppKmktK
	9zXmksxckk19IuF0USlxOhauEe5opBLszL30iNxe/jmeUvvRCP0YUkpUAmF+mtAu2KeAEWyFhJXXT
	AIvrG6w5anB66KrSJY9BOlInamebyggDQlJW/BeBx7HnE3YacNMRTNAiOeGF05KPQwbOMsStZYhxR
	fRxAFQug==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzyz-0000000DPET-0Qf9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:42:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D47144423
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 15:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D3EC2BCB5
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772206943;
	bh=STzTxb6AkecD0Oj2uXWbAE7smRP8JD9AAxkR2Qux/Sc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LBGFhqUBtQI9BbpwK46VoHQn50/6CaY1vQ5PIc4y5spoYCP25Jf0LROem1fHBjUy4
	 yeI4JK9t+VAFfxsB/FRVdfK2qMAp7BaBH+/oWL+LnHZG992H0B/CcnUUAoiNPkt5su
	 u377zsPtAQxl/Qcm2oYsywZEuG0OqtFcTLP7OjoWey7QG/JHyvrV4iN6xZaOIqUa06
	 vfJFlrWT+r202v79WRMwFVhTxOamgJ/igAb5KSIJ4HqzNmfDIAyq7QGRarn4/4y6Qh
	 NxQCbSDcfMyB0gb6ik4hp18xL7FM5BoFy0P7SgHelPVuHedFnta+qYHiFlGS3xx2xF
	 pZng7DsL48SLg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38700168abaso27670921fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 07:42:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVBPuu709cV0xobh+i6YxEXNp1Wj9qrA1YpyFA9uPOYkzAF9MhgCXS6ikXf1Jx5kAldoNdvXanqxdDVGmP8rhhK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9AZQxysmo8XK190ofmQ2FI81Az9KOUgyO1YSZ4CgBPmLtZhwN
	LcMYdIQ1FV5r5LOJ1CJfxiXSvmMo6Z4lOEl3m4otbySPXvfjU5mwZ2AR+QCU+VWZEaaHpdqZOUD
	DhwgoTDN9BKJNmQEw6uN3Kz5106wxF4yf88kRQLkGfA==
X-Received: by 2002:a05:651c:41d8:b0:384:9b92:c5b7 with SMTP id
 38308e7fff4ca-389ff143720mr18998801fa.15.1772206941514; Fri, 27 Feb 2026
 07:42:21 -0800 (PST)
MIME-Version: 1.0
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <aaFcs1miP88QWmtH@hovoldconsulting.com> <aaFfEsfh0xTh0b1y@shikoro> <aaFsZbiLYSz_YEjw@hovoldconsulting.com>
In-Reply-To: <aaFsZbiLYSz_YEjw@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 27 Feb 2026 16:42:09 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
X-Gm-Features: AaiRm51scY9nN4P8ovfss040XTmsPoSnyMQYg9QuZyNCyHcgWecCdT1v9mdLWqo
Message-ID: <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Johan Hovold <johan@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Khalil Blaiech <kblaiech@nvidia.com>, 
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-actions@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_154225_599046_EF9ED008 
X-CRM114-Status: GOOD (  28.97  )
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

On Fri, Feb 27, 2026 at 11:06=E2=80=AFAM Johan Hovold <johan@kernel.org> wr=
ote:
>
> On Fri, Feb 27, 2026 at 10:08:34AM +0100, Wolfram Sang wrote:
>
> > > Wolfram, I noticed you merged these last night. Please think again an=
d
> > > let's discuss the end result here. There's no question that there are
> > > lifetime issues in i2c, but this is not the way to solve it.
> >
> > I did think again and do not see a way how the life cycle problems can
> > be solved while drivers happily access the device struct of the adapter=
.
>
> There's nothing special about the struct device. What matters is that
> drivers don't free memory that's still in use by the core.
>
> > Whatever the solution to the core problem is (revocable, custom SRCU,
> > something else), I still think this step is needed in any case. If I am
> > wrong with this opinion, please enlighten me. Pointer to some existing
> > thread is OK, too. I didn't have the bandwidth to read the revocable
> > mail threads.
>
> It's not even about revocable or SRCU, that's just an implementation
> detail.
>
> It seems all that is needed is to decouple the struct i2c_adapter from
> the driver data and have core manage the lifetime of the former using
> the reference count of the embedded struct device.
>

I feel like we've discussed it already under v1 or elsewhere.

This is a weird pattern you sometimes see where a driver allocates
something and passes the ownership to the subsystem.  This often
causes confusion among driver authors, who logically assume that if
you allocate something, you are responsible for freeing it. Since this
is C and not Rust (where such things are tracked by the compiler), I
strongly believe we should strive to keep ownership consistent: the
driver should free resources it allocated within the bounds of the
lifetime of the device it controls. The subsystem should manage the
data it allocated - in this case the i2c adapter struct device.

I know there are a lot of places where this is done in the kernel but
let's not introduce new ones. This is a bad pattern.

But even if you decided this is the way to go, I fail to see how it
would be easier than what I'm trying to do. You would have to modify
*all* I2C bus drivers as opposed to only modifying those that access
the underlying struct device. Or am I missing something?

Bartosz

> Then you can use an rwsem, SRCU, revocable or something else to handle
> devices going away while they are in use.
>

