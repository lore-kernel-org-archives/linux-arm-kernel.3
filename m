Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB66C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 05:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPBvAyUU311bbG2aZ0BYl5mxeYY4FqGUEKf9879Dmxk=; b=BMR+wuvkqxbQErI79iEAmxkZOS
	wu4hEFDnTu0/En7uw5okAk8GJVvIuO3ec39Teu/XEPy6kZ6qHVpHOExFkYmZ0dZgjJtw1zh/00fBp
	ipB4qal8mFtjyQmProD2KK18G1VReyxOa3vykeStVs3tWgmglsSHpeTCroi5WsNkjSjPZsmEIOsOX
	LrfSKCiRz08Fet+5GDO/dXiE+i56hlAAqDYxS4P1QOnmyxvvu76lGMjVLrXK24rNbRj8zU0fzc5Wi
	3rkbApiYOcvNeR/733eBkq5pWdKKasr13hPmw6z629h5+hZ7Tlbf9d6x1kJsfHnCc8pJ4LjuP2mG1
	QA4aOG5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Gb5-00000004cFI-2Vam;
	Mon, 28 Apr 2025 05:00:03 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9GZ5-00000004bcI-43A1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 04:58:01 +0000
Received: by mail-pg1-x544.google.com with SMTP id 41be03b00d2f7-af51596da56so3569887a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 21:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745816279; x=1746421079; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iPBvAyUU311bbG2aZ0BYl5mxeYY4FqGUEKf9879Dmxk=;
        b=maGAn8xD5SZBUahWjviYfMGofkN2e+AMjqgNNzRGBNSHOuUz8R55oNB0y9rEbTyehj
         1MqZ/tzZkLGRPqfO9Hjk6FdGKtWhdw8cSo86jBOoqWHfdiDjjhpNCvg+SwlYQ7eCtA4c
         JKQrX3jcMGn1Rl3iK/MBQVHzICl4GT/To+93taEDOhVwtJNj7LNNgPReYqjkOPZ0yePV
         Y+ll8iS7KjVLSEIpl/ALwsWH5jquW5luTZ7TqG3W29Lne1CLAy/Z0wiJhLSmGk3k++ks
         /rA4gV8q+LFvoK0NmJY0pHPYLHA4h0l+ga3jYqVFvs+ELXc1U/oM8X2SeHYC792QJ9nq
         kSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745816279; x=1746421079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPBvAyUU311bbG2aZ0BYl5mxeYY4FqGUEKf9879Dmxk=;
        b=uzB0z9jNRN2CwwbGT5zpssJ4goTsPGQ07nzxBRzhsQNF4wnY1UGmyo3WwfPtvzj2i6
         qlofRUpeMzZNdmx7ydRmSgAxbN9TwxAraGSAZLotr8kJYm8UUcQr/AoPai0w+Vk+Jmy5
         q6mNTj20ayckj/amZMlNV0Oqg1Tamft6iw1Vob4hOm18yi98lmZT47PAxywxEx8EcLNV
         hqojROXaYpQ9pt2vxXP5c5+OrPUjxcdz+7ISIFL1ppRCl3yp2L+Xteu5T4XvEbauQ9JN
         k8RdfxBS3VKxcKk7akQG8CVtbZli8SDvgx23gdVlMxqVFi0zc8T5P108/Er+f+AdFWsD
         eVZA==
X-Forwarded-Encrypted: i=1; AJvYcCXX/9ADH3MX1prTzpd4IvzpvzM4UpSs0IL76wMkG1G/kuifk+0rfKB2KXuvDFi2dFlK3q9l+HhcLHHnmiUIKBlR@lists.infradead.org
X-Gm-Message-State: AOJu0YzF4dBPmj2cd5dcclbCl+n+fVor/jzXSS68rtLS3otK72kHAEEX
	FKOcG3i+6VciAnu2sq4Mjzf7u6K4WZSJH96FmgXyplWhcZynsksJ
