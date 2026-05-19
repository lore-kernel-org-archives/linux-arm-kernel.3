Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FC8CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyJ+ELCJOcY26hp1JsTwSbKqxxgMph0NnK5dpm+jvso=; b=ArcpshpiA/aP15mu6Tc500CK73
	DOjqFr60xUY1+dKN8Bgd1tN6OqymiwJSiMRENRqXnIG7H8HDM+RTfXGuIoAdGntzEQIwUoa/8MyZm
	39hXxB/3NJRmQtdXMjnTmHXvQqkOZnOO5kuTIgDR6OfhQ1XSBSE5zEk3mqMF3mrOYU99iCjci1MAp
	u0BWdGL3MaNoi5gL8BoivfbQLJl783XNNosVjbgho9ESo9B/ismdtGPTwEs/e/hw8bcViaVsuHW2s
	LLWEphBops1VlsLqzHS2h7p3zaRE4fS5M8X+hs6ZWve2ImluFUPFaeEUF4+LqYF9BK7P8382X4ZTy
	z6x52HxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHe3-00000001541-1eLJ;
	Tue, 19 May 2026 10:25:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHe2-0000000153a-0q8P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:25:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E00B6020B;
	Tue, 19 May 2026 10:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D69C2BCC9;
	Tue, 19 May 2026 10:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779186349;
	bh=P5YfddLVQL7aZ5v/LZq0e1k59RJIWRdeUlHDtWhzr4c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FNkvBKPkbg7II0DvIuHKCqEJeTFm94iqnAJRMhA5FvZZh6jBd8ZlciRMQQfHH7rNm
	 O2gl8A3loKWcFmGK2B+tRaHPQ20f+lEVk0N6gLw+M4P7ly5oH41fpPhycawVND830T
	 0JlRGRjih8LfcZk1dRdBN5Q3uLFtWxU5Tm6G+5mCOrQehKaGtNuIgWGJ02u1Yz/o3f
	 XrHY6ghrqRVP50TtSAS3/eDoJXX/XxMOFLqiiifkxVbvU3Ev0Jk0qqXvGq3FuIBHyZ
	 irWqD7vYWxKX+ZA/0nE3JFOJIsnWAskrtWZYs664Wn2IxmWIwh4VIDtOoCkI6IKVuD
	 ZMiponcYh/GXA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
	Lorenzo.Pieralisi2@arm.com
Subject: Re: [PATCH v14 37/44] arm64: RMI: Prevent Device mappings for Realms
In-Reply-To: <20260513131757.116630-38-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-38-steven.price@arm.com>
Date: Tue, 19 May 2026 15:55:37 +0530
Message-ID: <yq5ase7nsnku.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Steven Price <steven.price@arm.com> writes:

> Physical device assignment is not yet supported. RMM v2.0 does add the
> relevant APIs, but device assignment is a big topic so will be handled
> in a future patch series. For now prevent device mappings when the guest
> is a realm.
>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes from v6:
>  * Fix the check in user_mem_abort() to prevent all pages that are not
>    guest_memfd() from being mapped into the protected half of the IPA.
> Changes from v5:
>  * Also prevent accesses in user_mem_abort()
> ---
>  arch/arm64/kvm/mmu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 776ffe56d17e..7678226ffd38 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1230,6 +1230,10 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
>  	if (is_protected_kvm_enabled())
>  		return -EPERM;
>  
> +	/* We don't support mapping special pages into a Realm */
> +	if (kvm_is_realm(kvm))
> +		return -EPERM;
> +
>  	size += offset_in_page(guest_ipa);
>  	guest_ipa &= PAGE_MASK;
>  

The commit message suggests that this will need to be updated to support
Device Assignment, but that is not true. IIUC, this is only used by
GICv2?. Can we update the commit message?

-aneesh

