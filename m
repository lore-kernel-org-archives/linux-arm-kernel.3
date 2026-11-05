Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3A4606D811
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q/S30LTX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hhYHORyyMEe9WzmKHSw5na7G0AtsvbFkX50GoyW9BPo=; b=q/S30LTXgDb3j1
	XF9sK7J+FOIseuwfkbvZ6m218Q2W0R69zCCCpPgKltrwUrt1SBkAXVHrxqRvUmODXuQ+Q0Ond0Q3z
	EEmkgLxiWNQE33qmt7uGC1fnNNth5RSwZGrlGcbjzbtOpsFL47j/+WZeESviP5Ip22NotB/s7Uib4
	bRWTHRwu0xGhSiLwpxFGq2x98bQKTs+ZgR8LtLseVnR/1jWrvyat3fNdHuksUCsOGLTjg+iiKXeRP
	onqDRJZpyIwD7S5uAplOXFMgXr8Se001njrHHnjBOkEcVEVzXSIG2R4yeti7P75yPM2FWFt0b0A2f
	v/mU6ev5nJMX7yziewTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyF8-00000009F4u-2sNz;
	Thu, 05 Nov 2026 14:15:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyF6-00000009F3a-37zu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:15:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3867A43500;
	Thu,  5 Nov 2026 14:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72CD31F00919;
	Thu,  5 Nov 2026 14:15:03 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] PCI: mobiveil: Fix device_node leak in
 ls_g4_pcie_probe()
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Vishal Satle <vishalsatleit24@gmail.com>
Cc: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261027094427.143733-1-vishalsatleit24@gmail.com>
References: <20261027094427.143733-1-vishalsatleit24@gmail.com>
Date: Thu, 05 Nov 2026 19:44:57 +0530
Message-Id: <179388809743.2730.8434004843297816557.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2015;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=GsF7syF+nFLWXE9m7kFav4xxaz1L9DMmDNF5rgbPuko=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq7I9ielNJs9cOVzbu7dfV03fSaAXcVw3Efl3/5
 MGgqL6r9OaJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauyPYgAKCRBVnxHm/pHO
 9fY2B/0UPbAnwhZVOulWyTLwWcwDtH8wPKAnl5TZjBlx3KJzWpzJ8vD6Z65kcgD5Nhy2kAh15mh
 kcX3dJ6RX16WpVlt/j8mjwHCI9X9edGJzjZkxEpZSF0STCMpQRqbaeQ26kd4djn6c+NTDXYWhcL
 O/ESpuFr3emaYHxI1XySbdSiApOfTLYBhhg2z43KuQRQ9gxqJd1FxR4ntrc4TIUCl2Rx1GisfXP
 5kybBO8xDPRfApUElgiIyhD9uvYJCkqEDKjQVDkJtIJcU9YCIV0JRWS6vLy9J44vMhiZ4kE21Zr
 4JUqyBfyU+RGlGwKbRM3yqZYGx+uwUPonaIe2MV8tzOGrd87
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-27 15:14 +0530, Vishal Satle wrote:
> ls_g4_pcie_probe() calls of_parse_phandle() to verify the presence of
> the "msi-parent" device node. of_parse_phandle() increments the reference
> count of the returned device_node.
> 
> Because the return value was evaluated directly as a boolean condition,
> the acquired reference was never released, leaking the MSI controller node
> reference count on probe.
> 
> Assign the resolved node to a local variable and call of_node_put() once
> the existence check is complete.
> 
> Cc: stable@vger.kernel.org
> 

Why? This is not a critical bug fix to backport.

> Signed-off-by: Vishal Satle <vishalsatleit24@gmail.com>
> ---
>  drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c b/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c
> index 4919b27ea..5b1862fe0 100644
> --- a/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c
> +++ b/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c
> @@ -199,12 +199,15 @@ static int __init ls_g4_pcie_probe(struct platform_device *pdev)
>  	struct mobiveil_pcie *mv_pci;
>  	struct ls_g4_pcie *pcie;
>  	struct device_node *np = dev->of_node;
> +	struct device_node *msi_node;
>  	int ret;
>  
> -	if (!of_parse_phandle(np, "msi-parent", 0)) {
> +	msi_node = of_parse_phandle(np, "msi-parent", 0);
> +	if (!msi_node) {

You should just use of_property_present() and be done with it. The driver is not
using the phandle and it shouldn't care if it resolves to a proper node or not
as it will be verified by the irqchip layer.

But that being said, I really doubt whether we need this check or not. None of
the other controller drivers are having this check. If this property is absent,
then MSIs won't work, but INTx will continue to work. So the controller wouldn't
be broken altogether.

So this check can be dropped.

- Mani



