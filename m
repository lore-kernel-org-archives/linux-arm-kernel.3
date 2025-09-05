Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2853ACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8XOvxlNGGHJoLa5Vx3ErGAvajcQpTrIPeSJD9PSV10=; b=z6cNOVNlziTSeZ/a0QEY8SZmci
	IPQ/BTXAtYiLwrDBmS0k0nHIQwJWARLTDZe5cE2ijR3Wk1Ws1MaHTJ4puniOnSPSfKwCLIX7m26iD
	yCigqiYjv4Ro/FZCi+uTkhtEe6UfChivyZSoyq4Ycfo9ZOpq9FnaqxzvJByzLj4LoN9z32HuUkyRY
	viGDSArKpgHQmI//q4j5geeDX8B6dMEqgvUPBtNAK+Fv6zpKsQ0w1qnDQ2Z+9M7S69PGuHO+7Oqto
	wk/mz5U7VKoVcTPDzRBnyUyc5k1B51mJjbN/3M+qdEX8WW6XS+Gb5u4OOh8s+f5wBxZRnzuCVTX8E
	oqo3Vejw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXVw-00000002LRY-1DyV;
	Fri, 05 Sep 2025 14:34:08 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSwj-00000000oBv-1Zhp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 09:41:30 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757065285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G8XOvxlNGGHJoLa5Vx3ErGAvajcQpTrIPeSJD9PSV10=;
	b=A0w1z7DvZDe/KnnN8T47etkJWRrtB7CkxzLUmCf1ShOOB8lFX8wDeJXi1ugCG1FJhJefr9
	U2wt/iIG9rpMMNbnFIhKpGQuEkh0GTYwSl40cwe4pQCXwCveOhw61iPR4gI6kfMy4QYOso
	n+6fS1vUo9rUYzAQBRzvzdopdVM2IuI=
From: Oliver Upton <oliver.upton@linux.dev>
To: maz@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	catalin.marinas@arm.com,
	will@kernel.org,
	Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [PATCH v2 0/2] KVM: arm64: VHE: Debug fixes
Date: Fri,  5 Sep 2025 02:41:07 -0700
Message-Id: <175706523474.1669883.3863665313729519721.b4-ty@linux.dev>
In-Reply-To: <20250902130833.338216-1-alexandru.elisei@arm.com>
References: <20250902130833.338216-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_024129_559700_DE5CA8C2 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
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

On Tue, 02 Sep 2025 14:08:31 +0100, Alexandru Elisei wrote:
> This is v2 of the patch that zeroes PMSCR_EL1 [1] at boot, hopefully now it's
> not as bad.
> 
> Picked up another fix - patch #2 ("KVM: arm64: VHE: Save and restore host
> MDCR_EL2 value correctly") is new.
> 
> [1] https://lore.kernel.org/kvmarm/20241106122654.38234-1-alexandru.elisei@arm.com/
> 
> [...]

I squashed the suggestion into the second patch.

Applied to fixes, thanks!

[1/2] KVM: arm64: VHE: Initialize PMSCR_EL1
      https://git.kernel.org/kvmarm/kvmarm/c/e643542c7160
[2/2] KVM: arm64: VHE: Save and restore host MDCR_EL2 value correctly
      https://git.kernel.org/kvmarm/kvmarm/c/2f67b9a64842

--
Best,
Oliver

