Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F3ACC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PyCzwXp6skk6xuTNd5K7xv+NS33CqBs/aqCiNCjofPU=; b=qqYAg5GHf2pEHrQAWc9AE4MCHT
	rxBcrqTjz77+ziLwo1nc1rHjuju1FrT57hgVffXoqet6MShkrDSVCTWI/FCfgoOpwDqfgGPgCGun5
	WjWiH/DakoWQ+OE4kbGt0N/dbz/u8xFxVSu8Npzr6OfKTqFg2MAcSODfCbISJRM6Q/4IqVpuK5ACa
	nNyasQaef/4tbKIai8GW88eY627RHfkvRYou62twY0TI43EdeI4/m7s1EojPbhujBlgiyPb5dxbNX
	JoruZ8WyoIANvBWBvmJoPqd1AxCq+cZwlhm8GvIvEq6LjvNmskIjYgwLy6zYWU1gBRcKLAMEWvW08
	sE88RO1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZAs-0000000CTlK-1dIE;
	Tue, 13 Oct 2026 09:51:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZAq-0000000CTku-3rMc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:51:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E8F5600D1;
	Tue, 13 Oct 2026 09:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8D11F000FF;
	Tue, 13 Oct 2026 09:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791885115;
	bh=PyCzwXp6skk6xuTNd5K7xv+NS33CqBs/aqCiNCjofPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D+RdwBM9UNxHRLePRTKBR9LdQwEtGhFzrPCerxIXBjRJcRKecovsPLJDZf1Wo/A0e
	 DVAOJcbY54iNO3N24ta5Mb34ynrLmDJllTvriiN+45+xPf+B08wwGD3iHsQc5a8ZfI
	 C5GXwXL2/Qc9MLL4FJ8DRWz8MgAw2ZYcIQ9z713vjPsS2LMNak6J04CbMVRIlMKg/9
	 mEnhAZB3z+TjgEeOuok2njcVeiisvuoFNo7zM2CfSar7SCrLAeUNxR4e7M+eOzQB9L
	 dhe5J7ep9XjoNsnZnXrc/As1NDC6dL25BMfsEr7L4tYfvcDpLenhuJQ1wcNzr4vqtV
	 2p4w25BGmaHHw==
Date: Tue, 13 Oct 2026 02:51:48 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2 0/2] KVM: arm64: vgic-its: Fix LPI double mapping and
 DISCARD
Message-ID: <as3_NKT20MNdqaJR@kernel.org>
References: <20261013081646.933312-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013081646.933312-1-fuad.tabba@linux.dev>
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

On Tue, Oct 13, 2026 at 09:16:44AM +0100, Fuad Tabba wrote:
> Hi folks,
> 
> Changes since v1 [1]:
>   - Dropped the second mapping of an LPI at MAPTI, instead of keeping a
>     doubly mapped LPI out of GICv4 forwarding. (Marc)
>   - Keyed that check on whether an ITE maps the LPI, not on whether its
>     vgic_irq exists.
>   - Added a patch that makes DISCARD remove the pending state. (Marc)
> 
> Two fixes to the ITS emulation. The first stops a guest from mapping
> one LPI from two events, which can oops a GICv4 host when the VMM then
> routes an assigned device's MSI to the second event. The second makes
> DISCARD remove the LPI's pending state, as the spec requires.
> 
> Tested on QEMU, which emulates a GICv4 ITS. A local reproducer with two
> vCPUs DISCARDs an LPI that's pending in the other vCPU's list register.
> On rc3, and with patch 2 but without its halt, the guest still takes
> the LPI. With the series applied, it doesn't.
> 
> Based on Linux 7.3-rc3 (fd73f4a665989).
> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/20261012084743.2228612-1-fuad.tabba@linux.dev/
> 
> Fuad Tabba (2):
>   KVM: arm64: vgic-its: Don't map an LPI from more than one event
>   KVM: arm64: vgic-its: Remove the pending state of a discarded LPI

Looks good. As all of these VGIC fixes depend on reliably synchronizing
hwstate I'll assume Marc will apply this patchset after his own series.

Reviewed-by: Oliver Upton <oupton@kernel.org>

Thanks,
Oliver

