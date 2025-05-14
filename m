Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5ADCC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 06:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5dy+qD9UO5AMjy3moj8CWlb5NdK3TLWWHComk22Ev0=; b=zRMLYrsVUzXXhPE/B54RoM2RPf
	jOlldbKvL8g/ce+GwDyb+E7tNXxC67TMUjHinR8Lq9eRTSxquw/Mot2wV1aezIsziJKWnA8ug1L3Z
	1oj2qQWRG0zpaLMOBVtQX0ZCBS5+jrjWykoJWkmhwdFH5s9tHRKbHPR3gmdM8wTN1ACoCBSm6qFAQ
	rYvPc7+fMii5QBDQ3JlB2y+ZU6n7M8AEhmp1d6//f+Ox+EsS6B2OFniGE7uIdgHXmVV5OBCFkQHb5
	CexLDpuOTs/OxVCoVq0gp2cxBaYwhn6MvuQih4QU44gZ0A0veFZOoBqr453293c2+COH8zjtrXZ59
	G0txL82A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF5oK-0000000ECNu-0v9w;
	Wed, 14 May 2025 06:41:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF5mH-0000000EC9N-42KM;
	Wed, 14 May 2025 06:39:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 001EDA4D948;
	Wed, 14 May 2025 06:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D9AC4CEE9;
	Wed, 14 May 2025 06:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747204780;
	bh=dLPnyVUsbA+rtCJMIW6m9OfctifOEzbCmjQWykaELdY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ApOhuhEuDmYEwqlYD7YTcY7XBW03QADe1CXb2AIDTCM5K6qqNkLQHPl+K6EStB7Nu
	 LSVAz1lF7tmMH3CXj8T+tnxp344EKktRPOP6T6OqNML3TRHf/ak2iytL0NpM4t8y4c
	 vDASdz+Ds6U/ikxD1tls9K8UoyxgAtdMMls7bgFvWSDqq2C35gYSLLmFh7/L6vuyTT
	 sks9k9MhdTV0nx5MtSH5wk35Rcm63PaNFk8AhIaLwiqbNoCW4DCfdOU8Hbm2CeRhZU
	 /mGclfsrNqaVuF7zr7ULuQtpwZM3fCma/5dj9rGvoz6bOR4Z2NVAG8FiqBdHpEhYVC
	 KnRF2lU7SbqYQ==
Message-ID: <a5c3efbc-89a4-45c5-a14c-d0c0fd2e232c@kernel.org>
Date: Wed, 14 May 2025 15:39:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] PCI: endpoint: cleanup set_msi() callback
To: Niklas Cassel <cassel@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>, stable+noautosel@kernel.org,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250513073055.169486-8-cassel@kernel.org>
 <20250513073055.169486-12-cassel@kernel.org>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250513073055.169486-12-cassel@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_233942_141025_C77FB8B1 
X-CRM114-Status: GOOD (  20.11  )
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

On 5/13/25 16:30, Niklas Cassel wrote:
> The kdoc for pci_epc_set_msi() says:
> "Invoke to set the required number of MSI interrupts."
> the kdoc for the callback pci_epc_ops->set_msi() says:
> "ops to set the requested number of MSI interrupts in the MSI capability
> register"
> 
> pci_epc_ops->set_msi() does however expect the parameter 'interrupts' to
> be in the encoding as defined by the MMC Multiple Message Capable field.
> 
> Nowhere in the kdoc does it say that the number of interrupts should be
> in MMC encoding.
> 
> Thus, it is very confusing that the wrapper function (pci_epc_set_msi())
> and the callback function (pci_epc_ops->set_msi()) both take a parameter
> named interrupts, but they both expect completely different encodings.
> 
> Cleanup the API so that the wrapper function and the callback function
> will have the same semantics.

Same comment as patch 3. Mention the semantic the patch implements.

> 
> Cc: <stable+noautosel@kernel.org> # this is simply a cleanup
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

A few nits below, but other than that, looks good to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

> ---
>  drivers/pci/controller/cadence/pcie-cadence-ep.c | 4 +++-
>  drivers/pci/controller/dwc/pcie-designware-ep.c  | 3 ++-
>  drivers/pci/controller/pcie-rcar-ep.c            | 3 ++-
>  drivers/pci/controller/pcie-rockchip-ep.c        | 5 +++--
>  drivers/pci/endpoint/pci-epc-core.c              | 5 +----
>  5 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-ep.c b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> index 78b4d009cd04..f307256826e6 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-ep.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> @@ -220,10 +220,12 @@ static void cdns_pcie_ep_unmap_addr(struct pci_epc *epc, u8 fn, u8 vfn,
>  	clear_bit(r, &ep->ob_region_map);
>  }
>  
> -static int cdns_pcie_ep_set_msi(struct pci_epc *epc, u8 fn, u8 vfn, u8 mmc)
> +static int cdns_pcie_ep_set_msi(struct pci_epc *epc, u8 fn, u8 vfn,
> +				u8 interrupts)

To be extra clear, I would rename this num_interrupts or nr_interrupts. No
confusion possible with such name.

> diff --git a/drivers/pci/controller/pcie-rcar-ep.c b/drivers/pci/controller/pcie-rcar-ep.c
> index 9da39a4617b6..b25ad23bedb7 100644
> --- a/drivers/pci/controller/pcie-rcar-ep.c
> +++ b/drivers/pci/controller/pcie-rcar-ep.c
> @@ -261,10 +261,11 @@ static int rcar_pcie_ep_set_msi(struct pci_epc *epc, u8 fn, u8 vfn,
>  {
>  	struct rcar_pcie_endpoint *ep = epc_get_drvdata(epc);
>  	struct rcar_pcie *pcie = &ep->pcie;
> +	u8 mmc = order_base_2(interrupts);

Same rename suggested here and for the other drivers.


-- 
Damien Le Moal
Western Digital Research

