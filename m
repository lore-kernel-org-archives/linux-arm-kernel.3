Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA98CA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 18:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ErrQurI5vTu6O9lAc7urmvhNRjJ24bJg35B9m6dACQ0=; b=2xQBfHzVdHiyRqDbx8iwr+H1RL
	7isGW4TP6MBXQPg/rcizzyfVKBIieINomuacf8g3QcukoIGqMBsIXZ+kkhTC56dz2n4LhA4HHyIcw
	0GPqjOVLnt4surMFHSpbRXWaxTn31U4XZ5r596NTHMbxE6j130Ls6CSf7Xl62v5lwX7LSmgbownde
	tTGJPp2EaPQaI568B4auzqwg7MheNbb36Oep+coxm9IUkQnB5MLLVi/ZRTLfuzvKmiPKA8TBXcmuS
	ZjW5NNIwSxFqqjsry1ohSOQVUkON+pf2lgp0FafKm1JHXhmQT+5ZVEpiWX/qsJYmbxI4zLANBWcgo
	m1TYI4BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBcpp-00000004J6O-1TDd;
	Tue, 29 Sep 2026 18:45:49 +0000
Received: from out-108.mta1.migadu.com ([95.215.58.108] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBcpm-00000004J5y-3lsh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 18:45:48 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=mx1pndh9NACF4v//8sWUqY+ii9IXnTRJQEeestc8TIE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790707545; v=1; x=1791312345;
 b=mInu1egAD6zBnXoaykZw4eXGO9/jvSeNDaNSdHgrf8K9jdbx7evlx1Yjmb5jk3rtzUEjQBNO
 98gNkTnYXbcT88DhietNWqTrU89cHZUmDFV6JPqww1lZMynw4yjdF+XcpZy2EqT1t0NAtGWl1bp
 rC3xIKFoJYtqhH6vkRgipbFk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6ca91fa5fe248374;
	Tue, 29 Sep 2026 18:45:42 +0000
X-Mizu-Trace-ID: 6ca91fa5fe248374
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b8ea0ca5baso1074e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 11:45:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxLulkVqaTA78Sl+dXZG2E7kI8o2THpAUatDjaqkD9cg1OOIJR3Pu8eBP6AUQmnwV+DmiDWLjWFptW/jYXo/dfo@lists.infradead.org
X-Gm-Message-State: AFq9FYLhpH7g/jyQ+lkHVVQa+v//07VdCf1AJrGe4L11PK0qqbl8gHZG
	YhQHduNosAMtyHBVhEbBO9TsN4LlgRb3pc3RnhqhCpLZAg5q8dn9zYklV2p3irqRH3t9FndWNFL
	Q/tAHXsqU/bngOgGtOHs+KOtHWLhOlrbv4yO856JB
X-Received: by 2002:a05:6512:1052:b0:5b8:c95d:529c with SMTP id
 2adb3069b0e04-5ba3c039e63mr21526e87.0.1790707541274; Tue, 29 Sep 2026
 11:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260929093548.3598547-1-maz@kernel.org> <20260929093548.3598547-8-maz@kernel.org>
In-Reply-To: <20260929093548.3598547-8-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 29 Sep 2026 19:45:05 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyT7_DvnnPM3H4=o=aTkBksNQuQTTyXB=Jh=uzpRsnEXQ@mail.gmail.com>
X-Gm-Features: AclHuK9ckX2XdpBIMn2iv43c3Ok9eDLeQw0Pba9h2d2_EeCe5NJES3JhNqa7_ho
Message-ID: <CA+EHjTyT7_DvnnPM3H4=o=aTkBksNQuQTTyXB=Jh=uzpRsnEXQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] KVM: arm64: vgic-its: Stop the VM when handling MOVALL
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Yuchao Zhang <ndaugoing@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_114547_086815_F18AAE9C 
X-CRM114-Status: GOOD (  22.06  )
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

On Tue, 29 Sept 2026 at 10:36, Marc Zyngier <maz@kernel.org> wrote:
>
> MOVALL is a royal pain, as it requires us to iterate over all the LPIs
> and move them around if they are on the correct source vcpu, and
> requiring locking for each of them.
>
> This locking can result in contention for vcpus that enter and exit
> the guest, and hinders forward progress. In order to make sure such
> process is not contended, just stop the VM altogether.
>
> Nobody in their right mind uses MOVALL anyway, as this is a rather
> braindead aspect of the GICv3 architecture.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

This is the only patch in the series without Cc: stable. Was that deliberate?

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/vgic/vgic-its.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
> index cc02d9b62bd95..094eede267e54 100644
> --- a/arch/arm64/kvm/vgic/vgic-its.c
> +++ b/arch/arm64/kvm/vgic/vgic-its.c
> @@ -1382,6 +1382,15 @@ static int vgic_its_cmd_handle_movall(struct kvm *kvm, struct vgic_its *its,
>         if (vcpu1 == vcpu2)
>                 return 0;
>
> +       /*
> +        * Bulk operations such as MOVALL are a pain, as they can clash
> +        * badly locking-wise with other vcpus entering and exiting the
> +        * guest, should they be affected by it. Stopping the guest is a
> +        * safer bet to ensure uncontended access and ultimately forward
> +        * progress. Yeah...
> +        */
> +       kvm_arm_halt_guest(kvm);
> +
>         xa_for_each(&dist->lpi_xa, intid, irq) {
>                 irq = vgic_get_irq(kvm, intid);
>                 if (!irq)
> @@ -1394,6 +1403,8 @@ static int vgic_its_cmd_handle_movall(struct kvm *kvm, struct vgic_its *its,
>
>         vgic_its_invalidate_cache(its);
>
> +       kvm_arm_resume_guest(kvm);
> +
>         return 0;
>  }
>
> --
> 2.47.3
>

