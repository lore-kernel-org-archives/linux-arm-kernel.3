Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20FFC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 18:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uz///Ij9FC5V4hcdEWJSScJaI9PiKDerg7JVcYSTv6I=; b=XDIsO0rjx2CQaHBi+NvqabCSk1
	D2/5IlOJjtaj4dRSxeffO3e/3HCR9ohcxZGJP51AQLkZgRrjZz9odnFRpBfED0zn+MFkBvA2FCCDI
	XqP0eO5cYtgrRNjGvzXO28F9H27t1WmJFjoHABucWP5zryh8Yv77up/1MojVunMpbkkfKdFt3RnWq
	dJLnvwRnkyHzFMHi7XTOIfx6ZJ0w29QbNBLmC5rbw0ziahSiT7MNL0rh9y0cFcdTG+YTaTpbcHQd7
	LuxRd0ZlDu7GOmvycgLiQHGmYOQ+W44r5HD9L2TthC1pG2uoYUnZxK7ZC0tlGZYOlna4qsaTvEF4R
	tgkqtIEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqcjS-0000000FFQq-1T8M;
	Fri, 07 Mar 2025 18:47:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqchp-0000000FFLj-1kuT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 18:45:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CA9F0A44EEB;
	Fri,  7 Mar 2025 18:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF25DC4CED1;
	Fri,  7 Mar 2025 18:45:54 +0000 (UTC)
Date: Fri, 7 Mar 2025 18:45:52 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tong Tiangen <tongtiangen@huawei.com>,
	Robin Murphy <robin.murphy@arm.com>,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH v2 2/3] arm64: mm: Handle PAN faults on uaccess CPY*
 instructions
Message-ID: <Z8s-4OPE2DNSogwB@arm.com>
References: <20250228170006.390100-1-kristina.martsenko@arm.com>
 <20250228170006.390100-3-kristina.martsenko@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228170006.390100-3-kristina.martsenko@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_104557_544209_BCEB605E 
X-CRM114-Status: GOOD (  10.57  )
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

On Fri, Feb 28, 2025 at 05:00:05PM +0000, Kristina Martsenko wrote:
> +bool extable_insn_may_access_user(const struct exception_table_entry *ex,
> +				  unsigned long esr)
> +{
> +	switch (ex->type) {
> +	case EX_TYPE_UACCESS_CPY:
> +		return cpy_faulted_on_uaccess(ex, esr);
> +	default:
> +		return true;
> +	}
> +}

Not a problem with this patch but I wonder whether we should return
false for EX_TYPE_LOAD_UNALIGNED_ZEROPAD for completeness (and remove
the EX_TYPE_KACCESS_ERR_ZERO, it's no longer used.

-- 
Catalin

