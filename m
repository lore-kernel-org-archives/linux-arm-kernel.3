Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202F1C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 11:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vt2l2OcHA0eMP2cNyDZEsGAIycIWGJ5grI24JGOYQmM=; b=aX+wM3qgtWeIR3w/jRYUJGmDc1
	UdXxfpbhOrPiPn3co38Ki7+OJBKoHwQMB9bQwTdroaN8TNFsQCSqBgcygWBQ+Ma8RhRkD9xF8owVI
	4NO7OEm8AOAC5jruXIERcTSXJUdw4TlmcDFWXUEjiICz6s9VeBDCvHmFE1Hm8a1EWGA+iTe4yZ8PI
	Pi4kBwkekw/BST526v/7zR/RHskqvrQ0gNwZb3kJT7vZvyp8mDQ9N/rSkcJ1wuVblJkdq9qPx3SLR
	0mg1a+ZuqHySFl8OhwiivusEWoN1d1ub/RdNN1riGCBcwleluLIBIwbPp4eoP0wdd+XB+SjkGU3Wl
	bUZ5h7Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl2qf-000000041rV-10Um;
	Sat, 18 Jul 2026 11:04:49 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl2qc-000000041qd-0Vxt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 11:04:47 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-667b9bee563so1048823d50.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 04:04:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784372685; cv=none;
        d=google.com; s=arc-20260327;
        b=nwbvQF6emZzDtLUj7UZu+GNJkGV7pWgef6fheNL4vRq9zx9qlj3YURhCqn7/W0R08x
         ee4pwM5qDAFTfUR0EDs7nuYUur606SKNN8YUdvVTHuWprHzxMmxVCamYmj64anjljXxQ
         6LePizfIFDQYTugjbWo8jUKs7OX1IWJvop1LFAWRhyQ2NO3bWq7JY41iFTWeVhSrRvMQ
         yxAAieAOEifvrVmzB6MSKwRw9ZEFIMLDGbROVYctkVx8jOGv87Cvwt+XBXnbJr1u5sLl
         I1VpIZEjqMlkWYp5ObZM6fjEZwsinf4HMVc6blvjcDZ4SAXKg5ELNZ/gm3nDtVhVz41D
         R0sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vt2l2OcHA0eMP2cNyDZEsGAIycIWGJ5grI24JGOYQmM=;
        fh=cBarEbAuyQGkUw9GMmWbw7y73BPdRQKSow6MZRE4qa8=;
        b=fmlpOsdTUAA3ujd5eE6DtrG+RCOh+H7sN8UhJ8KMQlbBi31+jfXFUOAmaXDJC3qEUp
         RIG1rT8lMn52KsvloPQOEVlbt8j2Xsw9iiZDKAu9/PGh7D/dGEJW9I2PSM7vKz2MpgcH
         7d3IpHFiPOcy6uAFfuqdiiZqx9tr83I+zMTtxlRbEdHoLU3/WDTW4eSstBXRq7PWujRZ
         OvGXXMOXfTgrs9Zr3R9Goc/YB8aVyKjyAJZwt6lMh67U2AlhcW3lt5ujvHSLToI4icXT
         Vi/wsxupQo2rQt1eh/+VTuXXoV6+vQPtKXbfRZjePvXOvLgvaorTi49Oe94qO42ZaHqX
         mHtw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784372685; x=1784977485; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vt2l2OcHA0eMP2cNyDZEsGAIycIWGJ5grI24JGOYQmM=;
        b=oF0X/cmmkoQb15KtQwj1RKglLEW7+5g9UEqqTY+pWt6MCTBRQlTelS/e2JgQ4hBbrE
         dCJ5cQkPUdoeTI8F35p+KdgVaEprz++nerP4wfG3VeTpD41gDGFEqChj0vy1NbiVFpB3
         RRK+BdbYL1CNnCCZlXmswY+fY+cQb6d84xMiHTMCIiWlP/PmuCI4nBJ26RUrxIDZk8WR
         TjwNaeg8E2EBqS/mZBB9HWKJ2XxX5jHpymATb47vbWLgrj5WgDpqH+DfcMe2mU9Bp6gR
         lmiVvU/ryEJu1V/JXMPFTOnE3Wv9qQMoVLZQQ8b8agoy/09e7u2VgHgNxgtq6XrQ+Si7
         WWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784372685; x=1784977485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vt2l2OcHA0eMP2cNyDZEsGAIycIWGJ5grI24JGOYQmM=;
        b=SLIlyv6TjufD2O3RANVr2AHYFJP07E91ww63SxTjHLAPp0FFHkc9a0LXmsXtdzEyY2
         sQwP/RTsXxukFf2nCWEeIqXvCgHTO2/XaZ4qWggrBnQ9u+1ESatWTZsy86Nu8qjkWU0Z
         xkTB8NJge6Nvw1nxD9rkgme2Gom7RzrINeSyjmCptnB2m8UtvjYNscJeiOa5mmqzoyq2
         Dmh8BZh4FXyIMxTJjyVcmAald4SNzyewBZIiXSK7sadrCCvK3k30+swGL2VXtcrBrAXK
         DtNeBveIDH6YRf4wgDFqWEPuGb9iFUIPUouga/3DxYXdkV+jBsYE8XOwq7G2lIBn29pE
         uxDw==
