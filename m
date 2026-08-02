Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D3FC55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 12:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/7BxhUQiSUAMYoyFtyDo8TUe0bsYaMs3VmUXnkR9ck=; b=MeJysgbIg2oppFyxNvi+WCdpaF
	v/SHzQ+aDOu+RcKI3C7Qg/hXe8gnWHqnlyJDdon14oFgRQB92R3d4ofR7vpTLABEfseZOUvVOoro4
	vCMyd355cZdVJvt3wNY2S3zNsKdfJIniuy7+EL21B7f7yFTtkaVlZ7PZUqwOgUclGq9HHy6BixgND
	vmCIEtJGxQ3INmqGN+TDUYmVt0l3cR1xEiPFJkI3hC51UHxXPDqri9gydWRHiPHO/6u471S7op0gV
	E92EedK7f8EPTa1i4CH0EgPkqmK6/oW/aVSCesxUFJJi0v4uxxX+D9QfPERChvRU+4TfB2sPPOIHr
	ulhlAy+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV3f-0000000FbYj-2jIs;
	Sun, 02 Aug 2026 12:12:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV3e-0000000FbYV-3Bwx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 12:12:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 11CD160051;
	Sun,  2 Aug 2026 12:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629C91F000E9;
	Sun,  2 Aug 2026 12:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672763;
	bh=K/7BxhUQiSUAMYoyFtyDo8TUe0bsYaMs3VmUXnkR9ck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ep34qRgRpLjLx+jNw2mpqScF62wIJjNZ7+V3ahmZcjTnlqL+NxDAfqTxw2m5lok+u
	 BqqiTEpR9HlyUPFEjAAEtiNjh8cKnqdN82RpIbpmxBbTSgKaFEqp+hWehiBB8V7d3m
	 9PTIIfWS7g3V9+1brD8gyNvSleiY8bi2kP/lKHSG6+OO8R33ACV5eAShnscFEipn64
	 ttlLVceiFgAWN+wio7QgPgbXL3hlA6gc2mB68e3Lgbl6NJ2Czhm+tAVMQ8DVHQY5yP
	 RbRnAUvTitMEFa2E9Ssi9eltuwprUt8yIOA4XZKwqWm4wV3V4cNSvtSsOYzvgiRmkn
	 aWTx5Na+b3P6A==
From: Will Deacon <will@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	james.morse@arm.com,
	fenghuay@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	andre.przywara@arm.com,
	gshan@redhat.com,
	tan.shaopeng@jp.fujitsu.com,
	sdonthineni@nvidia.com,
	jonathan.cameron@oss.qualcomm.com
Subject: Re: MPAM changes for v7.3
Date: Sun,  2 Aug 2026 13:12:20 +0100
Message-ID: <178566322421.4135357.4986108386959858973.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260731175243.904730-1-ben.horgan@arm.com>
References: <20260731175243.904730-1-ben.horgan@arm.com>
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

On Fri, 31 Jul 2026 18:52:37 +0100, Ben Horgan wrote:
> Please find the MPAM changes for v7.3 in this collected series. I hope
> this is more convenient than my last pull request for the fixes.
> 
> This combines the MPAM abmc emulation series and a fix for an Nvidia quirk which:
> 
> Make MPAM memory bandwidth counters usable by hooking them to resctrl's counter assignment
> interface.
> 
> [...]

Applied to arm64 (for-next/mpam), thanks!

[1/6] arm_mpam: resctrl: Pick classes for use as MBM counters
      https://git.kernel.org/arm64/c/436d111d918a
[2/6] arm_mpam: resctrl: Pre-allocate assignable monitors
      https://git.kernel.org/arm64/c/779cfd653168
[3/6] arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use
      https://git.kernel.org/arm64/c/6e0e538a75ce
[4/6] arm_mpam: resctrl: Add resctrl_arch_cntr_read() & resctrl_arch_reset_cntr()
      https://git.kernel.org/arm64/c/a5ff6ef2d73e
[5/6] arm64: mpam: Add memory bandwidth usage (MBWU) documentation
      https://git.kernel.org/arm64/c/6b4ee75215c9
[6/6] arm_mpam: Apply T241-MPAM-6 to 63-bit counters
      https://git.kernel.org/arm64/c/2c43aced9be3

It looks like you've been keeping an eye on the Sashiko reviews, but
please can you double-check the open-comments on this posting?

  https://sashiko.dev/#/patchset/20260731175243.904730-1-ben.horgan%40arm.com

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

