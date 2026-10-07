Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2504CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 00:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAIWhhMv3PYHKISI/ix1jVDueQPVFVtzNluL37GORz0=; b=vmxaCjKhWHGopaRHsyei3av6oj
	N+96r4pRdy3rltKifyAAJOdhlSkZQbjqqho6o/qv9TgMkvg8E82e9j/Q12rYuAOAZlxrfkMuyzNJa
	0z028fzKlrGIZ2i6BYWOglznOdhKD5aW9L3uLr3OthNG/Nx7F3vUuEcEK7f4fIPZTVxTobuFR0Tbo
	WgU5dR1CR3/wIrqVeu9NNsE54yaE9mRa90pR3a3Ta77sLhLrpftuXnktTm+ZpE8BfQyk4NGAz/ZKJ
	xB0yByVT71FY0iVeM+tG6DBMfbQ4JXMArBjbzI611+Et6dN8gRUd+KHoTeK2MNU+zJXNZEYnpofpE
	VBnA6yHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEFy4-00000001YWb-0xSV;
	Wed, 07 Oct 2026 00:57:12 +0000
Received: from mail-oa2-x0a.google.com ([2607:f8b0:4864:30::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEFy1-00000001YWE-0c8I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 00:57:10 +0000
Received: by mail-oa2-x0a.google.com with SMTP id 586e51a60fabf-4753ef5108aso1563619fac.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 17:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791334627; x=1791939427; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAIWhhMv3PYHKISI/ix1jVDueQPVFVtzNluL37GORz0=;
        b=KAOwcUniKzLuowaWv/7cRGK8TnIVVk6/Wp1OvL3XqmvTzZdsrJTvskcNuAxr5U2644
         vp5V3sSJZgEhyJdu8MToGveyh3kDnLiRGZQ21zNqFr13MFk5K4T/8y6ScCvKXq7rLGsJ
         TZ79TAT2BwBFktqIFEgNTvY5sD4HFQpd2HtTELe9/6oYeT8szNA09aj+BE1HvgqzRRMb
         fIGq55LSajZnD2wQRDiTloIOxxef/PHoDjahAo0gvmsTJjLK+c8Zvx3iSC8XeHBphWrm
         0O0N4R1GmJ3nnaCSbxh3L4z+Kk7lcGXIbV8fTxdhD4K8iHR7MeuSI8Q5JB2rbXcj9TQe
         u75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791334627; x=1791939427;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAIWhhMv3PYHKISI/ix1jVDueQPVFVtzNluL37GORz0=;
        b=Wbf6+YP3Dx/TZfRqeAHnH08UpZwI24dHXdhtLhC72bgHgJYp16wsrZeYwa9MU7pr8A
         ls8U6j/mjkO3yd6m8a8AQc8Uc7Ex0B+ll34TfrK8cGV8KxUvxRRfHBQnfUFlH2RcauKY
         MUBYyeEBzbhV+GP/UORGBAO3XO2Z1dTX6N+MJWLQtgBanKFGAwYLiPznfMNkMR1JS4V5
         Jy7joQ3IP4NJUld8p2seYKSsMNDjPkYqEJR8CZ9Dkb56RbZmqA6XJDpMlS7uvTiJ6TXT
         BL7va5sjWCaYVqc6iP66x7FdTGNhZljd7KiXInoPzHbfp2XL2qWzwDkONDKMLqI8j5QD
         WwTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzD+Be+nb9CDpBGplL4EkSt3/8bAJW27Fqi7cb6C8xlQB7lfD5AM2K/AHRzK+6W6wM88L63zupFgkFTmH39VUjx@lists.infradead.org
X-Gm-Message-State: AFuF++mMmTt65DnCmR3Dmxa3a3SdNgBodvkYkdx+yVH1vR2tY3iXukE4
	iWM+iPXjvVZGRcRInvpl6KIF8v+zxLh68a+sXtxoPI/C5EBKsGpNl7id
X-Gm-Gg: AYBFou09WjZhs8h9YnySVNF/JlRUyydqVu/tW/2dN1gQUu7cZqJVX510HIijATA+iEu
	cXs0C4zHlgXFGQ0okevNOQDJFIQyTWF9TCWmvoSTAK/wi4Yri1Q7/FgLE6/1Pbp4NHfnJJlsSkp
	e5chUQ00JS68ArHgR/bM4i5jLwZhUeIWd6gx1BCkX4EL874lgHwL069BQZRf+tx06s9/c2r8kDC
	tmZVz652uBaVewqLvvGP4doPZe9Ce0XXjV6LbnSQlla0AQ2J5UTkwuofpd35fVXGeCwXF1zRw4X
	f+6naW671C2M2Q6qDye2bOlFaqSwBeYUMaxP++vkPUxi0b9P3rsqmOqvlY/oUjpcaqXLgf7fGRf
	Vp5kHm0ojQmYmXElBbiVgwHpVWUul9NC4YT5vaWz/2pAT+DUn3/X7rE/RQ+dOlLykSW9yFl3SAS
	eOTGfc6ULzn/j3AWLmB011yal1MZvRCJ68D4+FmLZaTWtks1rAYdEq5D8XyxLIpp16U9Pd703Yy
	ApANaMu1sUwN9TwAm13TYnQSYpx3UIhLnosnGK8CkZEsyOHC+Al
X-Received: by 2002:a4a:e90d:0:b0:6dc:e1c3:b2d5 with SMTP id 006d021491bc7-6e7a913602amr915341eaf.75.1791334627605;
        Tue, 06 Oct 2026 17:57:07 -0700 (PDT)
Received: from ?IPV6:2600:100b:b034:8212:4cd5:c80f:ba72:80cb? ([2600:100b:b034:8212:4cd5:c80f:ba72:80cb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a25722e3d8sm1005183fac.15.2026.10.06.17.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 17:57:04 -0700 (PDT)
Message-ID: <d3d3e7b3-eb8b-456d-9a2c-116334e86c14@gmail.com>
Date: Tue, 6 Oct 2026 19:57:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Use a raw spinlock for the
 pinctrl regmap
To: Chen-Yu Tsai <wenst@chromium.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Clark Williams
 <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev, mfd@lists.linux.dev
References: <20260929-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-v1-1-db92943f42cb@gmail.com>
 <20260930080609.dnK1-Uta@linutronix.de>
 <CAGXv+5FssQL3Go3VDFbLAT6HP12RS3U3OgxhYOeapzs64QTdUw@mail.gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <CAGXv+5FssQL3Go3VDFbLAT6HP12RS3U3OgxhYOeapzs64QTdUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_175709_219546_40F54363 
X-CRM114-Status: GOOD (  13.56  )
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

Hi Chen-Yu and Sebastian,

Thanks for looking at this.

On 9/30/26 3:17 AM, Chen-Yu Tsai wrote:
> The syscon node is the provider of the regmap. You need to fix it there,
> not duplicate it in the consumer.

Unless I'm misunderstanding, no driver binds to that node, so its regmap 
comes from the generic syscon code, and changing it there would affect 
every syscon. Lee, Arnd, Mark, would that be acceptable?

These are the options I see. Please let me know if there's a better one:

- Do what Sebastian suggested and make syscon use a raw spinlock, except 
when the node has a clock, since regmap-mmio calls clk_enable() under 
the lock. Off PREEMPT_RT, nothing changes. On RT the lock would no 
longer be preemptible for most syscons, including across bulk writes. 
Most syscon users that do bulk writes only write a few registers, but 
enabling the Amlogic G12A PCIe PLL writes a sequence with 40 us of 
udelay() under the lock.
- Have the pinctrl ioremap() the node a second time alongside syscon's 
mapping and read the input register (DIN) with readl(). That read is the 
only access the EINT code makes in raw context. This would go around the 
syscon, and it requires that DIN never be written in a multi-step 
sequence, which is currently the case.

I'd like to know the best approach before sending out a v2.

Best regards,
Ryan Brue

