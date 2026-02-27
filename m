Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EE0FEFB6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 16:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSLNPkpgMwoAx82HJQcOdj8oKFgWRh/Oj/rxFeK0Yl8=; b=Lzy4Dk3nMWz+arVytuepvP+/dQ
	/oFy6epqZGiSauF/TIfzWdzegAbJk11d0rIs5aH66I2jPOgKdOainujZPVSRgiXItvxNqcxUeFOGl
	N8GMKk6oqQG58e0Vk6KEnOu+UNjz3c+0Pk5n5InbwGQS2sUmOXBR5cLxRmzmbbnho3XJx8IbE2fm8
	8IlUfoDfM47zST45icq9lKdgtYeh2mn4mdHSxgM2QXNAD5OZeL/R7t2YJ0K30cQQmYEmuBSF7wvjr
	w8Ld8DJhChWVFGspp6vmBdksjOupE7zms0rCb8I+cLu8nuHbL4GZw10Nsmu8jDmukzMxFLOccI91R
	qHEmIJfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw12l-00000008ky5-20Pb;
	Fri, 27 Feb 2026 16:50:23 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw12i-00000008kxS-2jAp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 16:50:22 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fMvST2qHSzJ46C8;
	Sat, 28 Feb 2026 00:49:45 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 2D48B40584;
	Sat, 28 Feb 2026 00:50:12 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 27 Feb
 2026 16:50:11 +0000
Date: Fri, 27 Feb 2026 16:50:09 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<arm-scmi@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <sudeep.holla@arm.com>,
	<philip.radford@arm.com>, <james.quinlan@broadcom.com>,
	<f.fainelli@gmail.com>, <vincent.guittot@linaro.org>,
	<etienne.carriere@foss.st.com>, <peng.fan@oss.nxp.com>,
	<michal.simek@amd.com>, <dan.carpenter@linaro.org>,
	<geert+renesas@glider.be>, <kuninori.morimoto.gx@renesas.com>,
	<marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH 01/11] firmware: arm_scmi: Add clock determine_rate
 operation
Message-ID: <20260227165009.000040d6@huawei.com>
In-Reply-To: <20260227153225.2778358-2-cristian.marussi@arm.com>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
	<20260227153225.2778358-2-cristian.marussi@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_085020_999472_7745ECBB 
X-CRM114-Status: GOOD (  23.82  )
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

On Fri, 27 Feb 2026 15:32:15 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a clock operation to help determining the effective rate, closest to
> the required one, that a specific clock can support.
> 
> Calculation is currently performed kernel side and the logic is taken
> directly from the SCMI Clock driver: embedding the determinate rate logic
> in the protocol layer enables semplifications in the SCMI Clock protocol

simplifications

> interface and  will more easily accommodate further evolutions where such
> determine_rate logic into is optionally delegated to the platform SCMI
> server.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Hi Cristian,

Drive by review follows.  It's Friday afternoon an only a few mins to beer
o'clock :)

> ---
> Spoiler alert next SCMI spec will most probably include a new
> CLOCK_DETERMINE_RATE command to delegate to the platform such calculations,
> so this clock proto_ops will be needed anyway sooner or later
> ---
>  drivers/firmware/arm_scmi/clock.c | 42 +++++++++++++++++++++++++++++++
>  include/linux/scmi_protocol.h     |  6 +++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> index ab36871650a1..54e8b59c3941 100644
> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -8,6 +8,7 @@
>  #include <linux/module.h>
>  #include <linux/limits.h>
>  #include <linux/sort.h>
> +#include <asm/div64.h>
>  
>  #include "protocols.h"
>  #include "notify.h"
> @@ -624,6 +625,46 @@ static int scmi_clock_rate_set(const struct scmi_protocol_handle *ph,
>  	return ret;
>  }
>  
> +static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
> +				     u32 clk_id, unsigned long *rate)
> +{
> +	u64 fmin, fmax, ftmp;
> +	struct scmi_clock_info *clk;
> +	struct clock_info *ci = ph->get_priv(ph);
> +
> +	if (!rate)
> +		return -EINVAL;
> +
> +	clk = scmi_clock_domain_lookup(ci, clk_id);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	/*
> +	 * If we can't figure out what rate it will be, so just return the
> +	 * rate back to the caller.
> +	 */
> +	if (clk->rate_discrete)
> +		return 0;
> +
> +	fmin = clk->range.min_rate;
> +	fmax = clk->range.max_rate;
> +	if (*rate <= fmin) {

Does the rate ever end up different by doing this than it would if you
just dropped these short cuts? If not I wonder if this code complexity
is worthwhile vs

	*rate = clamp(*rate, clk->range.min_rate, clk->range.max_rate);

then carry on with the clamping to a step.

The only case I can immediately spot where it would be different would
be if (range.max_rate - range.min_rate) % range.step_size != 0
which smells like an invalid clock and could result in an out of
range rounding up anyway.

> +		*rate = fmin;
> +		return 0;
> +	} else if (*rate >= fmax) {
> +		*rate = fmax;
> +		return 0;
> +	}
> +
> +	ftmp = *rate - fmin;
> +	ftmp += clk->range.step_size - 1; /* to round up */
> +	do_div(ftmp, clk->range.step_size);
> +
> +	*rate = ftmp * clk->range.step_size + fmin;
> +
> +	return 0;
> +}



