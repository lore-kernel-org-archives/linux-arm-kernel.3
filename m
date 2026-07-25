Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8ED8C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 09:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhCPhNc9a/U5wLKgysHB0Kn2KnDD7w6pjrLvtRC4YoE=; b=ipbclA+76EXL883OAdNHKk6duM
	1GmxqOG54B8MkbGhZq3QfEJ3djqwDWlrHO/nTWkX5aiXpUhx90G8aVrIMfP3q0SskG8vZWGNcXlZm
	0tB5r5TzuWN6vT0KoDfoc5pdSCaDt4fpt65ovJXosmA+q/LdpPKbUXbFGvl2oX7ZOrkap5t53WRIL
	jpdPuU0MwPPezFoxyulaBDElkvTeNWNgdDgOfkNwwFHol+B3WUNj40kzH40oy3a5vfnRCEGgq+DSn
	nnACtDzwr0KpirbZ+zZrWwUc0zXM2Lt7URacBr58VI96q704B/IENHkfNCMJtFyxq3Lwy7WcIuR8j
	/hwx2RDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnYOy-00000000CH9-3dsO;
	Sat, 25 Jul 2026 09:10:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnYOx-00000000CH3-2RLQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 09:10:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A575C600AA
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 09:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BDC81F000E9
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 09:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784970634;
	bh=AhCPhNc9a/U5wLKgysHB0Kn2KnDD7w6pjrLvtRC4YoE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O448WL0T5x1Zh0OMQi9iRlZwPh0fZiFxzhjRWWu0EW57dDBI9RV4q27LHGrs5BL+6
	 H4GKRULAAaYMpIJejW/rGtFEl5mo6XXITHZ+asMxRsT02OBBedoicBciWZaAJbo1HN
	 UvT4cMd8aX8qGOU9zFZXTWVYqzbabCA6tugKr1n2op26vf7O3ZOkp1/X2l6dJqT0OH
	 hI6Qod10W3XtE+UxUhd1RZfRtpaWw7TYSLmsSJw9CuHDKsd5EwItmbZ4mZEZwtX6NA
	 08vyeguxIywjiFYLqL+6haWSRSguNLRuQ5yyCj9ftCFBGZ1ojqabazhd66+FXf7IGz
	 uCq68P+VZILJg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b01910b499so1022848e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 02:10:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr1tL87XFruXjnBsfH6SuTURzSnz5VV+BB9QUyvTp6Fn5F+gy31+Hndm4PL833mnxuqt4ZusdYo1WLjsoRQRqRB@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq9fUj16EnEDkHqbfYxIflqCBnFglNEmaT4PHVTIQcJHTfCtd0
	oLYP1XB8+BWCZa6/beHOaeYnd/WOQEFr/pNASpaCJcqzt/rhdexrPYXYY97+s4wXxFUEH91f3mx
	jb1q4GFe48eco1Rum986B7XkQnYWPrFk=
X-Received: by 2002:a05:6512:3d07:b0:5ae:b6cf:c745 with SMTP id
 2adb3069b0e04-5b2c1a3c746mr282806e87.17.1784970633111; Sat, 25 Jul 2026
 02:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260718032937.420561-1-pengcan@kylinos.cn>
In-Reply-To: <20260718032937.420561-1-pengcan@kylinos.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 11:10:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLke1q2DX1EQTHysPKrvy8mtnFtbnLwfQ-wEvRE2MNsECA@mail.gmail.com>
X-Gm-Features: AUfX_mwx6iFHSQ9ss2kJ9CSpvbTA4MTcHZwsUdEhUsOwa3V2e4PZJUoBdtU7nvw
Message-ID: <CAD++jLke1q2DX1EQTHysPKrvy8mtnFtbnLwfQ-wEvRE2MNsECA@mail.gmail.com>
Subject: Re: [PATCH] hwrng: stm32 - Fix runtime PM cleanup on registration failure
To: Can Peng <pengcan@kylinos.cn>
Cc: olivia@selenic.com, herbert@gondor.apana.org.au, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, danielt@kernel.org, 
	linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
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

Hi Can,

thanks for your patch!

On Sat, Jul 18, 2026 at 5:30=E2=80=AFAM Can Peng <pengcan@kylinos.cn> wrote=
:

> stm32_rng_probe() enables autosuspend and runtime PM before registering t=
he
> hwrng. If devm_hwrng_register() fails, probe returns with runtime PM left
> enabled and autosuspend still selected.
>
> The remove callback also only disables runtime PM and does not undo
> pm_runtime_use_autosuspend().
>
> Use devm_pm_runtime_enable() so runtime PM is unwound automatically on
> probe failure and driver detach. Since the managed cleanup also disables
> runtime PM,drop the remove callback.
>
> Fixes: c6a97c42e399 ("hwrng: stm32 - add support for STM32 HW RNG")
> Cc: stable@vger.kernel.org

Ah come on, it's not that serious.

> Signed-off-by: Can Peng <pengcan@kylinos.cn>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

