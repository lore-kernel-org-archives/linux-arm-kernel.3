Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62440C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 12:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aw8PwRqcSFnjHYu9kruFq08beZFwPpI2ZTR02sRsPTY=; b=1xbNhVxTWzERqFpjTyW8UqxeSB
	XR0uABFb/QWWHBwtYrivJuwJOuK0HETKcnJT1BINqPfHzA96Yz/rTqCqXfYeOQvHNK1sXNWS7oLDg
	vA1bDRxEmoaZdkep1LZKsNU9Yxg9YYBS1BZ8qBaWEiM5RblFeFrdBajVS9XI8r0vm5vCEIMtZKSuP
	zz37WabdcjZAFz3LsQuIUV1IiBVU7/8RfvKxHC0AMWaVdJfr/h7kLcejG5TT5dxVWBuW5dzS6ykTp
	zhNpyb1K6KRfF3OZ2UAZVpM/p6bnbSe+fmPbBwixqJomRXuMeZhvO9QF8cBY862hHVrAJB2xYxw4T
	DahF4jKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viteP-000000072jh-1nOb;
	Thu, 22 Jan 2026 12:19:01 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viteN-000000072jE-1bqm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 12:19:00 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48049955f7fso5425835e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 04:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769084336; x=1769689136; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aw8PwRqcSFnjHYu9kruFq08beZFwPpI2ZTR02sRsPTY=;
        b=c9vPot9T6CqevAiaX8dNT7K1E99FR0VisAyZHK+u5oYp8n7ugGgtPBh7tdejZ2vBCZ
         nx/XIprX001mJyNgMFwOx2ExSMMaNi5ii8wWnbvxU1zAJMI6wFfqoQ19VT2826JPoNwR
         geGze8snDCXsqJetjefcNap/fde29zfLoXcV4mlMj4pYBQpW9+h74T4+jYac36hEDQfK
         QmlWfw58plzFOK/vvy2Ywh+kukIl6V7pn7VXjJOU/vBhC/RUuHrOa7md2Hb52YDsYSp5
         RKGjR2X6kzA57evBb4vUQ8RWnxucEV0qP3pz+jX9DPqnClatX3CAvL8BieIzWLavsL+C
         qDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769084336; x=1769689136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aw8PwRqcSFnjHYu9kruFq08beZFwPpI2ZTR02sRsPTY=;
        b=JLHp7HgiEKRUZ99sPLztH2IZNpGh8p73hvq8T7JBWtOJJR22iWtKUThXsy5DAuzu0T
         zIMScGDdf39KeUuyb2YWBzueOZsmmxwZ5PuP9/OY92wy2+dJfnAjV51W3mmKuEjDySof
         g5ZpkIZVQcic/MPztUAxAUx1A+1KRh5K37vUHRrQuSsCVeXGcix2luHYc7/dQxovr6Aa
         jMxYSmK+MHDU7kQIXWMlYIFopcBIFSyOg1LC4c2a10T8UsLouZT4UPtOUC1XtWXWbkUV
         BM9f6rIqaiUy/dSlprDMv2ATLHYWwkjiBw1CfEox+6vmxDF202NO3P+Yy9M93qhImbrC
         SJCA==
X-Forwarded-Encrypted: i=1; AJvYcCXOueCngVsnyWm3RRAoyGANcdQv/2mOQE/n1lNxn5lrMBxdDD3o9giLFGvJGpV39qWi3TV91CDNDVJdlM8fYofy@lists.infradead.org
X-Gm-Message-State: AOJu0Yy70iBjN+mDcdeXFs3OK5Kv+yFZP2OovGeJZFJ6byQa/FwJW2OE
	qiVfjOYc1Cgm5zppfO+N7PofB9Bp8Ih6Y+BWsjfjYiKDKcYXElqS0y5b
