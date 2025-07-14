Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421B8C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 16:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Mp3An8Tm0oRvEmiusJdna3PrB49aRBXX+u9hCsh/yE=; b=AWiyemKXMrucd2fSTdMndxf9Jq
	eBnt9dOfmGC3szIHd0MRMfLMJ+JQayPLY1FyMaILPTHMcwSyZjNdnMm/KUR0gVsduph6oJYV7LWyH
	rTfK0E9YyO9UN/u6Ekz1wLXwN+k87o0KdfUuhGf3U0uUyYVMcPC5TNBEQgGALsZvfeZj0Lgtqn2Gb
	BV/IXQ2BafT8pfbWkBVA7jCncnCniVK0P5ulal9Cah1hTNKQh/EOxEZbDq+ykkIU8s7qI488IHPhW
	9rSEzbgJXTDAg6h8ZdaBDKnrvn3xOsHDyOb/iGDZs+5D2TRGtDAq0E8c0B4JAeBcgEG3Y7BU7FJ06
	6vfO8Jgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubM8y-00000002qXT-0xPC;
	Mon, 14 Jul 2025 16:35:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKqS-00000002bet-3nSl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:11:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F6C95C60F6;
	Mon, 14 Jul 2025 15:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E81BC4CEED;
	Mon, 14 Jul 2025 15:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752505916;
	bh=2Mp3An8Tm0oRvEmiusJdna3PrB49aRBXX+u9hCsh/yE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eyjXK2LiLMSUKBgJhZgIyu2rg1Jg0v5V7r6Jjg7qz5Cvlj1ceo5oKWj7reiP5ZNu+
	 noQCSEp0i8lY0DoGEFMCW6Uy+xa5aICmCJ9uFNp1c3RQ7UCPiHbCA51SlyRQqj6V5m
	 IkcWCaAJTTvB+P/S7vVlq0JtqltbszZ+QHWqHNn+bWZwcyUVJJOVn+t1yfx67Ulxda
	 0r0kjx63a9rFhvP7lQ8OjVu/owlphxajgzXqtmAqEEuOPi0tSEn8MjJ7SXwUw4Aae+
	 hlCxD9EV83cmkYZkdg/JXH80pQgNRjPvmehJrVuHJMV5nlYfkrt/bMN6vjpFa41TFR
	 Eh1aZQozJf6Hg==
Date: Mon, 14 Jul 2025 16:11:50 +0100
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
Message-ID: <aHUeNpx6bsC5Gk3b@willie-the-truck>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
 <20250616-apple-cpmu-v7-2-df2778a44d5c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616-apple-cpmu-v7-2-df2778a44d5c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_081156_980267_F58F0A13 
X-CRM114-Status: UNSURE (   8.75  )
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

On Mon, Jun 16, 2025 at 09:31:51AM +0800, Nick Chan wrote:
> Skip initialization of PMUv3 remap when EL2 is not available.
> Initialization is harmless in EL1 but it is still a weird thing to do.

Why is that weird?

Will

