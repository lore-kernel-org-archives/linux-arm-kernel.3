Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC26DCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 22:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehQ7mVBa+qZzMlqKHomdvNj5vjtqdC5856eNsb/cSyQ=; b=pvXcCvxpvYSYJytKOr7jZxDWzb
	0ReMj4xhpwL0Ey73n/CDoMXf1W/PJDkD35iwkz4mF8eD1V7ZjpXDrFXK118sPSQyQiMCjOxrmTMvT
	PyEL5ytumqZNa6ySXPnEzAt03SO4qDBSi/zraiOkS5PaWcfRh0BqWwiqDZ89wHg6HUaYAYvpCPulz
	X68ToY2IR0l/WXnP+h1EDsgDoWXi87CHMdcLvUpMp4nvwc4D5Oac3Cn8zN3xq9nWz/apjFlxE/NWI
	wA6PRaRWGe1cKQaG2LJb3y19nwQhTbCPanfy+bqlbj89AdyUAeWNfoL3KnQ5azAP3gyuQCks5EHzG
	n+C4quPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPpnc-000000064z6-47bG;
	Wed, 20 May 2026 22:54:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPpna-000000064yD-2TMy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 22:53:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779317637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ehQ7mVBa+qZzMlqKHomdvNj5vjtqdC5856eNsb/cSyQ=;
	b=YpB05nDb8igYIJ+ZhL+9T9+/YoJBqQr/0y2VaarapARr5K5lCBZ0GudtxI9Y9GxPDkv+w8
	/RjKLhc01E6WA9pGTuvxs1XbDJHlKdVl/0FFO9EZ7+CQkkNdLQ4etyMPxXbnkNcz72kmNh
	p8YRQLCkmbp5ZQVMMw64P/CXVM2Ep78=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-LuLKBH57Or64bHZbJ-x8Ow-1; Wed, 20 May 2026 18:53:55 -0400
X-MC-Unique: LuLKBH57Or64bHZbJ-x8Ow-1
X-Mimecast-MFC-AGG-ID: LuLKBH57Or64bHZbJ-x8Ow_1779317634
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50faf575af4so147742051cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 15:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779317634; x=1779922434;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ehQ7mVBa+qZzMlqKHomdvNj5vjtqdC5856eNsb/cSyQ=;
        b=DuIT849UJzUeE1qe4R7zjTmM/Xq8+D/6BKoD/fppigks/1ux3pX89ByKRWfs5FXNOK
         jutTKzonwYFZTPczG+MBnmE6rCJ8uJJxhD+uqNOv92a67anl88VgQJcTi4lQMmnmVzAK
         O/13UfZXqjlIPQQGinbu1rs839ZqhkxrpWuFqgRzRZqwxV3ISYDoQI/fthvB1PIfb2EX
         OLVkkxsam+sN9ZLywA9AVITi0HWrhqGVT/MgMPbDke0DnGpnmZ2gcNUpCUFYbLkkPCGJ
         UNYCoo2WBtk1VdmfYs08v1DnnWU5cDHJQx3ztGoENuoShshFGoBBZEnOILQlyh2BG5z9
         NE3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+/LlJw2eLCP+wRP1AyXDPmEyDe9GkFTawAz5LgWgtHTQIuICgip41PDJ4PGnIT8Egn1N2Ojwo1POCXF7j9HRHB@lists.infradead.org
X-Gm-Message-State: AOJu0YzxoCj8JF2Qk1jtFXTVKcY54yI/kqQlG5QrHs9ceejieCs0T3le
	ZAp3nRl3kD1vQ8ZenIQeEX5AOsoRuEyii4QLKGITmzMbAbJziLqp+U/du/kXarjxFb9OrSdx4CC
	s463zDlftrvFf9InFQqFkhbPlU+xax5G1NlZ84NuywlWO3e4mrZkSq3AQInDjlXaY9sqSu7M4QZ
	5X
X-Gm-Gg: Acq92OHFVaURwi/N7M8tywcJRrFy81laLjwy5ZsgMzRXB1K+ZLCbFGkDhJCtp30gA1u
	vU1FpWpZG4lwn0IlTGW6TB51ObHO6cMnviqlJHewCxY1XDuQiO/4VnEpeCnCF7OmJrRf14eLpQ4
	iCGISoVoFLjz3q3kBXZvI0RPNwB49g1fRIpNbr1NTWxLv46KNr3t1PgbhhlBo04r++cTISrDtoQ
	7z7HHnOI/qeVyKnyl/QAwgGMBwrK0uvaRuEDYywanMtuSKy/0iCQMbfCFJK9oyt3AbABsrbzuOR
	3pW0ssjuvHWdRb36q0NjYYyxeuDV+uQoCeQH1xlNZIlKMC+/WZzOYrEpBJWaGHA3f2e/XVC0hPE
	aZ7X/e4o2DZanLSlnNimYaQo5528=
X-Received: by 2002:ac8:5d4c:0:b0:50e:6399:eed3 with SMTP id d75a77b69052e-516c54557c3mr7169981cf.20.1779317634519;
        Wed, 20 May 2026 15:53:54 -0700 (PDT)
X-Received: by 2002:ac8:5d4c:0:b0:50e:6399:eed3 with SMTP id d75a77b69052e-516c54557c3mr7169681cf.20.1779317634055;
        Wed, 20 May 2026 15:53:54 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516514e0b91sm191843371cf.15.2026.05.20.15.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 15:53:52 -0700 (PDT)
