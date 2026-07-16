Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EEDC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7aYWR7TGdNYjkLxVXmWuRVSKIIhb67yRGihsaVkcH8M=; b=bOxSlUizEuyQrryXGXcIp36K75
	m7QTK0oeP6ZAH/vlsGeVXlVsE0y37cC953e/BZ5LKCvseQmmpgVbkwNM/qp19r7zmOzaziDa6maPA
	yEMMPbnVDD6uLFxjzQXc/yB+icqUNpOMzNKWd9po6jpzNjOBwHgXgZH6dgJp73yHe28Tlax77W5X5
	DYrV94z97eYiblL/HOMuZ6RY/me5B9H/GZed1kxS0z9nwQ4akDrQB8OL0XGwvN5u6mWvxIzsF+88i
	4oXnflU1sZ+/BHJGyoHh/n94O0PNnkTDqU3i/DUsJeuWXlAI+Du2C++VQUgcBIh0e/u9wsVg2plKq
	BvqaklPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPGD-00000000Cj0-49dn;
	Thu, 16 Jul 2026 16:48:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPG0-00000000Cdb-3fPu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 16:48:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 66AFC4037F;
	Thu, 16 Jul 2026 16:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802371F00A3F;
	Thu, 16 Jul 2026 16:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784220500;
	bh=7aYWR7TGdNYjkLxVXmWuRVSKIIhb67yRGihsaVkcH8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Sn672RZUGNRtO4T1GSIneL/kHKYtfDDk64OO5GlmkDaqbu5iCJ/N1G7j5v0xnaQzf
	 Uq0N9bXROGEG7HTgtXdZw/zI0ui0yPA9LO/0iG6bKEoLwS/5KtU6v84+oKvMF6v8hm
	 62h3ZuBWMJd0b0fZZBKSyo8l0NXgshaPB5iG48/Kt7HXG+IJuUbyys3i8fSepffTK5
	 w7V6d6YGyhTUesp9R/KzSfRc2zn76aqp7AGsBFmwhnNrAl2UZRctMHFReqmskyXftV
	 xIEpCGsQxoMlqOjVOFbLq2rN4pN8D/B5cZqpdXwq3CY5Y8vDOSDIi+xrjET02gjMy/
	 4S5b1QBI+rxhw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Yiqi Sun <sunyiqixm@gmail.com>
Subject: Re: [PATCH v2] arm64: syscall: Ensure saved x0 is kept in-sync with tracer updates
Date: Thu, 16 Jul 2026 17:48:01 +0100
Message-ID: <178420908877.33796.2351583216856259313.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260716120640.6590-1-will@kernel.org>
References: <20260716120640.6590-1-will@kernel.org>
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

On Thu, 16 Jul 2026 13:06:39 +0100, Will Deacon wrote:
> When seccomp support was originally added to arm64 in a1ae65b21941
> ("arm64: add seccomp support"), seccomp was erroneously called _before_
> the ptrace syscall-enter-stop and therefore the tracer could trivially
> manipulate the syscall register state after the seccomp check had
> passed. This was subsequently fixed in a5cd110cb836 ("arm64/ptrace: run
> seccomp after ptrace") by moving the seccomp check after the tracer has
> run. Unfortunately, a decade later, that fix has been reported to be
> incomplete.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: syscall: Ensure saved x0 is kept in-sync with tracer updates
      https://git.kernel.org/arm64/c/e057b9477232

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

