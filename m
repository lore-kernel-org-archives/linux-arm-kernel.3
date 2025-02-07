Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B320AC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 11:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKLmsvbHT/xQ/0x68ToblwySEdRLRYmqZuMxrvvyVo4=; b=ks85UF4fUXvQ0ONMhcUC10MGcb
	DFca0eOJha+QDFCELM2f0AsJi4z+wZwEfRDjBpFTsKEFB2rUJzmDR1FB9KJ4qqgRTJytw8jTASvPY
	oSUKuq/u9HQHG5vxoVjcACBsWM0Lzzey1Sk3D9G3ikymsNrH3VEMuZQ8A2pXQwT3L4M37tAhQv22l
	KUnpoCFwyvn6wOosDbM4cDBu+HQckUAUjJ3GhSM4Gz/zaxbsLbKg6qVGbG0jKVUXahWx7wu4U9Z95
	l6Bvu7bneLCLIuhN04FHWnlB9uAHjsE7K4J59IT3TSWbXZVFmx9hQwgiIBq00gPXjrP68YWW/hQHK
	0Oxaj7CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgMip-00000009Nl4-4049;
	Fri, 07 Feb 2025 11:40:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgMg8-00000009NPA-1PxC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 11:37:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 196F35C5D20;
	Fri,  7 Feb 2025 11:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19FEC4CEE2;
	Fri,  7 Feb 2025 11:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738928267;
	bh=NESJhgVn8DyhtassCTMYNmtodxNqtIgaKMf1Ay6FQNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DS3lWbLT+xdHQC/CL48rYaWVSl2TkCTVrlE7NjQpgOnt/Rq1OLepp6zBONqOgHOv0
	 5YBmwwI97St3mqRZOH2XLVUHiF8hwpvnx233fJjSl5ngV3TqbiCenzwM8FSKCC0/kV
	 4FlTvqlgsvuWnl3KrL8L87eRa7AK9/cqMlht0qbI6dN+FnL1HzJ4TTpLnBy49mRLiX
	 kvgvGV2bAHOGIBy7YK8Jf3LOa6nFZr+Wa5xgpPIWFo5TPjeKvSEklN54gVETQzshW4
	 0aiAdWXPiER7JxxkbgR8MAlefZZQ0jgfVSATuwiiPUXqfe47hyz5JoJXwJDRtSsH+p
	 dX2LT+0ah3LIg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Radu Rendec <rrendec@redhat.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v2] arm64: cacheinfo: Avoid out-of-bounds write to cacheinfo array
Date: Fri,  7 Feb 2025 11:37:40 +0000
Message-Id: <173892227666.1467265.12607921985773083715.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250206174420.2178724-1-rrendec@redhat.com>
References: <20250206174420.2178724-1-rrendec@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_033748_416292_844D0A62 
X-CRM114-Status: UNSURE (   8.13  )
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

On Thu, 06 Feb 2025 12:44:20 -0500, Radu Rendec wrote:
> The loop that detects/populates cache information already has a bounds
> check on the array size but does not account for cache levels with
> separate data/instructions cache. Fix this by incrementing the index
> for any populated leaf (instead of any populated level).
> 
> Fixes: 5d425c186537 ("arm64: kernel: add support for cpu cache information")
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: cacheinfo: Avoid out-of-bounds write to cacheinfo array
      https://git.kernel.org/arm64/c/875d742cf532

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

