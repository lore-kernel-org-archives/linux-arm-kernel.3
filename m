Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344C2C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 05:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2TB196GaR66SwyFsnNzabKS/+vodO/WvG61qZe4uFOY=; b=MryL1hOFKdlFoxqEaPhf9SYcSy
	IzmFs3LQia/l6Re9gw3orK7kKMlNldflZDGizxDa6zDt/JUswYUpo73xyUoGoZRKNlo9xyC9v+6FU
	KhhoX6B1anXmk8SJwrPorEhpu7XyLJwINbfq6e2F2dMC5A84C6LHD5rIw0pz2yu+Y+DMeLYDY+wNp
	X5D4qbmqDfE/zQdFlHuvtWICX6ikDU8B2ivCrCf1jp4N9rdvq/oK2Jt8CwVhHayeGVfob9egC+ugQ
	H02JAZ08XnizOGq1gtiO9W6dRN9HpVGbFn9rZYXh5UENlycjSEidinM+1DIEMrbrwTtAO0FjepmyQ
	qM+hRRrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm34j-00000008SJ7-00YK;
	Tue, 21 Jul 2026 05:31:29 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm34g-00000008SHB-027Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 05:31:28 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-6646fd19d8cso1288843d50.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 22:31:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784611885; cv=none;
        d=google.com; s=arc-20260327;
        b=AOd6Isb9+t3RkL0tRvM9CSB6J5geI/USwIl8MGmKob4IhE8iT2/eQ19fptwuNGv5pi
         3NkCPpXRJQBKu4stSXJgkVyrn3FcCM+8l32M9Ekjv+yVFKL/n6cVs75D2Wn/9zZHdhQ9
         BGJqSGPTjyTB9gbQVgOob28mU8RFxdbrwSjZuo1QDFSwq23zi95ji4s5jSnIBYdNUyfD
         RwrHUNafllJjnbrWdw9JuBEnxqiMh5QHWejSCK5MElKE0y6aQoeIwqT5dNg9ylr4ov2M
         KZFpjAnw8Q2tXI7Yj1Xllz5L7rN/JQlCIRac1HcaCo/9OHMm163uQIogX9ZsoPbSdOVE
         ySZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2TB196GaR66SwyFsnNzabKS/+vodO/WvG61qZe4uFOY=;
        fh=ViXl3jIt4MIJ+E8szO0pkZUZz14IsDoZ5IfzIPYJgiE=;
        b=hFEXrYZgRNTHD+8PUch4fyEYhhoGpf9fbnnKjOeFcUbnXV5uUWACSj5rRM7CEFtalL
         c4KctlcDcgdv9Sqf8KScpE/4ZDqwiMgEV8VhmuDUrMOBVin5CkC/tdTtK6436u8NEzZF
         clEz6nvg7wN4t03mfWDa579tl4pxeUvFzRNUDzyqdWtMKVdd/RCGYLTAPSjvYwss2Rih
         iWdKYIwKzwiOCyrxz4ubjnpUtU9Lh9dgmkwuAYddU9B90OpEXrl8PXHmbUx8K4Fd6JkD
         bn+1XJvnMDL4O4g9XrFzdAQdLtgvbkK76iTfILNhcTTSSAFcXAr0B/xqoY0Ppt3O8cKE
         xatg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784611885; x=1785216685; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2TB196GaR66SwyFsnNzabKS/+vodO/WvG61qZe4uFOY=;
        b=lnINvsapdSTyI/P8w5EIZnYndNRP3Vik+hmKc0f2D6P4DDofwYCT23DzELI5Oi1d3O
         xWqWD/fnQfBASyMZN7Mc/raJZ+yZkGFdaUQCXLOIVrt3I8CyvWvMDt0I5MYwR4WMfW7k
         mySyBIUEkoJx3/taTz6Y7svIlwRRNwcvp9bPCN3Wfv2XYYjYcq6EcbHUlTkG8BFaGFPg
         Yad0/9Eu0UX/n+8+z9GYuwC6p6bDy9xgQbrAH6Aa8VRI36ylH5okvymE9/8ZO+gY6Kzf
         TRfRxMxiZf8ivfGc7/NJKAwga7rF4F1SGI5tqdu9yaLxyAPFd+4qeHLU9S5VcsXoTEae
         YKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784611885; x=1785216685;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2TB196GaR66SwyFsnNzabKS/+vodO/WvG61qZe4uFOY=;
        b=XRAkJEhxNWQ8sKJZXPvS1xQ88ilOX91/Yw6YgpwnjSq3WfEy1zl4oWT+CboAzo6gLS
         94K/mxW5jvfo/riG3WrbeSPK8FL/PKzdUAcb/FaxbvKbfhbm8gBNT7ZrZrCt67lWqZ5x
         14VZk1XEYzEhcGMaPFNWbfCFR/iVZ79+QWU7Vco/xwB+oOxIC6/BYxM/WQBgXGgS+WRv
         fB60YvZzS+Eu5hX3CxcviQL2LjU1ch5M+ICeEAuxTL9FH+J15SGiP+iQGOSG19MsdS77
         z3aUknyShxP42D22XebwrgE/ECMO1E3WgTG8S3Mc7jOoHF6Ee9QDhL53oOjsLolZAEAM
         KsCQ==