X-Forwarded-Encrypted: i=1; AHgh+RqU906PEL6QMoShKB9lR0BFaFLJ7XeKwkjVGNuK/ouqkbrmmeBjoDNV92Gic4lBB3rBnanB7uurZdzyWM2kSTLF@lists.infradead.org
X-Gm-Message-State: AOJu0YwUkiLG4r/v1gb3boPuSNo46FP3J3x7VLDV82mDQkfwRn/cuDq/
	uUgfIdSuppz/0efTR/6CMSht3MIfWuUHYlWu2mnwmSbW48ydTCrNJICXMCMV4lFOUPcq6AXa2Gm
	Lr2Ow5A/CU9vfPqmW1YqkkXoLeuDRsWY=
X-Gm-Gg: AfdE7ckvmW4+sJlzmZdQksyMzwDr5Qi9e7n2jTvzb+nkjqf2vRvGyaDj8wdntONshmU
	uJD//j+bKXDRpWzqozZznGjvUWfQnkiZm5dc45BnkSEw4+8Vggi2jrfDorOmlf9fqYpH8ScEREa
	t1bUp1zbjW+Wy7H1fCH9Dg3Jw+VsIAsR1gxWfM+95cR4XXT9mvM0/sfM56kADZ6ljwq16dMxDxM
	MIh6irMw53BUnkSTHpPl2Isjo3onVTms9mFrCBDeEBts24+R4WIpkVrDih29228fetorAau8Uhe
	LQ48eMY6pUM3OSoaFY+GCYfA+cPU5Q==
X-Received: by 2002:a53:b19d:0:b0:667:8db0:76a7 with SMTP id
 956f58d0204a3-6683be700d6mr1278751d50.9.1784372684813; Sat, 18 Jul 2026
 04:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-5-royalnet026@gmail.com>
 <20260718091200.65AE21F000E9@smtp.kernel.org>
In-Reply-To: <20260718091200.65AE21F000E9@smtp.kernel.org>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Sat, 18 Jul 2026 13:04:33 +0200
X-Gm-Features: AUfX_mzv1PFiBSswpTxs5ztrtbcERZseF6OCGF3wFsdhSvoLcm5qvDBSH066Hi4
Message-ID: <CAEWPSH7CMoQB=ypHQvrV058VxpX_+Wdfthb9SJrHczVPZKqmcQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: enable HDMI RX audio capture
 on Orange Pi 5 Plus
To: sashiko-reviews@lists.linux.dev, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	linux-kernel@vger.kernel.org
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_040446_207596_7551D2E3 
X-CRM114-Status: GOOD (  27.52  )
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

> Does exposing this codec to the ALSA subsystem trigger a suspend
> regression in the hdmirx driver?

Good catch -- this one is real. The audio worker missed the pattern
the driver already applies to its hotplug and res_change works,
which hdmirx_disable_irq() cancels on the suspend path. Fixed for
v4: suspend cancels audio_work before the controller clocks are
gated, and resume re-arms it when a capture stream is active; the
worker's FIFO error path then resynchronizes the clock and the FIFO
on its first run after resume.

