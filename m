Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944F6C71155
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 02:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItE5LTzozOsAetn4WQ1Ta5UuaFaBQiatwV/mVr7BE8o=; b=avYzGwVmGk4DQlKPqMsn1p9x0M
	P3w9IfO8NDCurlG0PFzJTgnz9ZWYcb02L91pD03XSkKuDoFo7KHnu+zdLEqZ2zNA6uEdaMi8oRj24
	14bHxGJJ4LawXbOhzaBaH0PUVlELD1qzzUe3Mrlu6RKY17MY1Rv8SG/giv3tF5aMqyY+cqgYZ1PYs
	k18EvxED3v+5Asdl+Vi7A4l+sBDhuYvv62CL1W0ObXKMcLC+Hj7x1Jz9rwsyrGb9aHIjRQIxw7TLx
	dgtsPmqj+JFa9Efz23QWXTGlEJUH99wzt/W1qhNgpSizYZ0Mg8c+XAcw4g8VVUAy/XyRGyydlFHde
	EGi84Wkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRil0-00000008pdx-2Zi5;
	Wed, 18 Jun 2025 02:42:34 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRihl-00000008pPL-03Vl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 02:39:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750214351;
	bh=ItE5LTzozOsAetn4WQ1Ta5UuaFaBQiatwV/mVr7BE8o=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=ZtGpREkifDbhmwhg2Hx21YfFGNN5FATZloYBSy9QAEOF99qh6fJHo5f403fiT+n8U
	 4FcnEVWY4wrFYt4YRuXe4l7+I7Oo7d+iuOq97XWwkZr/Lfv+Q3sx7PN29en12bv49m
	 ml9ZlQb6WjoHcN7TCUEWWgOcnXNL30c+yLDptTUitxnR54Wq3kI3My3AaVwrsnNC2I
	 nAiIn88vAoz0vjz+LXr27bBzSN5cjwx7OwPUwlB9K8/grSYrQfLCNEmjQ1huFZWa2X
	 dIRzLWpYPaUfcrMMgMHCRq4v79zAPpt5zfGqJ2H3Bf/ICByT3TyLUmE0RP0RqaCLfV
	 YV5lLooh72UKA==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 86EA0640A0;
	Wed, 18 Jun 2025 10:39:09 +0800 (AWST)
Message-ID: <4c380a2936fc5c1f37750f231eb48edc17aefa68.camel@codeconstruct.com.au>
Subject: Re: [PATCH 4/8] mmc: sdhci-of-aspeed: Get max clockk by using
 default api
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cool Lee <cool_lee@aspeedtech.com>, adrian.hunter@intel.com, 
	ulf.hansson@linaro.org, joel@jms.id.au, p.zabel@pengutronix.de, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 18 Jun 2025 12:09:09 +0930
In-Reply-To: <20250615035803.3752235-5-cool_lee@aspeedtech.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-5-cool_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_193913_242429_7B0DE390 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

On Sun, 2025-06-15 at 11:57 +0800, Cool Lee wrote:
> Don't limit clock frequency by f_max.
>=20
> Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>
> ---
> =C2=A0drivers/mmc/host/sdhci-of-aspeed.c | 10 +---------
> =C2=A01 file changed, 1 insertion(+), 9 deletions(-)
>=20
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-=
of-aspeed.c
> index 10160a706334..2bdd93a3f91f 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -288,14 +288,6 @@ static void aspeed_sdhci_set_clock(struct sdhci_host=
 *host, unsigned int clock)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sdhci_enable_clk(host, cl=
k);
> =C2=A0}
> =C2=A0
> -static unsigned int aspeed_sdhci_get_max_clock(struct sdhci_host *host)
> -{
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (host->mmc->f_max)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return host->mmc->f_max;
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return sdhci_pltfm_clk_get_max=
_clock(host);
> -}
> -
> =C2=A0static void aspeed_sdhci_set_bus_width(struct sdhci_host *host, int=
 width)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sdhci_pltfm_host *=
pltfm_priv;
> @@ -446,7 +438,7 @@ static int aspeed_sdhci_execute_tuning(struct sdhci_h=
ost *host, u32 opcode)
> =C2=A0static const struct sdhci_ops aspeed_sdhci_ops =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.read_l =3D aspeed_sdhci_=
readl,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.set_clock =3D aspeed_sdh=
ci_set_clock,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.get_max_clock =3D aspeed_sdhc=
i_get_max_clock,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.get_max_clock =3D sdhci_pltfm=
_clk_get_max_clock,

This was used to limit the maximum bus speed via the devicetree. See:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Dv6.16-rc2&id=3D0a0e8d7501cda79c9b20f6011814e2ec9b473ade

Why remove it? There's no discussion of the motivation in the commit
message.

Andrew

