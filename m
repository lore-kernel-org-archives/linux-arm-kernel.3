Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5AAE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euiOK8NNPzupxLdx+tbLr1TI8FnBjorvwfESAZao6H8=; b=wjUAFHwKsFYOqpNVNqdn+7z2/A
	W4oX+PAcTUYrJ8LD+9cEaFl/2jdzWoGfYSDyZH/4ffffWGyFk2JUAIqMKTy1fx74K5ZWPIg66IA8f
	W9/C4II0xSlK3p41Ve9heLr6BUsMdMlsUus0zthIkLTE/x4DbC2LeWThgDIkrH3z/OfAlthntmyZ9
	1mUyhtEsehXWqGGKR+B3sGJQRacVbYQjJ2NhVeR0iH0FuPtLk+/eg6JnCPGNdC/ZHR5z58F++rR4K
	hn2RqZm6PH2Qe9pspSl36MSHljDYiztfzG4OMnEtqi3upA9V7QC94dMJo8IZYrY7BIniBZOCz/WeE
	SZxVtGqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOChf-00000001O5Z-1TiH;
	Thu, 19 Dec 2024 09:20:19 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOCgY-00000001No1-0uzj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 09:19:11 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso3505045e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 01:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734599948; x=1735204748; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=euiOK8NNPzupxLdx+tbLr1TI8FnBjorvwfESAZao6H8=;
        b=gmDT1Imsp8wpoFLc5q5IBGY6CMj3lgoo2iaEr3cM5IXzSnpH0ksrDkVtoh/F9p2KJS
         p7TKG4o2EU7hQpDuwf/MGsOk+NBkHc6UMxkcCiS0nLtLW3oQ4/mnFOBNuWBYXDJ5tECu
         oZOJGnU09emBILKx0jjADzgYIBbDhDNWXFJTHRTfaQ9wemoTru2/43nePkTh5iNcAeR3
         1SKLOZwubpbcXpfxiG0T6XGg6xqpACX4q7rDXIJ4TKUQ9dtK3dEP4zx8oP4x4QreOb4a
         EEiSeF/BOW91JaubNtQ2iGbeE8NIA47BjFFZK+LOI9OsWX44Rf5DosSUbAxVlmvPLbeJ
         1pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734599948; x=1735204748;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=euiOK8NNPzupxLdx+tbLr1TI8FnBjorvwfESAZao6H8=;
        b=p62AFofzIgqJmgEYwuy7mOIDtC7KdWQYThBMXGD+UzigbDkiYJS+Fo0W7Xw5W+d/Uk
         zWG1qutjPsrtvuFGMlXG4+gK0Hh04RGVIesLr9Mq17wQYndnnNT+gTofn175Qmed8yrk
         Y1fLOTnG5aFTE5VYSQYSmJHs3K+pkrBvvLkxfGIe9lWhA/lQ+F8V9jKF8odvSnkwg2VC
         RWVDEINkE4vNQ1mVe0W9hpFr4pP+VAScARtq+fPUl7Jrz8pBEj49deKF3LuZSaJ9Hxqo
         s4d84pTm+msSJFg/tDww3+xbhLVNIKx30ixwMy01S44Ufg2hk45xIjnR5waHK5ulMprZ
         0h5w==
X-Forwarded-Encrypted: i=1; AJvYcCWJLU1t6E65HYMKyF0lkCikzrike00xNFu6cjel95A2q9KSwRctRi73Lhi7K6nb4eK3WEO4l36s9krevbnv0KTk@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/FNqZfMEleDypYPyvenAgOSOhwTfCfQbQYvtMVHSLiG4PkIyQ
	8veiOFgRhdgWderXh+YOJ5yfmoS7zkMLOKTieKVZw+2/aayHV2cN
