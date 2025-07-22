Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E157C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 16:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcejsZeXZn8Za6TnRKlIMZ9Bwlx3uFJ3XP/Qy5JebGw=; b=JtoPkAwUckbV2gM7BLhFZtcN7Y
	lFEyZlq0rk+E11t6Pg95XbCBNrWwOTg21P7y4FctzQrr50fSfP5vO5PT5DvJhfnl/AbdbCvQLbVjq
	BF6tPMOZHFgkAnQliO7VzeSK31/nHNMl6Hmqqmj/5T2A4nSTmYo0F8nh8TAqDcH1aKexlUBmgKKzZ
	UIpmJljihkbxZewNQbQOQy1aD4GeCK3ZxXn+j8j/ps9es2mCVtzU9pbic+oQaYaV11ptjHRqeJNC6
	/qXANW6LoJ3smUtiZXYOt7AoD19gjDNMddPd05Sp2uxCkT9awkqQg82lJ8U10llWRDPTikG0vEbn3
	xBoXUUQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFuH-000000031uA-2wEw;
	Tue, 22 Jul 2025 16:31:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFPG-00000002xAo-1ttS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 15:59:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA8115C4DA7;
	Tue, 22 Jul 2025 15:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2164C4CEEB;
	Tue, 22 Jul 2025 15:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753199993;
	bh=Jw1SOsEl9C91JibT3pLkU9Mc3G45JyedgXJXRQjr3C8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VcXyS3Q1HpfttvqAso4tRhA3dRN/LH5TK/FfKk/5FC/8gRP7nOjEMF4rS5eoByPDR
	 Sd8gMUQ82KkOkBzcIwEfRvWietQcuZK2MDV/vJrGuzaQKEqz2IjibeuDUBWckMNWY9
	 nQIh9DTK8eo6gvrbX+zcgl+Wjbaqu0YqGSZz9rBfrLbrTi1/LQGONlP1XLSBoqzXe/
	 UZYCrXXmHY6FKZ5E+OAg+DGjrKGK/jlq8oFvPliYLSPYaoytQAwAo5g9v06OBjB8fA
	 CHL3ZAysJzKfodmmLzX4gwZczmlum5OLRPuJuB6rlE6s3Rv+mV+/YliP5SqjoJmwy/
	 0ns0GtvS02PVQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Cristian Prundeanu <cpru@amazon.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] arm64/entry: Mask DAIF in cpu_switch_to(), call_on_irq_stack()
Date: Tue, 22 Jul 2025 16:59:45 +0100
Message-Id: <175319743367.1493246.11042547242207454399.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250718142814.133329-1-ada.coupriediaz@arm.com>
References: <20250718142814.133329-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_085954_532766_F58858A8 
X-CRM114-Status: UNSURE (   8.12  )
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

On Fri, 18 Jul 2025 15:28:14 +0100, Ada Couprie Diaz wrote:
> `cpu_switch_to()` and `call_on_irq_stack()` manipulate SP to change
> to different stacks along with the Shadow Call Stack if it is enabled.
> Those two stack changes cannot be done atomically and both functions
> can be interrupted by SErrors or Debug Exceptions which, though unlikely,
> is very much broken : if interrupted, we can end up with mismatched stacks
> and Shadow Call Stack leading to clobbered stacks.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/entry: Mask DAIF in cpu_switch_to(), call_on_irq_stack()
      https://git.kernel.org/arm64/c/d42e6c20de61

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

