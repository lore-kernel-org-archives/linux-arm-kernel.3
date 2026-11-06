Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6E1606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 13:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j/45Tvsz;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ux4vr86c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Zo1YANHGY5K7EKDTSk3sKKZ8HjBMhkzMboLAJ/57Sdo=; b=j/45TvszJPvoqnYJbb9p3Jbq/P
	8yIPMJzJf0D+uwrKrP+mvMy4CWwCjr4mTrWCIt6+RDjSRXFxrDw3L4oxhxvJevpqg9ue4vaXWQgy9
	T+chlfpxtkk27Mjvr+K34+9/xAJ3iTDqFSebYelaxft+w3+VSS1wyLoLzMWnas+2Dh/arVI7iBlIR
	vRoRCz87FTROIMDrYj1XdAhmZQHbCylGFxnjphxjhAew0DbY/UdGRS9fwi3GhI+GzVCmXaQ9cH+am
	HTIJFa+SoxhC0YYzuAw/w6SkT7oT2L8zCEYZbFW/KomHzqIxCJWbniAoJeQY6efTQdge1LNWYcDpl
	JfjJYSzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKL7-0000000CUJT-3bnf;
	Fri, 06 Nov 2026 13:50:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKL4-0000000CUIu-2Rno
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 13:50:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEE991650;
	Fri,  6 Nov 2026 05:50:37 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 774443F628;
	Fri,  6 Nov 2026 05:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793973041; bh=c/9LP5bQvzkTr12X06Z/sjnfdeYKDgb/es1V3LGmbhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ux4vr86c2PMXNRc9GbFPX2UB1d6ftVPcH6goqYa2uw+m09v216nvASi7qk+fj6sYp
	 Jb0hteSJzt4+Mx18aHsFV7tAmjuYpuVs9ssCwJxJdIir1kmWoxP0BDSAs77sKA21zV
	 w+2mCrn0HBqwaM3WeO24znH4QkW2WU2bQ1RHvavQ=
Date: Fri, 6 Nov 2026 13:50:29 +0000
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
Subject: Re: [PATCH v14 08/32] firmware: arm_scmi: Add Telemetry resources
 enumeration
Message-ID: <au3bJV_fh4QG1jEV@pluto>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
 <20261016185553.2794459-9-cristian.marussi@arm.com>
 <20261019162823.000069e4@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019162823.000069e4@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_055042_741414_F054AFE5 
X-CRM114-Status: GOOD (  56.43  )
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

On Mon, Oct 19, 2026 at 04:28:23PM -0700, Jonathan Cameron wrote:
> On Fri, 16 Oct 2026 19:55:29 +0100
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add core Telemetry initialization routines in charge of basic allocations
> > and DataEvents enumerations.
> 
> Needs more about why you have made key design decisions in here.

Hi,

yes indeed it is pretty much information-less now :P

> 
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> > v13 --> v14
> >  - splitted out of the old Basic Telemetry patch, contains the basic
> >    instance allocations and the DEs enumeration process
> >  - renamed some fields to more strictly adhere to spec nomenclature
> Even split out this remains challenging to review.
> 
> I've asked for a few comments inline for why certainly structures are used
> and stored in arrays when they look like they could just be directly embedded
> in each other.
> 
> They tend to surface much later when you add the userspace ABI.
> 

Indeed the reasoning behind some apparently awkward data layout was not
explicited...

