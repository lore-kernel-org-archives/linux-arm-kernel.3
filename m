Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850E1E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MV9fhVZhcNI++rOvHAbbF2f8B7BcQuVm911rXwPeho0=; b=qJ8Sn8DuZsAG1wldRfeF170VH/
	XYx4mZf1YTK8f9htt6nZpROX3HxO/M2X9htnotr4MqRwaxn8FR36g68bfdVEY8FQfkCgOIEtKT3Dt
	e7Zvbx6kDAuvsGwQSa1lPFGzNRaxrJK33X14awuMmQ072hqyVVOiWf1AfQ1yVo0yIj0UaDsvbX9I+
	AYevXT9C6JSQGz2aOmqjPXKnUcLTWbx99kNuJVT0M15QPwqr9RysTJqT4lsRqId5eawCKj1yctWi8
	xzWqjD+Fi1zCYkwO5xN5xXQC8VkGCOChNQXVzUD3f8P/eiLwZZTbW7lTIUO+Bg3kxauF1aYRfdxaG
	/OqoZulg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnub-00000001XI3-1W9Y;
	Mon, 06 Jan 2025 14:16:57 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUntQ-00000001X7Q-1DPP;
	Mon, 06 Jan 2025 14:15:45 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-218c8aca5f1so8342655ad.0;
        Mon, 06 Jan 2025 06:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736172943; x=1736777743; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MV9fhVZhcNI++rOvHAbbF2f8B7BcQuVm911rXwPeho0=;
        b=CtyEl+sNuaBtixdC54jSU8ZK+Z+t5dtAVy/Lmp4uf6LWM8B77HzlKC4Zd6lbaaNYC2
         ZsHndk51fmEkjyhr33Dh3LWkMRKUnlcxRWP7VFFzPOtV08fvf1N80/IV8PqyUbjYyQq+
         IkVw94cxQ2bsk8UXhgKVu2S2WIdI4Ya+T+20kXiwdaQOnt7LH7xM+6+DJbltG+5GrXZf
         4wjtdarIl1eBMMCM1GchCHOzN/3e9secB0rXQ7ei+yxnEdjlKYSQb3T+mC2ixLn+t1T5
         YmFQ+eHNZB/6N5iwwaS0uJW1eKxbukCsCM7j7nM+ShJ7/F740Nh5ca5s0O9MqzU5JsHi
         YaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736172943; x=1736777743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MV9fhVZhcNI++rOvHAbbF2f8B7BcQuVm911rXwPeho0=;
        b=h9Mx7o9ePOHa4BUklS+kPftUtv25EYZWDfxzNtQPyo2QJrzMUfBCo+NCN2Kgz2I4ZS
         L7s4nMebymW8D72+uUkuTvYm5yMiLRMAIsJTdcVJ/znKz3aiZXR+SP+r0hNwm0WX61gJ
         2NOaWjlP3pCQ6kicTKIHkheFyk57LwLxRcUZRaLZEMm64iTYoQkI83WaDHwq8uyzK+3X
         M4spenMjSvQKXGzLrKiyWTWqVgvWVG8Cx9cQJKjKgCQ21EnfYU16ax+sNOg07pc5TKuJ
         D3+XCThFrtBCuVkHgkYnRLGVxozlHnsG9+eXacaUwiMhXR+ZBMkwLWsgPc+sRVWawpTQ
         z3WA==
X-Forwarded-Encrypted: i=1; AJvYcCUc1ZQU9SlL49Ypu9VV9ehAnQreNBtFfs5Gqnp2EBrj9pM28CZAeaXUdc1aN2AmbrK2yCdvx8T436kjcdlxV440@lists.infradead.org
X-Gm-Message-State: AOJu0YwVMX0h2Xg9rWZCYcKz0vAbMj9VD9k2gdWingNM0AGJgaPS491S
	lOAbw8b9iVUZ2e/N0FVBmK2RWte/Yg8kmQPXz6jDtRR8eS/9x8HU5l7IXH6DxjlONGVyCACgAXM
	cvVg48dEO5V7adRzNxUR93MpYhgc=
