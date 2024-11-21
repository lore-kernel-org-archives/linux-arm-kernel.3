Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CF3E64007
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 19:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PoVeBMk4kKudlJ+K1M+9ypkywmQ2NmKwvJnRDBsYgis=; b=xubIbnGgD7Na0frGMH91ivKaGg
	ViK0pYc3/hYbjUophQJV4+k9tebMoYdgzHhVAUUUeknPpSJOYLDlqwi8wy3S9tSfhmR6Pe+1GLARP
	deZPvITypDsIN0/z5EfgcSe1XY+f4ocD+Q1hRv3W5IihPULpfD7UIoGaeR0krH6SLnESo65teBNsn
	WcxjAoZRr8QTVP2D27bdAkfJaWmuIWc5WPpBFBn87IA1nbMIeckbhtDcb/+V7B0+5T75XL6slIjLI
	1jIs4+pHB2EBeLDh59X1JYYAVnM7QG/t3CtRao0+i8AJm7JNp6pRdo93kqBL6sMYPydPJh7y++OnX
	Me+AByAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tECm5-00000000lQj-2iY3;
	Thu, 21 Nov 2024 19:23:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tECl9-00000000lG5-2A1G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 19:22:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CE9385C4A3C;
	Thu, 21 Nov 2024 19:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67DB3C4CECC;
	Thu, 21 Nov 2024 19:22:31 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>,
	ardb@kernel.org,
	broonie@kernel.org,
	jpoimboe@kernel.org,
	kaleshsingh@google.com,
	kristina.martsenko@arm.com,
	linux-kernel@vger.kernel.org,
	madvenka@linux.microsoft.com,
	maz@kernel.org,
	mbenes@suse.cz,
	mhiramat@kernel.org,
	rostedt@goodmis.org,
	Puranjay Mohan <puranjay@kernel.org>
Subject: Re: [PATCH] arm64: disable ARCH_CORRECT_STACKTRACE_ON_KRETPROBE tests
Date: Thu, 21 Nov 2024 19:22:29 +0000
Message-Id: <173221694242.390240.12306680698453955259.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241118120204.3961548-1-mark.rutland@arm.com>
References: <20241118120204.3961548-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_112235_598354_9090EB44 
X-CRM114-Status: UNSURE (   8.09  )
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

On Mon, 18 Nov 2024 12:02:04 +0000, Mark Rutland wrote:
> The kprobes_test suite's test_stacktrace_on_nested_kretprobe() test
> currently fails on arm64, e.g.
> 
> | KTAP version 1
> | 1..1
> |     KTAP version 1
> |     # Subtest: kprobes_test
> |     # module: test_kprobes
> |     1..7
> |     ok 1 test_kprobe
> |     ok 2 test_kprobes
> |     ok 3 test_kprobe_missed
> |     ok 4 test_kretprobe
> |     ok 5 test_kretprobes
> |     ok 6 test_stacktrace_on_kretprobe
> |     # test_stacktrace_on_nested_kretprobe: EXPECTATION FAILED at lib/test_kprobes.c:327
> |     Expected stack_buf[i + 1] == target_return_address[1], but
> |         stack_buf[i + 1] == -96519936577004 (0xffffa83733777214)
> |         target_return_address[1] == -96519936577136 (0xffffa83733777190)
> |     # test_stacktrace_on_nested_kretprobe: EXPECTATION FAILED at lib/test_kprobes.c:338
> |     Expected stack_buf[1] == target_return_address[1], but
> |         stack_buf[1] == -96519936577004 (0xffffa83733777214)
> |         target_return_address[1] == -96519936577136 (0xffffa83733777190)
> |     not ok 7 test_stacktrace_on_nested_kretprobe
> | # kprobes_test: pass:6 fail:1 skip:0 total:7
> | # Totals: pass:6 fail:1 skip:0 total:7
> | not ok 1 kprobes_test
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: disable ARCH_CORRECT_STACKTRACE_ON_KRETPROBE tests
      https://git.kernel.org/arm64/c/a63d7408afbd

-- 
Catalin


