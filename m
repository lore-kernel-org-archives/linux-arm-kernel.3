Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B884FC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 15:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOuDrYfN3GLsqpf/rmh1B+LTpgsMcK+DLrhJbAcy2SA=; b=iIqXJnfRwj564D8fTYhbx03m9w
	pVXA9XX4hv5N09kFzWz2rZCyAcHUl1f71EJzfu40+xhMZvPqRNw3M5YPbK25ITjvJ9oKX2L9C7Oak
	FRCERSlXkbf9jidmFD6AlNxTj0mGd53sFfVwGjpgfVs1okgcbwOUAVb5XqFcelno6r16coOx9tGS+
	dRYa3ey/QCeZ17v5RZ1VWHbE5MbOAHyu2jo56aTrHVKFVOQ3Zt60dq9vbXA4lfwt6L1wrqXmTbdyX
	naxVPRrCfeCQGfn4mGsaurr/BjGfVygXn0W/4Vsga/Px2lG6m6i/BsSIfRE1HA8Qt6zPmwj3WBu23
	VhF6jGqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0X9-00000001Hzo-2a0s;
	Sun, 26 Jul 2026 15:12:56 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0X6-00000001Hyb-13BP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 15:12:53 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-664b8b65192so226287d50.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 08:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785078771; cv=none;
        d=google.com; s=arc-20260327;
        b=Y+57IIwwJ1YMSMJ8+wtIYoGRvk5cez7Nj6nqOisHtI7jDK6WQ+I2YcBWoU+7PsSyGI
         mCk6JoOCJhk9pS79XSoEFtEhJ1AORwByWvKvtNA8arPaw1Mr/Lh0WEjmkq6b/NynFcFd
         ubl1trYfYeQD95NGJul2BBy1ctV3NAMjefkXN+DYafMI1FrwQINlDOo5omErGCPYUmuM
         URn/wbvev354q21ymQdQTeAt70Fes6cuzlqZTpDGzviqn9JvzhRLWZ9Fjgkpo5GOgauP
         EbUb6EfDmoC6p40PeGBuO+LLvOfuDdAt8o00Uu8+kxx8nEgep3uk6Vv+Yquf8k+Y05ta
         qLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WOuDrYfN3GLsqpf/rmh1B+LTpgsMcK+DLrhJbAcy2SA=;
        fh=TmGdBfOhKa3YpP5pH/6RGVZ5le4W99wrkx8LYH7VANY=;
        b=tCvvg/y30mr2IrbkqMviJEOO/Di0YsWIAWrK/vzqPZfIqg67l46chpFLHqAv3Lgk8l
         N485Tq6YPjWwFBK/n3SR0T0H8CDxqKH9QAkW/u61og+vJHWNdB/I+ItMQSzvCBZgExW0
         p7QYMtmp0YK1xrpzV5VmvqmzzeTkwGXDNvG3Zix4ODxRo6nPNMNEDrw4aaAu06HD6J2a
         TPctG7AyYTNhahyLAYxI0XmT7AIsxXRVsc3enQzE8bZPfxZJLQzws+Hs6c+yY5oSFneB
         rRghSayRwTLE91mj8x1RIMD3fno+SsiXlSbFZX6nhgHwtH60h2/OdpkEmW/2hHNJlRFj
         bVPA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785078771; x=1785683571; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WOuDrYfN3GLsqpf/rmh1B+LTpgsMcK+DLrhJbAcy2SA=;
        b=FQ1gEfZGJXE8LO5O/NBD9ybIWaC+UUutTJ8oPFyYyNb1hcFUBEAQ6GgueiHon1jgei
         ld4Zblmc6ig4JBZ32xtHMI7P0A5836iIydKMBacu4saxjQtN8MKhMPRwxIYjt5SQGjSh
         3TiClZnzFS0eWC+f5brDcCclqFE/0m2mF/nPJ9zvw4vFm69UDFOOgESL7KbJo4m5DHsC
         Iz6a91e19C0cTvYjhu5ydtq7mIEEtvU8FoKOK5HYSc7tD28v+9CIrAYdyGxWwaLR127B
         x1nSMEgRX77YBK+CHFshkphL+hxgZDvM/33opEAMId0A4AZ9JfhOC336yzgR2t+FcwDa
         QU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785078771; x=1785683571;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOuDrYfN3GLsqpf/rmh1B+LTpgsMcK+DLrhJbAcy2SA=;
        b=jDur1O1i0kWKem7RaXlyrmEV1ROVl17hKQUcuHqTM/Iliv+v711vtPUtKEwF1Hj+i8
         p4sETfQg4dkWmWdCVIhHdebVbD3u7sL0cl2rHHEqkqw/xYc15Xl3j2bPhVY73+VNL4gF
         4J64WLkVtZYlm6upxd6BYepBv1EflPfFhXW0uDsoD93rgMJXxrfps7KTBVxgcF/b7pLy
         RjoZeQQQv/YFqXnwvzdLanJZ2X2Tas4QQIY90JQBuUmeO7wOepUDMVfjxSPWagNO36qj
         UkbO/ptNNJQyAa925tLPxWKeEl2vUrKCHyh6Lt9nfv4Ai1qHK1rw0OypbfbWUQxJE9A1
         6+nw==
