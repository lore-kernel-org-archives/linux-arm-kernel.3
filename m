Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634B9CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9XmIXBCOkiOI7RlyM3G8//FcG/Gp0aO++wK6DT9wAU=; b=q5BqaemzEroDFF1bo8+k/2MPF1
	KZBkyoaCGStkpOqUH465zNn8jvjf6AOfWkHu9Iii7ZkL53qVULPbzGEK0jIdBkgMtVgNOHmwdCBk1
	NsfNWytWDQ1DogLT00QLon7/Oh094hR9PtZvyHstvtM1qdnShW3bmsNru4IBr6CvF9Hy48uSGjmKD
	TswPmxTauKBa+2ZSvH42NrRDR298Lvm92sBEcEzFhCt7aBFLADdG88qx1eoS6FSPr63S2yWIib/GG
	/gCptJvd/YkDivgt9b0otbfGbSYd2AXHam2SDzxYCAdvxSYZb4b1aTEcvctCYChS/8vmabeZuQ4ic
	OoXuj0nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtJL-0000000EPXV-2qzG;
	Mon, 20 Oct 2025 17:04:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtJK-0000000EPX8-0tpc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 17:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=f9XmIXBCOkiOI7RlyM3G8//FcG/Gp0aO++wK6DT9wAU=; b=U7aNpCjVgC0Bw/Zl70QOw6EW/U
	8nXaW6rv5dB4Sg5Rs9fUcGfnn+Au+U/cwco48irijdfpTNU2kz7hkVi2E9TU2TpVr+HXKeXACskE9
	2wiRDWTF7fAkVdVKvvr3yo9vRbiJ0V3EBeqP7qjDFX8a3Soy3lYto5ZzriMlGkebwCa1U8oteA+1R
	oelKhPX/6jj0X5OR+MoT4SwlIuiaRaCcMaAJW9fnUIvapD1RFPm38EqeKXygzQWGYUA2SfUT/HRhR
	ZFw2sKYNxf5e1LtO8V8xf3mzY20tgOHaOzvuc8a/vFPRAAKo1d0h2Zq6//5izJO7NsqPZp0oB8x/g
	GCv91hlg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAsRa-000000001ex-1VAB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 16:09:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C22391007;
	Mon, 20 Oct 2025 10:04:27 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B8AF3F66E;
	Mon, 20 Oct 2025 10:04:30 -0700 (PDT)
Message-ID: <9ad95fa5-6f1d-4c31-a6c6-41c1e9cc5c20@arm.com>
Date: Mon, 20 Oct 2025 18:04:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/29] arm_mpam: Allow configuration to be applied and
 restored during cpu online
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Gavin Shan <gshan@redhat.com>
References: <20251017185645.26604-1-james.morse@arm.com>
 <20251017185645.26604-21-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251017185645.26604-21-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_170910_729515_DF7526B1 
X-CRM114-Status: GOOD (  21.88  )
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

Hi James,

On 10/17/25 19:56, James Morse wrote:
> When CPUs come online the MSC's original configuration should be restored.
> 
> Add struct mpam_config to hold the configuration. This has a bitmap of
> features that were modified. Once the maximum partid is known, allocate
> a configuration array for each component, and reprogram each RIS
> configuration from this.
> 
> CC: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> ---
> Changes since v2:
>  * Call mpam_init_reset_cfg() on alloated config as 0 is not longer correct.
>  * init_garbage() on each config - the array has to be freed in one go, but
>    otherwise this looks weird.
>  * Use struct initialiser in mpam_init_reset_cfg(),
>  * Moved int err definition.
>  * Removed srcu lock taking based on squinting at the only caller.
>  * Moved config reset to mpam_reset_component_cfg() for re-use in
>    mpam_reset_component_locked(), previous memset() was not enough since zero
>    no longer means reset.
> 
[...]
>  
> +struct reprogram_ris {
> +	struct mpam_msc_ris *ris;
> +	struct mpam_config *cfg;
> +};
> +
> +/* Call with MSC lock held */
> +static int mpam_reprogram_ris(void *_arg)
> +{
> +	u16 partid, partid_max;
> +	struct reprogram_ris *arg = _arg;
> +	struct mpam_msc_ris *ris = arg->ris;
> +	struct mpam_config *cfg = arg->cfg;
> +
> +	if (ris->in_reset_state)
> +		return 0;
> +
> +	spin_lock(&partid_max_lock);
> +	partid_max = mpam_partid_max;
> +	spin_unlock(&partid_max_lock);
> +	for (partid = 0; partid <= partid_max + 1; partid++)

Loop overrun. This was correct in the previous version of the patch and
the same shape of loop is done correctly elsewhere in this version. I
think it would be good to standardise on using either:
partid <= partid_max
or
partid < partid_max + 1
I have a preference for the first as you don't need to think about the
size of the type.

-- 
Thanks,

Ben