Date: Wed, 20 May 2026 18:53:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v8 3/5] clk: en7523: Add support for selecting the Serdes
 port in SCU
Message-ID: <ag47f8ZgCEZJurHE@redhat.com>
References: <20260520150912.11614-1-ansuelsmth@gmail.com>
 <20260520150912.11614-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260520150912.11614-4-ansuelsmth@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RopU1sYP1kIMfy_X38fWP2PqAOaYoDOBGVtrqFOw2os_1779317634
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_155358_690369_E5FFA555 
X-CRM114-Status: GOOD (  26.34  )
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

Hi Christian,

On Wed, May 20, 2026 at 05:09:08PM +0200, Christian Marangi wrote:
> In the SCU register for clock and reset, there are also some register to
> select the Serdes port mode. The Airoha AN7581 SoC have 4 different Serdes
> that can switch between PCIe, USB or Ethernet mode.
> 
> Add a simple PHY provider that expose the .set_mode OP to toggle the
> requested mode for the Serdes port.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/clk/Kconfig      |   1 +
>  drivers/clk/clk-en7523.c | 216 ++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 214 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index b2efbe9f6acb..e60a824b5117 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -221,6 +221,7 @@ config COMMON_CLK_EN7523
>  	bool "Clock driver for Airoha/EcoNet SoC system clocks"
>  	depends on OF
>  	depends on ARCH_AIROHA || ECONET || COMPILE_TEST
> +	select GENERIC_PHY
>  	default ARCH_AIROHA
>  	help
>  	  This driver provides the fixed clocks and gates present on Airoha
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 1ab0e2eca5d3..d4b73c5f15b9 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -6,14 +6,18 @@
>  #include <linux/io.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/platform_device.h>
> +#include <linux/phy.h>
> +#include <linux/phy/phy.h>
>  #include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/reset-controller.h>
> +#include <linux/spinlock.h>
>  #include <dt-bindings/clock/en7523-clk.h>
>  #include <dt-bindings/reset/airoha,en7523-reset.h>
>  #include <dt-bindings/reset/airoha,en7581-reset.h>
>  #include <dt-bindings/clock/econet,en751221-scu.h>
>  #include <dt-bindings/reset/econet,en751221-scu.h>
> +#include <dt-bindings/soc/airoha,scu-ssr.h>
>  
>  #define RST_NR_PER_BANK			32
>  
> @@ -40,9 +44,22 @@
>  #define   REG_HIR_MASK			GENMASK(31, 16)
>  /* EN7581 */
>  #define REG_NP_SCU_PCIC			0x88
> +#define REG_NP_SCU_SSR3			0x94
> +#define REG_SSUSB_HSGMII_SEL_MASK	BIT(29)
> +#define REG_SSUSB_HSGMII_SEL_HSGMII	FIELD_PREP_CONST(REG_SSUSB_HSGMII_SEL_MASK, 0x0)
> +#define REG_SSUSB_HSGMII_SEL_USB	FIELD_PREP_CONST(REG_SSUSB_HSGMII_SEL_MASK, 0x1)
>  #define REG_NP_SCU_SSTR			0x9c
>  #define REG_PCIE_XSI0_SEL_MASK		GENMASK(14, 13)
> +#define REG_PCIE_XSI0_SEL_PCIE		FIELD_PREP_CONST(REG_PCIE_XSI0_SEL_MASK, 0x0)
> +#define REG_PCIE_XSI0_SEL_XFI		FIELD_PREP_CONST(REG_PCIE_XSI0_SEL_MASK, 0x1)
> +#define REG_PCIE_XSI0_SEL_HSGMII	FIELD_PREP_CONST(REG_PCIE_XSI0_SEL_MASK, 0x2)
>  #define REG_PCIE_XSI1_SEL_MASK		GENMASK(12, 11)
> +#define REG_PCIE_XSI1_SEL_PCIE		FIELD_PREP_CONST(REG_PCIE_XSI1_SEL_MASK, 0x0)
> +#define REG_PCIE_XSI1_SEL_XFI		FIELD_PREP_CONST(REG_PCIE_XSI1_SEL_MASK, 0x1)
> +#define REG_PCIE_XSI1_SEL_HSGMII	FIELD_PREP_CONST(REG_PCIE_XSI1_SEL_MASK, 0x2)
> +#define REG_USB_PCIE_SEL_MASK		BIT(3)
> +#define REG_USB_PCIE_SEL_PCIE		FIELD_PREP_CONST(REG_USB_PCIE_SEL_MASK, 0x0)
> +#define REG_USB_PCIE_SEL_USB		FIELD_PREP_CONST(REG_USB_PCIE_SEL_MASK, 0x1)
>  #define REG_CRYPTO_CLKSRC2		0x20c
>  /* EN751221 */
>  #define EN751221_REG_SPI_DIV		0x0cc
> @@ -81,6 +98,8 @@ enum en_hir {
>  	HIR_MAX		= 14,
>  };
>  
> +#define EN_SERDES_PHY_NUM		4
> +
>  struct en_clk_desc {
>  	int id;
>  	const char *name;
> @@ -113,6 +132,18 @@ struct en_rst_data {
>  	struct reset_controller_dev rcdev;
>  };
>  
> +struct en_serdes_phy_instance {
> +	struct phy *phy;
> +	unsigned int serdes_port;
> +};
> +
> +struct en_clk_priv {
> +	void __iomem *base;
> +	/* protect SCU register */
> +	spinlock_t lock;

This spinlock is not initialized with spin_lock_init(). You can do this in
en7523_clk_probe() after devm_kzalloc().

With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>


