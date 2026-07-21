Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4577C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 07:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZzSeZR0bkDEH8l+WELeqcCX8Q33dRM0eRRSsd4cPwc=; b=S1xurTnCpk3ObjoHM4DWSdiWGU
	SuMgxWlc6wUfgiagVL+Ibwn+RUkP581T0nxTdMOZz/k/jdisFTuvWX/tJCRQ/E3b0boXEZVta9Ujt
	dpkI+RZbvslpKOfNKIAe3dc+k7ka8LQ72uW7Q9Sb6HqBTJoOQ0CZtDTybnrhk4fVg+5DOcFGHn1Bs
	xiqqiQFSNbI4gxswAXnamd2I6k3qa7M95thEmzet/egJNc9nyH09zlZiPjj7mk+f8zgm1JNgwdVqL
	UK7dI/vdtbns1iZ3RVgsnOpapBkmoLku0YhgcPNViYMLFaLQs2q4ypGSybQu1+N+SGVp79Cz03rzX
	LX94cH+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5GC-00000008hKo-3AP5;
	Tue, 21 Jul 2026 07:51:28 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5GA-00000008hJC-1iZO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 07:51:27 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-81bffd7daa7so12610027b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 00:51:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784620285; cv=none;
        d=google.com; s=arc-20260327;
        b=TIJFgUB2whrEwxqOj5YS9cnyre0cPv2b/SMjQ+op1HhM1VH7tPVw/NYRh1XgvxpBJy
         gcz6l/st/vGDpvRB6Tm+jy9rt6XLB7ljlvRzD176uyIU0rzQfJOhdEjP5V2ORfawkVVR
         /5UCP6QbUUQyM4lNW5sjnf3BWsZRSxWljWTGDTKDhWWO56Ppd1UKUhPzSxWoG0n5qgqg
         N6SwIl5v6RuNaUjRqXcqnNx0sRAG5TOMWG4XzqW8fgrBUOfbUUs8K6kicUpQWBMJvHre
         lRWvjvobSQSrJxRVdhXR3sk0J7BE/yo0bNJoVTAP4Wtxz/ix1YWNf7SeM7Phqzi2+JVY
         U5QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vZzSeZR0bkDEH8l+WELeqcCX8Q33dRM0eRRSsd4cPwc=;
        fh=3FTfErHScCjdwdVs8FXQCTIvEmohgz7fLRYMlT/mock=;
        b=NrylVgDIJpKHNEUTrb3oXVIpNp6FrxqYKgkYI829Ge/dsv1jxFXfWPiB03fyqJoKQ5
         GPhfhqoX8jbzFX3T1x723W7GT3C8XtajXzp6Yx8fP7QcP2ifF3Eu+HyZoXY25IzgokHR
         aAuyX2haXjrLfm/WMTAjYNK28xPvbe4uHlfZkNMhK+lA37k7apuJVuFWEUIzV52nQwo3
         cNhuoiZqIUEqyOCMz2c6i58C3Ch/6HrzXt5LoR58VCOB8F4fG6wCkchxOMlMih67Rkti
         6ls24ZNoABAWVY5sK5zC32fr1sedrOgLiwet4Oibvrv7hbY++RJuNCMPYdifABDgo6dK
         y2sw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784620285; x=1785225085; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vZzSeZR0bkDEH8l+WELeqcCX8Q33dRM0eRRSsd4cPwc=;
        b=R8x5NBEbmIzidRBdJjidFg/9y3U7/o9JEuIc7V/kBPReyhCiijXstblNVyGMewsZYE
         ThX2HZy4wHnUgWVkxrhiwfN/ZsuiZc2jH/dZacBhnTp3lWV9f+ljatVywX8o3XcE9mb/
         sfJRcV8KSuQie3C+qCX8bRNcXvnZ05E762Cr+7oCNQMKgjIu/EGlO0b9EPXr8PkcBaqL
         kT84IS2tGXOFH7JwhqI+UfKjoKIVm8icMOawd8CtWbJJsiUiTejngqqbCzCEJJCdC9yL
         lojJz/rOhYICChQLoc3wyM7F41adcWEIzj4tn8MBBOPHb4sGfaKYTAgcLSerMX1tC9xr
         i4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620285; x=1785225085;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZzSeZR0bkDEH8l+WELeqcCX8Q33dRM0eRRSsd4cPwc=;
        b=UeiYGAfrUpYEN8JPQeyGW5lN1xtJlntcs18OxYw4oiO+n7QzH0j07xRBLSCnAEzx7J
         fZ8eEEU/s2sVRXQPmWHkQ90x1Lklpdy2dYP+v8ocsaq/5216DNfEb9YGe3iUNiWhof0+
         dnfygfBJLU3NkKF42eZkpC38S2uMTvNladWibcuuHFLhlgRHUKD2MjJF1XdYLXRWtA5n
         CiSWid9+5BaeUv9/KCDHeBFhj2riRjILWXN3rYBkJktFSexJXQS/aHFRDoPzSlR1cpLo
         YPwuOriynCtaRPyhEozFJ4x8Ag7XzAap61WdvjxsmVdxs1TrpT6JUvaJM2SZYEbZxiKX
         RMmA==
