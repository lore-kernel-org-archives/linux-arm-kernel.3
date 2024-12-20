Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1371AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 23:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxwgeOZtuv3qcW9w6BiFTfOB12a0FMMKVsVYA8VC60g=; b=fOEpvjT6ecCrsPjBDpcL5qgrk2
	m6yc3AjNsAl1vdo+Ak+IhdUiiawLHAEjBiPMi2MdW8FBsZf0fUWfawIg/fStBm6GqLQ0skDzDhsUr
	MHz0lTnXuOK2Alrbd6FezmmdMjXyUdG0flJx1PIAHnNqKXDkoKXfSSmQGe3B0l1q291UJ0nR471mK
	1ouyOwgw3j51HbLCXaE2kWQkvLNbP6tz6jLjj6/wvNPGBJ4lNphw1yAqvAc36no1HKyddSMJiwfnI
	ZvLfMvJlTPMYSc+UelZvfv/BYKoHUb7TjlCGgC7vash4mhdjV6B+gECojkmAO8dAMMv9risv8eQ0X
	Cga+rUZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOmrH-00000006IHM-16TM;
	Fri, 20 Dec 2024 23:56:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOmq4-00000006I89-1gcS;
	Fri, 20 Dec 2024 23:55:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C07645C607C;
	Fri, 20 Dec 2024 23:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B04BC4CECD;
	Fri, 20 Dec 2024 23:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734738923;
	bh=+anQ9xF+0gz9v214qO3fi++5Sf130otJ9k+BvwMiYQ4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UXZ70aLM6AURxPoYjUrcCrTLvxdpkaXPlVrWvwr1c+L1AtURicOd+xpOWhedqUojm
	 x6b/fUBVBzNww6IKkWzCaKwEbG+CN78sMwdOz+7nEL9VdH/9ay8pKAV0jtVsb6HfLd
	 G0ECtdXJ8KLKrCc3L3oz/GOPaQY+m4sVgVRCannf+Mr6gtPVfaI2HHgXlTNXRO0ahp
	 1PrMORqQD2CuCSBKfdh1pjOBjskTInkQ/zPbH3smA93blin2n6cJF5KGCdVmEzird8
	 upPThBce+Sp2T4YBM4YMwG45mHIuMREqV4eDf0kA0828Dh5H24ACcpBWCVE8TLP4pd
	 aCObeNDPhfPeg==
Message-ID: <6ce3260dafcf3b1ace3d6bb4255e2d9b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-1-96dd657cbfbd@baylibre.com>
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com> <20241220-amlogic-clk-drop-clk-regmap-tables-v1-1-96dd657cbfbd@baylibre.com>
Subject: Re: [PATCH 1/3] clk: add a clk_hw helper to get the associate device structure
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Dec 2024 15:55:21 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_155524_492048_92396629 
X-CRM114-Status: GOOD (  13.27  )
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

Quoting Jerome Brunet (2024-12-20 09:17:42)
> Add an helper function to get the 'struct device' associated with

Add a helper

> an a 'clk_hw'. This can be used by clock drivers to access various

with a 'clk_hw'

> device related functionnalities such as devres, dev_ prints, etc ...

s/functionnalities/functionality/

>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/clk.c            | 6 ++++++
>  include/linux/clk-provider.h | 1 +
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 9b45fa005030f56e1478b9742715ebcde898133f..7e734d2955978cafd77d91156=
2a26f1646684ec2 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -365,6 +365,12 @@ const char *clk_hw_get_name(const struct clk_hw *hw)
>  }
>  EXPORT_SYMBOL_GPL(clk_hw_get_name);
> =20
> +struct device *clk_hw_get_dev(const struct clk_hw *hw)

Please document with kernel doc

> +{
> +       return hw->core->dev;
> +}
> +EXPORT_SYMBOL_GPL(clk_hw_get_dev);

I suspect a quick KUnit test can be written up as well that confirms the
device the clk is registered with is returned.

