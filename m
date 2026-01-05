Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D25AC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 13:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nW4FzkxLPeaZw8ODTfOg6Tu/LkvVmWEmLVso3YA+EUY=; b=vkvP7HW1qdSh+a6fvZg0G/znXd
	JeeET6adYb+mb0U3tTyjTt3s5J71ZgUeblpSvf0YNi0lkonCrTcv5dnC5wiOkeu0MFc4YdKvO2him
	HJK0yMJT6weyEW97vJ1i7rYOGa4hkI8B6XBEYglZTKOR2we+bgLaYJhTQEfvExVy3P2BSIPkSp2db
	vG2o+J9ROyAYtDgAEVoo9Ez0d1ZlbOTUAAzHSGZYQg7vyDv8O2yfdzJsQEUa9spPragKHalAMUJfH
	+kjFNWg2H7EbbgguhwESlaLpWMHU/5iDos90dDEQlL0VUGyoNpPc/JyImyHZr4dBBd7B5nvNTngPf
	aET3xcNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckqM-0000000BUMx-39f7;
	Mon, 05 Jan 2026 13:41:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckqJ-0000000BUMb-2vRZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 13:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1767620514; x=1799156514;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=a3Sj0a26r3lVQlAJmFwNu/sL9HQAEQqcEw3msVeSpzM=;
  b=vytZmFC1inOCa0CmBOTec6lCQHktGHtYs0j1yF+KbGznCOoobE9c0mb5
   qbsf3pFBLtO7dpMx13/+g9lRkX5viZWKLpDIHKWUTencZzfXW0WWR2W2t
   9SnCJu4av6vtKJ1HwGwPpeCT8+OlH4gFOiohUb5uMtIyq8I6JU6hte+Cg
   PwSdeCtCbF5rBKYj9aTRZu+sArpltNL1v2ynSYOAXQuUgzAVeVf25gp5Y
   1BKgmvPbJvqIVc/JvlFZBim05Hjqj+YCxpr7YChpQ/GpNN/S0iBquzoro
   xaKjXC/fSCf5RztQgM8+G2G0yb9QTK3sXjad6g44c5rNmF7cptvFZ/Ta9
   w==;
X-CSE-ConnectionGUID: HBkZ5l8JRtWI55dHimVviw==
X-CSE-MsgGUID: JZGd2c01Rd6FFUdxsxi0Mw==
X-IronPort-AV: E=Sophos;i="6.21,203,1763449200"; 
   d="scan'208";a="58252843"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Jan 2026 06:41:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 5 Jan 2026 06:41:52 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 5 Jan 2026 06:41:43 -0700
Message-ID: <49ebaa9d-cad9-42cd-8bb9-5210fe18eeb5@microchip.com>
Date: Mon, 5 Jan 2026 14:41:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] ARM: at91: Simplify with scoped for each OF child
 loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Miguel Ojeda
	<ojeda@kernel.org>, Rob Herring <robh@kernel.org>, Saravana Kannan
	<saravanak@google.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
	<morbo@google.com>, Justin Stitt <justinstitt@google.com>, Russell King
	<linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski
	<krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-clk@vger.kernel.org>, <imx@lists.linux.dev>,
	<dmaengine@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-pm@vger.kernel.org>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-2-24e99c177164@oss.qualcomm.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-2-24e99c177164@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_054155_958140_B1E8DF41 
X-CRM114-Status: GOOD (  17.94  )
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

Krzysztof,

On 05/01/2026 at 14:33, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for handling this!
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Best regards,
   Nicolas

> ---
> 
> Depends on the first patch.
> ---
>   arch/arm/mach-at91/pm.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
> index 35058b99069c..68bb4a86cd94 100644
> --- a/arch/arm/mach-at91/pm.c
> +++ b/arch/arm/mach-at91/pm.c
> @@ -982,15 +982,12 @@ static void __init at91_pm_sram_init(void)
>          struct gen_pool *sram_pool;
>          phys_addr_t sram_pbase;
>          unsigned long sram_base;
> -       struct device_node *node;
>          struct platform_device *pdev = NULL;
> 
> -       for_each_compatible_node(node, NULL, "mmio-sram") {
> +       for_each_compatible_node_scoped(node, NULL, "mmio-sram") {
>                  pdev = of_find_device_by_node(node);
> -               if (pdev) {
> -                       of_node_put(node);
> +               if (pdev)
>                          break;
> -               }
>          }
> 
>          if (!pdev) {
> 
> --
> 2.51.0
> 


