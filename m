Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329FDCD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 07:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvS5YVZbLxA7iOkR2e8CFT766YQGynaBCTDZgGeJd2k=; b=p7phtn2MKG67Dyz/UgnwUJtIMV
	8NJSk0lOnGW1fdJGpr3EA9u/SantvTrqMRN6IClUwn0KG8T7fhlwynoXMp2WLmt8w7xK/8nyV+e2v
	KXvvCz2BdSsjUo8q6Zr8a1JcthWuG91AHGLncmZzs5MyGkFspL6plI2tjUubGoivCpJG6S5mUOCsD
	VtFzBG2A09TcsrmkUxayZGTrJ4uGSeMwdUwXb7Wt3Nc9yqJcumE6AqF3Y6ddG+Swlsgv3YpmWv07I
	0cK11P9Ssq+gbV/ImxsTGUroArkFPq59k4+O0jwY6bVEVv33wTBI2TF4see7tDQBRmEhEwAZKlGJ4
	S+ElgwRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPb8Q-00000003lPh-0YDV;
	Wed, 20 May 2026 07:14:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPb8O-00000003lPG-2LAI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 07:14:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D0E06012B;
	Wed, 20 May 2026 07:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76BD1F000E9;
	Wed, 20 May 2026 07:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779261267;
	bh=jvS5YVZbLxA7iOkR2e8CFT766YQGynaBCTDZgGeJd2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SGkGkQxR399Z84m9AqDprFVuQzRyvMv04I3ST7nwbjTS1oPplxQ5hb9U16T5aE+hr
	 CC9ZnpXfw6A5Grz0E4/jqRJRyMp687v/uoBffICZIXXqi8sqCvBhXOkpLuXsdfqHIC
	 5K854m5pVzY0sEbiOcQ152FkuqBABPf3BWNWVAh9mIwKM4rPINaBY/zLEStJDu9g1r
	 DQwr98L5usPbuhltOUJ8+tGuyVPxag8AggP9CEy6J0ZiVxKnFjI7fGS8pGjOIw/FKH
	 lopr1fuLh5lk1mMpAiNQh2xwFDW14dVa7Wg44w4CHjKa5gsuhskZaFJKshnKveTNUQ
	 xCkgzPKjyXD+g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=localhost.localdomain)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPb8L-00000004FZc-2vhX;
	Wed, 20 May 2026 07:14:25 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Michael Bommarito <michael.bommarito@gmail.com>
Cc: Yao Yuan <yaoyuan@linux.alibaba.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: vgic: free private_irqs when init fails after allocation
Date: Wed, 20 May 2026 08:17:38 +0100
Message-ID: <177926141814.52935.6341366310707329067.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260519135042.2219239-1-michael.bommarito@gmail.com>
References: <20260517181331.367676-1-michael.bommarito@gmail.com> <20260519135042.2219239-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, michael.bommarito@gmail.com, yaoyuan@linux.alibaba.com, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Tue, 19 May 2026 09:50:42 -0400, Michael Bommarito wrote:
> Companion to commit 250f25367b58 ("KVM: arm64: Tear down vGIC on
> failed vCPU creation"), which added the missing kvm_vgic_vcpu_destroy()
> call to the kvm_share_hyp() failure path in kvm_arch_vcpu_create(). The
> kvm_vgic_vcpu_init() failure path immediately above it has the same
> shape and still needs the same cleanup.
> 
> Call kvm_vgic_vcpu_destroy() when kvm_vgic_vcpu_init() fails so private
> IRQs allocated before a redistributor iodev registration failure are
> released before the failed vCPU is freed.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: vgic: free private_irqs when init fails after allocation
      commit: f19c354dbd457759dfcf1195ab4bdba2bb568323

Cheers,

	M.
-- 
Jazz isn't dead. It just smells funny.



