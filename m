Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024C7D2F036
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 14:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RJlgjYfb+APBgFBdzQ1oIyXISIX39g+eolJ3qPGoMw=; b=oHIsAWFASwP+cHpYkzDYmUyytH
	OYvY+5NT24PIzaQ2IiW4V9pjqaLNmOjKSW/Z3qZnmECahbiBEEgGiMh9I33UaZ8zKNZsDilL7NdTi
	sJEUzHm+AD9MH6EMfuofZc4lhSeO8UlWBtLxYBNFgUAJiD8V/+rUZE3kGxWsAAlgI5bqWvmIkyUQb
	dN3+MKXUgIgFz0ZDa7yB26BN17hwsW/8GbRXYpuEeFdV/JvOjAs8q7p1+v+E1GmAOa159HNZYdyZt
	TAbzb5L9IkWK7U6HmaUT98AwGUZjwMw9k6n3JHgXrT/dOKR3EhuKrW3t5lDXNtvEqOp6L8KcMTOfy
	Vnsa1gsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjkl-0000000EMjW-37ux;
	Tue, 27 Jan 2026 14:09:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjkj-0000000EMiq-1rKn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 14:09:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 87D9D600AD;
	Tue, 27 Jan 2026 14:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09026C116C6;
	Tue, 27 Jan 2026 14:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769522948;
	bh=fgeR+pqv/gwz97Tjn3lFHOd3aY5unS7fLINmGbxXt38=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OhbtWIv3iipk5Q5S5FsUlQxI6zyxgcORraneVhnUDRwXgeFR5gWgx9ae2y7wRaBFJ
	 SSe91tlqH32YifvmJYbD19yFVQxWQb6ylRDienrgQiELVw+86FF1PB+R0xcGniGEde
	 YgAbNJw8dD/JzmsQECoZ3im6gjN4NXXS95huG536pj6/9XVBN4CzJPlYOuUC5wSW3i
	 5Z+bOgciuCE6u7wc4fIF47jmuE42TiPX2xtwexQrNAODWs65WKZYzmvUEGTo0PBBeh
	 t7QyxbGaU8wbL5pEUifHtPvUZQxR6bdXmap9AekD4f+1UexdP43lIXBZEJMDR60WsI
	 QJNGOzGabI/+Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vkjkf-000000064XW-2qtY;
	Tue, 27 Jan 2026 14:09:05 +0000
From: Marc Zyngier <maz@kernel.org>
To: sascha.bischoff@googlemail.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: nd <nd@arm.com>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	yuzenghui@huawei.com,
	will@kernel.org,
	Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH 0/2] Enable GICv5 Legacy CPUIF trapping & fix TDIR cap test
Date: Tue, 27 Jan 2026 14:09:03 +0000
Message-ID: <176952293346.2010102.7303410175644418702.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251208152724.3637157-2-sascha.bischoff@arm.com>
References: <20251208152724.3637157-1-sascha.bischoff@arm.com> <20251208152724.3637157-2-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: sascha.bischoff@googlemail.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, Sascha.Bischoff@arm.com, nd@arm.com, Joey.Gouly@arm.com, Suzuki.Poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, oupton@kernel.org
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

On Mon, 08 Dec 2025 15:28:22 +0000, Sascha Bischoff wrote:
> These changes address two trapping-related issues when running legacy
> (i.e. GICv3) guests on GICv5 hosts.
> 
> The first change enables the vgic_v3_cpuif_trap static branch on GICv5
> hosts with legacy support, if trapping is required. The missing enable
> was caught as part of debugging why UNDEFs were being injected into
> guests when the ICH_HCR_EL2.TC bit was set - the expected bahaviour
> was that KVM should handle the trapped accesses, with the guest
> remaining blissfully unaware.
> 
> [...]

Applied to next, thanks!

[1/2] KVM: arm64: gic: Enable GICv3 CPUIF trapping on GICv5 hosts if required
      commit: da63758c1876d899031066a9d4b8050af767ceb8
[2/2] KVM: arm64: Correct test for ICH_HCR_EL2_TDIR cap for GICv5 hosts
      commit: 28e505d81766dcbe25c60d57ab9fc941cd3d38bf

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



