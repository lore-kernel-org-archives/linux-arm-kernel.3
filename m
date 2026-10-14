Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60796CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svGI3TrnmET9rvhflS0xMwh0Vq20wPghPWfiT9fZREM=; b=dXA7QPf1ItQXnFOKbSHZj7fKgE
	Eg9Rr7uILHelGxfswRP/1V5eziOpiRsRlznfC8+CuTC0tgb04r3XL2OBxhk0N6t9F1XaCy0wTFBxM
	g5ROFhZWTcsmFrmQAFnkMxCLnOzpayIgwCoqejI5CNzZyF8+WIxHe3nfk32y4mLT4xPzreHPCOO8T
	e7521E8QA4HQ4ji/Bonxz1KpAtUWidwB+bMb4dzAzDnB6jP8fT8WWqLNiBwvVjfHeQp1DSi1/xOgz
	XdVIsa+dep1FNo8zJSfD9KiyKUGIy7XukFO4O9WmVheEFO36O/BDDq2gNA8zCx/E7GtRp2qCj0kYa
	1GgPpeFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvg2-0000000F8Hm-1N4Q;
	Wed, 14 Oct 2026 09:53:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvg0-0000000F8HV-3WuJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 09:53:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=svGI3TrnmET9rvhflS0xMwh0Vq20wPghPWfiT9fZREM=; b=dIPWrjKRhV9Jw/D1aIH8Crp33E
	jyaCDLOOVbc3BDXHCxq+K+QnWdackln2woMC/yAorADY54inUaNzImcwrMOXWMegsByexl9o+tp6o
	+jO8rJYCpD+0qunr6jccKYnqiOrLLRGHoNv2SlaGMsmf1Q01GsKKGdUaT8V/eF3D5RPhoZpadqFK4
	piOBGoZ8eq+kYJsufczckDX7rjp6tGpF17ZAJ54BaZDNg2ez/lLpiMplGfXS3jCAW+idulzyIaTSz
	Kq93hW90EFme4rbdwmREDRKLcLGeBnD7k6CTGNk9ZcA3Fn95680j1OhY2hXR4gAwLAca9B7vfg4kg
	kMKD4x4g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGvfw-0000000GbNg-0UMu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:53:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A4A4152B;
	Wed, 14 Oct 2026 02:53:27 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 406193F7B4;
	Wed, 14 Oct 2026 02:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791971610; bh=RNPKAsUjOfj9waWmGaXsR1tvNn15HrXYOhu2qrwpM9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AjmPpVZjy9QZXDyk5TEbdFHENvBh/mwN6N5qV55U36gu8IXTCvKBIDPRbn7X36mX5
	 zLyAdLPGiFmD2PLQ9JBfj1n9ZJsm0MGlj4YUSkCVEWwNpG7Wwcdkr6OHIfPUQkX6rD
	 jlJEEqYnw64dYjfeQhdpyI2fmpjy6BLeGQHa7jbg=
Date: Wed, 14 Oct 2026 10:53:25 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	Steven Price <steven.price@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: Re: [PATCH v2] arm64: rsi: Correct type of realm_config::hash_algo
Message-ID: <as9RFRuhlGL1mZbz@arm.com>
References: <20261014-cca-b4-rsi-fix-hash_algo-type-rebase-v2-1-6cb0ae13c8c1@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-cca-b4-rsi-fix-hash_algo-type-rebase-v2-1-6cb0ae13c8c1@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_105332_626684_06F24EEF 
X-CRM114-Status: GOOD (  25.29  )
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

Thanks for respinning.

On Wed, Oct 14, 2026 at 11:43:23AM +0900, Kohei Enju wrote:
> The RMM specification defines RsiHashAlgorithm as an 8-bit type, but
> realm_config::hash_algo is currently declared as unsigned long.
> 
> There are currently no upstream users of this field, so the mismatch
> does not cause an observable issue today. However, a proposed series
> adding support for Realm measurement registers uses this field and
> exposes a bug caused by the incorrect type.

It should be clear the bug is in the RMM implementation. The patch here
is more like defensive programming when the RMM doesn't honour the
interface and zero the unused bits. I can fix the text when applying.

> Change hash_algo to u8 to match the RMM specification while preserving
> the size and layout of struct realm_config.
> 
> Link: https://lore.kernel.org/all/20260413084957.327661-4-sami.mujawar@arm.com/
> Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
> ---
> Changes in v2:
> - Drop the inner union and padding around hash_algo (Catalin)
> - Link to v1: https://patch.msgid.link/20260929-cca-b4-rsi-fix-hash_algo-type-rebase-v1-1-6932cf0aa605@fujitsu.com

In theory we could add a fixes tag for reference but not worth cc
stable.

Fixes: b880a80011f5 ("arm64: rsi: Add RSI definitions")

> ---
>  include/linux/arm-smccc-rsi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
> index fddb77986f70..cca881ddfdba 100644
> --- a/include/linux/arm-smccc-rsi.h
> +++ b/include/linux/arm-smccc-rsi.h
> @@ -128,7 +128,7 @@ struct realm_config {
>  	union {
>  		struct {
>  			unsigned long ipa_bits; /* Width of IPA in bits */
> -			unsigned long hash_algo; /* Hash algorithm */
> +			u8 hash_algo; /* Hash algorithm */
>  		};
>  		u8 pad[0x200];
>  	};

Suzuki, are you ok with this patch?

As a separate patch, we need to add some static_assert() for the offsets
and the size of the realm_config structure. We do this in
arm-smccc-rmi.h already.

There's a similar realm_params structure in arm-smccc-rmi.h but,
IIUC, the hash_algo there is written by the kernel, so unsigned long is
fine.

-- 
Catalin

