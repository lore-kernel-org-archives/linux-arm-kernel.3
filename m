Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17034C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 12:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7lT+Af6i3wfeJ3RpzbIRrgngKvwf1riS5JDpypl0Tg=; b=FeQ9UkQciqAPZP/dNcsk6xuUId
	s9XhjtVpHekuHyJD6Awr+BusHqNJ9SGziC9iQT407TlQ9SQGAmP3QuXu98CrPmm/p4/Tivf2pWAZ7
	rCNQ7V/lODC+BCWbD5OnJ3ONxw0Y9yosyQG8g7JPIklaX6ykdfsonjR80SCSJQJF3LYMZdd3oYul6
	X61WJZiRsE1C6hIvkDksfey5PaZckSEog+hrVD5esTXkX7op/hXjAdM3lA/mGzhDsAL+sSUZEZAB8
	UsiUCv/DseDnREJe9vmFA1xv4OfY1KA+Yl8KCmXD6yC21PUquGQ2nMhzVjvLQqgwLhyNoCcFphHD6
	n5/bqttA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HLF-0000000Besr-12i3;
	Wed, 09 Sep 2026 12:23:53 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HLB-0000000Berp-06Nt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 12:23:51 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Cp5gjjtRZvsGv/c5qbUz1QdnpXy0ZN7bcc5rSOhblwE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788956625; v=1; x=1789561425;
 b=uIyhXqeHFQY6tm2mDkPell3x//ThzzYj2mpeNy2huDtbnqLD2zVo8tbzcx51XVN7CMeXhRI4
 mMS+CDvSWNo9yr6u8OAcXAgQLVogCT6goVYkUk/8XhQIdWw3yROeaYIrFEIX6S2Csy5ijGykdmk
 8NHtGwSBEozCqh+VYdTKVBT0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4bc7c5bb8c1ec41d;
	Wed, 09 Sep 2026 12:23:45 +0000
X-Mizu-Trace-ID: 4bc7c5bb8c1ec41d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so6315e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 05:23:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzzuD5hZv0QnEUgEqDalEsRFUnd8MB4q89gL8F2VyLfIvo595+TRdAWzU1GnRfqUXL28hTifAUxXc0l/y5hC/Qc@lists.infradead.org
X-Gm-Message-State: AFuF++lUmpC9u2pnBipuH7aEvUdXgKcrcX+gwpj+hOtwbm4LmaBKr7w9
	OXYZhUvJcynlVY/koXXohUn1dUh4cWqjObuYeM4XoljkxiBlKFVxhvoXIYc8TMcPqdVVL6Q0IsU
	fFL05kiXDO679T+NZsNITRjrzCRAx09xkiVoGBT8/
X-Received: by 2002:a05:6512:3b14:b0:5ae:b9c5:f29f with SMTP id
 2adb3069b0e04-5b7654ce193mr107092e87.2.1788956623620; Wed, 09 Sep 2026
 05:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <20260908162223.1683432-11-suzuki.poulose@arm.com> <CA+EHjTw9ReyvsNT=y+-P6ng7VQ6Pvz9PFK9bO71qvTR1pOxx5Q@mail.gmail.com>
 <6152fc41-65f0-460f-90b4-1454c11bcba6@arm.com>
In-Reply-To: <6152fc41-65f0-460f-90b4-1454c11bcba6@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 9 Sep 2026 13:23:07 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxjk1JLR7Tf5LEfB_xypbUWnw3G3H-FT7bTE=nWTTRgAA@mail.gmail.com>
X-Gm-Features: AcwNN1UdAORP9MO5wBUrYIVset4_Bi4mGv_qouuDykVa7m9ydt_n5FV9_UkyP28
Message-ID: <CA+EHjTxjk1JLR7Tf5LEfB_xypbUWnw3G3H-FT7bTE=nWTTRgAA@mail.gmail.com>
Subject: Re: [PATCH v17 10/20] KVM: arm64: coco: Disable Steal time accounting
 for coco guests
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_052349_403730_AFE6C3F4 
X-CRM114-Status: GOOD (  23.23  )
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

Hi Suzuki,

On Wed, 9 Sept 2026 at 12:52, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
...

> > I think it would be better to leave KVM_CAP_STEAL_TIME reported and
> > instead reject the configuration for these VMs, returning -EPERM from
> > the KVM_ARM_VCPU_PVTIME_CTRL attr. A capability query should report
> > what the kernel supports, not whether a given VM may use it; gating it
> > per-VM here is also inconsistent, since the !kvm clause leaves the
> > system-fd cap at 1 while the VM-fd cap reads 0. And -EPERM says that
>
>
> But isn't that we want from a VMM perspective ? i.e., enable PVTIME if
> it is supported for the given VM (type). Rather than PVTIME is supported
> by the KVM, so I can go enable it by default. But, we endup getting a
> failure while we enable it. I encountered this with kvmtool, where
> CAP_STEAL_TIME is reported true and even the HAS_DEVICE_ATTR goes
> through fine, but SET_DEVICE_ATTR seemed to fail.
>
> Isn't it better to allow the VM to decide if the capability is supported
> for the given VM type, like we are doing for other capabilities ?

You're right, per-VM capability reporting. My wires got crossed from
the pKVM series and the kvmtool fixes. However, I'd still return
-EPERM rather than -ENXIO from the attribute. The capability exists,
it's just not permitted for a confidential VM, and -EPERM says exactly
that, whereas -ENXIO reads as "no such feature".

Cheers,
/fuad

>
> > steal-time exists but isn't permitted for a confidential VM, whereas
> > -ENXIO reads as "no such feature".
>
> Cheers
> Suzuki
>
>
> >
> > Cheers,
> > /fuad
> >
> >>
> >>   int kvm_arm_pvtime_set_attr(struct kvm_vcpu *vcpu,
> >> @@ -81,7 +81,7 @@ int kvm_arm_pvtime_set_attr(struct kvm_vcpu *vcpu,
> >>          int ret = 0;
> >>          int idx;
> >>
> >> -       if (!kvm_arm_pvtime_supported() ||
> >> +       if (!kvm_arm_pvtime_supported(kvm) ||
> >>              attr->attr != KVM_ARM_VCPU_PVTIME_IPA)
> >>                  return -ENXIO;
> >>
> >> @@ -110,7 +110,7 @@ int kvm_arm_pvtime_get_attr(struct kvm_vcpu *vcpu,
> >>          u64 __user *user = (u64 __user *)attr->addr;
> >>          u64 ipa;
> >>
> >> -       if (!kvm_arm_pvtime_supported() ||
> >> +       if (!kvm_arm_pvtime_supported(vcpu->kvm) ||
> >>              attr->attr != KVM_ARM_VCPU_PVTIME_IPA)
> >>                  return -ENXIO;
> >>
> >> @@ -126,7 +126,7 @@ int kvm_arm_pvtime_has_attr(struct kvm_vcpu *vcpu,
> >>   {
> >>          switch (attr->attr) {
> >>          case KVM_ARM_VCPU_PVTIME_IPA:
> >> -               if (kvm_arm_pvtime_supported())
> >> +               if (kvm_arm_pvtime_supported(vcpu->kvm))
> >>                          return 0;
> >>          }
> >>          return -ENXIO;
> >> --
> >> 2.43.0
> >>
>

