Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1943DC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 10:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8K3r8L/Bua+iuxI4/C5z6TTECLdRO3P7GD0bHldJWMc=; b=GiiEGYBR0KiGjEMVUp8v1ovyvS
	edxt6XAT6uv+ZnoW7JMsXvjb9BL32ZVCaibeWyvpACeDtw5RmaFEoG286E/jIUsE3y24ljaa15CGA
	eODTIw3FSDT3EYxWFoigXr+mxfqpHjrQFZk/v3mpbImnIHCgstFXbJ8R3hGfBRpmDcRrN0FJT5jN6
	eyRq5inHW4sTiyUtd1SM1OjzOMkK+XE5DQL1NjMQneZRrL6sScTMFPfNK614KNceuKI/PJA8PBqd3
	8+IDOfZdrSqpgwDb1K0R2GbX2kRruZIgkHWg3tAM4uVZy3CCvz9vY+d8e714iuuOtyDBGp0FH8+/G
	yyrzuvuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnaiJ-00000006w7r-3mwn;
	Thu, 27 Feb 2025 10:01:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnaf4-00000006vgf-3nSt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 09:58:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D7972BCC;
	Thu, 27 Feb 2025 01:58:49 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36ECE3F673;
	Thu, 27 Feb 2025 01:58:31 -0800 (PST)
Date: Thu, 27 Feb 2025 09:58:28 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, oliver.upton@linux.dev,
	snehalreddy@google.com, suzuki.poulose@arm.com,
	vdonnefort@google.com, will@kernel.org, yuzenghui@huawei.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH 2/3] KVM: arm64: Map the hypervisor FF-A buffers on ffa
 init
Message-ID: <Z8A3RLoZxVxcz3wj@bogus>
References: <20250226214853.3267057-1-sebastianene@google.com>
 <20250226214853.3267057-3-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226214853.3267057-3-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_015834_982775_D295F67C 
X-CRM114-Status: GOOD (  13.86  )
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

On Wed, Feb 26, 2025 at 09:48:52PM +0000, Sebastian Ene wrote:
> Map the hypervisor's buffers irrespective to the host and return
> a linux error code from the FF-A error code on failure. Remove
> the unmap ff-a buffers calls from the hypervisor as it will
> never be called and move the definition of the
> ffa_to_linux_error map in the header where it should belong to.
> Prevent the host from using FF-A if the hypervisor could not
> map its own buffers with Trustzone.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c     | 46 ++++++++++++-------------------
>  drivers/firmware/arm_ffa/driver.c | 24 ----------------
>  include/linux/arm_ffa.h           | 24 ++++++++++++++++

Can you post the code movement from driver to the header as separate patch
so that I can take it separately to avoid conflicts with the other changes
I have. It could be just fine but I see no reason as why it can't be a
separate change or why it needs to be bundled here.

-- 
Regards,
Sudeep

