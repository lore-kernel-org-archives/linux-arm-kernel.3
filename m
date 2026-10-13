Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047B7CC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 17:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mn1frxYstGKGIiA91ymjQDmaR2YVeFyP71HwcspyKfk=; b=gWwaSNSYzL+jQbfjSzELAMLFBt
	ikBLtavQq7zlFbc4Lzu5d/VDzcs3nop11t2/NUu+ldZ/UxMYWliNzbixpzpGNo91BUDcLtaNhJytn
	2RFMjkmFX2VTPZ6EMLQk4NSrjrY8HoLal4WSyZPpWK3hYpiLupvetRWdsDtkG23elUX6rDaKQaJlA
	n/3Uf3IYBg8fefOHhWYrHHNfJaaYq3xtC9/xNJTlHY8WuIBpCL63FXx0I5Lt5OqPtL0C1CX1+C6Qf
	PbDOUZXSi3WlJ3duhebKUqxIit2jqT5t3kMWxRFls+Wby7B6/RxalNopL5ctOpaBK/sUDvcSLFarc
	ebEKXvLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfzQ-0000000DdHu-1zUP;
	Tue, 13 Oct 2026 17:08:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfzO-0000000DdHR-1Xay
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 17:08:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A296F169E;
	Tue, 13 Oct 2026 10:08:29 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BB1F3F673;
	Tue, 13 Oct 2026 10:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791911312; bh=/odOX9ez2pvaTTVtpbIWFEknWi4FKEK77cCiqSD0LvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ukYEgKCoi/qiX6vq/VIlYxed2jQElr4YBUOZLD0+R6DQaMdve6ZgKSPH3LQLwrW0h
	 BJ/Xki3HHH6qTl1eA7h6W8WnamUsW0x7UvBV52z7ivuSvdCzVSXWnwPSHnGVfQ2e6e
	 gR+js2RlJZxFiT8oYH7Ok+Rfms80WWgkZwKMKOXU=
Date: Tue, 13 Oct 2026 18:08:28 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	Steven Price <steven.price@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: Re: [PATCH] arm64: rsi: Correct type of realm_config::hash_algo
Message-ID: <as5ljILkGNxH0TTd@arm.com>
References: <20260929-cca-b4-rsi-fix-hash_algo-type-rebase-v1-1-6932cf0aa605@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-cca-b4-rsi-fix-hash_algo-type-rebase-v1-1-6932cf0aa605@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_100834_445711_A6C9CA4C 
X-CRM114-Status: GOOD (  21.62  )
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

On Tue, Sep 29, 2026 at 08:36:00PM +0900, Kohei Enju wrote:
> The RMM specification defines RsiHashAlgorithm as an 8-bit type, but
> realm_config::hash_algo is currently declared as unsigned long.
> 
> There are currently no upstream users of this field, so the mismatch
> does not cause an observable issue today. However, a proposed series
> adding support for Realm measurement registers uses this field and
> exposes a bug caused by the incorrect type.
> 
> Change hash_algo to u8 to match the RMM specification while preserving
> the size and layout of struct realm_config.

Doesn't the RMM spec say that the unused bits must be zero? B5.5.19.
That said, I'm ok with the explicit u8 here.

> Link: https://lore.kernel.org/all/20260413084957.327661-4-sami.mujawar@arm.com/
> Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
> ---
>  include/linux/arm-smccc-rsi.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
> index fddb77986f70..2fb6ec5e0298 100644
> --- a/include/linux/arm-smccc-rsi.h
> +++ b/include/linux/arm-smccc-rsi.h
> @@ -128,7 +128,10 @@ struct realm_config {
>  	union {
>  		struct {
>  			unsigned long ipa_bits; /* Width of IPA in bits */
> -			unsigned long hash_algo; /* Hash algorithm */
> +			union {
> +				u8 hash_algo; /* Hash algorithm */
> +				u8 pad_hash_algo[8];
> +			};

I would skip the padding for now, we have one already. If we later add
the next fields, I have a slight preference for a u8 reserved[7] field
than another union.

>  		};
>  		u8 pad[0x200];
>  	};

-- 
Catalin

