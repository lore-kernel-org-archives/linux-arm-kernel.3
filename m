Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D76C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=homWq+S4D1nNuu+NtfzR+49sxpUzkLg5taBipS4WfAw=; b=wab4umgpy3gAcFrPbQlqR0X0OU
	6qY/xYSgwRcvey4Db0uTl1lq3BM2PalQd9P6ECe68mVFVtn4P86/eJaANoq7xFWjcZxYIUDMa1hqq
	DgBLseqhqEHrsIIv5aMwwu6vr7lxOYd1yg99GiwXy8hs+A6sOz1HA8czS4DnUZyILxYDPfVQFbSEO
	ZnG+nshb9b1/fmILDyVnY4jugNFYqiDBNV0WAT5LllEUERLsfMejs7OmEDw4oek5n2aqqK5iuCvAp
	I25f88b6B0L6XxQq7gqNPqLx9sht+yl8wtYwkYKBZ2mVy222E/j4GTkmtwj3jPCXttsyjZkQ8zRhj
	5LjU/0aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSNX-0000000BGDg-2Ayq;
	Wed, 22 Jul 2026 08:32:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSNT-0000000BGCx-3HnE;
	Wed, 22 Jul 2026 08:32:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784709149;
	bh=4FQG/3+PCJnRx6AG47GAfXdpziU9nwJtfPlED+L0aX4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h+rOqmhMZRj+4zyyfjXhCZeF0HGWVVXAYkiC2/cPAUtTlHEMIBach5jj1K8xgK46V
	 kDkL/8w/kbJ0EfFJabNgK6Lk6iOIp0o4OEMb9CGFx8ZBOgclYnY0XxVszS9EggTf/b
	 QW0FYpqGNIRUaoG9J58rwWu7y1ZJlc37zX7tJ9NSM75Z8qsHxwK0HVrmwZQN9AWSZD
	 CQmq4bXDiKO6sP5ZQxrLLaLWcEQH/s2S1g6iiQ5qumjvyZ8/hqYIFRcejkd9m8fBD5
	 04xvO57R6EiJHDv2EkqYgwnpCchgQ3f900jqSClQ0LLgIuiST40SzF9DY9Cfai2DvE
	 d4x0a5Yld0O6w==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2693917E0177;
	Wed, 22 Jul 2026 10:32:29 +0200 (CEST)
Message-ID: <a642b843-b828-4bb0-96d9-0f0d7466e29d@collabora.com>
Date: Wed, 22 Jul 2026 10:32:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] pinctrl: mediatek: free EINT resources on unbind
To: Justin Yeh <justin.yeh@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260713083808.168957-1-justin.yeh@mediatek.com>
 <20260713083808.168957-3-justin.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260713083808.168957-3-justin.yeh@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_013231_980292_A05234A7 
X-CRM114-Status: GOOD (  23.75  )
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

On 7/13/26 10:37, Justin Yeh wrote:
> mtk_eint_do_init() creates an IRQ domain, populates it with a mapping for
> every EINT line and installs a chained handler on the parent interrupt,
> but none of these are ever released. This was harmless while the drivers
> were built-in, but now that they can be built as modules and
> unbound/rmmod'd it leaves behind a dangling IRQ domain, interrupt mappings
> whose chip data points at freed memory, and a chained handler that keeps
> firing into that freed data.
> 
> The plain allocations in mtk_eint_do_init() already use the device-managed
> devm_*() helpers, so tear the remaining resources down the same way:
> register a devm action that detaches the chained handler, disposes of the
> per-line mappings and removes the IRQ domain. This mirrors the
> device-managed lifecycle adopted for the GPIO chip and keeps the whole
> EINT setup self-cleaning on unbind.
> 
> Fixes: e46df235b4e6 ("pinctrl: mediatek: refactor EINT related code for all MediaTek pinctrl can fit")
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
> ---
>   drivers/pinctrl/mediatek/mtk-eint.c | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> index 47ac92ea98c2..7cd4c4a9fc77 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -12,6 +12,7 @@
>    */
>   
>   #include <linux/delay.h>
> +#include <linux/device.h>
>   #include <linux/err.h>
>   #include <linux/gpio/driver.h>
>   #include <linux/io.h>
> @@ -509,6 +510,24 @@ int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
>   }
>   EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
>   
> +static void mtk_eint_teardown(void *data)
> +{
> +	struct mtk_eint *eint = data;
> +	unsigned int i, virq;
> +
> +	/* Detach the demux handler so it can no longer reference freed data. */
> +	irq_set_chained_handler_and_data(eint->irq, NULL, NULL);

add here:

synchronize_irq(eint->irq);

...so that we don't risk race conditions when tearing down.

after which:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +
> +	/* Dispose of all child mappings before the domain is removed. */
> +	for (i = 0; i < eint->hw->ap_num; i++) {
> +		virq = irq_find_mapping(eint->domain, i);
> +		if (virq)
> +			irq_dispose_mapping(virq);
> +	}
> +
> +	irq_domain_remove(eint->domain);
> +}
> +
>   int mtk_eint_do_init(struct mtk_eint *eint, struct mtk_eint_pin *eint_pin)
>   {
>   	unsigned int size, i, port, virq, inst = 0;
> @@ -601,7 +620,7 @@ int mtk_eint_do_init(struct mtk_eint *eint, struct mtk_eint_pin *eint_pin)
>   	irq_set_chained_handler_and_data(eint->irq, mtk_eint_irq_handler,
>   					 eint);
>   
> -	return 0;
> +	return devm_add_action_or_reset(eint->dev, mtk_eint_teardown, eint);
>   
>   err_eint:
>   	for (i = 0; i < eint->nbase; i++) {


