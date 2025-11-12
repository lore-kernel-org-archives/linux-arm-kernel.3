Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF62CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 09:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a29YBaP4YKzKr6oZ9BnFwEDbbaSJAxD7zBPkyy//rU0=; b=buVs1gD9kKLfxAgSowO7NJyO3x
	3C+s0MwdOgFeNOIIyJmui6NHKqfvuZ6AjskHQrb+xilQJOFxL4HnBQyOMXD+r2EpLYLX0S58ML1ot
	OzH0wlZo38qUF1HMQRmbgT/R+jkc4i2AbaJpSVLhks1IKNRbs/mtQSHE8ET3JPHiTj2FZknrCK7q7
	xFTAR1V1yK+LF85xUlOFcpx8+cgYK/SlnUNFmjujAwcY+8k7wOADeO1wCR6R0QqPP3rzu0pkugpRy
	qGn3ykVWHEkcjPy3i/aDtPJYx6jo8TluSJgLbDbWNRdgE3C7P+L2OHIRtfgN6dXFMd7fKR/ze8N/a
	1Da8vY7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7KH-00000008U7V-1rcC;
	Wed, 12 Nov 2025 09:39:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7KE-00000008U71-3Uwg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 09:39:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8139B1515;
	Wed, 12 Nov 2025 01:39:29 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF8CE3F66E;
	Wed, 12 Nov 2025 01:39:35 -0800 (PST)
Message-ID: <ac271094-97f5-49d1-85cf-4450e60d44b2@arm.com>
Date: Wed, 12 Nov 2025 09:39:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] KVM: arm64: Fix MTE flag initialization for
 protected VMs
To: Fuad Tabba <tabba@google.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 catalin.marinas@arm.com, vladimir.murzin@arm.com
References: <20251112092051.1376245-1-tabba@google.com>
 <20251112092051.1376245-4-tabba@google.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251112092051.1376245-4-tabba@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_013938_914345_B1211DF3 
X-CRM114-Status: GOOD (  12.56  )
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

Hi Fuad,

On 11/12/25 09:20, Fuad Tabba wrote:
> The function pkvm_init_features_from_host() initializes guest
> features, propagating them from the host. The logic to propagate
> KVM_ARCH_FLAG_MTE_ENABLED (Memory Tagging Extension)
> has a couple of issues.
> 
> First, the check was in the common path, before the divergence for
> protected and non-protected VMs. For non-protected VMs, this was
> unnecessary, as 'kvm->arch.flags' is completely overwritten by
> host_arch_flags immediately after, which already contains the MTE flag.
> For protected VMs, this was setting the flag even if the feature is not
> allowed.
> 
> Second, the check was reading 'host_kvm->arch.flags' instead of using
> the local 'host_arch_flags', which is read once from the host flags.
> 
> Fix these by moving the MTE flag check inside the protected-VM-only
> path, checking if the feature is allowed, and changing it to use the
> correct host_arch_flags local variable. This ensures non-protected VMs
> get the flag via the bulk copy, and protected VMs get it via an explicit
> check.
> 
> Fixes: b7f345fbc32a ("KVM: arm64: Fix FEAT_MTE in pKVM")
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---

LGTM

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben


