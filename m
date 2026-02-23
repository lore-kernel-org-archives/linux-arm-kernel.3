Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8107DEA4FA4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6jFrC1c1LAy6NsX5jj9hPnJ73A2OmhMoOTuN5h+hmk=; b=vtlEXWZbnb5c60fVdV9fJViXxH
	of1x8I3mNBMf6wK59BCaqkbH6FdRpxRZQheAw9c19ITmGQhm0s7Rcux6iPa6y+aiNBMoGJWwFoyFA
	1i2L9WzOeXQEIpy9yvgEaoxqkqu6IE8KLD445rHFKcCuDnaQp5VxicjS2jX/hSnDB25HFzczPS+sf
	h01wfEYfplu0ez7PG4+Qw2m2EiJ+7HgrklKes2MJace1cN/BlBwvuyl0uHF63aKYJmFbA6jr7uA2S
	2rUNtGEHcdawOkn4XXMGlP9nOQzDM5wdefgkLraOYkAvEt7eAVB1EsmgAvz/nZKWhR8WJvksVuv/P
	zJi44r2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTfc-000000007GT-42FX;
	Mon, 23 Feb 2026 11:00:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTfb-000000007GL-3jwp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 11:00:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CB0F60053
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 11:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70FFC116C6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 11:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771844406;
	bh=hdVE4wcCkhVsculsobOp74DHJ2ubVoFKlzXtFmYFxW0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y1AJ++VxWHwtoen7AMLv3su7UfEmuiTIQJZzcj3pYYZwFvDu79wfQLr2+/7G1ceDL
	 9xWYLx8/qDdJlDDpXkQrB/P1X2Eq/MPw1lA34ucpLoIvu0sl8Btqk61CjMh4bo4Bx7
	 i/i+U4FBlpidJb1/JxEY/fTxxhTGUM1YmkPvPuq5KT/wYDmUZBkxmmHUgfjaWd3c/s
	 uHLh7OVlaBtuRGCJRHhcQszwQNjHuda+QX+3f+9GA9Gbm0uXJsVr+O1NqJd5aUhNuU
	 y1BuE4mujZiB9PxEeJauGVZ0YOKhbwKkZab49J8IC8JNcBALysERkhFkr5hMu4PEZt
	 t2paYU0ribx5w==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38707d4c8b9so50530401fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 03:00:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUDcNu5xHxopVa6kaJmA4mSHKTAvW/KiTwv3al65Gf0k/bcF4GgrYCTSEya7bYY8RXct+TKUTKkP5xzSLxTEOXs@lists.infradead.org
X-Gm-Message-State: AOJu0Yx05rIlpUNGnUybADYYA3JZ70aDKWO4IcKr/nbsLsQpNrv28JSm
	BimWca7fqKz+9Tu9shSed6FT6M4pd4LGPIQTvcg+srNjv74U4QNTb5a34Ym3eMX4pQa/x5B3wdF
	LfjoglX5eRb73/+duUZIMq+AxXgcqdWoXHOwdNk7vMA==
X-Received: by 2002:a05:6512:b91:b0:59d:dd50:f2e6 with SMTP id
 2adb3069b0e04-5a0ed885225mr2546189e87.21.1771844405420; Mon, 23 Feb 2026
 03:00:05 -0800 (PST)
MIME-Version: 1.0
References: <20260106134148.48257-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260106134148.48257-1-bartosz.golaszewski@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 23 Feb 2026 11:59:53 +0100
X-Gmail-Original-Message-ID: <CAMRc=McgT9sR1nWbJo0Sw6MsStQi9998A2r62uPXKYTh_tMPFw@mail.gmail.com>
X-Gm-Features: AaiRm53SH9VKNRKhPpBfMpHZNJCMjve-vNra7uJLYAv7inRpBkm-YyRQVMNbEfc
Message-ID: <CAMRc=McgT9sR1nWbJo0Sw6MsStQi9998A2r62uPXKYTh_tMPFw@mail.gmail.com>
Subject: Re: [PATCH] arm64: Kconfig: drop unneeded dependency on OF_GPIO
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jan 6, 2026 at 3:07=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> OF_GPIO is selected automatically on all OF systems. Any symbols it
> controls also provide stubs so there's really no reason to select it
> explicitly.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arm64/Kconfig.platforms | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index fff14807c965..933281bb6139 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -244,7 +244,6 @@ config ARCH_MVEBU
>         select MVEBU_ODMI
>         select MVEBU_PIC
>         select MVEBU_SEI
> -       select OF_GPIO
>         select PINCTRL
>         select PINCTRL_ARMADA_37XX
>         select PINCTRL_ARMADA_AP806
> --
> 2.47.3
>
>

Gentle ping.

Bart

