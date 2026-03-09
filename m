Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DB0EFCD72
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0/jxou5Z/2zFSjfwQLQTsJh2V5dQtxGaZy3PbdIvjU=; b=o+nVhf6fj3mILF3YhNzA7bCHJO
	s1LlPFN0RBkkXB2ox22K3+u0pB6+bURoP7bx7tVu1tE0EnT0o9Qm6BFctwx5YEQw76g4mFY+ZFprl
	lbnCGc0h/gVB7/uGX4YocQOhZ1lgxT5vni72p+vYtbJ4yhoUzdVt6JD3QWvdqfYbB1LTmSsMkDuvf
	+85IWNHk82kOz/c4/a7xLsECwJEEj9WyhbdpI1ao4xFO0GMdX47MryfFpt7jbJbqiqNaUoW6QW6uF
	ShpfSXOfSqbOCcTvbbK22XfL8Gl4mRAA1zzI3lXMULJXrHRpPYa8BrVMACIdu4Mqbumh0NkPUsZaN
	JC4mqTnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzX9D-000000070YG-2VtG;
	Mon, 09 Mar 2026 09:43:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzX9B-000000070XW-07MJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 09:43:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 31A2D4182B;
	Mon,  9 Mar 2026 09:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA2AC4CEF7;
	Mon,  9 Mar 2026 09:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773049412;
	bh=2lGo3t1RntZTSXyLwgxBc8rDVEWOtf0wRiWH5p0NqEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pi6uSJTdeVJsjuruAOk6ckUNvZwU3AXUYiYYYsSIhq6opeYHnuE4gmuquMR0cztRC
	 nqRC6Nc4GX3YqCXsk4+LDu5O8cSqWyxa5w0fGkan6fcfvpN1m7+rozTfLyZQo7p1TK
	 kiB+oUtdGmqD2+jeRMBSCA7fAcdsTDGaLUPSvjbTJk0AT3ZMpGngJXhNICQJhEK78h
	 GfvXcXwopHYTxuIJWxDjnWeuZOjYGAlJ1C7Kix6np6FgK1kYHs5PKlDvQH/XKv6lXY
	 ypyFQ/amMNOemvj5SRkTKHLdIQf53sPwLCdI1PupnY/u/abcZ2olOEWqkzv00NtF06
	 brit18q6B1LkA==
Date: Mon, 9 Mar 2026 09:43:27 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org,
	linux-pm@vger.kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	quic_sibis@quicinc.com, dan.carpenter@linaro.org, d-gole@ti.com,
	souvik.chakravarty@arm.com, cristian.marussi@arm.com
Subject: Re: [PATCH v2 5/9] firmware: arm_scmi: Add SCMIv4.0 Powercap FCs
 support
Message-ID: <20260309-jade-salmon-of-education-7c901c@sudeepholla>
References: <20260204111950.3648160-1-philip.radford@arm.com>
 <20260204111950.3648160-6-philip.radford@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204111950.3648160-6-philip.radford@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_024333_118773_B0F3DB6B 
X-CRM114-Status: GOOD (  20.33  )
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

On Wed, Feb 04, 2026 at 11:19:46AM +0000, Philip Radford wrote:
> From: Cristian Marussi <cristian.marussi@arm.com>
> 
> Add support for new SCMIv4.0 Powercap Fastchannels.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> [Philip: removed reference to old versioning logic]
> Signed-off-by: Philip Radford <philip.radford@arm.com>
> ---
> V1->V2
> - Removed creation of pi powercap_info struct due to legacy code
>   change
> ---
>  drivers/firmware/arm_scmi/powercap.c | 323 ++++++++++++++++++---------
>  1 file changed, 221 insertions(+), 102 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
> index 3291bde78367..22bf8e480450 100644
> --- a/drivers/firmware/arm_scmi/powercap.c
> +++ b/drivers/firmware/arm_scmi/powercap.c
>  

[...]

