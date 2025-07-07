Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4906C83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 22:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LyTXGd3oxrcdwN+ZWfUesTZPlQxy4H1ZYTRObcRWa8Q=; b=m1J8u3+X2l9pnEqE/dIv/9ejvB
	2/ZxF8ksPX5Ti3F5tOZrx2HgWVghQXLAbdWGm3LHI6xm0DeOh0OmCtau+Szc1RPXDplKpVseRtFLg
	/vWCTEa5SDAMJ8F3ABylGlMmALEM24kYn8UJqhOvm+4EKndLdCQZb2c9loda7xMGMG5GUY8MQi/xS
	PivlXorHCblbyteHNETEm2EYZwvwfyzVGLrHhEDIBjQgRo3l/vyg1iHdR6k1pB3bla3BXZDCKaYq1
	2m6QapeY6hLFPaECmhfH6d1bnFBApc5yrFt7+8a1/WkICqosyyR/11Qvx39rCEat34Io5t4DmYItp
	T0/N/Nhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYumN-00000003k8K-0vlU;
	Mon, 07 Jul 2025 22:57:43 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYuk3-00000003k0u-155z;
	Mon, 07 Jul 2025 22:55:20 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e84207a8aa3so2461694276.3;
        Mon, 07 Jul 2025 15:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751928918; x=1752533718; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LyTXGd3oxrcdwN+ZWfUesTZPlQxy4H1ZYTRObcRWa8Q=;
        b=E4RqNZS4wTvO7RTHYlDHLd+Al+GcVcY+SOqXc2ZTvdzLp+pf2HQO5HUYvgnPqElkxG
         GBkcCJ7Q8J60Xye8y/N3ZDTjooQmPhPXLTajVphZIqHw27IH8AgfG7wZMk4hGJUrlc71
         bvfjs54qETmNzC0h64XWBe32rQd/cEioUgqkjfsLUnIdO9l1Q7u2f3ZjoDDkmdp/y4X1
         npWRHquLrS8Qy/F2WbYDnVLJ1csV2e1tYevuW3l6cYncJ6u4tfpw86um9LvDwxP1Ktfv
         PXKnKnfo1Nz5Y73/EMk+qPooejWvVHMSu8M7BMKdAncsJTN+xGv/z7q/3WUZLLn42eMH
         G1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751928918; x=1752533718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LyTXGd3oxrcdwN+ZWfUesTZPlQxy4H1ZYTRObcRWa8Q=;
        b=SUeTaIcQ3Elw0eTZMCaEHAdXtjblRlIZEV8CJgU5ORfNNdTBvfphIMhm6zmOz/pFVB
         6m6laSe9dUDg9sW92MnAJQhxqd/Vdc6jzZZ6H9KVdp893Bj0uMx8ZmsXzcsyv6YAxRQ6
         GCVaaz76LV8SpOj3QRgx8/MDrIqZ3UMEomzWr9QJNTDjKJsvIC1r2fSE6Yf1gCN4VycP
         SI8uyRzFEkVY1ofsFG8cPUXRSpzda/XyoTYB9aS/mLMkYLJ00iCPyz1eam5+jgYJ4sQ0
         OUYpChzpA+Cxv2sL1omNnuULszrjDp85cpQHtrNV8mhrbFicUP3Ru4j2a5n+HewLxd/U
         Z5JA==
X-Forwarded-Encrypted: i=1; AJvYcCVcIbAgDhKl8kQzpdO7txjjVM8YhAqcAxqqL39/TjM6cRn1cIt42k8j9ibU0jk0e2EcZPcC3nPMO4UHNkmtYRM=@lists.infradead.org, AJvYcCWOpqDVuCWVXIAsQNeGAiinkLl/2N1WRUVnuczpKLmRwIYy9VLPjwSb8qA6lURhsnc1YH8+VeJ3CG04+j+ddnEa@lists.infradead.org
X-Gm-Message-State: AOJu0Ywoljo4ZPKEIZttMzx9+KitFqmv7qWGKD0wY2zQ1yfipENxIiuS
	fprBdrhH+WduOxA6xZQQqNQ8dVACHJK3mh5Gas0h/x2qQ8agokJCd0iq67nUD51O9woreyYvT/G
	/9KDQAOSDeGV+StqHrXH/LKQX+W2XGPQ=
