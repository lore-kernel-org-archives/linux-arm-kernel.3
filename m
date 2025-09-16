Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BAACAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 12:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wxU0snakUh0UqJ/kOudQ3ZsPKdVElU9LzUfnZ0C2HY=; b=JfZ8iZZoke9GJXUN4ZwnguN83D
	8lbi6uBhuqyHklGoMjvLr00BY2fqBNu5+zKaaF1OTgJR0aaVtX7X/KMWE0cF65RBEQKXXl6gwKi+K
	nDeFa9UYi2MlJKGMUm/EbsgVlwvt1m2kHr4mVE0uv5yjr54PdqrgjQqmXSPtH+AlViHdyuJlLB/Zb
	ts6Xgp+gROVfH94rnLx2wOSmQcYDwWuafm4ImiG9LF8s4zzjn9NAS+o+qzihXS2WR03lVfCUZtjut
	C7eruSQsp4RupJ9B1fb2OMEmhqqYTq+BZuB5E8x5av1WhQbWlYvMeTDwFOiW7tmYtQ8tN3At52SRD
	0stps+Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVBZ-00000007pxG-3Hjj;
	Tue, 16 Sep 2025 12:53:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVBY-00000007pwx-3LEs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 12:53:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 34E9860143;
	Tue, 16 Sep 2025 12:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF14C4CEEB;
	Tue, 16 Sep 2025 12:53:25 +0000 (UTC)
Date: Tue, 16 Sep 2025 13:53:22 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, james.morse@arm.com,
	ardb@kernel.org, scott@os.amperecomputing.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v7 4/6] arm64: futex: refactor futex atomic
 operation
Message-ID: <aMldwgxOh3VjuSLC@arm.com>
References: <20250816151929.197589-1-yeoreum.yun@arm.com>
 <20250816151929.197589-5-yeoreum.yun@arm.com>
 <aMRQIeIdyiWVR8a0@arm.com>
 <aMfrR0vserl/hfZ3@e129823.arm.com>
 <aMhrscd1gz_syMtL@arm.com>
 <aMiUX0O3MpdRyb3f@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMiUX0O3MpdRyb3f@e129823.arm.com>
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

On Mon, Sep 15, 2025 at 11:34:07PM +0100, Yeoreum Yun wrote:
> with selftest's futex testcase, I've tested.
> But Since there is no test for each operation even in LTP,
> I tested it with additional test from me.

As a separate series, you may improve the futex kselftest to cover all
the cases.

-- 
Catalin

