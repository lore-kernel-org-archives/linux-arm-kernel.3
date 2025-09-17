Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A6ECAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCz4bFinyR1BieLUIHZQZV0TDdidYv9V2bEcGI7xH7o=; b=ZWvLd9ILU2oIg/UrwyL6LOgbd0
	0i2RquwVqcgKyxhzX+IQA+tvPoQ/8Na1vpRKd08CEif3dQieZH+jBB0rxlAXBMMF5EGESyEPOxRCP
	LGoYWhyX9tykYwHj0b1wXph9KOs7mMGxFoiUfb4BQxKB0O1qjDX6NhcCLjTd7Cn5zUK0o8/GisgUJ
	fMaiWnoq1TV7ujkNxc5q5I8lZa7etX6b0DDfJfGjzV7PobdqMWzwsvZu8K19ScMRnppRDWbnSv5ZU
	chz8MhBD9gMFy54j20Mnd6aYVy1qcdO1/Fh8TpCPx5JbenLaJadDguv+umBWA+8sJpCOrRZGtv9xY
	XLltAdJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytDQ-0000000CFqw-2v09;
	Wed, 17 Sep 2025 14:33:00 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytDN-0000000CFn2-3dSF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:32:59 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-ea5c1a18acfso719532276.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 07:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758119577; x=1758724377; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dCz4bFinyR1BieLUIHZQZV0TDdidYv9V2bEcGI7xH7o=;
        b=dS38sl9jjM8pCb7gOpPvArFE+v9RYHQcz1Th9rRzVEukTSTsS+yNnBLqjMY0hsDDkZ
         7RvAH6+gO1Rt4aZm9tY9Fx6KTjevNTqQuE7LUFdeP4gplui/eE9bsRxVtiy3L/L4f3n1
         uSnP7fSaJz9B2hLWLBfSFqxmwyOQpp02uFY1H4tNlaiVzU8nOumnxe6RoJDs25+wAtMJ
         4xgxVyBZmCINGrHcWTGYxAGS+5oJ558fRUmqU+nMRstXCN84RLqqc8YUBQOhkhoBYnxU
         WeHbNTNSfSEJ2yaIsaX6Z1H0b24te8yoWtJTqX3Xq69azSMLNjG/gk+W4K1LeMDZSRBX
         ykeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758119577; x=1758724377;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dCz4bFinyR1BieLUIHZQZV0TDdidYv9V2bEcGI7xH7o=;
        b=pPdsW9CcCC9j4ZZPYPBb97n2dqiv5Ya1dGgCEqtzi6E1ORJaM1lK0Vscp/VLK8DG+3
         zBXZHuIdhWvsoX2xkf/EJjcZBb18kdIN+rcByQYSjy5GChqVCTujdi2ulfGhShkSErba
         pfGjdz0XKw17a3mbx3HAmKqygA/jOJTwVniGKt6rVm22Y+dG+w/DiU1D8KTXqCwTW4As
         RnRzep+AcljAA0a/wDPTaH4XG5gAIh+66rqLW3lMionX73Nar7+Opqo9xQTP+mQQ/Sxw
         Xk3v93t9nxijWsfRRU8dUy/2Cj94PHSI/l9zej7AmrI1CF/Gg19G8WZCSZS8G2Gy8t9l
         vfBg==
X-Forwarded-Encrypted: i=1; AJvYcCV7IVACH76YrOuvfYRE9LDpm3N9L6SANuBGiq6dN+EhY0O8KU5mPcTFnr54eUxSxGBVqEvFlls6wihkcI8yTsue@lists.infradead.org
X-Gm-Message-State: AOJu0YyHR7OxP3B1fkR52TOPLNqOu2lQrhJdMzfVWkIKpBJnpccyRFgO
	ARgfA5hN4PAGt9dGd243tzESucGb2n+3KCpftAgg8S96USNxleoCd2KwEWW/naKaCr2hDS2x9s/
	eJvB2XuBETHYw8uiADDMo6RItKIG9gD9NRaDRr3abZA==
