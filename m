Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708ACC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOk0UVNRw5/GaLj4qQsKJ3hC+F4oor+v94A2S3FZbFw=; b=Dexdf37pqXEUFXTrbBgMgcyb6O
	DH8m9tWnHbQT6cyAlYNQsJ022rDiATG9hy4tJULG1d0sosMna6fPnqY3g56BiHtyaly+IDtqV5gOc
	e7ADG0nGD55E+wvnL7O71r0VOJFT+tv/VEE8Kz8QX7+o9LtGQ0P1NvFTRGwvPQH7KLKHmYIe77joH
	sG0w9jbGtwkL9P3s3fyKVdZwhnmSi2ZhxhWHZ0N03GtG+pGPvQesLLBphKSUzaAFaQ6RNNv4Jct+r
	i9klRg/PLSdES2r6TtuoFaGDSrtamqinG7gXNceEIz8MUwB7FgQWaIBGiXzRMu9xO+qMZBSPjqyEu
	EdbOvOmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlirs-00000006967-2Nbq;
	Mon, 20 Jul 2026 07:56:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlirq-0000000695N-1Eav
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Jul 2026 07:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZOk0UVNRw5/GaLj4qQsKJ3hC+F4oor+v94A2S3FZbFw=; b=XhJrHAVNJMyV+wrkn9SK36hkpY
	CY4RKzAEdn+MCuKkiYOSklyoE1ph1GbPLBamMMBQrmfb3uh4OdS67XnjaTJcQcoC9ONDqSdyP8Sa0
	G2mOZaMaepzn3sMJMrIT776Ki9GOUqPAQKXPjXRBZmT9ZKnbYGQRRT70dJugt2RRePW+ZYwJHgEwc
	c7TzoYApj11GgPGQJEsxhv71zN1vH1CVuNntFb/cBXoj8qO+yTTXsoWbQVanAvjp3giVpxkehzjtq
	9YhmM+nr+GNsPCzMj8hxZvSuuGGQi2ggSLDRcMHOeKIrrG8VfSXen6Y7Ss44uah1qSA+Oac/eaHi6
	SeQN9mcA==;
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlirm-0000000GMZ3-3ocY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:56:49 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-8143daf89c7so59026627b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 00:56:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784534204; cv=none;
        d=google.com; s=arc-20260327;
        b=ggB4zaZ66QbDkwkUaMsGQvGBY3vEPZmJo2/uWAU8cwYMOM6agJ9Rm7fuv+dwFwJp/b
         QOpmn4tgcIjxpcUdrHJGHDMM4g8sXPzTMmABEVUOUnujL/QDjpVfx00us+wSzbrLj5Hn
         S+htLcZLkxxvizBUVBnNJqf6q+BNl3neLLpNKlICjLPzj0STLgbO133YRVKxZRrfCU0A
         pVwcQpDL7i32StExZQlLRxlfnL9m9QBgIMwNxiMjaSMrx21IAPpKYoQ54ffEunE3qwc1
         1k/DHF/eNQnzcOvqfca0Pt/VZmKnYec27nx5t3lkQXdcWzKUHLO5jCMuujujYj14JGSQ
         44mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZOk0UVNRw5/GaLj4qQsKJ3hC+F4oor+v94A2S3FZbFw=;
        fh=5EbcUwPkSgK/F3Om6+0+R1wGtS6P3KBMO/DHTPhqVmo=;
        b=i7XDphhsuXTW12EyaQiL9AFNLB8YQxw4eeIlI9NNVY8sU+Ta8kyy3Fj3Ub03xt+tPU
         nCojLe7p7cfUeQ6HQ/ItXVk3ebbc3DD7qyJTZBSrcJ+ER5DGrNTc9O7NF8U3UKs3U8a+
         mUm7yPlbReNb/hUPV0Qeob5kNJiaxvEDczon26HoN64UjrQYOmbsapofb5LvCGRSmNSf
         RxsnPQuj21IBFCSQhd5LhyJuziAlE0TG+hDTiYiGAA6vQCjvjTPOsxfwLPQMsohWRAb5
         YpIk7tDCvMwhdl/bD7eKH/XW2bb03ubDkl/BaAMXWFQFVBr8WCxxjUW6j0z7tAnHcBnV
         nJjA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784534204; x=1785139004; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZOk0UVNRw5/GaLj4qQsKJ3hC+F4oor+v94A2S3FZbFw=;
        b=IJ3Le+CjQdiQxnczQTn17Gy9UjGL6zYeN11ii+XMmDnUmCMcZEyT9lLYw8Pe8LSEfA
         yEFOOj96mc7E0H0Hva+cXedfudt5YoVCxJMAHzbCyFiHMhO9xYj8lMCQy57W9u2KpVmv
         3ybsrBVg3+yVI9dQkQ/JRGbw9O+wQpT0zisus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784534204; x=1785139004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZOk0UVNRw5/GaLj4qQsKJ3hC+F4oor+v94A2S3FZbFw=;
        b=XAvrgzZyC69aMjsKt6bIcdFP+fjkGkMMNyD1NcCJ9MBMIJOOorrY6Vd2GqIP+/6i1g
         iyLm1mwM/axcxsZGJEQG2qMaDNRJD+69bLY3NxK/B5UTILCy6tJUy+QbofvE7BD3Jr9Q
         Qa8CiE26x4sycANVpySeBpoQpBmQAO3qu7R/9e5MP1Q2RjJQ2K4foRT1V+tyQQZ327Dr
         xHdjAzKvuAjqbWyvm4gwGVe22W0Csj3Qv3a/NOkPEPpYFUXvrvBfviH6yg8dw6JR0GUy
         atmeBwYLGqjsMqRzN9AsSWMNyajju7jOKyobNbJX1YUsnQXqOgHtDr2zX9AsOTUqA3J4
         SlfQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0dsGCdRLzCrxhTqQxP9XtOlzm0nvyIfPSkgji8TKcO9u19sUtidhTeSLXERIt5pZwZof18AlppSV9zp6shDgm@lists.infradead.org
