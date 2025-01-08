Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50E4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 12:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZt1EMuMQVVWOH0yvBnMtDigwJg580itYkeWte23MyE=; b=uZQz5Ba1e6qumDBiQSDmjl1vZ0
	8tpK7gnnq0hds0w2EccF/dSPeWCC027vTCz8s10HiY1g2BPw9zwdxqnYSsjlSAxilhnRrGhF8ADm2
	UEA+e/okySQ+FMHgqlVeFF1D9YoUeaPnIMV5V/Ajg4gDT6YLssvybLbaAdIEmC/jLgJkcOzw0EyYq
	hbkciV/03onz+r0ghV0dSFQkgm5FQoOa3sD18GkCJup/2pXdqKcPjCawK2WDw4XujdT+ehq3XqSQp
	2WqoGU3cfub/KFsokRqwDQI6Gj2wpeYB/ta9xZuejI1rWyKiP6oNgYwrtdNeghuvaHa85u/j895zJ
	VnH3QnDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUug-00000008N8Y-0Md6;
	Wed, 08 Jan 2025 12:11:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUGK-00000008DJ4-3eiI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 11:30:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5E01FA410FB;
	Wed,  8 Jan 2025 11:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3543C4CEDD;
	Wed,  8 Jan 2025 11:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736335811;
	bh=DL3L7wjt7m6xdNDVzlXZ9DBHuhuce+VBHCyYTQJC1Ww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fVDm1pnX1RQb4afCymYc5xUYmMusPfPRyUVEqW6Dr/4Jt3o3Nittan7+T6aZqsW2V
	 xT9ig9U3fNXGbszcP+dptmHQZOQf2TMarjcHf7QbpTAd9phMefFyMT0lveVLZ6hzfc
	 hpNBttVCZNrT6iFDF/lTPoXm9Y+Q6UOcNK2sW/P6VGrkhfVGGl4o4/dAf3IArq/yCo
	 zR6x5OWbWmdULLoGoAJqvlEJ6Oo8Q5EkrZWsWuIoy1+fhkueUqOET3WkyuBAbyZE36
	 EGYvH09pQHuOMEZK8hLO4D9TwG+bbN9gxa7t+7x61kCFoe1HGzEy8EZKCGnQm8nMNA
	 fKfusmfMNJmAg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tVUGG-00A7YQ-HV;
	Wed, 08 Jan 2025 11:30:09 +0000
From: Marc Zyngier <maz@kernel.org>
To: oliver.upton@linux.dev,
	Vincent Donnefort <vdonnefort@google.com>
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	zenghui.yu@linux.dev,
	kvmarm@lists.linux.dev,
	kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] KVM: arm64: Fix nVHE stacktrace VA bits mask
Date: Wed,  8 Jan 2025 11:30:05 +0000
Message-Id: <173633579701.13074.16597350364665610752.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250107112821.416591-1-vdonnefort@google.com>
References: <20250107112821.416591-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, vdonnefort@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, zenghui.yu@linux.dev, kvmarm@lists.linux.dev, kernel-team@android.com, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_033012_971661_26532834 
X-CRM114-Status: UNSURE (   9.44  )
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

On Tue, 07 Jan 2025 11:28:21 +0000, Vincent Donnefort wrote:
> The hypervisor VA space size depends on both the ID map's
> (IDMAP_VA_BITS) and the kernel stage-1 (VA_BITS). However, the
> hypervisor stacktrace decoding is solely relying on VA_BITS. This is
> especially an issue when VA_BITS < IDMAP_VA_BITS (i.e. VA_BITS is
> 39-bit): the hypervisor may have addresses bigger than the stacktrace is
> masking.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Fix nVHE stacktrace VA bits mask
      commit: 68344037b764401f751c66661c53334ea1e15324

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