X-Gm-Gg: ASbGncsMaSlrAjWp6O6SNHtI7x/UKwyhb6CnZW9b2Z8qKftSzBMWh6Nai8jAbo/Wf/g
	AhPkiKymvreMB/hkyeBRgJ15alRSOKZciVbajwCYiu8iL7vpAx2mKOr6X0Or7chJc+IPpTbBU48
	mywzBumsj/vVcDOaa8bfD6PMZEFP+Nb3sCO8NMnzuUtQQ1AorE57ZmL+PEMWZo3XHZsB6mnAVEw
	dL2s4OR6ReNg13Tx+KNll+zp1lV6WTuV1ZEX/wYlYjEYcCXBSK3qCnF
X-Google-Smtp-Source: AGHT+IG0fZL5g+zEG/fpP6eHHf2IPe9NkoBsaKGeRiza0EwWdk6u44xsj9AYe2YdbuChkpugl2kmMw==
X-Received: by 2002:a05:600c:4f08:b0:436:51bb:7a52 with SMTP id 5b1f17b1804b1-4365c77e3e9mr18873865e9.7.1734599947763;
        Thu, 19 Dec 2024 01:19:07 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:7407:1f5c:37ef:e8ea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8ac97fsm1056999f8f.92.2024.12.19.01.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 01:19:07 -0800 (PST)
Date: Thu, 19 Dec 2024 10:19:05 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, Frank.Li@nxp.com,
	stefan.eichenberger@toradex.com, francesco.dolcini@toradex.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: imx: fix missing stop condition in single-master
 mode
Message-ID: <Z2PlCXSG8qt5_3ni@eichest-laptop>
References: <20241216151829.74056-1-eichest@gmail.com>
 <w3x46is2s463ektusvnyu5tt2rinz7eae2ekzyqw2urw5yh5ga@pfzrgzpxjc4y>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <w3x46is2s463ektusvnyu5tt2rinz7eae2ekzyqw2urw5yh5ga@pfzrgzpxjc4y>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_011910_256302_94B10E6F 
X-CRM114-Status: GOOD (  33.55  )
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

Hi Andi,

On Wed, Dec 18, 2024 at 07:16:23PM +0100, Andi Shyti wrote:
> Hi Stefan,
> 
> On Mon, Dec 16, 2024 at 04:16:40PM +0100, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > A regression was introduced with the implementation of single-master
> > mode, preventing proper stop conditions from being generated. Devices
> > that require a valid stop condition, such as EEPROMs, fail to function
> > correctly as a result.
> > 
> > The issue only affects devices with the single-master property enabled.
> > 
> > This commit resolves the issue by re-enabling I2C bus busy bit (IBB)
> > polling for single-master mode when generating a stop condition. The fix
> > further ensures that the i2c_imx->stopped flag is cleared at the start
> > of each transfer, allowing the stop condition to be correctly generated
> > in i2c_imx_stop().
> > 
> > According to the reference manual (IMX8MMRM, Rev. 2, 09/2019, page
> > 5270), polling the IBB bit to determine if the bus is free is only
> > necessary in multi-master mode. Consequently, the IBB bit is not polled
> > for the start condition in single-master mode.
> > 
> > Fixes: 6692694aca86 ("i2c: imx: do not poll for bus busy in single master mode")
> > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > ---
> >  drivers/i2c/busses/i2c-imx.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> > index f751d231ded8..cbf66a69e20b 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -534,20 +534,18 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
> >  {
> >  	unsigned long orig_jiffies = jiffies;
> >  	unsigned int temp;
> > -
> > -	if (!i2c_imx->multi_master)
> > -		return 0;
> > +	bool multi_master = i2c_imx->multi_master;
> 
> with this small adjustment, I have applied your patch to 
> i2c/i2c-host-fixes.
> 
> The idea behind the change is that variables are sorted by 
> length, forming a kind of reversed Christmas tree shape. It's 
> not a strict rule—some communities enforce it, others don't, and 
> some follow entirely different conventions.
> 
> Since it feels somewhat arbitrary to me, I don't enforce it 
> strictly. However, I personally try to adhere to the reversed 
> Christmas tree rule whenever possible.

Thanks a lot for doing the change and for the explanation. I will keep
it in mind for future patches.

Best regards,
Stefan

