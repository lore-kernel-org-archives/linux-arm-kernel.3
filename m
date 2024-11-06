Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AADED44D54
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 12:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgl+LxOG386Hwlx+t5bF7ISw5JWT5hDDNFhxv4j5zxI=; b=nx+2D80JZKdRCz4xk/Mz4z6Uc6
	+bomTTfpPHBMeTem7J/LqrqPVdt443/FlL7kW6ERMDzUp6RQMM306D5qz7P6QkgFDzOa9g3yVsDNi
	tHJroVin384502/kihEEe67QtAOrZZvnI7uvwZfyDiH9ngs2JxrGfvqiNl2XKMWllsRooc2fDI8cY
	YSCxldK/WUYoHA1kofIPDGob/bbCx2UOmNeeboXBRMbn+UjlX+gQJ0bSVo7IpYhFosXGg0AljKOu8
	6FXEwGrjI457I/goRbw6gRZw2rPwx9Scrh+vv2yS7e1ImRSnerRnwwzDfh0LY/IDP7TBIGfHlD9OP
	HCgfNn8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8f3r-00000003AR5-0Xom;
	Wed, 06 Nov 2024 12:22:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eCG-00000002v5X-45sT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 11:27:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 586871063;
	Wed,  6 Nov 2024 03:28:06 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 585EA3F6A8;
	Wed,  6 Nov 2024 03:27:35 -0800 (PST)
Date: Wed, 6 Nov 2024 11:27:24 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] kselftest/arm64: Corrupt P15 in the irritator when
 testing SSVE
Message-ID: <ZytSnBSk4r81a3z1@J2N7QTR9R3>
References: <20241023-arm64-fp-stress-irritator-v1-0-a51af298d449@kernel.org>
 <20241023-arm64-fp-stress-irritator-v1-3-a51af298d449@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-arm64-fp-stress-irritator-v1-3-a51af298d449@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_032737_086584_CB1E2008 
X-CRM114-Status: GOOD (  16.60  )
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

On Wed, Oct 23, 2024 at 09:38:31PM +0100, Mark Brown wrote:
> When building for streaming SVE the irritator for SVE skips updates of both
> P15 and FFR. While FFR is skipped since it might not be present there is no
> reason to skip corrupting P15 so move the ifdef appropriately.

I think you mean P0 rather than P15 here? 

	rdffr   p0.b

... reads from the FFR and writes to P0, modifying P0.

	wrffr   p15.b

... reads from P15 and writes to the FRR, leaving P15 unchanged.

> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/fp/sve-test.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
> index f1fb9745c681786f686f1fafcb7e1154f3c8e1a3..3c88dfe9c8cad29f44217314aeaffa984bac05e5 100644
> --- a/tools/testing/selftests/arm64/fp/sve-test.S
> +++ b/tools/testing/selftests/arm64/fp/sve-test.S
> @@ -302,9 +302,9 @@ function irritator_handler
>  	movi	v0.8b, #1
>  	movi	v9.16b, #2
>  	movi	v31.8b, #3
> -#ifndef SSVE
>  	// And P0
>  	rdffr	p0.b
> +#ifndef SSVE
>  	// And FFR
>  	wrffr	p15.b
>  #endif

Both RDFFR and WRFFR are illegal in streaming mode unless FEAT_FA64 is
implemented and enabled, so we cannot use DRFFR in the SSVE case.

Is there a different instruction we can use?

Mark.

