Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21533C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yU9VQ9NTfO/ol5NMPe+cjd7kCmQXu0yguk9OSa4yvw=; b=OrUSRChyTM02y/wjzCMk0lgude
	crp8sU2ZzJ6/ENlwdrdpT0OadadK4IRX6JRC3GC7qK//E7hCh0lUV82LN7liZm7UdoHEbx178vRVX
	owncbWQ2wjBDkC/mzmig3+SsFTfhZreTCjV6+4MCbQUaDnWNSPuXV3/qI2PSpyGNVTVUnSKOPoJ5J
	5I8Kb2Q5SF/EM5DLl6QsS8/PM6Gp6uZXPSYWBf3Kuyk8/jMQ5cLXnVEmPWeAc7GjOo/M9ydpquTAF
	aA+fVi/JN1Y7PJjYNhFE5sKAOE2/orrisTRZ5aaXhFn1l4x+HMogMUH93Fpf8NdQ8RsA6GaAIj73r
	bd38ea8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2P53-00000001Lr9-18Q8;
	Fri, 04 Sep 2026 08:15:25 +0000
Received: from out-85.mta0.migadu.com ([2001:41d0:1004:224b::55] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2P4z-00000001Lpz-3HnN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:15:23 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=PvS/b2Z/rWbhXmaZRpQZt7dAKEvw4kUH2lDXouIPU/Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788509719; v=1; x=1789114519;
 b=tK7fuDs/LKiQDnZg+jday5NS+rCi6phLKcz2VHSMul3M2BUPuiu2w+D2g23jx2CBHDFLmtB2
 nO2gbz57G1WFmvxTwSB5EZNo6OiBtTAUZewe3ggvEVXh5I/QzPbHrFUDIwj5s4Jnd5qORMFc+0f
 ArMHskl8t1u+0WYgW3FZd1YM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 37a69d31ad5c5577;
	Fri, 04 Sep 2026 08:15:18 +0000
X-Mizu-Trace-ID: 37a69d31ad5c5577
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so3450e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 01:15:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByRUMaTl/4iIwyuy7C5/x9vxYz8o9lQo+G6FOqskkV/Wnp0eiXew0mPaxatgiHagcA63x6tGmK9Gi9WmalZhqK0@lists.infradead.org
X-Gm-Message-State: AFuF++nM15bY8aKhRCHTpEGj9wNqzlciiMPBz9rUkp50UnNBG/n6tGgo
	yxQZpaL1XMZoMxCQSifC7TQaoFnKmdXilNMYcSn1Uqtyi2JADPw1kchBMKP7pCVETcsAouzcvTP
	DVtYUKsXNYRcPW+8DFXYpOZ5ZjR+Bsx6j78wmD1sB
X-Received: by 2002:a05:6512:1112:b0:5b2:a967:c0e1 with SMTP id
 2adb3069b0e04-5b616f28401mr90649e87.0.1788509712868; Fri, 04 Sep 2026
 01:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260826-arm64-52bit-va-v1-0-14ec98211363@fujitsu.com>
In-Reply-To: <20260826-arm64-52bit-va-v1-0-14ec98211363@fujitsu.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 4 Sep 2026 09:14:36 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwPmwPTMcgQB6zt47Kz6NPMr+FkGfq2Qq+Uxu+G427OEg@mail.gmail.com>
X-Gm-Features: AcwNN1WvopgDxoDNDPRaykUroX4fh4XjNCnUWBoPOLttdFGRxQfbeOfusjQcANY
Message-ID: <CA+EHjTwPmwPTMcgQB6zt47Kz6NPMr+FkGfq2Qq+Uxu+G427OEg@mail.gmail.com>
Subject: Re: [PATCH 0/2] 52-bit VA guest mode ID support
To: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Takayuki Okamoto <tokamoto@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_011522_267500_D2703A02 
X-CRM114-Status: GOOD (  20.13  )
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

Hi Itaru,


On Tue, 25 Aug 2026 at 22:18, Itaru Kitayama <itaru.kitayama@fujitsu.com> wrote:
>
> This patch series extends the arm64 KVM selftest framework
> to support 52-bit guest virtual address (VA) modes in addition to
> the existing 52-bit physical address (PA) configurations.
> The motivation is to enable validation of LPA2 guest memory-management
> behaviour in configurations that use a 52-bit VA space.
> While the selftest framework already supports testing 52-bit PA
> configurations, it lacks the ability to exercise guests running with
> 52-bit virtual addresses, leaving part of the LPA2 functionality untested.

The series adds three 52-bit VA guest modes, but nothing in tree maps
a guest VA high enough to use them. The mode-iterating tests map at a
fixed low GVA, so pgd_index() returns 0 and only the first entry of
the top level is ever used.

What do you expect the modes to catch as they stand? The allocators
already take a minimum GVA, so mapping high in one of those tests
looks like a small change.

> To address this, the series introduces new guest modes for 52-bit VA
> operation, adds five-level page table support where required, and
> performs runtime detection of host 52-bit VA capability so that
> LPA2-enabled guest VA tests are executed only on supported systems.
>
> Testing:
>
> Built and tested on arm64.
> Verified on QEMU with a V52-capable guest configuration.
> Confirmed correct operation of high virtual address mappings by
> exercising guest memory accesses in the 52-bit VA range.

I could not reproduce "exercising guest memory accesses in the 52-bit
VA range" with anything in tree either. Could you say which test you
ran, which guest modes, and on what?

Thanks,
/fuad

> Signed-off-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Reviewed-by: Takayuki Okamoto <tokamoto@fujitsu.com>
> ---
> Itaru Kitayama (2):
>       KVM: selftest: arm64: Support 5-level paging in stage 1 translation table
>       KVM: selftests: arm64: Add 52-bit VA guest modes
>
>  .../selftests/kvm/include/arm64/processor.h        |  2 +
>  tools/testing/selftests/kvm/include/kvm_util.h     |  3 +
>  tools/testing/selftests/kvm/lib/arm64/processor.c  | 87 ++++++++++++++++++++--
>  tools/testing/selftests/kvm/lib/guest_modes.c      |  5 ++
>  tools/testing/selftests/kvm/lib/kvm_util.c         | 11 +++
>  5 files changed, 103 insertions(+), 5 deletions(-)
> ---
> base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
> change-id: 20260825-arm64-52bit-va-32f1f4cd050d
>
> Best regards,
> --
> Itaru Kitayama <itaru.kitayama@fujitsu.com>
>

