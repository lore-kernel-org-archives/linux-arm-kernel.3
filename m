Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF90DC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 10:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5VfXhgwYuTBmwNIMAkrlRtJzbyswvn4JxfZ/7609S8=; b=ugZ8L37Nc8fH/9lk3UpPy2k4fe
	NAgzxtUPwSzltfyjrOh+d3IfnxBPxVFzWv/1AprA6dob/xc7z6gFa969n48r8nq9h9wntQ5ks3XMX
	5lx1laHhmMW9XSOgsT3dsxFbeA2QqRN7JR6tpIu5OYPlRgsJzTpIcrwhbH8Ddp0Qe/QuqVoAXQs3o
	BgUhs1tH0BWIl/Yp7IY3RR33imD3S273QYU3SPT5y0xv397KAjkmDAt6DMMCfWR1hJXuulfag6Sca
	Rd/yXo8ar0GrQasgRxlW6VUIwCkVFS9/V2m8pl4V8kTcYsn6j+dsrdCgn2nWWCNYdsVnoRUMJOJLz
	lZriSGRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl2fe-000000041Ic-41qA;
	Sat, 18 Jul 2026 10:53:26 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl2fb-000000041Hs-3nHM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 10:53:25 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-667b9bee563so1048201d50.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 03:53:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784372003; cv=none;
        d=google.com; s=arc-20260327;
        b=Xgo4NtLUUBVUIXZRDTJyvQHbQbTQPCrgPu/J5+Bb/QQLu5ltxUt0eful+rJ4Z8QoYe
         Ol0/O2m3CIULlKZkU7bK1HYK/n1u8vJcodUnzV3/5p9zs1oEkUamNHfIHGE9fuCuUgaW
         FgpPTwExVBy03uSC6deZJXOO5U9OmdDv9WOBSLjHZuWzblth7rOEFYeFRLkjT6LI+EB0
         D8ZyUarpeFb/lMdhIxjwSpKxoEe1eez99xFZPFVCoerkh46ldl21BAj0TZide9yBYX+A
         Ss2dKyTgUMlVaCTmRUI1HJEX52skNoncWztiV/7GETFqn7nKNOT6HYTG0MlyMylAv43g
         LiQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g5VfXhgwYuTBmwNIMAkrlRtJzbyswvn4JxfZ/7609S8=;
        fh=zWWP1CodVh5XdHAsu8ZVAThG+2TAxJ7w/iwAWt1PSeo=;
        b=BMguafM3BOK+wSWbGRXBP302ahJCQ5OPG73GggL4GVagwt1AMi8g6dLwRpOwxBCrax
         cjlYVsNGMsZVrvF27PFcLkBbUaz/WG+JPu6ps8aw0Pd6sPq1KdbxG8i7ZXTPCKaAElLD
         wF1GBbdXukJCpFa9GKJYjYeg9X4EodXuHEC33RUzb7hZbDdwX0QTbKS5WjmR9WiZZA1z
         inMk+NobaxCvuKyAzT12hEb8NliUp4pg2lNRhZLbkYH3PCbyX3WvDqmxJe75ug7qbcGt
         RdnogHcT5H0tVUEcTn7HAwSrXUHOjPlZi3BMa4NEuLPNfb3jCEd4n4ai9ihGOda/CyCq
         y+jA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784372003; x=1784976803; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g5VfXhgwYuTBmwNIMAkrlRtJzbyswvn4JxfZ/7609S8=;
        b=gRioDwQtoXVtch8/C8NgF4EhGBNQid8dCJxbt5iHI5PqHcHVwEngrQtjG1ISzpwRU9
         dPPlV1p09po+lJ+2sF2H/G2eE+fG843Ef4o/okuB0OIzETJt2ufT9icieCZq+uUnj1ZE
         drov/+aX0eFwN/YRa1A+HlQe2887pQiGjUGyLDqRt2Tstgsg5vwNOxRyjv6ee6vUnxC3
         n+mx2Y27zKCSmbTyqo3EFl1DwI71Ka4vrtj9rzCdvfPJsbRb6sCcR+0ftVdXm7oqwJws
         YB0C3E1YgbPkCAm5DrmCe4iDgLR4LVTc1ZRYQ57vtiSg+IVeyuywBXYjUzEL3r5kJUUI
         sVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784372003; x=1784976803;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5VfXhgwYuTBmwNIMAkrlRtJzbyswvn4JxfZ/7609S8=;
        b=kim015NFjOIDDODamoDdnUq8ldQOVe1vUkUDzxglEUDYLl1t2+K5elTdvqAlJNwFB0
         I1LFMshA1NIU8Rikpwr/PjACVLxaPqpL2Jyl7Ao5qOHK8ZzdADZDD4myIJlz5uiT/eLl
         HbIBvTOU3Yo1Ryfkw1YXQK5e/vAJv2dRQPXPCHmfAPXOjZ7uGZgPNXAzz8B0Q+ope2B5
         kKROhMQZxqB5yjh7TjT1/l1nZSBLdq6Xk6k2AJlvb+FiMEsKYSgn7KaOn9k5r9B8fQDH
         iRnnBHwMyA56X6GjYQ+jDnKhaz+xufDMHB01bXJoEfIR8Kgm2jPbMwTvVJeFS+30AZtw
         nSpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrp6fcTM+Pocq7bBl4aejAlylhS+p6AzKdOmH/9wHJ9HjgN5Fa3LWJAI3XIFBw9p85Vm6ZrxjiJRHXWEXI+vd6t@lists.infradead.org
