Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA25CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 10:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sn3pvbBqfTOyOoOU/Jw94BfwIPh6Cc8Y6dRoDktCRzw=; b=bn0hgx+yBU+858FF8T8GsAJfWf
	yhD+ObTOGT0nqOvPEOKXwYSdaVSKIsNYm8FFz8eNYW9ZCSQylPsirpsjq/RRvWzt5bSqY9LDD/vwc
	ZQMcCmX9jHsrv9gOsKa0u8+sUSCMdVpDa0aUkivGoyeM2V+3AgWk8nJVG+hbybg/Tz7amzZYf5Sx3
	cLCSYdRfKrrEW0Xnp03VglyDwmzQ8aDoXmI7imorOTRFiqyqlR4NZHHnC+e1XiWC8EzRUGlxqsRAj
	Ss8CRk01DOWQIboThpZrbL0fDQ9UxqAgH3PV86vt5hgZ8rdiHEvTfqa8s0Ukl+vrCJoHN+SGPG46w
	OK9ETFng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tisdL-0000000ESEA-0eSj;
	Fri, 14 Feb 2025 10:09:19 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tisbs-0000000ERnf-1AeH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 10:07:49 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-724d1724657so1673171a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 02:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739527667; x=1740132467; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sn3pvbBqfTOyOoOU/Jw94BfwIPh6Cc8Y6dRoDktCRzw=;
        b=WSFScBs/bblCmAn2jP9Ecoze///zcdnTVoFe9GHq5fkrX8w25kEUdIKb+aXWHLVjft
         VO6G53q+sM876PnhiL8unxk1qXPFbZ2vx0zFs7I81xZ9LxthDTsoX3RNbWYElxiD7MeS
         dQfldHeetHmtDGNtyz4qsiEU4zroHG/DpuzpUtUBP6LXqH5lMqYM1JGbuxFddGSQU5JY
         x2Dykqgkz1FTllvNrghF0V5k9UCfoGxH3E/JdGuoHYN4hf10JS2isDHQcv6HgDrAeJA1
         tKthcwsD1fCY1HLJZargkfJFFEzO2t17pqEYD2cO24UtKXi0sglLOvHLWX8bSatmqWIE
         YYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739527667; x=1740132467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sn3pvbBqfTOyOoOU/Jw94BfwIPh6Cc8Y6dRoDktCRzw=;
        b=kgBCaakZD1iEpUvKhIO7DJBXXQ6PjUirW/0eVVIZ8avgsRaIPRZYHWurMr7ALisXM5
         w1d//BKR0IThuIFY2c/lEdukNxVW9bVLm+Z6ISg6S5eybRiQPBx0+Yq7mYA/LP5KyBM8
         LAbepDecCTlYXi4WWsgh068RIkbyFRGylN+OmURqyCw1hUHS+N3pBENssCGpHrWmbcKP
         aAEBIJXw1yeGM1GecKA13lCe7efIFSaOiCbanENoSvHfsAnjDVL2WpUAB52n3BOLD4k6
         fUR6+vHx+3lBMPOKIz1hpT66UzopGmouwExZ2qmcUiXV9Hhq2enyTMWewriJGe3zwBfk
         2z6A==
X-Forwarded-Encrypted: i=1; AJvYcCXHYkJCsn/Ec65sNTXgv6dEKaE0uTNqMZSvzicUeLztTZ29JkRowXYkd8Mh8Opmcf6JkYsyMgesOEPZnsaWsKtU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw14wo8EcaSyIO3WBhBRXDICbQQVQboX/G3v0pl6E0PUBjYdh2a
	YmuO1+dMfHgVLW+bSJM2JR/qAASZwXoygZ4P/XbhkclOkJ9CUDuJtwZ0rT3DsLb6HRexuwNhUAF
	C3VxrnS+edeKwC/tXsX03p/ykNPg5L45lqhjwuw==
X-Gm-Gg: ASbGncsu0lWKzbSQ9nt1aBE1Wn5UZb2Jp4uelXpGAM98ImkBS9QJWhW21Iv+nsiiF+1
	4kLpxfJg3MlHwkrIDMHEiLAXN1VTh7f9ak0SnRbvmO4zLKPBxZ878tANE55k9h+laaCwXhfWniw
	==
