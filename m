Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F65D10399
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 01:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbVgZw7rn3qGcaKG7VGgStY+XOz4C32vFUVkMj/8HwI=; b=AnpA3achXsHfLCz1aie7sEirnU
	CAl3Ak5vMYOPMQnr7BAc+QTDj9N/Tup0h8gp6tOGxd1a7nD0XG+5MIxQ2G0ntvTrYeaePYbIAO1RQ
	egOEYHXymaM/qrAu7snMuL3QlQWfNXKVse7AvzMbFiWo22527PagZWNY3XXzyU3zdU5BMAtqXLZJA
	n6c3iPjteWSKTYmSz7ILxKiMH+lCExZ3CwpTTSHS/yV+Y6Shg5iNw7tRLeOnUFjOWEXYuO65KUX/N
	gVxIFwMNKdzhBB0o46Qf/ZuZ2Zei9w5P/ErzfBRDzFSpzAHGPh7AiDsHlVWAftDQYSulGwo3XqAEl
	g3StiVzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t497n-00000002C01-2TPS;
	Fri, 25 Oct 2024 01:28:23 +0000
Received: from out-175.mta0.migadu.com ([2001:41d0:1004:224b::af])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t495m-00000002Bnh-0iHp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 01:26:20 +0000
Date: Thu, 24 Oct 2024 18:25:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729819574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LbVgZw7rn3qGcaKG7VGgStY+XOz4C32vFUVkMj/8HwI=;
	b=DcfmS8+VrSpd0LFYtcWnb7KKcDO7ABI/h87NsY/f60XLm/GpI7R+hGNkifm/2CPH9O0doR
	YIvzvtnlahSAzLst29DQzaaj/bZQTRsCSvMmLmuhWbviSm01lamoqzF65C3UkYQw3BcbAh
	FC763oyUU5mnnqz0aKoET/15rUSxF68=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: kvmarm@lists.linux.dev, maz@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, cohuck@redhat.com,
	eric.auger@redhat.com, yuzenghui@huawei.com,
	wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
	jonathan.cameron@huawei.com, anthony.jebson@huawei.com,
	linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Subject: Re: [RFC PATCH v2 1/3] KVM: arm64: Add hypercall support for
 retrieving migration targets
Message-ID: <ZxrzhAh3qE9hLV-U@linux.dev>
References: <20241024094012.29452-1-shameerali.kolothum.thodi@huawei.com>
 <20241024094012.29452-2-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024094012.29452-2-shameerali.kolothum.thodi@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_182618_543968_560541AC 
X-CRM114-Status: GOOD (  22.21  )
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

Hi,

On Thu, Oct 24, 2024 at 10:40:10AM +0100, Shameer Kolothum wrote:
> +``ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_NUM_FUNC_ID``
> +------------------------------------------------------
> +
> +Query total number of migration target CPUs the Guest VM will be running during its
> +lifetime and version information applicable to the data format used for
> +``ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_CPUS_FUNC_ID``. The maximum number of targets
> +supported is 64. Also the version number supported currently is 1.0. This hypercall
> +must be handled by the userspace VMM.
> +
> ++---------------------+-------------------------------------------------------------+
> +| Presence:           | Optional; KVM/ARM64 Guests only                             |
> ++---------------------+-------------------------------------------------------------+
> +| Calling convention: | HVC64                                                       |
> ++---------------------+----------+--------------------------------------------------+
> +| Function ID:        | (uint32) | 0xC600007D                                       |
> ++---------------------+----------+--------------------------------------------------+
> +| Arguments:          | None                                                        |
> ++---------------------+----------+----+---------------------------------------------+
> +| Return Values:      | (int64)  | R0 | ``NOT_SUPPORTED (-1)`` on error, else       |
> +|                     |          |    | [0-31] total migration targets              |
> +|                     |          |    | [32-63] version number                      |
> ++---------------------+----------+----+---------------------------------------------+

