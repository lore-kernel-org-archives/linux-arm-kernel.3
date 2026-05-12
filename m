Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0111ACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 15:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opDVr+s1DFu5L5mMJ7uUsTv5OPxr0sn3kMdro9J0vTg=; b=Mm80OVp4HYrB5SScKHDMd1nFjQ
	sBF+OrjRYPf+LShbNa2kRnRnkHsUaTlX9lPlWfe/iXvFrQZ3yHoBhrWdHjgjo5/LKgKnF0Q+31jYP
	bV0j5sYPlLqNxIGHhRQ5KbOzDi0o7Xz1/CfFn5klOYuIrmgjdQeQMbEas+prMIkcvNvPdNHt1lF2u
	9tLiwMdn8Dj7f+BiVufI9Gake/Sf6LqvcgeEZMsMjmLs6yatPGBg/+v7rFX3DpSi7ijNYZdau1g1B
	NaDGkFN1dMfkti5qLVP5+9j3hl03CCrqlbEF4LD+YjsM+AJe0T9ZMXL7JJIaVzebYqkTwcQtp5Zp3
	Mb+ZLyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpDb-0000000HF2j-0Lg7;
	Tue, 12 May 2026 15:40:23 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpDX-0000000HF1e-0lbP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 15:40:21 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6802f9c5debso3239284a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 08:40:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778600417; cv=none;
        d=google.com; s=arc-20240605;
        b=dK+6jzIG4v4yClxXXVWzraSWXYLgg/fsufQEEr8zTyQZS9GiwsWzpj98uiHpmUDTuy
         VTzCEWHt6IOzT+CCs6o8cReu5QM5IRH2M65Z6DY1/dJYwSN2pSkSi3GScjLUrB9MRB0U
         p8cX/XxPYfDn73lkezEBFXizOKRdxIjuIFtBQx039bTsD4uQT+8Ew9rxBVq5kfqaN/Cc
         Nq981pPbzve605Z2Xn9ynAZse1Zt+d/l5Rzn4qKmqzxtSLb0+wpCUn9P0iMNJt43lmMv
         qdl+Y87nSUirLRCfeLyQJlR2rBB6M4z6s9xjz6HwXS0CkvqSoTjGFdoPoEAfwcH4RQuo
         p2sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=opDVr+s1DFu5L5mMJ7uUsTv5OPxr0sn3kMdro9J0vTg=;
        fh=51v6tNNxhajNzOwRs227r6w8qk8+myNI5+oS92zvnBE=;
        b=O0zCdMbE/t1esN+bdAGPzWjGHYySg2gseQRAQWfNKhV+IjUcYJ4IhUhzq/BtcxH15U
         3kY+QpAVXVskHstRt5HkMmzlj+dWv+ykjch04u799oYBa0M1YA6p2YJhSDZeQV5PF3cE
         TvmT3WOwexzLXc2DE40pvVavJgKS6s6xOA9dYZ3lSW8JOy8IVgd1hEblpUocyMZbyHyB
         Uuio6LqLYbJGKno/ZvBt5WpyjA2Y9t0nmr+I8QpXnbdY6rd3C7xoDBr5n3AJOR6EqQIX
         4+pOrszne6Bb67emyS44JWYQW/dNO4qoEThO6fDYLB5XzSblJ+ixc0/QJx2PQCqkqQZ8
         MSwQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1778600417; x=1779205217; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opDVr+s1DFu5L5mMJ7uUsTv5OPxr0sn3kMdro9J0vTg=;
        b=crmdp7Jvn9VcH19jNqBNunV7mqPlfocypsU4eOH68DzJtUCeRqyBT07F7DetM9zt0P
         njdjb599ukOTCLoKIj6jNbLUQ31IAG/0Z1LH3qpYWSrQbd4RicfBJU6aZBEGUClka13z
         SQ9vP1Ym5T+bsOe9yuJ67NzZ/766kuGkOKB8Ybm9X0LuJ0pDIEEYBYrBPrhom42FRWze
         S4HCcl1r3qGRp4n0ircNtdu4lDpawUZBy2h+w75+paMccxZDpQc6c0lUPJmilO4RKMJg
         6qcMAGujXLebb1W0C80CjVag+5+YEQ2JKQkYwY4395mqeCEIfegrjHVdxfuFelm1+zdQ
         JzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600417; x=1779205217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=opDVr+s1DFu5L5mMJ7uUsTv5OPxr0sn3kMdro9J0vTg=;
        b=A5YZCuiu5ab6J8B/rENRoGM3ngW+iJQ7MSkoNuG+dxxeZ1awtOschF/npjT9v/mPrx
         +trEPm5xkUfTfT66pDcyejlTH8LW/3oPkVG932Hu24vp9d+3K+QQavtEPA0T/L2ZA51h
         MBEbRqGrqa3onlJGZnG1/kfdvcFLFuh+pxpc4szuYOFg8iPBuJLp+1f9tXpkTNwpuszm
         9EfB+VcDaovFdhC3YyyEX5+0kEPJZH/c7fg3Vb8EtaRFyq/sYR9keXU7aN8Hh41rlOgE
         lx/L1zPqYlT0k6DhPlfCNQiZ2oyzUQN9SJ6OCrWrLUCo/cniJqUX9xGmBT0JPhqpN8tS
         /Ybw==
