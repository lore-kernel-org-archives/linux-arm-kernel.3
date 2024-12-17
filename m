Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842C6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 10:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSu6zANRT/wpbGQaB8aTXezDvtDfr2WBbbVTU125xbM=; b=SAKVD85Iua9eW+/JAEa2GKuAql
	mpK5GHwmjj0PXc9qcIe+ssfY4ar3xmOTgedP6dJJvR0kt+/9FqB3tm2zgGuLMKC2DZak14NQWgTsk
	UMIHs3wIBI1rLAdf+6gg35oIauro3sGfHVQ+bi9+nLuMUnhKcYpWzyJIUOPxO8jCqvXR8r38LJnyH
	pJFX4F4O2+PyxjhIOSOcmJVewQVcmOlQcbXlJmeTtGy4ZxZ60A+/+P2mjcSnk8B3Z8mUo79NQ4byJ
	0+aRKS7wxZ0Fy05pG/ZB/fQxXWK0ElasbBfu4/Ml4FPj1KMIVpeinTYN7fj64Z+LntprMh6/uesVy
	SNQsdwNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNV1v-0000000D9bw-0iKj;
	Tue, 17 Dec 2024 10:42:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNV0l-0000000D9Ou-40Wx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 10:41:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 608111007;
	Tue, 17 Dec 2024 02:41:33 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FD993F528;
	Tue, 17 Dec 2024 02:41:03 -0800 (PST)
Date: Tue, 17 Dec 2024 10:40:58 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Greg KH <gregkh@linuxfoundation.org>
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
Message-ID: <20241217104058.GA2151333@e124191.cambridge.arm.com>
References: <20241212151406.1436382-1-joey.gouly@arm.com>
 <2024121528-refurbish-plausibly-31c7@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024121528-refurbish-plausibly-31c7@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_024108_047528_4645CF4B 
X-CRM114-Status: GOOD (  24.01  )
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

On Sun, Dec 15, 2024 at 10:22:53AM +0100, Greg KH wrote:
> On Thu, Dec 12, 2024 at 03:14:06PM +0000, Joey Gouly wrote:
> > From: James Morse <james.morse@arm.com>
> > 
> > commit 6685f5d572c22e1003e7c0d089afe1c64340ab1f upstream.
> > 
> > commit 011e5f5bf529f ("arm64/cpufeature: Add remaining feature bits in
> > ID_AA64PFR0 register") exposed the MPAM field of AA64PFR0_EL1 to guests,
> > but didn't add trap handling. A previous patch supplied the missing trap
> > handling.
> > 
> > Existing VMs that have the MPAM field of ID_AA64PFR0_EL1 set need to
> > be migratable, but there is little point enabling the MPAM CPU
> > interface on new VMs until there is something a guest can do with it.
> > 
> > Clear the MPAM field from the guest's ID_AA64PFR0_EL1 and on hardware
> > that supports MPAM, politely ignore the VMMs attempts to set this bit.
> > 
> > Guests exposed to this bug have the sanitised value of the MPAM field,
> > so only the correct value needs to be ignored. This means the field
> > can continue to be used to block migration to incompatible hardware
> > (between MPAM=1 and MPAM=5), and the VMM can't rely on the field
> > being ignored.
> > 
> > Signed-off-by: James Morse <james.morse@arm.com>
> > Co-developed-by: Joey Gouly <joey.gouly@arm.com>
> > Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > Reviewed-by: Marc Zyngier <maz@kernel.org>
> > Link: https://lore.kernel.org/r/20241030160317.2528209-7-joey.gouly@arm.com
> > Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
> > [ joey: fixed up merge conflict, no ID_FILTERED macro in 6.6 ]
> > Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> > Cc: stable@vger.kernel.org # 6.6.x
> > Cc: Vitaly Chikunov <vt@altlinux.org>
> > Link: https://lore.kernel.org/linux-arm-kernel/20241202045830.e4yy3nkvxtzaybxk@altlinux.org/
> > ---
> > 
> > This fixes an issue seen when using KVM with a 6.6 host kernel, and
> > newer (6.13+) kernels in the guest.
> > 
> > Tested with a stripped down version of set_id_regs from the original
> > patch series.
> 
> What about 6.12.y?  You can't just skip a stable tree, otherwise you
> will get a regression when you upgrade to 6.12.y, right?

I did have it ported/tested locally, but I wasn't sure of the stable process,
so just sent out one!  Next time I will send all the backports at the same
time.

Thanks Marc Z for sending it out!

Joey

