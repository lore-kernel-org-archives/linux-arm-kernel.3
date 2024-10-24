Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE32CE8E69
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 11:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYE7/qWKeV6tlYqyWW3YZjVke9heRIv2YJVI5XdvD1M=; b=iKTIsMl0n+qSdhgMYCjP016dVv
	95AmzaTiNeg53kJYvKbIL4p2Ldx/gjUKLZgllh/MvxLa4Thfdhasf1RCBh2QuUbGpj9MilneZzWlW
	eR1pjILWlxdyaLSWH9r4dADvdoDaNleWCcsvoy2I4JhH9Sfmm0p1kZ7//vcl1Vlhl5TIb4QE4N67r
	XzSArHImfhkmNKj86+N8VODpRcHkeSPPOmmnRu9GtSZ6ucZHjMpQxtXO4ceL6ZLh48JfyUMX2xYu7
	dhOrHG8XTZVmHf7BLZ1OItnzVEq+Vu2jB4z4j9QzwqjNBk7s4D18EqrIZA55d0idNy5MwSrOY09xp
	F2su9chg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wNs-00000000FuZ-3Bul;
	Thu, 24 Oct 2024 11:52:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3w4V-00000000DV6-3l56
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 11:32:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B0A24A45313;
	Thu, 24 Oct 2024 11:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD4FC4CEC7;
	Thu, 24 Oct 2024 11:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729769526;
	bh=ivnxlBIjC5nMC+d51jAvAbt6k0K2kSFd6G5M3K32Jqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rfi75Jq7W2Zl/mTc50A88zDCnOHygVfLeFyaGoqPHEfU5ZwMHi3pfrrl7LXmauTmP
	 XXFp66XtyzW83xoyGGXLMiREPgI/FUR20H1Q/tBVa/9uH0EcscJghkp/ik5f/Jwroc
	 v46ff96cAW0ToJoqfh+sx9DaIT8eGYCECt+3nf3WaF2s9F+e/K5743Vq2qSs03//RO
	 nqnUWcqOTPyAdZ5Y+OpBU2ggWhnTG55qWtiL1056NsuATh0sgAmUNuRLQPmP0mhjdD
	 i9wNZR+azLAP9+XOGI9AntcoHBF0YAT8HNcLohcfyjQe59PsyUEcORD1eOpkHAixG+
	 DIpdtu4hnN6LA==
Date: Thu, 24 Oct 2024 12:32:02 +0100
From: Will Deacon <will@kernel.org>
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] perf/dwc_pcie: Load DesignWare PCIe PMU driver
 automatically on Ampere SoCs
Message-ID: <20241024113201.GA30270@willie-the-truck>
References: <20241008231824.5102-1-ilkka@os.amperecomputing.com>
 <20241008231824.5102-3-ilkka@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008231824.5102-3-ilkka@os.amperecomputing.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_043208_021970_0FA5B28D 
X-CRM114-Status: GOOD (  14.78  )
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

On Tue, Oct 08, 2024 at 11:18:23PM +0000, Ilkka Koskinen wrote:
> Load DesignWare PCIe PMU driver automatically if the system has a PCI
> bridge by Ampere.
> 
> Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> ---
>  drivers/perf/dwc_pcie_pmu.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> index 3581d916d851..d752168733cf 100644
> --- a/drivers/perf/dwc_pcie_pmu.c
> +++ b/drivers/perf/dwc_pcie_pmu.c
> @@ -782,6 +782,16 @@ static void __exit dwc_pcie_pmu_exit(void)
>  module_init(dwc_pcie_pmu_init);
>  module_exit(dwc_pcie_pmu_exit);
>  
> +static const struct pci_device_id dwc_pcie_pmu_table[] = {
> +	{
> +		PCI_DEVICE(PCI_VENDOR_ID_AMPERE, PCI_ANY_ID),
> +		.class		= PCI_CLASS_BRIDGE_PCI_NORMAL,
> +		.class_mask	= ~0,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(pci, dwc_pcie_pmu_table);

Hmm, won't this only work if the driver is modular? Should we be calling
pci_register_driver() for the builtin case?

Will

