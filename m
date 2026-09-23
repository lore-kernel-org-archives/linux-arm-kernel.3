Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE473C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYhzfOA6SCO7uTNbvN7IrLA5gsM9sl+9GrMf5cq1964=; b=b9gnHURd+N4ugcy9L0kl6fn0BK
	Psls4b3IeaoflR0krqQhVKt8wQskvmBu8DE8IHsAUXJKp4g442+kkIh3Er+4y1UvMeFgSOCSuNDUA
	ssNi64r5yNnGL6gejW+zRW4CuhNQCLiwQpfV1jL3lDh4+7XRAnTtOoiTl+W/6HLvmfME7VL8/LyrF
	LMBRNQxGC0zIhRcveSj4VegWuxWWLQLFbtY/aVh/RIDVPNsJWYA7QWdporYYRpdIIPXf0H4cwn2s4
	ukWkysmHiuy01hGrddke3WazvcwxOkF3T5KlUt9KtOtvLUykUkPs5hUGf6vIS0+v0o5Igx3u1sBL9
	uPVSvWFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TMV-00000009Qk0-3lO4;
	Wed, 23 Sep 2026 20:14:39 +0000
Received: from mail-ua2-x25.google.com ([2a00:1450:4864:39::25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TLt-00000009QWE-1mDo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 20:14:02 +0000
Received: by mail-ua2-x25.google.com with SMTP id a1e0cc1a2514c-982db8d3b79so449048241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 13:14:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790194440; cv=none;
        d=google.com; s=arc-20260327;
        b=OLZ4LcemxWp3Usv9lrVRpLkbyOb0mtGuj8AiP4hKTcWn+L+dpCMeLVDCITPgtaf6QA
         nP+SR13MwYCvH/AiYJz4MLoTg6DmYYub9HtFsn4uY55NXqzBY8E93LKSPg9P82W1Jz9b
         OVVLZpx9pfgkRZ/hlYSFIDlO4sItxNIruRbsuHCxkKDfKOXn7Ly2UvwFDaLgUJwQLeSm
         gIgjJw8ggcyvglP1sZAdBsjeTSpKcHY8Bb/kKotEVxnfmVlNkFVxFxjFgkfDPGDWpxSD
         hB32GqENLzoRmHbBuXZYTqrcm2K9vMS9q4husnMRBbJ/UTtP4AUM7O3WkxV4I6NT6i17
         MgzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yYhzfOA6SCO7uTNbvN7IrLA5gsM9sl+9GrMf5cq1964=;
        fh=KWZN7VN46wav5J/oii/6cLNIzkcPp01QG2pTyjCbcuw=;
        b=fzylbFnafP2tcUo+JAKYgohddGm74dH9gWgsYpyzNr/DDB/0194u60bfPGVu7lXXZ4
         p+gFbAYeWo4UvzVM+tLqaLGOYcrk+T5Yk5dJih5n+MGV0QiD2IaHLB9QR5BTxHq0Vyat
         Q6iU/vJkrUuaUf1jP2HBO59oSmwwruo5j6D6toL52l7aXhWgn/khFPAcBUD0SoL1yCwi
         fn0FijV1lqggsDRQ5krEfGRQ9koPs8V2FQSV884xGximUjt7aquBwvljD8dh1Dia5DDE
         SEjn5KXSEiuXNMHQSPZDmygAgnk9Ci2pTXn6OPaPePoWv+hNZpgdwqNad0EPepz7tN9w
         hxtw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194440; x=1790799240; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yYhzfOA6SCO7uTNbvN7IrLA5gsM9sl+9GrMf5cq1964=;
        b=LJtIf5jYFUiCx+Jhc+WWtq/odrZOm4OEi29k77LkVkJDnOQRAgM42Djd1BxUwEpUwy
         ibnBRlOn7tMGrUmW/wDoKbWTmqPloXZxMdNvTpAEG4ByZymtDdPl2D/yswMj4BxlhHS7
         jNCfQz5schchGMlvP7bIqpp1aNhlSBZS7aOOoJBqAsov9e+Q7zfWVshyySrHt1UjzT80
         xrrv9m9m4/+A9kOsAs+tAeuEm8Po/eXZVOXo9PWi3Izla9O/R7FW26BAOufMInVnkzbP
         PacPsjddR0ZB8dnwS+v1oexmQcMEpgKgjRh0KSDZMeryZV759DHXG/EDNZlYe8+sbJv4
         qSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194440; x=1790799240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yYhzfOA6SCO7uTNbvN7IrLA5gsM9sl+9GrMf5cq1964=;
        b=gCNIiTRNXnp9NOPOVCZw62VtN4gR9RWmQgPl8iIHLV3JPXOG6nmINsKJV28uDUJjog
         LSd0WKMQIh+dQz8/Jw8KTqkg1p4ujaBmE0t43ynxTpRPTqFMAtmOJIqovlcRVzF7WDMR
         Uaj/CIOGlhoXq0i9JI/MQBlHPaYeviCZiEcizUMwf3o2W0UF+Iv3aY4hWBctLG/ved2y
         3J42G7tH+x/9La6lCsRi0YuPyGoZBQHsqUlgPkJICCONka9CViaRm1pF9HFpWgUN80P8
         91e/w+mOn7oScqnrJ3j1Za80z/nH08Y7CRJUNS/G2ly/CelMVcNpfc7JLKDBGRhi81yK
         3Wrw==
X-Forwarded-Encrypted: i=1; AKwUvBz+cG1RhAoh3kbR1pAVrPhSoORTTe7m5GOQl6i/eZ2+4mikMWb66pEIr5pj/x8ypN7dIipR5wkYTc71maMWAPSm@lists.infradead.org
X-Gm-Message-State: AFuF++lzpWNcLZTIplEOtwEqSTpJiCVbSq6MvAb1s/KdZEgsuLxbrrwJ
	LzLjj/cMV5rN3eIU3bQFD5KDKlJiCLti1rAnmAuwO8DR/AktMq+bClIskYkZwfYd3N1BTxEkUoV
	qs5KgSslnke9T5zrcwSupkEKvQz9Gn7Q=
X-Gm-Gg: AYBFou0EoYAJqaW9/0rRBg3TivQjiQ0OC8kSzU/2gLNGqCvSCSZp73V4YfxyhzxFWGt
	SgjenZnlGjInKA91sOBNG+NWrRJKaB8NAwW7Pnlw2OI/BEB4YbDRGSDCVUZw+DeRuEGZ20+0tot
	7KcG9x0svUo+KwhaRgizglkUBl8esIDd0rnIdATP4pEXbA00x1iaY/S/yDsumbkxmgWzG4QoZpM
	YDYpnZGumC8cdJKbAA2AhOSzMwRBaI955Om5pC/omPGwB0Iuvs+oS7zvB+v1E1DwoJE7hUw/FZc
	A+AjBIxXGEXavnB4f7MtrVOGvMOlG9n6q1SzrUprKDzqrG0fMFTsX7ES/F4HbHgZ0CLPg4WL8uv
	mpMXLvCWjkGrL3AEYPGgwNoAUq6HQS6xDo5H3jUO1tQvtJMpy7uz1M7p0cOyK3yRlbfrEo5tKk0
	PbOulAfe4uZFFzvf9HYQCSBx5lDmio2jY1XtrGJmfpJjBp
X-Received: by 2002:a05:6102:548b:b0:7a6:d11b:16ea with SMTP id
 ada2fe7eead31-7af1c7a036amr305798137.6.1790194439982; Wed, 23 Sep 2026
 13:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com>
 <20260804-h616-pwm-v8-v8-2-db37ab8624ae@gmail.com> <arFMta6PPwmzSk86@monoceros>
 <CADvTj4r1sFjPko7G5DwrPUw9x1tPzQspJhCUmHSMtrudn7SXEQ@mail.gmail.com>
 <33e760ca-2bb4-4f1d-a736-7e74a97e60c4@bootlin.com> <CADvTj4rBUNF6EaKXbsy5t1cS0iakpWVdpQ5sQF2qLS4YyHM2aQ@mail.gmail.com>
 <58145d8f-dd16-4cc2-b2ea-d475462241ab@bootlin.com> <arOif-bN6JgLeWd3@monoceros>
In-Reply-To: <arOif-bN6JgLeWd3@monoceros>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 23 Sep 2026 14:13:48 -0600
X-Gm-Features: AclHuK9uNvVaV2VJoRguaZ7pkecy04Hwe0dR9Nt2OWuOrBNW9SpmIsO_os_jzFg
Message-ID: <CADvTj4q4G5doa-br_SvvcuSF0sMA6Vb3K8ogZL7xe=auEd_s+g@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] pwm: sun8i: Add H616 PWM support
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Richard GENOUD <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, John Stultz <jstultz@google.com>, 
	Joao Schim <joao@schimsalabim.eu>, bigunclemax@gmail.com, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_131401_516965_D05DAE6A 
X-CRM114-Status: GOOD (  25.01  )
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

On Wed, Sep 23, 2026 at 4:11=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> On Wed, Sep 23, 2026 at 09:16:28AM +0200, Richard GENOUD wrote:
> > Le 22/09/2026 =C3=A0 17:46, James Hilliard a =C3=A9crit :
> > > The resolution tradeoff is real, but the waveform API currently speci=
fies
> > > the ordering: choose the largest period not exceeding the request, th=
en
> > > the largest compatible duty length not exceeding the request, then th=
e
> > > offset. That's the ordering implemented in v9.
> >
> > The ordering stated by pwm_round_waveform_might_sleep() documentation i=
s
> > period_length_ns, duty_length_ns and then duty_offset_ns, but what abou=
t
> > duty steps?
> > It's not stated in there because it's not a user input, but still, it's=
 a
> > quite important value for a pulse width *modulator*.
>
> From my POV as someone who cares about many PWM lowlevel drivers, it
> would be ideal if there would be a generic function that only relies on
> conforming and ideally simple lowlevel drivers and work out a good
> period that makes the required amount of duty steps available.
>
> When I designed the requirements for the round-to-hw function I had in
> mind that it should be possible to find the next higher possible period
> for a given lower bound (and that works, only lacks implementation).
> Working out a period that has finegrained duty steps is harder but
> doable:
>
> But something like that should work:
>
>  - Pick a period P
>  - P*, D*, _ =3D round_to_hw(period=3DP, duty_cycle=3DP-1, duty_offset=3D=
0)
>  - Either take P* - D* as a measure for the finegrainedness, or continue
>    to research available steps using round_to_hw(period=3DP*,
>    duty_cycle=3DP*-1, duty_offset=3D0)
>  - If there are too little steps pick a different P and retry.

Thanks, that makes sense. A generic helper could build on the existing
rounding contract to select a period with the required duty resolution.

That looks fairly involved to get right across different controllers,
particularly defining the resolution requirement and keeping the search
bounded. I'd prefer to tackle it as a separate follow-up after the H616
series is merged, if that separation sounds reasonable to you.

For this series, I'll keep the driver following the existing period,
duty-length and offset rounding rules. Do you see any remaining issues
with v10 that need to be addressed before it can be merged?

>
> Best regards
> Uwe

