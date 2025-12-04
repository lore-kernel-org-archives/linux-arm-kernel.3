Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB1ED216A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 16:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbzZf3YagGxv+DbpTYzrEt4hvyHJGJ46u9+M7nM8myQ=; b=ahV0t+7np3i1vc1QTDvEX5r3IR
	N/e7VAZWxDSaDUmRzV1C/oahXOU/jVsR9bzwlAMMoNeqqyP9bgvhFyYjgL2XMgBGW2vCN60PnFehJ
	A+twqnn1cisK8PiCi5BrYm0NK4u7ew/9nRKw8oDpujcrEHcZufbRxul86HQYvoRJf75ArtOFa2ozh
	eD3DT7Z1qK7CCVgutrIQ2dJ3hm3n4fnHRQ7a2Id3agJtit6r1TfE+I3157Cznz3YGSoAFx2P3ESzT
	wlHXpUQwOfzekTfqut0Ytj3buujBcYFWBmJzEBfA9Gw953jtOWWjnZeTTmZzg/AmbovfRwKzO2Cil
	ro5jRsAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRC0M-00000008Gv4-0a9j;
	Thu, 04 Dec 2025 16:16:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRC0J-00000008Guh-1klc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 16:16:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82233339;
	Thu,  4 Dec 2025 08:16:18 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE72C3F66E;
	Thu,  4 Dec 2025 08:16:24 -0800 (PST)
Date: Thu, 4 Dec 2025 16:16:21 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: cristian.marussi@arm.com, arm-scmi@vger.kernel.org,
	Artem Shimko <a.shimko.dev@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] firmware: arm_scmi: refactor reset domain handling
Message-ID: <20251204-slick-granite-chameleon-58ebc2@sudeepholla>
References: <aRW4PpPjVw1-melm@pluto>
 <20251123163557.230530-1-a.shimko.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251123163557.230530-1-a.shimko.dev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_081627_609943_018FFBB8 
X-CRM114-Status: GOOD (  24.56  )
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

On Sun, Nov 23, 2025 at 07:35:57PM +0300, Artem Shimko wrote:
> Improve the SCMI reset protocol implementation by centralizing domain
> validation and enhancing error handling.
> 
> Add scmi_reset_domain_lookup() helper function to validate
> domain ids and return appropriate error codes. Refactor all
> domain-specific functions to use this helper, ensuring consistent
> error handling throughout the reset protocol.
> 
> Suggested-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
> ---
> 
> Hi Cristian,
> 
> Thank you for suggesting! If it works for you I'll try to improve the others protocols.
> 
> It was tested on my board in QEMU and on real hardware.
> The functionality didn't break, and peripherals that are reseted via SCMI work correctly.
> 
> As an example, I can provide DMA test results (as one of the processor units dependent on SCMI reset).
> 
> [    2.559040] dw_axi_dmac_platform 1000nda0.nda_dma_0: DesignWare AXI DMA Controller, nda channels
> [    2.569265] dw_axi_dmac_platform 1000nda0.nda_dma_1: DesignWare AXI DMA Controller, nda channels
> [    2.580601] dw_axi_dmac_platform 1000nda0.nda_dma_2: DesignWare AXI DMA Controller, nda channels
> 
> # echo 2000 > /sys/module/dmatest/parameters/timeout
> # echo 1000 > /sys/module/dmatest/parameters/iterations
> # echo dma0chan0 > /sys/module/dmatest/parameters/channel
> [   95.917504] dmatest: Added 1 threads using dma0chan0
> # echo 1 > /sys/module/dmatest/parameters/run
> [  101.931372] dmatest: Started 1 threads using dma0chan0
> [  102.731009] dmatest: dma0chan0-copy0: summary 1000 tests, 0 failures 2508.42 iops 19706 KB/s (0)
> 
> And vice versa:
> 
> 1. Confirmed that the DMA module is non-functional without a proper reset via SCMI.
> Disabling the reset logic causes a system crash on first access to its registers.
> 
> 2. Requesting a non-existent reset domain:
> 
> [    2.463400] dw_axi_dmac_platform 1000nda0.nda_dma_0: error -EINVAL: Failed to deassert resets
> [    2.472091] dw_axi_dmac_platform 1000nda0.nda_dma_0: probe with driver dw_axi_dmac_platform failed with error -22
> [    2.482911] dw_axi_dmac_platform 1000nda0.nda_dma_1: error -EINVAL: Failed to deassert resets
> [    2.491553] dw_axi_dmac_platform 1000nda0.nda_dma_1: probe with driver dw_axi_dmac_platform failed with error -22
> [    2.502256] dw_axi_dmac_platform 1000nda0.nda_dma_2: error -EINVAL: Failed to deassert resets
> [    2.510735] dw_axi_dmac_platform 1000nda0.nda_dma_2: probe with driver dw_axi_dmac_platform failed with error -22
> 
> --
> Regards,
> Artem
> 
> ---
> ChangeLog:
>   v4: Add Suggested-by tag
> 
>  drivers/firmware/arm_scmi/reset.c | 59 ++++++++++++++++++++-----------
>  1 file changed, 39 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/reset.c b/drivers/firmware/arm_scmi/reset.c
> index 0aa82b96f41b..9854a3016d13 100644
> --- a/drivers/firmware/arm_scmi/reset.c
> +++ b/drivers/firmware/arm_scmi/reset.c
> @@ -100,6 +100,7 @@ static int scmi_reset_attributes_get(const struct scmi_protocol_handle *ph,
>  
>  static int
>  scmi_reset_domain_attributes_get(const struct scmi_protocol_handle *ph,
> +				 struct reset_dom_info *dom_info,

Instead of changing this, ...

>  				 struct scmi_reset_info *pinfo,
>  				 u32 domain, u32 version)
>  {
> @@ -107,7 +108,6 @@ scmi_reset_domain_attributes_get(const struct scmi_protocol_handle *ph,
>  	u32 attributes;
>  	struct scmi_xfer *t;
>  	struct scmi_msg_resp_reset_domain_attributes *attr;
> -	struct reset_dom_info *dom_info = pinfo->dom_info + domain;
>  

... You can just follow the pattern you have done everywhere else in this
change like:

struct reset_dom_info *dom_info; 

dom_info = scmi_reset_domain_lookup(ph, domain);
if (IS_ERR(dom_info))
	return PTR_ERR(dom_info);

Any particular reason for not doing that ?

-- 
Regards,
Sudeep

