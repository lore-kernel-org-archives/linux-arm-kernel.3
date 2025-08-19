Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2FBCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jLmAlHO8RvKDyfag53f6oFI4B7KA6ra4YkfvyIM4ToY=; b=l1rsvudqvwg+/rKcremdQ83J61
	Tpl+ZKJ11C6fOVH4tncavUARUYXRVdMg91S8GUtYkh0rykoHyv79Fb2j7CGvx/0I1At/hIf524bQK
	PyEP3mg4+cpOMq0RIf2xqrgNWBoeT2ZHpho6WXyAz7vRXM/OgEM3v9AZnbKB8/MslQRvaCBjMJ43L
	SFLEndN26EP5K30Pgyz7ohbFPEl9qj/X3ZFpiv70aDkMbwqkOf0yxku0QsPVxwn9dfMm93ULrWjpg
	oBMf55mUwBolUn1Ux9CyxFTbmIQ1QVrE8lwOzrkEdXJl8YYc8GP/eYXbjtT3s/Z2lA9C9ib8ZD4QG
	qw2cuc0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoR5A-0000000BIkM-0Bvg;
	Tue, 19 Aug 2025 18:29:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoOil-0000000Ax0O-0vlw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 15:58:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6B55152B;
	Tue, 19 Aug 2025 08:57:44 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B14D53F63F;
	Tue, 19 Aug 2025 08:57:51 -0700 (PDT)
Date: Tue, 19 Aug 2025 16:57:49 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] firmware: arm_scmi: imx: Support discovering
 buildinfo of MISC protocol
Message-ID: <aKSe_dpuQ35eZaVs@pluto>
References: <20250710-sm-misc-api-v1-v2-0-c3e953e34be6@nxp.com>
 <20250710-sm-misc-api-v1-v2-2-c3e953e34be6@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-sm-misc-api-v1-v2-2-c3e953e34be6@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_085759_300733_541435B9 
X-CRM114-Status: GOOD (  18.33  )
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

On Thu, Jul 10, 2025 at 04:33:27PM +0800, Peng Fan wrote:
> MISC protocol supports discovering the System Manager(SM) build
> information including build commit, build time and etc. Retrieve the
> information from SM.

Hi,

> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> index a8915d3b4df518719d56bfff38922625ad9b70f6..b301f09ab6cc65d286edb8819031d7f4c02e8272 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> @@ -25,6 +25,7 @@
>  enum scmi_imx_misc_protocol_cmd {
>  	SCMI_IMX_MISC_CTRL_SET	= 0x3,
>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
> +	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
>  	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
>  };
>  
> @@ -65,6 +66,15 @@ struct scmi_imx_misc_ctrl_get_out {
>  	__le32 val[];
>  };
>  
> +struct scmi_imx_misc_buildinfo_out {
> +	__le32 buildnum;
> +	__le32 buildcommit;
> +#define MISC_MAX_BUILDDATE	16
> +	u8 builddate[MISC_MAX_BUILDDATE];
> +#define MISC_MAX_BUILDTIME	16
> +	u8 buildtime[MISC_MAX_BUILDTIME];
> +};
> +
>  static int scmi_imx_misc_attributes_get(const struct scmi_protocol_handle *ph,
>  					struct scmi_imx_misc_info *mi)
>  {
> @@ -272,6 +282,34 @@ static int scmi_imx_misc_ctrl_set(const struct scmi_protocol_handle *ph,
>  	return ret;
>  }
>  
> +static int scmi_imx_misc_discover_build_info(const struct scmi_protocol_handle *ph)
> +{
> +	struct scmi_imx_misc_buildinfo_out *out;
> +	char date[MISC_MAX_BUILDDATE] = {'\0'};
> +	char time[MISC_MAX_BUILDTIME] = {'\0'};

...dont think that these 2 array needs to be NULL terminated given that
they are used as the dest buffer for strscpy() which always terminates
the dest buffer returning always a valid string.


> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_DISCOVER_BUILDINFO, 0,
> +				      sizeof(*out), &t);
> +	if (ret)
> +		return ret;
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		out = t->rx.buf;
> +		strscpy(date, out->builddate, MISC_MAX_BUILDDATE);
> +		strscpy(time, out->buildtime, MISC_MAX_BUILDTIME);
> +		dev_info(ph->dev, "SM Version\t= Build %u, Commit %08x %s %s\n",
> +			le32_to_cpu(out->buildnum), le32_to_cpu(out->buildcommit),
> +			date, time);
> +	}
> +

...other than this...LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

