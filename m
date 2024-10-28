Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FE5D3E2A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 19:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8V+uFBFKCdrp0N8Uwf8EaMC+XfBivxTYVsNuIPzM2o=; b=GIpVDIZ74Hkbxwy41tt66xfQox
	AdTvTOaj1oSIpVBq8vSuVJK0EFamSZsoXEGTCkkgUD3ByhGYg8Ffh0FvnrNuZH1tMc4vREZMV/DJN
	K6MiCMzRr0IRHyXt2Bw7guv1YXvyCgncTnRi8tmjcl8DJsxjSZRnYa68Wl0n8lvfTRaiSYSFAz9rY
	SMXqJh8sc3GVlRHebTJkbdwFuplS/hafgk+0He/L6+DsObXmD0dlPn9ztWCJ3Rs82TaMWEhSZnp5I
	shftVX8h0/lLCxOeAYrlqYxvbjO2l/wazFIA5+7XCkIzvCYookxn6eXLTRO9W1G0M2ILwm9ha2nVF
	RlMEq9Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5V18-0000000Bw6I-0e1V;
	Mon, 28 Oct 2024 19:03:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Uqr-0000000Btwm-3J9o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 18:52:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D242CA42AD1;
	Mon, 28 Oct 2024 18:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99849C4CEC3;
	Mon, 28 Oct 2024 18:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730141548;
	bh=ZASCXqyqeKEqmkgLJmRKVYVAx20KxDN1lRlbt5A3fTM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SlQxEFz7DrVnEJOW/sRypc1wm8pKWjk41lSbDk/n+rQhpZNMZFot5MSStmb4ve8yH
	 InAB8xVutdi6YWWNziUzp30uaVK8/+ZitVLZqjC9KEfOedZLuy0bl2RBxWC+Wq3UNH
	 x92KgaXo4aFxvocDOSLMBaQwfm+kql1I8QnDdNefQjtOeT4ZJdQjnnByne1vTN6lJ8
	 y5omnyXk4p+PkvfQ6WJVJ+NyLsW9jRiOer6zkJkiy1qdFcAysWXpoiaqBFMV8fjjhX
	 4HMsJzJt0kKRf7h6drgVAgmnLqTKNnZINv/ErENgCcRKlM1ejM/i2JLsCV0qBXRPdF
	 SFGnTk131IbMA==
From: Will Deacon <will@kernel.org>
To: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Gowthami Thiagarajan <gthiagarajan@marvell.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	gcherian@marvell.com,
	sgoutham@marvell.com,
	lcherian@marvell.com
Subject: Re: [PATCH v10] perf/marvell: Marvell PEM performance monitor support
Date: Mon, 28 Oct 2024 18:52:20 +0000
Message-Id: <173013693587.4157891.11060695677574129414.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241028055309.17893-1-gthiagarajan@marvell.com>
References: <20241028055309.17893-1-gthiagarajan@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_115229_907641_1D0FFCEF 
X-CRM114-Status: UNSURE (   7.64  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, 28 Oct 2024 11:23:09 +0530, Gowthami Thiagarajan wrote:
> PCI Express Interface PMU includes various performance counters
> to monitor the data that is transmitted over the PCIe link. The
> counters track various inbound and outbound transactions which
> includes separate counters for posted/non-posted/completion TLPs.
> Also, inbound and outbound memory read requests along with their
> latencies can also be monitored. Address Translation Services(ATS)events
> such as ATS Translation, ATS Page Request, ATS Invalidation along with
> their corresponding latencies are also supported.
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf/marvell: Marvell PEM performance monitor support
      https://git.kernel.org/will/c/e1dce56443a4

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

