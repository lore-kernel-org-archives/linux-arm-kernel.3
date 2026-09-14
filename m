Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B18C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5w2HlKTbUBKhRSU3hcFGiayTadbDWu1B6dJYyonNrUU=; b=bOGDZ/QTlwLutsqVoRkeoCbL+g
	tA6fDzD+xlKnwd5XSzqhFAnSx3gFsFcSt9mCvHYrZ5QHpYFtZnG/GNXYb4s1TeFS3kKYSb8cp/QaB
	2e8iWWZLd/w2+UxRRDR8DynVUP0ObQOao3XAYskUkgIJEHxypdUVyLLn6INmaTAYm9TuT73Ft60uD
	AwCaX0xnMjzYglgnlRESrGmd3gI+meV/Tcuqx4ley3EzShY1awzPbJd/++1NAJLV7FwwrBhu4wvwl
	7nZHx3AJFEGSV9J0thticKYnAGuicDbZFGxlWi50VuLtrLVkUAK10rVHievVlFCQk4YfOOujS0/I1
	ue81ciuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66xe-00000003p6S-3PMc;
	Mon, 14 Sep 2026 13:43:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66xb-00000003p5K-2pnc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:43:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1895C1570;
	Mon, 14 Sep 2026 06:42:59 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 239B83F882;
	Mon, 14 Sep 2026 06:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789393382; bh=VsD3H2ySCWA+ttXwqRR44/yEVZBVYNu9HiXKcp4JU/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QKEvRdM1KsJUIgRp2hAnY1MCgGM/jsC+08mreDLmTipFou8mjBZj9V/kx6bWzth3l
	 tuNqalyLN0cvWZ5wbjjg4t7KqBhT4908Ts+Tkbvtqy48J9zQGOpQbwVeRQIXszeC+r
	 lPDBN0rq3hBOLFndk/60GPy0jKdhx5mp3czuRW5I=
Date: Mon, 14 Sep 2026 14:42:51 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 6/7] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
Message-ID: <aqf524L399WhJ2XV@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-7-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914060511.277948-7-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_064303_772852_5C6BC86D 
X-CRM114-Status: GOOD (  16.33  )
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

On Mon, Sep 14, 2026 at 11:35:10AM +0530, Aneesh Kumar K.V (Arm) wrote:
> The Arm CCA guest TSM provider currently binds through the arm-cca-dev
> platform device. Like arm-smccc-trng, this device is not an independent
> platform resource; it is a software representation of the RSI firmware
> service discovered through SMCCC.
> 
> Move RSI discovery into the SMCCC firmware driver. When the SMCCC conduit
> is SMC and if RSI ABI version call is supported, create an arm-rsi-dev

Nit: "arm-rsi". Or did you mean to actually user "arm-rsi-dev" below?

> SMCCC device. Convert the Arm CCA guest TSM provider to an SMCCC driver so
> it binds to that discovered RSI service and keeps module autoloading
> through the SMCCC device id table.
> 
> Keep the old arm-cca-dev platform-device registration for now. Userspace
> has used that device as a Realm-guest indicator, so removing it is left to
> a follow-up patch that adds a replacement sysfs ABI.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
[...]
> @@ -94,6 +95,11 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
>  		.requires_smc   = false,
>  		.device_name    = "arm-smccc-trng",
>  	},
> +	{
> +		.func_id        = SMC_RSI_ABI_VERSION,
> +		.requires_smc   = true,
> +		.device_name    = "arm-rsi",
> +	},
>  };

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