X-Gm-Message-State: AOJu0YwhS23tL9nXHaNBxMXqNizevFp5AIFdq26FLa3CfEhyEaztoI2L
	AlcNW9/LbncJ0ZRQv0NSB44krGLz6QvAzEF895G2tT/EIJrv/Hek4DLa/YxLsR0qigMMopLFwMq
	9EwnJDHlKZpDungunB/dXr+WihfUPx7Y=
X-Gm-Gg: AfdE7cloKRMudEicsxWl5pVNZllyec9gF1HaBztpt4Lg4i2atmBCU+rRa+UTtw7NSf5
	DfSVMV6zFBS3ndHmgVN1plcnC5wdxk/WWO5af1ZCAJrUnler5dw69X6rLfudBFnuKS+t9N129mv
	O5h52gEO2Vdf+Kl25s1INBvIQ7VwFKtmxxBuQIiMBMqE/gOkVpyIhEMqjQ49h+Ybd8JeAAbFZOq
	UrzcF19F4mw+BnxJnnQEkjD1sJP9RTzCv+HG+ow1Eqsb4DKYCpBi4rfQ1xhA7ibZVvx1afnuvs8
	pGaRyPgu7YC/K8cPaAQ=
X-Received: by 2002:a05:690e:458a:20b0:664:f227:385a with SMTP id
 956f58d0204a3-6683bdde001mr1424612d50.6.1784372002826; Sat, 18 Jul 2026
 03:53:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-3-royalnet026@gmail.com>
 <20260718090955.A79E51F000E9@smtp.kernel.org>
In-Reply-To: <20260718090955.A79E51F000E9@smtp.kernel.org>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Sat, 18 Jul 2026 12:53:10 +0200
X-Gm-Features: AUfX_mwF1UuqQgMjQjfeJUF2YEeUCF9mcy5VYFqR6MQOo8I3upFsyKrktRhAwBs
Message-ID: <CAEWPSH6AFkMEVLJQxt4X554w47S6iVzupxh=eL_Rrfbcmb-hkA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] media: synopsys: hdmirx: add HDMI audio capture support
To: sashiko-reviews@lists.linux.dev, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	linux-kernel@vger.kernel.org
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, 
	media-ci@linuxtv.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_035323_965926_1FD437CB 
X-CRM114-Status: GOOD (  34.51  )
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

> Does this byte-swapping logic scramble the extraction of the CTS and N
> values on little-endian architectures?

No. This is the same finding as in the v2 review, where it was already
answered, and the comment this v3 adds above the swap documents exactly
this. Two premises in the report don't match the ACR packet layout:
CTS does not live in PB0..PB2 and is not little-endian. Subpacket
byte 0 is reserved, CTS[19:16] sits in PB1[3:0], CTS[15:8] in PB2 and
CTS[7:0] in PB3 (MSB first), with N likewise in PB4..PB6. The packet
decoder stores PB0 in register bits [7:0], so the byte swap is
precisely what lines the bytes up before the 20-bit masks.

It is also the path validated on hardware: with a 44.1 kHz source the
card reports 44.1 kHz rather than falling back to the 48 kHz default,
and sample-rate switches are followed. Neither would work if the
extraction produced garbage.

> Can this lead to a use-after-free if the driver is unbound while an
> audio stream is active?

No -- the synchronization the report treats as missing is provided by
the ALSA core, and relying on it is why the v2 workaround was dropped
on Dmitry's review in the first place.