X-Gm-Gg: ASbGncsIBXrXPrzY0S1BxxzMjy5ggF+SBpI7epWa5yy4ar5isQYkM8mCArlnGNATewG
	n2GDcFNkTZTLff7D5/S1XJZY/ApdTtDThQB/KGVdjFY7DNYe7roRfJLJAPbeI1ZaptfJmnMMIbH
	lJNZUYT4T3F5/KrcByPsJYXQvX9GsI5arQtDdHE1t1Nk7QfdD+GnqQBXe+MMtBcmPSLGKw5XQJZ
	rvd/qSt
X-Google-Smtp-Source: AGHT+IGYd75X0Qf3WTxoJJzFk2/YdrBkHI2rWEVx/WssCazdqocK2S+85yiq6AsUYraILKbckm2rz5VkDvdIi7Gceg0=
X-Received: by 2002:a05:6902:124c:b0:ea5:c97c:3182 with SMTP id
 3f1490d57ef6-ea5c97c50bcmr1102726276.36.1758119576502; Wed, 17 Sep 2025
 07:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250915083317.2885761-1-mikko.rapeli@linaro.org>
In-Reply-To: <20250915083317.2885761-1-mikko.rapeli@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 17 Sep 2025 16:32:20 +0200
X-Gm-Features: AS18NWBqAAb3pOa1iLGjs8mbJODRThiYyAWA34gbcKMC5sx254a7Jh6zE5vInCA
Message-ID: <CAPDyKFpR+uueS16P7OZi6-1NVrEyPbizuSnMHWMyROfqzPjarg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] enable ROCKCHIP_PM_DOMAINS
To: Mikko Rapeli <mikko.rapeli@linaro.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_073257_908005_0C68C060 
X-CRM114-Status: GOOD (  15.98  )
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

+ Heiko

On Mon, 15 Sept 2025 at 10:33, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
>
> Hi,
>
> MMC_DW_ROCKCHIP needs ROCKCHIP_PM_DOMAINS before MMC is detected
> on Rockchip rk3399 rockpi4b and similar devices. Make this dependency
> more visible, or the default with ARCH_ROCKCHIP if possible.
>
> v4: fixed Kconfig whitespace, added select REGMAP_MMIO to MMC_LOONGSON2
>     instead of disabling COMPILE_TEST
>
> v3: use "default ARCH_ROCKCHIP" in ROCKCHIP_PM_DOMAINS as suggested
>     by Arnd Bergmann <arnd@arndb.de>, enable more MMC drivers for
>     COMPILE_TEST and remove MMC_LOONGSON2 which doesn't link,
>     remove PM dependency as suggested by
>     Geert Uytterhoeven <geert@linux-m68k.org>
>     https://lore.kernel.org/linux-mmc/aMQv1V49xa_MThGq@nuoska/T/#md2b3252f9dce14f3f79a493c426f2761cba1dc25
>
> v2: changed from "depend on" in MMC driver to "select" as default
>     on ARCH_ROCKCHIP as suggested by Ulf and Heiko
>     https://marc.info/?i=20250912084112.2795848-1-mikko.rapeli%20()%20linaro%20!%20org
>
> v1: https://lore.kernel.org/linux-mmc/20250911144313.2774171-1-mikko.rapeli@linaro.org/
>
> Mikko Rapeli (4):
>   pmdomain: rockchip: enable ROCKCHIP_PM_DOMAINS with ARCH_ROCKCHIP
>   mmc: add COMPILE_TEST to multiple drivers
>   mmc: select REGMAP_MMIO with MMC_LOONGSON2
>   ARM: rockchip: remove REGULATOR conditional to PM
>
>  arch/arm/mach-rockchip/Kconfig    |  2 +-
>  drivers/mmc/host/Kconfig          | 10 ++++++----
>  drivers/pmdomain/rockchip/Kconfig |  1 +
>  3 files changed, 8 insertions(+), 5 deletions(-)
>

Patch 1 applied for next to my pmdomain tree. Patch 2 and 3 applied
for next on my mmc tree. Thanks!

Heiko, can you pick up patch 4 via your Rockchip tree? Or if you
prefer me to pick it, I can funnel it via my pmdomain tree. Let me
know please.

Kind regards
Uffe

