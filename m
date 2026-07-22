Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2469C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5y7fRVpeMpLAdvqRrYf0PA2AKBETTPSvoXW5Afw6EY8=; b=tyPYlhFsMHqX1JxnqDsIIV/ESr
	abfhA5X6d0Kk5l1VSa9a5axy2O5pDRM+n1bw9Ltk13nfRtlp5zMsPP6fT2boADSu2tkm0AXBCPD1b
	0eOFOZFeQ07+C+5nzfJggGFksOedGcyvvGjmYTBH3LVzrzMvMx/ct8MtxPxxfieXIlvBu3XwaM71i
	WK2y5zZx8DH7ECFNMd+D+0AXkroTu7PjpIB/ugUJ8zUSEzOkdIn12kN7EoU1dMO6bDjcgoI36S9mI
	p+AZIHxTZFVTtBmCAgIF5oTTaVEf5DgTeKKJrdKfWu8Yk2lbvQ6XV0EdOPOUHuS8uuMYzUiJi6gaA
	uTnW6DNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSFr-0000000BEnZ-2gA3;
	Wed, 22 Jul 2026 08:24:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSF2-0000000BEbs-46rI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 08:23:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DE2A4167C;
	Wed, 22 Jul 2026 08:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A17AD1F0155B;
	Wed, 22 Jul 2026 08:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784708628;
	bh=5y7fRVpeMpLAdvqRrYf0PA2AKBETTPSvoXW5Afw6EY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GFDQpMtrRsMJ8gpE58f/HPDJti2bkrMR8qGVXmBDz1T0JR9uEaXdVFC9lEyyx8w7S
	 b7OKw1oSo53ChMFf2c+QFuUV2P1ZIHIfQqwjcGoVNO8Km1tc2ERu4QzYGMtfjcr69V
	 +2/XJauUQDSNxlp7piqPmJCoiRjcGuZxEI5Jc/q8tpjEsE/aMIOA8feSVgNFTo13He
	 PP/jS8EG3KRQUuVITSJeHHDV4hI7OSp5M9k2o6cC/QAr3U5t7FpJmxLpdXzz6PSuuk
	 qmwL9QsM9zKSaFOEd8Y/99Rb+iVqtxs31XNlF05Pds06DWn8G5boNs4bp7Al7J0NNu
	 BvwvJtceT1gWA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	David Matlack <dmatlack@google.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Andreas Grapentin <gra@linux.ibm.com>,
	Dave Martin <dave.martin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 0/2] Use __u128 in arm64 UAPI headers
Date: Wed, 22 Jul 2026 09:23:25 +0100
Message-ID: <178467080354.109706.12004535669703185645.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626141730.5976-1-will@kernel.org>
References: <20260626141730.5976-1-will@kernel.org>
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

On Fri, 26 Jun 2026 15:17:27 +0100, Will Deacon wrote:
> This is version two of the patch I previously sent here:
> 
>   https://lore.kernel.org/r/20260619130835.5678-1-will@kernel.org
> 
> I even briefly queued that version up, but it exploded spectacularly
> when building the kselftests for arm64 [1] [2]. So the only change since
> v1 is the addition of a preliminary patch that adds the '__u128' typedef
> to the private copy of linux/types.h used by the tools/ directory.
> 
> [...]

Applied to arm64 (for-next/uapi), thanks!

[1/2] tools: linux/types.h: Add 128-bit integer types for arm64 UAPI structures
      https://git.kernel.org/arm64/c/10a47fb67340
[2/2] arm64: uapi: Use __u128 instead of __uint128_t in UAPI headers
      https://git.kernel.org/arm64/c/d4bf9e08d412

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

