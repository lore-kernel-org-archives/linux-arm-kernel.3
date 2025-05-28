Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DB9C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 13:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DM2QbUzIiVq1oAO1zYgkeLSN01UQu1uYF+2linnaY0w=; b=p4asC/mjxkeLJzXMTjVgMrMUjH
	SB11GTkmr3bl1vvKbKjlm4J4LmUFPJ+rVQdi9EKmJ4clUnScMyNCZKum2S/9dXvCKxZXvmvWMbite
	kywnUWxU6r/wwp+F65CCA50mRVCgRfyYvU3XVXbwydMpj2ZxPHkLTdf9075vJiNw9YTLnYtZSWe46
	+ZF9lF2JSSXShLgl59buFWOShn2/Bu3mCYlNWfhUzwpxF8g13nKOR8Hb6qGEwNfXQBk1QdFYFEUAi
	KrYrh9evvua/9xkLCI7LESeDK3U5NpqYujG/bE71R5gVa5e/76Sd77Eo/UqbblP+D1g9092vxbbfk
	0JC+QbsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGSF-0000000DC4U-2JTQ;
	Wed, 28 May 2025 13:04:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKFQv-0000000D2Ji-3Qvr
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 May 2025 11:58:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=DM2QbUzIiVq1oAO1zYgkeLSN01UQu1uYF+2linnaY0w=; b=qxhJCwWsQn4wQsHKKN6zZuE6Pt
	Uy5XdjX9K2NIwgo3ZgtzWDdmxXxyVFO2kBOzfbLlQFJLxZPA3kLogJDtCK5A/wGdl3Wff8WxtX4Xf
	fpLLjcsCQ57xnQmtI/3viq9hNnXh5KrAvdX0WrzxakdZhpxxlXIllUjkSEt4GFLsKF/I6jzTyU9v9
	lXFWr6CAROsr2FcBJIvq7ZCOAn616ruC8LCHCvsj3Hf8mve3PSERXVc0MjXfyCr3BJcvLfLDVRP28
	/Xfj1qk+xrQmLruU7jIDRaz7hpr92+Qa20FljMwGZd+LcfuS4KRn65waLhcRda5erl6ZKyLRxugzv
	7GN+5PQQ==;
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKFQs-0000000Dabi-2GXE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 11:58:56 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-4e45cfc3a26so490092137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 04:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748433470; x=1749038270; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DM2QbUzIiVq1oAO1zYgkeLSN01UQu1uYF+2linnaY0w=;
        b=LgcG7CZY4Js4BP3QE9wgs69dbCHu9ztR5FlUQVyOqC4Qn1rDTxodCYNR/fvA8s/72u
         rur0ekRfnCk+4yDnr3KBMWxqJXEWyzaFFOLjYeyrO3Bh8alZK6accP1Pb4yN7ea7cMIO
         5v3b/UoVT/YlxNL1UmEBBfjT3hDStnxWli7n7Sod2NgvV5LYy7LIzSeVNU2v+2Kji4D5
         Y0LfKh15oEQcIMxkvb/jW1Tefce8O5PncPZG5O0c84WvvEzix4ubuAAg87jVl6eto1+N
         1YpRtx9/tYQbeACwTcnzwPCb+vMEXpkG3zWRqL4Qa5A0kKvGpiObY3VR/mDsbj9cxhb2
         pgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748433470; x=1749038270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DM2QbUzIiVq1oAO1zYgkeLSN01UQu1uYF+2linnaY0w=;
        b=iokmjmXrQqCzCnIq3nMEIqCNXxdepMXDmBm0RPg0wQ7PcjrJ1f6keY+JbdmEESb3XS
         DlunSgYkeNJbYXE/1aaPix1YEJEJDJEbmHseTBGCaq813lWDSjPtDJHpcSlK+9MzxIOd
         K2vf0u9z2QNkyEED9RY5Tuzw1DWHLKJznz8gqO1hTykI1GH16WUa1J1MwB8neVQ14goj
         LnHMkJ7n8uWNIoQ2r3dKF3Wx94TJ3fgI/Dv3gfM35IEF8reAaE/CB9dTJ/XELIg5UjMO
         4qVaS+ByfylYtZr1GjBIXIcT0f0ltE6pdTObnRFS3lF7Ry5Q6LelW2Z8s/Dcr/lPNJ0I
         ReNA==
