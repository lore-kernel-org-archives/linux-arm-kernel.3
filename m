Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22410C79F85
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 16:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NV7z5U2Uq6jDuG6r5JBF/qQ5x8mn7kEgJkCfZvBOLDM=; b=NyzG8IXMvbuE6EEPYv5r6uJP6F
	WjUqUBPEXYvpMkYxQ/5BSaMQuZSEWOE/rLw8Nj7V53F0NR7V/0V9CNDdDvsN1/9kVP6pYi+ipy/27
	rrSs4NAhUaoU9mb3mWuIlMN+MjyNuzAVY7pDmQzAUDSEKQq2sAGmKarRvmRcw7IDbaGbm496OOYpY
	M+fNVvZOLZ6rCsjru5UnPbKotfl3kI2qOhqqUD9rOdwyzvUv0mvcXllpuxSXPBTygGnW4r0LXGHyi
	mkhSbNDMvlcGTwdzz5re4ecgj9fMXC4t7pL1IH4ZpvhVLh0nTO7dEacsugVLZtZQ+JgXr0WnaO0PZ
	VTiXUBHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3G0h-00000005D0e-1Ff5;
	Sun, 06 Sep 2026 16:46:27 +0000
Received: from out-144.mta1.migadu.com ([2001:41d0:203:375::90] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3G0a-00000005Cyf-3Yf8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 16:46:25 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=VjfV2POx+VicV5YfJjm4exSQwpAsSb4mPjx2PR7ZFvI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788713176; v=1; x=1789317976;
 b=ChU3c2HyVvlxvYX9iG+qc7c6nWJ9urEIq/gkjPZMacrzZELyqbwjzorbJSmzh/7pmZXMxxUi
 BhJ9SEVhnSmRyGC1INsbY/htIHhN9af+Zuzm0GTisU9JO2IcXpI2gCxPE5zuaad8qDkohMYd1Tr
 By9mII8iKlReYnvSjI6SFvfs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id fc27cef724fffb40;
	Sun, 06 Sep 2026 16:46:16 +0000
X-Mizu-Trace-ID: fc27cef724fffb40
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so3739e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 09:46:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwAeaxNsSaRvHDlnnmgeiKAsei6s6HyN7zHjvnOuA9TIHh4ML8FoEFI14vekTFwRQ84TRFu7Ne12c5LJCdyYJw5@lists.infradead.org
X-Gm-Message-State: AFuF++niFaTAT1/JupHP9KNyKS3JEamf36cp7pWA+EopZVXvBFKsxtPZ
	Xu507M3QHvRDUSIe1zp6DHTPNJx+DdTUps1YYQwhY05Ya49KxKiVCIvPrjgBXbaSkhOdn9EHo2q
	tnwsX575FD9DnhvosnNO7sxLtAg34H3kedMasaxc4
X-Received: by 2002:a05:6512:3ba7:b0:5b1:571f:715f with SMTP id
 2adb3069b0e04-5b74d427ec9mr96688e87.3.1788713174435; Sun, 06 Sep 2026
 09:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260904174419.76057-1-sascha.bischoff@arm.com>
In-Reply-To: <20260904174419.76057-1-sascha.bischoff@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 6 Sep 2026 17:45:37 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzfG+y=1N3Jn5Pc8PpH0qmnmwQe5d0Z943n+PdEmY3wXQ@mail.gmail.com>
X-Gm-Features: AcwNN1VwvQjebM9ocVZBouSeIGG6IYkrA31W30ISXubYppwaYJQVVM9dNYgL72I
Message-ID: <CA+EHjTzfG+y=1N3Jn5Pc8PpH0qmnmwQe5d0Z943n+PdEmY3wXQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: vgic: Serialise CTRL_INIT against vCPU creation
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, nd <nd@arm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, Joey Gouly <Joey.Gouly@arm.com>, 
	"seiden@linux.ibm.com" <seiden@linux.ibm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, 
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_094622_067399_39303D76 
X-CRM114-Status: GOOD (  17.95  )
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

Hi Sascha,

On Fri, 4 Sept 2026 at 18:45, Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:
>
> vgic_init() compares created_vcpus with online_vcpus to detect a vCPU
> being created. However, CTRL_INIT only holds config_lock, while
> admission of new vCPUs and updates to created_vcpus are protected by
> kvm->lock.
>
> A concurrent KVM_CREATE_VCPU can therefore increment created_vcpus
> after vgic_init() checks the counters, then block on config_lock before
> publishing the new vCPU. For a GICv4 VM, vgic_v4_init() consequently
> sizes its vPE array using a stale online_vcpus value, leaving no vPE
> entry for the new vCPU once its creation completes. The upcoming GICv5
> IRS support would hit the same issue when sizing its doorbell domain.
>
> Hold kvm->lock around CTRL_INIT. The existing counter check detects a
> vCPU creation already in progress, while the lock prevents a new one
> from starting until initialisation has completed.

This also brings CTRL_INIT in line with the other vgic device flows
that serialise against vCPU creation: kvm_vgic_create(), the GICv2
register uaccess path, and SAVE_PENDING_TABLES just below it all hold
kvm->lock across the config_lock section.

> Fixes: f00327731131 ("KVM: arm64: Use config_lock to protect vgic state")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/r/20260807124506.ED85C1F000E9@smtp.kernel.org
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>

Given that f00327731131 carried a stable tag, worth a Cc: stable?

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad



> ---
>  arch/arm64/kvm/vgic/vgic-kvm-device.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/kvm/vgic/vgic-kvm-device.c b/arch/arm64/kvm/vgic/vgic-kvm-device.c
> index 90be99443df3b..219881915bf41 100644
> --- a/arch/arm64/kvm/vgic/vgic-kvm-device.c
> +++ b/arch/arm64/kvm/vgic/vgic-kvm-device.c
> @@ -255,9 +255,11 @@ static int vgic_set_common_attr(struct kvm_device *dev,
>         case KVM_DEV_ARM_VGIC_GRP_CTRL: {
>                 switch (attr->attr) {
>                 case KVM_DEV_ARM_VGIC_CTRL_INIT:
> +                       mutex_lock(&dev->kvm->lock);
>                         mutex_lock(&dev->kvm->arch.config_lock);
>                         r = vgic_init(dev->kvm);
>                         mutex_unlock(&dev->kvm->arch.config_lock);
> +                       mutex_unlock(&dev->kvm->lock);
>                         return r;
>                 case KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES:
>                         /*
> --
> 2.34.1

