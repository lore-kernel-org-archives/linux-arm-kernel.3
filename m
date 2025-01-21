Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B06C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 13:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lE9ukk/VXHGDjSc+qLMUCRMXuWtuucO2/B4Z5t1Tgpo=; b=Gn74JI9m7fcP9vint9VlRvbYXm
	/AIdKc02xgADpyPTSE/GaQrj7UJzDVS628UWMKcIHN3AHK7IeKPF/sgGsPf7EzDzfZ7Of9CHD7WnG
	XEIZe9jPjeexIbIlf0k5YZQDvoI4lCQlmnR02+30fyshbBqM26DM0cYZyB5sbMIEYLbvA5ea3BLhg
	KKraBz+G7hi9K6LVocObPUEB0dycOvixwQRy7mHUlG1xsir4DEgyV8O++9TI4BBSRoD4dulO1cK+l
	HP0iDI9BjmMBZUWv6+c5ot+PSZZqmXmXgGezFGcgzQWymlKR696wFc9yuoaM9A/7TsAWAf76nKUFo
	pu+CKwAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taE9k-00000007xo9-2B2h;
	Tue, 21 Jan 2025 13:19:00 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taE8S-00000007xcb-12yx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 13:17:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8AAC1C000E;
	Tue, 21 Jan 2025 13:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737465457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lE9ukk/VXHGDjSc+qLMUCRMXuWtuucO2/B4Z5t1Tgpo=;
	b=TNTNMZF5Pn/+YxXwDMkaY1a81PhSSuG7MtXztSCFNzqqQHsvhdOQpIO5LUuBNfsxlOfeVn
	3dvxnNhdreayztRnkQGdLI4ysUmHCsNv48m4haAWOwMxN4lagRYlL0YV02nogWy/xrjVwd
	oklk8cLfd+a88IkulEjOXXDOlXnr+Pl0Y0KQLDiAOYCs7WMik0wMwt5+/2DX0GBz2ZiCVS
	2sLpiqz00K7VnaI7yhZa3hP6QTEvS/F5NvyD6PDYBLkIMO2syadr5pX0ABAFSHezMj93Fm
	1k9jgaAqfG/pXm1wCu2aDaO5IJZTRoLa3w1tOqhF0fATo7JxqWinB8YIcNEcUA==
Date: Tue, 21 Jan 2025 14:17:34 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Richard Cochran
 <richardcochran@gmail.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 2/4] net: stmmac: dwmac-qcom-ethqos: Mask PHY mode if
 configured with rgmii-id
Message-ID: <20250121141734.164ef891@device-291.home>
In-Reply-To: <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
	<20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_051740_603781_24BD9B62 
X-CRM114-Status: GOOD (  27.13  )
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

On Tue, 21 Jan 2025 15:54:54 +0800
Yijie Yang <quic_yijiyang@quicinc.com> wrote:

> The Qualcomm board always chooses the MAC to provide the delay instead of
> the PHY, which is completely opposite to the suggestion of the Linux
> kernel. The usage of phy-mode in legacy DTS was also incorrect. Change the
> phy_mode passed from the DTS to the driver from PHY_INTERFACE_MODE_RGMII_ID
> to PHY_INTERFACE_MODE_RGMII to ensure correct operation and adherence to
> the definition.
> To address the ABI compatibility issue between the kernel and DTS caused by
> this change, handle the compatible string 'qcom,qcs404-evb-4000' in the
> code, as it is the only legacy board that mistakenly uses the 'rgmii'
> phy-mode.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 2a5b38723635b5ef9233ca4709e99dd5ddf06b77..e228a62723e221d58d8c4f104109e0dcf682d06d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -401,14 +401,11 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>  static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
>  {
>  	struct device *dev = &ethqos->pdev->dev;
> -	int phase_shift;
> +	int phase_shift = 0;
>  	int loopback;
>  
>  	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
> -	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
> -	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
> -		phase_shift = 0;
> -	else
> +	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
>  		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;

So this looks like a driver modification to deal with errors in
devicetree, and these modifications don't seem to be correct.

You should set RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN (i.e. adding a delay
n the TX line) when the PHY does not add internal delays on that line
(so, when the mode is rgmii or rgmii-rxid. The previous logic looks
correct in that regard.

Can you elaborate a bit more on the issue you are seeing ? On what
hardware is this happening ? What's the RGMII setup used (i.e. which
PHY, which mode, is there any delay lines on the PCB ?)

Thanks,

Maxime

