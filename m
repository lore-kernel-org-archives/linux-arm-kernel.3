Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A49C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 15:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nex1BkDdnIeAnfRxP1W39bVhE6TVc8dZyfZgHX+zVRk=; b=bIZl56WsSaRIrAR3mwko2iSjC3
	+jQ1gp7oXYJfDvICwCKkDlwjBnJ+l/+Jh/iNvWPJmdDapOm8nNsO27bAPj47d/PEF5ifWf/svEGo8
	QRnSE2ej8WmMOzlADMiU7HeJCNJrWMyXODyyXOyZZQpFcZWhTPGd2qlx8UWq7ALriQhiRpsq0o98x
	b5SWnPTaNaqHPZxKke2k5pFTGydM4HvDeAjRPseFf7yx6KmItaMbtVy5XfGLdAXQIRhx4PYe1696y
	XjT4o7aEWGiGYOjpHTVK9oTCq3GxG3jmwgQwXCpCAwB5xy1K2FJ7a4wwgDw4/ObJPrHbmgCkQbu1D
	SyOVfGJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKV6-00000000lJo-0cOj;
	Tue, 04 Feb 2025 15:06:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKT7-00000000kuc-0qR4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 15:04:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BCC555C6B44;
	Tue,  4 Feb 2025 15:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D3CC4CEE7;
	Tue,  4 Feb 2025 15:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738681444;
	bh=2PpkFVtl+mFoGN6qKuG8Uod8whMTj06b5rjX6hr9B24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kJavxyhaFth/825M/ghxKMvp3MaZn6RwEATtSq7hbs/wcwkE/A/LDSs3IlAHdcf0/
	 i2zDjR4YlA8ctmJUWD7P2c+AX8kh6LpiCkYsdX/ZSE6svfK9jlCHPiFeEJeqIvLHqU
	 UHGwn/QMAACKbDS0U05gYUaZcGYzYFKxBxmdeMexOxHHqe7xbw9YsG8ioFQqDIvkvg
	 TR3UYryAsomgdvrZY8RiJGsotqr1GORP7QCsb+OXTgq9riHR1wHkIcyXdBJZ9eG4SG
	 8Ljx1SZaZW7hn/ppIBc1sCHdaVjWWEGo9kjsdPQe1zr71ViVLi/WC18OFDL3lTGwO4
	 Z6O8H20jaMQKQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tfKT3-000Skd-Mt;
	Tue, 04 Feb 2025 15:04:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexander Potapenko <glider@google.com>
Subject: Re: [PATCH] KVM: arm64: Fix nested S2 MMU structures reallocation
Date: Tue,  4 Feb 2025 15:03:57 +0000
Message-Id: <173868142680.774793.5944251840310076656.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250204145554.774427-1-maz@kernel.org>
References: <20250204145554.774427-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, glider@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_070405_279777_D66F61F3 
X-CRM114-Status: UNSURE (   9.92  )
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

On Tue, 04 Feb 2025 14:55:54 +0000, Marc Zyngier wrote:
> For each vcpu that userspace creates, we allocate a number of
> s2_mmu structures that will eventually contain our shadow S2
> page tables.
> 
> Since this is a dynamically allocated array, we reallocate
> the array and initialise the newly allocated elements. Once
> everything is correctly initialised, we adjust pointer and size
> in the kvm structure, and move on.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Fix nested S2 MMU structures reallocation
      commit: 5417a2e9b130a78bf48cb4cf92630efcee5ccf38

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



