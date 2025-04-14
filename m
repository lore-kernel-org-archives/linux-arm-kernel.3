Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F0CC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 15:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkFHWdqaWX0QyUTLHCeULo3hti03rOZsj812F135JBg=; b=gNDAHFjLIQDLjoEBbLpftVmfnG
	pdiwYlszbowSXAt4ZBYupJ9o3oAPDw/T3tH7OkEJabYPT6VmyqqAO/R3q5FIVP2ap7XWcwqq2nFmI
	F19ZUXkgbDeSYs35gLsG65lKCok5iPrgck1MGgdyE0dhnMRUzjwTyeUiyRdHArXnM2Zs+vDp4tZIX
	54TtgfuI9jVqmSYqnPZETYktiZoimcsxHbRAqDo6W0+Zm++wbttqQwphf6XhibmLE+9dSMwCAa387
	NPNneLm4OIjeobnVrwlg0m1RMXWTV6oKgVZUcRypepOj/zl3vwsXsY665xArUcarlyEK8bb2CD4P+
	69MKF76Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LQd-00000002Yh0-2Ca0;
	Mon, 14 Apr 2025 15:08:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LFb-00000002VoC-1bLd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 14:57:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so30592085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 07:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744642649; x=1745247449; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MkFHWdqaWX0QyUTLHCeULo3hti03rOZsj812F135JBg=;
        b=a00+EWqto4oq15X9ImGQ2b28ywHujqMnKzmOV34FULsOqTcC6PxYqHw2M7/W9TbahE
         pMuhMOoTm5sc+FJ9iJTcMI+BX9JEdtoLWtSBqd6IjMxyAl3sJTwdRClw56OEdx0EFJwk
         jo/0VBthauCYjOYSka82OR+VJTnC4/TWBBZ7qfpAbyCNOvwwsTYnuEgvJ7fnPjpJPLaK
         +9ZX1yv+Em4Goy3XWtideMzTMmbTrz5PmSYAvCumt5Ve/8kNXL0gQdfnW8B3/1CZW9tj
         m88GzdpagKkQEXogJJvS2MIn1gC6Lhu+LJFs0dvw0ffDjtITBlLMfiAS/Ndcm6rtx1qs
         Q9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642649; x=1745247449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkFHWdqaWX0QyUTLHCeULo3hti03rOZsj812F135JBg=;
        b=a/BFAMBmloh8k7SnPwdW+wvIwtYUejXF0Y84k7CSPxkdIB/GtNsGn8q/YSgbzwAm6V
         vvRVZlBCyrBYbZskG2xT6duYCSTsk6h6MVK3wn/sR2AgCT/aGDIIZOZBaGTNNvnxQ/o8
         yp4EkUAmR+4TwyXZlzifbuGurM9sWl9Q0foMTelsBQco1n6N3l/SlNK8YqB+27M/qJOU
         k6AsrMRCooBU5oTUzNSLOLK9LiCbwvlyN6RpNDdZaWB6g6Md7ZdTFy52v5mln57NA76M
         Kwc6c/ujD0VEBwen+Klw1yyqXCqrg0vXR+d8HjOYcZjRFI/dtLTDxgFgslGICTcSvvhP
         IFoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVpuFhe6SZqP1CViaJBbDRqEcyl1P1X1N4VAK3kYH3ocDXUA3z5nrwgeer8ckbg9xDl/M0GX2Lo0UmVXPVVhmu@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtp+r1rLawyhDcpvVRBf5sM8/cnaAoErkLpCcDlq4zC1Q8Y0+2
	IdqOumMaD6rEMcyfH3Od6yDdM4rXMz1MJ3Jo61DAdGn3TmmAOw2CGuE0AD4wcIg=
X-Gm-Gg: ASbGncuiGI4PraQFhN/t9E15Ewhvrz7oBT6nzwQfcXkSWPNcF4k2R1oGnxs7ISG7H3C
	Fp3kaPbvNJ6ELdYHia+s1sCa1E6plpf/Bc/SMcmzAB59P+P3spLZcpz3BVOXzKwm2lAVvcalAIL
	+lGu3bQB4MVsCJSd+vwEPOZ3zsfyPpb5LxK9fM6hJZU7/LcHAwfokekOooVSzHtE+TJF6q8qCAD
	W/FPUKUBEbDwvJtCyL6Ngu03StOURdw3q0jYcuvWn3stGu+N51O8E8jjeSbBVWJaSjCA5hwtHl2
	pi3JnwpNhOKo7drenj0S/ubn/eGJtvXCSAAhMSXnQiMauY2w9OopSobi3QEOMd+2jxAKyRnTO1U
	v+SFLLz4=
