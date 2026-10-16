Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF676CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WyVgdQOJ2lLJ0wl//yOKImwK8hAJpf48U17WojJT4FU=; b=Rz0JFD17wQzt72fuS6Cc4+dR1X
	dlu13/cJxQ69qqvpBIfsibfJeXZPVENcXoTtlJuyCJWuYJm51PZqRJwFfvZXLn/e6TggEd3BmyDaj
	8w1GEZsx/HrkX6KBn0d7GcIho1SDBwdaRtDNO7rekAh46vRXRKXe6Bb8o4JiN2U1gyPvowsh/InFE
	v4GWgxMyLFlNirRUnwPVeNdilq4l7Ii69a2A8azZ5sKZkbGpVATasd8nwqD1JRRvgiC2AFQF7QBPd
	wmfYP/cADXg6QhCbzJGLyQTchO+zy1XhV9cR6thArjIMo0JGHAXIhiy77PByHwlIDOsiEqw30mHok
	qTDU6Bow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHewM-00000002a40-37XX;
	Fri, 16 Oct 2026 10:13:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHewL-00000002a3e-1Yzf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:13:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 625476022B;
	Fri, 16 Oct 2026 10:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE061F000C4;
	Fri, 16 Oct 2026 10:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792145607;
	bh=WyVgdQOJ2lLJ0wl//yOKImwK8hAJpf48U17WojJT4FU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MHfbgzlUIZRJdPWIE0no3IgTioOtANvbTrN96zf1hnfZNjewVLMpiT2SGNze7NNxb
	 p4MphMQmmT1pBOQKJrhfmwDL5MpVE0/fmHeUTfXXp1VvrwyWoDKXBF5/uw02dBnDUo
	 8/CF4tYHbvQ367xcSrBdSgnEgRMv+lMfBbhDAk976/x5JCVLhkeV9Tt7LXQ9l2tYsY
	 5+4OuMqsQ5QbEDOhW+O6tYGQiBrBWkmJggXEulgYHSz+ui0XQNVW0/jJtmrs01CUjO
	 WFhuMvak/6KMPYsH6waYO23tMb5Vtx74F56BzklZBf2n9AGQUsu8c4FwmRrgwQ/nEc
	 qXIbidDQLhUgQ==
Date: Fri, 16 Oct 2026 11:13:22 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org,
	linux-pm@vger.kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	quic_sibis@quicinc.com, dan.carpenter@linaro.org, d-gole@ti.com,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH v9 05/13] firmware: arm_scmi: Add SCMIv4.0 Powercap FCs
 support
Message-ID: <20261016-admirable-modern-bandicoot-d7cc15@sudeepholla>
References: <20260909220437.1254412-1-philip.radford@arm.com>
 <20260909220437.1254412-6-philip.radford@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909220437.1254412-6-philip.radford@arm.com>
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

On Wed, Sep 09, 2026 at 10:04:29PM +0000, Philip Radford wrote:
> From: Cristian Marussi <cristian.marussi@arm.com>
> 
> Add support for new SCMIv4.0 Powercap Fastchannels.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> [Philip: removed reference to old versioning logic]
> Signed-off-by: Philip Radford <philip.radford@arm.com>
> ---
>  drivers/firmware/arm_scmi/powercap.c | 331 ++++++++++++++++++---------
>  1 file changed, 229 insertions(+), 102 deletions(-)
> 

[...]

> +static int
> +scmi_powercap_xfer_avg_interval_get_v3(const struct scmi_protocol_handle *ph,
> +				       u32 domain_id, u32 cpl_id, u32 *ivl)
> +{
> +	int ret;
> +	struct scmi_xfer *t;
> +	struct scmi_msg_powercap_cap_or_cai_get_v3 *msg;
> +
> +	ret = ph->xops->xfer_get_init(ph, POWERCAP_CAI_GET, sizeof(*msg),
> +				      sizeof(u32), &t);
> +	if (ret)
> +		return ret;
> +
> +	msg = t->tx.buf;
> +	msg->domain_id = cpu_to_le32(domain_id);
> +	msg->cpli = cpu_to_le32(cpl_id);

Is this inconsistent with scmi_powercap_xfer_cap_{g,s}et_v3() which IMO
correctly uses pc->cpli[cpl_id].id instead of cpl_id or am I just confusing
the flow ? The spec is clear that it must be concurrent power limit identifier.


[...]

> +static int
> +scmi_powercap_xfer_avg_interval_set_v3(const struct scmi_protocol_handle *ph,
> +				       u32 domain_id, u32 cpl_id, u32 ivl)
>  {
>  	int ret;
>  	struct scmi_xfer *t;
> -	struct scmi_msg_powercap_set_cap_or_pai *msg;
> +	struct scmi_msg_powercap_cai_set *msg;
>  
> -	ret = ph->xops->xfer_get_init(ph, POWERCAP_PAI_SET,
> -				      sizeof(*msg), 0, &t);
> +	ret = ph->xops->xfer_get_init(ph, POWERCAP_CAI_SET, sizeof(*msg), 0, &t);
>  	if (ret)
>  		return ret;
>  
>  	msg = t->tx.buf;
>  	msg->domain_id = cpu_to_le32(domain_id);
>  	msg->flags = cpu_to_le32(0);
> -	msg->value = cpu_to_le32(pai);
> +	msg->cai = cpu_to_le32(ivl);
> +	msg->cpli = cpu_to_le32(cpl_id);

Ditto here.

-- 
Regards,
Sudeep

