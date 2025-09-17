Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B45DCAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 16:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85bFuLCn2vDZp+RY4gcZa8Pm3XyrPemyQSpeZexw5jk=; b=caBIL+OcNzwRV6r/MQO/ch0BdC
	0I+sSazkYtTd9pSS4sRPxb4H86AeUMLbTwOaa6BYKZmBweEUYgkoCrfMfIzZUM8q1BCDK5SUmn166
	PVP4yohXt1MsKipQDwLtI2IGlj2tjA6fDOqIceLGHP8GDlM/4dAU2kVXG+FyKVN/cQP0TW7p5fzRO
	WZnqlwgStTHIgajANSzQM5zk5YkFkGvbxAsMVEkNWmjPZDMyFnKRf7ySxze6HFp4n0FP7NDMRBfdC
	7BhiLauG32yiw7b+BDZIrHwP81OyYv/4UYhZnwAbk7OIa3AijRdz4MBr/JDx+hwc2ovWYDEDkvUpv
	CJRZ4ZcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvF1-0000000DH3P-3yWp;
	Wed, 17 Sep 2025 16:42:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvF1-0000000DH2e-0maY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 16:42:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9AFF46023C;
	Wed, 17 Sep 2025 16:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6CDC4CEF7;
	Wed, 17 Sep 2025 16:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758127366;
	bh=tay0VhD5lvvE7TcAMrCNkB2WpeKqaK2m2wjO/aE1OjE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SZIppzzo5MayZHJzCDBrDeGZAynhLZrzT9TdP++eP+kmmGfq1Fh0e/vQDB/VC0RbM
	 56S8ixPzlHyVP2bx6nkepRRH0uBKXlQxp1zCaDxAwM+hFrBEoLvWloyU6XAPA4KSuB
	 29C3GobBbcreJUu4vv/a3X5QstEs8jZPkYWiXy9uRESye2KWSo+OM8VAoAvHUhNrRS
	 C7LLbPDJmSgAzdh/8nByaKulfqoQh9x5R7n4d+DZ7L/mTY852YozrfyzUdNO+9k3Uq
	 BG/ALmSw/XDr5Vue9OhoYmdUopZwRH/8QAgUlP2swV7A+dQo7CBQqKBjkbRAGDR6Xh
	 CLMLLRMUb/iMw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uyvEy-00000007ACn-0rbQ;
	Wed, 17 Sep 2025 16:42:44 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Fix kvm_vcpu_{set,is}_be() to deal with EL2 state
Date: Wed, 17 Sep 2025 17:42:32 +0100
Message-Id: <175812735031.1632717.2582315143939738044.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250916161103.1040727-1-maz@kernel.org>
References: <20250916161103.1040727-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
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

On Tue, 16 Sep 2025 17:11:03 +0100, Marc Zyngier wrote:
> Nobody really cares about BE, but KVM currently only deals with
> SCTLR_EL1 when evaluating or setting the endianness in PSCI,
> meaning that we evaluate whatever the L2 state has been at some point.
> 
> Teach these primitives about SCTLR_EL2, and forget about BE...
> 
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Fix kvm_vcpu_{set,is}_be() to deal with EL2 state
      commit: 6515c612e79949b17ef4b8c4180c07bbeaf01e4d

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



