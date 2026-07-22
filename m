Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9174C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2Ir8wAPkpsmGKwkucY1aY2pPcPx+x3J2zF/F8wPMGA=; b=WJinFips81B42aWE4aWETxRt+n
	uk+w0MI693XxKmIC5G0JSp33Gev467aM/IQORa+YyG6Ddk5eLXF94yTqMOzwWsAwLyY0lzeI464WF
	8zGRb9MPeMU7yF1gi2yzV2PVygRfjEwP/OzBO+02ZIwJwzdcLH92GBB7y6ngKLTM+pOfKzW6Wz9IF
	9AYBlptRZQRXpMfUmP7bapxNpgXv7hT5GtJlHpnDBbHYTNtgGnMnBxn0o3zABgIgJTrBmfzfilJVw
	4DsnPHv/8m835kU0BcaILeih0BmlD9NLHh4sjjrylVtSeCU6NqRQTVqJR89z95rboH9xZdjhHVu/c
	EJGZ3uBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSEy-0000000BEYQ-0RrS;
	Wed, 22 Jul 2026 08:23:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSEu-0000000BEX8-1vTx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 08:23:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B901C60A65;
	Wed, 22 Jul 2026 08:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30ACB1F000E9;
	Wed, 22 Jul 2026 08:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784708619;
	bh=E2Ir8wAPkpsmGKwkucY1aY2pPcPx+x3J2zF/F8wPMGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gbZm/H3vFOim5CXBZtZQeIsSPJaUprJX7iZbQnJb0xJ/lSt6e9rXfETTVTuqcYv98
	 HnsjPxLo0q96OKzkXFyOPkLswdf1DZJkzRnYzpsnJw+BIZIrX8uthyDNi31oc3LKyy
	 PIBqchXmB0r8q5Ra6n3fVnOMq4SSzlxDbSVt3QbKv5jr+f9UM1WR5kR3wabqQ81ReR
	 hDaMvgxq+vMrqNIX9fw4wo4+NhIsFNrz+RKFkCuODVoI3mjfISxi7QBiXAYTYhJIA9
	 IxeiUpKMZlYsc60KDpXwYNI/EKGtbKj/px+7VVQ6bt08NEk8oaktHJ1dprNxWaSEba
	 d2zXEOpBodbaQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm64: Clarify ARM64_WORKAROUND_REPEAT_TLBI semantics
Date: Wed, 22 Jul 2026 09:23:22 +0100
Message-ID: <178467119261.112588.3874172797273114315.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260629100953.385435-1-mark.rutland@arm.com>
References: <20260629100953.385435-1-mark.rutland@arm.com>
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

On Mon, 29 Jun 2026 11:09:53 +0100, Mark Rutland wrote:
> Will notes that the ARM64_WORKAROUND_REPEAT_TLBI name is potentially
> misleading, and that it would be nice to rename that and add some
> documentation. See:
> 
>   https://lore.kernel.org/linux-arm-kernel/ajKn_Pt50CmOUrsP@willie-the-truck/
> 
> To that end, I've renamed the Kconfig symbol and hwcap from:
> 
> [...]

Applied to arm64 (for-next/errata), thanks!

[1/1] arm64: Clarify ARM64_WORKAROUND_REPEAT_TLBI semantics
      https://git.kernel.org/arm64/c/62e11a7fde65

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

