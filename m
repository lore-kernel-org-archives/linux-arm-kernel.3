Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F65CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 16:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYV2O2ADUmnC4EjpgIkzJxqCjUachXXpNhXgHQTp1GQ=; b=cNNXkMXC0dWdFO8i4r9N24rRG6
	Gzk1ASa6AmsOcZ6Cr7McYERslsH/jW6FQ101kyzewalVSlFFyjQ+/Iw6EnZkYVKTAl8Xz97j9ny1s
	t9z7TRag5Hqn5RPy4nzRUS0ME7sJA2Fj3RKArkwxqXxRzTtGNh8QpyLvtT4CMgXld6ctb1E+qaEBH
	Xg3fuiFeWvtu8jkDdIR3qWlH9yK/KfHmDALOrBgPlzzFi6+V/psEhe4TipGQ695M/fVPQlB/iGlWk
	WT2sMeXwdPWT54rCs+Vd9cNe+3qvWSeLeVn+DIFJP66LH81tzQVf9VlmdVB/Fi1Wn5rvZhjnRZr3r
	bDWn6RJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts24w-00000006HIC-0yN8;
	Tue, 11 Mar 2025 16:03:38 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts21x-00000006GU4-1CN4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 16:00:34 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-52403e39a23so2368449e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 09:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741708832; x=1742313632; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYV2O2ADUmnC4EjpgIkzJxqCjUachXXpNhXgHQTp1GQ=;
        b=laBxBylsJXWiVJFULVk4TwR3jKdiazCrcbp/a+8K13XomRym57HDnf/nupI4mAyjhS
         dYr/P5yC7RavbgM+FSjIygnXRVX1qk450b3gAwtsqsQ/d/mBIvp+86dZ+RFFYuyvFptp
         jI4AM3jFyf+dHRLQYLWMZJemYikZCojkR2P6ZecoYJK31HiYYs3CSMWejoCAtBKuWkT+
         gW8rfO7hy4ifhuIctZWDYoxTU9gxcZA/0nt/WdHxZ4sMywE1TYPIQvXoV5w1Wll+uR4s
         34247p/SvP5fLY9RSnPVsNGHJGTD52MYVeP4BIvhUp7Q2VMmIiZ7E1HbHWT7W2oHxG2Z
         pFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741708832; x=1742313632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BYV2O2ADUmnC4EjpgIkzJxqCjUachXXpNhXgHQTp1GQ=;
        b=p/FhccyCn5sjbub1ONMpi7RW2Rc4U6bGouYS8eWo2q+kZdBOq5ZTzaaCEVqa9RcSfr
         n5ZBTKXdeK0/QYL8l5kPIIc6wd4AzkpC75VupI+yhF3tdZK3PZIAt6/i8LyQUfLOAknY
         QC44deM8rJzAfIpAk4yKI+9h/cOpunmlX1Q4KmByiKKlY9/rbtcnMtqhupUB2XQlnHnc
         bz9p8DNvmX0c6GuGQWKiosow0fBukQFztXmh6SDGsTvW3/am6JxUJLf7YRuVTRDxap3Q
         ZDiiUrxRoAhk/TorxpxGjbud+wWVb161grPwvX9sHZyvCSMrokVhL3nzwnRDyKXcyC3O
         bRrA==
X-Forwarded-Encrypted: i=1; AJvYcCVNHRAp+iiNZDgh/gWoPtbJ+oP9A/k+gCIXKGBH+x/ExSr0rMeoPiSqFyFJ5gVPzcHzYtWdHDXDR/vYSVM0OC+B@lists.infradead.org
X-Gm-Message-State: AOJu0YzhbPAQqHeSXeelMu0Oumj7C4gLAUlGpG4R0FHzyr2mZ1wfNdR1
	+OkbBE9LzqudKA9L3B2RuBpv52GvnWUuiRrcUum8dJTbsez9lCamJZXt8MCcYlbSn53sURwiXw5
	Q296Fc3haeYmvopg1IpPfe4hEc2Y=
X-Gm-Gg: ASbGncuF3C8lOvDVKHeXigdojuMwPL7Hbze7IO1adz+vpyH0JRPNl3CpvWTDGeQPTAN
	Quq9ubcN0jACrJleAqEAFYjTb/NqirFaezQEBThswt6WkZeoQ0OIsAAbIdtY6iKtQ7IWK96oodF
	RGdhfpyomItsPew5DFLdtAM+0XYg==
X-Google-Smtp-Source: AGHT+IHivWeI31nWIIPrZrFlhM+7fp8bfXv0CzOpkZZUK77vgQDJv14Iuy7s4ylU5vfDky6AfN2vn2hLt14/RUDK+1w=
X-Received: by 2002:a05:6122:468e:b0:520:5a87:66ff with SMTP id
 71dfb90a1353d-524195bb061mr2798719e0c.0.1741708831905; Tue, 11 Mar 2025
 09:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <c499234d559a0d95ad9472883e46077311051cd8.1741612208.git.geert+renesas@glider.be>
 <CA+V-a8tGuxgan7Zx0YedSByfFSgrg5gmR6Fy3dMDXwU+TscZzg@mail.gmail.com> <CAMuHMdWXcRoqKz6S0sAtBpSM+_ghTs82wsN1dHvbHD5vO8W+7A@mail.gmail.com>
In-Reply-To: <CAMuHMdWXcRoqKz6S0sAtBpSM+_ghTs82wsN1dHvbHD5vO8W+7A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 11 Mar 2025 16:00:06 +0000
X-Gm-Features: AQ5f1JpExm6w0oXJAdyuPwgaj8C68PW5etZpDKlnT5kc8GMf1Hy-JJ74ectxF7A
Message-ID: <CA+V-a8v_FPt0XG-a8GXNaHbk9z02Phq8KWUO5E+LUKDEvgqHUg@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: smp: Enforce shmobile_smp_* alignment
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Nicolas Pitre <nico@fluxnic.net>, Simon Horman <horms+renesas@verge.net.au>, 
	Kees Cook <kees@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_090033_321239_79659744 
X-CRM114-Status: GOOD (  17.87  )
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

Hi Geert,

On Tue, Mar 11, 2025 at 3:20=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 11 Mar 2025 at 16:11, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Mon, Mar 10, 2025 at 1:14=E2=80=AFPM Geert Uytterhoeven
> > > When the addresses of the shmobile_smp_mpidr, shmobile_smp_fn, and
> > > shmobile_smp_arg variables are not multiples of 4 bytes, secondary CP=
U
> > > bring-up fails:
> > >
> > >     smp: Bringing up secondary CPUs ...
> > >     CPU1: failed to come online
> > >     CPU2: failed to come online
> > >     CPU3: failed to come online
> > >     smp: Brought up 1 node, 1 CPU
> > >
> > > Fix this by adding the missing alignment directive.
> > >
> > > Fixes: 4e960f52fce16a3b ("ARM: shmobile: Move shmobile_smp_{mpidr, fn=
, arg}[] from .text to .bss")
> >
> > I wonder if this fixes tag should go back a bit far as I was able to
> > reproduce this on 5.10-cip BSP kernel on RZ/G1E this was only seen
> > when CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE was enabled,
>
> 4e960f52fce16a3b is in v4.5, so it covers 5.10-cip.
>
Thanks for pointing.

Cheers,
Prabhakar

