Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076A0CAC59D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 21:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mf7gPWTeuvv9u14q3gUGRkGJPHz8gkzoxBogXty+zu0=; b=dGhPBWRhGjKteZUhBZ+ga337kd
	ae4yn13pL0Sb8hkl4qklcDqw3M2UZakf3VnCjL74xHLESULP41C+VqF2DStQsiZOjafc1LGnOCxDa
	3lErfDfWrhtQHOH5XqTAjrYLA2MIET18wWsgo6CCkU554umnfNDU61Hz5FICCwd4Z1hqOkxT67uid
	OKtsd6Jf2aTxQFFSg623fJDNfH8q46Gtqe2BaV7adDWn4WtfSOlTPjkSKWZnDuw+TF/lWl3G58Rys
	jjq1kIIvlqw2SFMp37Ty6lX/3MDKVQrFeftxJJMRnZdyRVhUc7Rv8GgotgJUmJ5jnMlzd9EbelNBE
	XLwel9yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyd0D-0000000996o-0Ljk;
	Tue, 16 Sep 2025 21:14:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyd05-00000009925-0uxl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 21:14:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A86042B83;
	Tue, 16 Sep 2025 21:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BA2C4CEFA;
	Tue, 16 Sep 2025 21:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758057248;
	bh=fhcQ7mAvVQamgqtHY+IP4JtTNxdI5gFnZDUASczOQrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ralJvAevmAck43ywds4IRoOCtDf/FHWU52FahALhd1vamULYr5PErWWEbusFxfDuY
	 FPtnmNDbFZtp0aMq6X4k865RchoW/AUkyeEx39wEaOeoF8mKVIMSyJ4vEEDunsuCqA
	 keWDAIbNqS4CE72O5EQo24hR0ASWju6mnyYZ9hC5IaHMEU1G2M0S+KiRhryVW9t+4V
	 Id19tGEOHisWHaLVLg6UeyIOdhQwdyFliSNufFnmXfAEW32W598I8+xvsGOMH3T4Tl
	 0+kk/IdXJWNEJ+i9qqecslrXGGZScEXMo9mVJ/mVVTszxHXgB9n1XvIWchQrAJw/BG
	 x4U60EYlkIjNw==
From: Will Deacon <will@kernel.org>
To: linux-trace-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org,
	mingo@redhat.com,
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
Subject: Re: [PATCH v7 0/7] arm64: Enable UPROBES with GCS
Date: Tue, 16 Sep 2025 22:13:49 +0100
Message-Id: <175805110604.263842.2881563818650081445.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250825033421.463669-1-jeremy.linton@arm.com>
References: <20250825033421.463669-1-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_141409_280413_E739BF0D 
X-CRM114-Status: GOOD (  10.65  )
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

On Sun, 24 Aug 2025 22:34:14 -0500, Jeremy Linton wrote:
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

Applied to arm64 (for-next/uprobes), thanks!

[1/7] arm64: probes: Break ret out from bl/blr
      https://git.kernel.org/arm64/c/47687aa4d9c9
[2/7] arm64: uaccess: Move existing GCS accessors definitions to gcs.h
      https://git.kernel.org/arm64/c/ea920b50ac9f
[3/7] arm64: uaccess: Add additional userspace GCS accessors
      https://git.kernel.org/arm64/c/9cd2a7f1180f
[4/7] arm64: probes: Add GCS support to bl/blr/ret
      https://git.kernel.org/arm64/c/efb07ac534e2
[5/7] arm64: uprobes: Add GCS support to uretprobes
      https://git.kernel.org/arm64/c/4a601714bb24
[6/7] arm64: Kconfig: Remove GCS restrictions on UPROBES
      https://git.kernel.org/arm64/c/cc66c711e58f
[7/7] uprobes: uprobe_warn should use passed task
      https://git.kernel.org/arm64/c/ba1afc94deb8

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