> Should swab32() be used here instead to ensure the byte swap happens
> unconditionally on all architectures?

Yes -- readl() already abstracts the bus endianness, so what this
code wants is an unconditional byte reversal, not an endian
conversion. Switched to swab32() for v4 (no functional change on
arm64, where this controller lives, but the right primitive
regardless).

Both changes are in my tree, compile-tested, and will be part of v4
together with whatever comes out of human review of the series.

Igor

On Sat, Jul 18, 2026 at 11:12=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] The audio_work delayed work is not cancelled during system suspe=
nd, leading to a fatal bus fault.
> - [Medium] Incorrect use of be32_to_cpu() for unconditional byte swapping=
 breaks audio capture on big-endian architectures.
> --
>
> --- Patch [4]: [PATCH v3 4/4] arm64: dts: rockchip: enable HDMI RX audio =
capture on Orange Pi 5 Plus ---
> commit 030cd8fd5334b79e1751dec57b1de1f5fa4e3df3
> Author: Igor Paunovic <royalnet026@gmail.com>
>
> arm64: dts: rockchip: enable HDMI RX audio capture on Orange Pi 5 Plus
>
> This patch routes the HDMI receiver audio to the i2s7_8ch interface. It c=
reates
> a simple-audio-card configuration to expose a capture-only ALSA card driv=
en
> by the HDMI input. The setup uses the receiver as the bitclock and frame =
master.
>
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/=
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > index 145986695720a..2a68610cddbc3 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > @@ -37,6 +37,22 @@ hdmi1_con_in: endpoint {
> >               };
> >       };
> >
> > +     hdmiin-sound {
> > +             compatible =3D "simple-audio-card";
> > +             simple-audio-card,name =3D "rockchip,hdmiin";
> > +             simple-audio-card,format =3D "i2s";
> > +             simple-audio-card,bitclock-master =3D <&hdmiin_codec>;
> > +             simple-audio-card,frame-master =3D <&hdmiin_codec>;
> > +
> > +             simple-audio-card,cpu {
> > +                     sound-dai =3D <&i2s7_8ch>;
> > +             };
> > +
> > +             hdmiin_codec: simple-audio-card,codec {
> > +                     sound-dai =3D <&hdmi_receiver 0>;
>
> [Severity: High]
> Does exposing this codec to the ALSA subsystem trigger a suspend regressi=
on in
> the hdmirx driver?
>
> Looking at the underlying codec driver hdmirx_suspend() in snps_hdmirx.c:
>
> drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c:hdmirx_suspend()
> {
>         struct snps_hdmirx_dev *hdmirx_dev =3D dev_get_drvdata(dev);
>
>         hdmirx_disable_irq(dev);
>
>         /* TODO store CEC HW state */
>         disable_irq(hdmirx_dev->cec->irq);
>
>         return hdmirx_disable(dev);
> }
>
> The audio_work delayed work is queued on system_unbound_wq, which is not
> freezable, but this suspend callback doesn't cancel it.
>
> If system suspend is initiated while audio capture is active, the worker
> could fire after clocks are disabled via hdmirx_disable(), resulting in
> a bus fault when it performs MMIO reads.
>
> [Severity: Medium]
> Will this audio capture work correctly on big-endian architectures?
>
> The underlying hdmirx_audio_fs() driver function uses be32_to_cpu() for a=
n
> unconditional byte swap when calculating the ACR subpacket:
>
> drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c:hdmirx_audio_fs()
> {
> ...
>         acr_cts =3D be32_to_cpu((__force __be32)acr_pb3_0) & 0xfffff;
>         acr_n =3D (be32_to_cpu((__force __be32)acr_pb7_4) & 0x0fffff00) >=
> 8;
> ...
> }
>
> Since be32_to_cpu() behaves as a no-op on big-endian CPUs, the bytes rema=
in
> unswapped, causing the bitwise masking to extract the wrong bytes for the
> ACR CTS and N fields.
>
> Should swab32() be used here instead to ensure the byte swap happens
> unconditionally on all architectures?
>
> > +             };
> > +     };
> > +
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718085728.67=
97-1-royalnet026@gmail.com?part=3D4

