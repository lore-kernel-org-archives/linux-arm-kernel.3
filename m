Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E21C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 15:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a8IcWix8i7C0DIMMGLJFWrwznvm95cLdWDVTqjuXB24=; b=TtgnqT9OplOQw23XIaAA39XYA9
	5EqFX0upgHbuvPq19NaMjtDPSRPA1sH08zGmWUf1E/9QqIKoPPksHTgtBc6s3+A8Q60irGnhlFj17
	TU14p4QPtD2Ws2qGh+e/XmrCN6FQa+uSjxqIUBepVYw5IwU+hurpMl+nY3vaz0OyX2VKAYKJ5Nsqt
	+9V0ZMZe8y2iN5Ue+D3hKGVYxuxMwo35GfZyGhJkvVYksOTThoEqrtY83QoQc5RNX3h2vKCiP2zoX
	FX7uLCnPcGHsHs4md9eDRCDRHc8zBbVVj/r1q00oIga4FXyUbuaDnWWnpZiJY8xfcELuVwEOZi0Ry
	Dc2GsKLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Vg3-00000002VMM-2myB;
	Fri, 04 Sep 2026 15:18:03 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Vfz-00000002VLJ-4ARY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 15:18:01 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so818842241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 08:17:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788535078; cv=none;
        d=google.com; s=arc-20260327;
        b=NzUYYbF/jLN2CJh9iJ8TveLmYxEqB0brPodPo4DzkiQD623TuTER5vVN8/RC8iHuZd
         O6x+FsHBYoUc1EOblRHY9h2WF7cuyP2s0PNMxGdcQZ1RZ0DH4r1QW8OJ2p7NsYbAKfaV
         7RDCLAqxGBNQXhe9gQndPHpG6pNced/TXW4z+IYjIzRiLICD0rFa+lKvLipymgY6f0+Y
         cw3tdzvTFrckQKF5LMXD0WlR9s5SF3zFNJbZfiGV4QNkRjukrVj3Mn/7mrtmI7scpp19
         3V+OuKuAuw29wY+hamBJnkhdcLsI2PKGEiYPFy8vPrH0We8voF19gPngsb1aJlWGVgkE
         U20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a8IcWix8i7C0DIMMGLJFWrwznvm95cLdWDVTqjuXB24=;
        fh=zOOaYN3RJ3Betd4gtxlCIz+ECrllo2t+AKw5Rxnt0VI=;
        b=B7BQPP0n2ypn1wTE3nlyKNeFAdxqNAi3ML43gp4QZIqyxVKfTvPTQFpjHXvGXvQvQ1
         TOId05DjrrfqYOqXFghQIiyrV/R/lx1n9xscZRMNtk0rReoKlSoVncBlAUpWavLLZokh
         8w6ZscJzV2OIsg5zV6WSDmw3owdEcmkfha3oNMrszJXHsDVkHTFWGskXClqh+DT2ga7X
         GVIg8h4AB0nFGuzNl8gHzVErFabMqGpdeR82uJLzU6yLRgnK+D5HeP1AIJOJ8ndI0QtD
         PzGAaEJHN3YbdZ7b7etjQScqxodaQZdRAl6xJkNT9n6L4g4XVVUIxJmnWoxdhT3W4suq
         Xfng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788535078; x=1789139878; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a8IcWix8i7C0DIMMGLJFWrwznvm95cLdWDVTqjuXB24=;
        b=iIgWB9296UJagOFCdA4q2soNPOeMV3M/KOUIVStiSXn9Onn4xPs21zDUIetwtDQXt7
         SRQyn6zKxzK0/KfRzE65HTgPPIk49JycQhmQZMJAZN7wm7IVZpqL/EkPS1OPxc+3re0V
         xOUyRn9vyN9f5w2rxyI2ENqxWyqYKts1d0aI4+vu30EdwfcDe92UMyXvBjU9omLrTatp
         19Cb/8540MauI2gnpuZT4w95cFKHvHfAeMuz/lNUsHbLrRiWXBd9wH4EYVZYiXoA5p+K
         UXo5WhXQAIIsyUSxHGKrECNoKhsagELY64fZ7Y8z76ByXXDRxxqbUv5I4RkGKqgO5mgM
         x9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535078; x=1789139878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a8IcWix8i7C0DIMMGLJFWrwznvm95cLdWDVTqjuXB24=;
        b=F0vaaCIyWn999wB5G4qnZajWDgCm+YZkYMdMY5ooSY6Wzp5qp2fpjVbS4L3W22Y0Zq
         enRIM1bYyPmSHjSHX5TzUZYoLo+gLpUDmjcuREcQBb2HZZRFyMPggbmid+VNjyf2I/2t
         MafugHLFw2aGyjuojGQXzII7KZBo2iz1fhCAoTUPZcJVE1CztTT4QbTghpkgxUGB480s
         qUIxMM3xmzvejySnM2FJz0ez4g/tDHGNdoqd2ahKuBZL52eu85FYFvFc2cCZ5poJWs1O
         q963PmSz7UDFwOk2EhnAJHnpb2YulaAG4hWlbaBYr4BbxTcfFQJJW1zW6DHZ0IGQx/Ez
         PWTw==
