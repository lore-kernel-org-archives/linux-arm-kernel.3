Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95028C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 14:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pa5U0Y6JtQqIIHTTjOiRXiO4ANEKnjtunNfzdvWTsGc=; b=Vc2JkyXBo5T5SCgCjxPZfw6vi0
	YIZeZ1g0ro7lumabFizZHxxZxktt+OvCBN2YqQc0M8OZ+WTPg5atDJ2MzePHTnntCNb6XhJE44/gZ
	rZ0Okfh7uZaFik1CvFgI8vDH4dMLJmU4+zxaS9QHUQHS8oJUCBlVYQSPcl4QpZVKOjiSATW3JZBUA
	U5w/P5LAxtPdIshd7VOF+ZEstBFQdpQoCF+PodAxFsTUM4V6j2Q3ExRItcJawtHB/0GhDmSPPUVaF
	EbkQlHhy5UcXbihBP+V0mlyT7NeMO6ZsnI8/KMx6kWkL83I2XLC40r3KpnWP142INnfYyfRvKQNhq
	ZZwBTPxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy8sP-0000000FPsc-0x5k;
	Sun, 23 Aug 2026 14:08:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy8sL-0000000FPsF-48Iv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 14:08:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40E43176C;
	Sun, 23 Aug 2026 07:08:36 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A2D03F85F;
	Sun, 23 Aug 2026 07:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787494120; bh=f7K+M8Y4LLo9/DdnAcAfRgVV96waH6Z2WMNIZYEsknA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMsWpfNRMMvAxgnC7Ad5Wunk90Ikd00hJyKHV1fHVOG1/SL9XRuzXKdlyI4a2HGUx
	 J9OuKXpReUI3EUBP2KObIkn3lHxc6+eYRbs+T/mcjSaTqSkaRPTSC/9gwGq4wI+JTy
	 F83U8FI4+j+UwvWTgalP07FVejPiqRW0Sp2RLYkc=
Date: Sun, 23 Aug 2026 15:07:38 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, ljs@kernel.org, 
	Shen Yongchao <grayhat@foxmail.com>, Karl Mehltretter <kmehltretter@gmail.com>
Subject: Re: [PATCH v3 0/2] KVM: arm64: nv: Shadow S2 life-cycle fixes
Message-ID: <dwwsihz275bzh2ykt7rxj3sdq5wdorqju2fso6o3jf6sn6sxrx@nua7yri24fjc>
References: <20260821161829.1032561-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821161829.1032561-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_070842_094895_A574887C 
X-CRM114-Status: GOOD (  13.62  )
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

On Fri, Aug 21, 2026 at 05:18:27PM +0100, Marc Zyngier wrote:
> This is the (hopefully) last revision for this set of fixes for the
> shadow S2 life cycle.
> 
> * From v2 [1]
> 
>   - Fixed the nonsensical type used for allocating the nested S2
>     array, switching to kvmalloc_objs() in the process, guaranteeing
>     some level of type checking
> 
>   - Dropped the extra S2 freeing after Wei-Lin pointed out that we are
>     guaranteed to run the MMU notifier release callback, ensuring that
>     nothing is left behind
> 
>   - Collected AB from Lorenzo, with thanks.
> 
> [1] https://lore.kernel.org/all/20260814103230.858578-1-maz@kernel.org/
> 
> Marc Zyngier (2):
>   KVM: arm64: nv: Fix life cycle of the nested_mmus array
>   KVM: arm64: nv: Delay freeing of shadow S2 structures until VM
>     destruction
> 
>  arch/arm64/include/asm/kvm_host.h   |   2 +-
>  arch/arm64/include/asm/kvm_nested.h |   3 +-
>  arch/arm64/kvm/arm.c                |   8 ++-
>  arch/arm64/kvm/nested.c             | 100 ++++++++++++++--------------
>  4 files changed, 58 insertions(+), 55 deletions(-)
> 
> -- 
> 2.47.3
> 

Reviewed-by: Wei-Lin Chang <weilin.chang@arm.com>

