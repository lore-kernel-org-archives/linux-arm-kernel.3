Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3394EB7EA1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85L/7Hr747a8G/82IzAVHIbDO+NM/sNeFzNtQkKnSck=; b=A1m6A1nXbWMidMaM8hFZI67Ilg
	focZYowHER7nRpO6YNwTz0g59jR1hkflh7hgzt3pvPWXVqkTkbe9n3IFn4BHqztMenICNDgYIufg2
	SfQi4ug0VM0F1Pv9eRCtlT4ODtfi3GUBai0klYY57+PfMJAcAegJuybGW8wxEtV5DnOP/RZADMG/1
	soxxj25s/DR3/7SE+synHDKE2BP4NfdsSUah7eKkShQtc+2knqhzyAJBEhcIP278uGSz4/3+cgwkT
	MM7nDIGmegB4vpXrbBcQi2+miSN66bMj/HTszoBE3elhN6cDGE0T7jptgeJPZHJwEziJszzYMUKWO
	sGg7P0cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhe2-0000000Gkc1-3UnU;
	Wed, 04 Mar 2026 08:31:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhe2-0000000Gkbs-0frt;
	Wed, 04 Mar 2026 08:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=85L/7Hr747a8G/82IzAVHIbDO+NM/sNeFzNtQkKnSck=; b=X8fRgwWYRwQItjStX3HUSOAS9T
	5F3ML/5zvm0nuSxsH6eVr3P+U1IBmZtqKicXAyMKjXrb9MOo3sS0Nkenpndlo8m1sqFbxF0Pqfi/p
	heBG/Ax2Su++vp/pQ01Y2xr6ePh7H+h2/RZbPF7Knu50uT7zlXkHS/S3T9KueOyY8LbrAFRO3SQgx
	za8F0QVr0T/4lweYQWU0fy6nCIH63+gCDSybsIvxMA3iD7I5jeAaj7yawSvyGpJLjeMJD9O6z85F1
	I6IwpKd2kTZl69JNmDpaLq1pbQonWjqILLdTfUgxjpYjyVK1yEMWPCp5aLrgIjkcHszzR0Wjm25LS
	o24a8TIA==;
Received: from mx.socionext.com ([202.248.49.38])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhdy-000000048MG-2DyE;
	Wed, 04 Mar 2026 08:31:49 +0000
Received: from unknown (HELO kinkan3-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 04 Mar 2026 17:31:37 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by kinkan3-ex.css.socionext.com (Postfix) with ESMTP id B44312069FEA;
	Wed,  4 Mar 2026 17:31:37 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Wed, 4 Mar 2026 17:31:37 +0900
Received: from [10.212.247.202] (unknown [10.212.247.202])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 67D1810A016;
	Wed,  4 Mar 2026 17:31:37 +0900 (JST)
Message-ID: <32838929-e5ed-4796-845b-ce45712a440b@socionext.com>
Date: Wed, 4 Mar 2026 17:31:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: uniphier-usb3: no devm for nvmem_cell_get
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "moderated list:ARM/UNIPHIER ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260304041602.7539-1-rosenp@gmail.com>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <20260304041602.7539-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_083146_950524_6E20D117 
X-CRM114-Status: GOOD (  15.98  )
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

Hi Rosen,

On 2026/03/04 13:16, Rosen Penev wrote:
> There is absolutely no reason to extend the lifetime of nvmem_cell_get
> to after removal of the driver. Use and free right after use.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   drivers/phy/socionext/phy-uniphier-usb3hs.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/socionext/phy-uniphier-usb3hs.c
> b/drivers/phy/socionext/phy-uniphier-usb3hs.c
> index 8c8673df0084..c8971eee3640 100644
> --- a/drivers/phy/socionext/phy-uniphier-usb3hs.c
> +++ b/drivers/phy/socionext/phy-uniphier-usb3hs.c
> @@ -104,11 +104,12 @@ static int uniphier_u3hsphy_get_nvparam(struct
> uniphier_u3hsphy_priv *priv,
>   	struct nvmem_cell *cell;
>   	u8 *buf;
>   
> -	cell = devm_nvmem_cell_get(priv->dev, name);
> +	cell = nvmem_cell_get(priv->dev, name);
>   	if (IS_ERR(cell))
>   		return PTR_ERR(cell);
>   
>   	buf = nvmem_cell_read(cell, NULL);
> +	nvmem_cell_put(cell);
>   	if (IS_ERR(buf))
>   		return PTR_ERR(buf);
>   

Looks good to me.
This function is called multiple times and creates a cell each time,
so it's probably better to delete it after using it.

Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Thank you,

---
Best Regards
Kunihiko Hayashi

