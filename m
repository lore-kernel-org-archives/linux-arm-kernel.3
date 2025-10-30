Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BB7CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 17:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5I+xpZ/0Oa9gMh1Tke3EBc4lDxm2yq0GOzZy4KHwcTs=; b=GG9s+0UgJeoKXfENDSCXtMVfQe
	hNY62z6dk8HTeuOb0oFJKwinYLL0C9At4VvDJ69eK98DzQW/Kiy7ePP1Z3Tqzep14bOE8AKT/SY5B
	v1MX07c2bUkjkzeELMiQmYP/AuwfeTSEQM3hweVdN//OlBLQTeH8lgKg4vi7+/KU3ZN/HJhLBgrUw
	jvF/GaSogbk0PwVa69I0oP6EixXRBIZlldIdCc0o9Y5Y53Vqk+51hFM763NpquUGlotN/FxVYq/d7
	BBXdfYTcoAvsg0R/hX0hWSldWlohbgB6WWepx70CW8PqJINj2Ze3cIvAil6aLRP4Oi7f49tyXI6IX
	rdLEqVrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEWmk-00000004YYM-2uMN;
	Thu, 30 Oct 2025 17:50:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEWmh-00000004YXP-0CmD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 17:50:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37EDC2C40;
	Thu, 30 Oct 2025 10:49:51 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01E493F673;
	Thu, 30 Oct 2025 10:49:56 -0700 (PDT)
Date: Thu, 30 Oct 2025 17:49:51 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Brazdil <dbrazdil@google.com>,
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki Poulouse <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org, Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH] KVM: arm64: Use pointer from memcpy() call for
 assignment in init_hyp_mode()
Message-ID: <aQOlPy7W6xljdkJW@J2N7QTR9R3>
References: <6e962260-5069-490a-89fb-908a4342ccd9@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e962260-5069-490a-89fb-908a4342ccd9@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_105003_135059_D453DD1A 
X-CRM114-Status: GOOD (  20.31  )
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

On Thu, Oct 30, 2025 at 06:11:03PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 30 Oct 2025 18:01:41 +0100
> 
> A pointer was assigned to a variable. The same pointer was used for
> the destination parameter of a memcpy() call.
> This function is documented in the way that the same value is returned.
> Thus convert two separate statements into a direct variable assignment for
> the return value from a memory copy action.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/arm64/kvm/arm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 870953b4a8a7..feab88c31703 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -2600,8 +2600,8 @@ static int __init init_hyp_mode(void)
>  			goto out_err;
>  		}
>  
> -		page_addr = page_address(page);
> -		memcpy(page_addr, CHOOSE_NVHE_SYM(__per_cpu_start), nvhe_percpu_size());
> +		page_addr = memcpy(page_address(page), CHOOSE_NVHE_SYM(__per_cpu_start),
> +				   nvhe_percpu_size());

This change makes the code harder to read, and harder to modify. It
saves no space.

As Dan said [1]:

| No one will thank you for making these changes...  :(  Please don't do
| it.

[1] https://lore.kernel.org/lkml/aQNsecHJSO2U68Fc@stanley.mountain/

Mark.

