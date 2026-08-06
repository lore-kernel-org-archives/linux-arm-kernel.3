Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD18C5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qs4zXt52yPprogidGbqcBFljl+XDCyeTQeEFyOiMma4=; b=ZAD/axMLEV5+rT34sv17NVX+/M
	EuiuOqzvYaQc76iWGoT899LuitrfFnmtRCHbFZco8QLghb1rMizX8gQFLlRYeG+NFZjo5a/NVXKJw
	NZ3J6W1QcRICMd/Fa/In300TAgoFjYP+74IqU/rthRrTWQwYHpF75r9dO/q8psHPDBeyaLy/e0yWP
	HBs9fEvFUc+1HuQaeYtV0pq8boI5wCbkkcSYQREM9Q3sb3ZbnmxoNkjl+DXFFOzskEIwKjXfcowr1
	sGry5+P6yXOjvHq6sYCPTXKkhnPKd5gySfodv6GhlKjQO4nRuHlMHIXhzyLLwaxpbTSbDU4+eL5Zb
	UbR1E2Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1dj-00000006Kg9-0pf4;
	Thu, 06 Aug 2026 17:12:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1dh-00000006Ker-48tm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 17:12:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AE351413F6;
	Thu,  6 Aug 2026 17:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8F51F000E9;
	Thu,  6 Aug 2026 17:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786036337;
	bh=qs4zXt52yPprogidGbqcBFljl+XDCyeTQeEFyOiMma4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iBXtthlavXY8ceSZ8duo8BEz3UTtrn7dI/0y6bxESSmRSKo1HkKCKlaCu3A9WirHR
	 RCaf07lsAHagUamSPUErIlIquo4ZS0MMUGAhhsrEdwSe7kSl60cywOLbQ+7LnNQM6b
	 roJKUc/LVltRJTsukumd1TH6O2LQCIfR1JsNswTfYXonHTfAH7xQi15e6XabbDob1J
	 P3AZ6QMnzes+eywPTwI3FydlGPtx8xKlayAGqMiYhiY0ASZoNw6qLAc1bkgaP9ZGHm
	 90CJ02MeY3jz5JrasF5ZxvkF7i0ZmH/CQp3uMRJ4OIB/9mB2doG65pVgC9sxtNzW8y
	 r40+Xvi4iQh7A==
From: Will Deacon <will@kernel.org>
To: mark.rutland@arm.com,
	Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	ilkka@os.amperecomputing.com,
	bwicaksono@nvidia.com
Subject: Re: [PATCH v2] perf/arm_cspmu: Support 64-bit programmers' model
Date: Thu,  6 Aug 2026 18:11:44 +0100
Message-ID: <178601658928.385816.2976546188979360844.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <2bde4469c918494e8fa04b2d297a6189ac8b7796.1785511378.git.robin.murphy@arm.com>
References: <2bde4469c918494e8fa04b2d297a6189ac8b7796.1785511378.git.robin.murphy@arm.com>
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 31 Jul 2026 16:22:58 +0100, Robin Murphy wrote:
> The 64-bit Programmers' model extension, now named FEAT_CSPMU_EXT64,
> makes all the non-counter registers 64-bit as well, of which we most
> need to care PMEVFILTR<n>, PMEVTYPER<n>, and PMCR since it changes
> location. Our event config fields are ready for this internally, but
> we need a few more tweaks to propagate 64-bit values properly from
> end to end.
> 
> [...]

Applied to arm64 (for-next/perf), thanks!

[1/1] perf/arm_cspmu: Support 64-bit programmers' model
      https://git.kernel.org/arm64/c/807b9ecead03

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

