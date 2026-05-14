Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E9ECD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 17:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpDQsM4nGHKz/adlK4DeKUB88Ig8kZeFL8KkfcFUJ7c=; b=1uwaFAWJ4hmOZJoOn8ozyqFmLi
	OzB2eHUOE4eiiMGlJUk6FPDlr4orpNPXLy/c6oivGC5kCGSjumT9Pt9w79KcF0m/5QYkdYioA1frD
	NUbZIk9aF897saxrHxJbfqXiTuUW8yKLdxEO8bjQyZvHRH4Iem/0DPoX9YoNLkYPe7ppbsiMKRt6D
	Bhd8JhSiDCT0QQ4RZgKubvD7qyEpHWc54Z1VmvfbDoe2mo2QxJ7H1E+bsRPSQXa07my4G/7rbQpAp
	eeJJXGL2Oa75VhibH0EslS9EyNRLd7cY8oy1rWlYV9etlstpDkSM31lgOWHxpK9r2vCNjbBUq13mJ
	Xyqx69Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZm9-00000006C2K-2VPl;
	Thu, 14 May 2026 17:23:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZm6-00000006C1s-38rb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 17:23:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 995B844536;
	Thu, 14 May 2026 17:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D40C2BCB3;
	Thu, 14 May 2026 17:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778779385;
	bh=75o1J/gLh/jzUQl+m1veukeAxZoSfbygPJG88JMzKaE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Uz+Ul3/UNvRfRBYSR7u4pC0743oobLLxlhfuEeDez4Eqc4KDll8GPbyYrjEQlzPYi
	 VxIz4Q3l7ypCnpdqaVo9FdJuJkZ0tz7t/cEzJYWwOrKVou7fl2MmuaMGYB5XaR4SjE
	 0f+dh9w6xf/3dIsLjfqeLW/d8dDe6DeHU6H62p3lF04jf3kEKmb3aafHjMa/UVkq+d
	 n6VZglUUQ+hTvdN8GXGboijXOp0RAkTLMwt43R2NZ05JmqW+t0SmkITac8COCGprOc
	 R5lyHFfgM/qADJtZH+WtvlKTgDRndN8y3EVKQLPRNVXbc7LB/DIhz1r5naj0vEms70
	 dLTWqeWOM3fCA==
Message-ID: <055c980a-0282-422d-b224-4d65482c2155@kernel.org>
Date: Thu, 14 May 2026 12:23:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers: altera_edac: Guard SDRAM irq2 retrieval for
 Arria10 only
Content-Language: en-US
To: muhammad.nazim.amirul.nazle.asmade@altera.com, bp@alien8.de,
 tony.luck@intel.com
Cc: linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260514034007.11541-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260514034007.11541-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_102306_815969_27C23798 
X-CRM114-Status: UNSURE (   7.78  )
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



On 5/13/26 22:40, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Guard the irq2 retrieval with an of_machine_is_compatible() check so
> that platform_get_irq(pdev, 1) is only called on Arria10 platforms.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> ---
> v2: Move irq2 = platform_get_irq(pdev, 1) inside the existing
>      of_machine_is_compatible("altr,socfpga-arria10") block instead of
>      adding a separate duplicate guard around it.
> ---


Please get into the habit of looking at previous commmits and their 
formatting.

This commit header should be:

EDAC/altera: Guard SDRAM irq2 retrieval for Arria10 only

Dinh


