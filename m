Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42154E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 09:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=foi2Bhkqn4qcb2g5yqvZXgmzEnMGSM3jwUsPdxRj76M=; b=dFG7ZGcE63NVr3lb2+Oql2PQS5
	7p3MPRgvgRjxV7pG+ZMKJvW9PDlsYJMGkEvSIXbh+EfTUqZgwQHL18GROZPdwjOlvh8WIktqIGfPU
	NcoLfVz+4sUBMVTqDEVQLsJvhUYVHxznudhuCpyVG/odsNtWg8FoQoNxxCXuYtHXsApBJml6rM0tG
	20kozp17amWYRbbHuIY00R1FIl4Itu1Che/7onU27esu4w1NNsUBOXl4D6yAmUf8MCoSNJFktLE9o
	ce9zPK14XVc5+IS0VTLvu+C7WASg1E23yPTth4YBdElxYJ4WV4rNdsPYjHkrOr4iEyz2iE7YGebWC
	Y+crAG9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMkr5-00000007gSc-3WzE;
	Sun, 15 Dec 2024 09:24:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMkq1-00000007gOz-2SpE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 09:22:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B9022A40141;
	Sun, 15 Dec 2024 09:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB77C4CECE;
	Sun, 15 Dec 2024 09:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734254576;
	bh=VA/fr2fanU2w8E9A58sNN9gLlEV2wRsSO8gXxlKoJjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rhdoQNf8ZGsxq0OtLSI6TOY8eXGLpQiMg80mC9co5MB8vkpw0TO6RSdI2TXbLarRr
	 3puHKaN152VDKGxcAGKQHHoUv8YpKIcGE7RdDdhGElwIw2TV+oXx0ek8hpp+N495bn
	 eMNvUw87z4AMK5lq0N6m/Vfd2qbHpnzNSDSI0ALQ=
Date: Sun, 15 Dec 2024 10:22:53 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Joey Gouly <joey.gouly@arm.com>
Cc: stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, gshan@redhat.com, james.morse@arm.com,
	maz@kernel.org, oliver.upton@linux.dev,
	shameerali.kolothum.thodi@huawei.com, vt@altlinux.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jing Zhang <jingzhangos@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH 6.6 v1] KVM: arm64: Disable MPAM visibility by default
 and ignore VMM writes
Message-ID: <2024121528-refurbish-plausibly-31c7@gregkh>
References: <20241212151406.1436382-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212151406.1436382-1-joey.gouly@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_012257_717491_EBF435FC 
X-CRM114-Status: GOOD (  18.11  )
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

On Thu, Dec 12, 2024 at 03:14:06PM +0000, Joey Gouly wrote:
> From: James Morse <james.morse@arm.com>
> 
> commit 6685f5d572c22e1003e7c0d089afe1c64340ab1f upstream.
> 
> commit 011e5f5bf529f ("arm64/cpufeature: Add remaining feature bits in
> ID_AA64PFR0 register") exposed the MPAM field of AA64PFR0_EL1 to guests,
> but didn't add trap handling. A previous patch supplied the missing trap
> handling.
> 
> Existing VMs that have the MPAM field of ID_AA64PFR0_EL1 set need to
> be migratable, but there is little point enabling the MPAM CPU
> interface on new VMs until there is something a guest can do with it.
> 
> Clear the MPAM field from the guest's ID_AA64PFR0_EL1 and on hardware
> that supports MPAM, politely ignore the VMMs attempts to set this bit.
> 
> Guests exposed to this bug have the sanitised value of the MPAM field,
> so only the correct value needs to be ignored. This means the field
> can continue to be used to block migration to incompatible hardware
> (between MPAM=1 and MPAM=5), and the VMM can't rely on the field
> being ignored.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Co-developed-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/r/20241030160317.2528209-7-joey.gouly@arm.com
> Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
> [ joey: fixed up merge conflict, no ID_FILTERED macro in 6.6 ]
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Cc: stable@vger.kernel.org # 6.6.x
> Cc: Vitaly Chikunov <vt@altlinux.org>
> Link: https://lore.kernel.org/linux-arm-kernel/20241202045830.e4yy3nkvxtzaybxk@altlinux.org/
> ---
> 
> This fixes an issue seen when using KVM with a 6.6 host kernel, and
> newer (6.13+) kernels in the guest.
> 
> Tested with a stripped down version of set_id_regs from the original
> patch series.

What about 6.12.y?  You can't just skip a stable tree, otherwise you
will get a regression when you upgrade to 6.12.y, right?

thanks,

greg k-h

