Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BFFC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 07:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHpjxRCC9oBEtCC7LwQSVhUBCtPG0Hfe6EOtEGtBLcc=; b=jMMTesOorlsX1bnO8efn7sfAOw
	R8rgK/7ut9MWufwFtwzBADhTLRZ4yljjDCdCHhdxe2LjJ1uhgnUuP5z559ZhO8b+UVIsDRsWaYtsa
	7c0ocfxFoIuremuTadstPTCjBOnHeOYUO7egD/LTOjIRoHJGjkF6Swms7MS5v6YXvcFlwM0WF1sAV
	OCfzi2XYAPlfUvRtNYC2tD8VbdvZwbRg/GTmBvxgF52eOAi2q3SV3ER04OCNQB952Kk8g9RTmdJSl
	PDZRsZrXvJtheZH620VIMf6uy3ZPOdYU0RfVv+kK0hwX0cCaK1uci0OkMH7AWDkYUaOVLJ5SN/eCk
	xCMZ2vmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uar0i-0000000HRwM-3vkm;
	Sun, 13 Jul 2025 07:20:32 +0000
Received: from mx3.wp.pl ([212.77.101.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaqww-0000000HR3n-1qbH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 07:16:40 +0000
Received: (wp-smtpd smtp.wp.pl 33692 invoked from network); 13 Jul 2025 09:16:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1752390996; bh=XHpjxRCC9oBEtCC7LwQSVhUBCtPG0Hfe6EOtEGtBLcc=;
          h=From:To:Cc:Subject;
          b=S05NwZfzm8j7SBsM1S7JM9VsSaBsYDaWFzDYYA0TVR7ogGAa+BzDGSB6kmHKfCTwu
           LCAeuNW0JWJpncdtTK+lGB2+d8+d0GgHe+9bFOkSffWV3UqDJkuWMdBAkiGqfrWpeZ
           qOnPX06lc0VTbW7gPPDLsLmH2aiHpn7HuZOn+rxBcJ929xuCj4oNm5HyK5c7d5OC9g
           Zf2FqDyrfZ9rFPDhsSahWQCp6uYyaDk6wSBb0RebkA8DcrQXuxBgPiOQcWkVhWvWfB
           Br2xfuKsAZXl4owxAaoiCghP7y62+IJUfLnd1Qr/rVlA87fMzgwy/A1JnGNk0mgOAW
           Lj1kGAgApiilA==
Received: from 89-64-3-180.dynamic.play.pl (HELO localhost) (stf_xl@wp.pl@[89.64.3.180])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <rosenp@gmail.com>; 13 Jul 2025 09:16:36 +0200
Date: Sun, 13 Jul 2025 09:16:35 +0200
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
Subject: Re: [PATCHv4 wireless-next 3/7] wifi: rt2800soc: allow loading from
 OF
Message-ID: <20250713071635.GB18469@wp.pl>
References: <20250712210448.429318-1-rosenp@gmail.com>
 <20250712210448.429318-4-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250712210448.429318-4-rosenp@gmail.com>
X-WP-MailID: aea20ff63548b994e5d08e30c56a4aac
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [0dNx]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_001638_634588_C2DA2549 
X-CRM114-Status: GOOD (  22.86  )
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

On Sat, Jul 12, 2025 at 02:04:44PM -0700, Rosen Penev wrote:
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
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>

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

