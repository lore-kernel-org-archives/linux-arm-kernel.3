Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA19CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 09:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PyX8VvJHS5WFJC5R8op7rV8x56n/aE6duu5Fw2y3gp0=; b=nQXp2nEx3y26Zfz2yiW8Nafphu
	odZqMb/jGDXtN0xrO+0bnPgDAH+cz0iGWofynVFkMzw4IXuJUuebXzLa5sqlYoqcoRmzNK7x4iXAN
	AQzFAdYdF+eIZ3eUTmbuU4DrC12rmyQikMrkJ144I9uUpdNGLFC7TRPJdLWxriV6JL3LFj420Ha+N
	UdDKvEHmXYdMUclqkpa6QxCwKYeNwMubLxkJthjEU/ULpx8yuluVTN7AQGXQde2f9NGLo+XKAIiBj
	TFr63x+DCFuLBIhNSIbhkC28xvMrKY4PwBKVrS0XwVY7SutscJx/C2h2CzT9IIzf6lBGmGUcD1bDh
	WP7KaOgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCw1U-0000000DH4Z-0kng;
	Sat, 03 Oct 2026 09:27:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCw1T-0000000DH4T-0GLl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 09:27:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BA27D43DD1;
	Sat,  3 Oct 2026 09:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84AE71F0089B;
	Sat,  3 Oct 2026 09:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791019633;
	bh=PyX8VvJHS5WFJC5R8op7rV8x56n/aE6duu5Fw2y3gp0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=feglxkK/piFBaeQNWOUvhHgfXd5/PW+ToT5SWiPOGnxHv6LZJDO+qmRizom0HM3rK
	 5Qlq67AJdE0dTetjoZXDk5RcfxVXfKaJh5nY/Ho0YZSrX08WjzY2j2OIzGJd/b43f8
	 dXrIO7lzgpAdgMgKpldaoSVf9f7RaIE2UQLZcn7RlcWaqU1v70QSXqNk7yBRoGNSII
	 gajigRafR+c1uVm7nOQh7Yd97eE7V56G9MuFTIoSM43wIYzv3BH8SF5H9Gu800T1/O
	 V6onJXa2f9OTHYdejKzPlxsFuPYyYtSvxUXvYW2jXXySzRYm1m+SlGaorLGj9ikcre
	 yb/uTo1mBEjFw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xCw1P-0000000GV3c-1FKs;
	Sat, 03 Oct 2026 09:27:11 +0000
From: Marc Zyngier <maz@kernel.org>
To: oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Vincent Donnefort <vdonnefort@google.com>
Cc: joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	kernel-team@android.com,
	fuad.tabba@linux.dev
Subject: Re: [PATCH v5 0/4] trace_hyp_printk() for pKVM/nVHE hypervisor
Date: Sat,  3 Oct 2026 10:27:08 +0100
Message-ID: <179101962008.602721.42919125204106176.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001143000.3371786-1-vdonnefort@google.com>
References: <20261001143000.3371786-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, vdonnefort@google.com, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, fuad.tabba@linux.dev
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

On Thu, 01 Oct 2026 15:29:56 +0100, Vincent Donnefort wrote:
> This series adds a hypervisor event "hyp_printk" which enables
> developers to log pretty much anything into the hypervisor tracing
> buffer, just like the kernel function trace_printk().
> 
> This enables rich logging from the hypervisor, while leaving all the
> string parsing burden to the kernel. This has been the main way of
> debugging pKVM in Android.
> 
> [...]

Applied to next, thanks!

[1/4] KVM: arm64: Allow early calls to pKVM host_share/unshare_hyp
      commit: d35311c5d66095da3949787064d4738fee435d67
[2/4] KVM: arm64: Move kvm_define_hypevents.h to arch/arm64/kvm/
      commit: 955feee93e037af78caed7e98d29bbf0268420b0
[3/4] tracing/remotes: Add REMOTE_EVENT_CUSTOM_PRINTK() helper
      commit: 604aaeb39521ef70f56c036dc065b133c85f06aa
[4/4] KVM: arm64: Add hyp_printk event to nVHE/pKVM hyp
      commit: 92866564020c2fbede7f77f5957a75f11f931d53

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



