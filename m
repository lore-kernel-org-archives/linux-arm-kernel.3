Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7339AC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 12:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3x2BJVRo9MNnC4r9i3H/JeHovKkDhctghBqHffiq8uA=; b=JXfjrxFd0AnttPGXjpbbmMh+oT
	hq44WrHIwhL1M5VkZwU+l2JceWvTF8tKyEq9Q+D04+3JJYvjsIPhI+Ad9utBhCSigH85EgYhH5uqN
	snrD+shUc+LGK46tP/4EXSzpj5IsUIxZuyY8E2OjpVSwQljGb/4lqSHhufNyKVQV4s1sj70yEsQ2e
	0/a+wpiLVVlPbtDiU0ic+dUsuwr8O49woiN6hyWhETFQMzOxg4iF7QvjxJ4jLRYeLIDP4oJswUdrX
	E3ouV4z4RD9SQLWzmGIjndFrWl5Sk8IiANexM/RN95pjtlWLQhr9Aziqh4iUkiX9wZRkHpesKYJYw
	QIrx90Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQtP-0000000AwCH-2iF5;
	Tue, 03 Jun 2025 12:37:23 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQrC-0000000Aw12-2nXz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 12:35:08 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4bBVSK3nP7z1BFhD;
	Tue,  3 Jun 2025 20:31:13 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id 78D9318007F;
	Tue,  3 Jun 2025 20:35:01 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 3 Jun 2025 20:35:00 +0800
Subject: Re: [PATCH v2 0/3] KVM: arm64: selftests: arch_timer_edge_cases fixes
To: Sebastian Ott <sebott@redhat.com>
CC: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Colton Lewis <coltonlewis@google.com>, Ricardo Koller <ricarkol@google.com>,
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
References: <20250527142434.25209-1-sebott@redhat.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <adf8b877-7ca2-f60b-fb59-578c70d0e3c0@huawei.com>
Date: Tue, 3 Jun 2025 20:35:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20250527142434.25209-1-sebott@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_053506_863988_F8E813C1 
X-CRM114-Status: GOOD (  16.56  )
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

Hi Sebastian,

On 2025/5/27 22:24, Sebastian Ott wrote:
> Some small fixes for arch_timer_edge_cases that I stumbled upon
> while debugging failures for this selftest on ampere-one.
> 
> Changes since v1: modified patch 3 based on suggestions from Marc.
> 
> I've done some tests with this on various machines - seems to be all
> good, however on ampere-one I now hit this in 10% of the runs:
> ==== Test Assertion Failure ====
>   arm64/arch_timer_edge_cases.c:481: timer_get_cntct(timer) >= DEF_CNT + (timer_get_cntfrq() * (uint64_t)(delta_2_ms) / 1000)
>   pid=166657 tid=166657 errno=4 - Interrupted system call
>      1  0x0000000000404db3: test_run at arch_timer_edge_cases.c:933
>      2  0x0000000000401f9f: main at arch_timer_edge_cases.c:1062
>      3  0x0000ffffaedd625b: ?? ??:0
>      4  0x0000ffffaedd633b: ?? ??:0
>      5  0x00000000004020af: _start at ??:?
>   timer_get_cntct(timer) >= DEF_CNT + msec_to_cycles(delta_2_ms)
> 
> This is not new, it was just hidden behind the other failure. I'll
> try to figure out what this is about (seems to be independent of
> the wait time)..

Not sure if you have figured it out. I can easily reproduce it on my box
and I *guess* it is that we have some random XVAL values when we enable
the timer..

test_reprogramming_timer()
{
	local_irq_disable();
	reset_timer_state(timer, DEF_CNT);

	/* Program the timer to DEF_CNT + delta_1_ms. */
	set_tval_irq(timer, msec_to_cycles(delta_1_ms), CTL_ENABLE);

	[...]
}

set_tval_irq()
{
	timer_set_ctl(timer, ctl);

	// There is a window that we enable the timer with *random* XVAL
	// values and we may get the unexpected interrupt.. And it's
	// unlikely that KVM can be aware of TVAL's change (and
	// re-evaluate the interrupt's pending state) before hitting the
	// GUEST_ASSERT().

	timer_set_tval(timer, tval_cycles);
}

I'm not familiar with the test so I'm not 100% sure that this is the
root cause. But I hope this helps with your analysis ;-) .

Thanks,
Zenghui

