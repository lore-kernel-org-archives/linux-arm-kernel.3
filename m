Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD663C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 14:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjWnuC9QgiWHvSuM9zErwgPnubNLWbuXu8mN5WW6YCo=; b=1iN7jFUO2c/Y3NNAtz1LirdZ+Q
	WsRXZHD3TwCHX76BYG53dDYdmPdEr8Unwl6u2D4kI2kbJWWmppdUGyHI2IVduQbPzpzayccQPtiPR
	903UpxHl0ItCCShMKZJr94xeP+dsTm93Hw5iABQtZrEZy+MW+YZjJzSi8tI/erEneY285lGLPA7rR
	UN1zucWbKI/plph03GExzt5FqHITEbCGdlFgXC2/yk6WC1kEZZLhyxm3uK+c1P+09o12udQrwxz1v
	DCDtK7JBxzR2ffWE7kIQJeYeLHmrer72P4BtqzdFuiZw8QthD6FbrKXmZO7i2T4KAqAzkHHEPo6X6
	ie6T3YmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCex-000000058SP-3IMi;
	Fri, 10 Jul 2026 14:56:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCev-000000058RR-3Icn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 14:56:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21D5E1E7D;
	Fri, 10 Jul 2026 07:56:52 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.2.213.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AE473F7B4;
	Fri, 10 Jul 2026 07:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783695416; bh=kWZ/q/+p3VrAnnSCKo1mZVef53IyupoK4tnQ+cyjDQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PmuI9JkU97IwkYAtcl75Uz7ASKcEhVqmMSImuRNbC900dXx8548yfKX3v5WovGGgC
	 E/w6F2D3quuCi+/J+zttBFKVERBkdkznkOf6G0NfkJ9XYZZ5G7enWc3ZHaM0iucmYK
	 2nQXCAVw04K4fphEB9M2WQSNTw1DDDHrHp3ejydA=
Date: Fri, 10 Jul 2026 15:56:52 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 14/28] arm64: sysreg: Add HCRX_EL2 bits related to
 FEAT_NV3
Message-ID: <20260710145652.GD12293@e124191.cambridge.arm.com>
References: <20260702160248.1377250-1-maz@kernel.org>
 <20260702160248.1377250-15-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702160248.1377250-15-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_075657_896852_6A95B34C 
X-CRM114-Status: GOOD (  13.35  )
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

On Thu, Jul 02, 2026 at 05:02:34PM +0100, Marc Zyngier wrote:
> FEAT_NV3 introduces 4 new HCRX_EL2 control bits. Describe them
> in the sysreg file.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Checked against the spec.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/tools/sysreg | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 31e4ea455a9ce..afe9337851a2e 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -4548,7 +4548,12 @@ Fields	ZCR_ELx
>  EndSysreg
>  
>  Sysreg	HCRX_EL2	3	4	1	2	2
> -Res0	63:27
> +Res0	63:35
> +Field	34	NVnTTLBOS
> +Field	33	NVnTTLBIS
> +Field	32	NVnTTLB
> +Res0	31:28
> +Field	27	NVTGE
>  Field	26	SRMASKEn
>  Res0	25
>  Field	24	PACMEn
> -- 
> 2.47.3
> 

