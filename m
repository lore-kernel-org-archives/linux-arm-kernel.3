Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153E0CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 19:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFChJ8jSCI/61tgwhFtlN2U/Vbd8Nv0Lv5Uk7Dn6t4M=; b=V/KXlCQiximxF4QslUUeQb8XiD
	eET48/zG+eC1n79oxfj+fD9Rs/Q25ZfvRULdvW3Ezyp9uldbXliJCA5BLeZwngPfZNmbYC59suW9R
	v0BELiyynCK+TivN63mAo9Nw+wVv7LMT80YhSkg0CyWB5xE8h6m7A45fO9VWCKIy/GKq+FsGP0O79
	bWqdn6kGHW/phhqVspYoPI0hr6iw53++mh8Qyc9J4L0NqPXpDfQbAbnQIBVGd65VequrwRjWf6Eet
	C3E7StG3S4HxN4YoZ2o7RY5KEySwC+l4KWg4HaXpAJw68z++NN+i6/hM62GhA8hSOLZI7iMHo4x1B
	sri7MkPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL52e-0000000Glo9-3tae;
	Mon, 17 Nov 2025 19:37:36 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL52c-0000000Glnb-1Ed6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 19:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763408252; bh=HJiyM+TjOIWKLKTw7MYVnnaCGoGvZairr1UN5br0BUM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nJNWfesj1FqGsS1ypY+bq/sXkuUl74fn37W7RarPFh73HCQsvKdAz2P/ndimtAyqF
	 2jsPHy+lCQAVDkNHMTL1wme6juoNpIxfd7/DMzFOL1ps4XbyLitDrb709tawQ8P8bW
	 rJg/Xv1wYv6qNLuZwgok+gphpW2ZkKWW85V2mBvzebcocJDOZCCmJS+ExVtc6NzUbm
	 TpFiO0GnT6RL6/RR1XQJ3XcdImv0eTuoomRPca7JHAXr7gw4D/JPS8vDAxcGufbdsw
	 dv6mwwSNw4+4ITFgcrZO0TeIUp9ym+lYOsaDpS05ZCwt9NUDXde4kxSzGSym4+pmzm
	 DCzCH0RyXLflw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 8B9493E1D1D;
	Mon, 17 Nov 2025 19:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763408252; bh=HJiyM+TjOIWKLKTw7MYVnnaCGoGvZairr1UN5br0BUM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nJNWfesj1FqGsS1ypY+bq/sXkuUl74fn37W7RarPFh73HCQsvKdAz2P/ndimtAyqF
	 2jsPHy+lCQAVDkNHMTL1wme6juoNpIxfd7/DMzFOL1ps4XbyLitDrb709tawQ8P8bW
	 rJg/Xv1wYv6qNLuZwgok+gphpW2ZkKWW85V2mBvzebcocJDOZCCmJS+ExVtc6NzUbm
	 TpFiO0GnT6RL6/RR1XQJ3XcdImv0eTuoomRPca7JHAXr7gw4D/JPS8vDAxcGufbdsw
	 dv6mwwSNw4+4ITFgcrZO0TeIUp9ym+lYOsaDpS05ZCwt9NUDXde4kxSzGSym4+pmzm
	 DCzCH0RyXLflw==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id E35743E1D02;
	Mon, 17 Nov 2025 19:37:31 +0000 (UTC)
Message-ID: <0f085940-2214-4d0f-b08b-e4d40b07051b@mleia.com>
Date: Mon, 17 Nov 2025 21:37:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: ohci-nxp: Fix error handling in ohci-hcd-nxp driver
To: Ma Ke <make24@iscas.ac.cn>, stern@rowland.harvard.edu,
 piotr.wojtaszczyk@timesys.com, gregkh@linuxfoundation.org, stigge@antcom.de,
 arnd@arndb.de
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 stable@vger.kernel.org
References: <20251116010613.7966-1-make24@iscas.ac.cn>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20251116010613.7966-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251117_193732_588530_8A8B3746 
X-CRM114-Status: GOOD (  18.12  )
/bin/ln: failed to access 'reaver_cache/texts/20251117_193732_588530_8A8B3746': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_193732_588530_8A8B3746 
X-CRM114-Status: GOOD (  19.80  )
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

On 11/16/25 03:06, Ma Ke wrote:
> When obtaining the ISP1301 I2C client through the device tree, the
> driver does not release the device reference in the probe failure path
> or in the remove function. This could cause a reference count leak,
> which may prevent the device from being properly unbound or freed,
> leading to resource leakage. Add put_device() to release the reference
> in the probe failure path and in the remove function.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 73108aa90cbf ("USB: ohci-nxp: Use isp1301 driver")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>   drivers/usb/host/ohci-nxp.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
> index 24d5a1dc5056..f79558ef0b45 100644
> --- a/drivers/usb/host/ohci-nxp.c
> +++ b/drivers/usb/host/ohci-nxp.c
> @@ -223,6 +223,8 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>   fail_resource:
>   	usb_put_hcd(hcd);
>   fail_disable:
> +	if (isp1301_i2c_client)
> +		put_device(&isp1301_i2c_client->dev);
>   	isp1301_i2c_client = NULL;
>   	return ret;
>   }
> @@ -234,6 +236,8 @@ static void ohci_hcd_nxp_remove(struct platform_device *pdev)
>   	usb_remove_hcd(hcd);
>   	ohci_nxp_stop_hc();
>   	usb_put_hcd(hcd);
> +	if (isp1301_i2c_client)
> +		put_device(&isp1301_i2c_client->dev);
>   	isp1301_i2c_client = NULL;
>   }
>   

For v2 please remove checks for !isp1301_i2c_client as pointed out by Alan Stern,
and then feel free to add

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir

