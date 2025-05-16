Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B6DC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 16:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rW2niiT8lGOVhFjtLzU0MeM5BaItmajAg6qu2+rKncU=; b=ThuMQ8WWTb2Y05ydW2ZKQrItx4
	32/flWeBtLbGy9yLOA0LKv5vA9lqh+IxxkBVtwNQ9WGaZm2k8N7/rpufnJhJQfKiS74Zd6KY9zODg
	OC+zKyyhNbZhGaYmElUVHmbZ1fKYD/PGdzR8VfsTmLTawctRTi9dto3JlDlLfdvF4e1QG6j0AyEYZ
	KI1qZXyXY8x3fF0D4UqNkI8jwhDhqXpbiwgqw9kpJRrjAoelBIyAZtdlaYFsGXQhHBHUttVaekIcJ
	lIsnK6LiFCGMgiq3F0ULhIRAtIuz2HMlVWHzj+ZU0i7GkyJrr1hZodgKtr0rhoYneD2onJF55TgWv
	YA+J/EWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxa5-00000003yAg-181c;
	Fri, 16 May 2025 16:06:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFx8N-00000003seF-2dZM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 15:38:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 598244A8A9;
	Fri, 16 May 2025 15:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A443FC4CEED;
	Fri, 16 May 2025 15:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747409883;
	bh=mWfA5wFotzL7PgvhLsuhMnP0blXpL73q8Aed7VwJXjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AXR7+1UJQRenyC+XQwFTOEdHhgEEiVar1Hn/5duO4TJs5Bd/gwUufTuX5FHcZtGC4
	 zGzDr7ItcG0BEdLjxtSE2nJnImE0ejnGSIFkJWDxMIby7eODAn2rydigNVxGrVjzN3
	 SOGelPJ8WIWfriWL+bIKYaN4Ak7ti+WbW3uIf+dI7kSw+4IzDFKbicg2qY9pxsahyW
	 X4c31GqKelZ3ccSzH62l4COQXLcS7IERUKlxBKxlMolYp9QCAKQ/kNypyptbCYxdCi
	 hHcuySGy4QnSsM443IDg4DWlGujuOLpKOi7U1ZJS67sxNM1DQs/O4svFlHQf/sEfc9
	 KbwZRpDJMkU+g==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] perf/arm-cmn: Initialise cmn->cpu earlier
Date: Fri, 16 May 2025 16:37:47 +0100
Message-Id: <174740513926.2577946.7646762362706357412.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <b12fccba6b5b4d2674944f59e4daad91cd63420b.1747069914.git.robin.murphy@arm.com>
References: <b12fccba6b5b4d2674944f59e4daad91cd63420b.1747069914.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_083803_696050_8287F2ED 
X-CRM114-Status: UNSURE (   7.01  )
X-CRM114-Notice: Please train this message.
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

On Mon, 12 May 2025 18:11:54 +0100, Robin Murphy wrote:
> For all the complexity of handling affinity for CPU hotplug, what we've
> apparently managed to overlook is that arm_cmn_init_irqs() has in fact
> always been setting the *initial* affinity of all IRQs to CPU 0, not the
> CPU we subsequently choose for event scheduling. Oh dear.
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] perf/arm-cmn: Initialise cmn->cpu earlier
      https://git.kernel.org/will/c/597704e20106

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

