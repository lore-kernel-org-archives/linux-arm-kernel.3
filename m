Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51C8CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 21:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyT+xHf5qLUoWCtLPqQerMtkJAwK/AAEHgHwEUT5UR4=; b=wPUVQsfvshXyosEFtK+TL1OGXm
	7lOs4JVU/Im6W57OTW9JrYD2QLOKPrL9cm5oyYShwwrsQTrQoa7Pt1Qp89pGc/WcWRoSGrXO2f7Bl
	0SJeOE/IXQMqOjrK83Cy/ii7010mvWCBV5lMXkiXEWkFiUF865WCq7orqB3du53UrGXRHF37OvvRO
	BzvwyA4QKgTMET90to8CWbeW8k8pudSbt7/udiD1o2Z/EqBi7cuA/rbFZ6cY8Rb8kCMqWp7FC6bpQ
	aGNPl4LCfB8f2qsdb3Q2vedmrnvuzTY7pSAsiiazTXRhZ4SFrelUR/xkL8m+H5HLK84VQ0JixKeG5
	Ss14QAjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfOE-00000004ayL-2Ifl;
	Tue, 29 Sep 2026 21:29:30 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfOB-00000004axm-38AM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 21:29:29 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469d249c6so2913314b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 14:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790717367; x=1791322167; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EyT+xHf5qLUoWCtLPqQerMtkJAwK/AAEHgHwEUT5UR4=;
        b=u5wVk6+UtOT5OKAczLM+R5UkBmA8UpSqUvmYecJ69DTXVlLQOYBdwLnZUek0vJdnCo
         eeQve+sxdFUhPbBps0jQYlD+1UVWzAc5YRvdRr7VZ22FD3uAOpS/7iwr7Tp8OY9g2HU3
         KrDguf6Mq90oBRt+71PYQNPbXZq7vWiHd3brjyGd889NHHAmK1zjKuzxxlQXCrf6EJgz
         bEjLS6W3rEp9KppYMF/y3zybyxDB19Ls+xQyTGDUSUOuHfF6gjaUdAdu6NL6cXYuN5X1
         dYv0fgMkCxs8MgTXuUtGAuSViqHoXPvbQxrKQmK+ez5sQ9lgS8pcbhblLvuTlg4+hMrT
         Ynbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717367; x=1791322167;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EyT+xHf5qLUoWCtLPqQerMtkJAwK/AAEHgHwEUT5UR4=;
        b=U8pM+PnAu4/mdbTDB1Qt2t7Aav7atJfAJOPDHH7NxSReIcYizqgbi11zYvBLrU3voY
         lxTE6qgXYM52DmDgsM+HQIysDTrY5G732wmLFzJKyn8YiSSoAqifG+eoNXeWtIDNaBmQ
         h7FH5YMHra5qTU0pLsJgV8B8qldiQc8jmpq55N6syIWzYM5ArLrmnU8SDZA+NLLJhZ2s
         QNKS/waZ+qadVzZ09G8n1uOkYnShI2Ca/GspJSe01yjjsU2EOnhGqw94Q3WWP+DvB0gI
         9dcQ3PlItPGrlWsKBF3lDSyujASlA/bmnUZ8YKK888QZio7X9yNKA6rfEG89EjGJlOMk
         JLMA==
X-Forwarded-Encrypted: i=1; AKwUvBzEc0XeX36fpF5GzAI3TgIgIyPb9EYF4CBRbVlkJCrVoKJJr5xjgtQDS8UBIEXjQO2yvUPhJquSuCE3FA4cdm04@lists.infradead.org
X-Gm-Message-State: AFuF++l+8swsbXbeXsbykg61d0CmjSn601gZhbrnj2/1u4mgfFAPoU/8
	j6rX8U1kDCVTIoWvvDtii4zPQaGEnFChvvB7BNi26nucdPOq4sOavhf1D1FyVY6f+y8=
X-Gm-Gg: AYBFou3XfEvb1/sU6aSatKCfEcspiP6z3RQuhQ3KXs19eA08eXcGp863TNorXTYsvbO
	EI2/tLaZr8OLdDkW5fRmUYvjhlxsUmywZ/u3RlGhr1egD8qwNKsmaf03jon5w0hVfVtob40Y5i2
	0qEzJ1ejjVR5UoJvu6VO5P8NMrHe7NSvdfMGMRelEsOtqRat6e90quaUvfU76uMLXHMoCEs2z26
	5zvXZWu/QTfqeMitPZNYIBMb4QqXREXi+shr59YZq/S4ISRU+wYXoAhBNbRW9Y1m4GYZzcWK3EA
	Xg47W0grE+Xik5iZEHgsYaikTjkMWPyblCXPZSUwx3TBkYY1RnwrbyXQHDx1TIYqE4Ec5/+vZ5x
	g0FrqbOKAphUIk01PjAcmVhKc2ooWrQ5tedWN64SmSX5CGDVBWEbQLrGJ92DMUDuP1IkZ6bev08
	U7zHc36w09dyKtEROcEzFFNK2X3Z64Jzaqxr6Pa/Bz9QvpRO0khdjC0J63avLdEh22zmLBceEp4
	2COi4fxyALS
X-Received: by 2002:a05:6a00:4186:b0:881:f5e1:6e7f with SMTP id d2e1a72fcca58-886c48b54bcmr338925b3a.31.1790717366754;
        Tue, 29 Sep 2026 14:29:26 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:57::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8868866150bsm495163b3a.3.2026.09.29.14.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:29:26 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:29:25 -0700
From: Joe Damato <joe@dama.to>
To: Frank.Li@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	bui duc phuc <phucduc.bui@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>, Li Youhong <liyouhong@kylinos.cn>,
	Frank Li <Frank.Li@nxp.com>,
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>, vkoul@kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/1] net: allwinner: remove dmaengine_desc_free()
Message-ID: <arwttakXqJndFXGe@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Frank.Li@oss.nxp.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	bui duc phuc <phucduc.bui@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>, Li Youhong <liyouhong@kylinos.cn>,
	Frank Li <Frank.Li@nxp.com>,
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>, vkoul@kernel.org,
	imx@lists.linux.dev
References: <20260929190640.3516766-1-Frank.Li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929190640.3516766-1-Frank.Li@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_142927_931626_B84DA0FF 
X-CRM114-Status: GOOD (  14.32  )
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

On Tue, Sep 29, 2026 at 03:06:36PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> dmaengine_desc_free() is designed for DMA_CTRL_REUSE. If DMA_CTRL_REUSE
> is not set, dmaengine_desc_free() will return -EPERM.
> 
> 	if (!dmaengine_desc_test_reuse(desc))
> 		return -EPERM;
> 
> So calling dmaengine_desc_free() does nothing.
> dmaengine_terminate_(a)sync() will free all already allocated descriptors.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/net/ethernet/allwinner/sun4i-emac.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>

