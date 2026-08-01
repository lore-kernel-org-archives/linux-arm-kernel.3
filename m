Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A505CC55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 11:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NltONilZ9GycYIdkxMP4OoeJI6kGzsHNsdiT8Ul84U=; b=3ej42PSCT88KD2vw2i+Xvque8e
	uWukwnhGaYEBx0a0cuz7O+Fxy+bx/X4kx/Kh5EGIpZOV+LVUoRmX6rmtCQCwbYnuSyibTHPZlNwCj
	MJoqHQMZYPKF9e39oNCTWWm9l3+MwQiAN6epgc4RfmrJifdgZuI9PR4ijtknQyMkFn8Zm0d3naEXA
	cKhckpsScdDP7pg9S807HM3MX8y3o1vr14YQQ/gNrfcD8RVcyMuxw/OIokVohPAdgwu2oTyIzZIyX
	3mwL5DlxKExQdi/db7I/1Pes3pgFikv6hUd/loa9l0RBv+yrIV+5Gs+iMzjBEOBBRuuq6/bfzirur
	rqxLwWuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq7tZ-0000000EGUo-21G2;
	Sat, 01 Aug 2026 11:28:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq7tY-0000000EGUZ-2LGU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 11:28:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FDD960A9C;
	Sat,  1 Aug 2026 11:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008441F00ADE;
	Sat,  1 Aug 2026 11:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785583727;
	bh=8NltONilZ9GycYIdkxMP4OoeJI6kGzsHNsdiT8Ul84U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MNDHhV1nD1XnRgFmarxfgWSy/KNHCUgDwqfve5p6hv8yCl4YL/fP7jYgzaaVxgcZT
	 xO53pg8GSoWVzN46pvycWvlsnDMTDnY7swqk+fVg82a+8orDWb3ge15lXu75Fg8i4s
	 nyMHk4m2pVuijZj1U/CJeCPrcFoJiEWad4wka9/HcFx7FvFN9XPMphJ4oq/o5V4G4M
	 NHPC5WTbcXnEazp4pwKPdwRuulnnzfGwyNyTEeq9DnkuGgnYsjnNpQEeZMKjlI2LLt
	 nu5BNB2ilGsKzIHpXeuxaUnGTmHDt/IR3sYBdhAYbwBG1D3ARjQlMbwu6ITqRvSPSl
	 ZK29vYmgK6YtA==
From: Will Deacon <will@kernel.org>
To: linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geetha sowjanya <gakula@marvell.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	krzk+dt@kernel.org
Subject: Re: [PATCH v8 0/3] perf: marvell: Add CN20K DDR PMU support
Date: Sat,  1 Aug 2026 12:28:29 +0100
Message-ID: <178551108395.325729.8003584070138244623.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601073318.7098-1-gakula@marvell.com>
References: <20260601073318.7098-1-gakula@marvell.com>
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

On Mon, 01 Jun 2026 13:03:15 +0530, Geetha sowjanya wrote:
> This series adds support for the DDR Performance Monitoring Unit (PMU)
> present in Marvell CN20K SoCs.
> 
> The DDR PMU is part of the DRAM Subsystem (DSS) and provides hardware
> counters to monitor DDR traffic and performance events. The block
> implements eight programmable counters and two fixed-function counters
> tracking DDR read and write activity, and is accessed via a dedicated
> MMIO region.
> 
> [...]

Applied to arm64 (for-next/perf), thanks!

[1/3] dt-bindings: perf: marvell: Add CN20K DDR PMU binding
      https://git.kernel.org/arm64/c/6e0aa591af99
[2/3] perf: marvell: Add CN20K DDR PMU support
      https://git.kernel.org/arm64/c/9b551a2446b2
[3/3] perf: marvell: Cancel CN10K DDR PMU hrtimer on device remove
      https://git.kernel.org/arm64/c/7dbcb0268d1e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