X-Gm-Gg: ASbGncsRNZ9svWu5wP2yJ3CHJW/IrVZFAUrObjl+/CXntLEECZGceilqoaXcid7yMo5
	zgG1xllM8KgKHV/A6IavGAvl2MN81dS0EBQSQNoFQlswHKXKzzYc7
X-Google-Smtp-Source: AGHT+IFEBZJtpqODTcd07D9FVHGKDHkir6SlF3wADzh7P9HVYIG39voEOtEnlLVDhzsY1eefQ0fPozBDVZGOUWxSTaw=
X-Received: by 2002:a17:902:fc84:b0:216:356b:2685 with SMTP id
 d9443c01a7336-219e6e8bb95mr915796815ad.11.1736172943446; Mon, 06 Jan 2025
 06:15:43 -0800 (PST)
MIME-Version: 1.0
References: <CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com>
 <1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com> <CAFBinCCAAZHqrKHyfwHPqk9Ki9nDeGFFQfj34ZF58wj+6AjH-g@mail.gmail.com>
 <1j4j2caxds.fsf@starbuckisacylon.baylibre.com> <CAFBinCA2pz+ZeWr2hA-QRwZ5gC70qp=2iqemX5MpyM75cAbJwg@mail.gmail.com>
In-Reply-To: <CAFBinCA2pz+ZeWr2hA-QRwZ5gC70qp=2iqemX5MpyM75cAbJwg@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Jan 2025 15:15:32 +0100
Message-ID: <CAFBinCBLPFPotAzf_5Pdk1we9ygZdMagOEfnNBKWuCm-20iYHw@mail.gmail.com>
Subject: Re: meson-aiu: HDMI codec .prepare() callback not called
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dmitry.baryshkov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_061544_328844_7280D7CB 
X-CRM114-Status: GOOD (  24.15  )
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

On Mon, Jan 6, 2025 at 2:38=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Jerome,
>
> On Mon, Jan 6, 2025 at 2:24=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
> >
> > On Mon 06 Jan 2025 at 13:49, Martin Blumenstingl <martin.blumenstingl@g=
ooglemail.com> wrote:
> >
> > > Hi Jerome,
> > >
> > > On Mon, Jan 6, 2025 at 11:44=E2=80=AFAM Jerome Brunet <jbrunet@baylib=
re.com> wrote:
> > > [...]
> > >> > I have further verified that the gx-card parsing does find the HDM=
i
> > >> > controller and links it correctly.
> > >> > To me it's odd that only the .prepare() callback is not called, al=
l
> > >> > others (as mentioned above: .hw_params, .startup, ...) are working
> > >> > fine.
> > >>
> > >> I think the problem you are seeing comes from the quirk of
> > >> codec-to-codec links. The hdmi codec link is such a link on Amlogic
> > >> because further digital routing is required after the backend.
> > >>
> > >> Those type of links are not used much beside some
> > >> CPU offloading on Samsung and Amlogic, as far as I know.
> > >> It is possible, even likely, that things are still missing there.
> > >>
> > >> So those C2C links are operated by the DAPM events, not the regualar
> > >> ASoC code. You can start here:
> > >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/sound/soc/soc-dapm.c#n3995
> > > Thank you - that is indeed the root cause!
> > >
> > >> You'll see that .prepare() is not called, same as .trigger()
> > >> That should propably be fixed :/
> > > Since I'm still very much clueless about all of this I just came up
> > > with an experimental patch. Any feedback on it is welcome (I can send
> > > it as RFC patch - but prepare for me needing support).
> >
> > It is probably a good idea to send it to get more feedback, yes.
> Sure, I'll do that later and keep you Cc'ed.
patches are sent (with your feedback applied), let's continue in [0]


[0] https://lore.kernel.org/linux-sound/20250106141316.375984-1-martin.blum=
enstingl@googlemail.com/

