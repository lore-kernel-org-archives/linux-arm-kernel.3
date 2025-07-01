Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E3CC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXqq31iFbM+LPuFZZjOP++M++mWb6fq3c9ooPFXJg3c=; b=z91WOFosnosF9fXfv7EqZxB7kt
	Rn9twnzeGJUgkQRvxu1WZDBsFRrLEtUjzlLhfrPoUiB11N0ILDhQInNpEszssHkAjKxncdf/OlD6P
	cpY2c0T/J5Wq2J/7vWiFJSjk81YiNcDN3IZK1DMj1oaZNnf80amKhRrjIPpmvZkOw2Wp5TiuRwVLs
	kKUTQwukBH3xVfw21P7bGx8GHUaEikzAXIOChbnQrawnI8oAVgbZgvlF9iEm6RiWQxcH6ilCaIkjU
	AbTzCZfcwZTHB6fsv609sERJSnbl+Sau1P+V6x+zqdYAhkkq8bBv7C1SY9z2q4V5EnJrrmDCtLU+Q
	CCIAJfig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWddG-00000005zuE-3o5H;
	Tue, 01 Jul 2025 16:14:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbyS-00000005hrp-2bXr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:28:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E8F66143F;
	Tue,  1 Jul 2025 14:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D993C4CEEB;
	Tue,  1 Jul 2025 14:28:36 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Song Liu <song@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	jpoimboe@kernel.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	dylanbhatch@google.com,
	fj6611ie@aa.jp.fujitsu.com,
	mark.rutland@arm.com,
	kernel-team@meta.com,
	Suraj Jitindar Singh <surajjs@amazon.com>,
	Torsten Duwe <duwe@suse.de>,
	Breno Leitao <leitao@debian.org>,
	Andrea della Porta <andrea.porta@suse.com>
Subject: Re: [PATCH v5] arm64: Implement HAVE_LIVEPATCH
Date: Tue,  1 Jul 2025 15:28:34 +0100
Message-Id: <175138010917.1964100.18246912177187578815.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250630174502.842486-1-song@kernel.org>
References: <20250630174502.842486-1-song@kernel.org>
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

On Mon, 30 Jun 2025 10:45:02 -0700, Song Liu wrote:
> Allocate a task flag used to represent the patch pending state for the
> task. When a livepatch is being loaded or unloaded, the livepatch code
> uses this flag to select the proper version of a being patched kernel
> functions to use for current task.
> 
> In arch/arm64/Kconfig, select HAVE_LIVEPATCH and include proper Kconfig.
> 
> [...]

Applied to arm64 (for-next/livepatch), thanks!

[1/1] arm64: Implement HAVE_LIVEPATCH
      https://git.kernel.org/arm64/c/fd1e0fd71f65

-- 
Catalin


