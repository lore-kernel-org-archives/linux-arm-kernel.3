Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB27C44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 18:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGu5fxV93x9uuZeZ7xAEDL0ttnPGj1SaGAzThgXOcIY=; b=dHWw/DdA5lWpARTtkMfOupvTqo
	ofUlZpbIrwX9IClKgx6QS9QoatYsOqd7QIqmy0NK4Ucxj9nIx0zMOZSFJgUKHmaQ5fUKR5tWoyBm2
	skHVyzgqn0KDQjoy6SsbLPB/6rvZWNnbUuF7SC5MOSvve5gCClXNoDzsMAEzT636hnfzq8o7J5W6y
	kDaQRUvyUqhBgtnDqsc/y4XlDi6lUZMHzSYwiPRMjjDbOrmJ66T1XX4NYE0snNSbIU1ypILOD72u7
	atevjvLeUzIUxaL0jHx4Be18Qge+QvTtWQVl+AKH9h4LT5uvHZa/PKCxlf50RAmgy637Uuq1UrxZ1
	THdSOzbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wknDc-000000030S4-2xO2;
	Fri, 17 Jul 2026 18:23:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wknDT-000000030OP-1Rsg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 18:23:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B114E60A6E;
	Fri, 17 Jul 2026 18:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4DD1F00A3E;
	Fri, 17 Jul 2026 18:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784312598;
	bh=GGu5fxV93x9uuZeZ7xAEDL0ttnPGj1SaGAzThgXOcIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ncNmxSeL0+2ZGoOkQjK6Nt78O74b//AsjSDHA8yhZ0L1yR/1hfFFFhacCVL7+QvFE
	 BB+iC+VKF1Sgg7IBO2lMM90ppkQnwgmzQEPixaHbqCPIlyTu9MmQJXFHlavk6CNTuN
	 rdDrG9kULb+2kvl7wXAnm+fZBZcwfAYwWWlzbGxI3dL8sybSvawDCGaLSmJFXKdCgD
	 nMKb3scTt3XGY14q2EqLtHe1nXw0Qk7l8q/+85fTgPN2ZZNX8MYBTWYhi7ji/Nu/P3
	 5riyIReUOqyIYlxPGGYbOOgDqLbRvA3FDzrjOaLGX7iAhxUoLwU3Sh3q6u9iJ8QMi0
	 mdhfu4mIv94lA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mostafa Saleh <smostafa@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	maz@kernel.org,
	aneesh.kumar@kernel.org
Subject: Re: [PATCH 0/3] arm64/coco: Convert pKVM to a CC platform
Date: Fri, 17 Jul 2026 19:23:07 +0100
Message-ID: <178431055337.489190.14483182757674487047.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603110522.3331819-1-smostafa@google.com>
References: <20260603110522.3331819-1-smostafa@google.com>
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

On Wed, 03 Jun 2026 11:05:19 +0000, Mostafa Saleh wrote:
> The goal of series is to convert pKVM as a CC platform similar to
> ARM CCA, that makes CC guests consistently discovered which avoid
> breaking it by the ongoing DMA rework [1]
> 
> The first patch is a minor clean up I noticed while reading the code.
> 
> And the second patch is a bug fix found by Sashiko.
> 
> [...]

Applied second patch to arm64 (for-next/fixes), thanks!

[2/3] drivers/virt: pkvm: Fix end calculation in mmio_guard_ioremap_hook()
      https://git.kernel.org/arm64/c/62c740f823a8

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

