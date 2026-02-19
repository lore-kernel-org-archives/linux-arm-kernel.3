Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BF9E9A05A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 18:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMZYMKCfRO1P00AFy8aKMQ+jjXDkHAdCnmx8W4egAKY=; b=FOANuwQrf+b6gigwds+GZBBzLq
	+D73k0Jz0jvRbd7qmyEkwDWUBHUQJwk+utPVrIXG2WiCln8aDv8vQxY1znfJOKllze7UcWoNrWmbv
	dgEw1jDdvY/L+e31CQKwVji+9SFuKPAq4fv4mMu3UXsa/x9C6Xs690BqmVOMfDhn+yx3Q2DY0HNaF
	zxw7zhCyAZf+7vweEukMN2MUOVBeb4PY2Ip/LD0n9TikRQkufiwiOgslvXmL8G1HbxaE5TA5bNALg
	QM+O8lEdwrTIQAu6fVu1fH5xrd6uBxkArBz6oDFZY6Q74ZPeHITW04TP60E+mZqMVDDg9SfW5kMX5
	cFFWbxmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8yY-0000000BnYk-3yNg;
	Thu, 19 Feb 2026 18:42:10 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8yW-0000000BnY3-2EJY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 18:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1771526522;
	bh=6/iezbvx6MIXp+pbGoZW7PKtUMMWOusSDApm2rJKtYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rR28TUEv4Jls8PLGjd1MVfZpFs8m0ZVg+yghXO1Rb+SpBWCLpUKYvE6iUmsZPZmMr
	 RU4I4s1JnrZpD6F/GMsuVkSkQz+gB+4bLd02mur96IEHpmd2AG0aJsOIbygBFi4dFU
	 h98LqnIXxT6lINGuoHzN59SzLiZJlRy69D2g17cM=
Date: Thu, 19 Feb 2026 19:42:01 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Yury Norov <ynorov@nvidia.com>
Cc: linux-kernel@vger.kernel.org, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Andrew Morton <akpm@linux-foundation.org>, Antoine Tenart <atenart@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Eric Dumazet <edumazet@google.com>, Geetha sowjanya <gakula@marvell.com>, 
	Ingo Molnar <mingo@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	James Clark <james.clark@linaro.org>, Jerin Jacob <jerinj@marvell.com>, 
	Linu Cherian <lcherian@marvell.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Mike Leach <mike.leach@linaro.org>, Moritz Fischer <mdf@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Subbaraya Sundeep <sbhatta@marvell.com>, 
	Sunil Goutham <sgoutham@marvell.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Tom Rix <trix@redhat.com>, Xu Yilun <yilun.xu@intel.com>, Yajun Deng <yajun.deng@linux.dev>, 
	Yury Norov <yury.norov@gmail.com>, Zhang Rui <rui.zhang@intel.com>, hariprasad <hkelam@marvell.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org
Subject: Re: [PATCH 08/12] coresight: don't use bitmap_print_to_pagebuf()
Message-ID: <68f8d4b0-6df2-4743-bb71-f44671219931@t-8ch.de>
References: <20260219181407.290201-1-ynorov@nvidia.com>
 <20260219181407.290201-9-ynorov@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219181407.290201-9-ynorov@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_104208_793741_4511D3EC 
X-CRM114-Status: GOOD (  15.95  )
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

Hi Yury,

On 2026-02-19 13:14:00-0500, Yury Norov wrote:
> Switch to a more common scnprintf("%*pbl") where appropriate.
> 
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
> ---
>  .../hwtracing/coresight/coresight-cti-sysfs.c | 33 +++++++++----------
>  1 file changed, 15 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> index 572b80ee96fb..182c8db52a04 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -606,14 +606,11 @@ static ssize_t chan_gate_enable_show(struct device *dev,
>  	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>  	struct cti_config *cfg = &drvdata->config;
>  	unsigned long ctigate_bitmask = cfg->ctigate;
> -	int size = 0;
>  
>  	if (cfg->ctigate == 0)
> -		size = sprintf(buf, "\n");
> -	else
> -		size = bitmap_print_to_pagebuf(true, buf, &ctigate_bitmask,
> -					       cfg->nr_ctm_channels);
> -	return size;
> +		return sprintf(buf, "\n");
> +
> +	return scnprintf(buf, rest_of_page(buf), "%*pbl\n", cfg->nr_ctm_channels, &ctigate_bitmask);

For sysfs show handlers the correct formatting function is sysfs_emit()
rather than raw scnprintf(). It validates that buf is page-aligned
(which is always true for sysfs show handlers) and that the output does
not exceed PAGE_SIZE.

(...)


Thomas