X-Forwarded-Encrypted: i=1; AKwUvBw3VlxL+LFrYsS+zQv/q6e1Yo230P07DqXSkoRaGAzT3zx6TlV1khVR+CDcs1GU5ApUGRGzIIsTE+HOb4NkEBGv@lists.infradead.org
X-Gm-Message-State: AFuF++nXyCMQnuBopfzORh5CdeKH3v9xGgInpeYgOihfkqfmbdsPQuGu
	u/77OgD/B9TwTbFYFLXUksS51HwX9gQSGReQitDgJeQJDqNg9dHvklGM1hKuNMcTtngXPGfVR+v
	BalmDztHjM5ek14b0iGjOy9idlLxSvOU=
X-Gm-Gg: AYBFou1hEkoZ/QKJ2Vo7qalXs6tMhUR59nrTcwLhu4GNtoRpxIp3O2R2/TfPPd0PfsV
	1dkNJbsvb8cld7SHl97vZEGTmONsxcC8H9Z5ApSN3JovFroPYQQSmLKqn/CyPvRGiT3wAWYHmNj
	dmzqq9kKt8OQ0RlFXzRDE+8vG/ilOUsavNeetoee7W93NzfNxXLbtKvd8r41548kY+ksMWa1yNE
	qktU/3FWKkdtuaME9ZPN58d6jS2O4b1Jh8vuDG/G4ZYLTY3JpVwel1OeprZuLlbuuMUJ9gCwDWj
	29KH+ONxuMcBlzS2mJEjurKvv4E9DApqZdCMlKjQNToynxo5s1i5jBNCPdAOiEtfLY8UaZras7E
	MH5dIydHFD/wwLZXRuUPhffp3XttG99ppiGfYMCb0pWyNEf7RV075uJ2oP/mY+MJlu2fGVtYuD9
	tKeJp3Qxan060jNUyjasYnHzwC33Dd3x+D+fn4PFbrxap8e6tNaw==
X-Received: by 2002:a05:6102:80a9:b0:786:4822:308f with SMTP id
 ada2fe7eead31-78a4a9aea5fmr2343885137.13.1788535077663; Fri, 04 Sep 2026
 08:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
 <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-2-463853a14ad9@gmail.com> <87se3p13jy.fsf@bootlin.com>
In-Reply-To: <87se3p13jy.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 4 Sep 2026 11:17:46 -0400
X-Gm-Features: AcwNN1UP0lhDRhRnmSbud-UU5EERiros9_WN1FPXC7f3fDYdM3_vq5pk0G9NwE0
Message-ID: <CADvTj4oW8Hxv_b5vWM5pbeB3wEO-WoqhLwyinCTFPNR6wTHYmQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: support randomized OOB formats
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_081800_045285_417FAF76 
X-CRM114-Status: GOOD (  20.96  )
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

On Fri, Sep 4, 2026 at 8:42=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> On 10/08/2026 at 17:04:50 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > The controller randomizer covers the bad block marker along with the
> > rest of the OOB data. The driver currently compensates the marker bytes
> > before writes and after reads so that they remain plain on flash.
> >
> > Allwinner NAND firmware instead stores the marker through the
> > randomizer. Media using that format appears to contain bad blocks unles=
s
> > the randomizer is enabled while reading the marker.
> >
> > Honor the allwinner,randomized-oob property by unconditionally enabling
> > page scrambling and leaving the marker in the randomizer data stream.
> > Keep the existing plain marker behavior when the property is absent.
> > This changes marker handling on all supported controllers; the H6/H616
> > protected user-data placement is handled separately.
>
> But I think the reason why this has never been done is because it just
> breaks raw accesses, including the BBT reads. I don't think this is
> handled, is it?

From my understanding raw access bypasses randomization entirely.

When writing the SPL(which does not use the same layout) we use a
pre-randomized image.

>
> Thanks,
> Miqu=C3=A8l

