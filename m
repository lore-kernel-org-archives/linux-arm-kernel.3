Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13936CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrqD965FHZTp/whNmzCkF59IOo1S6x991S2TEx4K47g=; b=xmrRCIpYUOW6N96+LjWdtZ3j5J
	EHckp7ygMbeayE0ROHuzlJfmwhei2QlGc6jHkOT2tnyblOeQOzKO9Vpz8QbEUDVkvCp6rYQi/Kr+d
	FLHqgvZ9XXbzEuT84SuGgIUkddvi4OvYVh8JAPzDkyaUNTk+CH150h8AfWFri6xp9BbAY6NOXb4q7
	TyXeQfpf7Qa8VJlxbVMUCvwUrwokJfVXKQIErTV43qqk+5Mo/7cSemNrJsKdqEaG/hXB3n1Xzzw22
	XvCDqyyc6YwP2DbESHvZYaWzxi/7ycNiVCYTkIzGvug+rivjfOFwKAzOICZmFw/7oB+gNAfh74eWL
	LvVqfSxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSP0-000000054Me-2CaS;
	Thu, 14 May 2026 09:30:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSOv-000000054LO-0Usp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:30:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 071723502;
	Thu, 14 May 2026 02:30:34 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAFCD3F85F;
	Thu, 14 May 2026 02:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778751039; bh=y3gtJvNPzCP1iiJATyDYhKo/1mGzrMwzA2uwBxMeefA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Trv3pqBq75R94D0uW57IhDdAAALp4HFw1AbhNn1VcpWSrxDlU/5GJBvOMl04TzMLH
	 5Q3GaYehNrBm3BMmHTXjhVc7LlgnnT7TZ7ts8FUQyB36ImkQQR3vHHB113wORWVolT
	 dDGxPwY/u9uVsFSxekzjIGltAy7Upc0YaoL9KpkY=
Message-ID: <b73bc4e8-ac7a-45ee-9eaa-557fb41d5ad2@arm.com>
Date: Thu, 14 May 2026 10:30:35 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH 3/5] arm_mpam: add MPAM-Fb MSC firmware access support
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260429141339.3171205-1-andre.przywara@arm.com>
 <20260429141339.3171205-4-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260429141339.3171205-4-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_023041_240313_35105ECA 
X-CRM114-Status: GOOD (  29.21  )
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

Hi Andre,

I'm just having another look to try and understand this a bit better.

On 4/29/26 15:13, Andre Przywara wrote:
> The Arm MPAM Firmware-backed (Fb) Profile document[1] describes an
> alternative way of accessing the "Memory System Components" (MSC) in an
> MPAM enabled system.
> Normally the MSCs are MMIO mapped, but in some implementations this
> might not be possible (MSC located outside of the local socket, MSC
> mapped secure-only) or desirable (direct MMIO access too slow or needs
> to be mediated through a control processor). MPAM-fb standardises a
> protocol to abstract MSC accesses, building on the SCMI protocol.
> 
> Add functions that do an MSC read or write access by redirecting the
> request through a firmware interface. For now this done via an ACPI
> PCC shared memory and mailbox combination.
> 
> Since the protocol used is only a small subset of the full SCMI spec,
> and the SCMI protocol has no full ACPI support anyway, open-code the
> SCMI message generation and handshake, for just the fields we need.
> 
> [1] https://developer.arm.com/documentation/den0144/latest
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/resctrl/Makefile        |   2 +-
>  drivers/resctrl/mpam_devices.c  |  16 +++-
>  drivers/resctrl/mpam_fb.c       | 158 ++++++++++++++++++++++++++++++++
>  drivers/resctrl/mpam_fb.h       |  17 ++++
>  drivers/resctrl/mpam_internal.h |   5 +
>  include/linux/arm_mpam.h        |   2 +-
>  6 files changed, 196 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/resctrl/mpam_fb.c
>  create mode 100644 drivers/resctrl/mpam_fb.h
[...]
>  static inline void _mpam_write_partsel_reg(struct mpam_msc *msc, u16 reg, u32 val)
> diff --git a/drivers/resctrl/mpam_fb.c b/drivers/resctrl/mpam_fb.c
> new file mode 100644
> index 000000000000..bfb5798c74b0
> --- /dev/null
> +++ b/drivers/resctrl/mpam_fb.c
[...]
> +
> +#define SCMI_CHANNEL_FREE	true
> +#define SCMI_CHANNEL_BUSY	false
> +static int mpam_fb_wait_for_channel(struct pcc_mbox_chan *chan,
> +				    bool free)
> +{
> +	u32 status = free ? SCMI_CHAN_STATUS_FREE_BIT : 0;
> +	u32 val;
> +
> +	/*
> +	 * The channel should really be free always at this point, as we take
> +	 * a lock for every read or write request. Check the free bit anyway,
> +	 * for good measure and to catch corner cases.
> +	 */
> +	return readl_poll_timeout(chan->shmem + SCMI_CHAN_STATUS_OFS, val,
> +				  (val & SCMI_CHAN_STATUS_FREE_BIT) == status,
> +				  1, 10000);
> +}

What would be the reason to call mpam_fb_wait_for_channel() with
free=SCMI_CHANNEL_BUSY? I see that in this patch you always call it with
free=SCMI_CHANNEL_FREE.

Thanks,

Ben

> +
> +static int mpam_fb_send_request(struct mpam_msc *msc, u16 reg, u32 *result,
> +				bool is_write)
> +{
> +	unsigned int token = atomic_inc_return(&mpam_fb_token);
> +	struct pcc_mbox_chan *chan = msc->pcc_chan;
> +	u32 status;
> +	int ret;
> +
> +	guard(mutex)(&msc->pcc_chan_lock);
> +	ret = mpam_fb_wait_for_channel(chan, SCMI_CHANNEL_FREE);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Clear error bit and mark the channel as belonging to the callee */
> +	writel(0, chan->shmem + SCMI_CHAN_STATUS_OFS);
> +
> +	if (is_write)
> +		ret = mpam_fb_build_write_message(msc->mpam_fb_msc_id, reg,
> +						  *result, token, chan->shmem);
> +	else
> +		ret = mpam_fb_build_read_message(msc->mpam_fb_msc_id, reg,
> +						 token, chan->shmem);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = mbox_send_message(chan->mchan, NULL);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = mpam_fb_wait_for_channel(chan, SCMI_CHANNEL_FREE);
> +	if (ret)
> +		return ret;
> +
> +	status = readl(chan->shmem + SCMI_MSG_HEADER_OFS);
> +	if (FIELD_GET(MPAM_MSC_TOKEN_MASK, status) != token)
> +		return -ETIMEDOUT;
> +
> +	ret = readl(chan->shmem + SCMI_MSG_PAYLOAD_OFS + 0x0);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!is_write)
> +		*result = readl(chan->shmem + SCMI_MSG_PAYLOAD_OFS + 0x4);
> +
> +	return 0;
> +}
> +
> +int mpam_fb_send_read_request(struct mpam_msc *msc, u16 reg, u32 *result)
> +{
> +	return mpam_fb_send_request(msc, reg, result, false);
> +}
> +
> +int mpam_fb_send_write_request(struct mpam_msc *msc, u16 reg, u32 value)
> +{
> +	return mpam_fb_send_request(msc, reg, &value, true);
> +}



