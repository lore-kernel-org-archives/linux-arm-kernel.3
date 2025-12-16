Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B51ED637AE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 20:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ypk7mUNq+7q06ZauQ3L/JgorQOHAAj+3MQphJ7ASbOU=; b=Vu1jV1TgFxPSJcf/clA112ZKPz
	xgKcU2pkR2FQi11k+qMomx0Nd1UA81aAgaNcF0GlykRk4krtf4IlSS0pAII1KBJHIXIwS8/pXpNkO
	1mU5Hg+GwH67mnm2qrW1z1BXUzOm2ss4M/fMcIRzHI1pDlOePIzAy7TxQCdejjaZrFT7P49rO6Smo
	2U3uL2x34lPyBmDzZ6wgzZtJe0Vnp0mAPEx1i/SDozCFCBPLAQRqI14AnuWiQuY1pupnoZ3IuTCbK
	wZjqYlPvX3cmrBX844XcwbuiXriAmZ/uxjd/damlj1iderXlRhDrYez57nhZdX7UqNPDtZUTcVcgN
	LK3vSigA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVc3J-00000005oNY-0D0e;
	Tue, 16 Dec 2025 20:53:49 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVc3G-00000005oN9-2sVq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 20:53:47 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so4313360b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 12:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765918425; x=1766523225; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ypk7mUNq+7q06ZauQ3L/JgorQOHAAj+3MQphJ7ASbOU=;
        b=Wix9C3rPAEfj5NdEOD3L4QvDwPeGwBq4728yxKEMQzYPeZFaGbRL9zTaSvEjmY27iA
         jbpnPaqVrGMGLRxSIeGnohh9q7qvEogXoww2fpaGZYyq7R+2nLCStD0+Yaz5SBfNE4Iv
         qsT537r/m2HCrztDMZQ9IuJUx79842ON4WkAmHUTQBjkLIJ4VAz8kL/Hn3mnpy27NX4Z
         W1jRZXlwjK/p1CqRyF/QnkyT0ivlsBv/VpwOy9XH7/aWlfvzWwG2PqbeNsJ5zPSgxcdQ
         AFS4mWcSK5+zlMc3SE1GUcpmkiHp8xIjeza3AdZid1ZL25N5HVGBm1oLtnHiJeDAKrxp
         5B3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765918425; x=1766523225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ypk7mUNq+7q06ZauQ3L/JgorQOHAAj+3MQphJ7ASbOU=;
        b=MePijaoGcYVdgwzMEpSwRSNH7J4hCUdl39ZiFXc+N4c063IMpxQqP9JmYoSTdp0Nps
         rPMVgvwDyPdMW2waPgDydSQ29lxQD0gf01kIPeyr5jnw5B0/5PHJt5WI8ySBkcL7aTkh
         0fTPsso1EcJ+jEZFvdaSVLVT/6prIBLAbb9U5U5kKFTiiS4uaIPZ7uA4IKxplIMyjd3B
         zPkoYP2adug9buZqKk9fsVJZibo8v6Qu8s1xZ0nvFHBVtzZycoqEpxFj1qmluK5lT9ig
         Bp3rgwYN0i3rThMp99SdZsIwEnpaSn/+TNCHeWdqUCWUgrEJx4BVrE5OwccvD/CXAf8+
         3jJA==
X-Forwarded-Encrypted: i=1; AJvYcCWpFFVqidFI0nO7KJBOxFxn0W4FUoJZE7EoWb+CpZv+iRQP7/05ww5JcOElm7Ci0pgXfgTu118BP6VlORKeD9Ux@lists.infradead.org
X-Gm-Message-State: AOJu0YzXA53KaFN9nt0iGKJLnbkx6A/dEiuSVAYYuMtVohVB72WDdR7b
	zirNRmSb0mXGK6lVP/WLRqHjFIXQSoNfp93aiEpEl18n318TSEhV+0hsV1tjXemBD4I=
X-Gm-Gg: AY/fxX53whk2OFXvUtzIukPoHH0kxmJT83EE72BSVBGu/Ua+SmWanrVeja9CsW0yYxo
	CdkOYllnW8jTXkGierQ9pAkqKPmXRzFhYrXLgEAnEI9uUIHFQ3v0ynlk6y7PoBEw9rllO1L9+y+
	BQVQlfB5TRI5u1fhOG2Z0raXZoi5ZMt6Pnmcqwl/AU2ymSDbqgiNryYsPur44DpZ2RcTRi8L0M6
	5nB9yMDeb5gR6X9o5whKbAoMvgrldz4/5O/qhQwESEn/8p7/87sO8XdyX43MdvSWWxWR0LONUxf
	RC8r+A3kiT1KOmEFImjNd+fWlPAMj4TKx56cjRe4TOQjJSGnAtEVSTuQNnvx1EkhTPzb3aIEuOE
	taUmueFEHNxe7reFaCthGr8xzqaxyC783+FJ458L93O9ZPtlidRBSJxrFI3/UBjfeHXdj26L3DO
	1kMo6cYaDubDpl7Q==
X-Google-Smtp-Source: AGHT+IGF2rbTSI4Q4t7Hy49LQZnu0ZesdmocTDZQXJHCS+mdCGABBHatiVGmZZZWsxcTaHxupGoA3w==
X-Received: by 2002:a05:6a00:a118:b0:7e8:4587:e8c2 with SMTP id d2e1a72fcca58-7f669898f41mr16662303b3a.53.1765918425228;
        Tue, 16 Dec 2025 12:53:45 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ba5d:91e2:900a:fb01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcb5c6d9acsm482316b3a.0.2025.12.16.12.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 12:53:44 -0800 (PST)
Date: Tue, 16 Dec 2025 13:53:42 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com
Subject: Re: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-table"
 check
Message-ID: <aUHG1svhft249rn8@p14s>
References: <20251208233302.684139-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208233302.684139-1-shenwei.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_125346_761002_FF27B949 
X-CRM114-Status: GOOD (  15.77  )
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

On Mon, Dec 08, 2025 at 05:33:02PM -0600, Shenwei Wang wrote:
> The resource name may include an address suffix, for example:
> rsc-table@1fff8000.
> 
> To handle such cases, use strstarts() instead of strcmp() when checking
> for "rsc-table".
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 3be8790c14a2..33f21ab24c92 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -694,7 +694,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  		}
>  		priv->mem[b].sys_addr = res.start;
>  		priv->mem[b].size = resource_size(&res);
> -		if (!strcmp(res.name, "rsc-table"))
> +		if (strstarts(res.name, "rsc-table"))
>  			priv->rsc_table = priv->mem[b].cpu_addr;
>  		b++;
>  	}
> -- 
> 2.43.0
> 