X-Gm-Gg: ASbGncstbh/caqmATNdMS55PuwIEiQmBzXpOcvaZoNNowQEUFxJ/6uv2tgFgIZfBMjj
	teb93fc+YFi+mby08uv56V5yIEk1iRE1GrAMVqC4ZaXD34BC73ie489uF1D7wzJJIOA0ZE0o6a8
	CJRBB3eEghwYnBc2XSO7k4MhQk5yFn2ezenfz0Foq0YLiBaSRPI92jMqHnM4g7aZHYIBneHcFLR
	LanOz2viwIbNlmAYq7Sz5paT9vvMo2h0tcigVWCybwPH8B0lO+vRLzufocjQUPEbhYcB5t4ZhLv
	qg+zO9YAAUKMyXPOFp/jcg==
X-Google-Smtp-Source: AGHT+IHPWV68kDNnvcDOp3GF0LPKpG/CEzy0Pv2JiYWY15R9zmn4YM/P6w+2bnJu6lNJanewXlFw5g==
X-Received: by 2002:a05:6a20:9d94:b0:204:4573:d855 with SMTP id adf61e73a8af0-2045b6b0383mr14404423637.9.1745816278754;
        Sun, 27 Apr 2025 21:57:58 -0700 (PDT)
Received: from localhost ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1b82c7adedsm2775300a12.75.2025.04.27.21.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 21:57:58 -0700 (PDT)
Date: Mon, 28 Apr 2025 12:57:54 +0800
From: Troy Mitchell <troymitchell988@gmail.com>
To: Peng Fan <peng.fan@nxp.com>, Troy Mitchell <troymitchell988@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Yongchao Jia <jyc0019@gmail.com>, Frank Li <frank.li@nxp.com>
Subject: Re: [PATCH v2 1/2] i2c: imx: use guard to take spinlock
Message-ID: <20250428045754.glgyfhp2zn3l7wkj@troy-wujie14-pro>
References: <20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com>
 <20250427-i2c-imx-update-v2-1-d312e394b573@gmail.com>
 <PAXPR04MB8459E722812D2B11D57AA17F88812@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459E722812D2B11D57AA17F88812@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_215800_024971_56EFB329 
X-CRM114-Status: GOOD (  22.33  )
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

On Mon, Apr 28, 2025 at 12:55:48AM +0000, Peng Fan wrote:
> > Subject: [PATCH v2 1/2] i2c: imx: use guard to take spinlock
> > 
> > Use guard to automatically release the lock after going out of scope
> > instead of calling it manually.
> > 
> > i2c_imx_slave_handle() can safely be entered with the lock held.
> > 
> > Refactored the i2c_imx_isr function so that i2c_imx_master_isr does
> > not participate in the guard scope
> > 
> > So Using guard(spinlock_irqsave) simplifies the control flow by
> > ensuring consistent and automatic unlock, which improves readability
> > without affecting correctness.
> > 
> > Co-developed-by: Yongchao Jia <jyc0019@gmail.com>
> > Signed-off-by: Yongchao Jia <jyc0019@gmail.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-imx.c | 39 ++++++++++++++++++---------------------
> >  1 file changed, 18 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> > index 9e5d454d8318..a98bf01c5dde 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
...
> > @@ -1125,32 +1126,28 @@ static irqreturn_t i2c_imx_isr(int irq, void
> > *dev_id)  {
> >  	struct imx_i2c_struct *i2c_imx = dev_id;
> >  	unsigned int ctl, status;
> > -	unsigned long flags;
> > 
> > -	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
> > -	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> > -	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> > +	{
> > +		guard(spinlock_irqsave)(&i2c_imx->slave_lock);
> 
> Use 
> scoped_guard(spinlock_irqsave, & i2c_imx->slave_lock) {
>  ...
> }
>
Ok, I'll use it in the next version,
and if no one has other suggestions, I'll send v3 ASAP.
> 
> Regards,
> Peng

