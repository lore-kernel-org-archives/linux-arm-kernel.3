Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04E6EEF312
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 07:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kdkdKbMA+2uP4xd99/SezbJpyEhpHnhCpbt1mlY7Io=; b=4GnRBSQm6iVimKjcuSCBw3l1oQ
	2xCbeML4+wnmYh8ANQuqUAfN/MSExs9Nd6Ak2Qhqwj422TN80GYBBLE+d/BQqwm8ddMROMsFOvjFZ
	LPUZzKS3HCAs1mSlzJNXGM+pQFJPG4nxQ3VMAeEp5MogBKKWbqKj4wxEtYzxxRtshWak8hRwDRIg/
	Egn1Se/Xqt1fKX7EIGtqNPvon3Wm0HRMig1Sm0O5xraPGVDWkBSJfVbZzHXduPCbXVtWDMnxmqumN
	uVhPvi5PpfSPQHyM2oCk3xJMhwommbMu0ZC90KTEyqMH8V+METhjVDhXULmgKebtheooG1/FPOj3R
	R1c/imZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3SZ-000000017YN-1mX6;
	Thu, 05 Mar 2026 07:49:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3SW-000000017XD-3HMp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 07:49:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 692D144160;
	Thu,  5 Mar 2026 07:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95538C116C6;
	Thu,  5 Mar 2026 07:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772696964;
	bh=6AqLYlPW/gs3vlo4az2RBnc0fhk6dglm/YJG1KWJfp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OX5meTB9KrGVnyHJiKDDlXTURvrR3RfZb5Q477AWojqGpqFAT91ujTK66gHgJOq+a
	 DTt/sOga39neE+CW7s4xLXJK5c52xpOnqv8aGaV9fcShBhmTWA5/pMXnVuSuGKyojQ
	 AVEGfbMqf2VhL8o3uQIBOJcmNQaPcFURPHmM9J4caAigy7Xx4M2DEtIdPaEZYi5bDB
	 OnK92yMjCFkw9/sXmWeopiF4lwHRMY6B6A9PKengoQ1A50XgU0Ja1cg8F4K5VTnGKV
	 067wdC2+hhAvMJbPyPiQdtrkU8q1SU3eRLC+n/mqmxt6K38kkNQVCwPAMyVPV9jlxF
	 uPXZZBbc3XChQ==
Date: Thu, 5 Mar 2026 13:19:10 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com, 
	bjorn.andersson@oss.qualcomm.com
Subject: Re: [PATCH v2 4/5] PCI: qcom: Power down PHY via PARF_PHY_CTRL
 before disabling rails/clocks
Message-ID: <to6p7yf2oo5qh37hsye4zpputrc7p4bwgqvjc2plieuyapjdhp@7xshxghi4tzd>
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
 <20260217-d3cold-v2-4-89b322864043@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260217-d3cold-v2-4-89b322864043@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_234924_861422_9C59D105 
X-CRM114-Status: GOOD (  20.43  )
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

On Tue, Feb 17, 2026 at 04:49:09PM +0530, Krishna Chaitanya Chundru wrote:
> Some Qcom PCIe controller variants bring the PHY out of test power-down
> (PHY_TEST_PWR_DOWN) during init. When the link is later transitioned
> towards D3cold and the driver disables PCIe clocks and/or regulators
> without explicitly re-asserting PHY_TEST_PWR_DOWN, the PHY can remain
> partially powered, leading to avoidable power leakage.
> 
> Update the init-path comments to reflect that PARF_PHY_CTRL is used to
> power the PHY on. Also, for controller revisions that enable PHY power
> in init (2.3.2, 2.3.3, 2.7.0 and 2.9.0), explicitly power the PHY down
> via PARF_PHY_CTRL in the deinit path before disabling clocks/regulators.
> 
> This ensures the PHY is put into a defined low-power state prior to
> removing its supplies, preventing leakage when entering D3cold.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 2c4dc7134e006d3530a809f1bcc1a6488d4632ad..b02c19bbdf2ea5db252c2a0281a569bb3a0cc497 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -513,7 +513,7 @@ static int qcom_pcie_post_init_2_1_0(struct qcom_pcie *pcie)
>  	u32 val;
>  	int ret;
>  
> -	/* enable PCIe clocks and resets */
> +	/* PHY power ON */

