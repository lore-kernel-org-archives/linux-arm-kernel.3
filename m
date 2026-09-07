Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECC4C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 09:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjLu9VrLjkkIFyZBHjXkyXbiDTKuqMsK2HnFc+wZ1js=; b=XKJT6+YjLMhROlpIt0Vw4oUK9O
	plhzDRCV+BtxvHNAUyp+xxcGctHo7kdbnXpjdZRwtFgyxx1UrsQrZ2sxEBGLMUDmlLYlIcwChiQXc
	F/K5PZYn3CDxBYAlHCZl9jVTz67Ti3gf6hi7WcFsMtdssnf//J+hjCvZX9swMl7vDfPcNM+3GIJOG
	H+XUSzX4QJCwePu41f0R2Z8qSS901iObyxZoTdthqXupEQsBoR0P7OYBC2iBD8jyoiGWogeJQrNln
	UJ2sI+1/O4W4RoUNl/X4GXfrxUUQ2G5jI3+AdfpIqp5u+kksikpFxw3lfMrYNNeSE5Snbd8gRod71
	Ose0hbww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3VRX-00000006Lvx-1GIz;
	Mon, 07 Sep 2026 09:15:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3VRU-00000006LvL-3rCo;
	Mon, 07 Sep 2026 09:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788772504;
	bh=yAZBsyqAUs5mrF94dZw5BTxiKBfvU5TkPnHaBKxFCrs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oDZsHBddIrpQ1YJt7hAIxSHZzRGcMCY4t0+bAIUzbvZapgskn+gsYmxHXnr/Hbavc
	 9SsTTSRghDCriMKvdiOkYC00DSVpkprvD3EhybYRt1cy7tUiHJIrwWYvTGl8SIuAyw
	 Y+WXr9N5v4Aea4wAyBIPGbCt3pLOibMNkuPwtzFCMa7OCb3RoUDA0/ax1R13vadeZm
	 gSWZxcOuo/8enX5Nk1umBVGaPZ/CmlYQHb9fXUqfDxRY5QYrUEoC8nmG7r3j7Q/fzd
	 56YRkvm0Mkuj9JustA4wCwtaiWevDUiC0XyotMgXupiapDfKBwjKf3hqsDyWcJzwbf
	 4J1NrWiyPegaQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4AF3717E0699;
	Mon, 07 Sep 2026 11:15:03 +0200 (CEST)
Message-ID: <468b57bd-6f82-4dc7-82ad-71838b6ac12b@collabora.com>
Date: Mon, 7 Sep 2026 11:15:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] pinctrl: mediatek: use devm_gpiochip_add_data()
 for GPIO chip
To: Justin Yeh <justin.yeh@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20260723035823.2041832-1-justin.yeh@mediatek.com>
 <20260723035823.2041832-2-justin.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260723035823.2041832-2-justin.yeh@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_021509_118254_03D4E34A 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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

On 7/23/26 05:58, Justin Yeh wrote:
> The gpio_chip is allocated with device-managed memory but registered with
> the non-managed gpiochip_add_data(). This was harmless while the drivers
> were built-in, but once they can be built as modules and unbound/rmmod'd,
> devm frees the gpio_chip's memory while it is still registered, causing a
> use-after-free.
> 
> Register it with devm_gpiochip_add_data() so it shares the same
> device-managed lifecycle, which also lets the manual gpiochip_remove()
> error paths go away.
> 
> Fixes: a6df410d420a ("pinctrl: mediatek: Add Pinctrl/GPIO driver for mt8135.")
> Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implements the vendor dt-bindings")
> Fixes: e78d57b2f87c ("pinctrl: mediatek: add pinctrl-moore that implements the generic pinctrl dt-bindings")
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


