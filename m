Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D46C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 17:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayRwvzgAh4SnVASswlH+xNoCzewLIlYOtXUUrA327pI=; b=b6wDeDJ8lMmAj5bP9N7U4WSGlJ
	Cwh0zVx+8q5UCQFNv25h6MjhvqKMw6ohyJ/LmKOLdKP41lnk6ZaOlueE3Qjkzuo0MHBAl2CddskEu
	hl9xJ7VTmoZ2Fwynmk0Uuj9q4KLXPAkZCUEKCD5c5vIdQbhHRHzgbtsD3F7jcpBCC9CiQ7rAnYSmB
	HAnSWrzgMseLMzfmG7K/4gQ09QtCgaK4z16vpSQWcowhKW0j7zIp0s1pU3oJPLTHa1OhMxTZxgS2R
	KU2SeiJEi8aDdDb+DpHul0VsKRTi5brDJJFxnIONvH4gj7fWUyPxT1te/7mp3BdVVcHDGaKDzCNWV
	5EERXHCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcSuN-00000002sgL-0Wu2;
	Mon, 27 Jan 2025 17:28:23 +0000
Received: from out-188.mta1.migadu.com ([2001:41d0:203:375::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcSsH-00000002sSj-28op
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 17:26:15 +0000
Date: Mon, 27 Jan 2025 09:26:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737998771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ayRwvzgAh4SnVASswlH+xNoCzewLIlYOtXUUrA327pI=;
	b=MRz5Y2D9/SPAeNFeAr85vntgZyVtpA6aO5tivSaAAdT9B/joUFn4JfYJxrChk42V2OOgom
	lj3vjgwD8NKTyK5KUTjtcnAMuOC8pUqKdWzfpUSfHd0hjTe3LKO4B+cy+CmOp9w4cUcwC1
	SRo65tC11tYVboIE1sxi9FKbqRcTt3w=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: kvmarm@lists.linux.dev, maz@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, cohuck@redhat.com,
	eric.auger@redhat.com, sebott@redhat.com, yuzenghui@huawei.com,
	wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
	jonathan.cameron@huawei.com, anthony.jebson@huawei.com,
	linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Subject: Re: [PATCH v5 2/4] KVM: arm64: Introduce hypercall support for
 retrieving target implementations
Message-ID: <Z5fBrFVIs0jOiR9W@linux.dev>
References: <20250124151732.6072-1-shameerali.kolothum.thodi@huawei.com>
 <20250124151732.6072-3-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124151732.6072-3-shameerali.kolothum.thodi@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_092614_062867_5964C004 
X-CRM114-Status: GOOD (  17.06  )
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

On Fri, Jan 24, 2025 at 03:17:30PM +0000, Shameer Kolothum wrote:
> If the Guest requires migration to multiple targets, these hypercalls
> will provide a way to retrieve the target CPU implementations from
> the user space VMM.
> 
> Subsequent patch will use this to enable the associated errata.
> 
> Suggested-by: Oliver Upton <oliver.upton@linux.dev>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  Documentation/virt/kvm/arm/hypercalls.rst | 59 +++++++++++++++++++++++
>  include/linux/arm-smccc.h                 | 15 ++++++
>  2 files changed, 74 insertions(+)
> 
> diff --git a/Documentation/virt/kvm/arm/hypercalls.rst b/Documentation/virt/kvm/arm/hypercalls.rst
> index af7bc2c2e0cb..718725cbf6c7 100644
> --- a/Documentation/virt/kvm/arm/hypercalls.rst
> +++ b/Documentation/virt/kvm/arm/hypercalls.rst
> @@ -142,3 +142,62 @@ region is equal to the memory protection granule advertised by
>  |                     |          |    +---------------------------------------------+
>  |                     |          |    | ``INVALID_PARAMETER (-3)``                  |
>  +---------------------+----------+----+---------------------------------------------+
> +
> +``ARM_SMCCC_VENDOR_HYP_KVM_DISCOVER_IMPL_VER_FUNC_ID``
> +-------------------------------------------------------
> +Request the target CPU implementation version information and the number of target
> +implementations for the Guest VM.
> +
> ++---------------------+-------------------------------------------------------------+
> +| Presence:           | Optional;  KVM/ARM64 Guests only                            |
> ++---------------------+-------------------------------------------------------------+
> +| Calling convention: | HVC64                                                       |
> ++---------------------+----------+--------------------------------------------------+
> +| Function ID:        | (uint32) | 0xC6000040                                       |
> ++---------------------+----------+--------------------------------------------------+
> +| Arguments:          | None                                                        |
> ++---------------------+----------+----+---------------------------------------------+
> +| Return Values:      | (int64)  | R0 | ``SUCCESS (0)``                             |
> +|                     |          |    +---------------------------------------------+
> +|                     |          |    | ``NOT_SUPPORTED (-1)``                      |
> +|                     +----------+----+---------------------------------------------+
> +|                     | (uint64) | R1 | Bit[63] Must be zero                        |
> +|                     |          |    +---------------------------------------------+

Why? R0 is sufficient to determine if the hypercall was successful, and
this is already defined as an unsigned quantity to the guest.

> +|                     |          |    | Bits [62:32] Major version                  |
> +|                     |          |    +---------------------------------------------+
> +|                     |          |    | Bits [31:0] Minor version                   |
> +|                     +----------+----+---------------------------------------------+

Do we really need a full u64 of version information? If you collapse
this down to a u32 it'd align with the versioning scheme for PSCI /
SMCCC.

-- 
Thanks,
Oliver