This comment is confusing since we already have phy_power_on() API. What does
really happen in the 'test power down' case?

- Mani

>  	val = readl(pcie->parf + PARF_PHY_CTRL);
>  	val &= ~PHY_TEST_PWR_DOWN;
>  	writel(val, pcie->parf + PARF_PHY_CTRL);
> @@ -680,6 +680,12 @@ static int qcom_pcie_get_resources_2_3_2(struct qcom_pcie *pcie)
>  static void qcom_pcie_deinit_2_3_2(struct qcom_pcie *pcie)
>  {
>  	struct qcom_pcie_resources_2_3_2 *res = &pcie->res.v2_3_2;
> +	u32 val;
> +
> +	/* PHY Power down */
> +	val = readl(pcie->parf + PARF_PHY_CTRL);
> +	val |= PHY_TEST_PWR_DOWN;
> +	writel(val, pcie->parf + PARF_PHY_CTRL);
>  
>  	clk_bulk_disable_unprepare(res->num_clks, res->clks);
>  	regulator_bulk_disable(ARRAY_SIZE(res->supplies), res->supplies);
> @@ -712,7 +718,7 @@ static int qcom_pcie_post_init_2_3_2(struct qcom_pcie *pcie)
>  {
>  	u32 val;
>  
> -	/* enable PCIe clocks and resets */
> +	/* PHY Power ON */
>  	val = readl(pcie->parf + PARF_PHY_CTRL);
>  	val &= ~PHY_TEST_PWR_DOWN;
>  	writel(val, pcie->parf + PARF_PHY_CTRL);
> @@ -844,6 +850,12 @@ static int qcom_pcie_get_resources_2_3_3(struct qcom_pcie *pcie)
>  static void qcom_pcie_deinit_2_3_3(struct qcom_pcie *pcie)
>  {
>  	struct qcom_pcie_resources_2_3_3 *res = &pcie->res.v2_3_3;
> +	u32 val;
> +
> +	/* PHY Power down */
> +	val = readl(pcie->parf + PARF_PHY_CTRL);
> +	val |= PHY_TEST_PWR_DOWN;
> +	writel(val, pcie->parf + PARF_PHY_CTRL);
>  
>  	clk_bulk_disable_unprepare(res->num_clks, res->clks);
>  }
> @@ -994,7 +1006,7 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
>  	/* configure PCIe to RC mode */
>  	writel(DEVICE_TYPE_RC, pcie->parf + PARF_DEVICE_TYPE);
>  
> -	/* enable PCIe clocks and resets */
> +	/* PHY power ON */
>  	val = readl(pcie->parf + PARF_PHY_CTRL);
>  	val &= ~PHY_TEST_PWR_DOWN;
>  	writel(val, pcie->parf + PARF_PHY_CTRL);
> @@ -1065,6 +1077,12 @@ static void qcom_pcie_host_post_init_2_7_0(struct qcom_pcie *pcie)
>  static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
>  {
>  	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
> +	u32 val;
> +
> +	/* PHY Power down */
> +	val = readl(pcie->parf + PARF_PHY_CTRL);
> +	val |= PHY_TEST_PWR_DOWN;
> +	writel(val, pcie->parf + PARF_PHY_CTRL);
>  
>  	clk_bulk_disable_unprepare(res->num_clks, res->clks);
>  
> @@ -1169,6 +1187,12 @@ static int qcom_pcie_get_resources_2_9_0(struct qcom_pcie *pcie)
>  static void qcom_pcie_deinit_2_9_0(struct qcom_pcie *pcie)
>  {
>  	struct qcom_pcie_resources_2_9_0 *res = &pcie->res.v2_9_0;
> +	u32 val;
> +
> +	/* PHY Power down */
> +	val = readl(pcie->parf + PARF_PHY_CTRL);
> +	val |= PHY_TEST_PWR_DOWN;
> +	writel(val, pcie->parf + PARF_PHY_CTRL);
>  
>  	clk_bulk_disable_unprepare(res->num_clks, res->clks);
>  }
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

