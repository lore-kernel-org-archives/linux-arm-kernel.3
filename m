Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1148D6ACE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 14:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:Mime-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddTmmaktStUX+KyiWQA7QlRxka08sVdAlnNv34gi4rQ=; b=Lmto/YQ+leuoVNTOnRyrAOBUst
	BIuVX1/hcO8uZ5PLxyKK4Bn2mCgbZrXr3tzEFAFiPCfCWstRyYR/JFIu3Uud5z2hKlvHEr6TVmmDx
	j5fM9xdoyIwTXL4U4DG0bl9OgpEUj3yb2urgwpQE8eLpkut8k/ZZsFrj1wAE622bFkAEvVjt6lWML
	K2f4rXUEUSQ5S3yfb6G1moK3PVXcKiemJuAMW1NGpaIRTNKCwBD15xCjnxwiJVmVbjrukdPvWj0lk
	YfoABgagsDAmDxSi9Eougvfaxxm1YMXtvas4YhjInbUsDmhmOcnTSxHmifsA98Jm17lJL9fyT1fAL
	X0bZN9qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJPr-0000000DQ8K-3c19;
	Wed, 27 Nov 2024 14:53:19 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJO5-0000000DPnB-0NKi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 14:51:30 +0000
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 38EF840CE6
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 14:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1732719084;
	bh=ddTmmaktStUX+KyiWQA7QlRxka08sVdAlnNv34gi4rQ=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=hcLydcvkzch/qFlvXkeXYOVsYrcJU0fBJXvi1E9wG4kqmDK12FMFac1cmzJV666B6
	 dDBb8bJVMc6hZ+83QnvUEBVcF7HCnNVSQ25HqGgy/efpbpGs8obpIXEjkJyByJDMMX
	 Gm3aJ/tO0zbUkl8PiwAyZybX3qi931G6TfgSLxJTaROlkclewOeeAD5sgJsI9qyjeq
	 ea9DRCsd6CxirMSzZjKzGENcm6Xygb9MQZrcz4kOnbxfhcL9Sq1CafCils3UeMq0hI
	 m7zm2DTcDraWkUHKr7rDTzVWeV7wcQHeFKa8eo+9E22Faw2Kms1h8MaQBszid+SfJ8
	 F1HSOjVjqLu5w==
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5f1e9fac321so613730eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 06:51:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732719081; x=1733323881;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ddTmmaktStUX+KyiWQA7QlRxka08sVdAlnNv34gi4rQ=;
        b=JGJb/jVQitXk1FnCQ43R4pAc/4pyGVDkMANMLsKEmrgvL6LtEthQmt5I8d63aQyB/0
         9KHGiaZ5/mt4phfqZR6H1z6U4/H6cwsjc7Oainby8VBkAO+WvnziQzmdPzeXLRAGPb/u
         dZIXCzuOmqiNxfeAFE1FCDxPgo1hOxSu4paVsVg5l9Bn+uNyPIzfNh0tTlzqUNeoa5Qy
         K5yHRJK/sXusP0W4M4dKvFANRuhSlioIy2hIkkOVi7AbvKXOBmCSL31G+mses6SPc619
         Kodqr5KUpD1mt1iDn6v07m3TQpoImkxKf9NJ1ZsSkZdjS9FgvnM7Z1aPUdgfOCPeDgp7
         yDEg==
X-Forwarded-Encrypted: i=1; AJvYcCVHCDIzMSC1NIC0lFMVMjBCnRbya/qiStTMa+BSrEAlpBH6WeHm17nVcB1bWLMEY+TaMMgbEaH0oxiCcBH4CqRE@lists.infradead.org
X-Gm-Message-State: AOJu0YyVbGfis3cqDr+S/nrs4rsj+0oaRaCpoLJjYdzVi9RDFvsUemlx
	slz/pMGLcvigx5CRSNN9pV/UjtVN/xxWP/StvuB+9OtP1U6hl9g4q2u5AfZQsF0i9e0/H5pYgEc
	lqlZBAvx9NvKgFwtOev7Bk2NQWr1mAtzUT0bbnDQJjuVn/Rolpl34wusUkpCNdHppOPZxS80hHd
	TpQf1MxiXXN5tIhzoAJMFEG8eLPytgEC1lUJsQt3c07W1nnNDOmhwJBNRg6h/KsQQ=
X-Gm-Gg: ASbGnctR+TJsB9Kc0vbjagwfSh5G5X2V7mXovU0NrSzp6FG0kCB5xc1LDePnmh8j1K1
	hv7nVbYcZD/8KFX3SWfObQ/yO0vt/74y+0pYj9rpHCaIdBqxpBsBlTCUfQ0ux
X-Received: by 2002:a05:6820:4981:b0:5f1:fbef:c868 with SMTP id 006d021491bc7-5f1fc43a130mr3684986eaf.0.1732719081293;
        Wed, 27 Nov 2024 06:51:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfFJGOrjEK1lKzXEW/QXPfJgWZfDO/+kYkPBQ8RDpwNJVjReUG8X0KbLCz17ehyjwvJu+WybHbfVyct/J5soQ=
X-Received: by 2002:a05:6820:4981:b0:5f1:fbef:c868 with SMTP id
 006d021491bc7-5f1fc43a130mr3684952eaf.0.1732719080947; Wed, 27 Nov 2024
 06:51:20 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Nov 2024 06:51:20 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20241124-upstream_s32cc_gmac-v6-9-dc5718ccf001@oss.nxp.com>
References: <20241124-upstream_s32cc_gmac-v6-0-dc5718ccf001@oss.nxp.com> <20241124-upstream_s32cc_gmac-v6-9-dc5718ccf001@oss.nxp.com>
Mime-Version: 1.0
Date: Wed, 27 Nov 2024 06:51:20 -0800
Message-ID: <CAJM55Z9PZH3797=gvRWquHFSE7YOsO0-bcOBFjBETCiQW-YURw@mail.gmail.com>
Subject: Re: [PATCH RFC net-next v6 09/15] net: dwmac-starfive: Use helper rgmii_clock
To: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Minda Chen <minda.chen@starfivetech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
	Keyur Chudgar <keyur@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_065129_448311_3B47CF4A 
X-CRM114-Status: GOOD (  15.14  )
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

Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
>
> Utilize a new helper function rgmii_clock().
>

Thanks!
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> index 421666279dd3..0a0a363d3730 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> @@ -34,24 +34,13 @@ struct starfive_dwmac {
>  static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
>  {
>  	struct starfive_dwmac *dwmac = priv;
> -	unsigned long rate;
> +	long rate;
>  	int err;
>
> -	rate = clk_get_rate(dwmac->clk_tx);
> -
> -	switch (speed) {
> -	case SPEED_1000:
> -		rate = 125000000;
> -		break;
> -	case SPEED_100:
> -		rate = 25000000;
> -		break;
> -	case SPEED_10:
> -		rate = 2500000;
> -		break;
> -	default:
> +	rate = rgmii_clock(speed);
> +	if (rate < 0) {
>  		dev_err(dwmac->dev, "invalid speed %u\n", speed);
> -		break;
> +		return;
>  	}
>
>  	err = clk_set_rate(dwmac->clk_tx, rate);
>
> --
> 2.47.0
>
>

