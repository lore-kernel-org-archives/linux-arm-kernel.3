Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DA0C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 09:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAVVRaIfque3EwxDjB599VKRD3lH9ncgbq2DZrrZMJ0=; b=KPyVrH0Wl/TtrMBEPFMrVCxOO1
	9k6VMYJvrxJTHBQ50b0+cGNmDkhUp2eBRI53sFT7cyHjPBC6Sf3OGOB0iaY3aRxADt27luv48o6cB
	5R73lSgNqOagRdLHQx2n/NOggGW69zPcWLF4O0eaMm5ZiNfAgrYgwlVPAPoAP3l2DtLAYUQtJrCOw
	XF42n+I3kjLjNph8LLjPvnNiWESuq44IrZhS6Yb1NqvlnduaViYBzXrnsLgKaXdmlyGrcDMeDMwhM
	W0JTbkYP21XDecqB4vHd+1T5YgXMKKqmaSh/UNvSb7L/279SzU6rVBUS0NUQOUwgNFW3LoBP+G8Fi
	3LQASTLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUrX-000000009VD-25dU;
	Thu, 15 May 2025 09:26:47 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUkd-000000007sx-373C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 09:19:40 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54b1095625dso797881e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 02:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747300778; x=1747905578; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tAVVRaIfque3EwxDjB599VKRD3lH9ncgbq2DZrrZMJ0=;
        b=TmMymbT+lnaBG83FMwqzsPYG9G5hID5j3wtFOrKZGBQyZIsaKm2u6kwMCdodOXAa+g
         ntqAVmy6GWIJm2RXnMZPvSa7dB/RNIMZ1xfOSQJ1H7dC14wy27RhvPqE96m6CUk+sZ0l
         1kOhi3EtCI3NyZnMFvgQNL7LM+vRTmDMIPSQUwwM1hrRIITsz7zjftQT7TmqlTUmEH4V
         NiluMLAwiyLU0N5mg1Wysx+e1+Nk2ufnqHX5xWG024jWwz+rPClWHR/9pkqSzkI96tnp
         skQofhvRY4z33z1Km9Ldea4E+rRRNNEDCN1ZcBwXbdzd8kMTGngQ66yPsIlnQXTNsS11
         hkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747300778; x=1747905578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tAVVRaIfque3EwxDjB599VKRD3lH9ncgbq2DZrrZMJ0=;
        b=JlzAdipM1GT5aMxR9EIS6I6uSzW0xEP2BJeuxW0fkKMACsmtKUprL6MFAFHYAnFaDz
         scEB2lJWk1iQ+tzUsLt7rBA+EEbLvRsH5XYtxjnufQJxGp6P5vvA6qevVujg3b0Dk3A6
         GKY6e7YMqOlPpz7IryXnahOftnbf00n9yC6ekGztm5jadrx85kbAyvZ9lDsudzLEqOA9
         aNnOn76ny2jsb2okwWZYKeEF9Gmjffa01ccAnT7uBw4vabGQG0e6IyfF2RgQCjYHSemF
         c+pM6uSD3On/p2wNeCnbpq0isnuiigsdhpXMvY/bJPI88dCDEjr2wVLpnyOneq1WzQnR
         lkYw==
X-Forwarded-Encrypted: i=1; AJvYcCWsh9mZ8SOt0sKKOr2iHifAIuJH+VJHdtIbNOTR/zMCmApXEuSMPW52SIBlvmdWBy19bW5cpBtpAtdDtWVUSLd2@lists.infradead.org
X-Gm-Message-State: AOJu0YwlmOWL1b4EKyQSTSAEPvy6j3Dss4YkdOJ8065XqnUJUka/J0cD
	uztQxRCXJmIH34GmMxeGca1del1dGuVdhehvXRrQgtPiP8mi3sui
X-Gm-Gg: ASbGncsdNLdalmVLLUZ5r4vgcU9scc5IjIBusUSx69uErmKCIkm8fyqtXfLQjFsLz/b
	1NZFd7qAOjFus+iv1vruzAZLvudi9I7+9Ey5RNcq4dVzRRa6r4zJg3BIi8xgh8T0+Zl9KYYuoLK
	fCcp2JUOeQbrDpPlknZI4r5vy2U5L/mhWHspFyQZZp+HzbMcFo5db/wf+a1gf4Mq4qi35DicX+D
	fvP5gPAJmEQrC+5vqbaCHo0oxWoZj+yeckg614rpKh9SzQ0I3u6UDmhfzHFFdtfA/Q/BFyIdInx
	LE75y3pxtnR4wPS0cbZ26Ixynr3yQPRFqge9F3P1bvRcBYFi4tggdiCDxm9DnPfAXibwl199XSG
	NI3sFOSSnZyI4KcbgeIgEAxJ3aXDQN/Jy
X-Google-Smtp-Source: AGHT+IFBcq4DqfKlxPbw1MrLx0fBSBJx/jI1yd+Z2wbPyp9w0D8IUldy1X/cWkz4tAEtuvuqupGZyw==
X-Received: by 2002:a05:6512:228c:b0:545:f4b:ed58 with SMTP id 2adb3069b0e04-550d5f94684mr2399058e87.18.1747300777581;
        Thu, 15 May 2025 02:19:37 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645cee9sm2562141e87.75.2025.05.15.02.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 02:19:36 -0700 (PDT)
Message-ID: <7b23de30-06e3-4f02-a8a5-90791628ceed@gmail.com>
Date: Thu, 15 May 2025 12:19:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] arm64: dts: imx8mn-bsh-smm-s2-common: Set minimum
 value for VDD_DRAM_VPU_GPU
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
 Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Wolfgang Birkner <wolfgang.birkner@bshg.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
 <20250514082507.1983849-7-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250514082507.1983849-7-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_021939_785872_CFC4A46A 
X-CRM114-Status: GOOD (  18.91  )
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

On 14/05/2025 11:25, Dario Binacchi wrote:
> From: Wolfgang Birkner <wolfgang.birkner@bshg.com>
> 
> Buck3 is called Buck5 in the BD71847 datasheet. This buck supports
> 0.55...1.35V. Set the minimum allowed value.

Setting this to PMIC's minimum value has little benefits because the 
voltage can't be set lower than it anyways.

AFICS, the idea of the regulator-min-microvolt and the 
regulator-max-microvolt is to protect a system which can't tolerate 
lower/higher than NNN voltage. So, basically, these properties are 
meaningful when PMIC can go higher / lower than the system design 
tolerates. In these cases the constrains set in device tree should be 
strictier than the PMIC's range.

The existing regulator-min-microvolt = <700000>; could have resulted 
from the knowledge that the minimum voltage devices connected to the 
BUCK3 (5 in data-sheet) can survive is 700 mV. Dropping this to 500mV 
just because PMIC can go there might be plain wrong, and in some case 
get the device(s) connected to BUCK3/5 upset..

So, please provide better (more) rationale for this change.

> 
> Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>   arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> index fd12b97525d1..81fa0a8767e2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> @@ -135,7 +135,7 @@ buck2_reg: BUCK2 {
>   			buck3_reg: BUCK3 {
>   				/* PMIC_BUCK5 - VDD_DRAM_VPU_GPU */
>   				regulator-name = "buck3";
> -				regulator-min-microvolt = <700000>;
> +				regulator-min-microvolt = <550000>;
>   				regulator-max-microvolt = <1350000>;
>   				regulator-boot-on;
>   				regulator-always-on;

Yours,
	-- Matti


