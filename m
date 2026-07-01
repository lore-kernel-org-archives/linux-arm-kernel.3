Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2F8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 22:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVhzVy40B70l/jqexwyJaSJ3X5bFGEqAL47A5U/79HE=; b=cR2iea0UrsoxASf6SII8alBTo9
	8QGIoYLVTw1HJojZ+IS47T2L3iHDFAOG8asJKXkaV+GjwDNkNTpcqizkXzOlunE4f32Mkw+B4FfBR
	41dF0+uPqbKR3emLAxD0OrjIvv3AkMJOT3KeLQN0yvtOjkYSsKK8eZMd8HVyEseBvFaAt1FuuqgWU
	tZRsMu0lSsjjnLcAD+Rhvly/AeW3u7MT6JaWdtNnlFL/DscK3qwa0aJRefF1tM0ZKAuYP5jyPsP9J
	PgbX/ZT8TiNYs3JQGXEa8LGtpzPevhn2pPpY+RU3N0u5Q1D0pmtl+nOBRqpFEZOJybye+GFgOR1ia
	FGmR6VYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf3KB-000000035wp-49kx;
	Wed, 01 Jul 2026 22:22:32 +0000
Received: from mail-qk2-x03.google.com ([2607:f8b0:4864:34::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf3K9-000000035wP-1yqU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 22:22:30 +0000
Received: by mail-qk2-x03.google.com with SMTP id d75a77b69052e-51c0f88ca6aso2045241cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 15:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782944548; cv=none;
        d=google.com; s=arc-20260327;
        b=bV3AXU8PPKfkepAf6hkZUrzUh/HXqgPSLOxiqhKNQYI/fADLwDQwLI2/6nVYc6DCNz
         i+aHtSmvhF9/yioAXGLxDkNwG0YFiQYi3UC0YcAjwFR3WTbQjC9reMWBeMuAp54Oj+uH
         e9+I4M0akLjCgc2wYZaZCIGXDGJLmf6hPsENw2GELDCP8s1EXqLcpWQTVyISxcuypwKh
         mS2utZvz8SbHfuaOS9mNJRzNqTJJurB0XukjTN0ysQhm6VI4hGs9YLBeIxFYMQF0vtkS
         Cz+6ZeCq89wOtPo44OPMToNPxgvpbVvKkfR1ShkGLw+6Avt3/gAd812IfyxkSAxEy8m/
         a+BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MVhzVy40B70l/jqexwyJaSJ3X5bFGEqAL47A5U/79HE=;
        fh=JzVv2IrdCpgayWS9k3G9IGeA/oX0rpITJ3OogKG1cLw=;
        b=sbsHevCqzglitVEz/9HllJfSZW+xm1cwrjNL2p8evrEYI6PTAdyow8frCC27CJizzN
         yI0q046mlAL4vipqAgJvX/KeWEwq0E0xcReoa3R3qYAwcTqozV7AZHmWvSGEUuIQ2osl
         8ZMCOLvPYuSZLC4pCrgnzPSfcY8yU+Z8ET8Wv3mm5efWNCVRq/dXk3KmrH5zup/zkNe9
         yReEi6vSCAZS/oa4Pzz6YBgRSmR/Mmz2Rq45JFIe45QdpdSzoKcs1wjDZ3FV1f52NtIK
         OwoM2Akf2jOdEQqo/1y15NyhoOFohzS6/PoEGXXVSdmW4/Vez6p8L+DxEWGdwoWIxPCb
         TBqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782944548; x=1783549348; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVhzVy40B70l/jqexwyJaSJ3X5bFGEqAL47A5U/79HE=;
        b=F7Io/7UerdDrPO3xa2WljtFazRoDIjoYEL1/LULG7ohrM94HYonp7m7WuxQ87GeC+i
         QIpnmufQ3J4hm9x/oFUdvvfcpdh9EbHNCoBJH4tcyXIBfHM5nu7SsvfoluBhI2k/f7Zp
         1f8UM9Sd+yX0zn5+Rl8p7FTFaulZ4rMBxWUgGeCvsnXgJVZyH184923e2N7wIEIj6JRN
         5HaGKm/K8QRPyQfr9YnAs3MMhgMdiFtYdBCD2o+HEWU7kdAiauEEMtJGDd3bnkYfWFx3
         neOkgfye2jZhqBiQ1rJ7QfiaIpvXBrg+hjKmR/tMCveST8sOeZ7EQIVlnzvSvmeUVW0q
         UGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782944548; x=1783549348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MVhzVy40B70l/jqexwyJaSJ3X5bFGEqAL47A5U/79HE=;
        b=laUy6FdKw1afcGVFH2iMfVZjZ9RlYsvnFyib9EqmWDft4HCCoQn2lq/38vq+Cu4dfA
         1SiJkgcQIb/fdP7AVkN+9sSDF23j+uQYEPwk2i4AZsRt+uDAXLPQEDFKDW8BBcTS5YNA
         O4W/K2ENcJ0kott+ZC2DjL+0Z73dwlhqAbq07vpD73RLeAKvINR8MUwtkGyLlmwsOno7
         3LpRI4/QPbDRACXQtQhGoUbqgbybolK09V5uFa0MPo5bZ2vaW7mK0I9QJ045KZMv0/qA
         KX48HCuuVlzQBIsjPFVQksgQGMzHt/QyU+Qh2r8xV4aG40NjFPFW+ei2VhyrYdreaHWG
         NhoQ==
X-Gm-Message-State: AOJu0Yzw2q6pNPwqEuRmFobcmjmdRbDB9iGXgrUvXStpBLgzfTVMgVJb
	jNbdAfoyg7Btus97RqWjy8+4JtutALoJdxNdVt0pbOnQmDJFTh/RUvjXNeOHQ0sKWsdZ26UtR0y
	nAzT+awfkPYMSeyDfKp6IAit0T+1sWis=
X-Gm-Gg: AfdE7cmudZSHpV8Md81KKqTKCqven02GgtZzvGUjXgqWcoCn/6YZC2aJO7pEt7PWPD+
	rY1Jdt3SglipozsBCkHDDRtpML1c76skUsB6vpplSoDfrN6U4RN+kuLk0RNnKTL5fNY7RRiyAWf
	CVS6+LnAFI2EUBPoBfYbC0spQlwI2MiEnbSZutXUeMpy5O/8rd2IeHe89iKb635E6ARMY78TJKg
	0fGrojoh0IvnJTiIWtMpv4VSLbXngc1Kqw2kWzCwp7d+E2BgYoGvdRviMsJWKFxgHidreM0jZws
	4eAg/eSrYNkSsRYqA0IFPrkauwcFMZXMN3D3CColiLRwPowaf6CLr67/A3DTA0KsQK8N
X-Received: by 2002:ac8:5981:0:b0:51b:fca2:af71 with SMTP id
 d75a77b69052e-51c26b14753mr45380561cf.42.1782944548094; Wed, 01 Jul 2026
 15:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260701212353.2196041-1-arnd@kernel.org> <20260701212353.2196041-6-arnd@kernel.org>
In-Reply-To: <20260701212353.2196041-6-arnd@kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Wed, 1 Jul 2026 15:22:17 -0700
X-Gm-Features: AVVi8CdgN18Vc-unGLPG99aYWmbh8Lx3HkejzODRi3mFEu8urukn9hQEI-DKk2E
Message-ID: <CADkSEUhif4s5sSHe-bMapxEiM4bksaNkS+R5EtWOV2kgsk-29w@mail.gmail.com>
Subject: Re: [PATCH v2 05/19] ARM: turn CONFIG_ATAGS off by default
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, 
	Ard Biesheuvel <ardb@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Daniel Mack <daniel@zonque.org>, Frank Li <Frank.Li@nxp.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	"Jeremy J. Peper" <jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Ralph Siemsen <ralph.siemsen@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Stefan Wiehler <stefan.wiehler@nokia.com>, Tony Lindgren <tony@atomide.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Will Deacon <will@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_152229_530595_524C7E19 
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

Hi, Arnd,

Looks good to me, though I noticed a few small issues.

On Wed, Jul 1, 2026 at 2:24=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Only a very small number of machines remain that rely on
> traditional board files with the ATAGS boot data instead
> of devicetree, and we have not accepted new ones for
> a decade.
>
> Most of the remaining ones are on their way out of the
> kernel, but the Kconfig option that controls ATAGS
> is still enabled by default.
>
> To reflect the actual status of ATAGS support and alert
> the remaining users of upstream and out-of-tree platforms
> with this, chanyge it to being default-disabled and
nit: change*

> add a dependency on CONFIG_EXPERT.
>
> The board specific defconfig files that rely on ATAGS
> are changed to turn on both EXPERT and ATAGS if they
> were not doing thath already, and the ones that explicitly
nit: that*

> turned it off before no longer need to.

> --- a/arch/arm/configs/stm32_defconfig
> +++ b/arch/arm/configs/stm32_defconfig
> @@ -20,7 +20,8 @@ CONFIG_ARCH_STM32=3Dy
>  CONFIG_CPU_V7M_NUM_IRQ=3D240
>  CONFIG_SET_MEM_PARAM=3Dy
>  CONFIG_DRAM_BASE=3D0x90000000
> -# CONFIG_ATAGS is not set
> +CONFIG_FLASH_MEM_BASE=3D0x08000000
> +CONFIG_FLASH_SIZE=3D0x00200000

^ These shouldn't be here - they depend on CPU_ARM740T || CPU_ARM946E
|| CPU_ARM940T, and they were manually removed previously. If they got
added when you did make savedefconfig, I'm not sure why, given that
dependency.

Reviewed-by: Ethan Nelson-Moore <enelsonmoore@gmail.com> (assuming
these issues are fixed)

Ethan