> @@ -1019,37 +1092,77 @@ static const struct scmi_powercap_proto_ops powercap_proto_ops = {
>  };
>  
>  static void scmi_powercap_domain_init_fc(const struct scmi_protocol_handle *ph,
> -					 u32 domain, struct scmi_fc_info **p_fc)
> +					 struct scmi_powercap_info *dom_info)
>  {
> -	struct scmi_fc_info *fc;
> -
> -	fc = devm_kcalloc(ph->dev, POWERCAP_FC_MAX, sizeof(*fc), GFP_KERNEL);
> -	if (!fc)
> -		return;
> -
> -	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
> -				   POWERCAP_CAP_SET, 4, domain, NULL,
> -				   &fc[POWERCAP_FC_CAP].set_addr,
> -				   &fc[POWERCAP_FC_CAP].set_db,
> -				   &fc[POWERCAP_FC_CAP].rate_limit);
> -
> -	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
> -				   POWERCAP_CAP_GET, 4, domain, NULL,
> -				   &fc[POWERCAP_FC_CAP].get_addr, NULL,
> -				   &fc[POWERCAP_FC_CAP].rate_limit);
> -
> -	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
> -				   POWERCAP_PAI_SET, 4, domain, NULL,
> -				   &fc[POWERCAP_FC_PAI].set_addr,
> -				   &fc[POWERCAP_FC_PAI].set_db,
> -				   &fc[POWERCAP_FC_PAI].rate_limit);
> -
> -	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
> -				   POWERCAP_PAI_GET, 4, domain, NULL,
> -				   &fc[POWERCAP_FC_PAI].get_addr, NULL,
> -				   &fc[POWERCAP_FC_PAI].rate_limit);
> -
> -	*p_fc = fc;
> +	for (int id = 0; id < dom_info->num_cpli; id++) {
> +		struct scmi_fc_info *fc;
> +		u32 *cpl_id, zero_cpl_id = 0;
> +
> +		fc = devm_kcalloc(ph->dev, POWERCAP_FC_MAX, sizeof(*fc), GFP_KERNEL);
> +		if (!fc)
> +			return;
> +
> +		/* NOTE THAT when num_cpli == 1 the arg *cpl_id is 0 */
> +		cpl_id = (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) ? &id : NULL;
> +
> +		ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
> +					   POWERCAP_CAP_SET, 4, dom_info->id,
> +					   cpl_id,
> +					   &fc[POWERCAP_FC_CAP].set_addr,
> +					   &fc[POWERCAP_FC_CAP].set_db,
> +					   &fc[POWERCAP_FC_CAP].rate_limit);
> +
> +		ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
> +					   POWERCAP_CAP_GET, 4, dom_info->id,
> +					   cpl_id,
> +					   &fc[POWERCAP_FC_CAP].get_addr, NULL,
> +					   &fc[POWERCAP_FC_CAP].rate_limit);
> +
> +		if (PROTOCOL_REV_MAJOR(ph->version) < 0x3) {
> +			ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
> +						   POWERCAP_PAI_SET, 4,
> +						   dom_info->id, NULL,
> +						   &fc[POWERCAP_FC_XAI].set_addr,
> +						   &fc[POWERCAP_FC_XAI].set_db,
> +						   &fc[POWERCAP_FC_XAI].rate_limit);
> +
> +			ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
> +						   POWERCAP_PAI_GET, 4,
> +						   dom_info->id, NULL,
> +						   &fc[POWERCAP_FC_XAI].get_addr, NULL,
> +						   &fc[POWERCAP_FC_XAI].rate_limit);
> +		} else {
> +			ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
> +						   POWERCAP_CAI_SET, 4,
> +						   dom_info->id, &id,
> +						   &fc[POWERCAP_FC_XAI].set_addr,
> +						   &fc[POWERCAP_FC_XAI].set_db,
> +						   &fc[POWERCAP_FC_XAI].rate_limit);
> +			ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
> +						   POWERCAP_CAI_GET, 4,
> +						   dom_info->id, &id,
> +						   &fc[POWERCAP_FC_XAI].get_addr, NULL,
> +						   &fc[POWERCAP_FC_XAI].rate_limit);

Can the above "&id" changed to cpl_id like the first 2 instance for consistency
unless I am reading it wrong.

> +			ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
> +						   POWERCAP_MAI_SET, 4,
> +						   dom_info->id, &zero_cpl_id,
> +						   &fc[POWERCAP_FC_MAI].set_addr,
> +						   &fc[POWERCAP_FC_MAI].set_db,
> +						   &fc[POWERCAP_FC_MAI].rate_limit);
> +			ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
> +						   POWERCAP_MAI_GET, 4,
> +						   dom_info->id, &zero_cpl_id,
> +						   &fc[POWERCAP_FC_MAI].get_addr, NULL,
> +						   &fc[POWERCAP_FC_MAI].rate_limit);
> +			ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
> +						   POWERCAP_MEASUREMENTS_GET, 4,
> +						   dom_info->id, &zero_cpl_id,
> +						   &fc[POWERCAP_FC_MEASUREMENT].get_addr, NULL,
> +						   &fc[POWERCAP_FC_MEASUREMENT].rate_limit);

Also why should the above 3 as well as the NULL cpl_id calls be inside this
loop ?

-- 
Regards,
Sudeep

