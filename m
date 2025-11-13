Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E68CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 17:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZmNLrZCd5cLiNNamQhB1s6uGE4q3KxgejBL+QKMWMc=; b=MX0QVYqKzhK335MUDdIrQJgPE3
	ANREg3qvAZjPw2qbwum4n5WT1abF4WS0ZdjQKXsAEz6Ne7HgGjYUYFZjmTgKjF2hsDnHmCt2UDwqa
	UaaVLKTKStwGELFVCzcNzVV+crxHf/j66kuYIGkFb3skP+pxKwEufezC2tVoh+ovXBNy40Ser64VS
	kOetMUDo1MMlFV1VGmYManv0iS5/szmAS7wpumD0CBSi8F5IMZL52s5viKrFvvgjdCUo4Es7hDTNo
	sHLEG9Bmqp2zY7WZ9NKb0pVbGs5EZ00XZ1QKNHk4ga/HTB4Mnp1fVfSnxAFGXI14jRPF9bAerY+dd
	tSxxa8yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJbFB-0000000As3C-0a80;
	Thu, 13 Nov 2025 17:36:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJbF8-0000000As2L-03OP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 17:36:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EF8E12FC;
	Thu, 13 Nov 2025 09:36:12 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A21B03F66E;
	Thu, 13 Nov 2025 09:36:19 -0800 (PST)
Date: Thu, 13 Nov 2025 17:36:17 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	james.clark@linaro.org
Subject: Re: [PATCH v2 1/1] coresight: fix issue where coresight component
 has no claimtags
Message-ID: <20251113173617.GA3568724@e132581.arm.com>
References: <20251027223545.2801-1-mike.leach@linaro.org>
 <20251027223545.2801-2-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027223545.2801-2-mike.leach@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_093622_138744_4E863357 
X-CRM114-Status: GOOD (  36.37  )
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

On Mon, Oct 27, 2025 at 10:35:45PM +0000, Mike Leach wrote:
> Coresight components have 0 to 8 claim tag bits. ARM recommends 4 and
> the implemented claim tag protocol uses two of these.
> 
> If a component has insufficient claim tags then the protocol incorrectly
> returns an error when attempting to claim a component.
> 
> Fix by reading CLAIMSET to establish then actual number of claim tags
> and return success when attempting to claim a component were there are
> insufficient tags to implement the protocol.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-core.c | 46 ++++++++++++++++++--
>  drivers/hwtracing/coresight/coresight-priv.h | 10 +++++
>  include/linux/coresight.h                    | 15 +++++++
>  3 files changed, 68 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 3267192f0c1c..61b4902b0ead 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -131,6 +131,39 @@ coresight_find_out_connection(struct coresight_device *csdev,
>  	return ERR_PTR(-ENODEV);
>  }
>  
> +/*
> + * Reading CLAiMSET returns  a bitfield representing the number of claim tags

s/CLAiMSET/CLAIMSET

> + * implemented from bit 0 to bit nTag-1, valid bits set to 1.
> + *
> + * Claim protocol requires 2 bits so test for MS bit required,
> + * bit 1 -  CORESIGHT_CLAIM_BIT_PROTOCOL_HI
> + *
> + * return true if sufficient claim tags implemented for protocol
> + */
> +static bool coresight_claim_tags_implemented_unlocked(struct csdev_access *csa)
> +{
> +	u32 claim_bits_impl = FIELD_GET(CORESIGHT_CLAIM_BITS_MAX_MASK,
> +			 csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMSET));
> +	return ((claim_bits_impl & CORESIGHT_CLAIM_BIT_PROTOCOL_HI) != 0);

How about a simple one?

        return !!FIELD_GET(CORESIGHT_CLAIM_BITS_MAX_MASK,
                           csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMSET));
> +}
> +
> +/*
> + * check if we can use the claim tag protocol.
> + *
> + * If currently unknown - read register to determine if sufficient tags and
> + * save value, otherwise return current value.
> + */
> +static bool coresight_check_use_claim_tag_unlocked(struct coresight_device *csdev)
> +{
> +	if (csdev->claim_tag_info == CS_CLAIM_TAG_UNKNOWN) {
> +		if (coresight_claim_tags_implemented_unlocked(&csdev->access))
> +			csdev->claim_tag_info = CS_CLAIM_TAG_STD_PROTOCOL;
> +		else
> +			csdev->claim_tag_info = CS_CLAIM_TAG_NOT_IMPL;
> +	}
> +	return (csdev->claim_tag_info == CS_CLAIM_TAG_STD_PROTOCOL);
> +}
> +
>  static u32 coresight_read_claim_tags_unlocked(struct coresight_device *csdev)
>  {
>  	return FIELD_GET(CORESIGHT_CLAIM_MASK,

Why do not apply claim tag implemented check in
coresight_read_claim_tags_unlocked() ?

> @@ -156,6 +189,9 @@ EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag);
>  
>  void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa)
>  {
> +	if (!coresight_claim_tags_implemented_unlocked(csa))
> +		return;

Here it does not call coresight_check_use_claim_tag_unlocked(), which
means the cached flag is not used. I think we should be consistent
across all claim tag functions.

This is why I suggested to put the flag into csdev_access rather than
in csdev. Seems to me, it is nature to use csdev_access to store this
flag, as it presents a attribute for register access (we can consider
csdev presents a device on bus).

If agree with above, then we can create a new function:

  void coresight_init_self_claim_tag(struct csdev_access *csa)
  {
      csa->claim_tag_implemented = !!FIELD_GET(CORESIGHT_CLAIM_BITS_MAX_MASK,
                           csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMSET));

      if (csa->claim_tag_implemented)
          coresight_clear_self_claim_tag(csa);
  }

