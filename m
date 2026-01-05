Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793B8C2A074
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 10:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUMJp2MwlSAyE8trIJFUgdegQl5OGt6hp8S/A6I+zUg=; b=hFV52PEfnYFtviwgmegm+W7JIy
	pPuucM+bbpvsT8V61Zx+isnnMC3oAAuce1yl84tAC+ek2opjVcSFPj9r6nlyqeMke9xjDRG5nO3aX
	o1AcZhPFnPTe4LkHHPrBF0lcTS/yFTrlxplHm4jd4MDiwSlHV1YtHdNxpGJ+k3urugSkeMyiAXEyc
	FvqftFtI6YKigN2yQCRuN27r77TZnPBnqmF3eS+ifd+Tu8wzUNKXiutftW3efybm5Ux4xaKuDT2XW
	giR0FSl50jqzd0eDxS62Z+6lJvd85i9Ev77+hIsCduhqniAjx/NX1E4+1nhJvjjy25m8ht0dl1P90
	ItRLSx2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vchwj-0000000B7RH-2JGP;
	Mon, 05 Jan 2026 10:36:21 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vchwh-0000000B7Qp-117S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 10:36:20 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dl9fp080yzJ46jg;
	Mon,  5 Jan 2026 18:35:14 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 3CC8C40086;
	Mon,  5 Jan 2026 18:36:14 +0800 (CST)
Received: from localhost (10.48.146.88) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 5 Jan
 2026 10:36:13 +0000
Date: Mon, 5 Jan 2026 10:36:11 +0000
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
Subject: Re: [PATCH 2/3] PCI: pnv_php: Simplify with scoped for each OF
 child loop
Message-ID: <20260105103611.0000788f@huawei.com>
In-Reply-To: <20260102124900.64528-5-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124900.64528-4-krzysztof.kozlowski@oss.qualcomm.com>
	<20260102124900.64528-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.146.88]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_023619_425097_E358C886 
X-CRM114-Status: GOOD (  13.60  )
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

On Fri,  2 Jan 2026 13:49:02 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  drivers/pci/hotplug/pnv_php.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
> index c5345bff9a55..0d80bee284e0 100644
> --- a/drivers/pci/hotplug/pnv_php.c
> +++ b/drivers/pci/hotplug/pnv_php.c
> @@ -215,24 +215,19 @@ static void pnv_php_reverse_nodes(struct device_node *parent)
>  static int pnv_php_populate_changeset(struct of_changeset *ocs,
>  				      struct device_node *dn)
>  {
> -	struct device_node *child;
> -	int ret = 0;
> +	int ret;
>  
> -	for_each_child_of_node(dn, child) {
> +	for_each_child_of_node_scoped(dn, child) {
>  		ret = of_changeset_attach_node(ocs, child);
> -		if (ret) {
> -			of_node_put(child);
> -			break;
> -		}
> +		if (ret)
> +			return ret;
>  
>  		ret = pnv_php_populate_changeset(ocs, child);
> -		if (ret) {
> -			of_node_put(child);
> -			break;
> -		}
> +		if (ret)
> +			return ret;
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static void *pnv_php_add_one_pdn(struct device_node *dn, void *data)


