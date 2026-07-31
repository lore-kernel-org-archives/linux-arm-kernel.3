Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5AAC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wGVPADeki+0/bIy545BYdtbcA87ECTF8VmVOWBf1hwc=; b=gDK/JH4sftxBU6IO/LNZNR7ZTX
	s48WW/KQuupeIJd+JGV6pHnV77ZWh2lam0vgL+9Lm43FBNzefgRSPCgFvwdH00IXYjDoOZySkuHL2
	aikhJZninIUYjFAkWxJCgU2AtSCldu87aAGtnSse9C15c90xJBoiwTOAayHZhYkGbhpRh4UieZxbY
	p/ckSg47421vTfherStLf5kwKHfh/sU3n+nGISpVSjSMstbafLYNZcHP000U05IeioCNL+6Txc5ne
	9ZpkH7yE7oZUNA2QnxZb2i3QsrteMUoElx3nL81SSCk92H94xmqLTyStTqd5RbRSf3ZkvKavG8bQj
	NYNuW9gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoPT-0000000ClAT-3MX0;
	Fri, 31 Jul 2026 14:40:27 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoPR-0000000Cl9o-1RGt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 14:40:26 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c197eaaab00so170159166b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 07:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785508823; x=1786113623; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wGVPADeki+0/bIy545BYdtbcA87ECTF8VmVOWBf1hwc=;
        b=Y+7QE7weg8ynBHWngtI3myBLAWw2sni+jIYhYMWEmGBsItP5v3X3fDt85SUc4zvGtn
         LkOVy7mjxvnvDHWF7ngdfqJPy/e4a98PKwv5rLUsnvTfMS/iCmOaXoR6e97MWbwInl8n
         Ebru1tZg4Qv+p6WL2JDUIIa19QDchw6zoepk1vx42IZPkzpvlNoXW25qjG5q2q4xM1VT
         XpddDQy5hkmMwEWTU1XV/a6InaF3GvSaq+NmEaUBSxEdhP6KdZ9T1+L2aROtRjiBbp+n
         AFexhvmUJeYcgNbLheXBA+e4pA6QLP9S0BKhQoMxB2yKzWhemrN6Zp++Pi27ZlKhryUC
         nIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508823; x=1786113623;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wGVPADeki+0/bIy545BYdtbcA87ECTF8VmVOWBf1hwc=;
        b=s7//mYahy8x/cUcBGxCekD4NcJF1+zsHQvlLCTAc2l4XZrzxP2EbSs95IbMSenzM22
         CACoHwJlQJNf6eLAkMOxkYlxz2FKNyLEdVaY0sczJt3DACLDs4XBpjpUWMFTRQKGDuQS
         DI7Xh+rglTXCcoLWny/kwyWAu1gsMoppvBwx9uy8kusKYBbClkCyJ4fVNtSuBMWFNP40
         sbhY+SMYviYyDqgFwvkNGo9XhF2wxa1GSdZWKJBWA+mmVb1Ed3/a0JGrwh5EB0K00pxm
         nQVICmZT4RJu493b7WjUTonj3y5L6Z7M4UU1MCLQKFG0qOqLGx3sqCUsnD3HiDc0E/j1
         l6Ow==
X-Forwarded-Encrypted: i=1; AHgh+RpyZFG0U22ksX0WqZzoawf1X6vDxpi2cRkndDhE64HQgVmnQliWEo0qLyTtARfF0a2gojLyxlAQm3Afglhoypto@lists.infradead.org
X-Gm-Message-State: AOJu0YyILNCEHpz2t5lDc5SW9Kag6Q8/ZWBCZCYPihjP3ldyDLHy45UY
	a/77qLCl9fG47vcu1SByaeo7VffToEeTqRQ1dNeuwC69ss09CkGVWbvc
X-Gm-Gg: AR+sD10m7xoYm6YzUvEFar5iaxugP5kdAfL2aZX07ibLjHPnq+vHYwBOLXhNfHIGD0L
	VXcRelxjSvPmjohW/qqeaSEAWMjiv3wFWM934f/mWmcj7rLLbEM06DzG0IYyYKN6wnw3Y+HDhGK
	enajK45dKu+nT6+TS8JlQuEr571rf3T6xIbtYAhoW+hOHMDCaMw8W56cDC30MUT9WdLmaErlHrl
	/5+TXjhIhJraOFGLKbsaBxST2TDWQufkH/TrcQr8Kc3FBLGLx9RFoq3j37oazYYhx3WMMwLsTjd
	37my3yBOysgnDH0OY5gJeLO1tGFZjH2x2Uz/XW4NE8wQe/Yx/Tuy23+h1mAZN2QQD/d6bV/7d/v
	YR/x/c276QdW/xg7XTLXZ7C4zo4GN87D7EsIKbxU0Yq8H1ovetqSBJvqi4jRRqOfmFi6O+z+9il
	d+6OYM8Cr7oJ1hPbV435b+wm9B6TVGOdtuGnVcM/wgRXs8XvycVVPw/U0N5G3c8alCVjqDPKbVw
	YT9YNVD58UXtIrhfQLAuh4ZCC9r92A1mjAzpuiEAFMUktFaTydlfNrkFu3z+t8QYUMRIY4a8CpI
	WRYhUPU3GwVEFdyuQYaOX/x6RYluFOlfEhUuN3/2iqbbM+ZT7oov0kcy5LeVmSZpNNKd7lk=
X-Received: by 2002:a17:907:d08e:b0:c16:6e45:5ba7 with SMTP id a640c23a62f3a-c1fd271cb9fmr136450466b.59.1785508823290;
        Fri, 31 Jul 2026 07:40:23 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a8d0-bc01-6d31-3d12-3a11-d2d0.310.pool.telefonica.de. [2a02:3100:a8d0:bc01:6d31:3d12:3a11:d2d0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4453823sm185693866b.40.2026.07.31.07.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:40:22 -0700 (PDT)
Date: Fri, 31 Jul 2026 16:40:21 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 4/4] serial: imx: serialize imx_uart_ports[] lifetime
Message-ID: <amyxxce6haNJBJ3G@gmail.com>
References: <20260719221014.44354-1-kmehltretter@gmail.com>
 <20260719221014.44354-5-kmehltretter@gmail.com>
 <amufrR-1hop2pZOz@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amufrR-1hop2pZOz@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_074025_404093_E8E9AA57 
X-CRM114-Status: GOOD (  10.69  )
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

On Thu, Jul 30, 2026 at 02:02:05PM +0100, Frank Li wrote:
> imx_uart_remove()
> {
> 	imx_uart_ports[line] = NULL;
> 	uart_remove_one_port(&imx_uart_uart_driver, &sport->port);
> }
> 
> Is above sequence to avoid use mutex?
> 

I now tried this, but it doesn't work as-is:

uart_add_one_port() may call imx_uart_console_setup(), so the entry
must be present before the call.

uart_remove_one_port() unregisters the console. Clearing the entry first
causes its callbacks to dereference NULL.

The mutex protects those sequences against sibling probes.

Thanks,
Karl

