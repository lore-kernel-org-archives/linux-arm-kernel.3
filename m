Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DBDF3D5F4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 07:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u3cbcIFZMYgE89H/uUPKWjpme8VFMbnng9DP6GD/0Z4=; b=ugZvatWpDkndWL
	hPrfOBe2ZbJH6hRJ8b0Pe9KvfjOmIp8z1jc3S04w2Nyuwfw3zhW1qlNAwH/K/27ZwbfXr1Vm/vVV+
	Sv5HLXPzdIPSjH9TF0EiJ8hkqPD9J2hrEx4Znhv6a4HGCUTeGpziKP2U0rvljj2npOueT+SwzHA8P
	zahplkMTTULBMTsOOcPCIfENoyP36vgqd8+ZsSy3WuXESSXnVXjTTK1FvGrc+XAcZX58l0AkDIQeL
	2mZ+uOlz6BF1Umnl8lgtPr9CN2eUIMRVdch07lWuy6EFTYAYIS7sVmxoTItkQIlG6J8nIWLS1haej
	0scaQrossc6108ZvYeVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6l0W-00000009ij6-4949;
	Sun, 29 Mar 2026 07:56:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6l0W-00000009iiX-0VF1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 07:56:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 186EE60054
	for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 07:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4A2C2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 07:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774770986;
	bh=NXkO1BKIOyiirGfmId7kEdTa6tS6egLCtvOXPPxBnMY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=R2HhQq+016fcpCRIW8zdQ0HauTKnwjFOWDOpiPxZ0WXQBBbyfTQW3FUPqpXXI9Oy5
	 VtAO2d83xAkqNt7Ee5gX3q985bACYSFYYxw84stvuDp6WhAYUx+iSArS8HMN6z2x8y
	 nr6aBjnxht82iQk2c4eXgOadJndzq6HElWcvooZ32IciqLT1rsDb4NGgCkGHFs3gcK
	 sIZDZAbYI+cKTSR/LnYMFyxba+OPKsbo1ESN+fDpKklulAvrPB43b3jB0D+GNC6fr2
	 FF/jikh8Za867TrBvmLdneQ1Zt6jL07GMPj9xNXYTgSmCzAHaX6zEovkwTkcIWnFR3
	 g71no7e2M6Y9w==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38bd3c6c502so28877431fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 00:56:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGnucRqKG/nMQImE0pdVi1ZG+U8kxxckOm341pqLL4YO9Ywy8Aa5JsML3I7Z8vsitnCG5tw4qlSOPlrPPQNkqh@lists.infradead.org
X-Gm-Message-State: AOJu0YwKoQyrR5Qk+3kDqOJrziEA8gucXdtls3ITQa0RLLXrULHeVN4Z
	kcfm3B1MlOovK42FivcXn/fh8LGCxfxDkeGGkKiXm+KV6PIrZu10zgW4mghtwEizi9xYDnmJgGE
	HJlA1IrSRnQLuJC6y/2IQRke7PKSBbhU=
X-Received: by 2002:a2e:bea8:0:b0:38b:d89b:e285 with SMTP id
 38308e7fff4ca-38c731b8b78mr24317401fa.4.1774770985099; Sun, 29 Mar 2026
 00:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech> <20260310-a733-clk-v1-2-36b4e9b24457@pigmoral.tech>
In-Reply-To: <20260310-a733-clk-v1-2-36b4e9b24457@pigmoral.tech>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 29 Mar 2026 15:56:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v65ycixbX7YS_rC6pyh-zMP6QvHqc6qdXjH4e0xpaqX=CQ@mail.gmail.com>
X-Gm-Features: AQROBzBv23a5U8YFwC6JrpXv9HxCxK3WuA_W9E6K5Up_sT7yzO6F5aKFcWx7Jy8
Message-ID: <CAGb2v65ycixbX7YS_rC6pyh-zMP6QvHqc6qdXjH4e0xpaqX=CQ@mail.gmail.com>
Subject: Re: [PATCH RFC 2/8] clk: sunxi-ng: sdm: Add dual patterns support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org
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

