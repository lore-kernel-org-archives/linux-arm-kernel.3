Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F55EA8550
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1qSrUEvg0nHFtxaJdm9W+cfuf2yxO/HVEsocACAPAd0=; b=0HseEVIuUERqNJ
	jfuV0ECx6KZVef2LHtmo7+6/h5CWeitdzbwxzEyIIwpGjL36qFOgj8QxvuheEIZwSHQGUJG5DO5Eu
	2DRabzh0dRixz1B4keRPuQ0N0omKjxQ/Lb06O7H2NRFpfq6vqP1jJNwV9UMdzzcN2DH01aIKaTdZT
	JUoWawy3XoBxFnA7BLLEHCkcX3lNjgyikP/fDNuzp2wCNhLN/A+ZiJ224wcRQcffDpogutzsy7BOF
	S+fGMpSnHTryZOCFFgBN0AimqCCLEaag9bl+z0ZNWCqtDI07s2YI6YBuMGB7uMJ7CXgZ14B76EZ4E
	QxYO4T1+FVfCtVctUkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztYv-000000097A9-2UQh;
	Tue, 10 Mar 2026 09:39:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztYs-0000000979Z-3Uid
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:39:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47E5543D4B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 09:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25641C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 09:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773135574;
	bh=0NvNqkbHvopZkhx6T/+IIZIFE+ZXvBvs4x160lciOgk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=H2KpT2PXchY67iKw4BU6/Yl1d5CyFTJydVwdKiWhENgeBM56oCA722NqgJC/ZRPIG
	 mcX0jIQIx1kcMLR4OAZYfqOZhUuRE8gNRiDITuGd8390h+DBEOY3DKTZeZoT8Lj5ar
	 nVvSqlDVfImNkLRJWGOl6ukW7wHz2UZOTRMp7uhj+htw+N2CB3c65aiGg5qW6tW9sy
	 Ak9PlF6y3l0DaC1BlEqnIrD7tMN1F9ugJ8VYbpYFwJJtAT8OcQG0kIoU52TdKendeA
	 R5pbTOaQ167IykMHzzTJNVBSeraixqXTaF2fxtNnL3Y4GzbNRkW+CgoOijPvyqjJBh
	 GecNHMqtZ/Omw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38a5584e31fso17186571fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 02:39:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVcJa9zntGZzixOTZXVo5+X0vYB3PIhK3yZ5t6kPYtJsrRGOiuaH3zxE4yOKriS5aXVp/2dOIJw40WJ4T/9rv9J@lists.infradead.org
X-Gm-Message-State: AOJu0YwV0d0ySAHrTeI5bEq1ro4HF07Rj9GZSfDzMuqhRXGRAa+rL1XL
	fVo4RTCLj6VEjj10hutP/5eA/V6lHhhBcrScZKyUfbtkCxOewCIvoSm1I2T4I4vOqHrYubrmMBg
	now+29RhY7zQ4dOjrtpuEIQFKxf33XGo=
X-Received: by 2002:a05:651c:20ce:10b0:38a:3660:7feb with SMTP id
 38308e7fff4ca-38a5d010b86mr7646831fa.9.1773135572499; Tue, 10 Mar 2026
 02:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com> <20260310075539.11701-10-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260310075539.11701-10-wsa+renesas@sang-engineering.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Mar 2026 17:39:20 +0800
X-Gmail-Original-Message-ID: <CAGb2v64gTM41Q3aBkS+dqJ7w9fHtePte-6jeoFR3j-O1_aX9-Q@mail.gmail.com>
X-Gm-Features: AaiRm504Z-6QWp77ZJMLsW12D2p9SNHT7rtRZg5o6Wu6DQVg4_G6syeE7d95ZJ4
Message-ID: <CAGb2v64gTM41Q3aBkS+dqJ7w9fHtePte-6jeoFR3j-O1_aX9-Q@mail.gmail.com>
Subject: Re: [PATCH v4 09/15] hwspinlock: sun6i: use new callback to
 initialize hwspinlock priv
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wilken Gottwalt <wilken.gottwalt@posteo.net>, Bjorn Andersson <andersson@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-remoteproc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_023934_909285_629557C5 
X-CRM114-Status: GOOD (  21.80  )
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

On Tue, Mar 10, 2026 at 3:56=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Apply the new helper to avoid using internal structures from the core.
> Remove superfluous setting of drvdata while here.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  drivers/hwspinlock/sun6i_hwspinlock.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/s=
un6i_hwspinlock.c
> index a0c76bba3f05..c3db81cb1793 100644
> --- a/drivers/hwspinlock/sun6i_hwspinlock.c
> +++ b/drivers/hwspinlock/sun6i_hwspinlock.c
> @@ -74,9 +74,15 @@ static void sun6i_hwspinlock_unlock(struct hwspinlock =
*lock)
>         writel(SPINLOCK_NOTTAKEN, lock_addr);
>  }
>
> +static void *sun6i_hwspinlock_init_priv(int local_id, void *init_data)
> +{
> +       return init_data + sizeof(u32) * local_id;
> +}
> +
>  static const struct hwspinlock_ops sun6i_hwspinlock_ops =3D {
>         .trylock        =3D sun6i_hwspinlock_trylock,
>         .unlock         =3D sun6i_hwspinlock_unlock,
> +       .init_priv      =3D sun6i_hwspinlock_init_priv,
>  };
>
>  static void sun6i_hwspinlock_disable(void *data)
> @@ -91,10 +97,9 @@ static void sun6i_hwspinlock_disable(void *data)
>  static int sun6i_hwspinlock_probe(struct platform_device *pdev)
>  {
>         struct sun6i_hwspinlock_data *priv;
> -       struct hwspinlock *hwlock;
>         void __iomem *io_base;
>         u32 num_banks;
> -       int err, i;
> +       int err;
>
>         io_base =3D devm_platform_ioremap_resource(pdev, SPINLOCK_BASE_ID=
);
>         if (IS_ERR(io_base))
> @@ -161,11 +166,6 @@ static int sun6i_hwspinlock_probe(struct platform_de=
vice *pdev)
>                 goto bank_fail;
>         }
>
> -       for (i =3D 0; i < priv->nlocks; ++i) {
> -               hwlock =3D &priv->bank->lock[i];
> -               hwlock->priv =3D io_base + SPINLOCK_LOCK_REGN + sizeof(u3=
2) * i;
> -       }
> -
>         /* failure of debugfs is considered non-fatal */
>         sun6i_hwspinlock_debugfs_init(priv);
>         if (IS_ERR(priv->debugfs))
> @@ -177,10 +177,8 @@ static int sun6i_hwspinlock_probe(struct platform_de=
vice *pdev)
>                 goto bank_fail;
>         }
>
> -       platform_set_drvdata(pdev, priv);
> -
>         return devm_hwspin_lock_register(&pdev->dev, priv->bank, &sun6i_h=
wspinlock_ops,
> -                                        SPINLOCK_BASE_ID, priv->nlocks, =
NULL);
> +                                        SPINLOCK_BASE_ID, priv->nlocks, =
io_base + SPINLOCK_LOCK_REGN);
>
>  bank_fail:
>         clk_disable_unprepare(priv->ahb_clk);

Just a note, I see further code savings in using the clk and reset devm_
helpers. I'll do this after this series is merged, as the context overlaps.


ChenYu

