Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC66C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 15:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2Ddg4qzgJGLxX1PhbhGtdqkQ+mqzuF7qLjPxEpQNVY=; b=cG9GrtGSv0KBRvluai7RaL3uRM
	6cIzwFq99xRjT6gU1hxqkaT7sSoj2BJh9ZAtb5bhifFrcz0wM+PQ+5OjV7I1kGcsqHrvGJhlNtptI
	ClS+6nQC5WxesUsMBVGub58Z8BYIDgifU8su7qJdM81uYom2H/lQbpbt6l2Ndn07fURUuqTW2Mwal
	hueOPyZHvZp57MGmoo77iWN9ADfTgahFJret6+/rzFogS0315pRvmYkYgwWfQFpcftFd9xc4CJISR
	HMCQGlTZcY0sg17/CXaH7RnexPMGagHL7FLpRbk8tIUxPiQGr3DunS8y6JAEazJILB0lhRaEmgoFA
	lrKCJqjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQvq-0000000AY1b-2dJP;
	Thu, 17 Jul 2025 15:54:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQLe-0000000AUTa-34Up
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 15:16:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 19C5F462C6;
	Thu, 17 Jul 2025 15:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF53C4CEE3;
	Thu, 17 Jul 2025 15:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752765397;
	bh=6a7Fa9ac/MNL7U3l/5o7kETAQQpJBjKaoVUI/yFXSJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EWPV/Vo4X3GFFJlDb2e0Bn+OqCAvCXROXBZotPrKoJ09FOkNOjQclgVohXCsaOpWb
	 QzJrey8/fBo928yTMa9jnKFk4WFPa9GFEibFb6QdqKiEtFmDkdi2GrtZQexUzLfAJv
	 +JPxhLuuPGLE83AQggp0eSt+tb0fcV4gahOgqi1NmtctMb1hxlzXazxlHmcBrGlvF5
	 N7a+An/SmwuN9KBVGd37UTtAW4GdAOtSyPKr2pv7FzFM2Tl2AjsyMPWjhUc3xySmRs
	 OWpvgL6j0dspW6wXJG+jo+984m1SfuDWFlL+nUcTm/kkiPLQrv7nCqCY9ze6AoSvCB
	 /kBMrLVZLoj8g==
Date: Thu, 17 Jul 2025 16:16:32 +0100
From: Will Deacon <will@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>,
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v7 02/21] drivers/perf: apple_m1: Only init PMUv3
 remap when EL2 is available
Message-ID: <aHkT0BIyuUVvI4Ht@willie-the-truck>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
 <20250616-apple-cpmu-v7-2-df2778a44d5c@gmail.com>
 <aHUeNpx6bsC5Gk3b@willie-the-truck>
 <81addd64-6ba6-465e-901e-05f9cb29185b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81addd64-6ba6-465e-901e-05f9cb29185b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_081638_789157_85E848A6 
X-CRM114-Status: GOOD (  12.92  )
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

On Mon, Jul 14, 2025 at 11:37:46PM +0800, Nick Chan wrote:
> 
> Will Deacon 於 2025/7/14 夜晚11:11 寫道:
> > On Mon, Jun 16, 2025 at 09:31:51AM +0800, Nick Chan wrote:
> >> Skip initialization of PMUv3 remap when EL2 is not available.
> >> Initialization is harmless in EL1 but it is still a weird thing to do.
> > Why is that weird?
> 
> Maybe I could use better wording but if the check is not here, then for Apple A7 which has very
> different event mappings, it either has to use the mappings for M1 which is wrong on the hardware,
> or declare an a7_pmu_pmceid_map, which would just be dead code since A7's CPU does not
> support EL2. Not initializing the mapping in EL1 avoid these problems.

That's definitely more motivating than what you have :)

Will