X-Forwarded-Encrypted: i=1; AHgh+RriMSe5tr3Lgx6cPMacfHH9DjAj9M1k6FQV2aMC9R0G/dGC1sLCTes+H8wR2XFYsfdSH2nSU+mEB8IcbHRLmtx6@lists.infradead.org
X-Gm-Message-State: AOJu0YyvlaTyk38ON/yQD+1LJyjbsnqRzutpw/PMw8NnjLl6dl0wvjMe
	UI2MotznqoyQd9AbNLiN78+gV+o6tmjg4QkdvH4NXZOfpQFDrQspwpiI1tmuwOKtUGims452USY
	C8nesxE3qxV/vVYgUZNCr7kSe2qSU0tw=
X-Gm-Gg: AR+sD10d4DPrhj6IcxIH35R0IQCAGcA0Lpmvi0ZD4bmFZBeuEiMCKeKYWSe3nxrZ0hc
	POQngszxPnodEBXO7n6YTf2iVJzK/DbUknqokRvKG+N3nuBGCweqTcKPlfTnhV0ZAU/2b5aVP9W
	FWTeghX2i6i077M8h3hOXljmWj/CD+S5jZal3VSUzlmI+DEGFc6ZqU1MdiczouLokyeljb1BrZg
	FT9rT1rY81nID3BSZzDbjmw8bI8rZfKwlFUMoHBBijCLgwUissQIeeuMSTl9mtMhUNWsfwwTO49
	sEeTtLJU5Hm9hHZS7fy4
X-Received: by 2002:a05:690e:e26:b0:664:ae68:33d7 with SMTP id
 956f58d0204a3-6683bdaf398mr3367592d50.9.1784611884801; Mon, 20 Jul 2026
 22:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-3-royalnet026@gmail.com>
 <25922edc-4ff1-4d28-9a64-2c28b2b690cb@collabora.com> <CAEWPSH70FecQRuGtA=S8+_CnLY5sMyf1j57Uwzwv54zceS1HZg@mail.gmail.com>
 <b8d63f61-b73e-412e-8119-ced1afdd4551@collabora.com>
In-Reply-To: <b8d63f61-b73e-412e-8119-ced1afdd4551@collabora.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Tue, 21 Jul 2026 07:31:13 +0200
X-Gm-Features: AUfX_mxmfnzPqEwa71ax-VO-JiPM0c52nSKLc5Ko0WZ2ScXDIi8A0Y6FL5e5p2A
Message-ID: <CAEWPSH5j3tYNb1JKRGwa00PVnYAgCKS+B-Qz07D8Z7TJea5cMw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260720_223126_099887_DC66BB7E 
X-CRM114-Status: GOOD (  27.56  )
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

