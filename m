Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0946BC021B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 09:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lV30hEBZWC7S4rSDYnKgsoznUoPxWCDHm7ubHwj+3ww=; b=mgHn9oEtyZzQCv579E1smw5MHA
	n9MKH6w6mX42ekrr8WDdS124Kt7EHrFe49AIAazFbZ1U4fYTNbHIMm4brxzTEwAm0LvZR5QwzCqaZ
	pZq5+I5pxWPsY8npe3Gn8HRaq5P7Ih3s86FIXYP7p9HYNxKTVAN01/edyDbAJA/+ubc6Xe3a36mey
	Bj5ejOmOPKySf9ShtXBwCN8tpPf9wh4TJEbUdvek0uNolQRLTrCmQr4fI3ZjKR7JERczoEW0GRJoM
	WnnHFLw0RkdJWLnWHwGi0QkZzD0VsKQeT0k+y9u0seNloL86PURqHCa3fjNoZgUoHm/N/RdPF0+xp
	V9bioj1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmriB-0000000Gihx-3sJV;
	Tue, 25 Feb 2025 09:58:48 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqtR-0000000GVqT-1DJT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:06:22 +0000
Message-ID: <437d4fad-6cd4-4f90-a1bb-07193d015cad@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740474378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lV30hEBZWC7S4rSDYnKgsoznUoPxWCDHm7ubHwj+3ww=;
	b=RZU30SkkWMDPf0R4W8ZcMdFVMAMhESLDuqfrOaBfZ2FhTz1FNYwNnhjHcyhSE7ivfaLIMv
	GAaE7ySpqQEbYPn6gyP79F+9JJPtUwG1C/mOK6wHF9a18rdSVPQLeMNpU2+mwVzZm1RCuD
	KhxroJ3p9YDVD3jJd4qYotSalUSgK+k=
Date: Tue, 25 Feb 2025 17:06:10 +0800
MIME-Version: 1.0
Subject: Re: [PATCH net-next v3 2/4] stmmac: loongson: Remove surplus loop
To: Philipp Stanner <phasta@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Huacai Chen <chenhuacai@kernel.org>, Yinggang Gu <guyinggang@loongson.cn>,
 Feiyang Chen <chenfeiyang@loongson.cn>, Philipp Stanner
 <pstanner@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Qing Zhang <zhangqing@loongson.cn>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250224135321.36603-2-phasta@kernel.org>
 <20250224135321.36603-4-phasta@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250224135321.36603-4-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_010621_473389_CCC09826 
X-CRM114-Status: GOOD (  16.43  )
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


在 2/24/25 9:53 PM, Philipp Stanner 写道:
> loongson_dwmac_probe() contains a loop which doesn't have an effect,
> because it tries to call pcim_iomap_regions() with the same parameters
> several times. The break statement at the loop's end furthermore ensures
> that the loop only runs once anyways.
>
> Remove the surplus loop.
>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

It seems that the fix-tag has been forgotten, next two patches as well.


Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng

> ---
>   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> index 73a6715a93e6..e3cacd085b3f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> @@ -554,14 +554,9 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
>   	pci_set_master(pdev);
>   
>   	/* Get the base address of device */
> -	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
> -		if (pci_resource_len(pdev, i) == 0)
> -			continue;
> -		ret = pcim_iomap_regions(pdev, BIT(0), DRIVER_NAME);
> -		if (ret)
> -			goto err_disable_device;
> -		break;
> -	}
> +	ret = pcim_iomap_regions(pdev, BIT(0), DRIVER_NAME);
> +	if (ret)
> +		goto err_disable_device;
>   
>   	memset(&res, 0, sizeof(res));
>   	res.addr = pcim_iomap_table(pdev)[0];

