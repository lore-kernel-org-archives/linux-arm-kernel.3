Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A3DCD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 13:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=St9joyObd4559kn1TWbjfpbc4F9p0cjGD2hsL2jvuXk=; b=zO6mvvPnzYPUfEvK+qgh8WnWF2
	DgV6FibVP0ElkZi1/tEkFLNoQ1XaD3+GVRJQxCQupAUxV+O5iSu9oN9FWxPPXR6rv1Vw/FkHyNfxm
	bBYyVa2p/cJCkrjiy9Q6Y3ifsBWtFeM5VFNUvOpv1UF57QdfxY60YiDb0WoOhu7AGW4k/9D4Z7aZo
	UUkoMUecydS27bhQ6zqmycJ2chjJ+Y0y+jaOiXNeR5pmdhX2IXtYNT8mfoHnMhFR4bp+DrxM3vrc7
	kbe+ewUPqGC/m8940HkSJMTz4tAvcT2r2k8oHowU35MXdjdY6i+qBSNF76sUk8kUVj/1qEEvw6rfe
	k2OEOE4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSESa-00000004D6K-2QJ1;
	Wed, 27 May 2026 13:38:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSESZ-00000004D6D-008d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 13:38:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 32A746025F;
	Wed, 27 May 2026 13:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3681F000E9;
	Wed, 27 May 2026 13:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779889089;
	bh=St9joyObd4559kn1TWbjfpbc4F9p0cjGD2hsL2jvuXk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bB9EHCAPWbu8uNTYmToasHcjo+mV13euImXQY1TmFI1pgyrcC60GEp5W9hwa6YlmB
	 JEw9LPkF/tSOhAAMiJ8WVwHaNHgXk6b+8iu3qRXi35+JjWx8nL3rLusFD9Qv0HJ7Rk
	 pI6n3QO3mGli5WNCEbD+VcLf07iTa1JtJTs3/cAzmnlzKGQ/IcL0Cssc2SivleEDPv
	 NunKiX4kztXMBUayM8sBiwWqoCgTk67ecLIGiNYcbG4eDu2a15oeqR4zE+jDgeg33+
	 gE76Fa3s8SO/ZCcr1+h7fzwTXXa19ZwsiWCKI/HnMXUh/H6guh4nQU+HWQKYtrMMh5
	 KWZ5QF7oezGLw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wSESW-00000006hBG-0CYG;
	Wed, 27 May 2026 13:38:08 +0000
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
	kernel-team@android.com,
	qperret@google.com,
	tabba@google.com
Subject: Re: [RESEND v3 0/3] Fix __pkvm_init_vm error path
Date: Wed, 27 May 2026 14:38:04 +0100
Message-ID: <177988907507.1514704.9577495043154510677.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521143626.1005660-1-vdonnefort@google.com>
References: <20260521143626.1005660-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, oupton@kernel.org, vdonnefort@google.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kernel-team@android.com, qperret@google.com, tabba@google.com
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

On Thu, 21 May 2026 15:36:23 +0100, Vincent Donnefort wrote:
> Sashiko reported a potential refcount leak in the unlikely case where
> insert_vm_table_entry fails.
> 
> While at it, I have added a fail-safe to __pkvm_hyp_donate_host to ensure this
> function doesn't allow leaking refcounted pages.
> 
> Changes since v3:
> 
> [...]

Applied to next, thanks!

[1/3] KVM: arm64: Reset page order in pKVM hyp_pool
      commit: 6835fbed39bb329744a3f44e8e6a39e24079af10
[2/3] KVM: arm64: Fix __pkvm_init_vm error path
      commit: 20d2753295b1cd3c766199b5990119ca514e1302
[3/3] KVM: arm64: Add fail-safe for refcounted pages in __pkvm_hyp_donate_host
      commit: 5c30c9fc117cc7d0c1b45741d1127edd4c2ae990

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



