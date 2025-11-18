Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4AECEDD8A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 13:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GlBhdagIv79JVcL9in1O72ju+fMc1vc59Oegn0NObR8=; b=z45wovD8NZtdbvUG+hLyaEsXW8
	8AgeqvmZgrft0SGj7Du100rmyorRomx7qXh1G6xu7PpxTBBOgh1/seXvLDXOU62wjYFGFaS1U5978
	K73WQXQaxbShPEXbOg1O28TSfIuEZNtZVhxz75TSlInGJi3dTY2YFsm4HmpYPRrbj+NAT41OEeIH/
	bD4JznyKuCfd0bIEwTlcVmN7hZm+d4aeUyfaVDJwlfmdIBCM9l8BL0c7dUVUs1VUluTNb+jjw7BNp
	06HP3hjzIEPzf7PqD3G1SVmqzx5nu0UIKMeIJ9ck6d7G9NtqccbV+DJ8Vyga39H6AeBnKdwvxEGq8
	nWnk3RDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLM4t-00000000U5m-002d;
	Tue, 18 Nov 2025 13:49:03 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLM4p-00000000U4p-3D3L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 13:49:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 35E871A1B86;
	Tue, 18 Nov 2025 13:48:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EED54606FE;
	Tue, 18 Nov 2025 13:48:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9846810371D09;
	Tue, 18 Nov 2025 14:48:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763473734; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=GlBhdagIv79JVcL9in1O72ju+fMc1vc59Oegn0NObR8=;
	b=MiBKtNPN5r33In7hMNTY3A/YcFYzQQpH/KpcDU5sLR3FBaW4H00KnunhPUHpW4ANBNQfUI
	f3rzckotNXn+7FsPmMGoz+TU7uYakDV5l8MsZMe6yad58UecyXZnsjtCUNNcLUhxesg7P7
	iaYjoTdDlDK8TFLO73hdKhVzpxV0ajGcC57emAvuhZPgFf8yA7NrlthI2hcBeEk3UaMc10
	1j6094cRbYuzUzewCLngiy9EgVPtKXfkgxyZf+4h/pJYXMCXHf7h5AQvl6GUx46J3l/Kbp
	SRo3/bOR3pJH1rI5l0tGlDRhWGpv5MXdkkd+mXod+t1HI0dTUa0YvUkzr0MHEg==
Message-ID: <7f81c9f1-a061-4269-96cd-ecdaa6137c72@bootlin.com>
Date: Tue, 18 Nov 2025 14:48:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: dwc-qos-eth: simplify switch() in
 dwc_eth_dwmac_config_dt()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <E1vLJij-0000000ExKZ-3C9s@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vLJij-0000000ExKZ-3C9s@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_054859_947525_5A4415F9 
X-CRM114-Status: GOOD (  19.61  )
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



On 18/11/2025 12:18, Russell King (Oracle) wrote:
> Simplify the the switch() statement in dwc_eth_dwmac_config_dt().
> Although this is not speed-critical, simplifying it can make it more
> readable. This also drastically improves the code emitted by the
> compiler.
> 
> On aarch64, with the original code, the compiler loads registers with
> every possible value, and then has a tree of test-and-branch statements
> to work out which register to store. With the simplified code, the
> compiler can load a register with '4' and shift it appropriately.
> 
> This shrinks the text size on aarch64 from 4289 bytes to 4153 bytes,
> a reduction of 3%.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 26 +++----------------
>  1 file changed, 3 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> index c7cd6497d42d..e6d5893c5905 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> @@ -84,29 +84,9 @@ static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
>  	device_property_read_u32(dev, "snps,burst-map", &burst_map);
>  
>  	/* converts burst-map bitmask to burst array */
> -	for (bit_index = 0; bit_index < 7; bit_index++) {
> -		if (burst_map & (1 << bit_index)) {
> -			switch (bit_index) {
> -			case 0:
> -			plat_dat->axi->axi_blen[a_index] = 4; break;
> -			case 1:
> -			plat_dat->axi->axi_blen[a_index] = 8; break;
> -			case 2:
> -			plat_dat->axi->axi_blen[a_index] = 16; break;
> -			case 3:
> -			plat_dat->axi->axi_blen[a_index] = 32; break;
> -			case 4:
> -			plat_dat->axi->axi_blen[a_index] = 64; break;
> -			case 5:
> -			plat_dat->axi->axi_blen[a_index] = 128; break;
> -			case 6:
> -			plat_dat->axi->axi_blen[a_index] = 256; break;
> -			default:
> -			break;
> -			}
> -			a_index++;
> -		}
> -	}
> +	for (bit_index = 0; bit_index < 7; bit_index++)
> +		if (burst_map & (1 << bit_index))
> +			plat_dat->axi->axi_blen[a_index++] = 4 << bit_index;
>  
>  	/* dwc-qos needs GMAC4, AAL, TSO and PMT */
>  	plat_dat->core_type = DWMAC_CORE_GMAC4;