> Re-arming will be best option if it works properly.

Went back to it and made it work properly -- with one honest caveat
at the end.

Plain cancel/re-arm could not have been enough as previously
written: hdmirx_resume() fully resets the controller via
reset_control_bulk_assert/deassert in hdmirx_enable(), wiping the
audio configuration (I2S_EN, AUDIO_ENABLE, FIFO thresholds), and
the worker's error path never re-programs those -- it only resyncs
the clock rate and reinits the FIFO. So v4 does:

- suspend: cancel_delayed_work_sync() on the audio worker before
the clocks are gated (audio_streaming stays set);
- resume: if a capture stream is active, re-program the whole
audio path (clock from the last known sample rate, FIFO
thresholds, I2S_EN, AUDIO_ENABLE) and re-arm the worker.

The programming is factored out of hw_params() into a shared
hdmirx_audio_setup() helper so resume and hw_params cannot drift.
I also checked that nothing in the post-resume hotplug re-init path
(plugout/plugin/submodule_init/controller_init) touches the audio
bits, so the restore survives the replug dance resume triggers.

Measured on the Orange Pi 5 Plus (pm_test=3Ddevices, i.e. full device
suspend/resume callbacks, active capture stream with live audio
through the whole cycle): on resume the capture simply continues --
audio was flowing again the moment the display came back, no
userspace intervention, clean dmesg, no oops in any of the ~6
cycles exercised tonight.

The caveat: a *second* suspend/resume cycle in the same boot leaves
the audio datapath silent (the I2S slave sees no bit clock, so
capture reads time out) even though the resume restore re-programs
everything, and a fresh stream open does not recover it -- only a
reboot does. Notably this happens with plain no-stream suspend
cycles as well, so it is not caused by (and would not be prevented
by) either the re-arm or the -EBUSY approach -- it looks like more
controller state lost on repeated reset that neither hw_params nor
resume currently covers, likely the same warm-up state machine I
described in the v3 testing note (audio needing a video STREAMON
after a replug). I am instrumenting the register state next to
root-cause it; I'd treat it as a follow-up rather than a v4
blocker, but happy to hear if you see it differently -- and curious
whether the 5B shows the same second-cycle behavior.

v4 follows with the re-arm plus the dts and binding changes already
mentioned.

One more small thing the audio bit exposes, for a possible
follow-up: hdmirx_cec_update_bits() is a non-atomic RMW (the read
and the write each take rst_lock separately), and with audio added
there are now two writers of GLOBAL_SWENABLE, so a CEC adapter
enable racing an audio enable/disable could in theory lose the
other side's bit. Mainline today has a single writer, so it is not
a bug there. Can send a small patch making it atomic if you think
it is worth it.

Best regards,
Igor

On Mon, Jul 20, 2026 at 4:37=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 7/20/26 15:30, Igor Paunovic wrote:
> > Hi Dmitry,
> >
> > Great to hear it works on the 5B -- thanks for testing!
> >
> > Agreed on the -EBUSY guard, done in my tree exactly as you wrote it.
> > It also supersedes the suspend cancel/re-arm I had queued from the
> > bot review: with suspend refused while audio_streaming is set, the
> > worker can never be armed at suspend time, so those hunks are
> > dropped.
> >
> > v4 follows shortly with this plus Sebastian's dts restructuring
> > (shared disabled-by-default card in rk3588-extra.dtsi, renamed to
> > "RK3588 HDMI-IN") and Krzysztof's binding comments (dai-common.yaml
> > reference + unevaluatedProperties).
>
> Re-arming will be best option if it works properly.
>
> --
> Best regards,
> Dmitry