X-Forwarded-Encrypted: i=1; AHgh+RoGyD8Kj0odGP6pt2yFUinXCVVfQmbLrOP4yl163kNu0K1m4mBIUkBY0jl4FVj9BQTyw/a47iT5YuJXUWI9id66@lists.infradead.org
X-Gm-Message-State: AOJu0YzF7Y986k1PCTIk2XIbWYba+/Qxoc7isowLV40K+KS86KW1jJVN
	PN6IhNRN5knXy4BfoCnYrTlTOCX2VfFlsCoWDwAKB+Tye62z0P/UX49MlNRjoOrSXEcKm+ylzcS
	BERslEdpdQ2KmQTOZPUgdceUy/8qXBMk=
X-Gm-Gg: AR+sD12+xLyy26f/fPpRgL5TP+WnuimDfucOf4z4z+83jiK3LaPArOB78y+FVcSH/Iu
	a1HpVOFjBMzg7fknQ81EmAoGoaC3xMnnsbtkRYgOEiRU7jPvKB2tjyO4vZfW2un6mSmhQsw1Pzk
	ItfzxsTxnZQwG+wnaGaFqFxbR7XxVmTreQBH2zNupLcwJP0h6fCEJVghOMUsdx8eGeILag1aW+W
	hj0jyhYYO1A1Sj97wQ5AMofEsvyFyJtiezbXjwmr10UcQysD1AaHnVkxcQoPbyYNcpw9x6b5tk9
	u8Ekbmx89R/B9ArGo5+/
X-Received: by 2002:a53:b186:0:b0:668:7dbd:7a07 with SMTP id
 956f58d0204a3-66880b4d962mr392625d50.5.1784620285255; Tue, 21 Jul 2026
 00:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260721064115.64809-1-royalnet026@gmail.com> <20260721064115.64809-3-royalnet026@gmail.com>
 <20260721070036.51C371F000E9@smtp.kernel.org>
In-Reply-To: <20260721070036.51C371F000E9@smtp.kernel.org>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Tue, 21 Jul 2026 09:51:14 +0200
X-Gm-Features: AUfX_myuY5cs_jihA3WZbNrynJGYGTTN4HuyfxbJXYsOu2kmiTef-qbsCaf3Zt8
Message-ID: <CAEWPSH7FZw7XDhHD6x+mWcQR2VnLs5yF5LUGMisQoCsv43-z8w@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] media: synopsys: hdmirx: add HDMI audio capture support
To: sashiko-reviews@lists.linux.dev, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005126_464363_31202DAE 
X-CRM114-Status: GOOD (  39.33  )
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

> Does this byte reversal using swab32() incorrectly scramble the N and
> CTS values?

No. This is the third review of this finding -- it was raised on v2
and v3 in the be32_to_cpu() spelling and answered both times, and the
comment above the code documents the layout. The premise doesn't
match the ACR subpacket format: CTS is not stored LSB-first from PB1.
Per the HDMI spec, subpacket byte 0 is reserved, CTS[19:16] sits in
PB1[3:0], CTS[15:8] in PB2 and CTS[7:0] in PB3 -- MSB first -- with N
likewise in PB4..PB6. The packet decoder stores PB0 in register bits
[7:0], so reversing the word is precisely what lines the bytes up
before the 20-bit masks. swab32() and the previous
be32_to_cpu()/cpu_to_be32 spelling produce the same value on both
endiannesses; the v4 change only makes the reversal unconditional.

It also remains the path validated on hardware, as noted in the
cover letter: a 44.1 kHz source is detected as 44.1 kHz rather than
falling back to the 48 kHz default, and 44.1/48 kHz switches are
followed. Neither would work if the extraction produced garbage.

> is there a use-after-free risk during device unbind in this driver?
> [video_device embedded in devm-allocated struct, release set to
> video_device_release_empty]

This one looks structurally plausible, but as the report itself
notes it predates this series: it concerns the video_device lifetime
on the V4L2 side and is independent of the audio support added here
(the audio teardown path was exercised on unbind with an active
stream during v3 review, see the v3 thread). Addressing it would be
a separate fix for the existing driver -- happy to leave that call
to Dmitry.

Igor

On Tue, Jul 21, 2026 at 9:00=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [High] The use of `swab32()` when extracting the 20-bit ACR N and CTS v=
alues incorrectly scrambles their bits. Because the packet bytes are stored=
 contiguously from the LSB up (PB0 in [7:0], PB1 in [15:8], etc.), reversin=
g the 32-bit word using `swab32()` places the LSB of CTS (PB1) into the MSB=
 of the extracted value, and the MSB of CTS (PB3) into the LSB. Masking thi=
