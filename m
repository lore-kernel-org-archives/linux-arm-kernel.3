Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D11DF4198F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 10:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnotzcVojTU1ZqAjDKuL7mHziNAve6qpLqMH72UEliI=; b=WBA/nAqi/SaR+2fLVA+woaCrVc
	OUEJ6j7qzem6wzT+epXnlCQW3Hwg/N8Zmd6glloN4TccwSuJXUoisxO1XmmPsXGuFqXUV+8BRARvx
	poztI+qP41T5n4JDuVZyd/mL5NGF8iFzpjY+81LeHeOO7KF1FAQNufuCAKSx5GQvPq7QzSJ7vKMxx
	ZNUmK6Yc3Q9xuBldkcWDuADvxwUZPlEJ3WsqntdQbuHrA0AvyF4/MbK743vYazvgwW5DdQvEPY9sh
	WAdtv9k/CQrsqDSprVkLQGfSJR5+to02fO7RBgJRDeqyW+/MLYu9zQcw5s/FBXhj1rfD/XyOiiT6Z
	j8LSIVrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxn1-00000000zap-2PaT;
	Wed, 15 Apr 2026 10:48:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxmy-00000000zaT-3xkt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 10:48:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E2A94FD5;
	Wed, 15 Apr 2026 03:48:01 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 434E83F86F;
	Wed, 15 Apr 2026 03:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776250087; bh=Dvh9mQkEnQ4aXcsc1cq9pNgA6gBkZ+FQIxt8qYsS80c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZUht1HGfT0Oh15Z86IdMgOiWq6TPFdFbWVSqTIreWLoCgvKYUnP9KYqSm4dWdhnhP
	 b4b5ztSzCHeoLeCTOPU6U094QC8VKRd8x52lqhO+VvGZhvoGrcqL8CLLoLiKsqvFOB
	 qUb1Bhp24iVVSxc1+TO3aOKQ+ERRtHfl3dFHMeGQ=
Date: Wed, 15 Apr 2026 11:48:03 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Wentao Guan <guanwentao@uniontech.com>
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
	hello@peppergray.xyz, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] arm64/scs: Fix potential sign extension issue of
 advance_loc4
Message-ID: <ad9s4xdtsQ1As2Q_@arm.com>
References: <20260413095459.2470584-1-guanwentao@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413095459.2470584-1-guanwentao@uniontech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_034809_109645_7727F853 
X-CRM114-Status: GOOD (  18.19  )
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

On Mon, Apr 13, 2026 at 05:54:59PM +0800, Wentao Guan wrote:
> The expression (*opcode++ << 24) and exp * code_alignment_factor
> may overflow signed int and becomes negative.
> 
> Fix this by casting each byte to u64 before shifting. Also fix
> the misaligned break statement while we are here.
> 
> Example of the result can be seen here:
> Link: https://godbolt.org/z/zhY8d3595
> 
> It maybe not a real problem, but could be a issue in future.
> 
> Fixes: d499e9627d70 ("arm64/scs: Fix handling of advance_loc4")
> Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
> ---
>  arch/arm64/kernel/pi/patch-scs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/pi/patch-scs.c b/arch/arm64/kernel/pi/patch-scs.c
> index dac568e4a54f2..3944ad899021c 100644
> --- a/arch/arm64/kernel/pi/patch-scs.c
> +++ b/arch/arm64/kernel/pi/patch-scs.c
> @@ -196,9 +196,9 @@ static int scs_handle_fde_frame(const struct eh_frame *frame,
>  			loc += *opcode++ * code_alignment_factor;
>  			loc += (*opcode++ << 8) * code_alignment_factor;
>  			loc += (*opcode++ << 16) * code_alignment_factor;
> -			loc += (*opcode++ << 24) * code_alignment_factor;
> +			loc += ((u64)*opcode++ << 24) * code_alignment_factor;
>  			size -= 4;
> -		break;
> +			break;

The fix makes sense. I'll queue it at -rc1.

Thanks.

-- 
Catalin

