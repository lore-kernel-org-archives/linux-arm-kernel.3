Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89ABCD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 11:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AIlauNyUqgAYjMoNz0VK8efi2k8dTc5G2grZpTKqCsQ=; b=itMfIHfQgbsyWUNinKdTV73Dyq
	9YPv9VU1xugRsf7BArqXv/I7s9UeG8EEXNrJDLx0SWGslkTgJcvFh1Z2ngdFfha7AE32HGxTxphZt
	0VS0ZzMoEEUqmh4mwckhkISd/+/ZZ3npKPPH8zh1/j6nG3dFNIv9d9C1OCbFRScuaos4v/RgtpVyH
	WfJUBYU7czhGRMV+i1wzsH+s9XXm85mJ1g16YUozYC8Vq98M7bERE4B29g9cm0dJW8AjUlzE0i/Ku
	uUfwrPicNQoM6RSdQCXlBoPk+zxehHhn9GHGlJxmubM/0wzAmPn6IsUK0/BJEGvSekJXZmh+AniGM
	RjxYDMGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZonR-0000000HGzY-3Mtg;
	Wed, 17 Jun 2026 11:51:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZonQ-0000000HGzF-1LV1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 11:51:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 745DF6001D;
	Wed, 17 Jun 2026 11:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2653B1F00A3A;
	Wed, 17 Jun 2026 11:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781697063;
	bh=AIlauNyUqgAYjMoNz0VK8efi2k8dTc5G2grZpTKqCsQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U3tjBblEtEBWrJMZtXOZq2OKEyXK/6nMUJ/HsDpmrAT3InSdygNgat510MjCwYweH
	 Hu5qY6RVDKvygbfvZDQ7EWKlg9V0RJzCkaHjOZxK1a2itOTGAFGwSHWoWp7kVL5OAf
	 8V5/ce2v17iUBkFRMKR8av+iwvMnMWZ7qGknnh8lvQbNPCfwVW1+yFP4y7wblXYwfL
	 VI1MLJbp1+XagZNvrSh0sNZQr8lf/hsBh0Wht7rq4HR8YnH//kKph31ouOvnJaHqZq
	 sbhTLFWldaDco2W4ra4kwcUp0+42iuJk/oXZ3ZSWUWLLAI6CTTHjUEnombFvaro9jr
	 1mGWzPcvNMKgQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wZonN-0000000DfJ8-0vg7;
	Wed, 17 Jun 2026 11:51:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Weiming Shi <bestswngs@gmail.com>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kristina Martsenko <kristina.martsenko@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Zhong Wang <wangzhong.c0ss4ck@bytedance.com>,
	Xuanqing Shi <shixuanqing.11@bytedance.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: nv: Fix SPSR_EL2 restore in kvm_hyp_handle_mops()
Date: Wed, 17 Jun 2026 12:50:49 +0100
Message-ID: <178169701881.3049015.16397230325847247864.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260617040820.2194831-2-bestswngs@gmail.com>
References: <20260617040820.2194831-2-bestswngs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, catalin.marinas@arm.com, will@kernel.org, bestswngs@gmail.com, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, kuba@kernel.org, akpm@linux-foundation.org, hverkuil+cisco@kernel.org, mark.rutland@arm.com, kristina.martsenko@arm.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, wangzhong.c0ss4ck@bytedance.com, shixuanqing.11@bytedance.com, stable@vger.kernel.org
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

On Wed, 17 Jun 2026 12:08:21 +0800, Weiming Shi wrote:
> kvm_hyp_handle_mops() resets the single-step state machine as part of
> rewinding state for a MOPS exception by modifying vcpu_cpsr() and
> writing the result directly into hardware.
> 
> In the case of nested virtualization, vcpu_cpsr() is a synthetic value
> such that the rest of KVM can deal with vEL2 cleanly. That means the
> value requires translation before being written into hardware, which is
> unfortunately missing from the MOPS handler.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: nv: Fix SPSR_EL2 restore in kvm_hyp_handle_mops()
      commit: ff1022c3de46753eb7eba2f6efd990569e66ff95

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



