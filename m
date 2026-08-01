Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5953AC55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 11:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJFRZYvUMbiVIUOjSQH500WaF8jMfo/BVWXDkXdQIaQ=; b=ZFJ6KXa6yx59X+cGW9BR6zkYuS
	CFfTaGvabA1qp3mzyKdUnrVaPLfs6xEmR3gKMkbgTKALzLqAWk/pwXbfDcX4xUKDevieUD4EgcoiP
	U/CtT2WwYLwLLVOqh+Y+6oJozltjD/iCI2jH79Q0zEa78DeEnwEgkvgsHsMdU07phtV/aVhpKIAxe
	7I/14XbtbnFXxvbCIsDFJ0y3xYI7WV9OdkF5Ke9oqjXNf3TpvB2PiMRX/T7IqMTCfku4Hw/p8Aye9
	B5qmUHhQ63L4ZM86tWJGrl2tkX7M7RSL0/rN9817GP4B1I8UDTxLrd3xCqGuliee1fkPcTP1JFmWY
	a52iDvzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq7tb-0000000EGVY-2ecs;
	Sat, 01 Aug 2026 11:28:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq7ta-0000000EGV9-0XmX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 11:28:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EA2260A98;
	Sat,  1 Aug 2026 11:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D331F00ACA;
	Sat,  1 Aug 2026 11:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785583729;
	bh=hJFRZYvUMbiVIUOjSQH500WaF8jMfo/BVWXDkXdQIaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OeLVnyd6zGgLFlnhUiVUgc1C9g7ew9Y8Gn9so0Dzjq7p8dz/R/WEK7EDgRmqlgSPW
	 7+fMl19S1i3WzGWYMvP68Mb6bQqgj4a/W9K3XjvabG8uStuGOR/dFhgHFPC/1wgF/G
	 pMAWeYOEOYVSCcFgOODx22ciVjQ2XK94oF4XTnkmqHKyEx51CQedmxEE8TCJh5nKaL
	 rHsJHfk0taP1pXAClIZlsQ0O0e8fiEvwKQ79g5HuLvsResNEN6KJMPDPQLbc9NhFHk
	 CcfoQND/759OElU7zCrv3eKOgOCsfiGPZVgnj5iyXeVm5Xhhq0DTY0GaiaADShbARy
	 LsebwpdGeCm8Q==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leo Yan <leo.yan@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] perf: arm_spe: Make wakeup range check overflow safe
Date: Sat,  1 Aug 2026 12:28:30 +0100
Message-ID: <178550621893.239311.16566989493274037656.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702170521.4103426-1-leo.yan@arm.com>
References: <20260702170521.4103426-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 02 Jul 2026 18:05:21 +0100, Leo Yan wrote:
> The current code checks whether the wakeup point is in the current
> writable range by comparing it with handle->head + handle->size.
> 
> The perf AUX head is a monotonically increasing index, so that addition
> can overflow when head is close to ULONG_MAX. In that case, a wakeup
> point which is still inside the free space range can be missed.
> 
> [...]

Applied to arm64 (for-next/perf), thanks!

[1/1] perf: arm_spe: Make wakeup range check overflow safe
      https://git.kernel.org/arm64/c/fcc5eaea2d23

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

