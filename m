Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AEED2FEDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 21:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06zlAZa7hbk9CvagUK6jhYkK9NnVqMe4ifEML7jt2/8=; b=lAFD6ntuBtHq6o0saoJ46upVPk
	z0hcBVyIcFlxxZvJNJ8Akznkuxlu4myewzu0iQlNmzfOcaQvTql3AkWJa+kZjzcD+4R/iTOomf2N2
	xIq8dPHKtbPp2i3yqm/z2bsZLt51Goq7K6EaxMLjg5WC7eqy7baH3b6jRTZ7RwbAfChS4FDSnnxjZ
	G2pk1tE5uYMcRdaI3yL9ZbHI8i3uI0lrRPgdUd7FccWvLiy+ybJu/u9Ed44XZA0sQPNAeu08dluUh
	IN8IHrQ3SM9WU+bRB9RO5Hqc/zFPzt1QL9E/Ycoq1uG1X/OXmQMS0MLczWLRRFzVQH/G4ve0rosMe
	k9yLkG3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqKE-0000000F39r-3KuC;
	Tue, 27 Jan 2026 21:10:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqKD-0000000F39i-2v7p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 21:10:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 793BC601E6;
	Tue, 27 Jan 2026 21:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D20AFC116C6;
	Tue, 27 Jan 2026 21:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1769548212;
	bh=bEhhEMYTusyoE3Pt2j/yJCfV/O/oj7aLwzklTeebDOk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=0U5TKjCQFQYaM9JwOuHCeADxxD2gPIFZovPeFnK/yXYIMTVhEPaIO64M/LzyWCbJw
	 5vCSIMRHJRW8NyvmqLgzWB3vnL0UcUUeiObBVLyCWfFwbFO9/dTVJIZub47DgV7vSD
	 wa62q3FjRc6stXkFkGwjNybjSGYucV3utpJ6HcbY=
Date: Tue, 27 Jan 2026 13:10:11 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Jinjiang Tu <tujinjiang@huawei.com>
Cc: <david@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
 <zengheng4@huawei.com>, <ryan.roberts@arm.com>,
 <anshuman.khandual@arm.com>, <wangkefeng.wang@huawei.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>
Subject: Re: [PATCH v2] arm64: mm: fix pass user prot to ioremap_prot in
 generic_access_phys
Message-Id: <20260127131011.e33438112280b49a018c758c@linux-foundation.org>
In-Reply-To: <20260127090129.412084-1-tujinjiang@huawei.com>
References: <20260127090129.412084-1-tujinjiang@huawei.com>
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

On Tue, 27 Jan 2026 17:01:29 +0800 Jinjiang Tu <tujinjiang@huawei.com> wrote:

> The root cause is that generic_access_phys() passes a user pte to
> ioremap_prot(), the user pte sets PTE_USER and PTE_NG bits.  Consequently,
> any subsequent kernel-mode access to the remapped address raises a fault.
> 
> To fix it, define arch_mk_kernel_prot() to convert user prot to kernel
> prot for arm64, and call arch_mk_kernel_prot() in generic_access_phys(),
> so that a user prot is passed to ioremap_prot().

MM changes are Reviewed-by: Andrew Morton <akpm@linux-foundation.org>

Thanks.  I assume the arm maintainers will process this.

> Fixes: 893dea9ccd08 ("arm64: Add HAVE_IOREMAP_PROT support")

huh, three years.

