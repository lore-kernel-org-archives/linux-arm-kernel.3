Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D03C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVy68VOkxLndWJG65H3RUHQPKFm2i3yz0DweV/wNDh4=; b=L+2YNop+kPgG6sYCvDYpjk8U4Z
	+enrnrorE7XJG+J4l0DUne80ZQk21ZbQkT7TqRl/BbkVCS7TSyBeTiwB8dNxDL+Pj9FwJFhsU/dfy
	UCOi1tTzoOTCHC9QaKjxNv3QnqM095qIg8YKDchKan27T4D1HkU5pAySpagwV/AdUXecKzjwjEC25
	PHnj2tunNxsSBlwwuWUcKXcjkNCP7UlYSnGWX8cMy38TaIEO1oCCf3lhM4Ksp9ZEapramofkOEenO
	bEN8uWNMLsRI2gLZMRS4MUjh5bOuvQCN3CZV0FEUDVu5iqfPZ1qElbX6M/nkMTHCSjiVflyscL2Ab
	eQ7an5xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH29J-00000009XOk-41Mt;
	Mon, 19 May 2025 15:11:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1Ar-00000009PO3-43Vp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:09:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 43069A4DF93;
	Mon, 19 May 2025 14:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E1CC4CEEF;
	Mon, 19 May 2025 14:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747663740;
	bh=XdmqhIOgyWrpqvPrXuD5sGuSVFBd8VTkIvjeyIdrYEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=luVc22gJlJH+x7jQc5VnMH8Mm+HofKOpjX+5dOE7qm+sNjKW4mfOAPApZPdfB+5oN
	 L5WkCCqZcZjsiWMjWi8Y65lgd43FG8l8/yQ6uXJf4t/4XHw6H2BOTuGQMmwOGrIleq
	 ShGb01ty8Y1jqBgpk40uqMem0porz7lyt5mfsJgU42FrdJCy92MaifwR1DMR48REes
	 e1aPhcRzdx2qZfiLn98KEXOL3Kh46lK/S1sGv8vssY/JrpXI8VlkXfhj4pdKBQNmFt
	 rfS1w2E8nQRUsWQkvDKDzSSfc4BCpTM/Vj78vpjFToRCV6B6Lt3e314T4t0e+NgP7H
	 35EBm7kF+RA5Q==
Date: Mon, 19 May 2025 15:08:54 +0100
From: Will Deacon <will@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Leo Yan <leo.yan@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v21 1/4] arm64/sysreg: Add BRBE registers and fields
Message-ID: <20250519140852.GB16991@willie-the-truck>
References: <20250407-arm-brbe-v19-v21-0-ff187ff6c928@kernel.org>
 <20250407-arm-brbe-v19-v21-1-ff187ff6c928@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-arm-brbe-v19-v21-1-ff187ff6c928@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_070902_070283_186CCC02 
X-CRM114-Status: GOOD (  14.00  )
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

On Mon, Apr 07, 2025 at 12:41:30PM -0500, Rob Herring (Arm) wrote:
> From: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> This patch adds definitions related to the Branch Record Buffer Extension
> (BRBE) as per ARM DDI 0487K.a. These will be used by KVM and a BRBE driver
> in subsequent patches.
> 
> Some existing BRBE definitions in asm/sysreg.h are replaced with equivalent
> generated definitions.
> 
> Cc: Marc Zyngier <maz@kernel.org>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
> Tested-by: James Clark <james.clark@linaro.org>
> ---
> v19:
> - split BRBINF.CC field into mantissa and exponent
> ---
>  arch/arm64/include/asm/sysreg.h |  17 ++----
>  arch/arm64/tools/sysreg         | 132 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 138 insertions(+), 11 deletions(-)

Some of the field names here are made up, but overall they seem to
correspond to the architecture, so:

Acked-by: Will Deacon <will@kernel.org>

Will

