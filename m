Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F13EF9018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 16:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdDn6PPIkdiaW4dVbK8RH8JOlvqquJTIiM6EsTXD9sc=; b=D7kJhFFV7rbrp1eOZq8FYFKpfY
	UMHjQUos3kSn/bngFMThDezwOmA/wiavp4S8zj3OuGzhgzeoR7oE2yjiVcL++B3rEgA5wMUljvl1X
	rHZud/TDoFA8XY9pLnFzkw0hSp/53GoQieef4NWzuAM8rmtL+FiB99aGHZsxDVEXW0qHSahqi5YIM
	mVbIuM9g13IomciV0pywGCs9YfFCc/pwwBQChSU65SqqAr6KZ1v9/2QDCyf4wazKzHzHWBz5/z3N5
	Ms8k63rz3w6UiJhJWfLHs8NynCvFaaB8Nm1gGgtC19xgelycMHYy6KGFcK2uIfFu/jGQWvxiYOdGI
	6ueKLeCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpZ9-000000006xM-0ha5;
	Wed, 04 Mar 2026 16:59:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpZ7-000000006wO-04zo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 16:59:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36C8D600AD;
	Wed,  4 Mar 2026 16:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 807B6C19425;
	Wed,  4 Mar 2026 16:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772643555;
	bh=jU1wcFlg+DOecT19yahAaCHVps8ABfwGiVyQD0SnPcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FW747/2WpoYzf7iQeFhfOHXGbzn+OnI9LESNKDpYJk6GyCzz66sWVbex8Ly1ny4pI
	 L/6xJSsU0iueVTE/acobNW9nAkoJTZOeJWQp3g2RvHJAuJLAaL7GuuMHMdig+b6vzT
	 ZpOr335az96jR1PqZBROVHUtb8sErhXqQ/woFxTaUpcg192ZBngkARLl611jdJ8qJk
	 b/TSeHCCdPW8HP9J0idrRU3k4XF+M+ZQs/6o29wZ5AMmq+zaQjfnLPt0THpRjlwnct
	 +cOGPyMrqbn8Y4KBY3YnxbZCt2yAmnmdKlyKKIX/gkNHGk3kFeAR2fZG/dT17HoAKw
	 elEj9xS0OYg2w==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: make runtime const not usable by modules
Date: Wed,  4 Mar 2026 16:59:04 +0000
Message-ID: <177264083900.91802.1103243488475941960.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260221023847.3506-1-jszhang@kernel.org>
References: <20260221023847.3506-1-jszhang@kernel.org>
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

On Sat, 21 Feb 2026 10:38:47 +0800, Jisheng Zhang wrote:
> Similar as commit 284922f4c563 ("x86: uaccess: don't use runtime-const
> rewriting in modules") does, make arm64's runtime const not usable by
> modules too, to "make sure this doesn't get forgotten the next time
> somebody wants to do runtime constant optimizations". The reason is
> well explained in the above commit: "The runtime-const infrastructure
> was never designed to handle the modular case, because the constant
> fixup is only done at boot time for core kernel code."
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: make runtime const not usable by modules
      https://git.kernel.org/arm64/c/0100e495cdf0

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