X-Google-Smtp-Source: AGHT+IEaJhoecPlmPXWGKen7dTKN59ocQmLUiBg6r4S0rqVEL6LRINhybBu0P7UQhy/dP7QC7yIQeA==
X-Received: by 2002:a05:600c:1f11:b0:43b:cf12:2ca5 with SMTP id 5b1f17b1804b1-43f3a93c2f5mr101955755e9.8.1744642649070;
        Mon, 14 Apr 2025 07:57:29 -0700 (PDT)
Received: from localhost (p200300f65f13aa0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:aa04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f20625eeesm181127665e9.11.2025.04.14.07.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:57:28 -0700 (PDT)
Date: Mon, 14 Apr 2025 16:57:26 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wenbin Mei <wenbin.mei@mediatek.com>, 
	Axe Yang <axe.yang@mediatek.com>, Qingliang Li <qingliang.li@mediatek.com>, 
	Hanks Chen <hanks.chen@mediatek.com>, Chunhui Li <chunhui.li@mediatek.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [PATCH v5 1/1] pinctrl: mediatek: Add EINT support for multiple
 addresses
Message-ID: <43nd5jxpk7b7fv46frqlfjnqfh5jlpqsemeoakqzd4wdi3df6y@w7ycd3k5ezvn>
References: <20250322035307.4811-1-ot_chhao.chang@mediatek.com>
 <20250322035307.4811-2-ot_chhao.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w4ospt4bmb4y7he7"
Content-Disposition: inline
In-Reply-To: <20250322035307.4811-2-ot_chhao.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_075731_438993_9FB1EA3A 
X-CRM114-Status: GOOD (  21.18  )
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


--w4ospt4bmb4y7he7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 1/1] pinctrl: mediatek: Add EINT support for multiple
 addresses
MIME-Version: 1.0

Hello,

this patch became commit 3ef9f710efcb in v6.15-rc1. It breaks booting a
mt8365-evk.

With earlycon it's possible to see a null pointer exception:

	[    0.072938] Unable to handle kernel NULL pointer dereference at virtual=
 address 0000000000000002
	[    0.074101] Mem abort info:
	[    0.074468]   ESR =3D 0x0000000096000004
	[    0.074984]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
	[    0.075681]   SET =3D 0, FnV =3D 0
	[    0.076083]   EA =3D 0, S1PTW =3D 0
	[    0.076495]   FSC =3D 0x04: level 0 translation fault
	[    0.077134] Data abort info:
	[    0.077511]   ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
	[    0.078229]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
	[    0.078891]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
	[    0.079593] [0000000000000002] user address but active_mm is swapper
	[    0.080426] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
	[    0.081248] Modules linked in:
	[    0.081656] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.14.0-rc3=
-00113-g3ef9f710efcb #18
	[    0.082796] Hardware name: MediaTek MT8365 Open Platform EVK (DT)
	[    0.083594] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
	[    0.084507] pc : mtk_eint_do_init+0x470/0x580
	[    0.085088] lr : mtk_eint_do_init+0x37c/0x580
	[    0.085663] sp : ffff80008160b7e0
	[    0.086098] x29: ffff80008160b850 x28: 0000000000000000 x27: ffff800081=
2600b0
	[    0.087040] x26: ffff0000bf9b7a80 x25: ffff0000bf9baac8 x24: ffff0000bf=
9baac8
	[    0.087981] x23: 0000000000000000 x22: ffff8000800cebe0 x21: ffff800081=
47e418
	[    0.088922] x20: 0000000000000000 x19: ffff0000021be780 x18: 00000000ff=
ffffff
	[    0.089863] x17: 0000000000000003 x16: ffff000001832b00 x15: ffff000002=
1b70e0
	[    0.090804] x14: 0000000000000001 x13: ffff0000021b70e3 x12: ffff000001=
832c00
	[    0.091744] x11: 0000000000000000 x10: ffff800080f11cc0 x9 : ffff800081=
60b780
	[    0.092685] x8 : ffff80008160b780 x7 : 0000000000000000 x6 : 00000000ff=
ffffff
	[    0.093626] x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff800080=
d0dbb0
	[    0.094567] x2 : 0000000000000000 x1 : ffff800080d53100 x0 : 0000000000=
