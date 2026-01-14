Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C81D37E37
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 14:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MClOrbVdfNuOtK0G8j9yjUjsNpRvnKkQ8QMN5BlfSOE=; b=tDzojVyR3p8cYJ
	veA8bgMw8ml8yO795eENmiXmwRA1497uZjkXaJDNWKj+q6MHSIsIqw45XW9RckXSpYlb3994K5tCk
	d5AnX68QAtpeHyI6xZ/bG99J1jInR2W6JBfYlnuBtERl3LFGWGJYrsC2aqX4zWU84GcjRWDsMpVjE
	4eKx8yF1745HMh4bN8YlVep5fHLOpVT95XO+p8JVZy4gl9h/SUes5eAdil6r2G9KE3Of4wjQMy+gk
	9wskbCjCvHUYQLk3a1sqYTTFkA5v0chZ4VjEp3UaxRREf9r0IALjw1MnWFs6VXDGbktMH7pPFT7Pm
	5ZgdkbcLJVYfHZ59pS6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1X1-00000009SUv-3KVW;
	Wed, 14 Jan 2026 14:07:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1X0-00000009SUW-3EJz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 14:07:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B04EE6000A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 14:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 673EBC16AAE
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 14:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768399649;
	bh=9kXxSsD9GPZ8ilXPJKnyKVYaA4WA4dkOMaJ60ml6/Uk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Q8ramvssNJ4BQjBaXEh8TD6iXyrk1R+mTA/1T8UjA2D+a1yvCL2th6EOUIpX+2/Rz
	 9G1aRaIVLAuQshr+/vxDSQrDn19x26iRS3xHmDyD5tPpsFjuJbaQ9PwJk9OKm6hn/K
	 ScSRYEl3Aq/Qw7WP4fpy4BgNdo6bToVD5ZSeZicplUtL0QmejHw6GI8R5lh2RVAnqV
	 QOmGxY29XsHZehYaPr80OxM9R++Zi93xohtgKMkMLO5zIRaI4PegyDxsPVuJknFZCI
	 p5X4beyVZ8ZrYCqiR0NqIrTLp+MqvsR82SWfVg7LoBkH8Fj5e/k+t7xD627v3pROfi
	 nWxd21k+XUKCA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59b7bb3b913so1215710e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 06:07:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+PWWfjnJ/pY01e15/5lSWQtFZaFe+RAtzuQe7LFlxbLOdeOXXhfqxzfwWD7E4JRJUTCIWiJdTwAbUmm63nTjl@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2tYjB306v6prV2kArfZU5JUyRLCCmUa/S08ejAMRPE6/+bAgs
	ds3euvxCXh/LYF0Gl7vdswt0WyfquN2oZU7IBmOdW8CQRFMujHeWd0pPTZgLzAmj2r9CvvQ8thM
	zG5+Xg3YqnCbtwLlc8CwUf39R9TSikJI=
X-Received: by 2002:a05:6512:39cf:b0:59b:7804:f149 with SMTP id
 2adb3069b0e04-59b9941fe05mr2533661e87.17.1768399647739; Wed, 14 Jan 2026
 06:07:27 -0800 (PST)
MIME-Version: 1.0
References: <20260114105005.3136045-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20260114105005.3136045-1-giulio.benetti@benettiengineering.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 14 Jan 2026 22:07:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v66gpmreQiDMDJ8NE1QJ-e+iBUVicw9sv=RgiwuONfUFAA@mail.gmail.com>
X-Gm-Features: AZwV_QgyMFwMvO53ZaT5aNqrfV7muoxJxa1mFM3R5z3QBXkoO24uW2v55PGRm7Y
Message-ID: <CAGb2v66gpmreQiDMDJ8NE1QJ-e+iBUVicw9sv=RgiwuONfUFAA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: sun7i: a20: fix MMC index enumeration
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jan 14, 2026 at 6:50=E2=80=AFPM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
> Currently, the OLinuXino-A20-Micro experiences non-deterministic MMC
> enumeration during boot. When both an SDIO WiFi module (MMC1) and
> an SD card (MMC0) are present, the kernel may swap their indices.
>
> Explicitly define mmc* aliases to ensure consistent device naming
> and prevent mapping conflicts.

Years ago we (sunxi maintainers) decided against this.

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  arch/arm/boot/dts/allwinner/sun7i-a20.dtsi | 4 ++++

And aliases are per board, so this definitely doesn't belong here.


ChenYu

>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi b/arch/arm/boot/d=
ts/allwinner/sun7i-a20.dtsi
> index 5f44f09c5545..a958400bcd7c 100644
> --- a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
> @@ -55,6 +55,10 @@ / {
>         #size-cells =3D <1>;
>
>         aliases {
> +               mmc0 =3D &mmc0;
> +               mmc1 =3D &mmc1;
> +               mmc2 =3D &mmc2;
> +               mmc3 =3D &mmc3;
>                 ethernet0 =3D &gmac;
>         };
>
> --
> 2.47.3
>
>

