Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F411BCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 14:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0r8Hd1Bh70mq6A2IDY2tkeLNTNKfROuIjK8QurSbXoI=; b=skJHKV7Sx9evTJdBCFwZVUgg/c
	YVD+kVYWvJI6ypLoBVjYv1T9z5NnJwhGw6RGlyW4TXhtpmEgVBzbBUMIT1odFdqzQk9yS08kI7phx
	oSksCpxfMyeNAj4bVs/tR1mtURHPDvGoky5BtWHdQAMtusdQLLqyWon96BnX0Ag9nHscjHWjzPdBG
	SLMTpyztlkoC3o1Onj1OYrhZfLbM3A1UToBEdnCunZEn/gjOXNwTuHmQvXkv5Wv8NYCbhUUYODRXZ
	Sx4FSvXB7Cc7HmGyj31exJxuiIkse7s5ueRmf3m6jQt6DCaCMJgL4r8YHCXd9NfN+Kao0LMd9/xK4
	lSNxHmVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFw0V-0000000A3t1-0Tr5;
	Mon, 03 Nov 2025 14:58:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFw0U-0000000A3sE-1FYj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 14:58:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C3DF601B5;
	Mon,  3 Nov 2025 14:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F8DC19423;
	Mon,  3 Nov 2025 14:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762181885;
	bh=1y8nyhLMPDQthRdVRLcjZW6GOD7VlICRZa0k7+ilTrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kCfnTOJLfLYbFN8gxf8ljTASem2Tu+fAvmEW/uOwwSoc0ga4ImCQV6ROb2zk+ESCY
	 zlH4WPE7jnsRp7F8ony9MkHgiBW+zIQgeQwsmJtm8k/Klst4IwFfm9MSLCN2EAgjb/
	 HjIme+3dr7vQodUv2pylktxuRhhCyLhxdwxjBD9hPUWPq3dFuqKzl0+peF7GDcy4To
	 YxL4PDi6L4leuWZG8ExJjNMIcvlDK5TLS1H8PrVPU1k0QTqHNNYhOIY8cvorgeZV1C
	 JBquY8zJLgCXoTHcRB2IJz4YzNw+L5kSjq2ZBqICnoq+4zPWqyGNBSHNwuRvFrrA8k
	 ExmZBWC7n421g==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf: arm_pmuv3: Add new Cortex and C1 CPU PMUs
Date: Mon,  3 Nov 2025 14:57:48 +0000
Message-Id: <176217971597.2906896.12399584424760011005.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251029213424.2951519-2-robh@kernel.org>
References: <20251029213424.2951519-2-robh@kernel.org>
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

On Wed, 29 Oct 2025 16:34:24 -0500, Rob Herring (Arm) wrote:
> Add CPU PMU compatible strings for Cortex-A320, Cortex-A520AE,
> Cortex-A720AE, and C1 Nano/Premium/Pro/Ultra.
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] perf: arm_pmuv3: Add new Cortex and C1 CPU PMUs
      https://git.kernel.org/will/c/989b40b7578a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

