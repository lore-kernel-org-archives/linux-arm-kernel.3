Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C99CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=diM7kSaVoG0aSFuDn4c6brLhayWAcGIqnwHFiCCKOCc=; b=3ox1UtCZuA7aLTx+eXGA77WPFW
	S/KHSs9Ojeh1Nk/cOz2djGh23Y3hdiR5l7hVSaJA0YoNpbUILPn88QYNwdErTUe6yd+LClVUHeOXU
	L270IEQ9rmVLJIaYgQAR94+wksDw4JISlkjnuiShUe+N3mbMYBsXLL7fQZXLcQ5pZCUGIQYzBOC76
	z67ZBhRX4/v0MMltewdb8eTzL/RKHFinzXRQ3fDJbXTb5ZIR5ACIZ/VFibfK82ItBNcgzr785KFLp
	g1sJKV2dkDhRvmkWCfge310yKw2xKsYnCqkp8MTrOtmQFTmlGQLfsKzKvny0TU1btlt+SXDJ0/SH3
	1uSy/Zxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIE-000000020ap-14kc;
	Tue, 19 May 2026 15:23:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIB-000000020Yv-2IkE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:23:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 202FF40296;
	Tue, 19 May 2026 15:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49531C2BCB3;
	Tue, 19 May 2026 15:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204215;
	bh=zzrMG+Oed4wFut9FgmQqZOqaJbLiQiciSLvfm8Ta4lI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y/Pny1CknB8V3C/Exxy5OebrcELQVxP5W42kE/gUkhnnrE+H0wvxPHSU0TNERW3lK
	 ihDWhNQuVui71vuABeUmVWMEQhJQ5O/GeMFR4gk0EIJMKYIsDNH5lilhO5/54Z7aFY
	 +Qk5X5LVftDBsiC1gV5h99Yd3AVqWFIZeeoQNAI5FSIF3NBxzHI1VJxNRV94cU3w8/
	 eNtBFU9clSYscj2C5IeVYImP671VVCZGdBDvcj3Nz51zZpGxiXEbG6ZaIVtxNoEHqR
	 wbcjICtRooCb2W8mdRFq0a0hOgd4uOV78lxJnZ85/WgA4zk6rmqGBpzhmwnYj8mM/s
	 Od3bsUSO/gaoQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Replace BUG_ON() with VM_WARN_ON_ONCE()
Date: Tue, 19 May 2026 16:22:53 +0100
Message-ID: <177918741146.742564.1285426625063261807.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430053859.890613-1-anshuman.khandual@arm.com>
References: <20260430053859.890613-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_082335_604264_FF864414 
X-CRM114-Status: UNSURE (   6.70  )
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

On Thu, 30 Apr 2026 06:38:59 +0100, Anshuman Khandual wrote:
> Avoid BUG_ON() while checking for inconsistent page table state conditions
> and instead replace them with VM_WARN_ON_ONCE().
> 
> 

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64/mm: Replace BUG_ON() with VM_WARN_ON_ONCE()
      https://git.kernel.org/arm64/c/13d0fdc09016

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

