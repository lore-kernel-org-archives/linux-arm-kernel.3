Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77886606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 06:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z9//jPdI;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RnW3Yfdm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:CC:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SPMA29WPhhsjMxZvTRe+slSGiqdKLUr7sgp7elTz1pA=; b=Z9//jPdIon5Mfpn076vYOcn8Ma
	Gx1xJljcqtsfZ3G1f3bRIO2P2dlk11W2kjlx/PHTYeZIRnDHlmRWqlw8LMMkhM3msLY/hYwfinZAe
	aINJrMBXfrkUCsh3XryMT1AX+LBeCVOFBu7GKmp1mVQLZC5KCmqJJZEla2o+11FZh670too9sBfU2
	6NxLoa8l/f6tzdP/YxEyC0dLWRcFzntpNbk2kxqoTUkpaL3VpJ5F7XqpK3uwsoT+ubcP5rIVJHns6
	bN22pHJS+F9dU5dgjZAx8bL6ofDLH35TkwsQGsiAMUSc3C6QR0CkCb5bxYtURhV7WhP0HJR/cDqP/
	7VPsFOsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLEaT-00000001nrg-00yK;
	Mon, 26 Oct 2026 06:53:41 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLEaQ-00000001nr4-0HLu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 06:53:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SPMA29WPhhsjMxZvTRe+slSGiqdKLUr7sgp7elTz1pA=;
	b=RnW3YfdmjVaoRj/dcdAYmw0sQp/hBgrto6g06vSgJHEMk5WtR02u8rgQUW/Ook2+F8BjlVz27
	Ozlh1tmJtnO1UzDU8OqbS7QNCKIxVe3/gv0IEEDPqVtEmXwJQcuGyJ3plsPbRilCrILn6NvRq0T
	OY8CTfbakkc/uOHZUiYAGeo=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jCkq34qGMz1K96Y;
	Mon, 26 Oct 2026 14:53:19 +0800 (CST)
Received: from kwepemk300016.china.huawei.com (unknown [7.202.195.98])
	by mail.maildlp.com (Postfix) with ESMTPS id B6B3040563;
	Mon, 26 Oct 2026 14:53:26 +0800 (CST)
Received: from [10.67.109.218] (10.67.109.218) by
 kwepemk300016.china.huawei.com (7.202.195.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 26 Oct 2026 14:53:26 +0800
Message-ID: <cf7a043c-384c-0642-204c-8f207eff3d42@huawei.com>
Date: Mon, 26 Oct 2026 14:53:25 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
From: Zhang Qiao <zhangqiao22@huawei.com>
Subject: [QUESTION] sched/clock: Potential timestamp jump due to inter-CPU
 counter skew?
To: Thomas Gleixner <tglx@linutronix.de>, <"John Stultz jstultz"@google.com>,
	<"Stephen Boyd sboyd"@kernel.org>, <"Peter Zijlstra peterz"@infradead.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk300016.china.huawei.com (7.202.195.98)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_235338_606567_9EF9C865 
X-CRM114-Status: UNSURE (   7.21  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,CTE_8BIT_MISMATCH,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,

While reading kernel/time/sched_clock.c, I had a question about counter
synchronization requirements across CPUs.

update_sched_clock() updates the shared epoch_cyc using a counter value read on
the CPU performing the update. Other CPUs subsequently call sched_clock() and
subtract this shared epoch from the counter value they read:

cyc = (rd->read_sched_clock() - rd->epoch_cyc) & rd->sched_clock_mask;
res = rd->epoch_ns + cyc_to_ns(cyc, rd->mult, rd->shift);


If CPU1 observes a new epoch_cyc published by CPU0, but its subsequent counter
read returns a value strictly less than that epoch (assuming no normal counter
wrap-around), the unsigned subtraction would underflow. After masking, this
produces a very large delta and potentially causes sched_clock() to return an
incorrect, massive timestamp.

For example, consider this hypothetical sequence:
1. CPU0 reads the counter and gets 1000.
2. CPU0 completes the epoch update, publishing {epoch_cyc = 1000, epoch_ns = N}.
3. CPU1 observes the new epoch, but its subsequent counter read returns 993.

Assuming a 56-bit counter mask, CPU1 would calculate:
(993 - 1000) & ((1ULL << 56) - 1) = 2^56 - 7

Although the counter read on CPU1 is only seven ticks behind the epoch, the
calculated delta is close to a full counter period. Passing this delta to
cyc_to_ns() could cause a multiplication overflow or yield a completely
incorrect timestamp.

This scenario assumes the inter-CPU counter skew exceeds the time it takes for
CPU0 to publish the new epoch and CPU1 to observe it and read its own counter.
(All values in this example are hypothetical).

My questions are:
1. Are there hardware or architecture specifications (e.g., ARM64 architected
timers, RISC-V) requiring counters on all CPUs—including those on different
dies/sockets—to be perfectly synchronized? If skew is permitted, is there a
specified maximum allowed skew?

2. If the sequence above is theoretically possible, does generic sched_clock()
already have a mechanism to handle a counter read that lags behind the shared
epoch_cyc?

Any comments or suggestions are welcome.

Best regards,
Zhang Qiao


