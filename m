Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA90C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 20:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6RXByEGrqpK4gerZlPpWAajPo/Ew2XDbxXVoe7V8Dk=; b=vIKAjxst/5u+vqwMGFFsqkyGqh
	sFqnZeGRK8JQPEd92LcU18Vq7Rn5MGW4sTpXS8wBBCJ1zCw2wJ28p+Ak0k686R3Vlw8H8XWe19g/f
	MjP6oES6/Fep3ArLgDgapzrM++SWi+FWxvFiE4jmoyZxkbnGRkkieF6fKhY2Ykriv0MVmzSvYp3oK
	nZjvBNQe/SxeBD05ln0nrSWcBdWMTCc2oJlO0buhlnTfGUdWT7HqaIqwLVlQGkkkd87Ba9bByODgQ
	4HpuI+Z08v4mbRG4hJObNpFy9Dc+AxQGldsdCSipscCOBlqtxvdiYv5xFQRoqCqYB6BiKH/xQ+srG
	c0ibIxPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rnp-0000000AmQM-3neR;
	Tue, 29 Apr 2025 20:43:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rYt-0000000AkWH-3kxg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 20:28:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0937D68474;
	Tue, 29 Apr 2025 20:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73ACDC4CEEB;
	Tue, 29 Apr 2025 20:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745958495;
	bh=9FRjNM4uCLNjjY3QIHD4J298olP3+FXybe72CiKG8cA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=umBlrp14BgM85CcnRGvHfx5YjGLKhW0YiuigLlEVhBlL2UdMCpUN4xwfupHw2mHGn
	 jBCCiGT31dPcHduZyWSxYfJSCEE5jznhY8tMGv7R2vLPvAZIlh+hOx99I8sGfOvmpa
	 jK/NSSl7A9/WlblsB0JEUKtj9r5WRTV7a4/MDWdNxjwKG3QKtiJOya4RtYTJJA+Ync
	 0Tc0FdZZDDILbBBwlepw5aBVqILFtc3eYvt/eh1akBg75C446+IJIyt5cieTETX52Z
	 oj0tpus+I+0PB84InZPIbnd8OAccYCDox7p71DSs/SHTEWgOv3AlvZsSg1zqa783HX
	 RJVJxc462Uisg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	maz@kernel.org,
	Breno Leitao <leitao@debian.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] arm64: vdso: Use __arch_counter_get_cntvct()
Date: Tue, 29 Apr 2025 21:27:49 +0100
Message-Id: <174593151898.435692.885709123307410375.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250407-arm-vdso-v1-1-7012de25b195@debian.org>
References: <20250407-arm-vdso-v1-1-7012de25b195@debian.org>
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

On Mon, 07 Apr 2025 04:33:25 -0700, Breno Leitao wrote:
> While reading how `cntvct_el0` was read in the kernel, I found that
> __arch_get_hw_counter() is doing something very similar to what
> __arch_counter_get_cntvct() is already doing.
> 
> Use the existing __arch_counter_get_cntvct() function instead of
> duplicating similar inline assembly code in __arch_get_hw_counter().
> 
> [...]

Applied to arm64 (for-next/vdso), thanks!

[1/1] arm64: vdso: Use __arch_counter_get_cntvct()
      https://git.kernel.org/arm64/c/00b39d150986

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