000000
	[    0.095509] Call trace:
	[    0.095831]  mtk_eint_do_init+0x470/0x580 (P)
	[    0.096408]  mtk_pctrl_init+0x464/0x4fc
	[    0.096917]  mtk_pctrl_common_probe+0x30/0x60
	[    0.097494]  platform_probe+0x68/0xdc
	[    0.097981]  really_probe+0xbc/0x2c0
	[    0.098457]  __driver_probe_device+0xcc/0x120
	[    0.099035]  driver_probe_device+0x3c/0x154
	[    0.099590]  __device_attach_driver+0xb8/0x140
	[    0.100179]  bus_for_each_drv+0x88/0xe8
	[    0.100688]  __device_attach+0xa0/0x190
	[    0.101197]  device_initial_probe+0x14/0x20
	[    0.101752]  bus_probe_device+0xb4/0xc0
	[    0.102261]  device_add+0x554/0x72c
	[    0.102724]  of_device_add+0x54/0x64
	[    0.103201]  of_platform_device_create_pdata+0x8c/0x118
	[    0.103891]  of_platform_bus_create+0x190/0x38c
	[    0.104491]  of_platform_bus_create+0x1d8/0x38c
	[    0.105091]  of_platform_populate+0x74/0x108
	[    0.105656]  of_platform_default_populate_init+0xe8/0x10c
	[    0.106369]  do_one_initcall+0x60/0x1d4
	[    0.106879]  kernel_init_freeable+0x210/0x274
	[    0.107456]  kernel_init+0x20/0x140
	[    0.107921]  ret_from_fork+0x10/0x20
	[    0.108400] Code: 14000002 39404265 f9403260 8b170000 (39400802)
	[    0.109199] ---[ end trace 0000000000000000 ]---
	[    0.109821] Kernel panic - not syncing: Attempted to kill init! exitcod=
e=3D0x0000000b
	[    0.110824] SMP: stopping secondary CPUs
	[    0.111345] ---[ end Kernel panic - not syncing: Attempted to kill init=
! exitcode=3D0x0000000b ]---

The problem is that ...

