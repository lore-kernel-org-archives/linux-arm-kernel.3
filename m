Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B8EC36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 06:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=liWnxMlF++i2oJGjba63IYvdxxtE2E3WnHD6Hl725hY=; b=4bRrr44y7KAH4fyzbAZpC4MvJ+
	i52Fk1TS8G4C+bRpX9TjWCxe83zYeVVs/E11X51AGA8zqxQ8EPb122IC45HdNlh1PgMOvgooo6ryl
	HN2XJfLUJCw1/btfZZSojCJ1mBgWBBJCy8GwRJdH6aVxlbyvvKRxKSDkXVC+33+GMmUlIstGWtubk
	ApHY1Xbi7i4SgaCPvAL+wxd5LZGKsx8pfNYDh+sJ8bH3SGzJTth4yAOT8X5G1bqkJNgojsyvZbybx
	NNTsuvIfn4Q9QJvvMGK18dsfOYUcuI6M4TaYlHi5UYhbiEtx1eJC/J9IkMQAfrBAK0GBn0KCGS2YH
	ywEO/Rwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzUmA-000000022iG-0BCD;
	Tue, 01 Apr 2025 06:07:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzUkJ-000000022X7-2JtT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 06:05:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECA1E150C;
	Mon, 31 Mar 2025 23:05:11 -0700 (PDT)
Received: from [10.162.16.153] (unknown [10.162.16.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A14F3F63F;
	Mon, 31 Mar 2025 23:05:06 -0700 (PDT)
Message-ID: <17de4426-8263-4ccb-8420-f6913d478ae9@arm.com>
Date: Tue, 1 Apr 2025 11:35:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Don't call NULL in do_compat_alignment_fixup
To: Angelos Oikonomopoulos <angelos@igalia.com>,
 linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20250331085415.122409-1-angelos@igalia.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250331085415.122409-1-angelos@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_230511_642923_08BFE93C 
X-CRM114-Status: GOOD (  12.95  )
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

On 3/31/25 14:24, Angelos Oikonomopoulos wrote:
> do_alignment_t32_to_handler only fixes up alignment faults for specific
> instructions; it returns NULL otherwise. When that's the case, signal to
> the caller that it needs to proceed with the regular alignment fault
> handling (i.e. SIGBUS).
> 
> Signed-off-by: Angelos Oikonomopoulos <angelos@igalia.com>
> ---
>  arch/arm64/kernel/compat_alignment.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kernel/compat_alignment.c b/arch/arm64/kernel/compat_alignment.c
> index deff21bfa680..b68e1d328d4c 100644
> --- a/arch/arm64/kernel/compat_alignment.c
> +++ b/arch/arm64/kernel/compat_alignment.c
> @@ -368,6 +368,8 @@ int do_compat_alignment_fixup(unsigned long addr, struct pt_regs *regs)
>  		return 1;
>  	}
>  
> +	if (!handler)
> +		return 1;

do_alignment_t32_to_handler() could return NULL, returning 1 seems to be
the right thing to do here and consistent. Otherwise does this cause a
kernel crash during subsequent call into handler() ?

>  	type = handler(addr, instr, regs);
>  
>  	if (type == TYPE_ERROR || type == TYPE_FAULT)