We can't treat a single register as both a signed quantity *and* a full
64 bits of bitfields. Maybe just scrap the version and have this thing
either return a negative error or positive quantity of implementations.

> +``ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_CPUS_FUNC_ID``
> +-------------------------------------------------------
> +
> +Request migration target CPU information for the Guest VM. The information must be
> +provided as per the format described by the version info in
> +``ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_NUM_FUNC_ID``. At present, we only support
> +the below format which corresponds to version 1.0. This hypercall will always be
> +preceded by ``ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_NUM_FUNC_ID`` and may be
> +invoked multiple times to retrieve the total number of target CPUs information
> +advertised. This hypercall must be handled by the userspace VMM.
> +
> +A typical userspace usage scenario will be like below:
> +
> +1. Receives ``ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_NUM_FUNC_ID``
> +
> +   * Returns total number of migration targets and version number
> +   * Reset current target index to zero
> +2. Receives ``ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_CPUS_FUNC_ID``
> +
> +   * Returns MIDR/REVIDR info in return register fields. Can return up to 4
> +   * Update current target index based on returned target info
> +   * If there are remaining register fields, return zero to indicate the end
> +   * Repeat step 2 until current target index == total number of migration targets

Hmm... I'd rather we make the guest supply the target index of the
implementation it wants to discover. Otherwise, the VMM implementation
of this hypercall interface is *stateful* and needs to remember to
migrate that...

> ++---------------------+-------------------------------------------------------------+
> +| Presence:           | Optional; KVM/ARM64 Guests only                             |
> ++---------------------+-------------------------------------------------------------+
> +| Calling convention: | HVC64                                                       |
> ++---------------------+----------+--------------------------------------------------+
> +| Function ID:        | (uint32) | 0xC600007E                                       |
> ++---------------------+----------+----+---------------------------------------------+
> +| Arguments:          | None                                                        |
> ++---------------------+----------+----+---------------------------------------------+
> +| Return Values:      | (int64)  | R0 | ``NOT_SUPPORTED (-1)`` on error, else       |
> +|                     |          |    | [0-31] MIDR, [31-63] REVIDR, else           |
> +|                     |          |    | [0-63] Zero to mark end.                    |
> ++---------------------+----------+----+---------------------------------------------+

Same deal here, x0 needs to always be treated as a signed quantity.

How about -1 on error, 0 on success?

Then, in the remaining registers:

> +|                     | (uint64) | R1 | [0-31] MIDR, [32-63] REVIDR, else           |
> +|                     |          |    | [0-63] Zero to mark end.                    |
> ++---------------------+----------+----+---------------------------------------------+

Both MIDR_EL1 and REVIDR_EL1 are 64 bit registers in AArch64. So we need
to transfer a full 64 bits, even if the top half is _presently_ RES0 in
MIDR_EL1.

> +|                     | (uint64) | R2 | [0-31] MIDR, [32-63] REVIDR, else           |
> +|                     |          |    | [0-63] Zero to mark end.                    |
> ++---------------------+----------+----+---------------------------------------------+
> +|                     | (uint64) | R3 | [0-31] MIDR, [32-63] REVIDR, else           |
> +|                     |          |    | [0-63] Zero to mark end.                    |
> ++---------------------+----------+----+---------------------------------------------+

I think it's fine to have this hypercall return a single MIDR/REVIDR
pair at a time. This is not a performance sensitive interface and will
only be called a few times at boot.

Actually -- what if we crammed everything into a single hypercall?

DISCOVER_IMPLEMENTATION_FUNC_ID

 - Arguments:
   - arg0: selected implementation index

 - Return value:
   - r0: -1 on error, otherwise the maximum possible implementation index
   - r1: MIDR_EL1 of the selected implementation
   - r2: REVIDR_EL1 of the selected implementation

We're guaranteed at least one CPU implementation of course, so the guest
can just start w/ index 0 and iterate from there.

-- 
Thanks,
Oliver

