Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B756C83F20
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 10:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzg8lO5KIWEU08V15rBSRsSDmVdIeTgHnB50TvY1vOQ=; b=N7nIcLXKvXJ8PZXgbQ3vwTBf5F
	1apDfQDHmt+R369KQZkKD28x56UzH1tjs/VWxS5owqZwo2zpnRwdXYoPQE+ODFyqp56jZgdsnuSBq
	nf813aOIpKfSnZzr5GwnNQp7WE1vxjEDMZUf8cx9NI78JQP0Qbelj5COu1lLIzyIcGj29yxYSwBfE
	dE8/4gNZPZ6BtU3dmVZKjm1X9T1sdZUb9zSykR6P/rUAMPiu5IDK926UJTFwXUVz7HhlL6afI8hJ+
	NCoMfLt9Rb1F9/KzsZUWdoUFZ2ZBl8wNfVjXpL6IMom1NUU1TcSA6Z1L7TxQuwrd/hqYu0fK7NRo2
	F/x2NTkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaXHn-0000000GWVN-3REB;
	Sat, 12 Jul 2025 10:16:51 +0000
Received: from mx4.wp.pl ([212.77.101.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaXFP-0000000GWLd-1AVA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 10:14:25 +0000
Received: (wp-smtpd smtp.wp.pl 15256 invoked from network); 12 Jul 2025 12:14:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1752315258; bh=mzg8lO5KIWEU08V15rBSRsSDmVdIeTgHnB50TvY1vOQ=;
          h=From:To:Cc:Subject;
          b=a36fHUXOcNPRuUSP7ZQrGd2Vf6g1xWubJpz4W2LR9PcwCuFR7cK6+UhiSmrCE6hJ9
           N5pGQJlvvec5Vwwxsh9agFmMe4kPrBSZoIf/1x0Dk/7wl5+Yvp5fxb8z4pDVG23293
           Vzs9R8ELkvaWQii0UVwYkY++9+T1u8SS7pqqiNdVUOqr+y4iJ6PL6J8q5DIWp4SOZm
           qKoZru5BVAbp2SCrosRxKtUPNPMTtEWGfzz5tLyOAf/TGj7B3Xjf9juc/YO3ajCfwY
           kYQkhwP6EQFZXDvEZAreMfrsSKS0MlJ+mLw4r2hkiJlFG6J3Z3qKBOcGP9UAjur5Ds
           6+j5ixi+Pws6w==
Received: from 89-64-3-180.dynamic.play.pl (HELO localhost) (stf_xl@wp.pl@[89.64.3.180])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <rosenp@gmail.com>; 12 Jul 2025 12:14:18 +0200
Date: Sat, 12 Jul 2025 12:14:18 +0200
From: Stanislaw Gruszka <stf_xl@wp.pl>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MIPS" <linux-mips@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCHv3 wireless-next 3/7] wifi: rt2800soc: allow loading from
 OF
Message-ID: <20250712101418.GD9845@wp.pl>
References: <20250710200820.262295-1-rosenp@gmail.com>
 <20250710200820.262295-4-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710200820.262295-4-rosenp@gmail.com>
X-WP-MailID: d2a620c7c6ee0186a70cc98c7227ea22
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [YQOR]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_031423_786397_66959167 
X-CRM114-Status: GOOD (  23.89  )
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

On Thu, Jul 10, 2025 at 01:08:16PM -0700, Rosen Penev wrote:
> Add a single binding to help the already present dts files load the
> driver. More are possible but there doesn't seem to be a significant
> difference between them to justify this.
> 
> Use wifi name per dtschema requirements.
> 
> The data field will be used to remove the custom non static probe
> function and use of_device_get_match_data.
> 
> Added OF dependency to SOC CONFIG as adding of_match_table without OF
> being present makes no sense.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  drivers/net/wireless/ralink/rt2x00/Kconfig     | 2 +-
>  drivers/net/wireless/ralink/rt2x00/rt2800soc.c | 7 +++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ralink/rt2x00/Kconfig b/drivers/net/wireless/ralink/rt2x00/Kconfig
> index 3a32ceead54f..a0dc9a751234 100644
> --- a/drivers/net/wireless/ralink/rt2x00/Kconfig
> +++ b/drivers/net/wireless/ralink/rt2x00/Kconfig
> @@ -202,7 +202,7 @@ endif
>  
>  config RT2800SOC
>  	tristate "Ralink WiSoC support"
> -	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST
> +	depends on OF && (SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST)
>  	select RT2X00_LIB_SOC
>  	select RT2X00_LIB_MMIO
>  	select RT2X00_LIB_CRYPTO
> diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
> index e73394cf6ea6..db8d01f0cdc3 100644
> --- a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
> +++ b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
> @@ -243,9 +243,16 @@ static int rt2800soc_probe(struct platform_device *pdev)
>  	return rt2x00soc_probe(pdev, &rt2800soc_ops);
>  }
>  
> +static const struct of_device_id rt2880_wmac_match[] = {
> +	{ .compatible = "ralink,rt2880-wifi", .data = &rt2800soc_ops },

Why do .data = rt2800soc_ops here and use it via of_device_get_match_data()
in patch 5, insead of just use rt2800soc_ops directly in rt2800soc_probe ? 

Regards
Stanislaw

> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, rt2880_wmac_match);
> +
>  static struct platform_driver rt2800soc_driver = {
>  	.driver		= {
>  		.name		= "rt2800_wmac",
> +		.of_match_table = rt2880_wmac_match,
>  	},
>  	.probe		= rt2800soc_probe,
>  	.remove		= rt2x00soc_remove,
> -- 
> 2.50.0
> 

