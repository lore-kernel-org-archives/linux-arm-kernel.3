Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BEDFED9EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 16:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/i7pN/JmFFjBk2KGUfTaFA0T9CSWM+gc9n6Nr3oe7Y=; b=iVaHWc2tgd6liCsk4YY2GAd2UM
	IzPuMY9qpOq33M/M/d6L5iYCXwOdMhLURRFfmHRwXxXAPdNIZddeUDjdI5RQhVZmOxaRbMm+AasBP
	oZFNsG4RfNrnSIngjCUIZeyWBSqQxPr6ESNuYKNx1znHh1Q7K7AYy5H2rAS0AMwIqlOT9T6rXjRzN
	V3UYSf8iFMFr+BmQlSvXgYzgQg2wzclyOrGTBDjaI5hWnIgCD9TP1KZiQMuUmXFBjbuyaqgc6nhk4
	bjEev5OrsAbxArVAR3yQtZiTq/WGAac0UHVfNjULlV2ZPXXqW96+0X4NQxdT41FbtLsCAJgV1/AMv
	mBPyhLnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2XLA-00000006pGi-00Er;
	Tue, 17 Mar 2026 16:32:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2XL9-00000006pGZ-0fNj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 16:32:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FA0E60008;
	Tue, 17 Mar 2026 16:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 115FEC2BC86;
	Tue, 17 Mar 2026 16:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773765138;
	bh=cYheTIqpcFI6XBmZlpJGrVLvA9SafZRNORIoUZKVj0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X3j6f/knD5CMzTIaf/nN32w38r/tE2Cp4mNGqfpdE4XKhOoHmi5e8bOcFVaFgqUZv
	 5h0IMDqVLRkw38w0xVQ5wu5e/9gFnhsu1i69TafzMnRIZ8px3RIfjphqVyUnnid09k
	 v3ohZkCtmz4XwKLrdJu8mNX2UcOtkZJ6Xz5WkD6xocS6EJ0FsN9WFkqWS/3ItQIMA1
	 HKEx1va87UjkYRERVjpF8LC1A6KXgq3AorrG3C051YkUuicCpYAMHCDxcMvjwHhpa4
	 ElY8EsMJkTgl/H/G4gFLTiyoZ5D2cXSW6mVigVY6uoxRBEep/N5+46lkdzQM533GTi
	 qNmTo5kCgzsDQ==
Date: Tue, 17 Mar 2026 09:31:18 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] lib/crc: arm64: Drop check for CONFIG_KERNEL_MODE_NEON
Message-ID: <20260317163118.GE2931@sol>
References: <20260314175744.30620-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314175744.30620-1-ebiggers@kernel.org>
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

On Sat, Mar 14, 2026 at 10:57:44AM -0700, Eric Biggers wrote:
> CONFIG_KERNEL_MODE_NEON is always enabled on arm64, and it always has
> been since its introduction in 2013.  Given that and the fact that the
> usefulness of kernel-mode NEON has only been increasing over time,
> checking for this option in arm64-specific code is unnecessary.  Remove
> this check from lib/crc/ to simplify the code and prevent any future
> bugs where e.g. code gets disabled due to a typo in this logic.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
> 
> This patch is targeting crc-next
> (https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next)

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next

- Eric

