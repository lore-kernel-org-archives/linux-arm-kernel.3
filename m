Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B279DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4aiFVPWk7NAYVKW9uB8OzYhAIo5EOwzD2w2pJLKQ5fQ=; b=MqI4UQ9klA+JemTQmjHj+DMo0t
	PgVTgM9YTOTQarJ9gOuxWfcli1UWwGwJQSeL+Cd505C2vUpr2olIGNle3UQwJWh242OWF6zZMh/W0
	HqMlxuXdiB+fHq1/mvDMdUZILkeaC0NT91i7ugTSDqvmKdgCFSImuytO6ke1Z+kL9eI4FD8BaLGfc
	gvMkuKbiZhzRjgo4c3qzP3s2pzzqth4Tf7mZcSALRyXf5peFchxykGtBABi/SlC+J4aPaeD26Ojm5
	HGImIK7k67gLvnEIGn2K8wa6uAm2hyGauK0TiVLU8mhw2EqRDs3DUSGrd53K6Hf+OiTrBdMXtv/eD
	TA2eVSSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1qK-0000000EapT-2vPa;
	Tue, 07 Jul 2026 09:11:52 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1qH-0000000Eaof-3AGH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:11:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 05C2B1A0EB6;
	Tue,  7 Jul 2026 09:11:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC71C601A3;
	Tue,  7 Jul 2026 09:11:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6EE511BC1165;
	Tue,  7 Jul 2026 11:11:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783415506; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=4aiFVPWk7NAYVKW9uB8OzYhAIo5EOwzD2w2pJLKQ5fQ=;
	b=gzY7nslondsKNUqkWe+5CudiAGehplbtGDU7t1nUKgS4SwOgk1WCNvrrKIg1Iec1drudT5
	6itqVQiujEd+9aD+6JbqeILOWmYIXK4o49E8D4+ZrCU1cus1GhCSWFBOWnqbc6j0Q/XEMN
	OvKNAPxNmFDOxkNhyFvvkO7kuhuRrahqmS5phjEl5iZU3KlWmDQm3sHovgRkBwCLEoluce
	5NpRtB0Rz0EUGkDMDBmbfa9SJP5Lgrv6pB7r8udDvEpjyKoLcW38wABzCVRRQtzGpnzIwW
	ePpOSMpVM+rhze0G3AvSCz1de3DqOc4zmSp3173TTCLro0iB6kqnS9zgTJW3mg==
Message-ID: <2a421449-01eb-4066-8c19-d554ff8e4f6e@bootlin.com>
Date: Tue, 7 Jul 2026 11:11:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 5/6] net: stmmac: mediatek: add support for TX
 deallocation adjustment feature
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Biao Huang <biao.huang@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: rmk+kernel@armlinux.org.uk, kernel@collabora.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
 <20260707-dwmac-mediatek-mt8189-v1-5-17f345eaaca3@collabora.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260707-dwmac-mediatek-mt8189-v1-5-17f345eaaca3@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_021149_947249_55347A59 
X-CRM114-Status: GOOD (  15.22  )
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

Hi,

On 7/7/26 10:21, Louis-Alexis Eyraud wrote:
> The MT8189 SoC has in the Ethernet control 0 register from the
> peripheral configuration (pericfg) additional bits to adjust the TX
> deallocation.
> 
> In preparation of MT8189 SoC support, add its definition, use in the
> set_delay_v2 callback, and a support flag in the platform data.

Can you elaborate a bit on this ? I don't quite get what you mean by
"tx deallocation", this seems to have to do with RGMII timings from
the register access pattern, but the local boolean flag for the feature
is named "use_stage_fine", I'm failing to connect all the dots here
with the different terminology in use :(

> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 25 ++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index bcc0baef3f71..6b0a42b5839f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -37,7 +37,8 @@
>  #define ETH_FINE_DLY_RXC	BIT(0)
>  
>  /* Peri Configuration register for mt8189 */
> -#define MT8189_CTRL0_TXC_OUT_OP		BIT(20)
> +#define MT8189_CTRL0_TXC_OUT_OP			BIT(20)

Extra whitespace inserted here :)

Thanks,

Maxime

