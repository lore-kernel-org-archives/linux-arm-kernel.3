Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D72D1BDD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 17:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pT8ii77rRm4NpOmhgs1EQZJfWNXEOTRXMRmMRDjM0nk=; b=FYLlr/565drLoMSkisru8Y+Kkd
	Fo3/G/IwN+fsz+tIH7T+j9UTuuVGg975mn9twmlFbVSdBTatsVWaM5B234LFbq/EJ+5QsrPBHiZda
	Nkqthb2isbJn6r5CI42K5OOruyfxgqEVWexRlXh7b+29h1HO6u2SIQ+FFhXqulfnL8XteNpDmNMku
	aOUaT4M0h6YAs26Si/pfuL4xiPoWtnBcFvlxZyKIOR/qLTXhANr9tHzjpXW2Kc5IT5MuOaJI4EmLY
	6vmXMo4zZNcNhGZRICXzKBEQSbdSXW1qxxsxef3plioGNRY73wY/kHmek/ouJYoZ9MKF8DHGTB/QT
	cZcByT9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t81BR-0000000EaSh-0bM1;
	Mon, 04 Nov 2024 17:48:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80dG-0000000EU0b-0XQ2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 17:12:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2EA575C2975;
	Mon,  4 Nov 2024 17:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36DB4C4CECE;
	Mon,  4 Nov 2024 17:12:45 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Will Deacon <will@kernel.org>,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	aruna.ramakrishna@oracle.com,
	broonie@kernel.org,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	jeffxu@chromium.org,
	joey.gouly@arm.com,
	keith.lucas@oracle.com,
	pierre.langlois@arm.com,
	shuah@kernel.org,
	sroettger@google.com,
	tglx@linutronix.de,
	yury.khrustalev@arm.com,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: Re: (subset) [PATCH v3 0/5] Improve arm64 pkeys handling in signal delivery
Date: Mon,  4 Nov 2024 17:12:42 +0000
Message-Id: <173074023809.2453606.393538963004702686.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241029144539.111155-1-kevin.brodsky@arm.com>
References: <20241029144539.111155-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_091250_231520_96361340 
X-CRM114-Status: GOOD (  11.51  )
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

On Tue, 29 Oct 2024 14:45:34 +0000, Kevin Brodsky wrote:
> This series is a follow-up to Joey's Permission Overlay Extension (POE)
> series [1] that recently landed on mainline. The goal is to improve the
> way we handle the register that governs which pkeys/POIndex are
> accessible (POR_EL0) during signal delivery. As things stand, we may
> unexpectedly fail to write the signal frame on the stack because POR_EL0
> is not reset before the uaccess operations. See patch 1 for more details
> and the main changes this series brings.
> 
> [...]

Applied to arm64 (for-next/pkey-signal), thanks!

I took the kselftest patches through the arm64 tree as well (patch 4
acked by Dave Hansen from an x86 angle). Patch 1 has already been merged
as a fix (this branch is based on top of the arm64 for-next/fixes one
which contains patch 1).

[2/5] arm64: signal: Remove unnecessary check when saving POE state
      https://git.kernel.org/arm64/c/466ece4c6e19
[3/5] arm64: signal: Remove unused macro
      https://git.kernel.org/arm64/c/8edbbfcc1ed3
[4/5] selftests/mm: Use generic pkey register manipulation
      https://git.kernel.org/arm64/c/6e182dc9f268
[5/5] selftests/mm: Enable pkey_sighandler_tests on arm64
      https://git.kernel.org/arm64/c/49f59573e9e0

-- 
Catalin