On Tue, Mar 10, 2026 at 4:42=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> On newer Allwinner platforms like the A733, the Sigma-Delta Modulation
> (SDM) control logic is more complex. The SDM enable bit, which was
> previously located in the PLL register, is now moved to a second
> pattern register (PATTERN1).
>
> To support this, rename the existing "tuning" members to "pattern0" to
> align with the datasheet, and introduce the _SUNXI_CCU_SDM_DUAL_PAT
> macro to provide pattern1 register support. Related operations are also
> updated.
>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/clk/sunxi-ng/ccu_sdm.c | 51 +++++++++++++++++++++++++++++-------=
------
>  drivers/clk/sunxi-ng/ccu_sdm.h | 32 +++++++++++++++++---------
>  2 files changed, 57 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu_sdm.c b/drivers/clk/sunxi-ng/ccu_sd=
m.c
> index c564e5f9e610..204e25feaa36 100644
> --- a/drivers/clk/sunxi-ng/ccu_sdm.c
> +++ b/drivers/clk/sunxi-ng/ccu_sdm.c
> @@ -18,7 +18,10 @@ bool ccu_sdm_helper_is_enabled(struct ccu_common *comm=
on,
>         if (sdm->enable && !(readl(common->base + common->reg) & sdm->ena=
ble))
>                 return false;
>
> -       return !!(readl(common->base + sdm->tuning_reg) & sdm->tuning_ena=
ble);
> +       if (sdm->pat1_enable && !(readl(common->base + sdm->pat1_reg) & s=
dm->pat1_enable))
> +               return false;
> +
> +       return !!(readl(common->base + sdm->pat0_reg) & sdm->pat0_enable)=
;
>  }
>  EXPORT_SYMBOL_NS_GPL(ccu_sdm_helper_is_enabled, "SUNXI_CCU");
>
> @@ -37,18 +40,27 @@ void ccu_sdm_helper_enable(struct ccu_common *common,
>         for (i =3D 0; i < sdm->table_size; i++)
>                 if (sdm->table[i].rate =3D=3D rate)
>                         writel(sdm->table[i].pattern,
> -                              common->base + sdm->tuning_reg);
> +                              common->base + sdm->pat0_reg);
>
>         /* Make sure SDM is enabled */
>         spin_lock_irqsave(common->lock, flags);
> -       reg =3D readl(common->base + sdm->tuning_reg);
> -       writel(reg | sdm->tuning_enable, common->base + sdm->tuning_reg);
> +       reg =3D readl(common->base + sdm->pat0_reg);
> +       writel(reg | sdm->pat0_enable, common->base + sdm->pat0_reg);
>         spin_unlock_irqrestore(common->lock, flags);
>
> -       spin_lock_irqsave(common->lock, flags);
> -       reg =3D readl(common->base + common->reg);
> -       writel(reg | sdm->enable, common->base + common->reg);
> -       spin_unlock_irqrestore(common->lock, flags);
> +       if (sdm->enable) {
> +               spin_lock_irqsave(common->lock, flags);
> +               reg =3D readl(common->base + common->reg);
> +               writel(reg | sdm->enable, common->base + common->reg);
> +               spin_unlock_irqrestore(common->lock, flags);
> +       }
> +
> +       if (sdm->pat1_enable) {
> +               spin_lock_irqsave(common->lock, flags);
> +               reg =3D readl(common->base + sdm->pat1_reg);
> +               writel(reg | sdm->pat1_enable, common->base + sdm->pat1_r=
eg);
> +               spin_unlock_irqrestore(common->lock, flags);
> +       }
>  }
>  EXPORT_SYMBOL_NS_GPL(ccu_sdm_helper_enable, "SUNXI_CCU");
>
> @@ -61,14 +73,23 @@ void ccu_sdm_helper_disable(struct ccu_common *common=
,
>         if (!(common->features & CCU_FEATURE_SIGMA_DELTA_MOD))
>                 return;
>
> -       spin_lock_irqsave(common->lock, flags);
> -       reg =3D readl(common->base + common->reg);
> -       writel(reg & ~sdm->enable, common->base + common->reg);
> -       spin_unlock_irqrestore(common->lock, flags);
> +       if (sdm->enable) {
> +               spin_lock_irqsave(common->lock, flags);
> +               reg =3D readl(common->base + common->reg);
> +               writel(reg & ~sdm->enable, common->base + common->reg);
> +               spin_unlock_irqrestore(common->lock, flags);
> +       }
> +
> +       if (sdm->pat1_enable) {
> +               spin_lock_irqsave(common->lock, flags);
> +               reg =3D readl(common->base + sdm->pat1_reg);
> +               writel(reg & ~sdm->pat1_enable, common->base + sdm->pat1_=
reg);
> +               spin_unlock_irqrestore(common->lock, flags);
> +       }
>
>         spin_lock_irqsave(common->lock, flags);
> -       reg =3D readl(common->base + sdm->tuning_reg);
> -       writel(reg & ~sdm->tuning_enable, common->base + sdm->tuning_reg)=
;
> +       reg =3D readl(common->base + sdm->pat0_reg);
> +       writel(reg & ~sdm->pat0_enable, common->base + sdm->pat0_reg);
>         spin_unlock_irqrestore(common->lock, flags);
>  }
>  EXPORT_SYMBOL_NS_GPL(ccu_sdm_helper_disable, "SUNXI_CCU");
> @@ -123,7 +144,7 @@ unsigned long ccu_sdm_helper_read_rate(struct ccu_com=
mon *common,
>         pr_debug("%s: clock is sigma-delta modulated\n",
>                  clk_hw_get_name(&common->hw));
>
> -       reg =3D readl(common->base + sdm->tuning_reg);
> +       reg =3D readl(common->base + sdm->pat0_reg);
>
>         pr_debug("%s: pattern reg is 0x%x",
>                  clk_hw_get_name(&common->hw), reg);
> diff --git a/drivers/clk/sunxi-ng/ccu_sdm.h b/drivers/clk/sunxi-ng/ccu_sd=
m.h
> index c1a7159b89c3..c289be28e1b4 100644
> --- a/drivers/clk/sunxi-ng/ccu_sdm.h
> +++ b/drivers/clk/sunxi-ng/ccu_sdm.h
> @@ -33,21 +33,31 @@ struct ccu_sdm_internal {
>         u32             table_size;
>         /* early SoCs don't have the SDM enable bit in the PLL register *=
/
>         u32             enable;
> -       /* second enable bit in tuning register */
> -       u32             tuning_enable;
> -       u16             tuning_reg;
> +       /* second enable bit in pattern0 register */
> +       u32             pat0_enable;
> +       u16             pat0_reg;
> +       /* on some platforms, the sdm enable bit in pattern1 register */
> +       u32             pat1_enable;
> +       u16             pat1_reg;
>  };
>
> -#define _SUNXI_CCU_SDM(_table, _enable,                        \
> -                      _reg, _reg_enable)               \
> -       {                                               \
> -               .table          =3D _table,               \
> -               .table_size     =3D ARRAY_SIZE(_table),   \
> -               .enable         =3D _enable,              \
> -               .tuning_enable  =3D _reg_enable,          \
> -               .tuning_reg     =3D _reg,                 \
> +#define __SUNXI_CCU_SDM(_table, _enable, _pat0, _pat0_enable, _pat1, _pa=
t1_enable)     \
> +       {                                                               \
> +               .table                  =3D _table,                      =
 \
> +               .table_size             =3D ARRAY_SIZE(_table),          =
 \
> +               .enable                 =3D _enable,                     =
 \
> +               .pat0_enable            =3D _pat0_enable,                =
 \
> +               .pat0_reg               =3D _pat0,                       =
 \
> +               .pat1_enable            =3D _pat1_enable,                =
 \
> +               .pat1_reg               =3D _pat1,                       =
 \
>         }
>
> +#define _SUNXI_CCU_SDM(_table, _enable, _pat0, _pat0_enable)   \
> +       __SUNXI_CCU_SDM(_table, _enable, _pat0, _pat0_enable, 0, 0)
> +
> +#define _SUNXI_CCU_SDM_DUAL_PAT(_table, _pat0, _pat0_enable, _pat1, _pat=
1_enable)      \
> +       __SUNXI_CCU_SDM(_table, 0, _pat0, _pat0_enable, _pat1, _pat1_enab=
le)
> +

Don't introduce an intermediate macro that looks _almost_ the same as the
macro the driver is actually supposed to use.

Just declare _SUNXI_CCU_SDM_DUAL_PAT() to expand to the full entry, and
_SUNXI_CCU_SDM() to _SUNXI_CCU_SDM_DUAL_PAT() with the last two parameters
as zero. That takes less lines.


ChenYu

>  bool ccu_sdm_helper_is_enabled(struct ccu_common *common,
>                                struct ccu_sdm_internal *sdm);
>  void ccu_sdm_helper_enable(struct ccu_common *common,
>
> --
> 2.52.0
>
>

