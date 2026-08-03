Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26B8C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptAA2UgbXk0GHtmmP9E3bbEDZbmeRKtWgtxlW5QXXyQ=; b=ZTeYvLXD9PPzGVONsHkQghloC+
	b96H+KzQTiaJYXwLYIfU+qqgR9JAp7LKKgSZSlyU/HlZlNJ50pbIryB/tWtzSRweF/qm3TRsupoHQ
	OUE6ST7yDX5sQIHRCHavqwxZucFyVGj7rB1zu+u3eNHl6twTBcQ/zOna7Udul1RbfbrM7hhhuo3O2
	ljFy0r8hjYeybOBdnlNjOiyCcmmtMoZkA7gAq9XyvYllKTb3rDrf3JCK/Uqlx0ONdCikf+7bpZR45
	ICRoHr+aaMZRZ/Hm8+hDfLF9PWT1bYNhfidKSrUAqCOlNp1Orq2wANOytTIGSoQIe7ZsAYgU3eL+w
	G4oWRCgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqttw-0000000HPyC-3Ira;
	Mon, 03 Aug 2026 14:44:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqttt-0000000HPxC-2kO4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:44:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785768260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ptAA2UgbXk0GHtmmP9E3bbEDZbmeRKtWgtxlW5QXXyQ=;
	b=ISvwtKgbZpBhvK/UiLeEgpRKrxDwXilZzTvtnRwep+ZM0hgqOfoYOwLvC04eKPF3xqKgb5
	KPSKgNYkpSPSY4mj2KPKKzaGUd7dgwyA2r/XNlodiTv4wucErkeJ1q3JWIl3yMIhLjNSbl
	jOgmcjbDGVk0LD8CMH64W/V/Mc6b+NI=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-BfWGQImNOUidWGUoXFobig-1; Mon, 03 Aug 2026 10:44:19 -0400
X-MC-Unique: BfWGQImNOUidWGUoXFobig-1
X-Mimecast-MFC-AGG-ID: BfWGQImNOUidWGUoXFobig_1785768259
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6689c0ac195so12124284d50.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785768259; x=1786373059;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ptAA2UgbXk0GHtmmP9E3bbEDZbmeRKtWgtxlW5QXXyQ=;
        b=at3jisXM675ElJfvMJMOlTzOP0ZXarxy/BrOKXBuTpysruUqsYqxJ6B1nllbKjosmV
         xtN3AvDwR2JJIGFuE+jFNHA1c9j8o6dG2mmV4F1zdADCMy+w/VKQqWxDtE6eTwu45Aa8
         v5/G2k6acQjRCe/sXQ66lFUDu35nktSUTVz+Daek/e7v1ZEBhLjjlTmfFL9v7/dzPXN7
         OXeMFxLWKYx6kYsyjTrTjLH5G1yBoz5gPmUVxrQtsyWcZR3b3dlN6G6m1tbk7vHYD9Mf
         MqI2qhYGqyg1u694Rff4DE5klcKZY+8qv6O2wOAUz+XATVgCq3h5OF7LTNVOiDl9hmE4
         yJjA==
X-Forwarded-Encrypted: i=1; AHgh+Rrb1nIJVrKttOypGU/gg9hIsc1r9hVnigKrcfCWLExpbXzKhy/+vwreHmp7rBWE1/yubRkViRc4H8dYUAJQWtvm@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh/oGQoVclhYhLDqzKnrjfy0M03yg8OlR047Yf9Q1rdxrOaALP
	By2+txTUkgiDiuL0m0PDvh65PmN1GbYPdoQZVDZFNY0I3w3nJO4stQO9S2rCFaY/1TByGja9oS+
	2CLmzWCPtMjRWNRQO7gGju42xkJVTQTGq/1P5CPLP0gLR7gwTI13tNQTHVTRr9oUypIuAEboHcM
	tG
X-Gm-Gg: AR+sD12c9rpU/uIHkDGhL5nhhdnoVzUqzdZ46a3pxH7EVYm/hXf8jelBgrdu2J0NHhK
	oszG3WQBQcjdPdH682KshW7BLAifDRoo2H8IKtVmmYeSR06mz0ZJjwN1UDx1tIiymyJLePiD6j8
	D1WJKOopP1LDsOmTzFONpjk32uPHZgnPIZ5X3FphiAh14NvDMKVrpqr+NZ8cRk8u6ibTaiDj6Jr
	V6LRCkWYQM/T+9kXEtIO/W1zlEjLu04SvXRQ8+Gic8VMKeeaPRLqE7RISrrTJBuOAt7G5ntUCQs
	BowwRJAOk9J/OZ4NP14u635bjwBW8q2zsDUcgyqlCSVeeXDn6YLGGYNLCFk/fQz3LvEmll1vslg
	Ye/g6u+wE8AcVrJlcozMwP7sItnM3hzaJVx0=
