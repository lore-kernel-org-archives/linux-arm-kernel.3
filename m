Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD322CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 16:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aeo3vuGsQvo7ASUqpbGZzspmhnFlqBrhnrXbWl8LQSA=; b=sHLJE1+N+EjMS8KIbaxU9uKLNb
	/GqdU5aJyJ88mtjSEkK/eKjRLxv/W0tlNclZjgF5Koo6QU+tAA5JA/JPHp7F7x9yyfnwsdiEBK7yg
	GvanHCeW+GGxZKOrhVOrOJyGmu+McTwe68csTT5GsMxMDdHshN6vU+gUMVXuWtI6yIFfAf5cI8lVM
	Uf4OkoH14PR1aidB1VLollItFlQ97DrG/Ltd247D3xRBeT/GJtc8Thg4RxaWN3+lcmJTTZCruju9p
	FAxt3TXQlsbbzHdDsR1WBk/j60AzQT4T7s9+jq3meoy1Y6GNMaFQTfdQuZ3h8Wyvo2vrdiMpDT2Ot
	GXCnfYPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8xP-00000001zan-0Xej;
	Wed, 29 Oct 2025 16:23:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8xN-00000001zaa-2fWI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 16:23:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A91E3604F4;
	Wed, 29 Oct 2025 16:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05D1C4CEF7;
	Wed, 29 Oct 2025 16:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761755008;
	bh=jOD78Mx518TeQRICu+lIQf1/IpxzBTgMrkOiFkYx+R0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G0vhav7C2VPL1gKf2u+3Ur40CdOmOqdjOrKKrWG7AHr4Nm8plDumh6C4wMMJ4QRVR
	 53buwYqhXJHzccuJnVEjFyYHGS65dX7iL3dNE58Ar4bqqNPTKk/2g72cRS3jQP0UjC
	 YOe/LxCAj458t8pPGcHGjxFqiJPgKjFVRbS8SoEclzTcE9bommQ6J11raqL0tFGqsI
	 p+2LcKfHys9c4i4ETeRvEaEL9/RB6IGqh1iPMXqQrZ/4nQHv9u5F9XjhNN8OnkQjuY
	 lrxQhA9nnBX9j+Tjv/dl4tqnlkLAjMR2hFbe8DqbBLKnKBgDNGwNvLHCETQttgFII/
	 MBPsIuD9TrMxA==
Date: Wed, 29 Oct 2025 16:23:22 +0000
From: Will Deacon <will@kernel.org>
To: Sebastian Ene <sebastianene@google.com>
Cc: Vincent Donnefort <vdonnefort@google.com>, maz@kernel.org,
	oliver.upton@linux.dev, catalin.marinas@arm.com,
	suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	joey.gouly@arm.com, ayrton@google.com, yuzenghui@huawei.com,
	qperret@google.com, kernel-team@android.com
Subject: Re: [PATCH] KVM: arm64: Check the untrusted offset in FF-A memory
 share
Message-ID: <aQI_essk_agEZTTR@willie-the-truck>
References: <20251017075710.2605118-1-sebastianene@google.com>
 <aPj2hTXbGUseUqhE@google.com>
 <aQHsD0MnZYSTDOf8@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQHsD0MnZYSTDOf8@google.com>
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

On Wed, Oct 29, 2025 at 10:27:27AM +0000, Sebastian Ene wrote:
> On Wed, Oct 22, 2025 at 04:21:41PM +0100, Vincent Donnefort wrote:
> > On Fri, Oct 17, 2025 at 07:57:10AM +0000, Sebastian Ene wrote:
> > > Verify the offset to prevent OOB access in the hypervisor
> > 
> > I believe that would be just a read, so probably it would be difficult to use
> > this to compromise anything, except crashing the system?
> 
> The simplest way is to crash the system but a more advanced one might
> lead to a confused deputy attack:
> 
> 1. Use the original bug to trigger the overflow of the offset variable
> which bypasses this check:
> https://elixir.bootlin.com/linux/v6.18-rc2/source/arch/arm64/kvm/hyp/nvhe/ffa.c#L519
> 
> 2. Use the host_share_hyp from the host to create a mapping in the hyp
> address space so that : reg from reg = (void *)buf + offset; points to
> memory mapped in the hyp address space & controlled from the host.
> 
> 3. Make the __ffa_host_share_ranges fail (since we control the content of
> the reg) to trigger the recovery mechanism for __ffa_host_unshare_ranges
> (https://elixir.bootlin.com/linux/v6.18-rc2/source/arch/arm64/kvm/hyp/nvhe/ffa.c#L392)
> and replace the content of the reg with pages that we want to remove the
> host stage-2 FF-A annotation from.
> 
> With step(3) we can remove the host stage-2 FF-A annotation from pages
> without having to invoke the FF-A reclaim mechanism. This allows a
> confused deputy attack because the pages can be given to another entity
> after the annotation is removed (eg. given to a protected VM).

Crikey, it's convoluted but I think your reasoning is correct and I also
think that the patch fixes the issue:

Acked-by: Will Deacon <will@kernel.org>

Cheers,

Will

