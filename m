Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE008FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 22:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuZXA9Qcsz79IE1YefGF3fDxiWY5XB/9Ov4Ot65mumA=; b=D6NRprhk4KbXMEYX+d5JLLrlt8
	zAQ5fLqilMcjd3VLoOnxyMrrnL3xxejhTW1LzJCVraulNCPtVhGTrwm27pH+qqlD8R4cM9oKo52X4
	YjtaZ+DOlIEcMOmnyRTrfebbzS0k3hg2s9+D9aJ7gZLyVb56+85ykiYLKjN4Lc9Z4JohhsffCU0ZR
	aYsWitrhvoRiXtrfQib9Q0OdMXWPGQ7JUXy9kV4IJcsqtx+0jHinL3ibgMq+KgY1BSNn5dfBTu9BZ
	uxGnaHrUwHSEolGgs3hdymHTj2b2SDxYUo3sh5432QuynA9jldJlULrZJEi4Yx8BQnMAUr1qwpuze
	VOtLsOdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKO1Z-000000001yZ-1J6g;
	Tue, 05 May 2026 22:13:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKO1X-000000001xv-1RPq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 22:13:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDE011A9A;
	Tue,  5 May 2026 15:13:43 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9AF53F763;
	Tue,  5 May 2026 15:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778019229; bh=JXBOIDwb6e1s8ZmaUYlylleYRr14801abN82WNXhBdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jkH6N7qm7iFUSnanVg4zc3SjNFJmR3DX6GnHivCcMFaj7oPAEQj3WH/yjmZ2bmsJu
	 glE6HX01WYbGrfcx9MQXTfI6OffegBZ1vX5OlSz19lkvgSAkROqw7KKgleZel35yCA
	 Vi8R92y5+9+CQk4rqYOYsk2/tUPMPGgDl5gKTO+g=
Date: Tue, 5 May 2026 23:13:44 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-pm@vger.kernel.org,
	sudeep.holla@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	quic_sibis@quicinc.com, dan.carpenter@linaro.org, d-gole@ti.com,
	souvik.chakravarty@arm.com, cristian.marussi@arm.com
Subject: Re: [PATCH v5 11/12] powercap: arm_scmi: Add get_power_uw to
 synthetic node
Message-ID: <afprmEnMf5mNf8NE@pluto>
References: <20260428090922.346069-1-philip.radford@arm.com>
 <20260428090922.346069-12-philip.radford@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428090922.346069-12-philip.radford@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_151351_431397_E31BBCD9 
X-CRM114-Status: GOOD (  19.48  )
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

On Tue, Apr 28, 2026 at 10:09:20AM +0100, Philip Radford wrote:
> Exposes the current power usage from the immediate children of
> the synthetic (root) powercap node. Iterates over pr->spzones and
> sums per-zone power.
> 
> Signed-off-by: Philip Radford <philip.radford@arm.com>
> ---
>  drivers/powercap/arm_scmi_powercap.c | 29 ++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
> index d74869af1633..81b5214acda4 100644
> --- a/drivers/powercap/arm_scmi_powercap.c
> +++ b/drivers/powercap/arm_scmi_powercap.c
> @@ -270,9 +270,34 @@ static int instance_root_release(struct powercap_zone *pz)
>  	return 0;
>  }
>  
> -static int instance_root_get_power_uw(struct powercap_zone *pz, u64 *v)
> +static int instance_root_get_power_uw(struct powercap_zone *pz, u64 *power_uw)
>  {
> -	*v = 0;
> +	struct scmi_powercap_zone *root = to_scmi_powercap_zone(pz);
> +	struct scmi_powercap_zone *child;
> +	struct scmi_powercap_root *pr;
> +	u64 acc = 0;
> +	u64 p;

These u64 can live on a single line...

> +	int ret;
> +
> +	if (!pz || !power_uw)
> +		return -EINVAL;
> +
> +	pr = container_of(root, struct scmi_powercap_root, instance_root);

usually we define macros to wrap this like to_scmi_powercap_zone()...
...even if used only once...this could be a new to_scmi_powercap_root()

> +	if (!pr)
> +		return -ENODEV;
> +
> +	list_for_each_entry(child, &pr->registered_zones[0], node) {
> +		if (child == &pr->instance_root)
> +			continue;

You'll need to check this in light of the fixes of previous patch

> +
> +		ret = scmi_powercap_get_power_uw(&child->zone, &p);
> +		if (!ret)
> +			acc += p;
> +		else
> +			dev_dbg(child->dev, "Failed to read child power: %u\n", ret);
> +	}
> +
> +	*power_uw = acc;
>  	return 0;
>  }
>  

Thanks,
Cristian