X-Google-Smtp-Source: AGHT+IEmoLNj+r+ZI1bJGO2H/c+/OPghMcihwjxAvNbcnoyp3QyJqGjGScO1azD/YZ9Oqyybj/A6hKXzadalRsb9RgA=
X-Received: by 2002:a05:6870:ac94:b0:29e:1962:7a23 with SMTP id
 586e51a60fabf-2b8fb13c9d8mr3994694fac.4.1739527666842; Fri, 14 Feb 2025
 02:07:46 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com> <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
 <20250213093557.278f5d19@collabora.com> <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
 <20250213134008.4cbef142@collabora.com> <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
 <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com> <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
In-Reply-To: <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 14 Feb 2025 11:07:34 +0100
X-Gm-Features: AWEUYZloh0UdTJdZ2i2yB5o6l3a8WiHqKi_BGzWtYbrdKFQsIhzEcrv-aDyLaSw
Message-ID: <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Daniel Stone <daniel@fooishbar.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Sumit Garg <sumit.garg@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Florent Tomasin <florent.tomasin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_020748_330914_28381D93 
X-CRM114-Status: GOOD (  41.19  )
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

Hi,

On Thu, Feb 13, 2025 at 6:39=E2=80=AFPM Daniel Stone <daniel@fooishbar.org>=
 wrote:
>
> Hi,
>
> On Thu, 13 Feb 2025 at 15:57, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> > On Thu, Feb 13, 2025 at 3:05=E2=80=AFPM Daniel Stone <daniel@fooishbar.=
org> wrote:
> > > But just because TEE is one good backend implementation, doesn't mean
> > > it should be the userspace ABI. Why should userspace care that TEE ha=
s
> > > mediated the allocation instead of it being a predefined range within
> > > DT?
> >
> > The TEE may very well use a predefined range that part is abstracted
> > with the interface.
>
> Of course. But you can also (and this has been shipped on real
> devices) handle this without any per-allocation TEE needs by simply
> allocating from a memory range which is predefined within DT.
>
> From the userspace point of view, why should there be one ABI to
> allocate memory from a predefined range which is delivered by DT to
> the kernel, and one ABI to allocate memory from a predefined range
> which is mediated by TEE?

We need some way to specify the protection profile (or use case as
I've called it in the ABI) required for the buffer. Whether it's
defined in DT seems irrelevant.

>
> > >  What advantage
> > > does userspace get from having to have a different codepath to get a
> > > different handle to memory? What about x86?
> > >
> > > I think this proposal is looking at it from the wrong direction.
> > > Instead of working upwards from the implementation to userspace, star=
t
> > > with userspace and work downwards. The interesting property to focus
> > > on is allocating memory, not that EL1 is involved behind the scenes.
> >
> > From what I've gathered from earlier discussions, it wasn't much of a
> > problem for userspace to handle this. If the kernel were to provide it
> > via a different ABI, how would it be easier to implement in the
> > kernel? I think we need an example to understand your suggestion.
>
> It is a problem for userspace, because we need to expose acceptable
> parameters for allocation through the entire stack. If you look at the
> dmabuf documentation in the kernel for how buffers should be allocated
> and exchanged, you can see the negotiation flow for modifiers. This
> permeates through KMS, EGL, Vulkan, Wayland, GStreamer, and more.

What dma-buf properties are you referring to?
dma_heap_ioctl_allocate() accepts a few flags for the resulting file
descriptor and no flags for the heap itself.

>
> Standardising on heaps allows us to add those in a similar way.

How would you solve this with heaps? Would you use one heap for each
protection profile (use case), add heap_flags, or do a bit of both?

> If we
> have to add different allocation mechanisms, then the complexity
> increases, permeating not only into all the different userspace APIs,
> but also into the drivers which need to support every different
> allocation mechanism even if they have no opinion on it - e.g. Mali
> doesn't care in any way whether the allocation comes from a heap or
> TEE or ACPI or whatever, it cares only that the memory is protected.
>
> Does that help?

I think you're missing the stage where an unprotected buffer is
received and decrypted into a protected buffer. If you use the TEE for
decryption or to configure the involved devices for the use case, it
makes sense to let the TEE allocate the buffers, too. A TEE doesn't
have to be an OS in the secure world, it can be an abstraction to
support the use case depending on the design. So the restricted buffer
is already allocated before we reach Mali in your example.

Allocating restricted buffers from the TEE subsystem saves us from
maintaining proxy dma-buf heaps.

Cheers,
Jens

>
> Cheers,
> Daniel

