Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B107E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMyT9smhDnfbZXFW8e+jrN9phjyi/Ay14OgP7oGz2Uk=; b=yWNyM4MgEmfnudQso0JprHw9/0
	TSGVrG5cWmzm0YfFkNL1YePzDYGPEpvQ3lxqy9X0zTaliVCosyYQvh4uP/WAQ57AdXRFvVwZrNdIr
	KdRJiFWW/7EQ1KaTpKPZ3OadIOH+2xP7uevvLF0QDlavcXC++EcrvYCU8a6ToP0CtvbzMmAC1HzAm
	Otet1NX1MscJst9TG0BUZOsT5q7vy7tOmc32gryHpf/IqIcsT8ykL56LFt3wweHL42uRQMXiqjVv9
	OFTjoqUq72h4O3C7FYcwD8FMxCgs/yfceXNrA2tjuJVntq+n21oFs7FEso1YjsRFBVC/5ArE6tzf0
	JSHEM/cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGXs-0000000H6px-1iAv;
	Thu, 05 Dec 2024 18:25:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGVN-0000000H6Xc-3bXe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 18:23:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8EB845C0685;
	Thu,  5 Dec 2024 18:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED26C4CED1;
	Thu,  5 Dec 2024 18:23:11 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>,
	broonie@kernel.org,
	joey.gouly@arm.com
Subject: Re: [PATCH 0/4] arm64: ptrace: fix handling of partial SETREGSET calls
Date: Thu,  5 Dec 2024 18:23:09 +0000
Message-Id: <173342292875.1735998.10087174638613515208.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241205121655.1824269-1-mark.rutland@arm.com>
References: <20241205121655.1824269-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_102313_935744_38820D6C 
X-CRM114-Status: GOOD (  10.02  )
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

On Thu, 05 Dec 2024 12:16:51 +0000, Mark Rutland wrote:
> A few of arm64's regsets forget to handle partial-length SETREGSET
> calls, and copy a small portion of uninitialized kernel stack memory to
> the backing storage of the relevant registers. In all cases the read is
> limited to a specific slot on the stack, and the issue does not provide
> a write mechanism.
> 
> For example, a zero-length SETREGSET to NT_ARM_FPMR will reset FPMR to
> an arbitrary uninitialized value from the kernel stack:
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/4] arm64: ptrace: fix partial SETREGSET for NT_ARM_TAGGED_ADDR_CTRL
      https://git.kernel.org/arm64/c/ca62d90085f4
[2/4] arm64: ptrace: fix partial SETREGSET for NT_ARM_FPMR
      https://git.kernel.org/arm64/c/f5d71291841a
[3/4] arm64: ptrace: fix partial SETREGSET for NT_ARM_POE
      https://git.kernel.org/arm64/c/594bfc4947c4
[4/4] arm64: ptrace: fix partial SETREGSET for NT_ARM_GCS
      https://git.kernel.org/arm64/c/d60624f72d15

-- 
Catalin


