Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8136EA852F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 23:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zq811LCp1Hj+s3x92UPptzHiUngXdHPF2d1tj4xD0K8=; b=Idasnk0aZav9X3mu7cYH4bV/R3
	jo+VYqFj1Ghqqihe8sGZfEweZ4HTWN6DyIA1SGuJXT/AEb/Ybg4FzEw/gB7JzLbLaYk1T1ZvR9DXi
	tUgTOENWLY3LSHuzvWIzfYatIDDAI0i2YVsUQEjSHpt1hy0fvNBbI0o0/oJR0/Iij+RDUmIRvfAnw
	Ld3p07D/IMWA0FvMtVTNfxHEOCe5eEYTMTXtbgWWmdm83Rp7QsN7I742oEASZ2qZrFOSLY4j7QNex
	S29FRLZy3S5KvJWYtTjhl0pZ1BbqcRk4lXcGYL92Uj4ungKOedhxE/jnE1moBM7BFdtt/T/d7SI7c
	HZbWMfBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzNsI-00000006S7s-0L2a;
	Sun, 08 Mar 2026 23:49:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzNsG-00000006S7k-1wXc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 23:49:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 976DA60121
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Mar 2026 23:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A41C2BCB7
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Mar 2026 23:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773013767;
	bh=s/L3to3kG0f/uxJHIuUQNKS0TutAor3MzlG+ldsVbWY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XSaYAqWzQp3fZE8+EsfBXHsSdukgD1O91AJ9WQW9g6p1vb1lciyfkvidyl1g64Kno
	 o6WXMJbjEtLPXMeAk++lTl7N66JIBLIgyCRxkfvhS2gvCj/bckOO45Pu/sNPC8wbSw
	 WTXrSx1BI7ygY/8DiU8/hTfMz+pcsBCKmdUGulIkX3lFE5jZw7bGW236QjqBf0j9YG
	 tuFc9uPwisGV1l+/R+9JPbRVsq1J2jVkgnQr7vLkqMu/S0XvzESO1OcxQXJqZPkM7T
	 gSTvrXLFkVEDs/prZr4+GUFeuspclhP6Q/mGozGv/+8146AfVZk1GtSBoqMPh8HyJf
	 RnHC3w035H2Gg==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79860421382so105409927b3.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 16:49:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWFI69++x0Qjon1ccUEauTir5kIt/seD0Y9nm9bOzx5GAJMfD/P4uZzUjxGYKSj6rStRcUBDK0UCYO4ET4DZf+9@lists.infradead.org
X-Gm-Message-State: AOJu0YyBVx5cIxH8kqxi+LrktxqmsaHYIm9Kz32ySBKufWH9HjBDJlkJ
	bUZ4JZ3HEljySw2oPd9oQrwBlzY9+Tt0JVdKPgPMcrp1xUcNsD73WsQqvZcXbL/r/GeH7lt7GSt
	jMCVsB0qAqxoHGM6ToMA/Go4CM/HPABU=
X-Received: by 2002:a05:690c:6891:b0:798:3051:2f25 with SMTP id
 00721157ae682-798dd7bee25mr101650097b3.59.1773013766532; Sun, 08 Mar 2026
 16:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com>
 <20260225-pinctrl-mux-v2-4-1436a25fa454@nxp.com> <CAD++jLkT83xz+PSzZZv_Mv+Mqx_+W30d_xk68EDG-sdmFF3x3A@mail.gmail.com>
 <aaG2xQDnMVGGAOJE@lizhi-Precision-Tower-5810> <CAD++jLm=6pTh7N5UAXFaaYWCs5DhfQdb+8TnM5XLcYC886=kLw@mail.gmail.com>
 <aam_cZhlCSxu5WHS@lizhi-Precision-Tower-5810>
In-Reply-To: <aam_cZhlCSxu5WHS@lizhi-Precision-Tower-5810>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Mar 2026 00:49:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLkKsTfFUUD42TKorHLWUAt8=w-kW7Q9bxbU1bgaaig77Q@mail.gmail.com>
X-Gm-Features: AaiRm53eOVEff0Ia4ZtRk5C2doZUsMB119btrlySbICQI0ZMg3eVD5n5sc91D_k
Message-ID: <CAD++jLkKsTfFUUD42TKorHLWUAt8=w-kW7Q9bxbU1bgaaig77Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pinctrl: add generic board-level pinctrl driver
 using mux framework
To: Frank Li <Frank.li@nxp.com>, Fan Wu <fwu@marvell.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Mar 5, 2026 at 6:38=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:

> init state is before probe if exist, which not fit this case because:
> - on board mux need be enabled before probe, some device need communicate
> with periphal at probe, such as SD card. SD data/cmd line must be ready
> to scan SD, similar case for all mtd devices.
>
> if add new state "release",  when the pinctrl may switch between default,
> sleep, ... , "release" have to switch between switch state, such as defau=
lt
>  -> sleep have to change to default->release->sleep.
>
> mux device also have idle state, which map to pinctrl's "init" or "sleep"
> state.
>
> The key difference should be
> - pinctrl can uncondtional switch state.
> - mux frame have to use pair mux_control_(de)select() to switch state.
>
> So, I think just need a hook in pinctrl system to call mux_control_desele=
ct()
> when switch state and release resource.

The problem is that this becomes essentially a revert of:
commit 2243a87d90b42eb38bc281957df3e57c712b5e56
"pinctrl: avoid duplicated calling enable_pinmux_setting for a pin"
from 2014.

.set_mux() used to be called .enable() and when .disable() was
deleted in this commit, only .enable() remained and that was later
renamed to .set_mux().

By essentially adding back the .disable() callback under a new
name, you risk to re-introduce the problem solved by this
committ.

So you need to analyse that committ log a bit, reference it
and explain why you are *not* re-introducing this problem by
adding back the callback.

Yours,
Linus Walleij

