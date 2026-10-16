Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA64CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLLh+H6AvF3pOzsah8RxxbzU39nSJ9TcPLlAcIWH0Mg=; b=ktVBDxuShKITdWFPofRMvOGUh/
	pUcLGKe0IbQzi6vpEZNi2UISiWPoss4xTMl2ydQI8SXI1wFq6G3+B7PAmi5hfUbuWsnHVZwx1Q5aw
	I/7Gk/WVsv0s4TvK2mTmHaeVUg73fFi5OYizjzB7JkYdujWlOGki+WEfwNkMoLmXwG0FDC0E4pBRP
	33Inn9oIaqQE57sId+rdGhab4GZXI8c4GLUwg1jRu7jtUwPuSyvYM9Eef7n4/lhqAMDa0RzaBMAbK
	liSFvNtfNKdyzT7dy1BxjZau5I8iJJgqKU8lcyvQiHTsgy8QluIvMkeMVFoWeYtFszntppFywlhC8
	A4daVyow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHf4H-00000002bP1-2MIq;
	Fri, 16 Oct 2026 10:21:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHf4F-00000002bOp-2Jba
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:21:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C71946022B;
	Fri, 16 Oct 2026 10:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F671F000C4;
	Fri, 16 Oct 2026 10:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792146098;
	bh=ZLLh+H6AvF3pOzsah8RxxbzU39nSJ9TcPLlAcIWH0Mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SA5y25c5Ax9XiL89LHF60r7LTjc/isW/mANFnBpopAF7cnYAH68fLLHwbl1/OVtkd
	 nurZ8/hyMKyst8EuUgHLk1ctDT2FNTC1X1UwhqJee9Yz7/+6gLU3Ase+3LoxnKUtbU
	 D2+c9LWzP3DuNy8b4SQsWU12QwdVokU7l7zIifnGyYQZEguEO5b6WLau/Vee49QXmf
	 PKdqLRCbvFFrR7FCt9HPFQdkxEdm9gPG9sc5H2zD5z9TOHutnFDhAHCKHV8raPJMmS
	 GavfobPpuZyGynW0TZKRfAUSXMjrSgQoUM4wcU1xv3vSQs5E4MmFvIxvUP+TuyFKKq
	 hHnVrmV03MAzw==
Date: Fri, 16 Oct 2026 11:21:34 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-pm@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	quic_sibis@quicinc.com, dan.carpenter@linaro.org, d-gole@ti.com,
	souvik.chakravarty@arm.com
Subject: Re: [PATCH v9 12/13] powercap: arm_scmi: Add get_power_uw to
 synthetic node
Message-ID: <20261016-nostalgic-adaptable-crab-4eea62@sudeepholla>
References: <20260909220437.1254412-1-philip.radford@arm.com>
 <20260909220437.1254412-13-philip.radford@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909220437.1254412-13-philip.radford@arm.com>
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

On Wed, Sep 09, 2026 at 10:04:36PM +0000, Philip Radford wrote:
> Exposes the current power usage from the immediate children of the
> synthetic (root) powercap node. Iterates over pr->spzones and sums per-zone
> power.
> 
> Signed-off-by: Philip Radford <philip.radford@arm.com>
> ---
> V8->V9
> - Removed redundant if (!pr) check from instance_root_get_power_uw()
> - Stopped returning a partial sum if one child read fails
> ---
>  drivers/powercap/arm_scmi_powercap.c | 34 ++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
> index b5397d7675e6..aac0b00490b2 100644
> --- a/drivers/powercap/arm_scmi_powercap.c
> +++ b/drivers/powercap/arm_scmi_powercap.c
> @@ -17,6 +17,9 @@
>  #define to_scmi_powercap_zone(z)		\
>  	container_of(z, struct scmi_powercap_zone, zone)
>  
> +#define to_scmi_powercap_root(z)		\
> +	container_of(z, struct scmi_powercap_root, instance_root.zone)
> +
>  static const struct scmi_powercap_proto_ops *powercap_ops;
>  
>  struct scmi_powercap_zone {
> @@ -453,9 +456,36 @@ static int instance_root_release(struct powercap_zone *pz)
>  	return 0;
>  }
>  
> -static int instance_root_get_power_uw(struct powercap_zone *pz, u64 *v)
> +static int instance_root_get_power_uw(struct powercap_zone *pz, u64 *power_uw)
>  {
> -	*v = 0;
> +	struct scmi_powercap_root *pr = to_scmi_powercap_root(pz);
> +	struct scmi_powercap_zone *child;
> +
> +	u64 p, acc = 0;
> +	int i, ret;
> +
> +	if (!pz || !power_uw)
> +		return -EINVAL;
> +
> +	for (i = 0; i < pr->num_zones; i++) {
> +		child = &pr->spzones[i];
> +
> +		if (!child->registered || child->invalid)
> +			continue;
> +
> +		if (child->info->parent_id != SCMI_POWERCAP_ROOT_ZONE_ID)
> +			continue;
> +
> +		ret = scmi_powercap_get_power_uw(&child->zone, &p);

Should we skip domains without monitoring here as scmi_powercap_get_power_uw()
return -EINVAL for such domains always ? If the system has one such node, you
will always return error here ?

-- 
Regards,
Sudeep

