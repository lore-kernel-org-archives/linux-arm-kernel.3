Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8270ACAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9d8kZqSTXF2G2YWCUxF7W+9FI9cEd4vkh28BTieHpHw=; b=ZRC6bnNFyEXl6jPSNvAkhNEjnc
	jHxKM5JyDu9V2IF2hUsQgjYv5z83vQKjHSDMqDBR2dQu4DQxpkYfcgXzuEgOjzRM3ZaTmhLnkmQzJ
	kYwi/2xabLU2TZiBLGHzpOrMYdQJV8i/gywyY5QX4/ZGvlKdCWNWgz/WRX8EznSddILIRh1sTyltF
	wTPx9rXYCOwr8sfJpSGRzjtMloi+ukJAf6AUdyMQdalMSDlPWuL1aFte5937wwLtRUqog/D3y/KSz
	p0Nzjj2RRma7Ou65XaszFt/moK9y1HYKg68F59AXzsVE3iD3f4Y5d5GBzebd4fatx7GSDp5u3itsa
	PdHt6SyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbNM-0000000HAnH-0f7H;
	Mon, 08 Sep 2025 12:53:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvaMm-0000000GllD-2W0F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 11:49:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B2648601BD;
	Mon,  8 Sep 2025 11:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0B6C4CEFA;
	Mon,  8 Sep 2025 11:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757332139;
	bh=t3zQW/6UKxcXwE/+3TcZ5iTAQI2PA6ExkDxdCG0M47Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=susD5O2SmN/y4qjYpxUMDUc1XIjaNYKnPddSz0Mi/+3V27sbxQG7iyA/x5qtDHhZH
	 wxMgOB9RPXI4lSffEViv0Qr5E1z6mPx7MHEI4QtA+4EcGSBlAoCGdJIb3CrmjjbdzK
	 meFXu4/TjrYAuk0/7m8c90cinYL3sn3BbUz0sMh/IImkBInqkUznD1opfFKBUPnj5J
	 hOrlzxkbxAPGConTkgCaeDAxaPWOtQQ8csxU+V0UcuF1uyhnp760l0lUVHReafKItN
	 qN185wGxUfO4MeJU5IGQA1HZn2uV97VDgQaZbV0G7WvS1tFPbCSsugDyd0YfMVDrow
	 LPBqjc4lBo6yQ==
Date: Mon, 8 Sep 2025 12:48:52 +0100
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	corbet@lwn.net, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, shuah@kernel.org,
	jonathan.cameron@huawei.com, shameerali.kolothum.thodi@huawei.com,
	linuxarm@huawei.com, prime.zeng@hisilicon.com, xuwei5@huawei.com,
	yangyicong@hisilicon.com, tangchengchang@huawei.com,
	wangzhou1@hisilicon.com
Subject: Re: [PATCH v4 4/7] arm64: Provide basic EL2 setup for FEAT_{LS64,
 LS64_V} usage at EL0/1
Message-ID: <aL7CpFHAQ2mX2E2U@willie-the-truck>
References: <20250715081356.12442-1-yangyicong@huawei.com>
 <20250715081356.12442-5-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715081356.12442-5-yangyicong@huawei.com>
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

On Tue, Jul 15, 2025 at 04:13:53PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Instructions introduced by FEAT_{LS64, LS64_V} is controlled by
> HCRX_EL2.{EnALS, EnASR}. Configure all of these to allow usage
> at EL0/1.
> 
> This doesn't mean these instructions are always available in
> EL0/1 if provided. The hypervisor still have the control at
> runtime.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  arch/arm64/include/asm/el2_setup.h | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index 9f38340d24c2..46e085af7c98 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -57,9 +57,19 @@
>          /* Enable GCS if supported */
>  	mrs_s	x1, SYS_ID_AA64PFR1_EL1
>  	ubfx	x1, x1, #ID_AA64PFR1_EL1_GCS_SHIFT, #4
> -	cbz	x1, .Lset_hcrx_\@
> +	cbz	x1, .Lskip_gcs_hcrx_\@
>  	orr	x0, x0, #HCRX_EL2_GCSEn
>  
> +.Lskip_gcs_hcrx_\@:
> +	/* Enable LS64, LS64_V if supported */
> +	mrs_s	x1, SYS_ID_AA64ISAR1_EL1
> +	ubfx	x1, x1, #ID_AA64ISAR1_EL1_LS64_SHIFT, #4
> +	cbz	x1, .Lset_hcrx_\@
> +	orr	x0, x0, #HCRX_EL2_EnALS
> +	cmp	x1, #ID_AA64ISAR1_EL1_LS64_LS64_V
> +	b.lt	.Lset_hcrx_\@
> +	orr	x0, x0, #HCRX_EL2_EnASR
> +

Acked-by: Will Deacon <will@kernel.org>

Will

