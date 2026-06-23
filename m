Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC93BCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 12:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvovPyg8ZSCUX7iJQAPw2UOA7YGXY8BWMaRT34BQcm0=; b=asmR2KS6gcTTnocG8MSXtMMTI9
	J9ijUh7WOtCQjepw04hMhcpKz+jLOz7u7PQQ8p3G37eFvZ5Kl57yE2l8tijiKC9aNOSCBxynpuXDR
	/a2QqUUk4Qepl3zFd0NnZy7+w+7RQV7/ZSZd3+/n4IRQJeruRZmquB5olzpVGTlEvyRCLMiWaEIdx
	HfsJ3rP5MqqeMPYMuqhvVegxxLuQclIiLovTLxRa/Hm53HnqWui2xc+5Ql4WHFWlkA22KV2wACwuY
	/yRRjyrMXfZRsNZjaLJC7M+bOQwdVqxGuFenLza1NoRHkBkDnGaL1rAyDNB2b5lXh4nGjFYX5xf3M
	5hXSa6RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzuG-00000006Eij-2GX0;
	Tue, 23 Jun 2026 12:07:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzuE-00000006EiY-2xV1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 12:07:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 204AE40325;
	Tue, 23 Jun 2026 12:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4AD71F000E9;
	Tue, 23 Jun 2026 12:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782216426;
	bh=cvovPyg8ZSCUX7iJQAPw2UOA7YGXY8BWMaRT34BQcm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EbwZAtiKaYfnO//6uMTCthoBr3Z8E394Xk5iInLQV8c8CTaSMkIWmLXRxvbj/x9Cl
	 O8dnNGqTH7jYdSLjSFM1aBJUyGkgI26x4+Y9oxXdO5tb+/OKx8/Ecnf1/3+t5V09G1
	 LD8Hp7/xpZjOBgyJR1pvlwe8e3R+FI/mSzTMbohoHG9zzlMwq73lDCP7fukcM4g6It
	 u85+JcRCpULU2l+BCjpy+nDFJocln3s/y2DRd+s3UaxeuFRtLkm0PRXE58l9gV3mCx
	 IdmV8ceoit79kq5j0JdiIhGQ+Qg6dd7hFYX68EtfGRm9mfM5iOQ5j9vDUgZ9Zg8lTm
	 NAI7a1k/Pv6bg==
Date: Tue, 23 Jun 2026 13:07:00 +0100
From: Will Deacon <will@kernel.org>
To: Yu Peng <pengyu@kylinos.cn>
Cc: lpieralisi@kernel.org, akpm@linux-foundation.org,
	catalin.marinas@arm.com, guohanjun@huawei.com, lenb@kernel.org,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, rafael@kernel.org,
	sudeep.holla@kernel.org
Subject: Re: [RFC] arm64: early_ioremap fails to map ACPI MADT on 64K pages
Message-ID: <ajp25MIQJWWE1ziY@willie-the-truck>
References: <ajkFE6TmwW6B/huP@lpieralisi>
 <20260623024712.3480399-1-pengyu@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623024712.3480399-1-pengyu@kylinos.cn>
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

On Tue, Jun 23, 2026 at 10:47:12AM +0800, Yu Peng wrote:
> Hi Lorenzo, Hanjun, Will,
> 
> Thanks for confirming.
> 
> I will send a proper patch for this. The change I plan to post is along
> these lines:
> 
> diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
> index ... .. ...
> --- a/arch/arm64/include/asm/fixmap.h
> +++ b/arch/arm64/include/asm/fixmap.h
> @@ -79,7 +79,11 @@ enum fixed_addresses {
>  	 * Temporary boot-time mappings, used by early_ioremap(),
>  	 * before ioremap() is functional.
>  	 */
> +#ifdef CONFIG_ARM64_64K_PAGES
> +#define NR_FIX_BTMAPS		(SZ_512K / PAGE_SIZE)
> +#else
>  #define NR_FIX_BTMAPS		(SZ_256K / PAGE_SIZE)
> +#endif
>  #define FIX_BTMAPS_SLOTS	7
>  #define TOTAL_FIX_BTMAPS	(NR_FIX_BTMAPS * FIX_BTMAPS_SLOTS)

I still don't understand why this issue is specific to 64k pages, though.

In the example you gave, the thing wasn't even 4k aligned.

Will

