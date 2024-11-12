Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F128D42BAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 16:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FP8ZW7DwTa2E2kSupMHEhUL/BjGsymqyPI0zIanmS3o=; b=1rDhp25wwVl76+U16lIz61Do0Y
	xgKGCNLmQCOOykV2HmQ5a+mQ47O6VdzE9nlAL6onO0GVaMwEYI/SpWVxM+XCZHp8mYChmON3lb3+I
	fCy+VM6170DIaGEXL8YumAusP4hgaAp27kBNRG+ck7gKNJ+A17gRCDqvXnZBOuwQnF1O7McPb9KGP
	o0T14LDeSyE7p/ceMYdpfOKa3zXUM09xXF5Ekjz+qv3sOJBlHJiQil7aFlOKK6p5NXzBpDAkZ0PDL
	mDrMFZENp+5OwVtBz6UkeAXQPABHGBHuApCFV1vymkeYsyc1r1vl5hk2/yKa9SKu7GHiitp3SSlxG
	n4cQxoSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtlM-0000000490O-2Dd3;
	Tue, 12 Nov 2024 16:29:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtTh-000000045bP-0MXk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 16:10:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 204495C5810;
	Tue, 12 Nov 2024 16:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A27C4CECD;
	Tue, 12 Nov 2024 16:10:49 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Subject: Re: [PATCH] selftests/mm: Fix unused function warning for aarch64_write_signal_pkey()
Date: Tue, 12 Nov 2024 16:10:47 +0000
Message-Id: <173142783788.896701.6743208962860703144.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108110549.1185923-1-catalin.marinas@arm.com>
References: <20241108110549.1185923-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_081053_240315_495A5EF4 
X-CRM114-Status: UNSURE (   8.52  )
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

On Fri, 08 Nov 2024 11:05:49 +0000, Catalin Marinas wrote:
> Since commit 49f59573e9e0 ("selftests/mm: Enable pkey_sighandler_tests
> on arm64"), pkey_sighandler_tests.c (which includes pkey-arm64.h via
> pkey-helpers.h) ends up compiled for arm64. Since it doesn't use
> aarch64_write_signal_pkey(), the compiler warns:
> 
> In file included from pkey-helpers.h:106,
>                  from pkey_sighandler_tests.c:31:
> pkey-arm64.h:130:13: warning: ‘aarch64_write_signal_pkey’ defined but not used [-Wunused-function]
>   130 | static void aarch64_write_signal_pkey(ucontext_t *uctxt, u64 pkey)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied to arm64 (for-next/pkey-signal), thanks!

[1/1] selftests/mm: Fix unused function warning for aarch64_write_signal_pkey()
      https://git.kernel.org/arm64/c/929bbc16abfb

-- 
Catalin


