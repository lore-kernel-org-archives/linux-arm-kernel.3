Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CC3606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 18:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1ZyQ+NIh;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fUlvmVNh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+t9x54f1qNZZiubPPPnaR5/Crj4REu5MeZTCDboVOlA=; b=1ZyQ+NIhTJoYiBjThCxPKyWHil
	d0sntdXOzjs1FxW0ZZtHX7v+DNX7RqPOWHtQpCgNo8G/5vgQY9YOZHywf7Q/v8QA3B+J0anR/EExP
	0Mb/nBOuNoNtpeP5SLLxSVhEF1XFRgo+v7gBKnwvvUKM2YywSolP0HuwzVWQrR55xEtFlE6QYi679
	6yu5yqZLZp5AC78GIV9PIi3kJb4/CZVwbhK5ZWY3fKB4vQCrtkBpDJF5jncKmCCZgWV1tSoPEVdbr
	tL7TR0pipsED3qc8ldP6Ywn9cZ7OowhJCc3AnGstk+kwLDAVMkKXzacRSIgz+wlJr29LcyVJR4tf3
	HY4AMc6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2Ux-0000000AC1k-3gr7;
	Thu, 05 Nov 2026 18:47:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2Uj-0000000ABx9-1IFi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:47:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE9A6168F;
	Thu,  5 Nov 2026 10:47:24 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E685D3F632;
	Thu,  5 Nov 2026 10:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793904447; bh=1i7yxbYF9bXMotNb+bc0f+0AFmxxA4a+FAdhjGiafzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUlvmVNhpgAIEPYzj5Q45phP2LBSIFMetTaOb/ZvXk0FE3u72ct8xjXhIPLoEOptW
	 oM/0jO/P/82GdYj3utvssDmfegm4d+TpDNBONF14hnpaF3WAiHiX5VMsvJrF/49Yqo
	 QDZ6T2Cm78vXmsEWA8b3nxqoD2qTUMgr+orbahV8=
Date: Thu, 5 Nov 2026 18:47:21 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
	philip.radford@arm.com, david@kernel.org,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v14 07/32] firmware: arm_scmi: Add Telemetry basic
 attributes enumeration
Message-ID: <auzPOVaUqnyfAYjF@pluto>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
 <20261016185553.2794459-8-cristian.marussi@arm.com>
 <20261019142719.00003b78@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019142719.00003b78@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_104730_940993_486F895B 
X-CRM114-Status: GOOD (  32.08  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 02:27:19PM -0700, Jonathan Cameron wrote:
> On Fri, 16 Oct 2026 19:55:28 +0100
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add SCMIv4.0 Telemetry basic support for minimal initialization and
> > protocol attributes enumeration: expose telemetry instance descriptor
> > via a simple information retrieval protocol operation.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> A few minor comments but nothing I care strongly about.
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> 
> >  #endif /* _SCMI_PROTOCOLS_H */
> > diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> > new file mode 100644
> > index 000000000000..32f6f8d1106d
> > --- /dev/null
> > +++ b/drivers/firmware/arm_scmi/telemetry.c
> > @@ -0,0 +1,148 @@
> 
> > +
> > +enum scmi_telemetry_protocol_cmd {
> 
> Perhaps add a comment on enum scmi_common_cmd containing additional values
> that apply to telemetry.

I'll do.

> 
> > +	TELEMETRY_LIST_SHMTI = 0x3,
> 
> > +
> > +struct telemetry_info {
> > +	bool streaming_mode;
> 
> I'd bring fields of internal tracking structures in only when
> they are used (even if that is just setting them).
> 

I agree....but it has become a bit overwhelming to split this series
while taking care to introduce stuff only at the very last point in time
when it is used...I will try to improve anyway

> > +	unsigned int num_shmti;
> > +	unsigned int num_des_tstamp;
> > +	unsigned int default_blk_ts_rate;
> > +	const struct scmi_protocol_handle *ph;
> > +	struct scmi_telemetry_info info;
> > +};
> > +
> > +static int
> > +scmi_telemetry_protocol_attributes_get(struct telemetry_info *ti)
> > +{
> > +	struct scmi_msg_resp_telemetry_protocol_attributes *resp;
> > +	const struct scmi_protocol_handle *ph = ti->ph;
> > +	struct scmi_xfer *t;
> > +	int ret;
> > +
> > +	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
> > +				      sizeof(*resp), &t);
> > +	if (ret)
> > +		return ret;
> > +
> > +	resp = t->rx.buf;
> > +	ret = ph->xops->do_xfer(ph, t);
> > +	if (!ret) {
> > +		__le32 attr = resp->attributes_1;
> > +		__be32 de_impl_version[SCMI_TLM_DE_IMPL_NUM_DWORDS];
> > +
> 
> > +		for (int i = 0; i < SCMI_TLM_DE_IMPL_NUM_DWORDS; i++)
> > +			de_impl_version[i] =
> > +				cpu_to_be32(le32_to_cpu(resp->de_implem_rev_dword[i]));
> 
> That dance is a swap as data is stored le but UUID fields are be.
> Maybe going via cpu endian is fine as would be silly to have le32_to_be32()
> so it perhaps has documentation value.  Fair enough - I argued myself around
> with agreeing with how you did it here, but left the discussion for anyone
> else who has similar thoughts.

Yes indeed it is awkward but I did not really know how else to do it while
making it clear what was going on...by the spec the UUIDs are BEs in memory
(i.e. when laid out in the SHMTI/TDCF areas) and they are also BE in uuid_t
when 'at rest',  BUT when they are carried in a message payload they have
to be LE since all the SCMI messages payloads are LEs...

> 
> > +		import_uuid(&ti->info.base.primary_revision, (const __u8 *)&de_impl_version);
> > +		ti->info.single_read_support = SUPPORTS_SINGLE_READ(attr);
> > +		ti->info.continuous_update_support = SUPPORTS_CONTINUOS_UPDATE(attr);
> > +		ti->info.per_group_config_support = SUPPORTS_PER_GROUP_CONFIG(attr);
> > +		ti->info.reset_support = SUPPORTS_RESET(attr);
> > +		ti->info.fc_support = SUPPORTS_FC(attr);
> > +		ti->num_shmti = le32_get_bits(attr, GENMASK(15, 0));
> > +		ti->default_blk_ts_rate = le32_to_cpu(resp->default_blk_ts_rate);
> > +	}
> > +
> > +	ph->xops->xfer_put(ph, t);
> > +
> > +	return ret;
> > +}
> 
> > diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> > index 5ab73b1ab9aa..121c83e1c6d8 100644
> > --- a/include/linux/scmi_protocol.h
> > +++ b/include/linux/scmi_protocol.h
> 
> ...
> 
> 
> > +/**
> > + * struct scmi_telemetry_proto_ops - represents the various operations provided
> > + *	by SCMI Telemetry Protocol
> > + *
> > + * @info_get: get the general Telemetry information.
> > + */
> > +struct scmi_telemetry_proto_ops {
> info> +	const struct scmi_telemetry_info __must_check *(*info_get)
> > +		(const struct scmi_protocol_handle *ph);
> 
> Why __must_check?  Be a bit crazy if no one did anything with the
> info they just requested, so that seems overkill and doesn't help with
> the long line.
> 

... indeed this is silly...it cannot even be NULL...I will drop it..

Thanks !
Cristian

