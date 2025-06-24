Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00611C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 22:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3WubIYM8wjxpfe7V9HpGNpkGvHAtA2WJn/GzMfyPPw=; b=Sg7UN3Hwp01URrEHp6BqX5t1kO
	k36B66MdIPqxtz4nvMunRoXN7opypQ4wMivRcd3rrSOFmMYlT92Gp+FdP+mkKPcLRs6rxSodqH0J6
	nIlcXOMTsZOLhYhvMWGMklUHn1UMLUgH0P/5qf5rXrBZs+LUgFJ9MY1eqq9QVGnncmMfnSZFN7RSi
	SeX/dSS34nDhzL4miJtqycDYJulpMTLfFeHNkKWkLo+UO35N5sULL+OxofITevwM14a1JBuk27LvM
	O9zM0VDrGdo//D3S2bV7QwkXyJhBKz80Utj5wobXtrMNM1reLPDPlFYG7+v/Gv3BcNStQQJH6UvZd
	w7tyshNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUCKq-000000070nU-2aPL;
	Tue, 24 Jun 2025 22:41:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUAzk-00000006rEJ-3DOo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 21:15:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E044B61142;
	Tue, 24 Jun 2025 21:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D244C4CEEF;
	Tue, 24 Jun 2025 21:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750799754;
	bh=W5s1IFYyVhSSY9SrWIviBul/iZkSfkZeODC+rQMFddc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=2Xj89RYbZEENGcDHm4sbgJ/U8audnpKjKK6tmNfMxq92zVbw7ZNWkizFpNIzlaQ82
	 UEmLaCiaqjrnDqRPamVI5YPwQVJ0H45/YECUiYSXn/+ED4VWhHFTWSE4anr6ZZ7hDZ
	 Hd4IARd52a5ZB1htmQr1x24Kzxn+z/Ud9DjEd180=
Date: Tue, 24 Jun 2025 14:15:53 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Xavier Xia <xavier.qyxia@gmail.com>
Cc: ryan.roberts@arm.com, will@kernel.org, 21cnbao@gmail.com,
 ioworker0@gmail.com, dev.jain@arm.com, catalin.marinas@arm.com,
 david@redhat.com, gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, willy@infradead.org,
 xavier_qy@163.com, ziy@nvidia.com, Barry Song <baohua@kernel.org>
Subject: Re: [PATCH v7] arm64/mm: Optimize loop to reduce redundant
 operations of  contpte_ptep_get
Message-Id: <20250624141553.17afe765c0f692b7a7ec007a@linux-foundation.org>
In-Reply-To: <20250624152549.2647828-1-xavier.qyxia@gmail.com>
References: <20250624152549.2647828-1-xavier.qyxia@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 24 Jun 2025 23:25:49 +0800 Xavier Xia <xavier.qyxia@gmail.com> wrote:

> This commit optimizes the contpte_ptep_get and contpte_ptep_get_lockless
> function by adding early termination logic. It checks if the dirty and
> young bits of orig_pte are already set and skips redundant bit-setting
> operations during the loop. This reduces unnecessary iterations and
> improves performance.

Thanks, I added this to mm.git for some testing.  But perhaps the ARM
tree would be a better merge path - more testing, at least.

