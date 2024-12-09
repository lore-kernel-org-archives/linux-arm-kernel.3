Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974EFE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 15:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EpHHY2+sWOsUk3TlBUgacwmRiiegsqRts2YKRJr/mi8=; b=mhnzA6u5Xv+FwKLTmEGlGkwcfY
	Hn7/uMKnJXfM8fq402zCFNiyCmZjal4cZDuSh3j5UUzRxCpFJmmX/9jsaG65/StGynJdakHRN0nhf
	de9Fpzmps9gZvz9LyY19+8p6CkMVWiNOZaVBBN2b8l/XUfkloL+DvNnbBjjY1AjA0WkrC2KkUDfan
	q88kxejmJdI8MaKywGOcYxnxeigTDY68+t99lhNhZ038ZG1P3F1yWTk4m9LiIn0aPQT/UdrU9cULY
	r3foTefBtMErzHMFQM7UPQVeIuzSsYTako1q9qkrgEDR0YTbFhsgfrxiIH6cawZpfoOfhSh1A5unE
	GkXCKkog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKfww-00000008QYL-28EV;
	Mon, 09 Dec 2024 15:45:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKfvt-00000008QSd-47gL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 15:44:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9F805A41752;
	Mon,  9 Dec 2024 15:42:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5722DC4CED1;
	Mon,  9 Dec 2024 15:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733759064;
	bh=R8gakXjOFzr18Msjlv7x86OREF32D5o5FO2PwvyoUBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bjrC4V0qC4WIBxl6N0Y3m5rcxQsl1BfIrhsvpBgBWFlMQXQBu+bfgXOa+u+oASu5N
	 qG31jsynbRm21VBvEMV/iR187vUF2xTQQ49CEjm1yI7WOsIQV/pdzcXUN0c6x+q6+y
	 15rusoyBzN6eGgB1axdDnADEaUeQYM5CCbEkCr/eZtXo98KyZiB53L9TLRwidSOMIh
	 XDEelyShmDLRX5ZALy2M+mThSJ9j/fyZaJVpTwbZkf5Wb8PbnlnL68XbeKU6KnRi3K
	 +y+oxX6YHNWXbpbHiLJisqI9aMhE2gxsK/N33DiN17/+tjoQ2Uk7YEWqXVLhg1y4y/
	 ixOfuhHnbA2Og==
Date: Mon, 9 Dec 2024 15:44:20 +0000
From: Will Deacon <will@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank.li@nxp.com, mark.rutland@arm.com, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] perf: imx9_perf: Introduce AXI filter version to
 refactor the driver and better extension
Message-ID: <20241209154419.GB12428@willie-the-truck>
References: <20241125104338.2433339-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125104338.2433339-1-xu.yang_2@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_074426_146656_9E01B336 
X-CRM114-Status: GOOD (  28.85  )
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

On Mon, Nov 25, 2024 at 06:43:38PM +0800, Xu Yang wrote:
> The imx93 is the first supported DDR PMU that supports read transaction,
> write transaction and read beats events which corresponding respecitively
> to counter 2, 3 and 4.
> 
> However, transaction-based AXI match has low accuracy when get total bits
> compared to beats-based. And imx93 doesn't assign AXI_ID to each master.
> So axi filter is not used widely on imx93. This could be regards as AXI
> filter version 1.
> 
> To improve the AXI filter capability, imx95 supports 1 read beats and 3
> write beats event which corresponding respecitively to counter 2-5. imx95
> also detailed AXI_ID allocation so that most of the master could be count
> individually. This could be regards as AXI filter version 2.
> 
> This will introduce AXI filter version to refactor the driver and support
> better extension, such as coming imx943.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - modify subject
>  - add comments for AXI_FILTER version
>  - type -> filter_ver
> ---
>  drivers/perf/fsl_imx9_ddr_perf.c | 33 ++++++++++++++++++++++++--------
>  1 file changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/perf/fsl_imx9_ddr_perf.c b/drivers/perf/fsl_imx9_ddr_perf.c
> index 3c856d9a4e97..e2c2c674b6d2 100644
> --- a/drivers/perf/fsl_imx9_ddr_perf.c
> +++ b/drivers/perf/fsl_imx9_ddr_perf.c
> @@ -63,8 +63,21 @@
>  
>  static DEFINE_IDA(ddr_ida);
>  
> +/*
> + * V1 support 1 read transaction, 1 write transaction and 1 read beats
> + * event which corresponding respecitively to counter 2, 3 and 4.
> + */
> +#define DDR_PERF_AXI_FILTER_V1		0x1
> +
> +/*
> + * V2 support 1 read beats and 3 write beats events which corresponding
> + * respecitively to counter 2-5.
> + */
> +#define DDR_PERF_AXI_FILTER_V2		0x2
> +
>  struct imx_ddr_devtype_data {
>  	const char *identifier;		/* system PMU identifier for userspace */
> +	unsigned int filter_ver;	/* AXI filter version */
>  };
>  
>  struct ddr_pmu {
> @@ -83,24 +96,27 @@ struct ddr_pmu {
>  
>  static const struct imx_ddr_devtype_data imx91_devtype_data = {
>  	.identifier = "imx91",
> +	.filter_ver = DDR_PERF_AXI_FILTER_V1
>  };

[...]

> -static inline bool is_imx93(struct ddr_pmu *pmu)
> +static inline bool axi_filter_v1(struct ddr_pmu *pmu)
>  {
> -	return pmu->devtype_data == &imx93_devtype_data;
> +	return pmu->devtype_data->filter_ver == DDR_PERF_AXI_FILTER_V1;
>  }

[...]

> @@ -624,11 +641,11 @@ static int ddr_perf_event_add(struct perf_event *event, int flags)
>  	hwc->idx = counter;
>  	hwc->state |= PERF_HES_STOPPED;
>  
> -	if (is_imx93(pmu))
> +	if (axi_filter_v1(pmu))
>  		/* read trans, write trans, read beat */
>  		imx93_ddr_perf_monitor_config(pmu, event_id, counter, cfg1, cfg2);

Hmm, doesn't this change mean we now enable this for imx91 as well? My
reading of the commit message is that imx93 was the first chip which
supports this.

Will

