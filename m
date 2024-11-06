Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F68D44D54
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 12:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YM8ay6Q+5HHas2EWYwuiZl/y9h2WOl9VMMjAaxtLpQ0=; b=28viElEn2mcrYX7MgYmdg7zEP7
	zGseoAUIv9zCTdbc35QOITqpC/B9k+wWeqns3tlnabSNFTyt2x1k+k4inJZfxW1rYyqMesolpKaPC
	5kX2Tn3m4tBUsxO7/EzFQQA0y1A4TJxC7/+HHY55aVjrdBggXDK/55y9PKYycU28bTA4bjkhKOuIX
	TJDMphFcoARkHtPCi61WQADh/Ol7D08pj5bB2XtiPQMZ6N0MCy3SE6TZ/OnoEWf4YEKjY0Ml8LLwH
	QFnva/n2UC54wplgkA4x21PtGdXgy/KfloQYJmDxH1vJSn+LlsEQOvzdhUvamhKd86m+I0Oo38aXf
	7JICUYcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8emp-000000036Gs-2xxB;
	Wed, 06 Nov 2024 12:05:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eHA-00000002vuU-3Z4A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 11:32:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3642B1063;
	Wed,  6 Nov 2024 03:33:10 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 391543F6A8;
	Wed,  6 Nov 2024 03:32:39 -0800 (PST)
Date: Wed, 6 Nov 2024 11:32:36 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] kselftest/arm64: Provide a SIGUSR1 handler in the
 kernel mode FP stress test
Message-ID: <ZytT1A5KZnjvyJUt@J2N7QTR9R3>
References: <20241023-arm64-fp-stress-irritator-v1-0-a51af298d449@kernel.org>
 <20241023-arm64-fp-stress-irritator-v1-5-a51af298d449@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-arm64-fp-stress-irritator-v1-5-a51af298d449@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_033240_956510_1E0D8D3E 
X-CRM114-Status: GOOD (  15.86  )
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

On Wed, Oct 23, 2024 at 09:38:33PM +0100, Mark Brown wrote:
> The other stress test programs provide a SIGUSR1 handler which modifies the
> live register state in order to validate that signal context is being
> restored during signal return. While we can't usefully do this when testing
> kernel mode FP usage provide a handler for SIGUSR1 which just counts the
> number of signals like we do for SIGUSR2, allowing fp-stress to treat all
> the test programs uniformly.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  tools/testing/selftests/arm64/fp/kernel-test.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/arm64/fp/kernel-test.c b/tools/testing/selftests/arm64/fp/kernel-test.c
> index e8da3b4cbd23202c6504ffd8043f8ef351d739f6..859345379044fc287458644309d66cf5f3d8bdf5 100644
> --- a/tools/testing/selftests/arm64/fp/kernel-test.c
> +++ b/tools/testing/selftests/arm64/fp/kernel-test.c
> @@ -267,6 +267,10 @@ int main(void)
>  		       strerror(errno), errno);
>  
>  	sa.sa_sigaction = handle_kick_signal;
> +	ret = sigaction(SIGUSR1, &sa, NULL);
> +	if (ret < 0)
> +		printf("Failed to install SIGUSR1 handler: %s (%d)\n",
> +		       strerror(errno), errno);
>  	ret = sigaction(SIGUSR2, &sa, NULL);
>  	if (ret < 0)
>  		printf("Failed to install SIGUSR2 handler: %s (%d)\n",
> 
> -- 
> 2.39.2
> 

