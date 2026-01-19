Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EC3D29C4F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 17:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGgjfCn0loK6ZMHUjA4NYLANnUEetVOw+8W1/ulY+3s=; b=S35bdVm+ahc6HRv3gvnee4p1po
	hyOIz7Ie7w5RqsbAX5O4dMR3bYcjWgXkSrGGjy/1hter6AgU/qutCp/srmNAMDq1XpovXq1Ki0/8N
	gckCUP7MP6usqkxJKY9mqH1thtAEBoVVVQ/LxupPawLKpma+Pk/DSD4IkqPmIcxNrtKQ2vRyYVnCi
	cvl4zKHU3jfnFdcTO+vn+YHD5Btu16+y9Cz4qCNMz0cef18C9qlnARlRE2yNzxNUydupmHm1ZiG1s
	WGqlRH6146Ex7O+FudvQuLTDqiB/RkuCiD7M71WQ5C36PdLZBIUFK5JsqBxWUF3czAg27mcZZJcdF
	fpvrjL1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtVp-00000002fqA-2dzs;
	Mon, 19 Jan 2026 17:58:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtVm-00000002fpA-0YrO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 17:57:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A5E6497;
	Mon, 19 Jan 2026 09:57:48 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A3333F694;
	Mon, 19 Jan 2026 09:57:54 -0800 (PST)
Date: Mon, 19 Jan 2026 17:57:51 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Carl Worth <carl@os.amperecomputing.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Taehyun Noh <taehyun@utexas.edu>
Subject: Re: [PATCH v2 2/2] arm64: mte: Set TCMA1 whenever MTE is present in
 the kernel
Message-ID: <aW5wnxDDVn2KoriB@arm.com>
References: <20251030-mte-tighten-tco-v2-0-e259dda9d5b3@os.amperecomputing.com>
 <20251030-mte-tighten-tco-v2-2-e259dda9d5b3@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030-mte-tighten-tco-v2-2-e259dda9d5b3@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_095758_205754_8C3E4B65 
X-CRM114-Status: GOOD (  15.11  )
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

On Thu, Jan 15, 2026 at 03:07:18PM -0800, Carl Worth wrote:
> Set the TCMA1 bit so that access to TTBR1 addresses with 0xf in their
> tag bits will be treated as tag unchecked.
> 
> This is important to avoid unwanted tag checking on some
> systems. Specifically, SCTLR_EL1.TCF can be set to indicate that no
> tag check faults are desired. But the architecture doesn't guarantee
> that in this case the system won't still perform tag checks.
> 
> Use TCMA1 to ensure that undesired tag checks are not performed. This
> bit was already set in the KASAN case. Adding it to the non-KASAN case
> prevents tag checking since all TTBR1 address will have a value of 0xf
> in their tag bits.
> 
> This patch has been measured on an Ampere system to improve the following:
> 
> * Eliminate over 98% of kernel-side tag checks during "perf bench
>   futex hash", as measured with "perf stat".
> 
> * Eliminate all MTE overhead (was previously a 25% performance
>   penalty) from the Phoronix pts/memcached benchmark (1:10 Set:Get
>   ration with 96 cores).
> 
> Reported-by: Taehyun Noh <taehyun@utexas.edu>
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Carl Worth <carl@os.amperecomputing.com>

Thanks for testing an sending this.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

