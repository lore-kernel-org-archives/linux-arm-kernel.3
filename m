Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10192D26D7B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 17:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrvaMEFksRwNf+9QjYnHfEu8TPiJ1u3+Dlfy3rKK+wE=; b=EqN6l1FRzU0K7LEvZW3Owl1NG0
	EUyqyob53Sh8gC/TClZhzD37ukVY5M7hibr03Nl6+pnzfBzy3jHFnrUPSe3xKzZKMN+0J5tfZ+FNo
	j9r9YSHqi2kyDhtd68uLuZeDfZlJsq3XktRQNBHWybmsGbNmXarseSG3GLixLLIOl6sq0b0fR1WoD
	k/f8Kg1iv+PIRrlrq4CjmU4BlhdaWaPavPoIjUu97oUzNqwe26N4o1t10MhcXAuUjUC8pnD3NttSO
	1pHQKPNPDg1mtyJDUxqvvdCRX2Y5Lq1FPP/kHYlV3A6ZfVWcJPhKejsnbVa5WwrlkN2njwZ5V5iwO
	BXD9RY4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGBX-00000002nZT-0ifm;
	Fri, 09 Jan 2026 17:22:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGBW-00000002nZJ-1VuS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 17:22:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A89560178;
	Fri,  9 Jan 2026 17:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F1AC4CEF1;
	Fri,  9 Jan 2026 17:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767979321;
	bh=G0CdK1BbKzMKU+qqbitcHl4o9Pf/LHQ1vf98qGeQbYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fMWxy9I1T3LHdLmPtdMUL88DS3wYXB71qViQVOCn0+8QCbajTFBrfCs8mqRUXy+Y4
	 4E+eBYsitwzT/qE/4+xLri8dA5feTyUtep33ImpFVLB2+Wxssd+JDlhKBMSAEgTwgb
	 jnchWeKlErbxlJm9dPOlSzhoP46/HA2MEdAQR6j1cvUjT1Z48s7+DCjf3C8gGAwNSr
	 BUXYSgbI6w2J7+HijlF38X8OoLlcZ7PktPyZMuYV6gFQjkfwBvlk7LRC/7Nd22e6Z+
	 gB/+xmfzZzhw6BchvPsR2Qael3H05SiSbrl7pdb++/DLGljx6tybl/LamhByeVke5T
	 r+n5loRskMeeA==
Message-ID: <48faa7b1-d486-406a-a8c4-a1c9609e7fc6@kernel.org>
Date: Fri, 9 Jan 2026 18:21:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] powerpc/fsp2: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Russell King <linux@armlinux.org.uk>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-clk@vger.kernel.org, imx@lists.linux.dev, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
 <20260109-of-for-each-compatible-scoped-v3-4-c22fa2c0749a@oss.qualcomm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-4-c22fa2c0749a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 09/01/2026 à 17:57, Krzysztof Kozlowski a écrit :
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
> 
> Depends on the first patch.
> ---
>   arch/powerpc/platforms/44x/fsp2.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/44x/fsp2.c b/arch/powerpc/platforms/44x/fsp2.c
> index f6b8d02e08b0..b06d9220844c 100644
> --- a/arch/powerpc/platforms/44x/fsp2.c
> +++ b/arch/powerpc/platforms/44x/fsp2.c
> @@ -199,16 +199,14 @@ static irqreturn_t rst_wrn_handler(int irq, void *data) {
>   
>   static void __init node_irq_request(const char *compat, irq_handler_t errirq_handler)
>   {
> -	struct device_node *np;
>   	unsigned int irq;
>   	int32_t rc;
>   
> -	for_each_compatible_node(np, NULL, compat) {
> +	for_each_compatible_node_scoped(np, NULL, compat) {
>   		irq = irq_of_parse_and_map(np, 0);
>   		if (!irq) {
>   			pr_err("device tree node %pOFn is missing a interrupt",
>   			      np);
> -			of_node_put(np);
>   			return;
>   		}
>   
> @@ -216,7 +214,6 @@ static void __init node_irq_request(const char *compat, irq_handler_t errirq_han
>   		if (rc) {
>   			pr_err("fsp_of_probe: request_irq failed: np=%pOF rc=%d",
>   			      np, rc);
> -			of_node_put(np);
>   			return;
>   		}
>   	}
> 


