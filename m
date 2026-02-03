Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45C9E8B362
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 20:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YD9a/M8MZKh2gVwhQ/jx+6+brzmrCngmo/FdaX13iFE=; b=NnMiwWDCvgfgllqBtK5M//lasD
	C925AdgMSXmlPeBlVAOo8tkXDjNFEeLzn6PKlwXGvqwwpiaqQatr10jRK3+ryHRK+IlpGK0Wfaaz4
	d1Xeg/KDA7zWdkyFueqwXpr1oumMIqjiVNlN/IPoGO1u0aE+kdRGI5HuOTCEHF0saixM1aKhfdCcp
	drRcbqT4ZwvDKY57obOnjgfYBwYm9n08MOctikiVnYWoWfnowWVV+ZfMsUpTxrTrOJHFZLsoNgcsF
	VR/I7sD9xzipklPDIQS3PsZ1FQey0YG2GNl1kFCVAJ6cq6EnnSrNR9Sefqz0uZxaAy4e4juwzyJHj
	bnldUiaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnN1N-00000007K9E-3CYa;
	Tue, 03 Feb 2026 20:29:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnN1M-00000007K98-1B2A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 20:29:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E9C460134;
	Tue,  3 Feb 2026 20:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC6CC116D0;
	Tue,  3 Feb 2026 20:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770150551;
	bh=2jT+yoL7oQ1u8yM1fI3W/rQ/BqB1ZdxgWwSBN4k1IRU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n5vh1XS8l9T8ddsQL3ODS+DYsWzjBrF9loRh+ZnKwwR+SLWPVxIpU108z46LgDro5
	 a6at0JZcapEIWGAM61G27qFL+gPaIQKnY7TelJg5/GFnDBWSuCShja55MHEtB5WmWd
	 F3SRnFovLxLC7MhB7vHhffakNCm0/K1Trn6eN8TjaKPxtcX+rDg4etuvmGqXhi7NjZ
	 2P4ckkC7hkE2BX9jSPtIT6wQkfaMsmE96ANTViZbEMaOv2rqy7m/tFrn8kWZsw3YK3
	 X2f8DsBiOtg8inlpxjqHT9jy2XkgFnCEqrNDAD9PgvReBJfVivxfUtUe8l7MzcWr8W
	 pqnTybeui3jmw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Breno Leitao <leitao@debian.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v2] arm64/gcs: Fix error handling in arch_set_shadow_stack_status()
Date: Tue,  3 Feb 2026 20:29:01 +0000
Message-ID: <177011102209.2472980.4751215527771350608.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260202-arm64_cgs-v2-1-e6a837edf021@debian.org>
References: <20260202-arm64_cgs-v2-1-e6a837edf021@debian.org>
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

On Mon, 02 Feb 2026 10:32:51 -0800, Breno Leitao wrote:
> alloc_gcs() returns an error-encoded pointer on failure, which comes
> from do_mmap(), not NULL.
> 
> The current NULL check fails to detect errors, which could lead to using
> an invalid GCS address.
> 
> Use IS_ERR_VALUE() to properly detect errors, consistent with the
> check in gcs_alloc_thread_stack().
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm64/gcs: Fix error handling in arch_set_shadow_stack_status()
      https://git.kernel.org/arm64/c/53c998527ffa

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

