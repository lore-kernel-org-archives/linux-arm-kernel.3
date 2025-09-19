Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220D4CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 21:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1AYJz8YUP/Vhoxa5GdJssOAmcvIGIVOWPwZrgxTxwQ=; b=AcCnN1Y9nIJOitnc+la1r3959t
	3GVLnCXwLfO5IZ21iKWA4rDllNgyLi5Ys4MlU5KxBSRQ0BNnyRyP8TbY5wXmB8WYw9gDN6yPDrBSe
	7TjgXXvICMzPHJ04pEDqu1a7POC1q0tAKwxTKOGJ66c6muICYxlM5ZCd1+C+uuzt1+I+LG/Ga/s2y
	iQwzZsR5blgmkDxKOykkSedeDGZXxvZrzW58cgC8tUsMMGfiysYy1s/yrZ7qcgMM7YDduyG1O4Eqb
	PP8sw9ySg/pO37v4MjM/JK/wgOj3gVuI5e4AED1iMF6M3Djq/X1/6P7E+V2mUREAAA2F7gSFqwp+x
	Mesba1Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uziMv-000000043KI-0kp2;
	Fri, 19 Sep 2025 21:10:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uziMs-000000043Il-1CXD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 21:10:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 22E8E44F92;
	Fri, 19 Sep 2025 21:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73254C4CEF0;
	Fri, 19 Sep 2025 21:10:06 +0000 (UTC)
Date: Fri, 19 Sep 2025 22:10:04 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Hanjun Guo <guohanjun@huawei.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] arm64: Kconfig: Make CPU_BIG_ENDIAN depend on BROKEN
Message-ID: <aM3GrAkwAgim0UIO@arm.com>
References: <20250919184025.15416-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919184025.15416-1-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_141010_351452_1939DE95 
X-CRM114-Status: GOOD (  14.56  )
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

On Fri, Sep 19, 2025 at 07:40:25PM +0100, Will Deacon wrote:
> Big-endian arm64 configurations are vanishingly rare, yet we still claim
> to support them in Linux despite very limited testing or visible
> interest. Supporting big-endian adds unnecessary burden to reviewers and
> contributors which, without any known active users, is hard to justify.
> For example, recent work to improve our futex routines and to implement
> nested virtualisation support is non-trivially complicated by having to
> support both big- and little-endianness.
> 
> Back in 2019 [1], it was claimed that Huawei were using arm64 big-endian
> machines in their telecommunication products but I don't know whether
> that's still the case and certainly haven't seen any patch contributions
> to help support or maintain it.
> 
> Make CPU_BIG_ENDIAN depend on BROKEN as an initial deprecation step
> towards its removal.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Hanjun Guo <guohanjun@huawei.com>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Link: https://lore.kernel.org/linux-arm-kernel/73701e9f-bee1-7ae8-2277-7a3576171cd4@huawei.com/ [1]
> Signed-off-by: Will Deacon <will@kernel.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

