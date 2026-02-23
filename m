Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62397EC111D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 18:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEfSeQ6hDc1YK0/wiSGwFxZAJb7vn8LhWPtGYkKI3Vk=; b=ulD0Kt9brUGNOVkAC92N7knPh7
	ccUq4V4YviEvWJGYaxiKULWjcGtTe8lbTn8cAKooyQhj6Vf+EOtmd242FBSP//QyNko9O0Wa40Hjv
	7wO5aHPWi+prdNdAkkex+IiIoRQXHEer4UFGc+6PToJLOmNf4t1X7IkuOi65gA6+0W9qWRYxfe9Wu
	M4bTDOWm0dNBH4g8t8PESX973xYGRuJg+lC4sRH0Z02ba0VcbaIHhZfhW89e6f/zLrzHUsP6FsymI
	AfqTq/zARO7zQVDjUdYqnE45qdnRGG3kmO9TmUn9i0NL9V2VrI1I2fJHUKS0LW9Bt8elKTZpoVMYp
	yy6jv02w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuaR9-00000000qhH-1Qgo;
	Mon, 23 Feb 2026 18:13:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuaR7-00000000qh8-3XjN;
	Mon, 23 Feb 2026 18:13:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C5A656013A;
	Mon, 23 Feb 2026 18:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378FAC116C6;
	Mon, 23 Feb 2026 18:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1771870416;
	bh=pQshwKNqTCLj/FvhtbZgOYNC+VNMTBvEaSSSD2wSuHE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=B3HQ7V1CoKgaBIoteEnZFo//C1eOjQmBzA363dlSZJSPGnKwrPagzWWRWHEyGkx/1
	 6MhwDWWeaCOz0KllZsOTIWSRv2FTaTTuUgO3maOmVNlVD3xKMqbal2bskvscPZ+Bhx
	 31nhkKYtbH0jAtANiQoO7gCBg3ymcBqFZCfessdQ=
Date: Mon, 23 Feb 2026 10:13:35 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, linux-s390@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org
Subject: Re: [PATCH 1/4] mm/page_table_check: Pass mm_struct to
 pxx_user_accessible_page()
Message-Id: <20260223101335.aa3696d86341260e03989ac0@linux-foundation.org>
In-Reply-To: <68c2f6df2955033cbf1ccbd2b5c2816e72ac345c.1771845678.git.agordeev@linux.ibm.com>
References: <cover.1771845678.git.agordeev@linux.ibm.com>
	<68c2f6df2955033cbf1ccbd2b5c2816e72ac345c.1771845678.git.agordeev@linux.ibm.com>
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

On Mon, 23 Feb 2026 12:53:13 +0100 Alexander Gordeev <agordeev@linux.ibm.com> wrote:

> From: Tobias Huschle <huschle@linux.ibm.com>
> 
> Unlike other architectures, s390 does not have means to
> distinguish kernel vs user page table entries - neither
> an entry itself, nor the address could be used for that.
> It is only the mm_struct that indicates whether an entry
> in question is mapped to a user space. So pass mm_struct
> to pxx_user_accessible_page() callbacks.
> 
> ...
>
>  arch/arm64/include/asm/pgtable.h |  6 +++---
>  arch/riscv/include/asm/pgtable.h |  6 +++---
>  arch/x86/include/asm/pgtable.h   |  6 +++---
>  mm/page_table_check.c            | 15 ++++++---------
>  4 files changed, 15 insertions(+), 18 deletions(-)

Reviewed-by: Andrew Morton <akpm@linux-foundation.org>

I assume this can go into the s390 tree?