On Sat, Mar 22, 2025 at 11:52:28AM +0800, Hao Chang wrote:
>  int mtk_eint_do_init(struct mtk_eint *eint)
>  {
> -	int i;
> +	unsigned int size, i, port, inst =3D 0;
> +	struct mtk_pinctrl *hw =3D (struct mtk_pinctrl *)eint->pctl;
> =20
>  	/* If clients don't assign a specific regs, let's use generic one */
>  	if (!eint->regs)
>  		eint->regs =3D &mtk_generic_eint_regs;
> =20
> -	eint->wake_mask =3D devm_kcalloc(eint->dev, eint->hw->ports,
> -				       sizeof(*eint->wake_mask), GFP_KERNEL);
> -	if (!eint->wake_mask)
> +	eint->base_pin_num =3D devm_kmalloc_array(eint->dev, eint->nbase, sizeo=
f(u16),
> +						GFP_KERNEL | __GFP_ZERO);
> +	if (!eint->base_pin_num)
>  		return -ENOMEM;
> =20
> -	eint->cur_mask =3D devm_kcalloc(eint->dev, eint->hw->ports,
> -				      sizeof(*eint->cur_mask), GFP_KERNEL);
> -	if (!eint->cur_mask)
> -		return -ENOMEM;
> +	if (eint->nbase =3D=3D 1) {
> +		size =3D eint->hw->ap_num * sizeof(struct mtk_eint_pin);
> +		eint->pins =3D devm_kmalloc(eint->dev, size, GFP_KERNEL);
> +		if (!eint->pins)
> +			goto err_pins;
> +
> +		eint->base_pin_num[inst] =3D eint->hw->ap_num;
> +		for (i =3D 0; i < eint->hw->ap_num; i++) {
> +			eint->pins[i].instance =3D inst;
> +			eint->pins[i].index =3D i;
> +			eint->pins[i].debounce =3D (i < eint->hw->db_cnt) ? 1 : 0;
> +		}
> +	}
> =20
> -	eint->dual_edge =3D devm_kcalloc(eint->dev, eint->hw->ap_num,
> -				       sizeof(int), GFP_KERNEL);
> -	if (!eint->dual_edge)
> -		return -ENOMEM;
> +	if (hw && hw->soc && hw->soc->eint_pin) {
> +		eint->pins =3D hw->soc->eint_pin;
> +		for (i =3D 0; i < eint->hw->ap_num; i++) {
> +			inst =3D eint->pins[i].instance;
> +			if (inst >=3D eint->nbase)
> +				continue;
> +			eint->base_pin_num[inst]++;
> +		}
> +	}
> +
> +	eint->pin_list =3D devm_kmalloc(eint->dev, eint->nbase * sizeof(u16 *),=
 GFP_KERNEL);
> +	if (!eint->pin_list)
> +		goto err_pin_list;
> +
> +	eint->wake_mask =3D devm_kmalloc(eint->dev, eint->nbase * sizeof(u32 *)=
, GFP_KERNEL);
> +	if (!eint->wake_mask)
> +		goto err_wake_mask;
> +
> +	eint->cur_mask =3D devm_kmalloc(eint->dev, eint->nbase * sizeof(u32 *),=
 GFP_KERNEL);
> +	if (!eint->cur_mask)
> +		goto err_cur_mask;
> +
> +	for (i =3D 0; i < eint->nbase; i++) {
> +		eint->pin_list[i] =3D devm_kzalloc(eint->dev, eint->base_pin_num[i] * =
sizeof(u16),
> +						 GFP_KERNEL);
> +		port =3D DIV_ROUND_UP(eint->base_pin_num[i], 32);
> +		eint->wake_mask[i] =3D devm_kzalloc(eint->dev, port * sizeof(u32), GFP=
_KERNEL);
> +		eint->cur_mask[i] =3D devm_kzalloc(eint->dev, port * sizeof(u32), GFP_=
KERNEL);
> +		if (!eint->pin_list[i] || !eint->wake_mask[i] || !eint->cur_mask[i])
> +			goto err_eint;
> +	}
> =20
>  	eint->domain =3D irq_domain_add_linear(eint->dev->of_node,
>  					     eint->hw->ap_num,
>  					     &irq_domain_simple_ops, NULL);
>  	if (!eint->domain)
> -		return -ENOMEM;
> +		goto err_eint;
> =20
>  	if (eint->hw->db_time) {
>  		for (i =3D 0; i < MTK_EINT_DBNC_MAX; i++)
> @@ -523,8 +580,11 @@ int mtk_eint_do_init(struct mtk_eint *eint)
> =20
>  	mtk_eint_hw_init(eint);
>  	for (i =3D 0; i < eint->hw->ap_num; i++) {
> +		inst =3D eint->pins[i].instance;

=2E.. here eint->pins is NULL.

> +		if (inst >=3D eint->nbase)
> +			continue;
> +		eint->pin_list[inst][eint->pins[i].index] =3D i;
>  		int virq =3D irq_create_mapping(eint->domain, i);
> -
>  		irq_set_chip_and_handler(virq, &mtk_eint_irq_chip,
>  					 handle_level_irq);
>  		irq_set_chip_data(virq, eint);
> @@ -534,6 +594,27 @@ int mtk_eint_do_init(struct mtk_eint *eint)
>  					 eint);
> =20
>  	return 0;
> +
> +err_eint:
> +	for (i =3D 0; i < eint->nbase; i++) {
> +		if (eint->cur_mask[i])
> +			devm_kfree(eint->dev, eint->cur_mask[i]);
> +		if (eint->wake_mask[i])
> +			devm_kfree(eint->dev, eint->wake_mask[i]);
> +		if (eint->pin_list[i])
> +			devm_kfree(eint->dev, eint->pin_list[i]);
> +	}
> +	devm_kfree(eint->dev, eint->cur_mask);
> +err_cur_mask:
> +	devm_kfree(eint->dev, eint->wake_mask);
> +err_wake_mask:
> +	devm_kfree(eint->dev, eint->pin_list);
> +err_pin_list:
> +	if (eint->nbase =3D=3D 1)
> +		devm_kfree(eint->dev, eint->pins);
> +err_pins:
> +	devm_kfree(eint->dev, eint->base_pin_num);
> +	return -ENOMEM;
>  }
>  EXPORT_SYMBOL_GPL(mtk_eint_do_init);

That commit can be cleanly reverted on top of v6.15-rc2 which makes my
machine boot again.

Best regards
Uwe

#regzbot introduced: 3ef9f710efcb

--w4ospt4bmb4y7he7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmf9IlMACgkQj4D7WH0S
/k4QXggAgyNLn6ylpjS1KX4hrElozzwTP7V+KDK8Y7CFWkovlKY0pUSCvJ3Ml6jK
p9JLwHC4fcoPrUSmKfQD5BPvx3DtgFJn3IepDCF8HKGptPE8MFeeq6rUUmVXmvi0
zIyCxPke3FZVhB7GqYBcWuICz3HgNzDTS0F+nxIs1t4e4gEQFXSpEmwbU0W8mmPv
c6bcDCJgqNKdJzYeg/reovaX/rtRSy9x0o7BGZLs1RaAp7/ZcjUaDCRv3vXB/OEk
385Xt4KjxPDUaoIsYHMXoXEQ3ToNST55h+EUWIBrfcVnaehc2HB9PUIOnd6u1cmE
nCMWuO1KuTJ15lE1ICZPeNnKm4cz1Q==
=bFBV
-----END PGP SIGNATURE-----

--w4ospt4bmb4y7he7--

