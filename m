Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB11CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 19:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WT/tzSlwJ0ufeKyR/YF/JgUBMur2cJWvQwtY3Ju4ljA=; b=UK8BNyHw7ENfNXKNXvGgxPItCX
	3haXIZdfeggtPRiEsSIcrRTBYGQLfsF1fXdJshskUdY2FYlbVgwy2gAGAT3Uo6xQFggeqZLslg0pl
	/KAmlVTkUKMx35aDrCDeovp1YVGprAWq0MSmNP9zmkXsSKv1BgtM/KJCIbgn7QNBYEUJ86gWg5k/V
	M5eS7VK7WeOITYxPGWej6lt5o5vo1xXU7b/MTVmpHb5i5sxI/0+qOclSqhEbWLtOcv+n4CY1axr2e
	odhvDmv2f+Zb4e61LV5FB4XAvAGSD480coaEiRIi2j23+sTz8rVJAjF9TdaxNDjR8MqVsoBH8xWSf
	j6Y6rBlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcT66-00000008G3J-1Ika;
	Wed, 24 Jun 2026 19:17:18 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcT63-00000008G2d-2raJ;
	Wed, 24 Jun 2026 19:17:17 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85E47FC7;
	Wed, 24 Jun 2026 21:16:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782328594;
	bh=W+NUk2llCaCs56ZgNCLMgYkpcn4ETSuJ2aIowCznhpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LXERi1N0Du4BVG2CSumtpg3Mo5sQj9/zNmVNSw35udWQOhje5cD7PImBHo3YMh6IY
	 eXJA/ds2kxcGS2c2HKnAzWnBP99d2WPbU4g+fVf09wFEMJbMOtjAN6LiJ5gdZ9Z5mN
	 I+zSOo0fgU79Teg6Z17Oeuw+Jq0sOq5k0f+JPrto=
Date: Wed, 24 Jun 2026 22:17:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@oss.nxp.com
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: Re: [PATCH v2 4/4] media: qcom: camss: use
 fwnode_graph_for_each_endpoint_scoped() to simplify code
Message-ID: <20260624191712.GF851255@killaraus.ideasonboard.com>
References: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
 <20260624-fw_scoped-v2-4-0a8db472af4a@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260624-fw_scoped-v2-4-0a8db472af4a@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_121715_873536_2F2E8A1B 
X-CRM114-Status: GOOD (  18.19  )
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

On Wed, Jun 24, 2026 at 01:00:12PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Use fwnode_graph_for_each_endpoint_scoped() to simplify code.
> 
> No functional changes.
> 
> Reviewed-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> change in v2
> - fix typo simplify
> - collect andy, gouniou and loic's review tags
> ---
>  drivers/media/platform/qcom/camss/camss.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d7..23f3cc30a15a5 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4793,30 +4793,23 @@ static int camss_parse_endpoint_node(struct device *dev,
>  static int camss_parse_ports(struct camss *camss)
>  {
>  	struct device *dev = camss->dev;
> -	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
>  	int ret;
>  
> -	fwnode_graph_for_each_endpoint(fwnode, ep) {
> +	fwnode_graph_for_each_endpoint_scoped(fwnode, ep) {
>  		struct camss_async_subdev *csd;
>  
>  		csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
>  						      typeof(*csd));
> -		if (IS_ERR(csd)) {
> -			ret = PTR_ERR(csd);
> -			goto err_cleanup;
> -		}
> +		if (IS_ERR(csd))
> +			return PTR_ERR(csd);
>  
>  		ret = camss_parse_endpoint_node(dev, ep, csd);
>  		if (ret < 0)
> -			goto err_cleanup;
> +			return ret;
>  	}
>  
>  	return 0;
> -
> -err_cleanup:
> -	fwnode_handle_put(ep);
> -
> -	return ret;
>  }
>  
>  /*

-- 
Regards,

Laurent Pinchart

