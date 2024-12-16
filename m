Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FD2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 23:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nE0lMpFHRQbMjxCVICtRhw9zJ5Oy5M5HUo+2LUQLOXI=; b=FCbY4c6GdB1QmORp0eECps9TVo
	oCwRP+JWE+chW3elaxyPqXrX4UDJ4fTBmSsLmvpPhIm4N9XJBgqB7hTLn/0ryEth1uPFiTjhudAVN
	CXY9olMpJi4dPaSSQZAITYK3h7AeqXQH7JIrs6skVnFsOy+l9tOpF35M+T+Yd96+yGN4ReMmQZtUo
	T1cd0mUHouSZxKMHfYpERsfsQ5+IwBqQUre6yibo22S6So1H/jt/P+dmnnIbwv30vlhUZWn3G8Uuk
	x4lAN40z3U7Ja9crfGOkkRsdsmW/1sP6JRdAAyHeuapwmDJTfRwpbPlXBZXF7acF9mybP2NjGQtOS
	j8rPEB3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNKK6-0000000BdCB-1CPr;
	Mon, 16 Dec 2024 23:16:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNKJ0-0000000Bd48-32D2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 23:15:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D6BD85C60CD;
	Mon, 16 Dec 2024 23:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B59BC4CED0;
	Mon, 16 Dec 2024 23:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734390913;
	bh=WDQGE0FFR/+3pDl5MBnQd9HPJMHqNLi1cxrtKgTsVJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EczuVcpsRKVXCx0lYb5AdO0DfZtDyc0OfdX1XCRaKY5G5FnncKpFRuGDSEv498F0s
	 +xX0kftqNilbwMoL2B+3vy3htfse1J7b8bjov9lXk5bjaIjiJ76zV4f/IFD/Btq8V5
	 SUBv8c03T+udxenBUuYd1ge/HiudjWA3JyPw8kUpcwA+SLs0gGJ4bWjxSFZ4aY4uKo
	 eV3VsryU7XdRnzIrwuSEHgPv0EzUQS0Ypm8N/pd77nza1oTR7GJd3XqvPD9YCs4EvA
	 aX/hKsqvcqDkPjRb/v/kmCD+5Jkf32MjNqVkKObramCBDQUdMnw92l+O9fujlq5uZK
	 cmJO8DGbuxH3A==
Date: Mon, 16 Dec 2024 17:15:05 -0600
From: Rob Herring <robh@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2 18/46] arm64/sysreg: Add register fields for PMUACR_EL1
Message-ID: <20241216231505.GA601635-robh@kernel.org>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-19-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210055311.780688-19-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_151514_812171_1126CEA9 
X-CRM114-Status: GOOD (  14.09  )
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

On Tue, Dec 10, 2024 at 11:22:43AM +0530, Anshuman Khandual wrote:
> This adds register fields for PMUACR_EL1 as per the definitions based
> on DDI0601 2024-09.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/tools/sysreg | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 214ad6da1dff..462adb8031ca 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2349,6 +2349,43 @@ Res0	63:5
>  Field	4:0	SEL
>  EndSysreg
>  
> +Sysreg	PMUACR_EL1	3	0	9	14	4

I already added this and various other PMUv3.9 registers you've added 
here in v6.12 and v6.13. So are you on an old base or the tool allows 
multiple definitions? If the latter, that should be fixed.

> +Res0	63:33
> +Field	32	FM
> +Field	31	C
> +Field	30	P30
> +Field	29	P29
> +Field	28	P28
> +Field	27	P27
> +Field	26	P26
> +Field	25	P25
> +Field	24	P24
> +Field	23	P23
> +Field	22	P22
> +Field	21	P21
> +Field	20	P20
> +Field	19	P19
> +Field	18	P18
> +Field	17	P17
> +Field	16	P16
> +Field	15	P15
> +Field	14	P14
> +Field	13	P13
> +Field	12	P12
> +Field	11	P11
> +Field	10	P10
> +Field	9	P9
> +Field	8	P8
> +Field	7	P7
> +Field	6	P6
> +Field	5	P5
> +Field	4	P4
> +Field	3	P3
> +Field	2	P2
> +Field	1	P1
> +Field	0	P0

We're never going to use Pnn defines. This is just useless bloat unless 
we're aiming to top amd gpu defines LOC.

Rob

