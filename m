Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCFAC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 14:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02ejqLzHSn8NaRcENvH0JBFJHjb3ZKSMPAsJ9eicw1M=; b=IAsVO2sBMLIi/k/G2/Y2iXOPCM
	aLBm6MtpqZwOBjWhnaCIMqU8PvNDKl1zIDyZUAZsqbdpqCfUwcjexR8ScYto4Dv6MCHmQHf/LyQJU
	PVNRcToeXgvG8DgW1cAhL1RhKVvPpop/KHeQtETJao2yAHuRJXoi0x7UrMwmibvcI4ROy/jHXwtl9
	B1wakR3bBPklx1GHCi3gEFg5Z5PlRE+qEX3mEn10c/NbB0//k76Z4UNNW46f/xb8dbFlzvrvPV0V0
	LxeoTq8jcWLbgzOuZ6O3iYvsqmioZx+WWMkursthgKM4uqNzz9dPyKjZDnwbnO35wAJcOPB30OnUn
	SQa9eN1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy8vK-0000000FQ3O-2SXL;
	Sun, 23 Aug 2026 14:11:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy8vI-0000000FQ36-0I6r
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 14:11:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59E5B1756;
	Sun, 23 Aug 2026 07:11:39 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E82AA3F85F;
	Sun, 23 Aug 2026 07:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787494303; bh=AyfgfvLgQ9A0Z6I7mjhvW+PLd9XuvJuK1ro6+adR6ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JMHEa7DQF8ibFmNHUBZUnV+oAyuiPWBgVk+DZV2lAR5W9UsECi8dTn+LW7p4fLMRP
	 WDEN1BeBTdYXjejRLFAV3zLlSwD+MktEC55977rh0oqtITCLSE3iEtqmm7OyG7mOHb
	 X7xbdI22x/LC+FSafNp7UO8pAhU7xISh0nIaP1t0=
Date: Sun, 23 Aug 2026 15:11:31 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, ljs@kernel.org, 
	Shen Yongchao <grayhat@foxmail.com>, Karl Mehltretter <kmehltretter@gmail.com>, 
	stable@vger.kernel.org
Subject: Re: [PATCH v3 2/2] KVM: arm64: nv: Delay freeing of shadow S2
 structures until VM destruction
Message-ID: <myjs4ge5zolj4drqql7lewoazu6simr32acdgi3jgy65quolhc@amx3hctoyuth>
References: <20260821161829.1032561-1-maz@kernel.org>
 <20260821161829.1032561-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821161829.1032561-3-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_071144_172959_92946F3E 
X-CRM114-Status: UNSURE (   7.57  )
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

On Fri, Aug 21, 2026 at 05:18:29PM +0100, Marc Zyngier wrote:

[...]

> +void kvm_destroy_nested(struct kvm *kvm)
> +{
> +	for (int i = 0; i < kvm->arch.nested_mmus_size; i+= S2_MMU_PER_VCPU)

nit:                                                     ^ missing space

Thanks,
Wei-Lin Chang

> +		kvfree(kvm->arch.nested_mmus[i]);
> +
> +	kvm->arch.nested_mmus_size = 0;
> +	kvfree(kvm->arch.nested_mmus);
> +}
> +

[...]

