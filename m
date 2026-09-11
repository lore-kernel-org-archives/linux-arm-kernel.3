Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C267BC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/gnEWBZBBZeAGzcXhNZJLq+4jTjWHhMRP3+5fPBvFM=; b=O3ZhrxTJT88Wg6
	SjFTBxWspTuXxRdNg0Vn1ESDfik4hlA77/oPjTIsKUhTN9ZYlWMTPRgtCbwb4jHVfcwarxbRH/vUd
	xRltN8BR//cLEYrukTuIoYQ7v6JFG3wuRMbkIVSqOolSGeuhTmIpMMKTSfUb3l84y4y6g4XrJoO9T
	H+zdoeofqagIetcuOHRacmWIBwKHN2MX3G1g6G+cN0c1+e+M3Qirr6bmfttK7bUlL1WkDOiw91frL
	Rzg9jPND0sfjgXpZBWxhTqT4abGzYsrAlKGwbp7Ilu5w0nObo+C2wcWCjspMIlah7A+ameyShJnBW
	qziEevnAepoGd15sV/tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51YW-0000000GmQV-3HlC;
	Fri, 11 Sep 2026 13:44:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51YK-0000000GmKp-0TRu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:44:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D9CD944801;
	Fri, 11 Sep 2026 13:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CD71F000FF;
	Fri, 11 Sep 2026 13:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789134267;
	bh=O/gnEWBZBBZeAGzcXhNZJLq+4jTjWHhMRP3+5fPBvFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LZ3QFGOfGKR1bOVfD2b1kPQy9WekS03uMZ8D7/gg10AN9xnBV/2v+byGsD0T5k0Rh
	 +UfZqDfqcJk20w+R6EZbm4n+rd2T9pkcrG9JMhigWdAWAWK4/xleJcmc8EBd38vwDz
	 OiQhidquGjHh/OtQ6g8MR/xl1iLpQYNDIlADe8p9VU6YQO0ApPiTPxP7j0xU+lrn35
	 YTi/t7NDaT3lQNst5vjoeJHwvTDWxhFnEsUGnJ7SaO+kb+DG9l2GrgjiR52FQOhnQa
	 UiGcLsdG0qMoiCEV9kg/AxIux9xYkPzsH+drBOvoIkQMcSDiGKVgcHOL09fp1m0fGd
	 pb7/Y/ypj+G8A==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v4 00/21] Preemptible this_cpu_*() operations
Date: Fri, 11 Sep 2026 14:44:10 +0100
Message-ID: <178912994348.2451035.18388822109867455442.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260908151741.394589-1-mark.rutland@arm.com>
References: <20260908151741.394589-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: vladimir.murzin@arm.com, ryan.roberts@arm.com, usama.anjum@arm.com, Will Deacon <will@kernel.org>, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, kernel-team@android.com, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 08 Sep 2026 16:17:20 +0100, Mark Rutland wrote:
> This series reworks arm64's this_cpu_*() operations such that they do
> not need to disable preemption. The scheme is described in detail in patch 13,
> and is similar to the approach Heiko Carstens applied to s390 [1], which
> inspired this series.
> 
> This scheme should build and function in all kernel configurations (e.g.
> regardless of KPTI, SW PAN, CNP, VA BITS), and has no dependency on new
> architectural features. The fixup logic should "just work" with kprobes,
> etc, and I don't expect that this will need to become more complicated.
> 
> [...]

Applied first three fixes to arm64 (for-next/fixes), thanks!

[01/21] arm64: percpu: Fix this_cpu_write() casting
        https://git.kernel.org/arm64/c/885bff055a0f
[02/21] arm64: percpu: Fix this_cpu_and() mask generation
        https://git.kernel.org/arm64/c/44274c657256
[03/21] arm64: percpu: Fix LSE operations on {8,16}-bit types
        https://git.kernel.org/arm64/c/8cf2093f5372

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