X-Gm-Gg: AZuq6aJ/T1uOnU+S7cllo0oJftK4vq9X7PiOFAntJr8NclYy0Xy9nyl/b27uYwN2yLP
	uLzcEL5eKs3UQLwHrsB5OAl38rTBZ6OJFaCzshupTfXCSOCKNkIuW/zOmkf8xy3z68tBTO87T1l
	Uk3ngS/+BwsMsN1/oH6wIlQZchqgSQo+Og6EuR7xA++kLVuCwRdnA6ztxa+uZNyxBOhIScxX1GD
	0qNZg3Lf3TB5I6dWZefCpzuYFwUf2IWMA5M4LgvyPclbdVxjKynpg77CxTDfQ3EHqWHSJRpd/N+
	b+w1XlKX3PfgE81NR5WGKEk/jFqi7j+lUNxqoVRJHNb31uCVp7+cWN2QlUiHAzB4Sno5lACwIbM
	bcQbTiA9h5NNAAAxH1HHXfQWP8LGElp9LeWkx87EusHpbWM7ItejcOesV2/VQLzVLdr0yvHP8B+
	xfXVgGDR2oEjgSRfA5OAA19w==
X-Received: by 2002:a05:600c:3e07:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-4803ad094b1mr190051015e9.24.1769084335819;
        Thu, 22 Jan 2026 04:18:55 -0800 (PST)
Received: from eichest-laptop ([77.109.188.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43595e0a6fasm16302233f8f.10.2026.01.22.04.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 04:18:55 -0800 (PST)
Date: Thu, 22 Jan 2026 13:18:52 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, o.rempel@pengutronix.de,
	kernel@pengutronix.de, shawnguo@kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	s.hauer@pengutronix.de, festevam@gmail.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH V3 1/2] i2c: imx: preserve error state in block data
 length handler
Message-ID: <aXIVrFdTB4V6pnBh@eichest-laptop>
References: <20260116111906.3413346-1-Qing-wu.Li@leica-geosystems.com.cn>
 <20260116111906.3413346-2-Qing-wu.Li@leica-geosystems.com.cn>
 <aXH_agPD8D2QIVs0@zenone.zhora.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXH_agPD8D2QIVs0@zenone.zhora.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_041859_463937_42127ED5 
X-CRM114-Status: GOOD (  27.78  )
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

Hi Andi and Li,

On Thu, Jan 22, 2026 at 11:48:54AM +0100, Andi Shyti wrote:
> Hi Li,
> 
> I'm adding also Stefan in the Cc list as he has authored the
> lines you are changing.
> 
> On Fri, Jan 16, 2026 at 11:19:05AM +0000, LI Qingwu wrote:
> > When a block read returns an invalid length, zero or >I2C_SMBUS_BLOCK_MAX,
> > the length handler sets the state to IMX_I2C_STATE_FAILED. However,
> > i2c_imx_master_isr() unconditionally overwrites this with
> > IMX_I2C_STATE_READ_CONTINUE, causing an endless read loop that overruns
> > buffers and crashes the system.
> > 
> > Guard the state transition to preserve error states set by the length
> > handler.
> > 
> > Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> 
> I asked you to add the Fixes tag here. Perhaps you need to add:
> 
> Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
> Cc Stefan Eichenberger <stefan.eichenberger@toradex.com>
> Cc: <stable@vger.kernel.org> # v6.13+
> 
> You can get the information above with "git blame".
> 
> I'll wait for comments from Oleksij and/or Stefan here.
> 
> Andi
> 
> > ---
> >  drivers/i2c/busses/i2c-imx.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> > index 205cc132fdec..05ba41144648 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -1102,7 +1102,8 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
> >  
> >  	case IMX_I2C_STATE_READ_BLOCK_DATA_LEN:
> >  		i2c_imx_isr_read_block_data_len(i2c_imx);
> > -		i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
> > +		if (i2c_imx->state == IMX_I2C_STATE_READ_BLOCK_DATA_LEN)
> > +			i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
> >  		break;
> >  
> >  	case IMX_I2C_STATE_WRITE:
> > -- 
> > 2.43.0
> > 

It looks good to me, thanks for the fix. I wonder if the functions in
the isr should instead better return a status and based on that we
decide if we have to change the state or not. Then we would have the
decision to what state we swtich at one place. However, this would
probably be too much rework for that fix.

Therefore, if you add the fixes tag suggested by Andi:
Reviewed-by: Stefan Eichenberger <eichest@gmail.com>