X-Forwarded-Encrypted: i=1; AFNElJ/39Cb7dHkIEo7rLmsw3OSebrxtu8dKCAwSCYHGqJ4WxgjgyJMBAgEXHTgLzqHdJuPosBvcmEWVjuSglzNc9rrr@lists.infradead.org
X-Gm-Message-State: AOJu0YzE1BVny7+QG8jaHU5cIyLNbsSxz1S+JgKgYvnSc28KoRxccOOX
	gNV6rVe59d0Pj5XRw88ZEZuk0wpSIXYOwM1w3mmA5S7LvAXK46DpSHj1DH26zGqZY+e4yi4gKZH
	BiCu5wMpEPEhNoiRseuKytt2AKS61baSNpMDvZ1N9mQ==
X-Gm-Gg: Acq92OHznxvAYYVQoGeGvhAvip1o4I5210dTbFGL8eL62g8zKnvj+HutYGjs2DA5pej
	PgAU1apWvtlI6f4gRysuCBWcRhq4XHgH9aP/bV4h/lgb2rwyy6/u5RBMreYxNSGg8JMAIaYonv6
	OkrHFS30OWcYHgltWz9axd18kwNO0wti2SotIF6PndN0fzqyXlo/vDBgYsj1sYAMQ2O6yIq7tRM
	PvGR1734OUg2I4MpD28hhjbvN+1xXa/1xhnJqKdDgNrRrRO0zkl++VymNbT8ibRy4MAX7oK6Tkc
	9GmQQnqBI9Yjcg5qsRvmIyoqlj/vRCSywf7Ql64ofiqhQaK5MdcwKjPKpal2wTXWRiyJ3vcIpDy
	S0WiKfNBdsU2GbANCMdglVvL2
X-Received: by 2002:a05:6402:4287:b0:67c:5745:ba25 with SMTP id
 4fb4d7f45d1cf-67f6f92dfb1mr7850023a12.0.1778600416902; Tue, 12 May 2026
 08:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260414224245.8493-1-guilherme.bozi@usp.br> <20260414224245.8493-2-guilherme.bozi@usp.br>
 <46bcd2ce-bfb4-4fc3-b840-dba657f39a7f@amd.com>
In-Reply-To: <46bcd2ce-bfb4-4fc3-b840-dba657f39a7f@amd.com>
From: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
Date: Tue, 12 May 2026 12:40:05 -0300
X-Gm-Features: AVHnY4LuD_JM6fJqTdYObcsdA2nHp5oI4cLiHc8_spvCDFozbdqw82SA1SS2kjY
Message-ID: <CAJgF-xum3OQ36keRW5gCnTTbnUhsHZUzL41xKn0hjJ3GqgyOZg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] iio: adc: xilinx-ams: fix out-of-bounds channel
 lookup in event handling
To: Salih Erim <salih.erim@amd.com>, "Conall O'Griofa" <conall.ogriofa@amd.com>, 
	Jonathan Cameron <jic23@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_084019_759684_757B5729 
X-CRM114-Status: GOOD (  19.88  )
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

Hi Salih,

Replies are inline.

On Tue, May 12, 2026 at 11:22=E2=80=AFAM Salih Erim <salih.erim@amd.com> wr=
ote:
>
> Hi Guilherme,
>
> Replies are inline.
>
> On 4/14/2026 11:40 PM, Guilherme Ivo Bozi wrote:
> > ams_event_to_channel() may return a pointer past the end of
> > dev->channels when no matching scan_index is found. This can lead
> > to invalid memory access in ams_handle_event().
> >
> > Add a bounds check in ams_event_to_channel() and return NULL when
> > no channel is found. Also guard the caller to safely handle this
> > case.
> >
> > Fixes: d5c70627a794 ("iio: adc: Add Xilinx AMS driver")
> > Signed-off-by: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
> > ---
> >   drivers/iio/adc/xilinx-ams.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.=
c
> > index 124470c92529..6191cd1b29a5 100644
> > --- a/drivers/iio/adc/xilinx-ams.c
> > +++ b/drivers/iio/adc/xilinx-ams.c
> > @@ -871,6 +871,9 @@ static const struct iio_chan_spec *ams_event_to_cha=
nnel(struct iio_dev *dev,
> >                  if (dev->channels[i].scan_index =3D=3D scan_index)
> >                          break;
> >
> > +       if (i =3D=3D dev->num_channels)
> > +               return NULL;
> > +
> The added lines use spaces for indentation instead of tabs.
I checked both locally and the raw mbox from lore.kernel.org, and the
indentation uses TAB characters consistently (^I in the diff).

To verify, I inspected the relevant hunk using cat -A:

^I^Iif (dev->channels[i].scan_index =3D=3D scan_index)
^I^I^Ibreak;

+^Iif (i =3D=3D dev->num_channels)
+^I^Ireturn NULL;

^Ireturn &dev->channels[i];

I could not observe any indentation issues locally or from the raw mbox.

>
> Salih
>

--
Guilherme Ivo