X-Forwarded-Encrypted: i=1; AJvYcCVOG60CsyzTps4OTpxS117jBoaNI+IfKSgzZ3wE/vA3i0FDkwO7nqqY8JVMQ3Wk2sVAp2q2GJ1gM/kSrmYFQY48@lists.infradead.org
X-Gm-Message-State: AOJu0YywCjDfZttONAsbJDoQRHXpXAmE+dURrvCVmQsjfnyzgTvhkYWY
	unR9sgAVModZxNkUIWyEvT7wnPRdE9QPFze/ZyDjNVY7IwWCKl9IPRsAcbOyUX9RxVls6TNkkUM
	3oRUdrDSQdmcMLGRkMynVWK2SztsIZes=
X-Gm-Gg: ASbGncvJw2JUN/i8zh3/YhxXTXv352pjetGnBVsFH2fDTkaqznJcDs8qoyu0hs7wky1
	iuzJaOSOsuZiq4znZLd2rMpz5Ji3P69h5OM7RxywTXSJnyvJqJYfmt3rVufOXvxDFKsazbrGDp7
	jpNarfLGGwTMQZvCQ0I3S1kt3ZMXR0WATWpg==
X-Google-Smtp-Source: AGHT+IHccZ6u3wYBlr61chnbgjUWRM+9FVRKkSPAvmULH6YUlgEgMZxUk6AOBWwMA6JVLhM/7o4896YpQLK4HFLW4VU=
X-Received: by 2002:a67:e70d:0:b0:4e4:1d6d:56cc with SMTP id
 ada2fe7eead31-4e597dee6afmr4608606137.12.1748433470075; Wed, 28 May 2025
 04:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch> <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch> <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch> <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <aDbA5l5iXNntTN6n@shell.armlinux.org.uk>
In-Reply-To: <aDbA5l5iXNntTN6n@shell.armlinux.org.uk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 May 2025 05:57:38 -0600
X-Gm-Features: AX0GCFvRg1G8o6RHpRasEA3gbglv1Max4m9hoMAbkTOqRd30AqyfzVMQn3V1-wU
Message-ID: <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Furong Xu <0x1207@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_125854_594413_E61E11DF 
X-CRM114-Status: GOOD (  25.16  )
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

On Wed, May 28, 2025 at 1:53=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Tue, May 27, 2025 at 02:37:03PM -0600, James Hilliard wrote:
> > On Tue, May 27, 2025 at 2:30=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > > Sure, that may make sense to do as well, but I still don't see
> > > > how that impacts the need to runtime select the PHY which
> > > > is configured for the correct MFD.
> > >
> > > If you know what variant you have, you only include the one PHY you
> > > actually have, and phy-handle points to it, just as normal. No runtim=
e
> > > selection.
> >
> > Oh, so here's the issue, we have both PHY variants, older hardware
> > generally has AC200 PHY's while newer ships AC300 PHY's, but
> > when I surveyed our deployed hardware using these boards many
> > systems of similar age would randomly mix AC200 and AC300 PHY's.
> >
> > It appears there was a fairly long transition period where both variant=
s
> > were being shipped.
>
> Given that DT is supposed to describe the hardware that is being run on,
> it should _describe_ _the_ _hardware_ that the kernel is being run on.
>
> That means not enumerating all possibilities in DT and then having magic
> in the kernel to select the right variant. That means having a correct
> description in DT for the kernel to use.

The approach I'm using is IMO quite similar to say other hardware
variant runtime detection DT features like this:
https://github.com/torvalds/linux/commit/157ce8f381efe264933e9366db828d845b=
ade3a1

There's already a good bit of mdio autodetection code like
that which scans mdio buses for PHY ID's in stmmac. To me
this is just allowing for device specific autodetection logic, it's
not like we don't already have a good bit of generic PHY auto
detection code in the kernel already.

> I don't think that abusing "phys" is a good idea.
>
> It's quite normal for the boot loader to fix up the device tree
> according to the hardware - for example, adding the actual memory
> location and sizes that are present, adding reserved memory regions,
> etc. I don't see why you couldn't detect the differences and have
> the boot loader patch the device tree appropriately.

I mean, sure, that's technically possible, it just seems like it's
not the best fit option here since there seems to be no real
reason this sort of autodetection can't be handled in the
kernel itself.

