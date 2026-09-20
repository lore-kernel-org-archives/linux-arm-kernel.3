Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7274DC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 01:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WpODz2I1SYGcsUWYzvIvLHX+tQtY3cfA1JpYBgPLg5s=; b=kMm9BR7vFxUGUHUD3Uf1Z0r1bj
	g4sPnywKLyt2gBItBP077pDOBanoHTqulaOhFUr5ICOcODgHMor0keK/AwVolcmTVm2lmjfdAfdrp
	A+QvYsF8h6LjmnwKF+RK4/nQw/mCXgymx7bvdn18MDsSmzYpyG7dlBnkU7qFkz2H91djKYob9LU2V
	ZvdMYCe5VeHRwtjxky4j+q/pDM5FT4Pat/psK30Prr3S5dJXJsGkd6GPNWDIx1gwBR6XSkmE7dfOW
	G1K5Ihito7ctrs8XL/+FltMecEkf2bBY8MB7LEtZgSvkw2xdcMydpQMTEpyqLsE/giX9IEgkQFlGC
	+YT1wxwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x86Qk-0000000GjJn-2lRz;
	Sun, 20 Sep 2026 01:33:22 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x86Qh-0000000GjJO-0PqB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 01:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789867991; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=WpODz2I1SYGcsUWYzvIvLHX+tQtY3cfA1JpYBgPLg5s=;
	b=JuBcKjzah4Bw4zjmnDzKfk3pRqksXKx1JD676AoyC+G+jFPgmPlgNc752nThMAgzt5+nZoUETZFwX9Ke7auLrsS1l2apH77TAw8C/4LWz+Wl9s4G8/ov2c3XwstNdpojRuyzYyfMZKcEdMXtq4AEiJA5rA/8Vc0FHzQBtPGzI3E=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0XBEinmW_1789867989;
Received: from 30.246.177.75(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0XBEinmW_1789867989 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 20 Sep 2026 09:33:10 +0800
Message-ID: <b3da18cc-78b2-45cf-9ea8-ce867c631834@linux.alibaba.com>
Date: Sun, 20 Sep 2026 09:33:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] KVM: arm64: nv: Implement nested stage-2 reverse
 map
To: Wei-Lin Chang <weilin.chang@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Itaru Kitayama <itaru.kitayama@fujitsu.com>,
 Wang Han <wanghan@linux.alibaba.com>, "Lorenzo Stoakes (ARM)"
 <ljs@kernel.org>
References: <20260915154305.3852871-1-weilin.chang@arm.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20260915154305.3852871-1-weilin.chang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_183319_888326_0829A342 
X-CRM114-Status: GOOD (  11.43  )
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



On 9/15/26 11:42 PM, Wei-Lin Chang wrote:
> Hi,
> 
> This is v6 of optimizing the shadow s2 mmu unmapping during MMU
> notifiers.
> 
> This version fixes a few issues, and adds Marc's space optimization
> for kvm_guest_s2_mapping [1]. Please see the changelog for the details.
> 
> Tested by booting L3, and running in-kernel targetted tests described
> in [2]. v5 got some tested-by's from Itaru and Wang (thanks), I didn't
> carry them over since some bugs fixed in v6 are non-obvious. Some
> retest would be much appreciated!
> 
> Series based on v7.3-rc3 + Marc's nested mmu lifecycle fixes [3].
>

Hi Wei-Lin,

Thanks for the updated series.

I tested all seven patches on top of v7.3-rc3 with Marc's two
nested MMU lifetime fixes, using the L1 boot workload that previously
triggered soft lockups during host NUMA migration.

The setup was:
   - ARM64 host with nested virtualization enabled
   - Automatic NUMA balancing enabled, with numad running
   - QEMU 10.2.3, virtualization=on
   - Ubuntu 26.04 L1 guest, 8 vCPUs and 32 GiB RAM

Each trial used a fresh overlay backed by the same read-only golden
image. I ran 15 boot trials, observing each for at least 600 seconds.

   Result                         Count
   -----------------------------  -----
   Trials reaching guest login    15/15
   Trials with guest soft lockups   0/15
   Guest RCU stalls                   0
   Host hung-task reports             0
   Host soft lockups                  0

Tracing confirmed that host page migration and the reverse-map
recording path were exercised. I did not reproduce the original
soft lockup in this batch.

For the series:

Tested-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks,
Shuai

