Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC934C2A074
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 10:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KKS/oIWerUwd9TAnCurwEcjkTyGGqLXTkWrxIrfO3Q=; b=ZS+3P3w+Jz+KSD1FaLrsv9H0h5
	vCEc10wlzqzXbCh386xYAsW8cbRzHaG9jtH1CEDiLcrpaqR97cBdzcLhck7l3K+S+rwuvZQP7SWIZ
	bwd0QtHRoB2ic4HOu+h8ZvJBSQFPD3p/UsjOnY/7BxiabVDQ9TceWDZ1PeBy5WyTi56wcGwxJpzW+
	c+m0+EGbmj0vCey7uUlyLKoE08lRuSmnHckn7Hv2RFrTqGaiDmFbApY3oM+2Yi+T3+hOxA8lTPOgN
	cbr2niKge+ZhdOXngodjaCqoWG6h1o3pwedLfNWQ0HFqbLhyBj1qlD0idSnraMREYucOmv8nmltzW
	e1CFuEsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vchvk-0000000B7IB-1jKQ;
	Mon, 05 Jan 2026 10:35:20 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vchvh-0000000B7H9-2cKD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 10:35:19 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dl9fb4yvKzHnH7p;
	Mon,  5 Jan 2026 18:35:03 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id B4AB540565;
	Mon,  5 Jan 2026 18:35:05 +0800 (CST)
Received: from localhost (10.48.146.88) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 5 Jan
 2026 10:35:04 +0000
Date: Mon, 5 Jan 2026 10:35:02 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pali =?UTF-8?Q?Roh?=
 =?UTF-8?Q?=C3=A1r?= <pali@kernel.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
	<kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Madhavan
 Srinivasan" <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
	<chleroy@kernel.org>, Tyrel Datwyler <tyreld@linux.ibm.com>,
	<linux-pci@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/3] PCI: mvebu: Simplify with scoped for each OF child
 loop
Message-ID: <20260105103502.00002efe@huawei.com>
In-Reply-To: <20260102124900.64528-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124900.64528-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.146.88]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_023517_813346_A861D71D 
X-CRM114-Status: GOOD (  18.00  )
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

On Fri,  2 Jan 2026 13:49:01 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Hi Krzysztof,

Drive by review.  Your changes are functionally equivalent and lgtm.
However, I am curious at whether the lack of reference count for child
when stashed in port->dn (and then used in the for loop) is a potential
issue.

Jonathan

> ---
>  drivers/pci/controller/pci-mvebu.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
> index a72aa57591c0..4d3c97b62fe0 100644
> --- a/drivers/pci/controller/pci-mvebu.c
> +++ b/drivers/pci/controller/pci-mvebu.c
> @@ -1452,7 +1452,6 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
>  	struct mvebu_pcie *pcie;
>  	struct pci_host_bridge *bridge;
>  	struct device_node *np = dev->of_node;
> -	struct device_node *child;
>  	int num, i, ret;
>  
>  	bridge = devm_pci_alloc_host_bridge(dev, sizeof(struct mvebu_pcie));
> @@ -1474,16 +1473,14 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	i = 0;
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		struct mvebu_pcie_port *port = &pcie->ports[i];
>  
>  		ret = mvebu_pcie_parse_port(pcie, port, child);
> -		if (ret < 0) {
> -			of_node_put(child);
> +		if (ret < 0)
>  			return ret;
> -		} else if (ret == 0) {
> +		else if (ret == 0)
>  			continue;
> -		}
>  
>  		port->dn = child;
>  		i++;
> @@ -1493,6 +1490,7 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
>  	for (i = 0; i < pcie->nports; i++) {
>  		struct mvebu_pcie_port *port = &pcie->ports[i];
>  		int irq = port->intx_irq;
> +		struct device_node *child;
>  
>  		child = port->dn;
>  		if (!child)


