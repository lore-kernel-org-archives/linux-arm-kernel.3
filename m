Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9AEC2A096
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 10:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGQIs+Qfp/E0PCeOQrC1YRMZvOgvyVpnURrxzduBgCM=; b=Ec/f5SqrR+9V1ByU9CmE30YPPX
	k3F3BUgT9JRh6dgntq02U8+l6ptzZbhxrsEtu8Kyjmh4MoH34joRknyO9iWnv1VeU+25N7SSrBEcK
	WviaKxjHw/Ddu11YKIoSGmFGnO7nDMKpNsO6eJcmmz4nSlRypA4HKhlaZPtETuUnsPTohw0+yhdRk
	U8MemOJ1HbHMb/DXQXuTJX8GdmbA+ixZ/13B2ECdQDCjdipRCZsi/FpFHDG5d48OiyqYt/XzfLK3d
	ZFVpFBzSzYdn8gAg3jtmShgNKFChURYLRkXEF/8Mtum4qfeqaHENjOSxqB8+m3m1gKYiJ5rwkYVfo
	KEONcxrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vciCt-0000000B93D-01Mb;
	Mon, 05 Jan 2026 10:53:03 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vciCp-0000000B92n-3BmJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 10:53:01 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlB230nTyzJ46hp;
	Mon,  5 Jan 2026 18:51:55 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 579F840539;
	Mon,  5 Jan 2026 18:52:55 +0800 (CST)
Received: from localhost (10.48.146.88) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 5 Jan
 2026 10:52:54 +0000
Date: Mon, 5 Jan 2026 10:52:52 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
CC: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, Bill Wendling
	<morbo@google.com>, Justin Stitt <justinstitt@google.com>,
	<linux-ide@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<llvm@lists.linux.dev>
Subject: Re: [PATCH 1/3] ata: ahci-dwc: Simplify with scoped for each OF
 child loop
Message-ID: <20260105105252.00003b5a@huawei.com>
In-Reply-To: <20260102125040.65256-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102125040.65256-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.146.88]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_025259_947863_52AC5975 
X-CRM114-Status: GOOD (  15.53  )
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

On Fri,  2 Jan 2026 13:50:41 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

A whilst you are here suggestion inline to make it a bit simpler.

> ---
>  drivers/ata/ahci_dwc.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/ata/ahci_dwc.c b/drivers/ata/ahci_dwc.c
> index aec6d793f51a..bfd24772ee67 100644
> --- a/drivers/ata/ahci_dwc.c
> +++ b/drivers/ata/ahci_dwc.c
> @@ -260,7 +260,6 @@ static void ahci_dwc_init_timer(struct ahci_host_priv *hpriv)
>  static int ahci_dwc_init_dmacr(struct ahci_host_priv *hpriv)
>  {
>  	struct ahci_dwc_host_priv *dpriv = hpriv->plat_data;
> -	struct device_node *child;
>  	void __iomem *port_mmio;
>  	u32 port, dmacr, ts;
>  
> @@ -271,14 +270,12 @@ static int ahci_dwc_init_dmacr(struct ahci_host_priv *hpriv)
>  	 * the HBA global reset so we can freely initialize it once until the
>  	 * next system reset.
>  	 */
> -	for_each_child_of_node(dpriv->pdev->dev.of_node, child) {
> +	for_each_child_of_node_scoped(dpriv->pdev->dev.of_node, child) {
>  		if (!of_device_is_available(child))

for_each_available_child_of_node_scoped()?

>  			continue;
>  
> -		if (of_property_read_u32(child, "reg", &port)) {
> -			of_node_put(child);
> +		if (of_property_read_u32(child, "reg", &port))
>  			return -EINVAL;
> -		}
>  
>  		port_mmio = __ahci_port_base(hpriv, port);
>  		dmacr = readl(port_mmio + AHCI_DWC_PORT_DMACR);


