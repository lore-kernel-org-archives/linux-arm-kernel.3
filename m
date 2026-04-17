Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20841F436A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 14:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UqMlqofvtNQHTaIUoO2Qi/D7pyE3HBuxGYYCr1dgvA=; b=dcMtBc/cKRkXybjExrwG6SoA+a
	Bto8HeBkK+G6tA/+vy8v6b6bSUfAxjz480cRwMfl0YCTacLujj/ly/hBHFBMf/2aQQA9n0ssOJEgT
	IoZR2zpL+VcDdD4F+78OCXUw4N0HMQB8LiBQlazy4PyKRwjSjpo+RXPz00cg/yTMC0ou1aQahWj7q
	vvnOOMrCe8KoBc8p+QVfU/tzkSjQE7pZiLL4PLaPX6xq97UJ9iz99/0UxRTTQbIvs4K5z4M7fqwJs
	wdy7wbEVCP5bqmHvGw3vVqx2d8UD02GUdE6MOfOfE5CkLUjOsuLbTyqUJLq0+gtkoauxMsbmC4/yv
	Cyox0IxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDk6l-00000004863-2M4p;
	Fri, 17 Apr 2026 14:23:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDk6j-0000000485w-498C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 14:23:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 022BB60138;
	Fri, 17 Apr 2026 14:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A28C19425;
	Fri, 17 Apr 2026 14:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776435824;
	bh=zhUHPzY2DIz9PTs+Q9VEpXkjQUQmTgulEPEXDyPPQfA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rf1FTpNWQlUgJbCcz+8IS8mlsHeHCTVCsqLXP+nBsKGGI9ppoEnx4lPpQlf/5kQmd
	 eRmPYxJ5rry0sLfiRQ28kRC9Yw+wll8Deg2iHQsxxnOnvnw7cLIvEKbnVh26j6M0Al
	 G7ewILkunNgobbMKo1UZOLncGg5vHOovdsyKkpAvarUV+L5bO5TaH1K3Q4e6x2aWqg
	 v0pb41mMtsmXKJxErVzLq0yKDVOIzEtePbgS9U5fTdad12nLU3geX8jZ+mQro+tIUR
	 jzEIol2geCtxlRmC0HAfD2hca1YMTltvWm2MYNXTKjW3c23E/tDoO67tBqKBn7nx+c
	 aEFPjcBWri22w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wDk6g-0000000CTLj-1zr4;
	Fri, 17 Apr 2026 14:23:42 +0000
From: Marc Zyngier <maz@kernel.org>
To: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	Oliver Upton <oupton@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kernel-team@android.com
Subject: Re: [PATCH] KVM: arm64: Re-allow hyp tracing HVCs for [nh]VHE
Date: Fri, 17 Apr 2026 15:23:39 +0100
Message-ID: <177643580644.2772443.3573116792668710722.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260414100231.1859687-1-vdonnefort@google.com>
References: <20260414100231.1859687-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, oupton@kernel.org, vdonnefort@google.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Tue, 14 Apr 2026 11:02:31 +0100, Vincent Donnefort wrote:
> The introduction of __KVM_HOST_SMCCC_FUNC_MAX_NO_PKVM excluded hyp
> tracing HVCs from the common [nh]VHE/pKVM list. Re-allow them.
> 
> 

Applied to fixes, thanks!

[1/1] KVM: arm64: Re-allow hyp tracing HVCs for [nh]VHE
      commit: ccab51d69b1478b549ad0bbb38f556ab3bfb47ab

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



