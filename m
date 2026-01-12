Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD21C9EC67
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 10:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgfFNzzVjJ7nbEKIudeFn8GZJ6kok68eDaRnuzuEl3E=; b=KIf6QLdzZkLXT1C2Y6hy1xkPD1
	nZxC7VzBu43Xg1jRt5Bvk3kJHtvhAP09aJeAH8RHXDr3SVWV4Dy5Ix/LYTvYZkue91LtpDRp1ybpX
	mR3m/ihOwZZ5RCB9oft1WWbIADvDh1seS8YQ0uT0nuTStWG5P6EFmkp62+RsYYHKuIGQq/BJrEo6I
	3wpgvXNEa8s2XblXXvjab/EYGyCwv3gqQRrLp1dANnA1FE9s/ZTAx+ObjqQWHE+W/reeOVY6FvRta
	aP9fwlj72GjNA27NXJFYEvBw/cc0TKPytgzENjNHoJZEq2zJ989tJxVwMyIxmBYjzytXYWh3p8lTj
	6BwCVHpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFAy-00000005AvA-29hZ;
	Mon, 12 Jan 2026 10:29:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFAu-00000005Ap4-27f1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 10:29:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B89C96013A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 10:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F15DC19421
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 10:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768213767;
	bh=tMfRIGG2xYipzsFk8tYUj11xvR+6RtJic1LhkCQRQUA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A3rQwEKCMTArBMdb7Uu1qKy/LjI1JbsTuUBaGq9SLOfOfrtbekF/pT+lJjEwXwnVn
	 /sWccPJx9MDxNlKdgZ00MFFoUmxbOBuUrJ2CYS8eixb+nhw7zuabVZYEHSbOx5vUa3
	 OIDfWcCIypYNSd/lBzIxHMLVasQaPyLeCOJtFor5tFiKgEpi0X4itDEtvq3BBcMPrf
	 sbRN0YjlcZGFqAHJQL+NFLadB81sgK8CEE94bzJhjfBG8B/IkT0so/Giv+ZcDrZxO8
	 ux3ImQV4uV7O6IWWpgnEDntwNVS1ePuGzRxgHNZYlCUGKUuriOqdojv3zZGFuxTOfc
	 t6tePr6QYZOCg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-383251c34e6so20723701fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 02:29:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUDvx+PNY+EMx4enTU+SGc/UTkviyAkBpU2kSPkVLQQ5MYEi+eLFwMhJKFzs2m+u9Lh6UxiypOC2y/s528J33uk@lists.infradead.org
X-Gm-Message-State: AOJu0YwnKcx8ZfevH2TFAF0ERpRn2N4VkoNa4qqg0W2yE9r6/7vsuz9D
	qGABYdPOOnGyleoKQ44v2YyirhefpDPb3do9Vfvmbm+RdiYx1gKfemOuc6TPKMKupIqve0Rf1Cq
	kM6matCDQL+WFjGQZ0ZoyaowjjLv4qR4qOvspqboJIA==
X-Google-Smtp-Source: AGHT+IHOMNiihVsQqSlMQKy2eht583DN76DmMlR1CjX8bHD/Pn8J9H7axTGtSnbKt1s2aTeKFtrMsGxBZegYZ0gbz3Y=
X-Received: by 2002:a05:651c:198d:b0:383:246a:74ec with SMTP id
 38308e7fff4ca-383246a7accmr26670981fa.18.1768213766153; Mon, 12 Jan 2026
 02:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 12 Jan 2026 11:29:14 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeFt7nWt_nMtHzVtXTQnBodOroT3jX4WTHFX-q7MsHiDw@mail.gmail.com>
X-Gm-Features: AZwV_QguRZzql2FHZgAwUYvea5idL_4oUoJlRPxd_dhQm2N_fFaDLJSpxjBuN3c
Message-ID: <CAMRc=MeFt7nWt_nMtHzVtXTQnBodOroT3jX4WTHFX-q7MsHiDw@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: don't select clk-mt8192 for all ARM64 builds
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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

On Mon, Dec 22, 2025 at 4:06=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> This option defaults to y for ARCH64 meaning it's built even if we don't
> want anything related to mediatek. Make the default condition stricter
> and only build it if ARCH_MEDIATEK is selected.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/clk/mediatek/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 0e8dd82aa84e..2c09fd729bab 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -820,7 +820,7 @@ config COMMON_CLK_MT8192
>         depends on ARM64 || COMPILE_TEST
>         select COMMON_CLK_MEDIATEK
>         select COMMON_CLK_MEDIATEK_FHCTL
> -       default ARM64
> +       default ARM64 && ARCH_MEDIATEK
>         help
>           This driver supports MediaTek MT8192 basic clocks.
>
> --
> 2.47.3
>
>

Gentle ping.

Bartosz

