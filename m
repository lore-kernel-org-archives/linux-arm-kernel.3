Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29431C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 18:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHshUn4Jqsjc36RFvXDqeUrN9tkhjfQpm1zjkj8ZSrk=; b=Q36TG0prdKlSuLS7yM9BELvwxq
	Co0GNWhAIEulcextbNyhTi+0+w2zQGKxf91B7MTtv4Q6EZfAItEVv657wIiVYKqHkuRgtlenUxMeS
	VOk7nefl7DB2uE5cH+e02/DLPdBdTAR8VHJ1Hyco/90Hhi3QpmZVw1zxJWgF23zwpg9UwORuLljVa
	t7MzjQCkbrXXAgkoc3DYImaI63pbeEp3YBi20aEZwLBGTI3yKvaM9BAOGJvNa1SLPTPk3xQKfecv+
	MAU4AGiaYS/J1WXIlNAAHLPJ8eFKgotfyW6J/Wva+gSIzA/EGUZG6c/yY/B9EqQ2AqbSFuNrzCplB
	S0hd4QqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOG8-000000034zp-0YnP;
	Mon, 14 Jul 2025 18:50:40 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubO5C-000000033Zh-2SKc;
	Mon, 14 Jul 2025 18:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VHshUn4Jqsjc36RFvXDqeUrN9tkhjfQpm1zjkj8ZSrk=; b=6ZlDIXZhD2UmKvILONrgZEctz+
	3bPo9jpQ/hYy+lc/C4aatJppzjAhFZcUq+LZWigfTFhanQxkWf5olK8WVbw40Wl7arvTAaGGwnT+8
	h7Bb3FxhKW7JAl9//aZyzOqAeK3I/qPIXk2c9w825LWBsQKlBsA5rvFPduqVHRM5S00I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ubO4u-001Uus-IQ; Mon, 14 Jul 2025 20:39:04 +0200
Date: Mon, 14 Jul 2025 20:39:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: sayantan.nandy@airoha.com, lorenzo@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: airoha: fix potential use-after-free in
 airoha_npu_get()
Message-ID: <555d7fb6-091e-4c10-bfea-85898e644481@lunn.ch>
References: <20250714175720.3394568-1-alok.a.tiwari@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714175720.3394568-1-alok.a.tiwari@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_113922_627969_8D93086C 
X-CRM114-Status: GOOD (  15.38  )
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

On Mon, Jul 14, 2025 at 10:57:17AM -0700, Alok Tiwari wrote:
> np->name was being used after calling of_node_put(np), which
> releases the node and can lead to a use-after-free bug.
> Store the name in a local variable before releasing the
> node to avoid potential issues.

The description does not match the patch. You are not storing the
name, you are storing a pointer to the name.

> diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
> index 0e5b8c21b9aa8..30cd617232244 100644
> --- a/drivers/net/ethernet/airoha/airoha_npu.c
> +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> @@ -400,11 +400,12 @@ struct airoha_npu *airoha_npu_get(struct device *dev, dma_addr_t *stats_addr)
>  	if (!np)
>  		return ERR_PTR(-ENODEV);
>  
> +	const char *np_name = np->name;
>  	pdev = of_find_device_by_node(np);
>  	of_node_put(np);
>  
>  	if (!pdev) {
> -		dev_err(dev, "cannot find device node %s\n", np->name);
> +		dev_err(dev, "cannot find device node %s\n", np_name);

What you don't describe in the commit message is why the pointer to
the name is valid. After the of_node_put(), the node could be freed,
and i would assume if the node has gone, the name has gone as well.

I think a better fix for this is to move the of_node_put(np) to later.

    Andrew

---
pw-bot: cr

