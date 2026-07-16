Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEC0C44511
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFaPD11dCJjgT2FVJ5Wu2IH9HH9UDYVyG+D8/m+7ZXg=; b=xNitNmYkVW0c7kB+IaEDfFfoC9
	Byw7JFHMsL6rCi5IqxMBHILHlJ/zlqTKD6Z1g9a0F42LI+DWlR397a4Cj2sGnhcY5W+FfpF8ckmQ4
	X05QofwMuukBgMZ1Z+XBtMX+Cbeyc4wyFWXFAiAEO4JXuuGfVqyqujN8+lRd9vk5YAD6nEKTYIlNM
	frLW+mGAMTPB6zRMS1NlENpyoFWSi5NksUW8gJEy26KMQJoILqnfnjo7OXs/wrHkvXh1eJBVkRx0t
	RSVa/0x6TtGf6CNpOTpc6qcUQr3eXWtVtd8f/KYzlJvd2hq2LbIl8gIzReNKC9ftoXKsaS5qHNBCT
	pone61Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPGD-00000000Cif-3kOG;
	Thu, 16 Jul 2026 16:48:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPFy-00000000CdI-1Hso
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 16:48:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 15C67418EE;
	Thu, 16 Jul 2026 16:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E80E1F00ACA;
	Thu, 16 Jul 2026 16:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784220498;
	bh=CFaPD11dCJjgT2FVJ5Wu2IH9HH9UDYVyG+D8/m+7ZXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cU4f1QjsoVXCi4aK8wargbs/UNTYBDJKYbQ08d3YHK8iyNZd27Kugn7PXqgS3oDs9
	 6jwfLLifJ9cCqOn+mL+d/dYqxGeD91etg8LDpjM7jPOGKorgSqBnlW6SzfoyyviYSA
	 52xdn48yHrxZ7xra5AhMZRWloLaKVUYORhWp0YVVrMsXpBILhNlqePuk7cso5oNX/t
	 dy6+qOcRHoYPnX77Z8Fe+dWAzCiFY9JUo2mtZ+HbCXTAWTPb0Iqxc9U0zlfABIboqD
	 Q4gyLOaTT7oZWDbYpfEZp7IqbBuN8/l94ob8EgjKeeuMivOhQGjyqrdSHl2WNwlz2z
	 EdtXKMrBKDZQQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Yu Peng <pengyu@kylinos.cn>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: fixmap: Allow 256K early_ioremap() at any offset
Date: Thu, 16 Jul 2026 17:48:00 +0100
Message-ID: <178420983067.39043.2308102113790755426.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260708023514.2445926-1-pengyu@kylinos.cn>
References: <20260708023514.2445926-1-pengyu@kylinos.cn>
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

On Wed, 08 Jul 2026 10:35:14 +0800, Yu Peng wrote:
> NR_FIX_BTMAPS is the per-slot page limit for early_ioremap(). Since
> __early_ioremap() maps the page-aligned physical range, a 256K request
> can require one extra page when the physical address is not page-aligned.
> 
> Reserve one extra page per slot so the 256K mapping budget is usable
> regardless of the initial page offset.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: fixmap: Allow 256K early_ioremap() at any offset
      https://git.kernel.org/arm64/c/21fc7ec93f8b

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