s result produces a completely invalid sample rate.
>
> Pre-existing issues:
> - [High] The V4L2 `video_device` is embedded in `struct snps_hdmirx_dev`,=
 which is allocated using `devm_kzalloc`. The driver sets `vdev.release =3D=
 video_device_release_empty`. If a user space process keeps the `/dev/video=
X` file descriptor open during device unbind, the `devm` subsystem will fre=
e the `snps_hdmirx_dev` memory. When the process later closes the file desc=
riptor, the V4L2 core will access the freed `video_device` to decrement its=
 refcount and call the release callback, causing a use-after-free vulnerabi=
lity.
> --
>
> --- Patch [2]: [PATCH v4 2/4] media: synopsys: hdmirx: add HDMI audio cap=
ture support ---
> commit 19c9c4db1394f1dc0fc1cb44d51317198a87b078
> Author: Igor Paunovic <royalnet026@gmail.com>
> Date:   Tue Jul 21 06:41:13 2026 +0000
>
>     media: synopsys: hdmirx: add HDMI audio capture support
>
> This patch adds HDMI audio capture support to the Synopsys DesignWare HDM=
I RX
> controller. It extracts the embedded audio stream and exposes it as an AL=
SA
> capture device via the generic hdmi-codec. It also introduces a periodic
> worker to keep the local audio reference clock locked to the source.
>
> > diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/dri=
vers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> > index 25f8ca0d6d946..1b4a7fda9e195 100644
> > --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> > +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>
> [ ... ]
>
> > +static u32 hdmirx_audio_fs(struct snps_hdmirx_dev *hdmirx_dev)
> > +{
> > +     u64 tmds_clk, fs_audio =3D 0;
> > +     u32 acr_cts, acr_n, tmdsqpclk_freq;
> > +     u32 acr_pb3_0, acr_pb7_4;
> > +
> > +     tmdsqpclk_freq =3D hdmirx_readl(hdmirx_dev, CMU_TMDSQPCLK_FREQ);
> > +     hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PH2_1);
> > +     acr_pb3_0 =3D hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PB3_0);
> > +     acr_pb7_4 =3D hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PB7_4);
> > +     /*
> > +      * The packet decoder stores the ACR subpacket bytes with packet =
byte
> > +      * 0 in register bits [7:0], so byte-reverse each word to line th=
e
> > +      * bytes up: CTS is packet bytes 1-3 (PKTDEC_ACR_PB3_0) and N is
> > +      * packet bytes 4-6 (PKTDEC_ACR_PB7_4), 20 bits each. readl()
> > +      * already abstracts the bus endianness, so the reversal is
> > +      * unconditional.
> > +      */
> > +     acr_cts =3D swab32(acr_pb3_0) & 0xfffff;
> > +     acr_n =3D (swab32(acr_pb7_4) & 0x0fffff00) >> 8;
>
> [Severity: High]
> Does this byte reversal using swab32() incorrectly scramble the N and CTS
> values?
>
> Because the packet bytes are stored contiguously from the LSB up (with pa=
cket
> byte 0 in [7:0], packet byte 1 in [15:8], etc.), reversing the 32-bit wor=
d
> using swab32() places the LSB of CTS (from PB1) into the MSB of the extra=
cted
> value, and the MSB of CTS (from PB3) into the LSB.
>
> Will this result in an invalid sample rate being calculated, causing the
> driver's fallback logic to silently ignore the broken rate and use 48kHz?=
 This
> could cause any audio stream not natively at 48kHz to be played back at t=
he
> wrong rate.
>
> > +     tmds_clk =3D tmdsqpclk_freq * 4 * 1000U;
> > +     if (acr_cts !=3D 0) {
> > +             fs_audio =3D div_u64((tmds_clk * acr_n), acr_cts);
>
> [ ... ]
>
> > @@ -2765,6 +3064,10 @@ static int hdmirx_probe(struct platform_device *=
pdev)
> >                                                      V4L2_DEBUGFS_IF_AV=
I, hdmirx_dev,
> >                                                      hdmirx_debugfs_if_=
read);
> >
> > +     ret =3D hdmirx_register_audio_device(hdmirx_dev);
> > +     if (ret)
> > +             dev_warn(dev, "failed to register HDMI audio codec: %d\n"=
, ret);
> > +
> >       return 0;
>
> [Severity: High]
> This isn't a bug introduced by this patch, but is there a use-after-free =
risk
> during device unbind in this driver?
>
> The V4L2 video_device is embedded in struct snps_hdmirx_dev, which is
> allocated using devm_kzalloc() earlier in hdmirx_probe(). However, the dr=
iver
> sets the release callback to video_device_release_empty in
> hdmirx_register_stream_vdev().
>
> If a user space process keeps the /dev/videoX file descriptor open during
> device unbind (such as during driver unbind or module removal), the devm
> subsystem will free the snps_hdmirx_dev memory. When the process later cl=
oses
> the file descriptor, will the V4L2 core access the freed video_device mem=
ory
> to decrement its refcount and call the release callback?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721064115.64=
809-1-royalnet026@gmail.com?part=3D2