X-Forwarded-Encrypted: i=1; AHgh+RrrcBB+bnXABuiNGboZq7NKqjZWHX7QVcOKvW/WsTrGwq7dyqDu84GAjW3la83Rzz5QaZnFKkSWsQLlx4DyV+8y@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/ARwG3wcYtyzUyqh3Sl27NCCs94kITrAUGsuob9tiZjzUpynm
	W1XVRos8QBReruGSyCMihVYvm4seeqdy2B1hvJcHy1TDv7o8VqRIvSWeVYpdqI6pgXbdDr2bpgt
	lTSFVs+WeAgIpDBE83ME/pF4hI6Doa5g=
X-Gm-Gg: AR+sD12oE9524ft0WgvqWzGJG75fLCDbdQ/u0kxsMalJflXyzqHnwLK9WGWS6MZ2pSv
	AOEVP2XOKjrZ0+fzMT0Kh4jucBz+vBqQNIk/Qb7V9bbhFff+7XHUvSkC3jmly3AwA5p2PPo4uZC
	dFJQq6hxGFfSlRVJ+IsodSOwyvderGR/y+MNYJs+X1nZgQO9VwblWpsdu5nWGqUFtIzGGmo63hi
	inSfa+cOABGjywXEPFs74oJlye8M7rahjYinu4D723wdIXugJwAKggPmofSPYEUzQ5jtiybQ5K1
	j9JIEU04Cg+0lh+fwko=
X-Received: by 2002:a05:690c:f07:b0:7fd:6d19:5a8d with SMTP id
 00721157ae682-81f69ee7e19mr14494537b3.8.1785078770663; Sun, 26 Jul 2026
 08:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-3-royalnet026@gmail.com>
 <25922edc-4ff1-4d28-9a64-2c28b2b690cb@collabora.com> <CAEWPSH70FecQRuGtA=S8+_CnLY5sMyf1j57Uwzwv54zceS1HZg@mail.gmail.com>
 <b8d63f61-b73e-412e-8119-ced1afdd4551@collabora.com> <CAEWPSH5j3tYNb1JKRGwa00PVnYAgCKS+B-Qz07D8Z7TJea5cMw@mail.gmail.com>
 <1ac66aab-8985-4441-8ce1-07e2ea5183bd@collabora.com> <CAEWPSH4aB4KZsrLx2TESjPvUG0+A_Z_7uuO=5Rd-VidKU9U3eg@mail.gmail.com>
 <e1034df6-3801-424a-ba1e-a03d61b37222@collabora.com>
In-Reply-To: <e1034df6-3801-424a-ba1e-a03d61b37222@collabora.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Sun, 26 Jul 2026 17:12:38 +0200
X-Gm-Features: AUfX_mxNMnv89FtlmOLwDPjkbtQHb2ya9M8N3iwV5LPYpxZcnxB0jJS_Wey_JPA
Message-ID: <CAEWPSH6BaPL+65Or+kVHGCdzRHrhaYSbZNfRwNTJQGWYvjnY5g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] media: synopsys: hdmirx: add HDMI audio capture support
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_081252_323672_3F7361AB 
X-CRM114-Status: GOOD (  32.67  )
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

Hi Dmitry,

That's really helpful, thank you. The get_eld() route makes sense --
reusing the ELD path to advertise the single wire rate (either by
generating an ELD in the driver or teaching the CODEC an explicit RX
rate restriction) is cleaner than what I had in mind, and having
userspace see exactly one capture rate and resample on its own side is
the right behavior.

I'll follow that flow -- plug event -> signal stable -> rate from ACR ->
register CODEC -> get_eld() -- when I get to the follow-up, and I'll run
the hdmi-codec side of it by the ASoC list since it extends the shared
CODEC driver. I'll keep you cc'd when I post it.

Thanks again for the pointer, and for the reviews and testing on this
series.

Igor

On Sat, Jul 25, 2026 at 7:58=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Hi,
>
> On 7/24/26 02:47, Igor Paunovic wrote:
> > Hi Dmitry,
> >
> > Thank you -- and thank you for reviewing the whole series and testing
> > 2/4. It went through a lot of back-and-forth since the RFC, so having
> > it land with your Tested-by means a lot.
> >
> > I'll prepare the follow-ups as separate patches once this series is in:
> >
> > - The video_device lifetime issue on the V4L2 side (the devm-allocated
> >   struct with video_device_release_empty that the automated review
> >   flagged) -- as a standalone fix for the existing driver, since it's
> >   independent of the audio support.
> > - An atomicity fix for the GLOBAL_SWENABLE read-modify-write, now that
> >   the audio path adds a second writer to that register alongside the
> >   CEC code.
> >
> > The repeated-suspend wedge I mentioned in the cover letter I'd rather
> > send only once I have a clean, reproducible trigger for it -- it's
> > still under investigation and I don't want to send a fix ahead of a
> > solid repro.
> >
> > The dynamic codec registration you suggested (bind on the plug event,
> > read the actual wire sample rate and restrict the codec's rate) is the
> > direction I'd like to explore after these, once I've looked at what it
> > needs from hdmi_codec_ops.
>
> Good plan
>
> RE the sample rate restriction, hdmi_codec_ops has get_eld() that
> restricts rate based on HDMI ELD [1]. For RX we could tell the exact
> rate to CODEC without ELD or we could generate ELD in the driver, either
> way should require extension of CODEC driver with support of RX rate
> restriction. This way userspace will see that there is only one rate
> available for capture, so it won't be able to choose wrong rate and will
> resample audio itself as it needs.
>
> HDMI plug event -> signal stable -> gate audio rate from ACR -> register
> CODEC device -> ops.get_eld() returns our ELD
>
> [1]
> https://elixir.bootlin.com/linux/v7.1.3/source/sound/soc/codecs/hdmi-code=
c.c#L477
>
> --
> Best regards,
> Dmitry

