Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9541AC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 07:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8z38qczvZbxO76S2l6qCCFYCsTxTOPBbrJdkHVddxqs=; b=kLt/36kTtlaCOV8tWpSAYQJv+7
	p4ewC0IlBY2iI2aOOdVVdqjsz7LBzOCcktrWpWKZ2Vpl3B09BRAInPpTZhl9eDcMJiVf03tsU2llr
	Rgk3XcOXg9xLB3tz4SSQEgK+q77147BFtjudJzuPMcB/YgIMABC1e86n/j+HDLOr/e7KLuJIRm/4X
	ePs8X8HBwz6OSlQcBIC/6xRRb+Fxqr/SP1swX2ePWuXwcbKExRG0fgvRdRfD+xG9N+/w25RHtgNIt
	INh7q6C8dalzt6/fQYlNo/ugdPfr45/AhI6FjXYYVdJ96UuwKFJNFkUwCXQz4OqawgwPF23dxib8t
	wsmYqXPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKB1I-0000000CPJr-38nP;
	Wed, 28 May 2025 07:16:12 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKAzA-0000000CPAK-1huA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 07:14:01 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so47647585e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 00:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748416438; x=1749021238; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8z38qczvZbxO76S2l6qCCFYCsTxTOPBbrJdkHVddxqs=;
        b=BK0C5He6MbeufgOWVFvxbvPnafA7XnihhYz4RK4RPAVanHDK6Huo7k/IXn7o0I9KCD
         xMtSqpEiK/t72R3fSe0HSv641lB1yvvrsiKUXXUCjurWSLwBBtFW2lu2zTSHDeKT5ZOc
         vYPF98h3KuHopS/fbGwwQFwAcng/pi6jxwzqaSixA2sc9xCsanf6NyyvzFI4QKUkaxe2
         rX26rfL8bBBSNghOeTJJmEt3HEPc960in/wA0FQX0wmm0Md2+wO81vacgpFgngtK1iSw
         xoB59DiTa8nVtTGcczKUue6CSyN307NBy+LKNILDRRFfkuyXvsa9v8M5tnvCaQ4L/Pnm
         LZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748416438; x=1749021238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8z38qczvZbxO76S2l6qCCFYCsTxTOPBbrJdkHVddxqs=;
        b=JHjm4VF1IXDqIBHw5ZeZrNQDv+rftsseoRpaTDT4zhUe5w6T2anpxy57IK/yof3mqT
         x1Gp15BEC98FlvPlEjsbRjCEo7vdJk848IToVWD8PNdvpV/YsgpIiGUaUZ2A7kh2NWqN
         pf5IRgFChsAjtt6tjraaOCF7jhe9iI96I6DYaXyVHk37Hjb3HazonAldiT0oQnK6q5Td
         cBkDzIlKM1gBU8ylZCiHZAiK9+bg8Hk3XFxWPOOMEao8hqLs+JDFQNOWswgQNv7qiQnp
         UpGXbAKnYupKPPCcEvEG94Mnvo+KqHK6XlZfIt6UvQlzkH9QlrFXsDRlj1oUCjFrid3S
         OxrA==
X-Forwarded-Encrypted: i=1; AJvYcCV/qpPZdgRKmZK/kDt2V2zPIM/DLl/sxdDwjdBN2bVSgT3Tws62oWHcT7JTfLU3X36oNrsSUFko8jOe9U8fixQ9@lists.infradead.org
X-Gm-Message-State: AOJu0YxT9nOcp+z5VSMyvWIUjCtxdNJhDF2i3hKuvw4niVQdk6/sg99f
	7ffHZPfPMKZNA5wYtvcXc7qnYu1Ewt/5EXKWPPZG8IIqz5hwbt3pP/ku
