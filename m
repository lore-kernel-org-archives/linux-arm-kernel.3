Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B255C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 10:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6B6YHE9Kqd70sRr1HxlKQ1mQuHMXP6sdRfwXJg5Gm0=; b=qapZiOGQam2xRTzATwCSi5cJSe
	z3NRo1i6D//HOgVlQA1ogvWOjiWFo8kYlE0BdCMxLgg0XUelX0yNzmwE142RDfFwaL/7OVE8Q/Bx3
	zqQshFgupNlg5wE3t0gQl5L+TUxEQFM8RvwlLJxRbj+TGO3h2NGTsqvP6ZMqHdpxl/nNzbJpgngfW
	eB7CJljcWlvjY1i423NfPKvG7u4LEAzZpNbAFCt/jHvUDCVL4dBHUoMAVsLKn3GPzE+7NSvxb/Hpu
	p8logsYj5H94NiBtEolxp/E5YN0QY7PRoS7MAU2svttmOP71BgZspH8QRlD6DiGf55G3ckRCPSKXS
	u5REREjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA3Nt-0000000D7Ss-0duy;
	Fri, 25 Sep 2026 10:42:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA3Np-0000000D7S7-0OZq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 10:42:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5592A169C;
	Fri, 25 Sep 2026 03:42:20 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 768373F86F;
	Fri, 25 Sep 2026 03:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790332943; bh=UUyhn4ypefH8nO4Rrn4P6xc3nFeWoLuAA1eQpSu4Akc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YDM+yiyKthxFhTKEmv9i+I4SBvhmEM/1ix0t1Zi4BCJYjZJ4kcAmvy299BLpzlw3y
	 cT6K+p2MVhx1f4Q9XiRhkD/OVCLxnl59uvS2/1JEPvzvgn9q/QBtQqw3QYM9pQeWcg
	 VoHtTvnvMrACrhnlvDU4LlnhgXJ3vauae0k3g6DE=
Date: Fri, 25 Sep 2026 11:42:18 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
Subject: Re: [PATCH v19 2/7] firmware: arm_rmm: Check for RMI support at init
Message-ID: <arZQCiF3iqp9eCsy@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-3-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924135201.850038-3-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_034225_181350_F6FE546D 
X-CRM114-Status: UNSURE (   9.88  )
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

On Thu, Sep 24, 2026 at 02:51:56PM +0100, Suzuki K Poulose wrote:
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 32102c3912fa7..e8b29983b0021 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -293,6 +293,7 @@ static const struct arm64_ftr_bits ftr_id_aa64isar3[] = {
>  static const struct arm64_ftr_bits ftr_id_aa64pfr0[] = {
>  	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_CSV3_SHIFT, 4, 0),
>  	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_CSV2_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_RME_SHIFT, 4, 0),

I think we end up exposing this to (any) guest unless we mask it out in
sanitise_id_aa64dfr0_el1(). Do the guests care about the RME version? I
don't think they should, especially the non-realm ones. For nested it's
masked away already (limit_nv_id_reg()).

-- 
Catalin

