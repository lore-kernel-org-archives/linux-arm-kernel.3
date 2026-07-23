Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F74C531F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 16:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUOMMMwQfpWkQuL5zRBMp7jRaM606M40dEn2DKXdTFA=; b=C9/LgbxL2DnNcAZzWpME2gFzi/
	0IRcVRQkZ5gbOr0Ug1z5jo0V0l4WPk8v55/l6zHxArTo/miPB7pmEwrex/t4QBDwNs7dHRoGZ10Gw
	Y+lyPbIDWvZ1RwuYHtMEOMH2456BnBbkvP//ZzdwzvkBhpuGZ3fI3OfP51q7jLGg+MPvz7rZ8FjGv
	rbcVtEtF/QBOYIHreC3kWhNUDrGfzlbJPPX9uThFR0DNvr+BPhYx5yGeF7UVaWrwGyO9cOoPuGREd
	m5uCaGz/FGgHQQAkSaGfC/ifWcFpq9lrTkTgXbMlaurPqzThiTvRUQijQDnhE+WvPJUXosvW2sEON
	VFC/Pl4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmw1f-0000000Ega5-3CnY;
	Thu, 23 Jul 2026 16:11:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmw1B-0000000EgIY-1FF4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 16:11:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E94E40BD4;
	Thu, 23 Jul 2026 16:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E9B1F00A3A;
	Thu, 23 Jul 2026 16:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784823088;
	bh=OUOMMMwQfpWkQuL5zRBMp7jRaM606M40dEn2DKXdTFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BY5ndC9e6eqpbogkfVicaynkK/X9u5jVfXDJ9lwTRKo0LQwFDTuqAjy7lkONiG/j9
	 cbuoF8vT8/wFU5rZFeTF3xE+pt5RgEyD0/7PEBIg9dHzLqIrusA2ga5bzyiQKSrD4V
	 iZ5/pJBHUpszfKZMvKrT80fk3LLlBT3yHTAUtTCloc3E46iaeR1BXm5SWN+GiQYWQ7
	 u/7b2VOFq4vtOk6ll3IOQWqWWcjlq8UBBixLVKYLwuEsmLX2yF2DTffVpizXUVxCrx
	 HvVeoZtKJ1GYzH9LCeEtG8RDAXQwtoXY9R1ZtUr2+Vw2JIXfMoyW/YW2vFfvTBaqpH
	 Rt3YSh/blp1UA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wmw11-00000008734-1ATM;
	Thu, 23 Jul 2026 16:11:19 +0000
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
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH v2] KVM: arm64: Fix hyp_trace clock disabling
Date: Thu, 23 Jul 2026 17:11:16 +0100
Message-ID: <178482303773.3351010.6581445728887586605.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715105100.3178255-1-vdonnefort@google.com>
References: <20260715105100.3178255-1-vdonnefort@google.com>
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

On Wed, 15 Jul 2026 11:51:00 +0100, Vincent Donnefort wrote:
> Fix the disable path in hyp_trace_clock_enable(), which fell through to
> re-initialize and reschedule the clock after cancelling the work. Return
> early instead.
> 
> While at it, cleanup hyp_trace_clock::lock which is unused and
> hyp_trace_clock::running which is redundant: the trace_remote framework
> already serializes calls to the callback enable_tracing.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Fix hyp_trace clock disabling
      commit: bbece712cfc7f286b2908ac120dcf700279d87eb

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