This function is called by probe()s in CoreSight drivers, afterwards,
simply check the flag "csa->claim_tag_implemented".

A minor benefit is we can drop coresight_check_use_claim_tag_unlocked()
and the enum coresight_claim_tag_info, as we just need to initialize
csa->claim_tag_implemented at the init phase.

> +
>  	csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
>  				     CORESIGHT_CLAIMCLR);
>  	isb();
> @@ -175,12 +211,13 @@ EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag_unlocked);
>  int coresight_claim_device_unlocked(struct coresight_device *csdev)
>  {
>  	int tag;
> -	struct csdev_access *csa;
>  
>  	if (WARN_ON(!csdev))
>  		return -EINVAL;
>  
> -	csa = &csdev->access;
> +	if (!coresight_check_use_claim_tag_unlocked(csdev))
> +		return 0;

> +
>  	tag = coresight_read_claim_tags_unlocked(csdev);
>  
>  	switch (tag) {
> @@ -190,7 +227,7 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
>  			return 0;
>  
>  		/* There was a race setting the tag, clean up and fail */
> -		coresight_clear_self_claim_tag_unlocked(csa);
> +		coresight_clear_self_claim_tag_unlocked(&csdev->access);
>  		dev_dbg(&csdev->dev, "Busy: Couldn't set self claim tag");
>  		return -EBUSY;
>  
> @@ -237,6 +274,9 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
>  	if (WARN_ON(!csdev))
>  		return;
>  
> +	if (!coresight_check_use_claim_tag_unlocked(csdev))
> +		return;

If use the method mentioned, no need to spread
coresight_check_use_claim_tag_unlocked() in claim and disclaim functions.

Thanks,
Leo

> +
>  	if (coresight_read_claim_tags_unlocked(csdev) == CORESIGHT_CLAIM_SELF_HOSTED)
>  		coresight_clear_self_claim_tag_unlocked(&csdev->access);
>  	else
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 33e22b1ba043..270f179c8535 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -41,6 +41,16 @@ extern const struct device_type coresight_dev_type[];
>  #define CORESIGHT_CLAIM_SELF_HOSTED	2
>  #define CORESIGHT_CLAIM_INVALID		3
>  
> +/*
> + * Coresight specification defines a maximum of 8 claim tag bits.
> + * The precise number is implementation defined, and may be obtained by
> + * reading the CLAIMSET register.
> + */
> +#define CORESIGHT_CLAIM_BITS_MAX_MASK	GENMASK(7, 0)
> +
> +/* MS Bit required by the protocol */
> +#define CORESIGHT_CLAIM_BIT_PROTOCOL_HI	BIT(1)
> +
>  #define TIMEOUT_US		100
>  #define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)
>  
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 6de59ce8ef8c..fefe4317a793 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -242,6 +242,19 @@ struct coresight_trace_id_map {
>  	raw_spinlock_t lock;
>  };
>  
> +/*
> + * Coresight claim tag info:
> + * CS_CLAIM_TAG_UNKNOWN      - not yet checked.
> + * CS_CLAIM_TAG_STD_PROTOCOL - using standard claim/release protocol.
> + * CS_CLAIM_TAG_NOT_IMPL     - no claim tags available.
> + */
> +enum coresight_claim_tag_info {
> +	CS_CLAIM_TAG_UNKNOWN,
> +	CS_CLAIM_TAG_STD_PROTOCOL,
> +	CS_CLAIM_TAG_NOT_IMPL,
> +};
> +
> +
>  /**
>   * struct coresight_device - representation of a device as used by the framework
>   * @pdata:	Platform data with device connections associated to this device.
> @@ -265,6 +278,7 @@ struct coresight_trace_id_map {
>   *		CS_MODE_SYSFS. Otherwise it must be accessed from inside the
>   *		spinlock.
>   * @orphan:	true if the component has connections that haven't been linked.
> + * @claim_tag_info: how the device is using claim tags.
>   * @sysfs_sink_activated: 'true' when a sink has been selected for use via sysfs
>   *		by writing a 1 to the 'enable_sink' file.  A sink can be
>   *		activated but not yet enabled.  Enabling for a _sink_ happens
> @@ -291,6 +305,7 @@ struct coresight_device {
>  	local_t	mode;
>  	int refcnt;
>  	bool orphan;
> +	enum coresight_claim_tag_info claim_tag_info;
>  	/* sink specific fields */
>  	bool sysfs_sink_activated;
>  	struct dev_ext_attribute *ea;
> -- 
> 2.32.0
> 

