Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DD1CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1HBkBZQydnw7g3EDoLbI8MmZRjaACL6bLaELKddqgY=; b=N87fI9bgF4UxrJpFeYd2HMzf21
	1wkIUkYgMhLG+HKAXc9r7WBCdSrD5j6IOEUk2d7TUEuLxb8doY0pi1PkDQRLIxL9G9msUMeNrwhxB
	4194yqkuxoZF8yHcn5jg4w9Ygai4VjyKugB/BtKD1RX5VYjuOAuMq0w0QYaMxWj3TJ0tDX343fzh4
	HgrPrtdA95H7o7Bkveg60/RHlPdV71gazSjiqNSPUOMhP/Ubi5ZtoDWsNqD/HNekY2ZX4f0g4rTG9
	FW+fy0ZdJtwZyAhhuKOa5v3YdH4pBoFrNSWP2/LkUymAo5N+xrQsv6tpQib5YDp2cK7+rmXJeyhgJ
	aBexemcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKaGT-00000000bQh-2qmY;
	Wed, 06 May 2026 11:18:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKaGS-00000000bQM-3TYz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 11:18:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 407003319;
	Wed,  6 May 2026 04:17:57 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54F6C3F7B4;
	Wed,  6 May 2026 04:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778066282; bh=Lbtohbwi8oJNvEI6Q4aLRzkMZGQpKjn/hhtEuQyNvrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mAb8dr4fFjnEOGyUSLQl/Hih+psdbseJ6Bv7p4n/+oxj0rMtLcvXBeHv+HxZtkzs8
	 3U2PBgSE8PWYsqbEQQrN52kRua99yMXdI28UTdb4ksg5E14uTbGgqs6zbwXAa2A0y6
	 gmxN2ttJVR5+9usHypjcQni/ff6OLQAiJzHgoSqE=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Oleg Nesterov <oleg@redhat.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Breno Leitao <leitao@debian.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] arm64/fpsimd: ptrace: zero target's fpsimd_state, not the tracer's
Date: Wed,  6 May 2026 12:17:11 +0100
Message-ID: <177806623190.3110399.5860608019820883086.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505-fix_ptrace-v1-1-36ac1f6d0bfb@debian.org>
References: <20260505-fix_ptrace-v1-1-36ac1f6d0bfb@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_041804_909699_5DACC2DE 
X-CRM114-Status: GOOD (  10.20  )
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

On Tue, 05 May 2026 09:02:13 -0700, Breno Leitao wrote:
> sve_set_common() is the backend for PTRACE_SETREGSET(NT_ARM_SVE) and
> PTRACE_SETREGSET(NT_ARM_SSVE). Every write in the function operates on
> the tracee (target) - except a single memset that uses current instead,
> zeroing the tracer's saved V0-V31 / FPSR / FPCR shadow on every ptrace
> SETREGSET call.
> 
> The memset is meant to give the tracee a defined zero register image
> before the user-supplied payload is copied in (for partial writes,
> header-only writes, and FPSIMD<->SVE format switches). Aiming it at
> current both denies the tracee that clean slate and silently corrupts
> the tracer.
> 
> [...]

Applied to arm64 (for-next/fixes). Also fixed the commit log and added
cc stable. Thanks!

[1/1] arm64/fpsimd: ptrace: zero target's fpsimd_state, not the tracer's
      https://git.kernel.org/arm64/c/5cbb61bf4168

