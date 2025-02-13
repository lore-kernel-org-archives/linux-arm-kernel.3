Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1862C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whhYbCC8Ye/92zXnbL6IJWDNwsx8j4boIogQLPts9MI=; b=tRaJjE0cTaYfuWFnwTKTgy873I
	NXpjLLpG4tCsov3LzXq3b5z2weZhyyKN7vBEEI7yDHxYvvi7n0rSMQlpPOcXCq1G0YADIEBCn6pyr
	cThVZd+60a5nTWQMlww8WsaOMj7WcLdYMj70c6gVkLO0T0OqhAHI1tiMPaakZzx6K7n5b34A527WK
	y06jOBGUDtvwlIsPipnYpQf2fZfA8PnVjk2Ba6bcPaEY9dqJwtEHzJ5LuCMxiXHSaVPDbViWJCuao
	7MsoeqA3D2pn1lzurnk/6H10hvKZWzCHUnECkTXKus9uhdDmbCQp0+azve/81+VRK+5CpKwdhWdO7
	1jcGzULw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidub-0000000CE7I-22o9;
	Thu, 13 Feb 2025 18:26:09 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidBj-0000000C2tO-0A1E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 17:39:48 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4719768caf7so9408241cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 09:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1739468385; x=1740073185; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whhYbCC8Ye/92zXnbL6IJWDNwsx8j4boIogQLPts9MI=;
        b=JJbFmh/Gwh7aZBOsE1IPr8i5PciQ0kFB19hjpE2Q8hY2RbtapSJA+fENfwACSb2Raq
         LmfoDxrNfzb5HSiwhc+SXCJHOOaAUnrVrvwqKEtTMp10p8O1U8gd7Cc0OV3e6GmZ/Qn9
         AW39z18F5mFwFfGoGa7eOD7j/PNx7YK7ikLsIai8VErGfSuPCDC86oQbJb0cZ9PQoCiN
         oXI3/RCgknF3LgMWDcAXFsDpMA3N6n5TrSQRStqMnMqzmzoNQ7awkbt36XzcmD7QOxMS
         Qng37qfVmRBT9TO5wkQRv38YNsGSFcQEgS7NtJ596xrvU/pjdP0a1W+QQj9V8SUKyjiq
         IDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739468385; x=1740073185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whhYbCC8Ye/92zXnbL6IJWDNwsx8j4boIogQLPts9MI=;
        b=v2GR3x3H7OlQisFPssGCkbA1j3qIlnNvmdoevLrlUQOyI/5aO9oXarEyv+UNrqNroT
         S3EQ2NJgliga5YumjPGYt1a3N784UYUw6m2EIz5y5fW00ZKpHC2Q75c3hWlWFopM0Rep
         s5uAUYz0z7CLErz2T01K7gKEvAtWknpi9/m2AMvxEFvr6eucbh/fw7B93ltphSywnQfI
         2J9Aaam6Xg7jzkobeLxWso2svGQPr4jFFdxnMPVyP0CTDs0H2niHd7khlQIV5wI8opdA
         FC+0yWFt44PY1I6sOyKAVYKfeQa/Q6Zk6sXzhlXZSsMcpQv8ZquBdafMh608JJW3afBV
         qnNw==
X-Forwarded-Encrypted: i=1; AJvYcCV5OLynPfXDGkrq7GzQcFuVpYfF4J58QyWo/ZKymr8DJTBVsAE9/qdX4UpB7R3XUiagKcKh1d+2D5QlYDr6NYPw@lists.infradead.org
X-Gm-Message-State: AOJu0YwCpAyFITTHUtDpznhbb5cdQVG8Iqt+y1DSO+ri+zVV9adw98oD
	ogW+E2SB9yKnSsfAxbvTp3z/v5vOBscEVvjEm6ouWBZhQgq1vF4owANMrnO3XTCzmCAcoWUlBe+
	9/LgmraIklqovcr59QlzRyxwKi18RlOcMKFeqZg==
X-Gm-Gg: ASbGncuQCighF86QSUvWZZoOQ47uLB0Jo2tRsrbnyf9uxJQUGjtOQJpPLbky57Oz4Jg
	DJzU7w3wz8AE1TTGpOp5W+u5ab4r7yYubTS5DnLdLWCxH+uxr492bYiiwGELcdPBNxfqjFWM=
X-Google-Smtp-Source: AGHT+IGE9qUAgteAk42h8NRzlwUiEVQLmyQkmiwetNHn7TWQ4JRreBJYCr8hrD0N2jIsyDYrKQ939hR7SXW12F654hE=
X-Received: by 2002:a05:622a:418e:b0:471:bd5e:d5dd with SMTP id
 d75a77b69052e-471bd5ed804mr90077321cf.16.1739468385599; Thu, 13 Feb 2025
 09:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com> <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
 <20250213093557.278f5d19@collabora.com> <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
 <20250213134008.4cbef142@collabora.com> <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
 <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
In-Reply-To: <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 13 Feb 2025 17:39:33 +0000
X-Gm-Features: AWEUYZlDafBpFokqUpKbJAhQu7Ep0JLs4xPUNmdO9fz5XX0E98BWFTHCpoumcPo
Message-ID: <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Jens Wiklander <jens.wiklander@linaro.org>
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
X-CRM114-CacheID: sfid-20250213_093947_082886_FE2CBC88 
X-CRM114-Status: GOOD (  26.36  )
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

On Thu, 13 Feb 2025 at 15:57, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> On Thu, Feb 13, 2025 at 3:05=E2=80=AFPM Daniel Stone <daniel@fooishbar.or=
g> wrote:
> > But just because TEE is one good backend implementation, doesn't mean
> > it should be the userspace ABI. Why should userspace care that TEE has
> > mediated the allocation instead of it being a predefined range within
> > DT?
>
> The TEE may very well use a predefined range that part is abstracted
> with the interface.

Of course. But you can also (and this has been shipped on real
devices) handle this without any per-allocation TEE needs by simply
allocating from a memory range which is predefined within DT.

From the userspace point of view, why should there be one ABI to
allocate memory from a predefined range which is delivered by DT to
the kernel, and one ABI to allocate memory from a predefined range
which is mediated by TEE?

> >  What advantage
> > does userspace get from having to have a different codepath to get a
> > different handle to memory? What about x86?
> >
> > I think this proposal is looking at it from the wrong direction.
> > Instead of working upwards from the implementation to userspace, start
> > with userspace and work downwards. The interesting property to focus
> > on is allocating memory, not that EL1 is involved behind the scenes.
>
> From what I've gathered from earlier discussions, it wasn't much of a
> problem for userspace to handle this. If the kernel were to provide it
> via a different ABI, how would it be easier to implement in the
> kernel? I think we need an example to understand your suggestion.

It is a problem for userspace, because we need to expose acceptable
parameters for allocation through the entire stack. If you look at the
dmabuf documentation in the kernel for how buffers should be allocated
and exchanged, you can see the negotiation flow for modifiers. This
permeates through KMS, EGL, Vulkan, Wayland, GStreamer, and more.

Standardising on heaps allows us to add those in a similar way. If we
have to add different allocation mechanisms, then the complexity
increases, permeating not only into all the different userspace APIs,
but also into the drivers which need to support every different
allocation mechanism even if they have no opinion on it - e.g. Mali
doesn't care in any way whether the allocation comes from a heap or
TEE or ACPI or whatever, it cares only that the memory is protected.

Does that help?

Cheers,
Daniel

