Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB9AC54E71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 18:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3v+sVXn3QS5HAZR6rlTvCjsDNvFK3/tVpaq1eLWVu0=; b=zVWAV3PVrLYFqVjeDTyytOJ3r0
	gQlr7erDvis4zCWOjHRXAROclTeBspx3le30p6l57KzCNkSb30X/+keoFqVnDcSgohnGTxOgSkSTv
	u4woeQno4TeomV1qtovkZyRJ723mBU3bKIiIWMlJOUFcG2Qlb/LdYLZi5ZbA+wMzHGj1y3DZjNWuR
	LOVh7WV2OKu7LDi2G3BjdYU48iNj6lDuCQb1nopWYLY6SwuEe4fSB36w8b+/GaL+idsZJWF2ba4ZZ
	Xw3OvhVtwyscfF4RIEYG4CF/h+d0T+h+6p7kdaUIK23uuZg5ilufM5OaQfp5KTfp5tyf2OQPZlJmM
	W6Ap/07A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHRw2-0000000Dphm-2Ju7;
	Tue, 20 May 2025 18:43:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHRrR-0000000DoZ5-108G;
	Tue, 20 May 2025 18:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=u3v+sVXn3QS5HAZR6rlTvCjsDNvFK3/tVpaq1eLWVu0=; b=TnlDoJMght2Uzy7gaxZQpE1Dr9
	FusfAMBSB6rYCB2jSSC2ocaG3pmnnC4ac1wuEfYHlSIWE//NkQMgDiSNIZBHdGGoNVIQf/sYrAhqG
	dGCCrZbu6H8GDMuGifH6qjt+7lRyybeemwOSPelvQg/A+kZfDzwOtwuL34RG66DgyKh3uw4RaAEBk
	poOhLxpuPu/Biw69o9blr5h40q1O9+pbNAgjjysf+DpidOyYQfHxJ266061ZSTRZrvEeI+NPv/zMw
	QIe7wsj6hRfUThpCKD8m2PTrPcOkSR5CfY3ChPnCz3zoRItFVsnX+Ha7e9T65SpWH1PgqgKBFhh+I
	pRpNb4HQ==;
Received: from [61.8.146.112] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uHRrM-0004Av-9K; Tue, 20 May 2025 20:38:40 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: ulf.hansson@linaro.org, mark.rutland@arm.com, lpieralisi@kernel.org,
 sudeep.holla@arm.com, Robin Murphy <robin.murphy@arm.com>
Cc: linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] pmdomain: rockchip: Relax SMCCC dependency
Date: Tue, 20 May 2025 20:38:39 +0200
Message-ID: <2393836.usQuhbGJ8B@phil>
In-Reply-To: <6f0a38e596c0727d0de13a29c9224f71bc7d30f1.1747760015.git.robin.murphy@arm.com>
References: <ab0476382e3342161beda94a45ddadb49b026dcd.1747760015.git.robin.murphy@arm.com>
 <6f0a38e596c0727d0de13a29c9224f71bc7d30f1.1747760015.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_113845_275003_75CDEADE 
X-CRM114-Status: GOOD (  15.80  )
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

Am Dienstag, 20. Mai 2025, 19:10:17 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Robin Murphy:
> Most 32-bit Rockchip platforms do not use PSCI, so having to select
> ARM_PSCI to satisfy a dependency chain to retain working power domain
> support is a bit weird and non-obvious. Now that the offending SMCCC API
> is properly stubbed out for optional usage, we can relax this again.
>=20
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>


Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Of course this needs patch1 of this series to get applied
first.

I think for bisectability, doing this directly in patch1 might
be less dangerous though?


Heiko

> ---
>  drivers/pmdomain/rockchip/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/pmdomain/rockchip/Kconfig b/drivers/pmdomain/rockchi=
p/Kconfig
> index 218d43186e5b..ffe5e7b78494 100644
> --- a/drivers/pmdomain/rockchip/Kconfig
> +++ b/drivers/pmdomain/rockchip/Kconfig
> @@ -4,7 +4,6 @@ if ARCH_ROCKCHIP || COMPILE_TEST
>  config ROCKCHIP_PM_DOMAINS
>  	bool "Rockchip generic power domain"
>  	depends on PM
> -	depends on HAVE_ARM_SMCCC_DISCOVERY
>  	depends on REGULATOR
>  	select PM_GENERIC_DOMAINS
>  	help
>=20





