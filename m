Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CB1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 23:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o4YdV6f7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ksBxNZON
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iuQfgeNxA6wGpTGomQMxImyXHDaKIESamcJco6bW6WQ=; b=o4YdV6f7ByJRjdkM2LA6UZWJnn
	3LsfU+ah5hWszA4TNqwELYz+fpJWMUONG7kn96krPPa4Q0tT4ewPu0pUBEyk/MRALFsf9IZHEOpxw
	0HbqtFG/PplqYHiqZpKUjMgl9kH+1A1+Tt8AeGOZhXnZ6FGkCMqxR7VfCzGhRPT0dLDlNxisaMPuY
	mlC+ZD7FiQOt1n6vq4vMzbEaXzcW5N6WVimfWgTs/pIR2pIKHcPprNw5WlmNCb+32GXfRrbl+6IVJ
	CbPLXz6B7jd/bI5grYt/jzTISonAOJr/Im7ikobxtCqZgHZijkkT7mI0kNV4IwtV7wy1RG9881x/y
	TSlcWDaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqyn-00000005xhe-2PCw;
	Tue, 27 Oct 2026 23:53:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqym-00000005xhT-0NRK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 23:53:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3175B60142;
	Tue, 27 Oct 2026 23:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F7A1F01825;
	Tue, 27 Oct 2026 23:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793145198;
	bh=iuQfgeNxA6wGpTGomQMxImyXHDaKIESamcJco6bW6WQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ksBxNZONPb8UCXkhTBve3goFXZZQLNXqWYD1psAQqmQ3PV384sVnXrWRRZtDEQirR
	 KoYFh1V1XqfzzHUyFKBpYgXrgq7+gneJRolr49gTjumAnLJ75m9M4q3zSMoDVWWq36
	 6sjR3kzQWhZTBeU8/mx+8BUMTK8Tca1N5+PrlgL4KCKf25Z/Kmmw6BEdZy0A/gCG1Y
	 qk0Rizpie+M/WaCYxcVrjY5to3BMnQCN8GL2VCKQTDq9I0WG8Z82PzWUDjRMLQu09v
	 95QGDJgRDeR9ueS0uM9hU68vTH7tYwA9gmiAQ3aWNE+Pnds1AHMTTL17VP50qDuNdw
	 tDVMS4Sh/NGUA==
Date: Tue, 27 Oct 2026 16:53:17 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Yuchao Zhang <ndaugoing@gmail.com>, Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] KVM: arm64: vgic: LPI fixes for redistributors with
 LPIs disabled
Message-ID: <auE5bc4NJTZO-C1o@kernel.org>
References: <20261026092802.2636798-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026092802.2636798-1-fuad.tabba@linux.dev>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 09:28:00AM +0000, Fuad Tabba wrote:
> Hi folks,
> 
> Two fixes on top of Marc's cross-CPU vcpu pausing series [1], for LPIs
> whose redistributor has LPIs disabled. Without them, the guest can take
> such an LPI with EnableLPIs clear, or lose one mapped before it enables
> them.
> 
> The first is the vgic_target_oracle() change Oliver suggested on v2 of
> that series [2]. It stops an LPI from being queued to a redistributor
> with EnableLPIs clear once the disable path has retired the vCPU's AP
> list. With that check, the path has to pause the vCPU before clearing
> EnableLPIs, so that the retire still finds its LPIs.
> 
> With the second, an LPI mapped while its redistributor has LPIs
> disabled keeps its pending bit when they're enabled. The second relies
> on the first to keep such an LPI off the AP list until the enable.
> 
> Reproducers for the INVALL case in the first and the map in the second
> fail in every run without the patch and pass with it.
> 
> Based on kvm-arm64/cross-vcpu-sync as merged in kvmarm/fixes, which the
> first builds on (e99ff76f4a02b; also applies to kvmarm/fixes
> 309e1d2215255).
> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/20261015100539.1011760-1-maz@kernel.org/
> [2] https://lore.kernel.org/all/asf87i2RDh-WksL-@kernel.org/
> 
> Fuad Tabba (2):
>   KVM: arm64: vgic: Don't forward LPIs to a redistributor with LPIs
>     disabled
>   KVM: arm64: vgic-v3: Don't drop a pending LPI mapped with LPIs
>     disabled

Reviewed-by: Oliver Upton <oupton@kernel.org>

>  arch/arm64/kvm/vgic/vgic-mmio-v3.c | 31 ++++++++++++++++--------------
>  arch/arm64/kvm/vgic/vgic-v3.c      |  3 ++-
>  arch/arm64/kvm/vgic/vgic.c         | 12 ++++++++----
>  3 files changed, 27 insertions(+), 19 deletions(-)
> 
> 
> base-commit: e99ff76f4a02be8542e2c3ecc8843d7339a0200d
> -- 
> 2.47.3
> 
> 

