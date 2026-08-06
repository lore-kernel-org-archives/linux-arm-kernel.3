Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D054C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/gLDqiEqei1+fjZXdMiK47A9FRs2SDhUmiNtbllN8nE=; b=O9Q4PdZGPusFhO2wuVa6yW5pe9
	E9TIM0FfcatPS3JhkaIm/CJFY029lFDvUPmSJo/Vqj1N+xEHHKKrlNSO3iMmPzOJRdXLhOVQuxlQP
	C6DZoNNvLFOjNkMkrX5ZU53VbLDjAU09itFz2r9d6J+gvJ3AXSDzgyBttUdyj3sXcz2hdYv2DWHka
	TTzPvc4C9DADPqMs5MzJ3aVWCo35ikS5A/lbBcmPBpiGAsCxnpoKogbYJnUEc4c7XCQvE4nVlc1wc
	QCOsvX+1ZHOeeCMbs3NyufWb6uPWmxeQL8UrdbihLxcvrSL0bdINZ7/gjFAqT+9JqFt0hei/dzHLY
	NFlYLvZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1dR-00000006KUx-2KFa;
	Thu, 06 Aug 2026 17:12:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1dQ-00000006KUO-0RhI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 17:12:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D8E10418BA;
	Thu,  6 Aug 2026 17:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403EC1F000E9;
	Thu,  6 Aug 2026 17:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786036319;
	bh=/gLDqiEqei1+fjZXdMiK47A9FRs2SDhUmiNtbllN8nE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gYCLj/zglJVnOWYe18H7W6nAeZ5joQXjvmP2m3xjx4FzTopPkXOxrziOhDmj7Z1MZ
	 6jCioFfjD+P/uaup4I08ljip+EgVrcRSRSdRt0vpsOzpyZ4oVdgzQRJyFGJAAPm7gt
	 f7/KFMOyHkOGzFXFkXaN+2NQg5u4ZDweN5VTGqc4wVN6hdOF7Qpg7fQLWb7ZER1OzH
	 RB2U113phXlNSgNmxwpGACvGnJFi67NTDmROgjlL126YEo50VRhjm649v7f6DjeVig
	 6NGmCwVp8EvLV0f95Yar05VLm5wOgWkj2gZezmW9wesq1iMtRSzX2GQYBw8QuNogN5
	 MiqmWkUccy0Sg==
From: Will Deacon <will@kernel.org>
To: He Kuang <hekuang@huawei.com>,
	Wang Nan <wangnan0@huawei.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Aishwarya TCV <Aishwarya.TCV@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: Ensure tools copy of linux/filter.h exports the UAPI
Date: Thu,  6 Aug 2026 18:11:38 +0100
Message-ID: <178601921971.406723.9036179766069411765.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260805-arm64-selftest-fix-filter-h-build-v1-1-c29648ee3126@kernel.org>
References: <20260805-arm64-selftest-fix-filter-h-build-v1-1-c29648ee3126@kernel.org>
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

On Wed, 05 Aug 2026 22:32:23 +0100, Mark Brown wrote:
> Normally when there is an include/foo.h and an include/uapi/foo.h the
> non-UAPI copy includes the UAPI copy.  This is the case for the in
> kernel copy of linux/filter.h but not for the copy in tools/ which
> results in build breaks for the newly added arm64
> seccomp_ptrace_x0_bypass selftest.  Add an explicit include of the uapi
> to fix the test and avoid future surprises.
> 
> [...]

Applied to arm64 (for-next/selftests), thanks!

[1/1] tools: Ensure tools copy of linux/filter.h exports the UAPI
      https://git.kernel.org/arm64/c/7a1f400ff5e5

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

