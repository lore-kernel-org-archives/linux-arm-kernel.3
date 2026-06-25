Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7287CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 09:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twZyJNe4oKAUakpXmtBipZs2eMFjp62u4eaHu+ufJQQ=; b=ZgDukv9JESErab+Y6dpp3fr0Gj
	1R0iMFpHn8V2iTll4AMRl1Pc9YEOZhC4FcoLC4ecBGzjSatqqiJGP8EGi7N/dYjMd10r6af/EiIL7
	RKJ27Zz1UmlTVQWKiUDWLHg8F7G6tcn1frSdD0WLqohLyHDdyu04LIzYhZatZlhYDGx7Sn4B54fl+
	SuoUCWMKRc4zejhAMSaiwHMKb3/DTGtVVZaqb376Eo87cPGYGB6O3KSl0/633f3oy1rCuVgbfSdwM
	xypJJZx0Wl3kxUwYAeqnZ08CFADTzSqXHwZqwsxzDm0jkQ++NoUEcLNFUAix2wqv83k6n+n8CKLU7
	NG1fvqeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcg0r-00000008sCo-1HND;
	Thu, 25 Jun 2026 09:04:45 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcg0o-00000008sCP-02Kg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 09:04:43 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4633193af19so1534294f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 02:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782378279; x=1782983079; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=twZyJNe4oKAUakpXmtBipZs2eMFjp62u4eaHu+ufJQQ=;
        b=TxDLCCrn8+mJNrW5+KfXfpRE0bcfMGa6qjfvwMQkBOYYzX1AlPFjnocUII3yRW4PxN
         4KIOehwdfiFOhskK+Z5P6F1sPZ4GWcO/2MRfvizEEsi/tYh60MUDbn5/xDRcQ5ojwQuf
         tE+opub/fYurOt45UF1Ke/2pUjooD6iRFowVvziSsMveQ/agUdDyd1VToGYBWcc6PJzg
         QKlBTHDqaKOv1B2HX6bWH89i1qOBjHjC4uXmfVoyeh/DWf+D47yTU5mH8yXvg4dAiZXl
         unwAtHcld86TAfLt7ov0q6LIlZ8xSPc2pc9qC57M+b7dBPhtqJDQTz1tTxHRZNWlA7t4
         6myA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378279; x=1782983079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twZyJNe4oKAUakpXmtBipZs2eMFjp62u4eaHu+ufJQQ=;
        b=nBas3h3BG377ST5MR7mHIyePadeMmv9aUzATp1P8sKmpH2JF6XkGMEjKCnFKV5NBjX
         BmfluNCYrBlc+GO/l1TKGlXffeMgt4ka7/BpaCFbUEQSeyjlFaB5KaM0UGrKamhHy7Em
         dtAefc/uMncBCsd9mVCpUxUKCEE8wqrC0+DBan1/LLUjkeOExh1QX8XlvytuBDUU4e7v
         x6yAMv+AWjhkWfO0dNXCd1GJNtxVCDNhDhJ6G5yWDCcdv5YFFf4fGM9o914f4YhoiUme
         QXqtVESDEPyauTT2QgrozUkW98L6k2USRKIeuxldc4bxVlaT6U0WflaJd1hTzhR9Wwnu
         EZZA==
X-Forwarded-Encrypted: i=1; AFNElJ9byD3VZDQIusPZ/bEyRUK9fGnSzF4o4QYn87gziSaC9+QL724WeLDaeoel06USF59hmPsqGFCRbUEZE5W7ophr@lists.infradead.org
X-Gm-Message-State: AOJu0YzZeqqlrWuw601oxlDTBElw4/JLp7Rd5vOxXpp5T+e/zNriBMMF
	tvCUR+Jzow9kCvqBjvliTd1gEcOscUKCvgR52xROept25pRYt8XWN8Wx
X-Gm-Gg: AfdE7cl5G7MVs2r58X7ddCSSFFLlzk6WlMlh2jL1w5koHgWAPktuf2jeY++4+/+0aDy
	IzP7pgyD7+3jkJodn6dCoVK2Mb8KzLs3Egc/r0L0F9EQ+QT3ol2GRDfpI0loal5ADCCvmP7casD
	hS7z8mX9+h/ITJiVel9ktGmdeGYrhB1bms4deJLTULrUcCJxTcmcTbKp4xh6UzS3oq9h/tGq3QE
	8cGn106eYtfFMtZzT6L+2bgByRKpU0aNTibameGqlIHpoP+T3xyv7gKX2feLsH6C/XiRddexhXt
	fgVKG8S3nDhhVoMllcjGxZKkX6xn69QIjc/0ve5LBUIloMA28RoPXRl7Lf161yXC5+Qpgsy0XkQ
	15u/yL6MtKWobWYosAphrQPgrZTjrl1EEoPUP1EAHC08NlsnrS3bCDa6yW2SiNAhCCg==
