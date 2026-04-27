Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFE2FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 18:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HeS3u4LScDK25DMggi+s3iMFRhJgq6Ku3xN7NiKkpWY=; b=ob6TDT6fxNvH3WbFqeGmlm2aM7
	PL0K0bVl5T2B9KkzQhFChj8gl0J+P2A0DNv9EHs8RsHl3bbDHQL4+UVfVcVGylLRm7RUyGQIyGM5D
	IuzHsGue4rqfnbugDTnV5l0YCQobePSOqZq/BK0ZvWdBbYoB4FsZV8pVtde+vwEZ+HkadO6nNw8vl
	bKttDgqMBA57RxgTlxuca2RxkUYKEEjDjxZx7DEsQLkwgEqmNJsFsqk48JrgpjzRhJhj86xx34IEV
	nRYLJ2EUkFSCxQZcF1xHG7AnCJt3uwtduh/gUNs7GbpR7m28GIW4kd7wkUk/hlAdbVT9COH0xgJ+c
	nATm8fIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHQV2-0000000HYvX-1hh6;
	Mon, 27 Apr 2026 18:16:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHQV0-0000000HYvA-00ck
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 18:16:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 265B3202C;
	Mon, 27 Apr 2026 11:15:54 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 469703F763;
	Mon, 27 Apr 2026 11:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777313759; bh=ACljZHaJXDWWo3KsuPklvBKX5osHaF3OHqjq1FWimAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZopmOAXeyH32KlGCBGqNDXyu19rK+2znV5qmuL6PJA7mimU6Oc+SKnYg1/H0vDLp5
	 uYzMS4Vv17gPGguTlkQXqWOg/q2/g8szaE/GTN1VCvKsLqE3YlhDgehhZuB6MqVIrQ
	 /dQGBqskJ7TeuiNmPahrOI2PQa2VlylsGsI4pGBE=
Date: Mon, 27 Apr 2026 19:15:57 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	quic_yingdeng@quicinc.com,
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v8 4/4] coresight: cti: expose banked sysfs registers for
 Qualcomm extended CTI
Message-ID: <20260427181557.GC16537@e132581.arm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
 <20260426-extended-cti-v8-4-23b900a4902f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426-extended-cti-v8-4-23b900a4902f@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_111602_381893_43B10611 
X-CRM114-Status: GOOD (  24.69  )
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

