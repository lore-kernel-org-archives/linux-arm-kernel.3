Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA62CCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 14:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/dD6OwplAn37JFSPxXGNlQWLSZxnTDMZBYLKUqMNCs=; b=qMgOtbBM9bD5bOGtuUbozuYYU1
	5ykp3BzORSA+WRyvTZyVH70nl1VDdo0fUwCK+0518T4z8jtDWTNErJ8PdgN55hhG7xXU8gNqrqe0R
	IGaYqSWbiOxkg/sSwqo1VX9gR5ryxFrllbqf8Ci0aNA1n6vIlZkefBNJOZJrAa4dSDN26e3oRz9EU
	A6gtoSFMX8K2MbeVv6s9ylu7abhgbLrBUZ1aoeuUPnoI5BARnwDHbNQW7UklzLJ9F/96KhJNKlNhH
	sAQ/HOsDzf2aMxAo9K94xmgIjWR6+VIRpcl3y0I4HwE42PEzHjHD2CJ84zq4cYeOiRmzhJxqfbpLT
	fjN9wg0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI5Xi-00000004pqp-1rQA;
	Sat, 17 Oct 2026 14:37:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI5Xh-00000004pqj-0B1z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 14:37:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E10060AA1;
	Sat, 17 Oct 2026 14:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4D71F000C5;
	Sat, 17 Oct 2026 14:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792247867;
	bh=1/dD6OwplAn37JFSPxXGNlQWLSZxnTDMZBYLKUqMNCs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cg0Mgu0Q2JLhKt1XwFDqy+FOopqDmCcIJG+PU8IiMZxQwGNl7xZZW1LGGjYq6Bss2
	 M4sS4PEU5keVkMzP1QEH4o3HVO2jH1ZwnKs11zJ79+BM1KbUkdvijWBHNTBS19ri/c
	 u2b85mthx1uttLdB7hh0zlHqv5xWebNWBH4pEP1So2wTYwIaEXxVsETrciGPxaQPct
	 /tysWrU37FQ6GFQ2ktDuyLW2p/pKGXTBMxW1OM+X6dAPBkojZRS5jlbe+CIW9qmYrJ
	 3thCiKkmCoUoEddWKWaO/iN9HFkDmUcWnz8CrZu1d/NryQFGUcY1MvLloS6a8TtyXf
	 fMQW0MoqhCM+A==
From: Sasha Levin <sashal@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Ricardo=20B=2E=20Marli=C3=A8re?= <rbm@suse.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] kselftest/arm64: keep building and installing after a subdirectory fails
Date: Sat, 17 Oct 2026 10:37:44 -0400
Message-ID: <20261017143745.2601801-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <atERXTfz9xsIuv-7@arm.com>
References: <20261014200115.1363363-1-sashal@kernel.org> <20261014200115.1363363-5-sashal@kernel.org> <atERXTfz9xsIuv-7@arm.com>
MIME-Version: 1.0
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

On Thu, Oct 15, 2026 at 06:46:05PM +0100, Catalin Marinas wrote:
>Sashiko had a comment about breakage ARM64_SUBTARGETS is empty. I think
>it's a false positive but I didn't check.

It is a false positive. With ARM64_SUBTARGETS empty the loop expands to
"for DIR in ; do ... done", which POSIX allows: the word list after "in"
may be empty, so the body never runs. The $(if) sets ret to 0 for that
case, so the target succeeds.

I ran the patched Makefile with ARCH=x86_64 for all, install and
emit_tests under bash, dash and busybox sh, with and without
FORCE_TARGETS=1. Every combination exits 0 with no output.

-- 
Thanks,
Sasha

