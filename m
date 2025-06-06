Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E020C5B559
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 09:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aP4MXX0oWwelisWmW/yllFN578mi8g+KzEyunEzNlHE=; b=aY6jYeS5yQzWo3vVdLkoIfblnK
	KCedizFoFXxcLUSggxGyp4hIZgtbWnUqE2DGTnqkYCBHLPgLXEM558tMQrHvQrGoW5LDk81Z6KOP6
	XMLhjPWyOfmYkrME04cW2CYzBkJa+Xpt+mRo+OGLowzLuN5Fuys8R7m+9f/ueH9a5t2c9lRi6+95G
	eA6z/mFqE/wnHnqXQjkw9gQjYHJ9WiUiknwJegxmwrjiT7HC+D4jjEpyOlBMeifkYeygKyKxHLDvx
	u8z3n1c9AH7HdSlYtfy168jci+fAEgbV1lyshNJxkW77eFQw8SETBLll+YuKjnPTWxtGFulPqJ4Qx
	pbUv2e3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTh3-0000000HZtm-06tW;
	Fri, 06 Jun 2025 09:48:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTc2-0000000HYkg-18ky
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 09:43:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF043153B;
	Fri,  6 Jun 2025 02:43:25 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D5C93F59E;
	Fri,  6 Jun 2025 02:43:42 -0700 (PDT)
Date: Fri, 6 Jun 2025 10:43:30 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: scmi: Fix children encountered before parents case
Message-ID: <aEK4QmtXO_GL5K_0@pluto>
References: <20250604-clk-scmi-children-parent-fix-v1-1-be206954d866@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604-clk-scmi-children-parent-fix-v1-1-be206954d866@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_024346_351941_1A519532 
X-CRM114-Status: GOOD (  20.96  )
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

On Wed, Jun 04, 2025 at 01:00:30PM +0200, Sascha Hauer wrote:
> When it comes to clocks with parents the SCMI clk driver assumes that
> parents are always initialized before their children which might not
> always be the case.
> 

Hi,

> During initialization of the parent_data array we have:
> 
> 	sclk->parent_data[i].hw = hws[sclk->info->parents[i]];
> 
> hws[sclk->info->parents[i]] will not yet be initialized when children
> are encountered before their possible parents. Solve this by allocating
> all struct scmi_clk as an array first and populating all hws[] upfront.
> 

Yes indeed, good catch.
Thanks for this.

Just one minor nitpick down below.

> Fixes: 65a8a3dd3b95f ("clk: scmi: Add support for clock {set,get}_parent")
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/clk/clk-scmi.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> index 15510c2ff21c0335f5cb30677343bd4ef59c0738..f258ad7dda73e3c50c3ce567a8e22b3d2ec9836b 100644
> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c
> @@ -404,6 +404,7 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
>  	const struct scmi_handle *handle = sdev->handle;
>  	struct scmi_protocol_handle *ph;
>  	const struct clk_ops *scmi_clk_ops_db[SCMI_MAX_CLK_OPS] = {};
> +	struct scmi_clk *sclks;
>  
>  	if (!handle)
>  		return -ENODEV;
> @@ -430,18 +431,24 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
>  	transport_is_atomic = handle->is_transport_atomic(handle,
>  							  &atomic_threshold_us);
>  
> +	sclks = devm_kcalloc(dev, count, sizeof(*sclks), GFP_KERNEL);
> +	if (!sclks)
> +		return -ENOMEM;
> +
>  	for (idx = 0; idx < count; idx++) {
> -		struct scmi_clk *sclk;
> -		const struct clk_ops *scmi_ops;
> +		struct scmi_clk *sclk = &sclks[idx];

...do we really need this intermediate local variable in this initializarion loop ?
...doesnt feel like giving more readability (even though the compiler will probably
kill it anyway...)
  
> -		sclk = devm_kzalloc(dev, sizeof(*sclk), GFP_KERNEL);
> -		if (!sclk)
> -			return -ENOMEM;
> +		hws[idx] = &sclk->hw;

....cant we just

  	for (idx = 0; idx < count; idx++)
		hws[idx] = &sclks[idx].hw;


Other than this, LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

