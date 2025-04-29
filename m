Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F31C3ABAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hV5wY3c7XajVhT2VJvuqbK/qTiR9PbkHxqS80f/fPp8=; b=BkCEyM7lQwFH+jcg4X7l6JIgaW
	1vSSklr9IErxRR11drBpSHwLuubBR3yNQ9gD5OpnvCY7P0cf1n2XYvz6Phe/TnTQf03kKrxNZyAsg
	keL7EQp6LrYvHQJ1NPxHmBpCp+Le02iH95zwdjedEVg0ddIrgg0ObhK+tFF9BI1ml48CMxbiPgbLe
	P4ALR9R5VqPFBj60ywUjL+yk8ka6Rf5eEDEJgc+ph7FqSJBmLslPav5IPX+ZCRfpq/Uv0jw377R7E
	riwCK2egXCDx9pmc65y3meSYM73b7Mph5id3SCNRMrL1GPnEJ9/zILl0OVOVJw2zRxVgyDxN7XNWD
	R0X33vLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mh5-0000000A50y-0mTu;
	Tue, 29 Apr 2025 15:16:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9l6h-00000009n6t-0oXQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 13:34:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82F3D1515;
	Tue, 29 Apr 2025 06:34:33 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7898F3F673;
	Tue, 29 Apr 2025 06:34:38 -0700 (PDT)
Date: Tue, 29 Apr 2025 14:34:32 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 01/42] arm64: sysreg: Add ID_AA64ISAR1_EL1.LS64
 encoding for FEAT_LS64WB
Message-ID: <20250429133432.GA1859293@e124191.cambridge.arm.com>
References: <20250426122836.3341523-1-maz@kernel.org>
 <20250426122836.3341523-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426122836.3341523-2-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_063443_275183_AA901AF2 
X-CRM114-Status: GOOD (  14.33  )
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

On Sat, Apr 26, 2025 at 01:27:55PM +0100, Marc Zyngier wrote:
> The 2024 extensions are adding yet another variant of LS64
> (aptly named FEAT_LS64WB) supporting LS64 accesses to write-back
> memory, as well as 32 byte single-copy atomic accesses using pairs
> of FP registers.
> 
> Add the relevant encoding to ID_AA64ISAR1_EL1.LS64.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/tools/sysreg | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index bdf044c5d11b6..e5da8848b66b5 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -1466,6 +1466,7 @@ UnsignedEnum	63:60	LS64
>  	0b0001	LS64
>  	0b0010	LS64_V
>  	0b0011	LS64_ACCDATA
> +	0b0100	LS64WB
>  EndEnum
>  UnsignedEnum	59:56	XS
>  	0b0000	NI

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