On Sun, Apr 26, 2026 at 05:44:41PM +0800, Yingchao Deng wrote:
> Qualcomm extended CTI implements banked trigger status and integration
> registers, where each bank covers 32 triggers. Multiple instances of
> these registers are required to expose the full trigger space.
> 
> Add static sysfs entries for the banked CTI registers and control their
> visibility based on the underlying hardware configuration. Numbered
> sysfs nodes are hidden on standard ARM CTIs, preserving the existing ABI.
> On Qualcomm CTIs, only banked registers backed by hardware are exposed,
> with the number of visible banks derived from nr_trig_max.
> 
> This ensures that userspace only sees registers that are actually
> implemented, while maintaining compatibility with existing CTI tooling.
> 
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-cti-sysfs.c | 58 +++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> index 8b70e7e38ea3..046757e4e9b6 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -512,18 +512,36 @@ static struct attribute *coresight_cti_regs_attrs[] = {
>  	&dev_attr_appclear.attr,
>  	&dev_attr_apppulse.attr,
>  	coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
> +	coresight_cti_reg(triginstatus1, CTI_REG_SET_NR_CONST(CTITRIGINSTATUS, 1)),

How about extend the cs_off_attribute struct:

  struct cs_off_attribute {
        struct device_attribute attr;
        u32 off;
        u32 index;
  };

  // by default, the index is 0
  #define coresight_cti_reg(name, offset)                               \
        (&((struct cs_off_attribute[]) {                                \
           {                                                            \
                __ATTR(name, 0444, coresight_cti_reg_show, NULL),       \
                offset                                                  \
                0                                                       \
           }                                                            \
  })[0].attr.attr)

  // For the register with index
  #define coresight_cti_reg_index(name, offset, index)                  \
        (&((struct cs_off_attribute[]) {                                \
           {                                                            \
                __ATTR(name, 0444, coresight_cti_reg_show, NULL),       \
                offset                                                  \
                index                                                   \
           }                                                            \
  })[0].attr.attr)

  coresight_cti_reg_index(triginstatus1, CTITRIGINSTATUS, 1),

> +	coresight_cti_reg(triginstatus2, CTI_REG_SET_NR_CONST(CTITRIGINSTATUS, 2)),
> +	coresight_cti_reg(triginstatus3, CTI_REG_SET_NR_CONST(CTITRIGINSTATUS, 3)),
>  	coresight_cti_reg(trigoutstatus, CTITRIGOUTSTATUS),
> +	coresight_cti_reg(trigoutstatus1, CTI_REG_SET_NR_CONST(CTITRIGOUTSTATUS, 1)),
> +	coresight_cti_reg(trigoutstatus2, CTI_REG_SET_NR_CONST(CTITRIGOUTSTATUS, 2)),
> +	coresight_cti_reg(trigoutstatus3, CTI_REG_SET_NR_CONST(CTITRIGOUTSTATUS, 3)),
>  	coresight_cti_reg(chinstatus, CTICHINSTATUS),
>  	coresight_cti_reg(choutstatus, CTICHOUTSTATUS),
>  #ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
>  	coresight_cti_reg_rw(itctrl, CORESIGHT_ITCTRL),
>  	coresight_cti_reg(ittrigin, ITTRIGIN),
> +	coresight_cti_reg(ittrigin1, CTI_REG_SET_NR_CONST(ITTRIGIN, 1)),
> +	coresight_cti_reg(ittrigin2, CTI_REG_SET_NR_CONST(ITTRIGIN, 2)),
> +	coresight_cti_reg(ittrigin3, CTI_REG_SET_NR_CONST(ITTRIGIN, 3)),
>  	coresight_cti_reg(itchin, ITCHIN),
>  	coresight_cti_reg_rw(ittrigout, ITTRIGOUT),
> +	coresight_cti_reg_rw(ittrigout1, CTI_REG_SET_NR_CONST(ITTRIGOUT, 1)),
> +	coresight_cti_reg_rw(ittrigout2, CTI_REG_SET_NR_CONST(ITTRIGOUT, 2)),
> +	coresight_cti_reg_rw(ittrigout3, CTI_REG_SET_NR_CONST(ITTRIGOUT, 3)),
>  	coresight_cti_reg_rw(itchout, ITCHOUT),
>  	coresight_cti_reg(itchoutack, ITCHOUTACK),
>  	coresight_cti_reg(ittrigoutack, ITTRIGOUTACK),
> +	coresight_cti_reg(ittrigoutack1, CTI_REG_SET_NR_CONST(ITTRIGOUTACK, 1)),
> +	coresight_cti_reg(ittrigoutack2, CTI_REG_SET_NR_CONST(ITTRIGOUTACK, 2)),
> +	coresight_cti_reg(ittrigoutack3, CTI_REG_SET_NR_CONST(ITTRIGOUTACK, 3)),
>  	coresight_cti_reg_wo(ittriginack, ITTRIGINACK),
> +	coresight_cti_reg_wo(ittriginack1, CTI_REG_SET_NR_CONST(ITTRIGINACK, 1)),
> +	coresight_cti_reg_wo(ittriginack2, CTI_REG_SET_NR_CONST(ITTRIGINACK, 2)),
> +	coresight_cti_reg_wo(ittriginack3, CTI_REG_SET_NR_CONST(ITTRIGINACK, 3)),
>  	coresight_cti_reg_wo(itchinack, ITCHINACK),
>  #endif
>  	NULL,
> @@ -534,10 +552,50 @@ static umode_t coresight_cti_regs_is_visible(struct kobject *kobj,
>  {
>  	struct device *dev = kobj_to_dev(kobj);
>  	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	static const char * const qcom_suffix_registers[] = {
> +		"triginstatus",
> +		"trigoutstatus",
> +#ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
> +		"ittrigin",
> +		"ittrigout",
> +		"ittriginack",
> +		"ittrigoutack",
> +#endif
> +	};
> +	int i, nr, max_bank;
> +	size_t len;
>  
>  	if (attr == &dev_attr_asicctl.attr && !drvdata->config.asicctl_impl)
>  		return 0;
>  
> +	/*
> +	 * Banked regs are exposed as <qcom_suffix_registers><nr> (nr = 1..3).
> +	 * - Hide them on standard CTIs.
> +	 * - On QCOM CTIs, hide suffixes beyond the number of banks implied
> +	 *   by nr_trig_max (32 triggers per bank).
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(qcom_suffix_registers); i++) {

This can be general for a register with index?  Like:

  for (i = 0; i < ARRAY_SIZE(registers_with_index); i++) {

> +		len = strlen(qcom_suffix_registers[i]);
> +
> +		if (strncmp(attr->name, qcom_suffix_registers[i], len))
> +			continue;
> +
> +		if (kstrtoint(attr->name + len, 10, &nr))
> +			continue;
> +
> +		if (!drvdata->is_qcom_cti)
> +			return 0;
> +
> +		if (nr < 1 || nr > 3)
> +			return 0;
> +
> +		max_bank = DIV_ROUND_UP(drvdata->config.nr_trig_max, 32) - 1;
> +		if (nr > max_bank)
> +			return 0;

Directly check the attr's index here?

  struct cs_off_attribute *cti_attr =
                container_of(attr, struct cs_off_attribute, attr);

  max_bank = DIV_ROUND_UP(drvdata->config.nr_trig_max, 32);
  if (cti_attr->index >= max_bank)
      return 0;

Thanks,
Leo