> > ---
> >  drivers/firmware/arm_scmi/telemetry.c | 633 ++++++++++++++++++++++++++
> >  include/linux/scmi_protocol.h         |  38 ++
> >  2 files changed, 671 insertions(+)
> > 
> > diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> > index 32f6f8d1106d..87ff75805935 100644
> > --- a/drivers/firmware/arm_scmi/telemetry.c
> > +++ b/drivers/firmware/arm_scmi/telemetry.c
> > @@ -8,15 +8,19 @@
> >  #include <linux/atomic.h>
> >  #include <linux/bitfield.h>
> >  #include <linux/compiler_types.h>
> > +#include <linux/completion.h>
> > +#include <linux/delay.h>
> >  #include <linux/device.h>
> >  #include <linux/err.h>
> >  #include <linux/io.h>
> >  #include <linux/limits.h>
> >  #include <linux/module.h>
> > +#include <linux/mutex.h>
> >  #include <linux/slab.h>
> >  #include <linux/sprintf.h>
> >  #include <linux/string.h>
> >  #include <linux/uuid.h>
> > +#include <linux/xarray.h>
> >  
> >  #include "protocols.h"
> >  #include "notify.h"
> > @@ -51,13 +55,189 @@ struct scmi_msg_resp_telemetry_protocol_attributes {
> >  	__le32 default_blk_ts_rate;
> >  };
> >  
> > +struct de_desc_fastchannel {
> > +	__le32 addr_low;
> > +	__le32 addr_high;
> > +	__le32 size;
> > +};
> > +
> > +struct scmi_de_desc {
> > +	__le32 de_id;
> > +	__le32 group_id;
> > +	__le32 de_data_sz;
> > +	__le32 de_attributes_1;
> 
> Maybe de_attrs_1 is enough?  Would shorted a few lines!
> 

..well...it was exactly like that till v13 I think, but I was asked explicitly in
other reviews to try to adhere more strictly to the SCMI specification nomenclature...
(which I did BUT not everywhere anyway...)

> 
> > +#define	IS_NAME_SUPPORTED(d)	(le32_get_bits((d)->de_attributes_1, BIT(31)))
> > +#define	IS_FC_SUPPORTED(d)	(le32_get_bits((d)->de_attributes_1, BIT(30)))
> > +#define	GET_DE_TYPE(d)		(le32_get_bits((d)->de_attributes_1, GENMASK(29, 22)))
> > +#define	IS_PERSISTENT(d)	(le32_get_bits((d)->de_attributes_1, BIT(21)))
> > +#define GET_DE_UNIT_EXP(d)							\
> > +	({									\
> > +		__u32 __signed_exp =						\
> > +			le32_get_bits((d)->de_attributes_1, GENMASK(20, 13));	\
> > +										\
> > +		sign_extend32(__signed_exp, 7);					\
> > +	})
> > +#define	GET_DE_UNIT(d)		(le32_get_bits((d)->de_attributes_1, GENMASK(12, 5)))
> > +#define	TSTAMP_SUPPORT(d)	(le32_get_bits((d)->de_attributes_1, GENMASK(1, 0)))
> > +	__le32 de_attributes_2;
> > +#define	GET_DE_INSTA_ID(d)	(le32_get_bits((d)->de_attributes_2, GENMASK(31, 24)))
> > +#define	GET_COMPO_INSTA_ID(d)	(le32_get_bits((d)->de_attributes_2, GENMASK(23, 8)))
> > +#define	GET_COMPO_TYPE(d)	(le32_get_bits((d)->de_attributes_2, GENMASK(7, 0)))
> > +	__le32 de_attributes_3;
> > +};
> > +
> > +struct scmi_msg_resp_telemetry_de_description {
> > +	__le32 num_desc;
> 
> I'd add a comment about this being a few values packed
> together to just avoid someone saying __counted_by_le()
> is appropriate - the name rather suggests it is!
> 

Yes indeed, I stumbled on that myself blindly adding counted_by and then
removing it after Sashiko complaints :D

> > +	struct scmi_de_desc desc[]; 
> > +};
> 
> > +
> > +struct telemetry_de {
> > +	enum timestamps ts_type;
> > +	u32 ts_rate;
> 
> I think some of this is not yet used and it would be better to bring
> elements in only when we can see how they are used.
> The ts_rate nested some layers below is the one initialized in this
> patch I think.
>

...yes it is a lot of churn to do that and error-prone...I'll try to
convince some lovely LLM to do that next

> > +	bool enumerated;
> > +	void __iomem *base;
> > +	u32 sid;
> > +	u32 offset;
> > +	/* NOTE THAT DE data_sz is registered in scmi_telemetry_de */
> > +	u32 fc_size;
> > +	struct list_head item;
> > +	struct scmi_telemetry_de de;
> > +	/* Protect last_val/ts/magic accesses - MUST BE KEPT LAST */
> > +	struct mutex mtx;
> > +};
> > +
> > +#define to_tde(d)	container_of(d, struct telemetry_de, de)
> > +
> >  struct telemetry_info {
> >  	bool streaming_mode;
> >  	unsigned int num_shmti;
> >  	unsigned int num_des_tstamp;
> >  	unsigned int default_blk_ts_rate;
> >  	const struct scmi_protocol_handle *ph;
> > +	struct telemetry_de *tdes;
> > +	struct xarray xa_des;
> > +	/* Mutex to protect access to @free_des */
> > +	struct mutex free_mtx;
> > +	struct list_head free_des;
> > +	struct list_head fcs_des;
> >  	struct scmi_telemetry_info info;
> > +	atomic_t rinfo_initializing;
> > +	struct completion rinfo_initdone;
> > +	struct scmi_telemetry_res_info *rinfo;
> > +	struct scmi_telemetry_res_info *(*res_get)(struct telemetry_info *ti);
> > +};
> 
> > +static struct telemetry_de *scmi_telemetry_tde_get(struct telemetry_info *ti,
> > +						   unsigned int de_id)
> > +{
> > +	struct telemetry_de *tde;
> > +
> > +	/* Pick a new tde */
> 
> Not sure the comment adds anything as function is well enough named.
>

definitely a stupid comment to remove
 
> > +	tde = scmi_telemetry_free_tde_get(ti);
> > +	if (!tde) {
> > +		dev_err(ti->ph->dev, "Cannot get TDE for ID:0x%08X\n", de_id);
> > +		return ERR_PTR(-ENOSPC);
> > +	}
> > +
> > +	tde->sid = SHMTI_ID_INVALID;
> > +
> > +	return tde;
> > +}
> >
> > +
> > +struct scmi_tlm_de_priv {
> > +	struct telemetry_info *ti;
> > +	void *next;
> > +	size_t rx_len;
> >  };
> >  
> >  static int
> > @@ -99,6 +279,221 @@ scmi_telemetry_protocol_attributes_get(struct telemetry_info *ti)
> >  	return ret;
> >  }
> >  
> > +static void iter_tlm_prepare_message(void *message,
> > +				     unsigned int desc_index, const void *priv)
> > +{
> > +	put_unaligned_le32(desc_index, message);
> > +}
> > +
> > +static int iter_de_descr_update_state(struct scmi_iterator_state *st,
> > +				      const void *response, void *priv)
> > +{
> > +	const struct scmi_msg_resp_telemetry_de_description *r = response;
> > +	struct scmi_tlm_de_priv *p = priv;
> > +
> > +	st->num_returned = le32_get_bits(r->num_desc, GENMASK(15, 0));
> > +	st->num_remaining = le32_get_bits(r->num_desc, GENMASK(31, 16));
> > +
> > +	if (st->rx_len < (sizeof(*r) + sizeof(r->desc[0]) * st->num_returned))
> > +		return -EINVAL;
> > +
> > +	/* Initialized to first descriptor and initial payload size */
> > +	p->next = (void *)r->desc;
> 
> Can p->next just be const?  Would avoid need for casting here.

Not really since it is passed down the iterators and updated down the
road as a cursor into the paylod (since the bloody response is varibaly
sized chunked based on the content of the payload itself...) 

> > +	p->rx_len = st->rx_len - sizeof(*r);
> > +
> > +	return 0;
> > +}
> 
> > +
> > +static int scmi_telemetry_de_descriptor_parse(struct telemetry_info *ti,
> > +					      struct telemetry_de *tde,
> > +					      void **next, size_t *rx_len)
> > +{
> > +	const struct scmi_de_desc *desc = *next;
> > +	size_t payld_sz = sizeof(*desc);
> > +
> > +	lockdep_assert_held(&tde->mtx);
> > +
> > +	if (*rx_len < payld_sz)
> > +		return -ENOSPC;
> > +
> > +	tde->de.info->id = le32_to_cpu(desc->de_id);
> > +	tde->de.info->grp_id = le32_to_cpu(desc->group_id);
> > +	tde->de.info->data_sz = le32_to_cpu(desc->de_data_sz);
> > +	tde->de.info->type = GET_DE_TYPE(desc);
> > +	tde->de.info->unit = GET_DE_UNIT(desc);
> > +	tde->de.info->unit_exp = GET_DE_UNIT_EXP(desc);
> > +	tde->de.info->instance_id = GET_DE_INSTA_ID(desc);
> > +	tde->de.info->compo_instance_id = GET_COMPO_INSTA_ID(desc);
> > +	tde->de.info->compo_type = GET_COMPO_TYPE(desc);
> > +	tde->de.info->persistent = IS_PERSISTENT(desc);
> > +	tde->ts_type = TSTAMP_SUPPORT(desc);
> > +	tde->de.tstamp_support = !!tde->ts_type;
> > +	tde->de.fc_support = IS_FC_SUPPORTED(desc);
> > +	tde->de.name_support = IS_NAME_SUPPORTED(desc);
> > +	/* Update DE_DESCRIPTOR size for the next iteration */
> > +	*next += sizeof(*desc);
> > +
> > +	payld_sz += scmi_telemetry_tde_var_size_calc(tde);
> > +	if (*rx_len < payld_sz)
> > +		return -ENOSPC;
> > +
> > +	if (tde->ts_type == TSTAMP_LINE) {
> > +		__le32 *line_ts_rate = *next;
> > +
> > +		tde->de.info->ts_rate = le32_to_cpu((*line_ts_rate));
> > +
> > +		/* Variably sized depending on TS support */
> > +		*next += sizeof(*line_ts_rate);
> > +	} else if (tde->ts_type == TSTAMP_BLK) {
> > +		/* Setup default BLK TS value at first */
> > +		tde->de.info->ts_rate = ti->default_blk_ts_rate;
> > +	}
> > +
> > +	if (tde->de.fc_support) {
> > +		u32 size;
> > +		u64 phys_addr;
> > +		void __iomem *addr;
> > +		struct de_desc_fastchannel *dfc;
> > +
> > +		dfc = *next;
> > +		phys_addr = le32_to_cpu(dfc->addr_low);
> > +		phys_addr |= (u64)le32_to_cpu(dfc->addr_high) << 32;
> 
> Does
> 		phys_addr = get_unaligned_le64(&dfc->addr_low);
> work for this?  For me that would provide simple documentation of
> the maths.
>

Maybe yes, but I have a pending Sashiko comment on some other part of
this series where it warns about these phys_addr usage on 32bit arch...

...which is clearly something that depends on the whole system design
and configuration (i.e. server must NOT spit out meaningful high_addr
when on 32bits) thing that I can and should check kernel side BUT
under these premises I dont think that your proposal can fly...

> > +
> > +		size = le32_to_cpu(dfc->size);
> > +		addr = devm_ioremap(ti->ph->dev, phys_addr, size);
> > +		if (!addr)
> > +			return -EADDRNOTAVAIL;
> > +
> > +		tde->base = addr;
> > +		tde->offset = 0;
> > +		tde->fc_size = size;
> > +
> > +		/* Variably sized depending on FC support */
> > +		*next += sizeof(*dfc);
> > +	}
> > +
> > +	if (tde->de.name_support) {
> > +		const char *de_name = *next;
> > +
> > +		strscpy(tde->de.info->name, de_name, SCMI_SHORT_NAME_MAX_SIZE);
> > +		/* Variably sized depending on name support */
> > +		*next += SCMI_SHORT_NAME_MAX_SIZE;
> > +	}
> > +
> > +	/* Count timestamped DEs */
> > +	ti->num_des_tstamp += !!tde->de.tstamp_support;
> > +
> > +	*rx_len -= payld_sz;
> > +
> > +	return 0;
> > +}
> > +
> > +static int iter_de_descr_process_response(const struct scmi_protocol_handle *ph,
> > +					  const void *response,
> > +					  struct scmi_iterator_state *st,
> > +					  void *priv)
> > +{
> > +	struct scmi_tlm_de_priv *p = priv;
> > +	struct telemetry_info *ti = p->ti;
> > +	const struct scmi_de_desc *desc = p->next;
> > +	struct telemetry_de *tde;
> > +	bool discovered = false;
> > +	unsigned int de_id;
> > +	int ret;
> > +
> > +	de_id = le32_to_cpu(desc->de_id);
> > +	/* Check if this DE has already been discovered by other means... */
> 
> Maybe mention what 'other means?' as not locally obvious.
>

Sure.
 
> > +	tde = scmi_telemetry_tde_lookup(ti, de_id);
> > +	if (!tde) {
> > +		/* Create a new one */
> > +		tde = scmi_telemetry_tde_get(ti, de_id);
> > +		if (IS_ERR(tde))
> > +			return PTR_ERR(tde);
> > +
> > +		discovered = true;
> > +	}
> > +
> > +	guard(mutex)(&tde->mtx);
> > +	if (tde->enumerated) {
> > +		/* Cannot be a duplicate of a DE already created by enumeration */
> > +		dev_err(ph->dev,
> > +			"Discovered INVALID DE with DUPLICATED ID:0x%08X\n",
> > +			de_id);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret = scmi_telemetry_de_descriptor_parse(ti, tde, &p->next, &p->rx_len);
> > +	if (ret) {
> > +		dev_err(ph->dev, "Malformed DE Descriptor - ret:%d\n", ret);
> > +		/* DE not enumerated at this point were created in this call */
> > +		if (discovered)
> > +			scmi_telemetry_free_tde_put(ti, tde);
> > +		return ret;
> > +	}
> > +
> > +	/* Now fully enumerated */
> > +	tde->enumerated = true;
> > +
> > +	if (discovered) {
> > +		/* Register if it was not already ... */
> I guess this comment is really about the whole block including
> if (discovered) (for the if not already part.
> 
> If so move the comment outside the if.
>

I'll do.

> > +		ret = scmi_telemetry_tde_register(ti, tde);
> > +		if (ret) {
> > +			/* DE not enumerated at this point were created in this call */
> > +			scmi_telemetry_free_tde_put(ti, tde);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	/* Add to FastChannels list */
> > +	if (tde->de.fc_support)
> > +		list_add(&tde->item, &ti->fcs_des);
> > +
> > +	return 0;
> > +}
> 
> >  
> > +/**
> > + * scmi_telemetry_resources_alloc  - Resources allocation
> > + * @ti: A reference to the telemetry info descriptor for this instance
> > + *
> > + * This allocates and initializes dedicated resources for the maximum possible
> > + * number of needed telemetry resources, based on information gathered from
> > + * the initial enumeration: these allocations represent an upper bound on
> > + * the number of discoverable telemetry resources and they will be later
> > + * populated during late deferred further discovery phases.
> 
> This could do with some comments to give us a hint why it needs
> to be allocated in so many different allocations.
> 

Ok.

> > + *
> > + * Return: 0 on Success, errno otherwise
> > + */
> > +static int scmi_telemetry_resources_alloc(struct telemetry_info *ti)
> > +{
> > +	/* Array to hold pointers to discovered DEs */
> > +	struct scmi_telemetry_de **des __free(kfree) =
> > +		kzalloc_objs(*des, ti->info.base.num_des);
> > +	if (!des)
> > +		return -ENOMEM;
> > +
> > +	/* The allocated DE descriptors */
> > +	struct telemetry_de *tdes __free(kfree) =
> > +		kzalloc_objs(*tdes, ti->info.base.num_des);
> > +	if (!tdes)
> > +		return -ENOMEM;
> > +
> > +	/* Allocate a set of contiguous DE info descriptors. */
> 
> Why do we care that they are contiguous?  That might be the case
> but if it isn't important then don't bother mentioning it.
> If it does matter, then say why. I think it's not needed
> until patch 28 and that's a long way for a reviewer to look!
> 

Indeed this needs clarification.

> > +	struct scmi_telemetry_de_info *dei_store __free(kfree) =
> > +		kzalloc_objs(*dei_store, ti->info.base.num_des);
> > +	if (!dei_store)
> > +		return -ENOMEM;
> > +
> > +	struct scmi_telemetry_res_info *rinfo __free(kfree) =
> > +		kzalloc_obj(*rinfo);
> > +	if (!rinfo)
> > +		return -ENOMEM;
> > +
> > +	mutex_init(&ti->free_mtx);
> > +	INIT_LIST_HEAD(&ti->free_des);
> > +	for (int i = 0; i < ti->info.base.num_des; i++) {
> > +		mutex_init(&tdes[i].mtx);
> > +		guard(mutex)(&tdes[i].mtx);
> > +
> > +		/* Bind contiguous DE info structures */
> > +		tdes[i].de.info = &dei_store[i];
> > +		scmi_telemetry_free_tde_put(ti, &tdes[i]);
> 
> Does this call actually do anything other than take
> some locks to zero stuff that is already zero?
> 

Yes indeed in this call-site it would only need to link the new item to
the list...I will split out an helper just for that...

> > +	}
> > +
> > +	INIT_LIST_HEAD(&ti->fcs_des);
> > +
> > +	ti->tdes = no_free_ptr(tdes);
> > +
> > +	rinfo->des = no_free_ptr(des);
> > +	rinfo->dei_store = no_free_ptr(dei_store);
> > +
> > +	/* Ensure all of the above assignments are visible */
> > +	smp_store_release(&ti->rinfo, no_free_ptr(rinfo));
> > +
> > +	return 0;
> > +}
> 
> > +static void scmi_telemetry_instance_cleanup(void *arg)
> > +{
> > +	struct telemetry_info *ti = arg;
> > +
> > +	scmi_telemetry_tdes_cleanup(ti);
> > +	scmi_telemetry_resources_free(ti);
> > +}
> > +
> > +/**
> > + * scmi_telemetry_resources_enumerate  - Enumeration helper
> > + * @ti: A reference to the telemetry info descriptor for this instance
> > + *
> > + * This helper is configured to be called once on the first enumeration
> > + * attempt, when triggered by invoking ti->res_get() from somewhere else.
> > + *
> > + * Once run it substitues itself in ti->res_get() with the simple accessor
> > + * __scmi_telemetry_resources_get, which returns a descriptor to the resources
> > + * that were possibly discovered.
> > + *
> > + * Note that, while it attempts to fully enumerate Data Events and Groups, it
> > + * does NOT fail when such enumerations fail, instead it simply gives up with
> > + * the end result that only a partially populated, but consistent, resources
> > + * descriptor will be returned; in such a case the incomplete descriptor will
> > + * be marked as NOT fully_enumerated: this design enables the kernel to deal
> > + * with badly implemented out-of-spec firmware support while keep on providing
> > + * a minimal sane, albeit possibly incomplete, set of telemetry respources.
> > + *
> > + * Return: A reference to a fully or partially populated resources descriptor
> > + */
> > +static struct scmi_telemetry_res_info *
> > +scmi_telemetry_resources_enumerate(struct telemetry_info *ti)
> > +{
> > +	struct device *dev = ti->ph->dev;
> > +	int ret;
> > +
> > +	/*
> > +	 * Ensure the following initialization can be called only once
> > +	 * from one thread of execution.
> > +	 */
> > +	if (atomic_cmpxchg(&ti->rinfo_initializing, 0, 1)) {
> > +		/*
> > +		 * When initialization is already ongoing in another thread,
> > +		 * just wait for its completion and return the fully or partially
> > +		 * populated rinfo.
> > +		 */
> > +		if (!completion_done(&ti->rinfo_initdone))
> > +			wait_for_completion(&ti->rinfo_initdone);
> > +
> > +		/* Ensure rinfo descriptor is visible */
> > +		return smp_load_acquire(&ti->rinfo);
> > +	}
> > +
> > +	/* Note that this code below can be run only once by one thread */
> > +	ret = scmi_telemetry_de_descriptors_get(ti);
> > +	if (ret) {
> > +		dev_err(dev, FW_BUG "Cannot fully enumerate DEs resources. Degraded system.\n");
> > +		goto done;
> > +	}
> > +
> > +	ti->rinfo->fully_enumerated = true;
> > +done:
> > +	/* Disable initialization permanently */
> > +	smp_store_release(&ti->res_get, __scmi_telemetry_resources_get);
> > +
> > +	/* Unblock concurrent threads that have been stalled */
> > +	complete_all(&ti->rinfo_initdone);
> > +
> > +	/* Ensure local rinfo is visible before returning it */
> > +	smp_mb();
> > +	return ti->rinfo;
> > +}
> > +
> > +/**
> > + * scmi_telemetry_instance_init  - Instance initializer
> > + * @ti: A reference to the telemetry info descriptor for this instance
> > + *
> > + * Note that this allocates and initialize all the resources possibly needed
> > + * and then setups the @scmi_telemetry_resources_enumerate helper as the
> > + * default method for the first call to ti->res_get(): this mechanism enables
> > + * the possibility of optionally implementing deferred enumeration policies
> > + * which optionally delay the discovery phase and related SCMI message exchanges
> > + * to a later point in time.
> > + *
> > + * Return: 0 on Success, errno otherwise
> > + */
> > +static int scmi_telemetry_instance_init(struct telemetry_info *ti)
> > +{
> > +	int ret;
> > +
> > +	/* Allocate and Initialize on first call... */
> 
> That comment made me think that this was a singleton in that
> if you called it a second time it would fail. Seems that it just
> allocates whenever it is called (which happens to be once) so
> I'd drop the comment as adding confusion rather than clarity.
> 

Yes.

> > +	ret = scmi_telemetry_resources_alloc(ti);
> > +	if (ret)
> > +		return ret;
> > +
> > +	xa_init(&ti->xa_des);
> > +
> > +	/* Setup resources lazy initialization */
> > +	atomic_set(&ti->rinfo_initializing, 0);
> > +	init_completion(&ti->rinfo_initdone);
> > +	/* Ensure the new res_get() operation is visible after this point */
> > +	smp_store_mb(ti->res_get, scmi_telemetry_resources_enumerate);
> > +
> > +	return devm_add_action_or_reset(ti->ph->dev,
> > +					scmi_telemetry_instance_cleanup, ti);
> 
> If you can make it more obvious what this is matching against in the above function
> that would be good. Normally that is done by putting the setup and tear down
> next to each other.
> 
> Might be better to split it into two callbacks so that you can couple
> resources_free with resource_alloc above then the other bit with whatever
> that is unwinding.
> 

This function allocates a number of things using a number of helpers
like resources_alloc (and more later in the series) and instance_cleanup
is registered to tear down all of this via devres by callling all of the
correspondet deallocators (once all of allocation have succedded)

> 
> > +}
> 
> > diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> > index 121c83e1c6d8..018427daf55f 100644
> > --- a/include/linux/scmi_protocol.h
> > +++ b/include/linux/scmi_protocol.h
> > @@ -13,6 +13,7 @@
> >  #include <linux/device.h>
> >  #include <linux/notifier.h>
> >  #include <linux/types.h>
> > +#include <linux/uuid.h>
> >  
> >  #define SCMI_MAX_STR_SIZE		64
> >  #define SCMI_SHORT_NAME_MAX_SIZE	16
> > @@ -825,6 +826,37 @@ struct scmi_pinctrl_proto_ops {
> >  	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
> >  };
> >  
> > +struct scmi_telemetry_de_info {
> > +	unsigned int id;
> > +	unsigned int grp_id;
> > +	unsigned int data_sz;
> > +	unsigned int type;
> > +	unsigned int unit;
> > +	int unit_exp;
> > +	unsigned int ts_rate;
> > +	unsigned int instance_id;
> > +	unsigned int compo_instance_id;
> > +	unsigned int compo_type;
> > +	bool persistent;
> > +	char name[16];
> > +};
> > +
> > +struct scmi_telemetry_de {
> > +	bool tstamp_support;
> > +	bool fc_support;
> > +	bool name_support;
> > +	struct scmi_telemetry_de_info *info;
> 
> I'd be tempted to put the pointer first though perhaps
> it is acting as a separator for the bools?  If so I'd
> use a comment instead.

...it is really just randomly placed I think, I'll group better the
booleans...

> 
> > +	bool enabled;
> > +	bool tstamp_enabled;
> > +};
> > +
> > +struct scmi_telemetry_res_info {
> > +	bool fully_enumerated;
> > +	unsigned int num_des;
> > +	struct scmi_telemetry_de **des;
> > +	struct scmi_telemetry_de_info *dei_store;
> > +};
> > +
> >  struct scmi_telemetry_base_info {
> >  	unsigned int version;
> >  	uuid_t primary_revision;
> > @@ -848,10 +880,16 @@ struct scmi_telemetry_info {
> >   *	by SCMI Telemetry Protocol
> >   *
> >   * @info_get: get the general Telemetry information.
> > + * @de_lookup: get a specific DE descriptor from the DE id.
> > + * @res_get: get a reference to the Telemetry resources descriptor.
> >   */
> >  struct scmi_telemetry_proto_ops {
> >  	const struct scmi_telemetry_info __must_check *(*info_get)
> >  		(const struct scmi_protocol_handle *ph);
> > +	const struct scmi_telemetry_de __must_check *(*de_lookup)
> > +		(const struct scmi_protocol_handle *ph, u32 id);
> > +	const struct scmi_telemetry_res_info __must_check *(*res_get)
> > +		(const struct scmi_protocol_handle *ph);
> 
> Similar to previous. I'm not seeing the value in the __must_check
> markings.  They make sense when the return value isn't the data
> just asked for which one would assume would always be used.
>

I agree that for res_get is pointless BUT de_lookup could return NULL so 
I thought was a good way of policing the caller ... no ?

Thanks,
Cristian

