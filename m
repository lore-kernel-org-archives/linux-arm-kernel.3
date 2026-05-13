Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133F6CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 17:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEMJ782kQaUvl7mIWqMka7qxprBIvzHiqamcTzuZbCM=; b=pNumrw6BnFYibwbtqSgEGSYv8a
	yZNulHARNESiCm8fZWWeN4DuBZMV7x+XeC+mGXrxa/EOZ0F0JvO8oOF93gxZejKKpSYk239oJyZOb
	Nd+TIL9CtqU28RiClEU6fnXbifmv4QXmpuePjDpthG0zDIZa91v8IZ/fOg+jAeMh4314ifCjw+Rde
	JBTDZIQqWxmud0wN8l/5awWAOdmH0XkvoOWmXSiM8TonTJbe5neEfo+4mDnn5fAOU05DLeWND8Ynl
	v0i0UEBOxI3FvrFbXAMXn2217ItS6ferwrTiGBLNOrKS99nkr+g8rktOFIzKu7z7W5W4q8JKtIGRJ
	+kgB054w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDJF-00000003LLu-4AdZ;
	Wed, 13 May 2026 17:23:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDJF-00000003LLX-1jG2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 17:23:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 869CD6012A;
	Wed, 13 May 2026 17:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651B7C2BCB7;
	Wed, 13 May 2026 17:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778693028;
	bh=bVCUB+XEkZ4ZZOEMStNH8O+vVXyBxeWbiKPyxemPMoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AKKGdtbP2IKmlSlB/reSdavwF9cRGIGy/x+5lin8na7Xy3QaAhy82iwgCj4ObYrrF
	 lPbtThIyK2Toh7Hvxenq+NZB2Kscd1J9UrtdiDL80aoOUK7+/Q5w6bD0dZAeggDk2A
	 YMNoM57+WSWlCJxJ6RCelyJxDa3HUCY94Xh+uWxHkj1We4sK9hn0W2S6rd8Mej3/U+
	 /7OsGzJX9FaUyKhUyFTp1QfltlBxBmzgrDTsLnbboqLZvf8Uh7smupTvRbhCLcsktA
	 S7ffRftzKjWsmjPwocyv6KgzFWGyo3NYlD3/8h/f8RzTiRb9mehDZF8AjBGwqPrzX1
	 cthG00VUIrhNA==
Date: Wed, 13 May 2026 18:23:43 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, will@kernel.org,
	joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, mrigendra.chaubey@gmail.com,
	perlarsen@google.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH v3 0/2] arm_ffa, KVM: Fix FF-A emad offset calculations
Message-ID: <20260513-ludicrous-beautiful-cuttlefish-34271d@sudeepholla>
References: <20260512124442.1899107-1-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512124442.1899107-1-sebastianene@google.com>
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

On Tue, May 12, 2026 at 12:44:40PM +0000, Sebastian Ene wrote:
> Hi all,
> 
> This series fixes the Endpoint Memory Access Descriptor (EMAD) offset calculations
> and adds the necessary bounds checks for both the core FF-A driver and the pKVM
> hypervisor.
> 
> Prior to FF-A version 1.1, the memory region header didn't specify an explicit offset
> for the EMADs, leading to the assumption that they immediately follow the header.
> However, from v1.1 onwards, the specification dictates using the `ep_mem_offset` field
> to determine the start of the memory access array.
> 
> The patches in this series address this by:
> 1. Updating the core `arm_ffa` firmware driver to correctly calculate the descriptor
>    offset using `ep_mem_offset` rather than defaulting to `sizeof(struct ffa_mem_region)`.
>    It also introduces bounds checking against `max_fragsize`.
> 2. Enhancing the pKVM hypervisor validation logic to no longer strictly enforce that
>    the descriptor strictly follows the header, aligning it with the driver behavior
>    and the FF-A specification, while also ensuring the offset falls within the mailbox
>    buffer bounds.
>

Looks good apart from the minor nits, but how do you plan to route these
changes as they are dependent for functionality but not for the build IIUC.

I don't think I have any conflicting change so far, so it can go along with
other pKVM changes. Let me know.

> Changelog
> #########
> 
> v2 -> this:
> - Fixed typo in nvhe/ffa.c (missing sizeof)
> 
> v1 -> v2:
> - For pKVM, removed the strict placement enforcement for `ep_mem_offset` as it is not
>   compliant with the spec, and avoids making assumptions about the driver's memory
>   layout.
> 
> Link to:
> ########
> 
> v2: https://lore.kernel.org/all/20260430160241.1934777-1-sebastianene@google.com/
> v1: https://lore.kernel.org/all/ae9KN9nkOgDYJcGP@google.com/T/#t
> 
> Sebastian Ene (2):
>   firmware: arm_ffa: Fix Endpoint Memory Access Descriptor offset
>     calculation
>   KVM: arm64: Validate the offset to the mem access descriptor
> 
>  arch/arm64/kvm/hyp/nvhe/ffa.c     | 24 ++++++++++++++++++------
>  drivers/firmware/arm_ffa/driver.c | 14 ++++++++++----
>  include/linux/arm_ffa.h           |  2 +-
>  3 files changed, 29 insertions(+), 11 deletions(-)
> 
> -- 
> 2.54.0.563.g4f69b47b94-goog
> 

-- 
Regards,
Sudeep

