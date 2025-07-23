Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F447C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 16:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFd0/QVzADDGDclddPa4J9+Mp5kgGKJ3GXSgAfTsZA8=; b=H5rXfs0R1eyPXMocxa80bt5tzN
	nmKaPmIsO/ziFG+bLEdZgiZSVJmbPdwtI59AA29t1ZrreLQScHSO5oi0neoY3fx4oA7S5L9mQo1zT
	+036maqFtezPd3h+paNO2kN/4c9fFnW3TTVLVr90l8OA8rhIskTbXydYUEMCi54+Xbiugp0VzdNzE
	rQ4K2K71XRxxMBvszF3iUgBQdHgmx32iplJPl0Jhu2Tp8KSXI5NmI/0042JM+sJVBcNOJfT2DeVX2
	2s1Q/PZ6WQ9JgPilFlbitcCoRaJ8j2J7Ux/GErih5AGFtXGHmebpYK+K8Gy3EJsKemnqu+ONt2K0c
	Hmsa5sbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebyu-00000005Sq3-1uyo;
	Wed, 23 Jul 2025 16:06:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebwT-00000005Sa2-45Of
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 16:03:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26D4B601DB;
	Wed, 23 Jul 2025 16:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFB9C4CEE7;
	Wed, 23 Jul 2025 16:03:36 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-trace-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Cc: Will Deacon <will@kernel.org>,
	linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	thiago.bauermann@linaro.org,
	broonie@kernel.org,
	yury.khrustalev@arm.com,
	kristina.martsenko@arm.com,
	liaochang1@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/8] arm64: Enable UPROBES with GCS
Date: Wed, 23 Jul 2025 17:03:34 +0100
Message-Id: <175328660445.3870926.2919716092405832672.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250719043740.4548-1-jeremy.linton@arm.com>
References: <20250719043740.4548-1-jeremy.linton@arm.com>
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

On Fri, 18 Jul 2025 23:37:32 -0500, Jeremy Linton wrote:
> Currently uprobes and the Arm Guarded Control Stack (GCS) feature are
> exclusive of each other. This restriction needs to be lifted in order
> to utilize GCS for generic Linux distro images where the expectation
> is that core debugging features like uprobes work.
> 
> This series adds some user accessors to read/push/pop the userspace
> shadow stack. It then utilizes those functions in the uprobe paths as
> needed to synchronize GCS with the changes in control flow at probe
> locations.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/8] arm64/gcs: task_gcs_el0_enable() should use passed task
      https://git.kernel.org/arm64/c/cbbcfb94c55c

-- 
Catalin


