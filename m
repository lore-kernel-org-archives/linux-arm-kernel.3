Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC83CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5FwMpqgi5opvx3+Z4IrpRGnIWohL5+9jNaT6GKo168=; b=CkG1oLJjOz3gBMPUxM+j2be8GV
	bTswwtxmor+J/HGUqZAHJFWaCNikz988zgX1B1+dGAYRqFiGIc7JGsftiDu5JWtC8ivUYnmz0ajjK
	MxXmpZqDF/qhYBwY0Mel7I4D1kRCg2lYyUUXoN65ymKi/tICOWIjmlX0f1URrjG6MZRIOXQBMszq8
	/G89Wn4wdIDgjoBtuMZ7/MD1KjB2OZLjqRZ0JN8xmHOMwfsxEfYvu7NxYzgQvNQ01hw5IHlNAehrh
	cJjpM8COVT96K6N6Kq6sr5f6afy+QLzZq0FplUy/p8j1SIuAUF6SpJCvTE+01nMZGEcMtnKGXD9Oq
	nUCGA0Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBbc-00000003vr9-0Kq6;
	Wed, 27 May 2026 10:35:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBba-00000003vqy-0iQd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 10:35:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 646FA600B0;
	Wed, 27 May 2026 10:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184571F000E9;
	Wed, 27 May 2026 10:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779878117;
	bh=E5FwMpqgi5opvx3+Z4IrpRGnIWohL5+9jNaT6GKo168=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ljfIYvotYh64+qXVwcocQuGn6klVXrc3oa7e6uOZAp2jzAzV9AvaHB32u9ni+FOQu
	 Hck9Z1I8vzei/H0Pee86Y4cQ6FKKCNEqrv4wXZpR4CuyESRcze3w/KaiCv5NszAH9Q
	 47Jv8J22SagH6EPFl+j53Ih6l5/R1+FKVMqfB/F9O/YXTaS2N+h+4UmsUELNMLwtUN
	 7SsvkIoz62f/oneE3YmEmpHei9t5GpUQo2DozHPgfhG8YUuhf2qh5po7mez1d5dlcm
	 6bGMQ5teERiLFRQPp8fZSUmplt2PeUSCD+/+uGpn0H36LTukgKwT/I2LiiPbCvyJgS
	 s1+B5P6FC7Maw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wSBbW-00000006dhm-3YCo;
	Wed, 27 May 2026 10:35:14 +0000
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
Subject: Re: [PATCH] KVM: arm64: Fix CONFIG_PKVM_DISABLE_STAGE2_ON_PANIC
Date: Wed, 27 May 2026 11:35:11 +0100
Message-ID: <177987810336.1512096.911930782876644415.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520220830.273289-1-vdonnefort@google.com>
References: <20260520220830.273289-1-vdonnefort@google.com>
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

On Wed, 20 May 2026 23:08:30 +0100, Vincent Donnefort wrote:
> A typo in the config guard in __hyp_do_panic broke the stage-2 disabling
> and made backtraces for pKVM quite unreliable.
> 
> Fix that typo.
> 
> 

Applied to fixes, thanks!

[1/1] KVM: arm64: Fix CONFIG_PKVM_DISABLE_STAGE2_ON_PANIC
      commit: 373452ac0649846431ca0f88574a2fa6382d2045

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



