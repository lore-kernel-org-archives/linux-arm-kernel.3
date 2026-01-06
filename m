Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1A4C47BDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 10:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YofzUWWUbXFyzC0jSht6vCG8DZDYif+vmqb0NDO6BzY=; b=L1/VsubpdwY36nvcT8WZqPTJew
	nAGhc2GkhcV2Hu4TbhWODGR2JsQ+WeINWskT6pS4vvJ+plModoPAPpD+HUOSEdKB7oL53Gdrt+Qg/
	2xq2ZiA2wQzzj57IbCCkdZjL7TKtChZC5xTPXbrhf2pC67WjXbYJjrigqPWRRvCaE4yhwjG68vHFG
	5MQnQ7xAhUGvYwo1XTWfk/+6a5qQqmdfeGQn3FuJKuSW4pi3YtOvwHFttPzURHXnooTkLenyABDQb
	cN7bxO0YzYEGQlXu0kZN7M2k0lW+lpAvAmRWq1EpVQlkfGAdiXbotYIGvVgR1AR0SJd9KrPB2XNCo
	6yhrPiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4PX-0000000Co1v-10y0;
	Tue, 06 Jan 2026 10:35:35 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4PU-0000000Co1B-2X0x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 10:35:34 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlncL3gwGzHnHGw;
	Tue,  6 Jan 2026 18:35:14 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 7E19C40570;
	Tue,  6 Jan 2026 18:35:18 +0800 (CST)
Received: from localhost (10.48.149.114) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 10:35:15 +0000
Date: Tue, 6 Jan 2026 10:35:12 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
CC: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>, "Saravana
 Kannan" <saravanak@google.com>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, Bill Wendling
	<morbo@google.com>, Justin Stitt <justinstitt@google.com>, Russell King
	<linux@armlinux.org.uk>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, "Nicholas Piggin" <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Nipun Gupta
	<nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>, Abel Vesa
	<abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Michael Turquette
	<mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-clk@vger.kernel.org>, <imx@lists.linux.dev>,
	<dmaengine@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-pm@vger.kernel.org>
Subject: Re: [PATCH 11/11] cpufreq: s5pv210: Simplify with scoped for each
 OF child loop
Message-ID: <20260106103512.00002266@huawei.com>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-11-24e99c177164@oss.qualcomm.com>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
	<20260105-of-for-each-compatible-scoped-v1-11-24e99c177164@oss.qualcomm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.149.114]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_023532_931564_24B5D459 
X-CRM114-Status: GOOD (  22.08  )
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

On Mon, 05 Jan 2026 14:33:49 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.  Note that there is another part of code using "np"
> variable, so scoped loop should not shadow it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Patch is fine so
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Bit odd to use devm_ for a driver that has no real support for being unbound
(looks like it leaks everything if that happens) but to me it looks like
it might be worth doing anyway to allow direct returns in error
cases etc.  Anyhow, that's a much bigger looking project and would need
a devm_add_action_or_reset() for the final register and someone to test
it doesn't blow up if an unbind does happen.

One of the things I like about reviewing this sort of cleanup series
is it makes me look at a bunch of code I'd never normally go see ;)

Jonathan

> 
> ---
> 
> Depends on the first patch.
> ---
>  drivers/cpufreq/s5pv210-cpufreq.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
> index ba8a1c96427a..e64e84e1ee79 100644
> --- a/drivers/cpufreq/s5pv210-cpufreq.c
> +++ b/drivers/cpufreq/s5pv210-cpufreq.c
> @@ -629,19 +629,17 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
>  		goto err_clock;
>  	}
>  
> -	for_each_compatible_node(np, NULL, "samsung,s5pv210-dmc") {
> -		id = of_alias_get_id(np, "dmc");
> +	for_each_compatible_node_scoped(dmc, NULL, "samsung,s5pv210-dmc") {
> +		id = of_alias_get_id(dmc, "dmc");
>  		if (id < 0 || id >= ARRAY_SIZE(dmc_base)) {
> -			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", np);
> -			of_node_put(np);
> +			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", dmc);
>  			result = id;
>  			goto err_clk_base;
>  		}
>  
> -		dmc_base[id] = of_iomap(np, 0);
> +		dmc_base[id] = of_iomap(dmc, 0);
>  		if (!dmc_base[id]) {
>  			dev_err(dev, "failed to map dmc%d registers\n", id);
> -			of_node_put(np);
>  			result = -EFAULT;
>  			goto err_dmc;
>  		}
> 