X-Gm-Gg: ASbGncu4bvbMDtNul3xVUTR6J5V4JIpTQClafJwlfyCwBQFoYE856WJFLarTK+w/qwG
	WbK5unVgNuYVzTpOD1yr9NT/Isaaj2gZxMzC0R2apkWC5U5ANFD2a/KokEa5HEorN+BhHfKW7aa
	ImlBRfxdoPXlb/FN1GoqtbkwZGC+VHgCFEsdtXn14CKnxlVn2tH2d+1N4eaeo6Mv0154E3J+V0X
	PRbTL/XR6OZxFlVBhsjK1T1l/2KRzpT5ZrnScEny+4jTVtm1fS4c2ds6f0AZSGU57alRwy+Xyu+
	6TjrMThW4PGonIUGjQQvBLtH98iv7TsIcH0VHWLtE0ROkPxtN+o=
X-Google-Smtp-Source: AGHT+IFUeDV6q6xaB+r06fKVdY1G8cH/8XvdGuTg+xFtJRhZxSlobft7u22w3aTFnbPx2ZJc7hHSZg==
X-Received: by 2002:a05:600c:4ed0:b0:441:b5cb:4f94 with SMTP id 5b1f17b1804b1-44c91ad6b5cmr121816275e9.5.1748416437876;
        Wed, 28 May 2025 00:13:57 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:a46c:90a2:a3c0:b012])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4500e1ddaeesm11501665e9.35.2025.05.28.00.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 00:13:57 -0700 (PDT)
Date: Wed, 28 May 2025 09:13:55 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	stefan.eichenberger@toradex.com,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:FREESCALE IMX I2C DRIVER" <linux-i2c@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	bsp-development.geo@leica-geosystems.com,
	customers.leicageo@pengutronix.de
Subject: Re: [PATCH] i2c: imx: fix emulated smbus block read
Message-ID: <aDa3s2TR-GvPmF3z@eichest-laptop>
References: <20250520122252.1475403-1-lukasz.kucharczyk@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520122252.1475403-1-lukasz.kucharczyk@leica-geosystems.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_001400_445649_59C9E03F 
X-CRM114-Status: GOOD (  23.99  )
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

Hi Lukasz,

On Tue, May 20, 2025 at 02:22:52PM +0200, Lukasz Kucharczyk wrote:
> Acknowledge the byte count submitted by the target.
> When I2C_SMBUS_BLOCK_DATA read operation is executed by
> i2c_smbus_xfer_emulated(), the length of the second (read) message is set
> to 1. Length of the block is supposed to be obtained from the target by the
> underlying bus driver.
> The i2c_imx_isr_read() function should emit the acknowledge on i2c bus
> after reading the first byte (i.e., byte count) while processing such
> message (as defined in Section 6.5.7 of System Management Bus
> Specification [1]). Without this acknowledge, the target does not submit
> subsequent bytes and the controller only reads 0xff's.
> 
> In addition, store the length of block data obtained from the target in
> the buffer provided by i2c_smbus_xfer_emulated() - otherwise the first
> byte of actual data is erroneously interpreted as length of the data
> block.
> 
> [1] https://smbus.org/specs/SMBus_3_3_20240512.pdf
> 
> Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
> Signed-off-by: Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index ee0d25b498cb..4bf550a3b98d 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1008,7 +1008,7 @@ static inline int i2c_imx_isr_read(struct imx_i2c_struct *i2c_imx)
>  	/* setup bus to read data */
>  	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>  	temp &= ~I2CR_MTX;
> -	if (i2c_imx->msg->len - 1)
> +	if ((i2c_imx->msg->len - 1) || (i2c_imx->msg->flags & I2C_M_RECV_LEN))
>  		temp &= ~I2CR_TXAK;
>  
>  	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> @@ -1063,6 +1063,7 @@ static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_im
>  		wake_up(&i2c_imx->queue);
>  	}
>  	i2c_imx->msg->len += len;
> +	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = len;
>  }
>  
>  static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned int status)

This makes sense, we never tested the actual SMBus emulation. Thanks a lot for the fix.

Reviewed-by: Stefan Eichenberger <eichest@gmail.com>

