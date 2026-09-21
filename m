Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BC0C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4B/Jf+cW2D42WS+Wj/MZS6kC+uiP3vcDJPNQ3lskzTY=; b=4YsmEVNCZmiGdzO3r8iulHCMqE
	LTFk70dEOtNOjTuBoH4y1nrNzT/TjUtG3u3F0ls3qsRp3w761ATW0ViC+f8wF1VKlmhhOieze6Phe
	f+LYK3DNdDH76000RAWJxcgAqSR4Pq+Qti7x9YnZF5fiVUQgcUJUhFfm4X229ladWVm8B4m8rGOxd
	W0GcOIgVWVwjYDx53xgy+U5Oah4uKUzJfrpD0ew0nwwZPbITVwV1j/ir3A9z8iW5T6e/nm54SprOj
	HZ0x155HBjHjQfl3GAXhPwltfM8+930fqFjyN6Gk1JVmyaUQn8wCJWR/+K3ecTBlDwOjPU/HfYp3y
	EEiDjZdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8X7l-00000000ze7-0P7W;
	Mon, 21 Sep 2026 06:03:33 +0000
Received: from out-102.mta1.migadu.com ([95.215.58.102] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8X7i-00000000zdi-11da
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 06:03:31 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=KfFHfZ4iwgvTWzD+d7ThKP2Za/ZsPILmpf4NKUXBYSA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789970605; v=1; x=1790575405;
 b=bwrX8+W0GU/d5QG0BDtysveF5JZjrI+IMdOjuZMNZsEXXy/uWSwqly5l6YpixxcPISYINRVk
 LbwfduPqbtHaHTA/e7wEBxHxG2xLVbqC1emvK0ztEZFqTo9CO4etmNQVXROHtZGUqlXCaQqEkLl
 inSZMCULmyjAwzClmX7RZdeY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ed9685b502fb70b3;
	Mon, 21 Sep 2026 06:03:25 +0000
X-Mizu-Trace-ID: ed9685b502fb70b3
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b8c42da963so7150e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 23:03:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwiQH5bfuewQxldwXFDfko9uJVCzb5WzDIHwFLgwaWo3JPlcdqDnH8q6t7WzA14mUCsV7sjf3z9d1q6lACA+AHp@lists.infradead.org
X-Gm-Message-State: AFuF++mAVOSB25Soz6nm+IoB/EZI5HxqGdCz5xPwHQL51v+H3uDUDh4L
	mbBbpLDXnsTRJMwFd6p8AXDc8godGDjIYAlvJb7zqArQD7iGmnVPX09MATStvbZ05hWU2hc7nss
	Q/mYtpC7mD8gqB976CBs7GxgkxGfWuoP4GFy+7lXT
X-Received: by 2002:a05:6512:a95:b0:5b8:cc2e:2fe6 with SMTP id
 2adb3069b0e04-5b8cc2e30d0mr42846e87.5.1789970603608; Sun, 20 Sep 2026
 23:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260918120553.163139-1-fuad.tabba@linux.dev> <aq1VjEOI3yhoFtpq@gremlin>
In-Reply-To: <aq1VjEOI3yhoFtpq@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 21 Sep 2026 07:03:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyL0WXBQZcudB3AL9MFem1L7wmpC6N0_54C0-qrw7M-FA@mail.gmail.com>
X-Gm-Features: AcwNN1VBGKS9331BRoH03j2FDN--JXQmLxd-TtWpGKfTh8lyxNGKe0BT2dp2tv4
Message-ID: <CA+EHjTyL0WXBQZcudB3AL9MFem1L7wmpC6N0_54C0-qrw7M-FA@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Restore the VM's feature bitmap when
 kvm_setup_vcpu() fails
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Jack Thomson <jackabt@amazon.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_230330_430642_8C63AB94 
X-CRM114-Status: GOOD (  23.88  )
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

Hi Lorenzo,

On Fri, 18 Sep 2026 17:10:43 +0100, Lorenzo Stoakes (ARM)
<ljs@kernel.org> wrote:
[...]
> > Nothing in the tree loads a vCPU whose init failed, so this is latent.
> > The pending KVM_PRE_FAULT_MEMORY series for arm64 does, and the second
>
> I think this needs clarification :)
>
> The KVM_PRE_FAULT_MEMORY series doesn't do this, or rather it only exposes the
> ability for the pre-existing generic kvm_vcpu_pre_fault_memory() function to be
> invoked by setting flags such as to expose pre-faulting as available for arm64.
>
> So something like:
>
>     The upcoming series that enables KVM_PRE_FAULT_MEMORY exposes an
>     existing bug in how vCPU initialisation is performed as it allows
>     the generic kvm_vcpu_pre_fault_memory() function to be called which
>     calls vcpu_load() before the vCPU might be initialised.
>
> For that bit.

That's what "does" was standing in for. I'll say that the series
enables the generic kvm_vcpu_pre_fault_memory(), which calls
vcpu_load() whether or not the vCPU has been initialised.

>
> > such load NULL-dereferences in get_s2_mmu_nested() under mmu_lock.
>
> Also I think this is a bit unclear, esp. the prior reference to 'second',
> not clear what that refers to. I think you should bring in some of the
> context you provide under the fold for the patch.
[...]

I'll bring the two-ioctl walk up from below the fold: the first
KVM_PRE_FAULT_MEMORY's vcpu_put() clearing hw_mmu, then the second's
vcpu_load() reaching get_s2_mmu_nested() with no nested MMUs to find.

> > Fixes: 1de10b7d13a97 ("KVM: arm64: Get rid of vCPU-scoped feature bitmap")
> > Fixes: 427733579744e ("KVM: arm64: Select default PMU in KVM_ARM_VCPU_INIT handler")
>
> Hmm are 2 fixes really needed? It seems to me that commit 427733579744e
> ("KVM: arm64: Select default PMU in KVM_ARM_VCPU_INIT handler") is the
> right one because that added a step _after_ setting the bitmap that can go
> wrong.

I'd added the first one because it's where the copy into the VM-wide
bitmap moved ahead of the reset, but nothing after the copy could fail
there. I'll drop it and keep 427733579744e.

[...]
> With the comments re: commit message/fixes tag addressed this seems correct
> and a very good spot thanks! We very much need this for the pre fault
> functionality.
>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Thanks!

[...]
> I also think you should put the stack trace in the commit message, ideally
> decoded via scripts/decode_stacktrace.sh!

Sure, will do.

Thanks,
/fuad

