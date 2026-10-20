Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB86606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 07:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2aD3mStp;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OgkQUeEp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LfoOhm00iP//E0N4F9AlbSUJTf43+auw00OGwsKyDj8=; b=2aD3mStpzi+X3BDaZyyRbIEcb5
	fIxjG0Q6euTrURqxJy7MDOk2VFEuLmtRqiQ8h63AGc+8lUPE6o/4b8mBdmMOVcbUbocDmTlvn+nhX
	TY36f3D3xi5A8+04jLcKG1c8AF03YFtp8INcEjn+7cv++WHxYrw/t6JXCY/ir5sGkKWHHGsX6rXT0
	/lgwTHf75Fl67kHanCDoS3XAS3WfbJvkpVK2ps+3vOEz4mGH5oeGAeHYBlO77GnHzSBfhqzqkCrD1
	/RPmeZDZ83TuTG97js0b7xSxdO1rZ8/9CdkWtshdi0YySSZSocaiEVpGSOsF7XTvektQjv/9BWe/0
	XHEzvozg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4WA-000000094jg-2BvX;
	Tue, 20 Oct 2026 07:44:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4W6-000000094iE-1ds5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 07:44:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F1AF1595;
	Tue, 20 Oct 2026 00:44:09 -0700 (PDT)
Received: from [10.0.136.108] (M0PRX50XMG.cambridge.arm.com [10.0.136.108])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFBA13F7B4;
	Tue, 20 Oct 2026 00:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792482252; bh=2c18fozBhrsSmOpHTh00ZE2k6HIbTfIxp8a4vEnkaO4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OgkQUeEpqjp95Q9MtHaL/sbEWU+qgni+fsviK1MMEa+vnKCPyN3p8tNRbHHF5CWHU
	 BoidisyAu8NDjn3lHNyAE2lbiO0T49D7NCLcadhPb/2fc2bsOlX++IMQWKGZ3UoTVu
	 FKQtQy4BQ32NisE2mBlmacmU6AIjOmy1ErWGmIDw=
Message-ID: <a87f0a59-f71f-4583-8ace-394f9af649e5@arm.com>
Date: Tue, 20 Oct 2026 08:44:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] KVM: arm64: vgic: Require matching VGIC model for
 GICv3 ITS
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
 seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
References: <20261019134242.1289002-1-sascha.bischoff@arm.com>
 <20261019134242.1289002-2-sascha.bischoff@arm.com>
 <CA+EHjTzqKiWr2tnV0rUiA4VVCs5a0E2XQQTdwvH0bTKZ5dxe5A@mail.gmail.com>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <CA+EHjTzqKiWr2tnV0rUiA4VVCs5a0E2XQQTdwvH0bTKZ5dxe5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_004414_479143_C7510256 
X-CRM114-Status: GOOD (  20.87  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fuad,

On 19/10/2026 16:32, Fuad Tabba wrote:
> Hi Sascha,
> 
> On Mon, 19 Oct 2026 14:42:41 +0100, Sascha Bischoff
> <sascha.bischoff@arm.com> wrote:
>> On a GICv5 host with legacy support, KVM registers both VGICv3 and
>> VGICv5 devices. Without a model check, a VM can create a GICv3 ITS
>> alongside an incompatible VGIC, regardless of creation order.
> 
> Could you add to the commit message that the new checks apply on every
> host? A GICv2 VGIC and an ITS, in either order, now fail with -ENODEV,
> where before both were created and the ITS was ignored.

Ah, that's a good point (and a situation that hadn't properly clicked in 
my head). I'll absolutely update it.

> 
> [...]
>> diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
> [...]
>> @@ -42,10 +42,7 @@ bool vgic_has_its(struct kvm *kvm)
>>   {
>>           struct vgic_dist *dist = &kvm->arch.vgic;
>>
>> -        if (dist->vgic_model != KVM_DEV_TYPE_ARM_VGIC_V3)
>> -                return false;
>> -
>> -        return dist->has_its;
>> +        return !!dist->its_model;
>>   }
> 
> I think this should check vgic_model as well, as Sashiko raised [1].

Yeah, Sashiko and you have raised a valid point here.

> vgic_its_create() accepts an ITS when there's no in-kernel VGIC, and
> the VM can then run with a userspace irqchip. On a GICv4.0 host,
> kvm_vgic_flush_hwstate() then calls vgic_v4_commit() on every entry,
> for a vPE that vgic_v4_init() never set up. irq_set_vcpu_affinity()
> fails on irq 0 and the error is ignored, so nothing crashes, but this
> patch makes that path reachable. The MSI paths Sashiko lists are fine,
> since KVM_SIGNAL_MSI requires an in-kernel irqchip and irqfd an
> initialised VGIC.
> 
> Something like this would keep the 0 == 0 case you pointed out for
> Marc's version false:
> 
>          return dist->its_model && dist->its_model == dist->vgic_model;

Foolishly, this was the variant I'd dismissed as it returns false until 
vgic_model is set. However, I guess that is the behaviour we want here. 
An ITS is only a valid ITS if the model matches.

> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/sashiko-outbox-177254@kernel.org/

Thank you!
Sascha


