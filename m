Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B43CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 21:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ztvzX841FPofXEw3UAvHe5MUUCcyU4P38VrmHGx3SqU=; b=VvQNfANVe4GGVK
	SMc1nJk5x7tFvY30glPiFSirF/3+IRH3AcVExDJ/VVpjyuCJRSUtyFeSjwtG9DK8GwKD1voGV2yOU
	KfgztRo+j+HTKjIF6sAptNAvZAyjvMGgICWGjDT6VshADIQYYs7JYQsgVzcvH/wXX1xU5fV41pPF/
	7h9cTVWZxG5Fbcs3qI4PpuY2NhJtxbXoA2/Yz4h5BQtiTqwgzg+kTLk+PPC/isz2UQNSwd8vqTP/1
	53SsBBvRwWQmceDrgAiJh3f2UykJviNXVhovMrtaBqrICsfqEMp4OjK9sZ76QemaUsK26NK9y6hMR
	UltwYVMDMraeUcv68K9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxBfW-0000000BiUv-362i;
	Fri, 12 Sep 2025 21:50:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxBfT-0000000BiU3-2UFi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 21:50:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1630040C26;
	Fri, 12 Sep 2025 21:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD397C4CEF1;
	Fri, 12 Sep 2025 21:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757713855;
	bh=I32UvaadbaJ72Eaidbhmruy+XECfJJW6sIgil2cnjeo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=gPkiIYGNsVnzkGKHbxxmFqBsyIMcycgphKoCmbj8GCCYzxsWhQT3JRMOfmPyMqODQ
	 uzGBxRZL3dghbATykaG2tSVEML0iOTtx1CmufOncToMeAUNzYK2GbPG/9ADADC+F/q
	 TKmW6+PwUvNMEyFhDRectkEsWwFj/rqtvzT1GiBIYYRZCkQb4m7EIcd0r84ohOvsyX
	 kjCilPYUg+ek55S/3MfjHoUcR1urIuTIDrF77z1T80tQRtaDG24SkwPg3MJqH6AB70
	 j+3h6uxILGb51saPCUzDZhSfNo5dZOf3HZM7qqTPv4f62lHTAklzyMKeHXrb1gsQKW
	 XbM9D3n5jJQ/w==
Date: Fri, 12 Sep 2025 16:50:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jonathan Chocron <jonnyc@amazon.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v9 3/4] PCI: qcom: Prepare for the DWC ECAM enablement
Message-ID: <20250912215053.GA1643809@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909-controller-dwc-ecam-v9-3-7d5b651840dd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_145055_676251_14B99FE1 
X-CRM114-Status: GOOD (  19.90  )
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

On Tue, Sep 09, 2025 at 12:37:52PM +0530, Manivannan Sadhasivam wrote:
> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> To support the DWC ECAM mechanism, prepare the driver by performing below
> configurations:
> 
>   1. Since the ELBI region will be covered by the ECAM 'config' space,
>      override the 'elbi_base' with the address derived from 'dbi_base' and
>      the offset from PARF_SLV_DBI_ELBI register.
> 
>   2. Block the transactions from the host bridge to devices other than Root
>      Port on the root bus to return all F's. This is required when the 'CFG
>      Shift Feature' of iATU is enabled.

FWIW, before I noticed your v9, I had updated the comments here to fix
a few inconsistencies.  Here's the diff:

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 7c2b2c8c61c2..962f0311a23a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -343,15 +343,15 @@ static void qcom_pci_config_ecam(struct dw_pcie_rp *pp)
 	writel_relaxed(upper_32_bits(pci->dbi_phys_addr), pcie->parf + PARF_ECAM_BASE_HI);
 
 	/*
-	 * The only device on root bus is a single Root Port. So if PCI core
-	 * tries to access any devices other than Device/Function (0.0) in Bus
-	 * 0, the TLP will go outside of the controller to the PCI bus. But with
-	 * CFG Shift Feature (ECAM) enabled in iATU, there is no guarantee that
-	 * the response is going to be all F's. Hence, to make sure that the
+	 * The only device on the root bus is a single Root Port. If we try to
+	 * access any devices other than Device/Function 00.0 on Bus 0, the TLP
+	 * will go outside of the controller to the PCI bus. But with CFG Shift
+	 * Feature (ECAM) enabled in iATU, there is no guarantee that the
+	 * response is going to be all F's. Hence, to make sure that the
 	 * requester gets all F's response for accesses other than the Root
-	 * Port, configure iATU to block the transactions starting from function
-	 * 1 of the root bus to the end of the root bus (i.e from dbi_base + 4kb
-	 * to dbi_base + 1MB).
+	 * Port, configure iATU to block the transactions starting from
+	 * function 1 of the root bus to the end of the root bus (i.e., from
+	 * dbi_base + 4KB to dbi_base + 1MB).
 	 */
 	addr = pci->dbi_phys_addr + SZ_4K;
 	writel_relaxed(lower_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_WR_BASE);
@@ -1385,7 +1385,7 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 	if (pp->ecam_enabled) {
 		/*
 		 * Override ELBI when ECAM is enabled, as when ECAM
-		 * is enabled ELBI moves along with the dbi config space.
+		 * is enabled ELBI moves along with the DBI config space.
 		 */
 		offset = FIELD_GET(SLV_DBI_ELBI_ADDR_BASE, readl(pcie->parf + PARF_SLV_DBI_ELBI));
 		pci->elbi_base = pci->dbi_base + offset;

