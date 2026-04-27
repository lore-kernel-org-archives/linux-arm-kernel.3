Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBE5FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 17:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjIiJZ295XWRiM9u3pYHLaSrRLfYOC3+JdRWgL5Rvgs=; b=gYnt1JadKnwL6slODEx8GH0sRm
	x9bHzsniytHRYFdsZYugmzrtjKBv+WOkBqMuSXF2mFVJHv8doExg3uSdp/PxIsLtqDe1GhuYZJ0sd
	fbCsp38QhBh1HXEgR1AeQTNmSkc7qcRJL0+w4cYw7ytA+ytT2ZnZOoDnofGhdAEcBKI7VHYHbXakX
	rulb3Lsm4IP4ifndiiuWeJrY8VMlR/dNyxC8P10/qa//1VBXHAfzk+wp5bzB0E7i2pjfAB/RaHafZ
	xolOl7WP90dsW0iuuZMEZSZ5vyi7KXRR613DtcgdPsI11kCCUA2BHcu32wqeNKWpMrZDPix83A29D
	zRiHgYeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHQ3x-0000000HVg1-2RZf;
	Mon, 27 Apr 2026 17:48:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHQ3v-0000000HVfF-2dy1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 17:48:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64D90202C;
	Mon, 27 Apr 2026 10:47:57 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 716393F7B4;
	Mon, 27 Apr 2026 10:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777312082; bh=N/CxeRp4C6J/EUwjsMwrEoNIFMJIT8gvExYabDUQsz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VVQWVjfgBCs2hRc9+41J14g/U5UOqbdTm65/UhKrQjn+wXcfuqHPfMwP7J+uExY5i
	 WVeaV+uLgs5Yrql9L2krQR2f6KdsxuTH6Bn6k0OlSitZ9OjO3xstMJC3jKiL1Srqup
	 EQgPPuYyDZ7oVgSRAlESqy5C19bSNZIKERyMCrhA=
Date: Mon, 27 Apr 2026 18:48:00 +0100
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
Subject: Re: [PATCH v8 2/4] coresight: cti: encode trigger register index in
 register offsets
Message-ID: <20260427174800.GB16537@e132581.arm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
 <20260426-extended-cti-v8-2-23b900a4902f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426-extended-cti-v8-2-23b900a4902f@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_104803_787535_EF47C6D7 
X-CRM114-Status: GOOD (  23.09  )
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

On Sun, Apr 26, 2026 at 05:44:39PM +0800, Yingchao Deng wrote:
> Introduce a small encoding to carry the register index together with the
> base offset in a single u32, and use a common helper to compute the final
> MMIO address. This refactors register access to be based on the encoded
> (reg, nr) pair, reducing duplicated arithmetic and making it easier to
> support variants that bank or relocate trigger-indexed registers.
> 
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-cti-core.c  | 31 +++++++++++++++--------
>  drivers/hwtracing/coresight/coresight-cti-sysfs.c |  4 +--
>  drivers/hwtracing/coresight/coresight-cti.h       | 16 ++++++++++--
>  3 files changed, 36 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index 4e7d12bd2d3e..c4cbeb64365b 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -42,6 +42,14 @@ static DEFINE_MUTEX(ect_mutex);
>  #define csdev_to_cti_drvdata(csdev)	\
>  	dev_get_drvdata(csdev->dev.parent)
>  
> +static void __iomem *cti_reg_addr(struct cti_drvdata *drvdata, int reg)
> +{
> +	u32 offset = CTI_REG_CLR_NR(reg);
> +	u32 nr = CTI_REG_GET_NR(reg);
> +
> +	return drvdata->base + offset + sizeof(u32) * nr;
> +}

Could you try below change, which is more straightforward?

  static void __iomem *__reg_addr(struct cti_drvdata *drvdata, int off,
                                  int index)
  {
  	return drvdata->base + offset + sizeof(u32) * index;
  }

  #define reg_addr(drvdata, off)                 \
        __reg_addr((drvdata), (off), 0)

  #define reg_index_addr(drvdata, off, i)        \
        __reg_addr((drvdata), (off), (i))

> +
>  /* write set of regs to hardware - call with spinlock claimed */
>  void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
>  {
> @@ -55,16 +63,17 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
>  
>  	/* write the CTI trigger registers */
>  	for (i = 0; i < config->nr_trig_max; i++) {
> -		writel_relaxed(config->ctiinen[i], drvdata->base + CTIINEN(i));
> +		writel_relaxed(config->ctiinen[i],
> +			       cti_reg_addr(drvdata, CTI_REG_SET_NR(CTIINEN, i)));

                writel_relaxed(config->ctiinen[i],
                               reg_index_addr(drvdata, CTIINEN, i));

>  		writel_relaxed(config->ctiouten[i],
> -			       drvdata->base + CTIOUTEN(i));
> +			       cti_reg_addr(drvdata, CTI_REG_SET_NR(CTIOUTEN, i)));

                writel_relaxed(config->ctiouten[i],
                               reg_index_addr(drvdata, CTIOUTEN, i));

[...]

> +/*
> + * Encode CTI register offset and register index in one u32:
> + *   - bits[0:11]  : base register offset (0x000 to 0xFFF)
> + *   - bits[24:31] : register index (nr)
> + */
> +#define CTI_REG_NR_MASK			GENMASK(31, 24)
> +#define CTI_REG_GET_NR(reg)		FIELD_GET(CTI_REG_NR_MASK, (reg))
> +#define CTI_REG_SET_NR_CONST(reg, nr)	((reg) | FIELD_PREP_CONST(CTI_REG_NR_MASK, (nr)))
> +#define CTI_REG_SET_NR(reg, nr)		((reg) | FIELD_PREP(CTI_REG_NR_MASK, (nr)))
> +#define CTI_REG_CLR_NR(reg)		((reg) & (~CTI_REG_NR_MASK))

I know this might come from my suggestion, and it is also will be
heavily used in patch 04.  We can have strightforward way to
implement this, please drop these macros.

I will reply in patch 04 separately.  Sorry my review might cause
extra effort.

Thanks,
Leo