X-Gm-Gg: ASbGncvJM4or4jIXCa9p7dQf+truqjQYcrCbTcxMArR356pQHyl6OSwlbI5RuIDZaBs
	v0cyQjR7ABx7CUoL3X/LF5D4M7Nt+dL3zEzShbQQHD1KzPXp8svlQJ3bZMqIY29VKKXi3QdQr8x
	sT305D3ne+xJyDq7GrHDaayu8kmMh8rh+xSkSoB8vHKwJj9tip2w4WR2LmBTppSLeyHFc=
X-Google-Smtp-Source: AGHT+IFUqlSeXO7TN1tNOxRHWSczuY+UdbyZo5ZiJbvWxxUDKKmr0+ZLKF63xcIULGwasrd0gN8rpXhvNOBtbXtWouQ=
X-Received: by 2002:a05:690c:690e:b0:70e:18c0:daba with SMTP id
 00721157ae682-7166b7e8151mr182180917b3.25.1751928917782; Mon, 07 Jul 2025
 15:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250706214111.45687-1-rosenp@gmail.com> <8c6f18ca47bf0dd78b6675d8b94000679b6c75cd.camel@sipsolutions.net>
 <CAKxU2N9vs5o4tj-9KxCHKevWU+J9wv+ZCOeD8o602y1GY8FzNw@mail.gmail.com> <b3a63d616c1ca337f6b9d14a9afaafe73bfbe8cc.camel@sipsolutions.net>
In-Reply-To: <b3a63d616c1ca337f6b9d14a9afaafe73bfbe8cc.camel@sipsolutions.net>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 7 Jul 2025 15:55:06 -0700
X-Gm-Features: Ac12FXycPvJ6904Rtx31RRwaAeo58C7gGYz-ADfCLyeTnPkiok4GspDzrArWUl4
Message-ID: <CAKxU2N-XviPav1Bh0yidyMUr=QbMr=0jyYyHKc+h0oaM9vak=Q@mail.gmail.com>
Subject: Re: [PATCH 0/6] wifi: rt2x00: add OF bindings + cleanup
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, yangshiji66@qq.com, ansuelsmth@gmail.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_155519_292579_C717ED75 
X-CRM114-Status: GOOD (  15.45  )
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

On Mon, Jul 7, 2025 at 11:36=E2=80=AFAM Johannes Berg <johannes@sipsolution=
s.net> wrote:
>
> On Mon, 2025-07-07 at 10:41 -0700, Rosen Penev wrote:
> > On Mon, Jul 7, 2025 at 2:01=E2=80=AFAM Johannes Berg <johannes@sipsolut=
ions.net> wrote:
> > >
> > > On Sun, 2025-07-06 at 14:41 -0700, Rosen Penev wrote:
> > > > It doesn't even compile. Added OF bindings, documentation, and othe=
r
> > > > stuff to hopefully this doesn't happen again.
> > > >
> > > > Rosen Penev (6):
> > > >   wifi: rt2x00: fix compilation
> > > >
> > >
> > > That was half covered by Felix already, and really shouldn't do two
> > > things at the same time anyway.
> > Just saw what you're talking about. That's gonna be annoying though.
> > The COMPILE_TEST commit will cause compilation to fail and the bot to
> > complain before Felix' patch gets merged.
> >
>
> Yeah well. That doesn't really mean it should be merged together though,
> and we can pretty easily make that work by just putting the further work
> in after net/wireless is merged back.
Looking at it again, I'm effectively removing rt2x00soc.c . Meaning
Felix' patch is mostly useless here.

It might make more sense to submit this series at a later time.
>
> johannes

