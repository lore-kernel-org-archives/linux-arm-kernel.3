Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B6BC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 11:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8fh3K3x6KkqzILEB9/u6OPbQU6TR8ffUn6oENDwsI8=; b=CoG8+CHOcmquhisv5rLy/Cg6jv
	QYvU/xojQkalZ3cggIghaXd0JKqTsD9KXjUfHWv69kZV/nIiKKUOzELoFusGGWQK0IXyT4hy7onHT
	GTn1Gvk+P7wCJhlP4+otdt1y4iU0A3ao4QDFhIISd2+XXNW2KRpBlnc5Voz+JlD++lRnBcO4Jh9Ad
	fWq/JDcwWMghvuNM+T3UjMppjDvzKp2CiDK1r/LM2hgKGwWIOI10ZLLYYD3NgzWOy5bB7zXMdumIw
	+SwV0/V0D2zmyGF0hjZh343sP0znjrvp1rTryRBssR4F1Gxa+z1giEPwmCR+YwjL8ZdalRirNVGNZ
	e5ZI8aJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GkP-0000000BcFR-0SMO;
	Wed, 09 Sep 2026 11:45:49 +0000
Received: from out-146.mta1.migadu.com ([95.215.58.146] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GkL-0000000BcEY-22Y9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 11:45:47 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=sQ18SBZz/15tq9LdAqx8ijDFA5shEKNGRQQl0W2IYqs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788954341; v=1; x=1789559141;
 b=ZWedJTPN3GQUm7Yn5VnUnCC5Y4zqTZl1ZvIEu11XZ4xD0GFU+wPJxRRhBjGMk1JmGWw/3nPR
 AIvdafRllOFxtB6m1Jaaav+lRN4eSeRYtbuwmlP0D1h8Nrq4Sr+Sv5IdwXjO1oEuXGHBzfi5ObW
 fbynvIoU86cgeHj8lUn8OQu4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f0773bd64a0d93f0;
	Wed, 09 Sep 2026 11:45:41 +0000
X-Mizu-Trace-ID: f0773bd64a0d93f0
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b78e073980so2750e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 04:45:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzP87A9Iob6mDx16oJIbwmwpyBoaUYjkT/QojwO+Q8sFgapKf9JRVvcdyuf8qH2j8+6Fsi3/yGZ5BV7jHj/HMaH@lists.infradead.org
X-Gm-Message-State: AFuF++khmxq36gwfEQWXmqJTS7enndz0RnWJETEpXEu7JWKUnGWo585T
	rKKjtwV+lNuxvGmA+Yke5vwRMeq8p4WagL4d2oNC0QDK9CD0z9GXKX0wvXM9APVeSoQ+oQ52UFQ
	bPOYXvr6HYtju8vxb2ZZkBcFkPVrCnlDanc9qiTkI
X-Received: by 2002:a05:6512:33d6:b0:5ae:b726:5f1f with SMTP id
 2adb3069b0e04-5b764bba50emr123963e87.8.1788954336783; Wed, 09 Sep 2026
 04:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260908162223.1683432-1-suzuki.poulose@arm.com> <20260908162223.1683432-11-suzuki.poulose@arm.com>
In-Reply-To: <20260908162223.1683432-11-suzuki.poulose@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 9 Sep 2026 12:45:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw9ReyvsNT=y+-P6ng7VQ6Pvz9PFK9bO71qvTR1pOxx5Q@mail.gmail.com>
X-Gm-Features: AcwNN1VYRy45FZko0UuMaXxNySje8Pm0dy1h12UkU18r19Bom2n2H4FesuVJEUM
Message-ID: <CA+EHjTw9ReyvsNT=y+-P6ng7VQ6Pvz9PFK9bO71qvTR1pOxx5Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260909_044545_758679_E5C03EB5 
X-CRM114-Status: GOOD (  17.20  )
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

On Tue, 8 Sept 2026 at 17:23, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> PVTIME support is advertised by KVM_CAP_STEAL_TIME, which doesn't take into
> account the kvm instance. Even with that, a VMM could skip the CAP check and
> proceed to configure the PVTIME as we don't do further check on the DEVICE_CTRL.
> Tighten this up by passing the KVM instance around wherever possible and
> catch things early
>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

...

> -bool kvm_arm_pvtime_supported(void)
> +bool kvm_arm_pvtime_supported(struct kvm *kvm)
>  {
> -       return !!sched_info_on();
> +       return !!sched_info_on() && (!kvm || !kvm_vm_is_confidential(kvm));
>  }

I think it would be better to leave KVM_CAP_STEAL_TIME reported and
instead reject the configuration for these VMs, returning -EPERM from
the KVM_ARM_VCPU_PVTIME_CTRL attr. A capability query should report
what the kernel supports, not whether a given VM may use it; gating it
per-VM here is also inconsistent, since the !kvm clause leaves the
system-fd cap at 1 while the VM-fd cap reads 0. And -EPERM says that
steal-time exists but isn't permitted for a confidential VM, whereas
-ENXIO reads as "no such feature".

Cheers,
/fuad

>
>  int kvm_arm_pvtime_set_attr(struct kvm_vcpu *vcpu,
> @@ -81,7 +81,7 @@ int kvm_arm_pvtime_set_attr(struct kvm_vcpu *vcpu,
>         int ret = 0;
>         int idx;
>
> -       if (!kvm_arm_pvtime_supported() ||
> +       if (!kvm_arm_pvtime_supported(kvm) ||
>             attr->attr != KVM_ARM_VCPU_PVTIME_IPA)
>                 return -ENXIO;
>
> @@ -110,7 +110,7 @@ int kvm_arm_pvtime_get_attr(struct kvm_vcpu *vcpu,
>         u64 __user *user = (u64 __user *)attr->addr;
>         u64 ipa;
>
> -       if (!kvm_arm_pvtime_supported() ||
> +       if (!kvm_arm_pvtime_supported(vcpu->kvm) ||
>             attr->attr != KVM_ARM_VCPU_PVTIME_IPA)
>                 return -ENXIO;
>
> @@ -126,7 +126,7 @@ int kvm_arm_pvtime_has_attr(struct kvm_vcpu *vcpu,
>  {
>         switch (attr->attr) {
>         case KVM_ARM_VCPU_PVTIME_IPA:
> -               if (kvm_arm_pvtime_supported())
> +               if (kvm_arm_pvtime_supported(vcpu->kvm))
>                         return 0;
>         }
>         return -ENXIO;
> --
> 2.43.0
>