X-Gm-Message-State: AOJu0YyNdjV0Gp4kB6lGj9bQU33CdjWJhhPB/yl69N1jqXDJiiMpXzc6
	QAlWgNP0FPzFaO5bQXtYiJB1uyEqTVuOfYQJGX5TG9ZK9p1OH3j8ss/G4mjmAn/PfMyWUI6GVLa
	udVCunqDprHjalSvjfnxmfN69ABYJLb1ojrxGvXNH
X-Gm-Gg: AR+sD12mpVwrH/2tfHSUycczc6Q2Q0Ptbls4AQhuNpX/E2qODrct1u2nq9HAKZB8G3z
	TMhMF8yvnFAfMJPkEHZ8S9dT7J8kcQODLR4aRJxZRvgFfSu/WQ3FKpG5FJrB2PwlHI7UJIvJH0Y
	DQPyvNcOduUKu6aM8F/yVLZg7L1UmLU+Udk13LG6Bngiq0bA4cPFg62y+6186thXPhSa8/TckY6
	nDLyfbohxq9EYGR089ETVVrSN1jxgkHngxaVq+/qrGd1t6xuaCi0MQe7uOLU4rxNFAmEsOXweZ8
	LrcLjXJpMpIfMAbF
X-Received: by 2002:a05:690c:22c3:b0:7db:a109:f12f with SMTP id
 00721157ae682-81ef22c8c66mr39077937b3.1.1784534204236; Mon, 20 Jul 2026
 00:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <dcd98d81dede338c9bbb9700a9613c848b702e49.1784336005.git.daniel@makrotopia.org>
In-Reply-To: <dcd98d81dede338c9bbb9700a9613c848b702e49.1784336005.git.daniel@makrotopia.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 20 Jul 2026 15:56:33 +0800
X-Gm-Features: AUfX_mzig1MDLgHbJy7nor9Z4O8-sZf9ZnQXEm-6mq0XRTnwakXA39D5hmxWyiY
Message-ID: <CAGXv+5GpGfA+hBADn69eNEetP_zR+Xmt3fMhyapK3SsaEa=DFQ@mail.gmail.com>
Subject: Re: [PATCH] regulator: mt6358: use regmap helper to read fixed LDO calibration
To: Daniel Golle <daniel@makrotopia.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_085647_120815_9CC8A5C4 
X-CRM114-Status: GOOD (  21.78  )
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

On Sat, Jul 18, 2026 at 9:06=E2=80=AFAM Daniel Golle <daniel@makrotopia.org=
> wrote:
>
> The "fixed" LDOs with output voltage calibration use
> mt6358_get_buck_voltage_sel as their get_voltage_sel op, but the
> MT6358_REG_FIXED and MT6366_REG_FIXED entries do not populate
> da_vsel_reg/da_vsel_mask. The op therefore reads register 0x0 with a
> zero mask and shifts the result by ffs(0) - 1 =3D -1, which is undefined
> behaviour and gets flagged by UBSAN on every boot on MT6366 boards:
>
>   UBSAN: shift-out-of-bounds in drivers/regulator/mt6358-regulator.c:384:=
38
>   shift exponent -1 is negative
>   Call trace:
>    mt6358_get_buck_voltage_sel+0xc8/0x120
>    regulator_get_voltage_rdev+0x70/0x170
>    set_machine_constraints+0x504/0xc38
>    regulator_register+0x324/0xc68
>
> Besides the undefined shift, the returned selector is always 0, so the
> actual calibration offset programmed in <reg>_ANA_CON0 is never
> reported.
>
> The descriptor already carries the correct vsel_reg/vsel_mask (the
> ANA_CON0 calibration field), matching the regulator_set_voltage_sel_regma=
p
> op already in use. Read the selector back through
> regulator_get_voltage_sel_regmap instead.
>
> Fixes: cf08fa74c716 ("regulator: mt6358: Add output voltage fine tuning t=
o fixed regulators")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Chen-Yu Tsai <wens@kernel.org>

I guess I wasn't looking hard enough when I did the original patch.
I can confirm that after this patch, the fixed LDOs like vxo22 on
Juniper reads out as 2.24V instead of 2.2V (and then gets corrected
down to 2.2V by the kernel).

> ---
>  drivers/regulator/mt6358-regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6=
358-regulator.c
> index f2bb3c1523ca..d6a0ec406b07 100644
> --- a/drivers/regulator/mt6358-regulator.c
> +++ b/drivers/regulator/mt6358-regulator.c
> @@ -492,7 +492,7 @@ static const struct regulator_ops mt6358_volt_fixed_o=
ps =3D {
>         .list_voltage =3D regulator_list_voltage_linear,
>         .map_voltage =3D regulator_map_voltage_linear,
>         .set_voltage_sel =3D regulator_set_voltage_sel_regmap,
> -       .get_voltage_sel =3D mt6358_get_buck_voltage_sel,
> +       .get_voltage_sel =3D regulator_get_voltage_sel_regmap,
>         .set_voltage_time_sel =3D regulator_set_voltage_time_sel,
>         .enable =3D regulator_enable_regmap,
>         .disable =3D regulator_disable_regmap,
> --
> 2.55.0

