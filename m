Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B84CCA5FDE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 21:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nT9hMrtZRR/2siI80QtehZ8BnMD1l4DAL83J/BAbUcM=; b=jXv4J+sT+IbpK91LA1SC2lVQXI
	C+M8BHWknujzXnec8IS0X1/Tie2c5A70JjlgLzLopa4LVXSw+PTHdpao+d1cN/24T2wjRZ5BfPUi2
	3yY0jqZ99O0SXM6EZc+PLTDPiA2oG8RTybRYLSVdGDlwLJgVAPflhZA4BAlVXGSSHup/vFJagsXx3
	ONjHA+IxcM4Bsfxu62qT0ltGHme6a91bTYcapgRaj5AEfi2YxlCgrwsGhvPCYZBWIrAq36p7M+raX
	vEzq9ZkO8C0RjKw71BUwfJ9HEnP9gP526Q0CGNZzwETBkANnPbgmKZeroixrfIuubOjnUx6ioJ0cL
	Q90e+Ipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCOPo-0000000AHDC-3D7k;
	Thu, 01 Oct 2026 21:34:08 +0000
Received: from mail-oi1-x247.google.com ([2607:f8b0:4864:20::247])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCOPg-0000000AHBI-2RMb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 21:34:01 +0000
Received: by mail-oi1-x247.google.com with SMTP id 5614622812f47-4cbf700ddccso6996568b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 14:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790890439; x=1791495239; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nT9hMrtZRR/2siI80QtehZ8BnMD1l4DAL83J/BAbUcM=;
        b=Ckjjj/1vj5a4gEokEJPQ0qwYolNSHawAbCOyu4LxLN0INNjYTc7MeQwM/iERoIfs8X
         6kdPSf6ugiyl/lNXtG6suq6Q7Gkbp9hs6HRpxJ74Wn4TB90yTX/nNA0JAWwj9EOGPG0J
         mIMeZPVS2Nu1eIQxl8OT+V6TS+AQVx1XETnYdazZMxSSzmqVpijOBDaTAvkRSnQY+sTL
         dRQpZey+hCYal2WKWkhnRlGitfx75Naaojbwyf1fLuX/6frB5iwzyYOKWwQayrFXKjfu
         ubwypu4hoWGRXJniNfy3ZqtjjLK8jUfp87l9f7DYn87zRPgTG3Re1h6qA6AxQ/fmP5Ye
         MgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790890439; x=1791495239;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nT9hMrtZRR/2siI80QtehZ8BnMD1l4DAL83J/BAbUcM=;
        b=ILlzwEFyGHGySfVnRcWM0Of+ZKmZQJjMZbNIB6TMYhpIqUsNKhCMYXLJPZFtNu9hZY
         veDHudC/lT7KIfzDah16VcrwCexcvpPYZYLnYnvPU5rTJ9pM6u1vC+LOidn6diRLvk/+
         7mBizdbfevb7BULezaq4QcDJOLupb8+PFV1R1TJTBEi/r4azjNjGXXRz92NfwReInu7R
         ONLUCtxoIhoIkCquwIQx05fou32zMOAH+Bvi9fZJz9CP7PcqIuIy8uF+3YbUQkoKg1vk
         vbcW2B7wuRymKSuw6OjqxbAMD6pQ5xc2tDXFeyV8FV6cmG5obgk0xP/10IZz6ZJzK4Pa
         UWsw==
X-Forwarded-Encrypted: i=1; AKwUvBx3SEsk+NJ9RhS7HROxmK1m+SjPh/krEW0e3IRbXLPYeHVmp3OlwFR86iEMTEEIgjgHO2vPYLC6J5sWkOU4j0sA@lists.infradead.org
X-Gm-Message-State: AFuF++kG62N5xRI2wxdqXQmdg6AbpeXATEWCv68GluWExGjGjR3RkPUi
	yOrtwtcKvMeSMnosRx4IOkRquhb9Sbu0z4HRGxZGI61h0s8IH6bF6mbRgen7HnWKsqGWhLF0W8D
	bfM9FOYyRjMmZI4gzkraJo6llRA==
X-Received: from ioben34.prod.google.com ([2002:a05:6602:3f62:b0:9af:289c:476c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:bc1:b0:4c3:2e7:55bb with SMTP id 5614622812f47-4f52a57e776mr435364b6e.38.1790890438606;
 Thu, 01 Oct 2026 14:33:58 -0700 (PDT)
Date: Thu,  1 Oct 2026 21:33:56 +0000
In-Reply-To: <5750151d-cb99-4f9d-b469-12a7b7796985@linaro.org>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com> <5750151d-cb99-4f9d-b469-12a7b7796985@linaro.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001213357.2088894-2-coltonlewis@google.com>
Subject: Re: [PATCH v9 00/22] ARM64 PMU Partitioning
From: Colton Lewis <coltonlewis@google.com>
To: James Clark <james.clark@linaro.org>
Cc: Colton Lewis <coltonlewis@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Zide Chen <zide.chen@intel.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_143400_627576_C37935E9 
X-CRM114-Status: GOOD (  21.57  )
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

Hi James,

On Wed, Sep 30, 2026 at 04:26:23PM +0100, James Clark wrote:
> On 24/09/2026 18:29, Colton Lewis wrote:
> > This series creates a new PMU scheme on ARM, a partitioned PMU that
> > allows reserving a subset of counters for more direct guest access,
> > significantly reducing overhead. More details, including performance
> > benchmarks, can be read in the v1 cover letter linked below.
> >
> > There is no longer a kernel command line parameter
> > (`arm_pmuv3.reserved_host_counters`); PMU partitioning is now completely
> > controlled via the KVM API using `KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION`
> > and `KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS` vCPU device attributes. When
>
> As far as I know there isn't a straightforward way to get the number of hw
> counters from userspace. You have to either parse dmesg or attempt to open
> incrementally more counters in a group until it fails.
>
> This makes doing things like "use all counters for guest" or "reserve two
> for the host" difficult. Maybe it's time to add a file to the PMU that
> userspace can use query this.

Inside a VMM, userspace can query the default PMCR_EL0.N via
KVM_GET_ONE_REG(SYS_PMCR_EL0) after KVM_ARM_VCPU_INIT (or
KVM_ARM_VCPU_PMU_V3_SET_PMU) and before calling
KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS, since KVM initializes
nr_pmu_counters to the PMU's max_counters (which is how
vpmu_counter_access discovers the limit).

For users and management tools outside the VMM (e.g. choosing N to pass
on the QEMU command line), I agree it's awkward that
/sys/bus/event_source/devices/<pmu>/caps/ exposes slots and bus_width
but not the number of counters. I will add a patch to expose a caps
attribute for the number of counters in drivers/perf/arm_pmuv3.c.

Thanks,
Colton

