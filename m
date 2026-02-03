Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB592E87839
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 14:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVDbMP2h4x/mUb6G2s8x3K2KoBv6D/1Du/nOa/GGM5s=; b=E+Srb0Zd0nTSg/ZhtPvNMsq7x2
	bZKKvBpOAUuW3AGV6s50Fo2G+GkYcslpqG343GbXoay0EgQEk6XJAFzxp7Axn0KZpwo6/D9+2PLtR
	rffUa2Kg5B2e4MeL5di97MiJnG8goqg1m7EyF6wmUvnvaaHT/qDP61xUAo2t0hO9/GaLjUckeBcCU
	XdjWOkShTiaerVnMbZ78GzCGTvVfaAleN8CIU2kMPQNQiQPCZ7P4Bn51lnfnBEGLuhWMbaTRQNWJQ
	AOdwfPxirF6ATX4MA2suo9EmdZlzjuWpiMZxljaqpkqCDjOX1BlhmId9on5mOvwtpOwc6gj/fnJ0u
	Gg2el2/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHkp-00000006nCG-2qtj;
	Tue, 03 Feb 2026 14:51:47 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHkm-00000006nAr-32iT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 14:51:45 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso44198995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 06:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770130302; x=1770735102; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gVDbMP2h4x/mUb6G2s8x3K2KoBv6D/1Du/nOa/GGM5s=;
        b=FEj9prLwN9F8Acvtb4AWjF9sQkGlLx30COTgfrivDNI65dCN0rlngEk/SXshALMNZV
         g1Xn596C3BJNWJ5Av8zOFD+ngcGPteJRxETNEg9wI0JyoAKgrUW1MMgcZT/cdVveuDms
         JKSiY/wwelGC66D4FBxeKHxqgu59BaUR2DFD7K5egDJ7REs/LPEKZZ3iNu2N7TVa4oNV
         DU56gM02HlDMBpSEJu9gzv+snl3rpqzrcUTL43Ei+10THFAXTQjpXOMGJZDza4LD8cD+
         OHFeK0Y8oiqovxNoQb45DTl//jM3xwtXP0nbF5bKw0koxTqOEFKqNcPvQAxZiwO5uPpS
         hkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770130302; x=1770735102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVDbMP2h4x/mUb6G2s8x3K2KoBv6D/1Du/nOa/GGM5s=;
        b=Z4KeDF5+Ys/QmMCDS3l/BIGuzEAdGrgLa0f/CGhz0PWb5sLleGN+eoTffI8iOtz+Zl
         z7t1f8DuLPjugH/hNfiPqUbenFiV5wWQk1qliJxBi9WJGDZS3RNt/24x78Ac/WQ/CrUq
         O3mXH84jxQSnpJxe/Ps1mRAH7UF9lX5RT53frpoE/GyDNCSwkbi8iKJ7hrbEBKCkN6jx
         awV8QITIJ1NcdbtRRl1K1qydnatkevLOBUksCwMU1hf6722w8e35jAllTMYNWzkQJFS3
         +MjgdxtQHviaHEkSvguoAK2Ce3L39JTl4WmWqZTT2yuUSd6ZvyCz5+JAv2lQPHYOQq6X
         6xgg==
X-Forwarded-Encrypted: i=1; AJvYcCXkGqA+lo5uguEqffraYpYnUwnKuHopIa5t5NEEIpSxRWuq3keTEZXbvmrOW8Bl1dTUiVcH/Z8XYhkX5iKZEiSu@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn+8gey6UoJgS1nOlxerx5YE8/zM25O1nkRDou77nVd4FdZljR
	e6elZIS2wnRe0nW3pbzZfMMbQLAmASAeLUIycZECHpLnk5LIKGAl+d4lj4Nqvj4YDGU=
X-Gm-Gg: AZuq6aJ09CurLKP9FDU1/wVnWZEU5SqM7Sv6O0fO38DmMI9jdFc8Uvovkie8VwPkUWe
	a0et4LRQqmfIQTz8ftrIR6Sb2a48SF5sjkbLXICAJtr7rswKL6zL4uPMRgXT/9+JsVF7tZ36j86
	jHohqu5/0wxquZB4ZomEF/2DFeWcbfDXCKcnwH6AKKvBca3vyQ9mF/QEwU6VyWIX4djLpfmUROA
	o9hsJ8raD0Oc8P5m4yTzbXE6CJQfW7S7ft7Dy60Uu+PC0Up6a1OqNgctjrVzkDubdKUofrDOe3m
	dyzBw9N61MKiLNgcgabfEyvkfBpllyAMEg52ihGoNcUh3cARCfXVRubMpTAeDsc2gcuVK+hdl7y
	F3LhrCVL9auCaIvE4xDjfcPmPUnDG0Ez//3scZ5dRoI3cwhIKSFyNzfSr/U/YKm0vOWisuRwGJM
	vaquKryDQDFbZYg3a8
X-Received: by 2002:a05:600c:859b:b0:482:df17:bbbc with SMTP id 5b1f17b1804b1-482df17bd2cmr154388865e9.20.1770130302262;
        Tue, 03 Feb 2026 06:51:42 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dffd47c2sm121508595e9.0.2026.02.03.06.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 06:51:41 -0800 (PST)
Date: Tue, 3 Feb 2026 17:51:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <mbrugger@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linaro-s32@linaro.org
Subject: Re: [PATCH v6 0/3] s32g: Use a syscon for GPR
Message-ID: <aYILejxAJef9F8bn@stanley.mountain>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
 <bdb7cd69-7dcd-4e8a-b04a-14a2eb902311@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdb7cd69-7dcd-4e8a-b04a-14a2eb902311@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_065144_788757_8B2722FF 
X-CRM114-Status: GOOD (  16.34  )
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

On Tue, Feb 03, 2026 at 12:18:54PM +0100, Paolo Abeni wrote:
> On 1/30/26 2:19 PM, Dan Carpenter wrote:
> > 
> > Dan Carpenter (3):
> >   net: stmmac: s32: use a syscon for S32_PHY_INTF_SEL_RGMII
> >   dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
> >   dts: s32g: Add GPR syscon region
> 
> It looks like patch 3/3 depends on 1/3 but it should land in a different
> tree, as patches 1 && 2 looks suitable for 'net-next' and 3/3 should
> probably go via the arm/freescale tree.

Yep.  The driver needs to be updated first before the device tree.
(The new driver is compatible with old device trees, of course).

> 
> We either need explicit ack from freescale maintainers or this should be
> split across subtrees, right?
> 

regards,
dan carpenter