X-Received: by 2002:a53:ef09:0:b0:664:e66e:f955 with SMTP id 956f58d0204a3-6694efcd46cmr9652572d50.4.1785768258633;
        Mon, 03 Aug 2026 07:44:18 -0700 (PDT)
X-Received: by 2002:a53:ef09:0:b0:664:e66e:f955 with SMTP id 956f58d0204a3-6694efcd46cmr9652545d50.4.1785768258248;
        Mon, 03 Aug 2026 07:44:18 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66948fcb3acsm5643561d50.10.2026.08.03.07.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:44:17 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:44:15 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 13/25] clk: mediatek: pll: Add ops for PLLs using
 set/clr regs
Message-ID: <anCpP0FlwHdomb_e@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-13-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-13-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -gkoHo4Y_ocieWhaEKBQI9PzB2Vw0KAiuqKzViMM8mo_1785768259
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_074421_756478_356F0F2A 
X-CRM114-Status: GOOD (  26.53  )
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

Hi Louis-Alexis,

On Sat, Aug 01, 2026 at 01:20:59PM +0200, Louis-Alexis Eyraud wrote:
> MT8189 SoC uses a new combination of status and set/clr registers to
> control its PLL enable state and perform BAR reset, that are different
> than the current default clock prepare/unprepare operations are using.
> 
> Add new set of PLL clock operations to support this logic that relies
> on the following registers for prepare/unprepare operations:
>   - en/en_set/en_clr, rather than en register, for PLL enable
>     control
>   - rst_bar/rst_bar_set/rst_bar_clr, rather than default rst_bar
>     register for BAR reset control
> 
> Also, handle rst_bar register setting/clearing with a timeout, to
> verify the operation was correctly performed.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/clk/mediatek/clk-pll.c | 66 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/mediatek/clk-pll.h |  5 ++++
>  2 files changed, 71 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> index 9a197a657dce..3118f68aa9ac 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -9,6 +9,7 @@
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
> @@ -32,6 +33,7 @@
>  #define INTEGER_BITS		7
>  
>  #define PLL_STABILIZATION_DELAY	20 /* in us */
> +#define RST_BAR_TIMEOUT		20 /* in us */
>  
>  int mtk_pll_is_prepared(struct clk_hw *hw)
>  {
> @@ -301,6 +303,60 @@ void mtk_pll_unprepare(struct clk_hw *hw)
>  	mtk_pll_power_off(pll);
>  }
>  
> +int mtk_pll_prepare_setclr(struct clk_hw *hw)
> +{
> +	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
> +	u32 val = 0;
> +	int ret;
> +
> +	mtk_pll_power_on(pll);
> +
> +	writel(BIT(pll->data->pll_en_bit), pll->en_set_addr);
> +
> +	__mtk_pll_tuner_enable(pll);
> +
> +	udelay(PLL_STABILIZATION_DELAY);
> +
> +	if (pll->data->flags & HAVE_RST_BAR) {
> +		writel(pll->data->rst_bar_mask, pll->rst_bar_set_addr);
> +
> +		ret = readl_poll_timeout(pll->rst_bar_addr, val,
> +					(val & pll->data->rst_bar_mask), 1,
> +					RST_BAR_TIMEOUT);
> +		if (ret) {
> +			mtk_pll_unprepare_setclr(hw);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(mtk_pll_prepare_setclr);
> +
> +void mtk_pll_unprepare_setclr(struct clk_hw *hw)
> +{
> +	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
> +	u32 val = 0;
> +
> +	if (pll->data->flags & HAVE_RST_BAR) {
> +		writel(pll->data->rst_bar_mask, pll->rst_bar_clr_addr);
> +
> +		/* ignore return code to continue unpreparing the PLL if
> +		 * a error occurs on register read poll.

Use proper kernel comment:

  /*
   * Ignore return code...
   */

Also s/a error/an error/

With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>