The worker is only ever armed between hw_params() and
audio_shutdown(). If a capture stream is still open when the codec
platform device is unregistered, teardown does not complete until the
stream is gone: soc_cleanup_card_resources() calls snd_card_free()
(sound/soc/soc-core.c), which blocks in wait_for_completion() until
the last file handle is closed (sound/core/init.c: "wait, until all
devices are ready for the free operation"). A disconnected card still
routes that final close through the original release path
(snd_disconnect_release() -> disconnected_f_op->release()), so
snd_pcm_release() runs soc_pcm_close() -> hdmi_codec shutdown ->
hdmirx_audio_shutdown(), which clears the streaming flag and
cancel_delayed_work_sync()s the worker.

platform_device_unregister() therefore cannot return with the worker
armed, and the devm-allocated state is freed only after remove()
returns. There is no window for the work to fire on freed memory.

Also exercised on the Orange Pi 5 Plus: unbinding the driver through
sysfs while arecord was actively capturing. The ALSA disconnect kicks
the reader out with ENODEV, the file handle is closed -- which is
where audio_shutdown() runs and cancels the worker -- and only then
does the unbind complete. A subsequent bind re-probes cleanly and the
card comes back. The kernel log stays free of warnings throughout.

Igor


On Sat, Jul 18, 2026 at 11:09=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Incorrect byte-swapping logic completely scrambles the extractio=
n of Audio Clock Regeneration (ACR) CTS and N values, breaking sample rate =
recovery on little-endian architectures.
> - [High] The `audio_work` delayed work is not explicitly cancelled in `hd=
mirx_remove()`, leading to a Use-After-Free if the driver is unbound while =
an audio stream is active.
> --
>
> --- Patch [2]: [PATCH v3 2/4] media: synopsys: hdmirx: add HDMI audio cap=
ture support ---
> commit b04bcd22f40b424aac824100715c46f764531875
> Author: Igor Paunovic <royalnet026@gmail.com>
>
> media: synopsys: hdmirx: add HDMI audio capture support
>
> The Synopsys DesignWare HDMI RX controller extracts the audio stream
> embedded in the incoming HDMI signal and feeds it to an on-SoC I2S
> controller. Expose it as an ALSA capture device by registering the
> generic hdmi-codec as a child of the controller.
>
> > diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/dri=
vers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> > index 25f8ca0d6d946..22f50cbf3fa7a 100644
> > --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> > +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>
> [ ... ]
>
> > +/* Recover the incoming audio sample rate from the ACR N/CTS + TMDS cl=
ock. */
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
> > +      * 0 in register bits [7:0], so byte-swap each word to line the b=
ytes
> > +      * up: CTS is packet bytes 1-3 (PKTDEC_ACR_PB3_0) and N is packet
> > +      * bytes 4-6 (PKTDEC_ACR_PB7_4), 20 bits each.
> > +      */
> > +     acr_cts =3D be32_to_cpu((__force __be32)acr_pb3_0) & 0xfffff;
> > +     acr_n =3D (be32_to_cpu((__force __be32)acr_pb7_4) & 0x0fffff00) >=
> 8;
>
> [Severity: High]
> Does this byte-swapping logic scramble the extraction of the CTS and N va=
lues
> on little-endian architectures?
>
> Since the HDMI ACR packet transmits the 20-bit CTS value across PB0, PB1,=
 and
> PB2, and because it is little-endian, applying a bitmask like
> acr_pb3_0 & 0xfffff natively yields the correct CTS value without any swa=
ps.
>
> By byte-swapping the 32-bit register, the bytes are completely reversed.
> The subsequent bitmask extracts the lower 20 bits of the swapped word, wh=
ich
> correspond to the lower nibble of PB1, all of PB2, and all of PB3, discar=
ding
> PB0 entirely.
>
> The same applies to acr_pb7_4 to extract N. Will this regression result i=
n
> garbage values for both acr_cts and acr_n, forcing the driver to blindly
> fall back to the default sample rate?
>
> [ ... ]
>
> > @@ -2784,6 +3052,9 @@ static void hdmirx_remove(struct platform_device =
*pdev)
> >       struct device *dev =3D &pdev->dev;
> >       struct snps_hdmirx_dev *hdmirx_dev =3D dev_get_drvdata(dev);
> >
> > +     if (hdmirx_dev->audio_pdev)
> > +             platform_device_unregister(hdmirx_dev->audio_pdev);
> > +
>
> [Severity: High]
> Can this lead to a use-after-free if the driver is unbound while an audio
> stream is active?
>
> The v3 changelog notes that the synchronous cancel for the audio_work
> delayed work was removed here under the assumption that audio_shutdown()
> handles it.
>
> However, ALSA does not synchronously invoke the PCM .shutdown callback
> when a device is unregistered if a userspace application holds the file
> descriptor open.
>
> Because hdmirx_dev is allocated using devm_kzalloc, it is freed immediate=
ly
> after hdmirx_remove() returns. Will the un-cancelled audio_work delayed w=
ork
> subsequently fire and access the freed hdmirx_dev memory?
>
> >       v4l2_debugfs_if_free(hdmirx_dev->infoframes);
> >       debugfs_remove_recursive(hdmirx_dev->debugfs_dir);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718085728.67=
97-1-royalnet026@gmail.com?part=3D2

