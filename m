Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B4ED64073
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 17:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vo3FLjhHwB8wDfeC70jiXwqljYidehpvAa+ZIClcpgY=; b=gLqnd1UnQYC9fvUBoKa0/c7PYd
	ILZkh4vV5QpHuHWvEBTvAtNTBV9pDL9ZRewQOEr0m9tMpQIjxsrGaML4SmVlEONbWLP5CHTWwBWOG
	GNKimNEsaO82v1gglTZbFIVHf2RdnlTvRgmdvgO31mQFDMjp7zXap1UR5WHkCE4FdNNkigYtCjZ67
	F78w90MngCc/m0tCOo0zVBvH7oEl7z5ils9ltReXraB+y0faGM6f3ONk3p0iEpDA5/Fi2SNezPRHd
	YGl1RFV8RRjkqMW8lONWphaIK2KA+mKg+YvQGIoFijWbpBE0hcMgw8gmt97au1coypt8OXMVrLMIv
	nNMUqU8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9SVK-0000000BKgb-1WeP;
	Fri, 08 Nov 2024 17:10:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9SBK-0000000BIZQ-2Q1j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 16:50:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 26BE0A43F00;
	Fri,  8 Nov 2024 16:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7E4C4CECF;
	Fri,  8 Nov 2024 16:49:55 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org,
	will@kernel.org,
	mark.rutland@arm.com,
	Liao Chang <liaochang1@huawei.com>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: uprobes: Optimize cache flushes for xol slot
Date: Fri,  8 Nov 2024 16:49:53 +0000
Message-Id: <173108456812.1559945.17269799494713828811.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919121719.2148361-1-liaochang1@huawei.com>
References: <20240919121719.2148361-1-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_084958_703925_8F5030D6 
X-CRM114-Status: GOOD (  11.58  )
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

On Thu, 19 Sep 2024 12:17:19 +0000, Liao Chang wrote:
> The profiling of single-thread selftests bench reveals a bottlenect in
> caches_clean_inval_pou() on ARM64. On my local testing machine, this
> function takes approximately 34% of CPU cycles for trig-uprobe-nop and
> trig-uprobe-push.
> 
> This patch add a check to avoid unnecessary cache flush when writing
> instruction to the xol slot. If the instruction is same with the
> existing instruction in slot, there is no need to synchronize D/I cache.
> Since xol slot allocation and updates occur on the hot path of uprobe
> handling, The upstream kernel running on Kunpeng916 (Hi1616), 4 NUMA
> nodes, 64 cores@ 2.4GHz reveals this optimization has obvious gain for
> nop and push testcases.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: uprobes: Optimize cache flushes for xol slot
      https://git.kernel.org/arm64/c/bdf94836c22a

-- 
Catalin


