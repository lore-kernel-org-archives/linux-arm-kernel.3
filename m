Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38661C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 09:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIgiI942Y5HV5POfQbnbT8C1D3nW7BAdr8oB7jvmliU=; b=j/4HshQgrJr2vc8LQC+mWJObgl
	u2pjUAmoNpRXSsB9rOOOYeg5SM2AlUlMxcCpi9j5EQKBmg4gwRRndJzlCT5kQ598NwOk/hCW1cEyR
	rq6iLVKLpyKD/I/KSCM/tms8/uNhH462ITJlSf7Z4Vg4TMa+CDtt7ofDmWo3EngWYofmDG7rIIm7o
	5T1k9S4K4/kjkPiauRlTXAqBbBK7K408SX0wpcia3u7LPbwqWNUKjqLp9Shg9h6PHwhvySAf1EftF
	zJYehSzs8Wo7ijjqh80r7CBw4ORGLHrZ0r1BfJnaxitkb6OJM5zEv9jWWSP0ZiWM4yb+V+K20YSEG
	4nWfhumg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynIJ-00000000T7u-2SJJ;
	Tue, 25 Aug 2026 09:18:11 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynIF-00000000T70-2nNJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 09:18:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787649485; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=OIgiI942Y5HV5POfQbnbT8C1D3nW7BAdr8oB7jvmliU=;
	b=N3FW+FpLRTwOyVf25bsnDsP4c06dtbVyNFJqj25BvpKOnOqRiNFQdYGK8RMCytD8tkYR1L8tCyhbBzJEeEcZOg56HNd4b9ugCWRYAv03AGTXffIa+sG5H/3U3cDZMSK4F75EsuYK7kfe7KFxoOqV0g7fYrQCkNUPbQn/NL2LypY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R601e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0X9dItck_1787649483;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X9dItck_1787649483 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 25 Aug 2026 17:18:04 +0800
Date: Tue, 25 Aug 2026 17:18:02 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Eric Auger <eauger@redhat.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Sascha Bischoff <Sascha.Bischoff@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	Fuad Tabba <tabba@google.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] KVM: arm64: vgic: Tear down what vgic_init()
 created when it fails
Message-ID: <te43gnvb2v2zlt3m5gwn2qvden5x3vp23o2qo27uif3ebdrodg@grrfqge2htia>
References: <20260824074245.710955-1-fuad.tabba@linux.dev>
 <20260824074245.710955-4-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824074245.710955-4-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_021807_909599_1A12F8F6 
X-CRM114-Status: GOOD (  20.30  )
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

On Mon, Aug 24, 2026 at 08:42:44AM +0800, Fuad Tabba wrote:
> Once kvm_vgic_dist_init() has succeeded, every later failure in
> vgic_init() returns with the SPI array still allocated. A failure after
> vgic_v4_init() has also succeeded, which today means only
> kvm_vgic_setup_default_irq_routing(), leaves the vPE array behind as
> well.
>
> A failed vgic_init() leaves kvm_arch_vcpu_precreate() admitting new
> vCPUs, so a retry of KVM_DEV_ARM_VGIC_CTRL_INIT reaches
> vgic_v4_init()'s early return with an array that no longer covers every
> vCPU, and vgic_v3_load()'s WARN_ON(vgic_v4_load()) fires on the first
> one it misses.
>
> Release both on the two paths that can reach them, so the ioctl is all
> or nothing and a retry starts from scratch. dist->nr_spis stays frozen,
> since the SPI count cannot change once vgic_init() has supplied it.
>
> Fixes: 180ae7b11823 ("KVM: arm/arm64: Enable irqchip routing")
> Fixes: 74fe55dc9ab7 ("KVM: arm/arm64: GICv4: Add init/teardown of the per-VM vPE irq domain")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260807105558.73D701F000E9@smtp.kernel.org/
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/vgic/vgic-init.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> index 4012df6002ea6..7493fded53acc 100644
> --- a/arch/arm64/kvm/vgic/vgic-init.c
> +++ b/arch/arm64/kvm/vgic/vgic-init.c
> @@ -462,7 +462,7 @@ int vgic_init(struct kvm *kvm)
>  		if (vgic_supports_direct_irqs(kvm)) {
>  			ret = vgic_v4_init(kvm);
>  			if (ret)

Hi Tabba,

> -				return ret;
> +				goto out_teardown;

The vigc_v4_init already called vgic_v4_teardown() in error path,
thus I think just free dist->spis is enough yet ?

>  		}
>  	} else {
>  		ret = vgic_v5_init(kvm);
> @@ -475,12 +475,19 @@ int vgic_init(struct kvm *kvm)
>
>  	ret = kvm_vgic_setup_default_irq_routing(kvm);
>  	if (ret)
> -		return ret;
> +		goto out_teardown;
>
>  	vgic_debug_init(kvm);
>  	dist->initialized = true;
>
>  	return 0;
> +
> +out_teardown:
> +	vgic_v4_teardown(kvm);
> +	kfree(dist->spis);
> +	dist->spis = NULL;
> +
> +	return ret;
>  }
>
>  static void kvm_vgic_dist_destroy(struct kvm *kvm)
> --
> 2.39.5
>

