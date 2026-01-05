Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21364CD0424
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 22:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncq2s6474sa9D3GpMgpfMtTeehSgLMBJB69IsErTnNc=; b=OUvz/FDt8WCRKjXETtpwyY630R
	qg4flPfzBw1ljDuez/DG7DydQbUVipnyOqtE8fJ5ois/Tu4W5kKZgaxeOixg5zTYtQE3nSr0fR2k1
	SiARmn2yOdzaHLI4afGbHmXYUcyCyMomx9HCS5ea/308cBYCypDjC659YqUPLHNPAXba/nOk3IfgC
	jyi5+1NYU3PYOLH2e3hn75n6U6tmxYA6TmedVmgGLqrvGMKnVKEQDGRT4RqUdgxZrh+e009pqkr+I
	ZEkCDg5o57aJf0wBtKcdrG3+srlW0NmgrPytZAtdUI0oJGAB36/UEyhGYD02VMh2ymyR69PzB5WRO
	/MBp9Ufw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctXV-0000000CCxj-05Gl;
	Mon, 05 Jan 2026 22:59:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctXU-0000000CCwi-0hVk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 22:59:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9068A6013C;
	Mon,  5 Jan 2026 22:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27DDC16AAE;
	Mon,  5 Jan 2026 22:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767653943;
	bh=zS32bjl8HU3aHzxK9HhcHAJYRjhoEVD8h0LSMzZgws8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uQq7rcV6+nC2mF0eCHJofNA/Jd/xgG8BXfSx/PnYUKGR3FN0AlYke0z6DJ8JUzVXZ
	 fxBeU343LqrmmUwNY7PqAiiZqbgnz1kfUUzrW+F6R0kkAJkP9ISkmqJvnXP+ozVYng
	 kmxssDEAHiRCtKt4mpGEumc2ZYWFg3xZf+ovOeDFg7tkoxvNdTTW9FXkk+Sfu+SE48
	 /xqaeHrG96Ct8z4hZZ/iuCHORNbYW9CQF0foj0YexltwDrEZkWatCX5R7LD9Z5xw7n
	 deeoqBOy/RykHGXmvaLZhz6S4v7UQb2uPZ8plLkTmBLcNC5bhGpJFxGIKNjh1IcAl0
	 EUfPq9nhBwmKw==
From: Will Deacon <will@kernel.org>
To: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	ldv@strace.io,
	charlie@rivosinc.com,
	deller@gmx.de,
	macro@orcam.me.uk,
	akpm@linux-foundation.org,
	mark.rutland@arm.com,
	rostedt@goodmis.org,
	tglx@linutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 0/2] syscall: Cleanup and improve syscall_get_arguments()
Date: Mon,  5 Jan 2026 22:58:27 +0000
Message-ID: <176763166882.1385538.15950355888937561559.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251201120633.1193122-1-ruanjinjie@huawei.com>
References: <20251201120633.1193122-1-ruanjinjie@huawei.com>
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

On Mon, 01 Dec 2025 20:06:31 +0800, Jinjie Ruan wrote:
> Remove unused SYSCALL_MAX_ARGS and avoid memcpy() for
> syscall_get_arguments() for arm64.
> 
> Jinjie Ruan (2):
>   syscall.h: Remove unused SYSCALL_MAX_ARGS
>   arm64: Avoid memcpy() for syscall_get_arguments()
> 
> [...]

Applied to arm64 (for-next/entry), thanks!

[1/2] syscall.h: Remove unused SYSCALL_MAX_ARGS
      https://git.kernel.org/arm64/c/35c3dcb1ac2c
[2/2] arm64: Avoid memcpy() for syscall_get_arguments()
      https://git.kernel.org/arm64/c/98cc091262ef

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

