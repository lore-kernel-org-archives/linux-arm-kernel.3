Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5C1CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a+tv5OHvSrWehvQxjL3ZqCHT1d5+lnZ2bKVY0r5kGck=; b=fgbAttFLuKzxOz
	O/Y9JiP5C4A/jizM7wVsGWVJhJ3AAK2FXKPTgYoJKT+T8iyrJeLIMmxKZrNNaoWdx//NqD7awZBmk
	TZY6DYcZiAycK6WagHa+x3VdeBTninxqO5MuD2J5gB+1z/h69UGtlM9Nxo7Y9PpqUNx5XVWMlSZ6J
	i0HPq11I1g3zrdlRE6ksBtxSmJS08Vtte9c7Bkw1wSo9+AJ23ygbid/8Lx7CmEevvoo5gnVcD+jz3
	YCTKcDTq7IEFgK2ic638faHDXD+LHzoKQ+J9shAO1PlKrPR+GabBHvTYmlPrxvH+cCKJ2ht/lkwQP
	h6l8RHxqsJifiZJOeghg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGvV-00000004UBe-2Ms5;
	Wed, 27 May 2026 16:16:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGvR-00000004UAb-2R4j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 16:16:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63A6D35B9;
	Wed, 27 May 2026 09:16:01 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.28.175])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CFC983F905;
	Wed, 27 May 2026 09:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779898566; bh=wpBP5C7GduCZxr69u7h55i3GbDiEMdcFYcDDRpt8B+w=;
	h=From:To:Cc:Subject:Date:From;
	b=Y+X3aTeNmK/97VxNDzz/6X2Vuny+pyxBZ0nilU2ijy5Zf8UWFfNJn/8oKbYDQNIUc
	 5jUR6moQfD0BsXfOn8sGnZSz3aK1ModtTy5iyKvc/yp/UtW3gmH/Lfudp6u/qP8BAp
	 xJ2oMipUj8g425L6mut2rMAR8IsNFV3loYY5EhbM=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] arm64/debug: clean up some HW BP edge cases
Date: Wed, 27 May 2026 17:15:51 +0100
Message-ID: <20260527161553.97676-1-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_091609_665558_7A136B71 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

This is a small series focused on fixing some unsoundess and edge case
related to hardware breakpoints and watchpoints.

It is motivated in part by the recent discussion on the
FEAT_Debugv8p6 series[0][1] regarding unclear guarantees on interruptions.

It doesn't address the issue of instrumentation, as NO_KPROBE is not
sufficient to prevent it (specifically ftrace) and would require a pass
over the whole debug handling code.

The bugs themselves are very much of the self-inflicted
"you should not be doing this" kind and not urgent, but it does solve
some of the questions on the FEAT_Dbugv8p6 series.

Most of the raw additions are comments trying to give more context to
understand `hw_breakpoint_thread_switch()`.

Thanks in advance !
Ada

Based on v7.1-rc5

[0]: https://lore.kernel.org/linux-arm-kernel/20241216040831.2448257-1-anshuman.khandual@arm.com/
[1]: https://lore.kernel.org/linux-arm-kernel/adeE4MD0RgapI8aL@J2N7QTR9R3/

Ada Couprie Diaz (2):
  arm64/debug: update perf slots in sync with BP registers
  arm64/debug: mask exceptions when switching cpu-bound watchpoints

 arch/arm64/kernel/hw_breakpoint.c | 52 +++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 16 deletions(-)


base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
-- 
2.43.0


