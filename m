Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD50C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 09:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIHwGc+AIZ8lVxDMBV0ehqGQy9NFjsr8DOyjvW08ANw=; b=UyfL8lXA+UJjrrIiuQh5cjb5ng
	AoZMi7X2bj2aYypoNJUOZlFpa9MrR4dDtEkKBE3HRVGxSyfddetsBMksh04E5FwZVBQIOAHCY5V8E
	68l8klUiFbTDrJxS7iZDndF+HsO77m3Vgn2Z6XyqTqLENYROQBlqsXzDRuGmhbvoR15nrNwvFxPk4
	t4WAz6JCr8E4LxHHifRfU67w56+ZAVYL1oM6v/ujAKip9kQ26qy6gnRCSKq7v+UAIPGt1mueCEUnU
	HI7Y+2qTlia4HpATaCD7WcBe5knluBSCNzlcyjPDq86y1xBKQHyBegKc9my/eSWAHG4L487FMHtDy
	A5Zj/NtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJJw-0000000CCTH-1hnT;
	Tue, 20 May 2025 09:31:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJ48-0000000C9h4-3cIK;
	Tue, 20 May 2025 09:15:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747732514;
	bh=YOACIVFpfOzkfuJOEv7U1awZi32i31XSCqitokq/3Js=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SVPwpdjEA4jgrbChMjQZi+PNrzVL35YcfMnLrMjiiLRzz7thakSS8XAQUS8hVRZrG
	 +qmGZzYz3i8n2LnIjyh2jIkgiahW2HHL8nMzU6/4EIMqOqvs48qLsy15Z+Iz4wn+zB
	 gV1OoGVNojLGrKA1ycn6U/p1ep07r813PaZLwtLzDNOKScPC7umFGbcfnG/6tyg33k
	 JKFkQ7XeUpo6bINTAfJLOid22gMX/KiOFDOndwL+8NxxG2fDO1FExzNo1MYmp4XNo7
	 hwh/9koFpwGA3drEI/cFy8bjX7+hpf+gCWVF0nznxJbi+zxSiA99OYJ7G43ls3lEei
	 8aLwtdkvWxyHw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C4E5617E0E89;
	Tue, 20 May 2025 11:15:13 +0200 (CEST)
Message-ID: <2f7dffb0-cddd-44c5-a205-30dbc13f9891@collabora.com>
Date: Tue, 20 May 2025 11:15:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: eint: Fix invalid pointer dereference
 for v1 platforms
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hao Chang <ot_chhao.chang@mediatek.com>,
 Qingliang Li <qingliang.li@mediatek.com>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20250519-genio-350-eint-null-ptr-deref-fix-v1-1-07445d6d22c3@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250519-genio-350-eint-null-ptr-deref-fix-v1-1-07445d6d22c3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_021517_052384_4C1D3AB0 
X-CRM114-Status: GOOD (  26.26  )
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

Il 19/05/25 21:38, Nícolas F. R. A. Prado ha scritto:
> Commit 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple
> addresses") introduced an access to the 'soc' field of struct
> mtk_pinctrl in mtk_eint_do_init() and for that an include of
> pinctrl-mtk-common-v2.h.
> 
> However, pinctrl drivers relying on the v1 common driver include
> pinctrl-mtk-common.h instead, which provides another definition of
> struct mtk_pinctrl that does not contain an 'soc' field.
> 
> Since mtk_eint_do_init() can be called both by v1 and v2 drivers, it
> will now try to dereference an invalid pointer when called on v1
> platforms. This has been observed on Genio 350 EVK (MT8365), which
> crashes very early in boot (the kernel trace can only be seen with
> earlycon).
> 
> In order to fix this, given that this if code block is only relevant for
> platforms with multiple EINT bases, and the previous if block already
> handles the single base case, add an else statement so this if condition
> will never even be evaluated on platforms with a single EINT base, which
> covers all v1 platforms following commit fe412e3a6c97 ("pinctrl:
> mediatek: common-v1: Fix EINT breakage on older controllers").
> 
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple addresses")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

I say that this is going to backfire next time.

I would rather propose, instead....

int mtk_eint_do_init(struct mtk_eint *eint, const struct mtk_eint_pin *eint_pin)
{
	...

	[if (or) else if] (eint_pin) {
		eint->pins = eint_pin;
		... etc
	}
}

...so that we avoid having this issue about referencing two different structures
called with the same name (which is bad from the principle anyway), and no more
mistakes around that in the future.

This also means that we can remove the inclusion of pinctrl-mtk-common-v2.h from
the mtk-eint.c file, as that's the right thing to do: eint should be standalone
and should not depend on ambiguous definitions from pinctrl-mtk-common(-v2).h.

Cheers,
Angelo

> ---
>   drivers/pinctrl/mediatek/mtk-eint.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> index 16af6a47028e67bb53db4041a37ebbbb8b9a1e43..9114e0cd9def1bc65558c67317abe67ba63ef1f6 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -531,9 +531,7 @@ int mtk_eint_do_init(struct mtk_eint *eint)
>   			eint->pins[i].index = i;
>   			eint->pins[i].debounce = (i < eint->hw->db_cnt) ? 1 : 0;
>   		}
> -	}
> -
> -	if (hw && hw->soc && hw->soc->eint_pin) {
> +	} else if (hw && hw->soc && hw->soc->eint_pin) {
>   		eint->pins = hw->soc->eint_pin;
>   		for (i = 0; i < eint->hw->ap_num; i++) {
>   			inst = eint->pins[i].instance;
> 
> ---
> base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
> change-id: 20250519-genio-350-eint-null-ptr-deref-fix-1a163aa9ad84
> 
> Best regards,



