Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC8DCF6487
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 22:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WyzWaSlpMiVrZgiyFFfLvJW1JY0DT5P1xLKf5/g8DMQ=; b=i1nCfu/DMNiqyDBDmotQR5sD0s
	Fqeffu6E9wCTyUtP0jMDuoLnOOjY77sbCJidYHk4tFXLvPpIKQnjWjlgUBuQA97yWWVOykUAAjoXK
	rq1rmy6+BzQ4Y5dDvj+8pgd0a1bAeUqQBbpQAv3ZyaBKe4CucyttLhlcf1CA07f6IKuh7KcnKFwyK
	/sYuw5XPiXKSqXAvp7mlCv5/BsGR5Q4fr2HESAQltDobk/nB+zLYjL3lNHRHbd2NXYx3VuWJZGkMU
	uMwVBwpe1G9DaMkyPwEI1hhu9rjaBsuJDbJEWqr0c6eXQaOvI6PvLEL7ZVkPbR3okYZE9K70AFLfv
	9i9cgeVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLqlx-00000005nkM-3pH1;
	Wed, 19 Nov 2025 22:35:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLqlw-00000005njy-2cha
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 22:35:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A300760010;
	Wed, 19 Nov 2025 22:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B44C4CEF5;
	Wed, 19 Nov 2025 22:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763591731;
	bh=gtkw5I6XWLCtMEVkd6b/QRRhgxON/maxlA2T6Gp457E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FAR4JFIl4a1/kGUdxiL57yHPZIlzEkEW8XgXreuOVre+Bs/lhVWxAHSBMjdK/yA6y
	 gnOLQ7W+OQ+/gDOLooBlbD7Ms9P0L4GBSrPLeDt9MgAIIYnleNa/UcWbY8daNMXw4R
	 dCwJLdjN7mpKmGRNQJTzI8rEM2sHtZ6mr2T4XciJCCJR9L0Jo01gVBnKqlMp+QW1YP
	 uFZK6cYd5kkWjLc6gdKbZD86YAbXVwH3yE32bPpXZp2gnlyIMNUry/o6K3bKbRBgsK
	 XyhoZDI/n1NU971WytVE1rbKaDuXkKIXinT0SlmO0g+eYS/1mUQxrJBc08e0EKoP03
	 lsdNz8uIFNiIg==
From: Oliver Upton <oupton@kernel.org>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	Maximilian Dittgen <mdittgen@amazon.de>
Cc: Oliver Upton <oupton@kernel.org>,
	pbonzini@redhat.com,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kvm@vger.kernel.org,
	lilitj@amazon.de,
	nh-open-source@amazon.com
Subject: Re: [PATCH v2 1/2] KVM: selftests: Assert GICR_TYPER.Processor_Number matches selftest CPU number
Date: Wed, 19 Nov 2025 14:35:26 -0800
Message-ID: <176359161122.183996.2358688818272311431.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251119135744.68552-1-mdittgen@amazon.de>
References: <20251114143902.30435-1-mdittgen@amazon.de> <20251119135744.68552-1-mdittgen@amazon.de>
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

On Wed, 19 Nov 2025 14:57:43 +0100, Maximilian Dittgen wrote:
> The selftests GIC library and tests assume that the
> GICR_TYPER.Processor_number associated with a given CPU is the same as
> the CPU's selftest index.
> 
> Since this assumption is not guaranteed by specification, add an assert
> in gicv3_cpu_init() that validates this is true.
> 
> [...]

I did a small cleanup to patch #1 to get rid of open-coded shifts / masks.

Please new versions of a series as a separate thread, using a cover letter
for anything more than a single patch. This is helpful for tracking patches
on my end.

Applied to next, thanks!

[1/2] KVM: selftests: Assert GICR_TYPER.Processor_Number matches selftest CPU number
      https://git.kernel.org/kvmarm/kvmarm/c/31df012da496
[2/2] KVM: selftests: SYNC after guest ITS setup in vgic_lpi_stress
      https://git.kernel.org/kvmarm/kvmarm/c/85f329df2931

--
Best,
Oliver