X-Received: by 2002:a05:600c:c058:b0:492:48c8:c705 with SMTP id 5b1f17b1804b1-49266865fe5mr18834925e9.1.1782378279131;
        Thu, 25 Jun 2026 02:04:39 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72::cb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926494f129sm47950825e9.0.2026.06.25.02.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:04:38 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:04:36 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Vincent Jardin <vjardin@free.fr>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Wolfram Sang <wsa@kernel.org>,
	Kaushal Butala <kaushalkernelmailinglist@gmail.com>,
	Shawn Guo <shawn.guo@freescale.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: imx: fix locked bus on SMBus block-read of 0
 (atomic)
Message-ID: <ajzvJE5LuzvLmpZN@eichest-laptop>
References: <20260525-for-upstream-i2c-lx2160-fix-v1-v2-0-26a3cc8cd055@free.fr>
 <20260525-for-upstream-i2c-lx2160-fix-v1-v2-1-26a3cc8cd055@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-for-upstream-i2c-lx2160-fix-v1-v2-1-26a3cc8cd055@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_020442_085119_CD2E9526 
X-CRM114-Status: GOOD (  26.78  )
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

Sorry for the late reply.

On Mon, May 25, 2026 at 06:43:15PM +0200, Vincent Jardin wrote:
> SMBus 3.1 6.5.7 allows a Block Read byte count of 0, but the atomic
> (polling) path rejects it as -EPROTO. Worse, it returns without a
> NACK+STOP: the next receive cycle has already started, so the target
> keeps holding SDA and the bus stays stuck until a power cycle for
> this i2c controller.
> 
> Reading I2DR to obtain the count likewise arms the next byte on the
> count > I2C_SMBUS_BLOCK_MAX path, which also returned -EPROTO directly
> and left the bus held.
> 
> Handle both: NACK the in-flight dummy byte (TXAK) and extend msgs->len so
> the existing last-byte handling emits STOP; the dummy byte is discarded.
> A count of 0 is a valid empty block read; a count above
> I2C_SMBUS_BLOCK_MAX is still reported as -EPROTO, but only after the bus
> has been released.
> 
> The interrupt-driven path has the same flaw from a later commit and is
> fixed separately, as it carries a different Fixes: tag and stable range.
> 
> Fixes: 8e8782c71595 ("i2c: imx: add SMBus block read support")
> Cc: <stable@vger.kernel.org> # v3.16+
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  drivers/i2c/busses/i2c-imx.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index a208fefd3c3b..14107e1ad413 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1415,6 +1415,7 @@ static int i2c_imx_atomic_read(struct imx_i2c_struct *i2c_imx,
>  	int i, result;
>  	unsigned int temp;
>  	int block_data = msgs->flags & I2C_M_RECV_LEN;
> +	int block_err = 0;
>  
>  	result = i2c_imx_prepare_read(i2c_imx, msgs, false);
>  	if (result)
> @@ -1436,8 +1437,20 @@ static int i2c_imx_atomic_read(struct imx_i2c_struct *i2c_imx,
>  		 */
>  		if ((!i) && block_data) {
>  			len = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> -			if ((len == 0) || (len > I2C_SMBUS_BLOCK_MAX))
> -				return -EPROTO;
> +			if ((len == 0) || (len > I2C_SMBUS_BLOCK_MAX)) {
> +				/*
> +				 * SMBus 3.1 6.5.7: support count byte of 0.
> +				 * I2C_SMBUS_BLOCK_MAX case should not hold the SDA either.
> +				 */
> +				if (len > I2C_SMBUS_BLOCK_MAX)
> +					block_err = -EPROTO;
> +				temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +				temp |= I2CR_TXAK;
> +				imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +				msgs->buf[0] = 0;
> +				msgs->len = 2;
> +				continue;
> +			}
>  			dev_dbg(&i2c_imx->adapter.dev,
>  				"<%s> read length: 0x%X\n",
>  				__func__, len);
> @@ -1485,7 +1498,7 @@ static int i2c_imx_atomic_read(struct imx_i2c_struct *i2c_imx,
>  			"<%s> read byte: B%d=0x%X\n",
>  			__func__, i, msgs->buf[i]);
>  	}
> -	return 0;
> +	return block_err;
>  }

Reviewed-by: Stefan Eichenberger <eichest@gmail.com>

