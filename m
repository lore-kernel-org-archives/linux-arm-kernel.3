Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F4DC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 04:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqtOZwmbgDbNPoW0UC99MHpLTIFaTtsB0GCFzRK7M8k=; b=X7clDxIi4kQpXl0JeyYpaQyf4q
	Rqo7Oy/z69offwJ9a1rgPwPn4FiT4d4uTEZo8QWpJXmfxQysQqtYMV+vzgzPHXX3dL8chz/xclDqW
	lo28xG9fKudiv83B/1KZ7jsZtal2+aKyPZ+i9ckficPwXtYdUPXCxkAEL+QK5UrmIhW4PTHVmCS0M
	CkGPdqJYEqZeciOMMyye8BqmuiHmc61CVSi5HLsDcLwXb9kD2FnvdK0kHuKd58qfqPCDLNUQ7Oxas
	1VTUWnWUIbn1cChtASfU8er1gvfNB3EVdyCgzl8uoVkLzVS1mVlTmgYtGj8yCkxsVVZ+2QOAJKGIe
	ZN0T5u9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfASf-0000000HDrF-2rJj;
	Tue, 04 Feb 2025 04:22:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfARI-0000000HDjq-2Cv3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 04:21:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A687511FB;
	Mon,  3 Feb 2025 20:21:53 -0800 (PST)
Received: from [10.163.33.56] (unknown [10.163.33.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09A203F63F;
	Mon,  3 Feb 2025 20:21:25 -0800 (PST)
Message-ID: <0eb00e14-937d-4e84-9ca3-4239ce614ea3@arm.com>
Date: Tue, 4 Feb 2025 09:51:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64/sysreg: Fix unbalanced closing block
To: James Clark <james.clark@linaro.org>,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, broonie@kernel.org,
 maz@kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
References: <20250115162600.2153226-1-james.clark@linaro.org>
 <20250115162600.2153226-2-james.clark@linaro.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250115162600.2153226-2-james.clark@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_202132_619358_41D84EC1 
X-CRM114-Status: GOOD (  13.75  )
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



On 1/15/25 21:55, James Clark wrote:
> This is a sysreg block so close it with one. This doesn't make a
> difference to the output because the script only matches on the
> beginning of the word to close blocks which is correct by coincidence
> here.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/tools/sysreg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 762ee084b37c..bbe7df69da9c 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2074,7 +2074,7 @@ EndEnum
>  Res0	4:2
>  Field	1	ExTRE
>  Field	0	E0TRE
> -EndSysregFields
> +EndSysreg
>  
>  Sysreg	SMPRI_EL1	3	0	1	2	4
>  Res0	63:4

