Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5171D3B9AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 16:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dotO4c05j+1ByFMdhxgy6HIjtPrpikGEeV7kKdyEfIQ=; b=lGI4c4d+7WahO1mSyRs+Qu2msN
	gCdy/PIZFWIv33PUkpv3CeI0i7mdMIPFvFUDUUE63L2hGDfnYbcMpIC9g4diePQGKAs55pE2WQgpp
	VF7jy4JuJIH4+MQy9/yT2LTZq2PbigKhJzDf6Yvr1z0atg0gep0FlWrjaeGBuhMsYrn9/VHWgDOcw
	fnrwLBYsy3p18frhQj7oR4yWq2o4R/8gd+CWX8CPRfjMag1nRhK4DFinnKv8R6oeFuAe7xjBvE3QQ
	mf36GJvqxtnk82XJjbSeuYoo9D+gXHUt418hMvqA1+qu7/LD67YbHsQkGEoUcgF+bPLKvnoO2B6sB
	slL1IwWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFyGc-0000000B8LG-3Boq;
	Tue, 26 Nov 2024 16:18:22 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFyFd-0000000B88u-1L2r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 16:17:22 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21262a191a5so52544925ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 08:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732637840; x=1733242640; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dotO4c05j+1ByFMdhxgy6HIjtPrpikGEeV7kKdyEfIQ=;
        b=kLuJhegECk9NSR3ufZ2VBKHWHOD1OIokQxzhKMgnakV+ZZQ6AJxoIo/GkjxSaqnR7m
         ovEg9TWUyGv48mrvBy1dC0Sf6SGY4qBaWd1K+pXGkIB0kg5IvPJQJ/mP5oozH0Dhlwnn
         plSXnwu90IcqIRi2+KX8o8ehwA5voXvGK7vdiE7UJ1RJu6spc2wnEU/mx3DFbHjq2OWy
         ZEGOyAJIVA9Q9/QYZsCs3ac8z4v5VzVsBt9U9dkChj14MUD9Y9oGXSMnvpgbxa6ZPM9N
         dppm8LsgosMpmhXxsA6AibTueFmupEIuAPQT73CzfLFieuAoIOKN6oZeHb76Cw8tHOro
         XmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732637840; x=1733242640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dotO4c05j+1ByFMdhxgy6HIjtPrpikGEeV7kKdyEfIQ=;
        b=TYGSEGguO+zMJ9TAhmx3fTxIm+qXQANrNbCg5FHWuKHUS/RtpMPr1HXIr3X7OnZIKi
         Mza9OrR9nsNzBvAhadpeY7tL/c2rR9YpG+K0uLu0kZmZiIGwI8c6exkrxcIiwRmKyrCu
         i1Yb7WfMhxO/Qa3NnQ5CYfd6cpaI2LB2ecNkUYrG//dCd4ron1A3Pw/lsuLPv6B9TQWI
         BnQAH/fP3ZnDII2LRgD7MmtJtEg2LpRHt6/rDyavtNrb9yh/aAav9mBWwi+5U2gqWYn0
         5ty7C9WBJ4xrWn1JTS+JvIVjTiQd8cIDtWB0ulsPOD3CGUYp14+TlwJOt7SjRICElBip
         bCXg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ2HX3VLhu5jyf4oUHJnFjCxscfdUCG523IjW4jbVyiIZeMQQ99xEvoGDbThg8E3SMN+yVbgiUNR1Da5/l0dsG@lists.infradead.org
X-Gm-Message-State: AOJu0YxqsmMHnoLLBwJ8gxRU5NRAMdKhEgxzC7UMp46y7PfHA2VxzhHg
	D5NQg5u5Xt9dSqfHNzCDmkpmQ2xVqIq+QJYMB0UJu/OjnbbxzRwc
X-Gm-Gg: ASbGncs38GOvTrY8HF8h+5Q9WEHCavTriPFpxcONw2HQkChXchwts97A0kDUVcduQJo
	nL7Z81zvnSQNJzndADE++RXFU3NZPMDlq20f0jsFvmBi1W7PmYfTMDnvB/0zz58lo7wU5adlCqC
	G94xul7tDQSRBMg+RloGII7St48SikvPe09dEQ7ZTakLS1KxRmgMpcl2g3kIXGD+KVjN2UDmuEc
	cbXYPMKA2C0b347ReGey+3Ig+u3LxGf2SeUMRtdgoJx6Q9ABUkmp7MbrhCiem4=
X-Google-Smtp-Source: AGHT+IHIE2SReZTJ4Qu4Z8qk2ImmULTwKv8+/GkwDFaH8Bgy3Ec6rGlXL8O9cvmqAvZCw7gJDtDStQ==
X-Received: by 2002:a17:903:32c1:b0:20b:8bd0:7387 with SMTP id d9443c01a7336-2129f28f81amr257582205ad.52.1732637839561;
        Tue, 26 Nov 2024 08:17:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc22a4asm86521855ad.261.2024.11.26.08.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 08:17:18 -0800 (PST)
Date: Tue, 26 Nov 2024 08:17:17 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Esben Haabendal <esben@geanix.com>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
Message-ID: <49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net>
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
 <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_081721_354645_8E5E7289 
X-CRM114-Status: GOOD (  14.15  )
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

On Mon, May 06, 2024 at 12:23:53PM +0200, Esben Haabendal wrote:
> Making pinctrl drivers and subsequently the pinctrl framework
> user-controllable, allows building a kernel without this.
> While in many (most) cases, this could make the system unbootable, it
> does allow building smaller kernels for those situations where picntrl
> is not needed.
> 
> One such situation is when building a kernel for NXP LS1021A systems,
> which does not have run-time controllable pinctrl, so pinctrl framework
> and drivers are 100% dead-weight.
> 
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>

This patch didn't update default configurations, meaning PINCTRL is now
disabled by affected configurations such as imx_v4_v5_defconfig or
imx_v6_v7_defconfig, making pretty much all imx platforms non-bootable
unless the default configuration is changed manually.

Guenter

