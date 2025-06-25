Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E565C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 17:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+GjW9qPR8w+uhFtLa9Ahy4f43SUG50SJG4xr3KEJ7g=; b=XZBjkziniTUX3oAON2j/RLbJZr
	i3rtVksacJBwAUL6o0kqBKXxO2wVf06Mb15KZ1YQ8rVzlEonSJDjN1HeUiiVstMJOrqaieKCX8J2h
	sToFPv4rZtqGC2lSUFgaLbp/9vgv2G9RX0rNicbilByIvdRy1DAKFNqgIRtGQ5dkAVPXTzT9Mhe4Q
	otbBLqVc0qghydW6di9f9a9B2J4Ri7V0KWFAdQ/AcaCWBlWGoxGhAhFvqJjh6zgB3xanQyKcMpBuM
	TrzF1tLLqdvN539k9oZHjx/wl9QnWq4x1X4+fY8yp5IzjDdxNi/9oCnnwpDZICnWbV2ZSyFzvj6B9
	UV1ybgGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUEL-00000009WHm-11xl;
	Wed, 25 Jun 2025 17:48:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQjP-00000008tlS-0ecl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 14:04:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53FE7106F;
	Wed, 25 Jun 2025 07:03:48 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4E893F66E;
	Wed, 25 Jun 2025 07:04:03 -0700 (PDT)
Date: Wed, 25 Jun 2025 15:04:00 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [RFC PATCH 3/7] firmware: arm_scmi: Add Telemetry protocol
 support
Message-ID: <aFwB0Ok90aoSxPe5@pluto>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250620192813.2463367-4-cristian.marussi@arm.com>
 <0c71e182-9aac-426d-b58b-41f118b9a8f2@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c71e182-9aac-426d-b58b-41f118b9a8f2@suswa.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_070407_268676_89933297 
X-CRM114-Status: GOOD (  17.50  )
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

On Fri, Jun 20, 2025 at 11:46:15PM +0300, Dan Carpenter wrote:
> On Fri, Jun 20, 2025 at 08:28:09PM +0100, Cristian Marussi wrote:
> > +static int
> > +scmi_telemetry_protocol_attributes_get(const struct scmi_protocol_handle *ph,
> > +				       struct telemetry_info *ti)
> > +{

... and also...

> > +	int ret;
> > +	struct scmi_xfer *t;
> > +	struct scmi_msg_resp_telemetry_protocol_attributes *resp;
> > +
> > +	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES,
> > +				      0, sizeof(*resp), &t);
> > +	if (ret)
> > +		return ret;
> > +
> > +	resp = t->rx.buf;
> > +	ret = ph->xops->do_xfer(ph, t);
> > +	if (!ret) {
> > +		__le32 attr = resp->attributes;
> > +
> > +		ti->info.num_de = le32_to_cpu(resp->de_num);
> > +		ti->info.num_groups = le32_to_cpu(resp->groups_num);
> > +		for (int i = 0; i < SCMI_TLM_MAX_DWORD; i++)
> > +			ti->info.de_impl_version[i] =
> > +				le32_to_cpu(resp->de_implementation_rev_dword[i]);
> > +		ti->info.single_read_support = SUPPORTS_SINGLE_READ(attr);
> > +		ti->info.continuos_update_support = SUPPORTS_CONTINUOS_UPDATE(attr);
> > +		ti->info.per_group_config_support = SUPPORTS_PER_GROUP_CONFIG(attr);
> > +		ti->info.reset_support = SUPPORTS_RESET(attr);
> > +		ti->info.fc_support = SUPPORTS_FC(attr);
> > +		ti->num_shmti = le32_get_bits(attr, GENMASK(15, 0));
> > +		/* Allocate DEs descriptors */
> > +		ti->info.des = devm_kcalloc(ph->dev, ti->info.num_de,
> > +					    sizeof(*ti->info.des), GFP_KERNEL);
> > +		if (!ti->info.des)
> > +			ret = -ENOMEM;
> > +
> > +		/* Allocate DE GROUPS descriptors */
> > +		ti->info.des_groups = devm_kcalloc(ph->dev, ti->info.num_groups,
> > +						   sizeof(*ti->info.des_groups),
> > +						   GFP_KERNEL);
> > +		if (!ti->info.des_groups)
> > +			ret = -ENOMEM;
> 
> It the allocation fails we need to jump to the ->xfer_put
> 
> > +
> > +		for (int i = 0; i < ti->info.num_groups; i++)
> > +			ti->info.des_groups[i].id = i;
> 
> otherwise it leads to a NULL dereference.
> 
> > +	}
> > +
> > +	ph->xops->xfer_put(ph, t);
> > +
> > +	return ret;
> > +}
> 
> [ snip ]
> 
> > +static int iter_shmti_process_response(const struct scmi_protocol_handle *ph,
> > +				       const void *response,
> > +				       struct scmi_iterator_state *st,
> > +				       void *priv)
> > +{
> > +	const struct scmi_msg_resp_telemetry_shmti_list *r = response;
> > +	struct telemetry_info *ti = priv;
> > +	struct telemetry_shmti *shmti;
> > +	const struct scmi_shmti_desc *desc;
> > +	void __iomem *addr;
> > +	u64 phys_addr;
> > +	u32 len;
> > +
> > +	desc = &r->desc[st->loop_idx];
> > +	shmti = &ti->shmti[st->desc_index + st->loop_idx];
> > +
> > +	shmti->id = le32_to_cpu(desc->id);
> > +	phys_addr = le32_to_cpu(desc->addr_low);
> > +	phys_addr |= (u64)le32_to_cpu(desc->addr_high) << 32;
> > +
> > +	len = le32_to_cpu(desc->length);
> > +	addr = devm_ioremap(ph->dev, phys_addr, len);
> > +	if (!addr)
> > +		return -EADDRNOTAVAIL;
> > +
> > +	shmti->base = addr;
> > +	shmti->len = len;
> 
> There is some code later which assumes ->len is at least
> TDCF_EPLG_SZ and de->data_sz.  This is probably where we should
> check if (len < TDCF_EPLG_SZ) return -EINVAL; and the de->data_sz
> would be checked later.

I will add proper checks

Thanks,
Cristian

