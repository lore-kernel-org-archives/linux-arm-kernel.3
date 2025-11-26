Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD827D1039D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 11:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rmV+i/bxGZPpVilUeplxqHoBEtEaVJTKCPj9TMnykC0=; b=AYA5PFCGg1xSzoI9bTAWjIvIMz
	SQHUYwjwalbdQHsMCpqCIYwHNdPXliFvDErukgmxwV/NXEE9OFZ6T3y88C1G4A9saUhYda8DiAIZS
	sYNbEtVW1DpKsr/kFVq2C/xWDFp0m4P4RFgWdHEZ4HaRdLDiqY45hAXCH0wPxGxdgIBGuuIGJYZUT
	nMEhEhK1nVc0/o9H3ObA/Jp4P89dNurnqkU2D5dqw+itzAY7LzLXtZ6fTyGjmTCV3mFZUZv4iHsPC
	u5GLh0jfLS2ylhgcUB6rN7WFTsaQczrW3Wh09/MiY8KBCPaBgTLDvBzOWJ7e2IjoaIvvlPY4BmE/D
	7PGqAW0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOEA6-0000000Ewkz-1g0w;
	Wed, 26 Nov 2025 11:58:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOEA5-0000000Ewkj-3kJE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 11:58:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB127601A0;
	Wed, 26 Nov 2025 11:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73152C113D0;
	Wed, 26 Nov 2025 11:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764158296;
	bh=rmV+i/bxGZPpVilUeplxqHoBEtEaVJTKCPj9TMnykC0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nwxd9t5R5bIys1gPue6FOsKItnzoP/0qgGNdZ2v4fRnl0sjw3K85BBLvodEkOGRnI
	 pl9YPwTDC4bvfsbQCvbfZlBbMHHAJ2gTMjNu0hs39OmQEQGLV1n8zui4lwspyleDug
	 DR/rxRIPwldmxw6LoADHlzwxTcK4oY/4uZ9693NEcWZk0fWVE/eHXUePmg29s8AU7y
	 VMJ2pCP6F8ROXzIOLwN7h5jEybsZw92p9WmaG1sESESLA8aVlrC85D/Ecn1y2TbtxF
	 0JRmE8AmpkgHWUz5nKJGzyZ8dRk3Tkuu9dfPWnYUcrqlTwoS9wwYnYnNfDBJ/To8wg
	 tPUJbLLYtjoTw==
From: Sasha Levin <sashal@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 6.12.y] KVM: arm64: Make all 32bit ID registers fully writable
Date: Wed, 26 Nov 2025 06:58:14 -0500
Message-ID: <20251126115814.1354988-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251123103909.3518993-1-maz@kernel.org>
References: <20251123103909.3518993-1-maz@kernel.org>
MIME-Version: 1.0
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

This patch has been queued up for the 6.12 stable tree.

Subject: KVM: arm64: Make all 32bit ID registers fully writable
Queue: 6.12

Thanks for the backport!

