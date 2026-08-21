Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98617C5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 13:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9s1UfcHDNqIXzR45nqOUNeKt7YkxbIv+ndFl8vRjcQ=; b=gb8kpGPJQ0h5Pbwz0XSdsU0SrT
	TFaw2KqUTBRNd2C9F11HpN/3Wa0/Ajx1I4fPyD9vtSZRqyCd4x323VeJFcVAqrcX9hpWqQOVTZeZu
	l8rg+jrGdFeU9dmxghZi889V+SrOG5KkWzzU1LfNBLi9G2IX5AvsuRNy/Wu/78SoF/KAjh0ltq2Aw
	R4dnImh8bfaxl7hBvKnzqUBiOMbpPGBiqfTgClUHUEUZkgzFgVUaEqyVRslU8x3XfC+WRbNKAj97k
	gqsneQL8nCJ2z4cOU82G0t5yUQXufQTLpg8WvO9GXOm+UwbnH3XlvYxKBIQ15TC2U3nxeYDv0E2ua
	vu/4itjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPWJ-0000000DRr7-2BCO;
	Fri, 21 Aug 2026 13:42:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPWI-0000000DRr1-3UlM
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 21 Aug 2026 13:42:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=N9s1UfcHDNqIXzR45nqOUNeKt7YkxbIv+ndFl8vRjcQ=; b=BL/fbeD1ioVF7vnxD0I2Qkxs0f
	CLN7m9s1msmRWN+LzMqYMbu6LcE0hr9TCKi+BhBbFoxOJGwuGSQF4Bw59h3om13I+xjg6Y+x6Dg9h
	dBAiCGvPCok4t/vf8Au2cqbWR6WbD7klrGk+rmu7hBzEUhzuW32F/pgiSTKArsGDLr3yjX2GucWcv
	8ie+8KUJmJEvKbr003Na/3Qav0dFh2e4ordorinMR7o5iIHKPTTgAGsadOiUbWTj1kRlc+vaJ1kVH
	zuFI6b3RDCz8xu9NSWb//0+0SvolLVoATtguyb1Ib+f/1hMwFIxkdsvRaM75KrkmGieA65u/k12k7
	gZi97Qiw==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wxPWF-00000003njp-1OYl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 13:42:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1787319771; x=1818855771;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OYblkIPvFK3adzhiYE+dB+hoIVTIAB6uHPDQgjSjkgg=;
  b=i8YBCe7qY2ttOpt92QbNqkj4aeiwqJMeLJ1wOss96i03a2d6cHPuyiaS
   VXtmsf+uGp3/djQEf8lH9+vri8NiW3RtdkDoRMwveFsMJxum3tm9FO48h
   fJLbOAaiFACkc/yBNG3aNyTqc5X6tVk5syaluKLM/d50Y6jRVIBpbKD0g
   G5Akaejun1Hyh0Q5JIzYZjZ9xwIegHrjNxXHvWKjOQDTnGQ7Pyh5KoMWr
   YTaSM8+HQVcyAYEakNSD4KgSdNpqoL4yIOfedrUDYhZHKOjREhYkVrBYS
   +0hl31nhnLNkOD8bC1mOiZE1p5hHOhucd5ZymFEOPR8Z96sH54zpRNDeA
   A==;
X-CSE-ConnectionGUID: aCI/hKX0TluHZkJx/PTHRA==
X-CSE-MsgGUID: ds4opapdQQ2FMWxHsv5ymg==
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="293855005"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 06:42:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Fri, 21 Aug 2026 06:42:44 -0700
Received: from [10.171.248.60] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 21 Aug 2026 06:42:42 -0700
Message-ID: <3a3823f1-7dcd-474f-bb81-e5175752f649@microchip.com>
Date: Fri, 21 Aug 2026 15:42:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: at91: main: Drop unneeded cast in
 at91_clk_register_main_osc()
To: Geert Uytterhoeven <geert+renesas@glider.be>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
CC: Kees Cook <kees@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <51abd9177801984889c2a0c321ea8587677178c8.1787316176.git.geert+renesas@glider.be>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <51abd9177801984889c2a0c321ea8587677178c8.1787316176.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_144251_853163_953EB82E 
X-CRM114-Status: GOOD (  14.28  )
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

On 21/08/2026 at 14:44, Geert Uytterhoeven wrote:
> When assigning a non-const pointer to a const pointer, no cast is
> needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Yes, thanks Geert:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
> No changes in generated code.
> ---
>   drivers/clk/at91/clk-main.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/at91/clk-main.c b/drivers/clk/at91/clk-main.c
> index 6074ed2a16cede94..77f905e57e1ab4de 100644
> --- a/drivers/clk/at91/clk-main.c
> +++ b/drivers/clk/at91/clk-main.c
> @@ -170,7 +170,7 @@ at91_clk_register_main_osc(struct regmap *regmap,
>          init.name = name;
>          init.ops = &main_osc_ops;
>          if (parent_data)
> -               init.parent_data = (const struct clk_parent_data *)parent_data;
> +               init.parent_data = parent_data;
>          else
>                  init.parent_names = &parent_name;
>          init.num_parents = 1;
> --
> 2.43.0
> 


