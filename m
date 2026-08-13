Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC9EC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjmvO0/8z0Ky0cbqYz65H+qVZdA1pLokllKhuMy7Skk=; b=pUPlCSAEkjHKo6zdVgRhvq564v
	VyApODwsc9k7s+DIUWjDb0S+qcIz9FNpL3j60GZnG9D/qwPRt+kN7WZbPLobJNmivRBVxQA3DDTpU
	CyqHWBp0GQngbDGDa3R3B7oGU0E4/TQNXq6DAXajrLwUXZ7wiy3sSZccZcrMPgdzjkyVnPe4RL3OK
	KkmcmbM9HehqP3CitL5QEMRLYZkjSVupcqCwxoHbOHj7/BvgT14gzLOHoCDYI45j4qnfeKNQz6jL0
	zZRx0FNN0RVmdSAhGBG9jB2SDjZIVQYADCbWF7y85F6i4t1dP9BZilkEDHIaP7CHCK4BX2u8IoYwk
	uPE6Wd7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXan-000000013ys-2aYw;
	Thu, 13 Aug 2026 15:43:41 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXal-000000013y4-059s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 15:43:40 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so3126310a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 08:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786635818; x=1787240618; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JjmvO0/8z0Ky0cbqYz65H+qVZdA1pLokllKhuMy7Skk=;
        b=J/4svLxu9dy+NqkKPSRBMadyDlh4H+k82ezlALYnlSnJ1znzePW+CEs6eYTaGBbsjp
         HVEVlU8RGU43xmEDIcVYqUQYil09Ja1WXpmaDe/WdeX7TRmnt4XHECMAD/+g7yFgI5PO
         OrEWQw23o07Mz4/Fn7w5V2tKWLCug4VlZLiPv/4ClcbnqNgJ63sjguctxEYt0SdyrIjZ
         WgANkvWq4Vt5FSJpaDebcZj8S3tKAM5C6R331g8e7imp7PTCBpEe+uu4AAuKeGI5Dz5X
         87N9+8WAsE1hOgUvVhG+H9qN7Do9Nw+5g2UAx8rVn1u2ukpExzefDLnFBB/PBnfAuRgq
         x8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635818; x=1787240618;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JjmvO0/8z0Ky0cbqYz65H+qVZdA1pLokllKhuMy7Skk=;
        b=dqgtFC7EjTGYMdbqeQIP9vHAMbrC4FgIMvlIO4TORmayXCGBwUbj12BTMRTLjy9+hS
         JKCOF662k57b9Ktg/0+Yck1aSEGYMBlfFiyU51hY5gwEdxPF9eIBNOeSkUwbR4uU4eQu
         7Oh6WaQVaU5DaaShgDHaMoRhOm9P2NKwq4xRivsRnXWbMb71Bke6IIJBPi+yGF0q2LGo
         4AMxxsh+WhcLFg5yWi9t+xNA1iYkQbczf9PCkFuBFVQnipZ9LPx/ZgTigFABkUygD4Mg
         9IfCAedA4YARIqdvfWFrHNxkhQpEiP1BK/ddBIRYEEr7RTjwst4OAiJsm2bVOMcRZurj
         eORA==
X-Forwarded-Encrypted: i=1; AHgh+RoPcdP5qJQRfojJvIL1qMF6oMXo9xp6pxj4KiSUZ8FPwGdg2HbgibWE7EzUuAByfhdvkZ0UCuJfiMDoS092tRBF@lists.infradead.org
X-Gm-Message-State: AOJu0YwBF8+/Ojn8rwmq7VDKMObkPXq/UCmM4Pe3ILG3cgZTF1JNB5FX
	yDqQ3Ry9dak0gynj5CclxoNMi/6f+u7jGQwiebO+qiYDulAhp3HcuXjG
X-Gm-Gg: AR+sD13S+PvBBd22O+RBuZZquJyfIn6h3MtMH1w3/XaHMCL8uNBfMAPru/XVSwj1YsG
	4+CMCU/nbW8Zw+X6IDIQeW4cHaoLkmn6ZZ7c/uazuyqlZMU5ZX81miKsFfvusKfiePbb03aoiTi
	+cgAsurvf7YEGctTlbuW3eNgZLOZFnNRcV4fVufofsigQ8sVzEXQPtkGfqa+xlBNw2Edb06s2zB
	m9B+o9LkpukIRKtveHlSzMEzzBAwQlrdkVHcof5z6Ul+JsjnpEOMLGS6uYqzIiplF3ZwlxMExgr
	0dejint4sOqAASlXkm1WvAEKndUdsLk3JH25e1mVFd14Gat+k83oJSzlV5l4Gsf2aIGO3177WWR
	lJwNApmbm6GWJ7OGCSd7OVrq5L0Hek8X5S0VBW8HK66QB49Hhh15dFsvrVx7M4mnaOyh1QQW8Og
	oatVkve4x3PRUETOYHvOG+XeLiWeUURHPCfMZY3WTWiA0UC3w+gYCMDLQqZR0fENuqZeQ=
X-Received: by 2002:a17:90b:3843:b0:38e:1497:af5b with SMTP id 98e67ed59e1d1-3931dffc226mr7907538a91.1.1786635817974;
        Thu, 13 Aug 2026 08:43:37 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931dadc0f4sm1600312a91.2.2026.08.13.08.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:43:36 -0700 (PDT)
Date: Thu, 13 Aug 2026 12:43:29 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <an3brO5COdw_F76m@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_084339_060375_353B6031 
X-CRM114-Status: GOOD (  15.27  )
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

On Thu, Aug 13, 2026 at 09:58:52AM -0500, Frank Li wrote:
> On Thu, Aug 13, 2026 at 10:33:35AM -0300, Leonardo Costa wrote:
> > From: Leonardo Costa <leonardo.costa@toradex.com>
> >
> > Add a device tree overlay enabling the Toradex Capacitive Touch Display
> > 10.1" LVDS V2 on the Verdin Development Board with Verdin iMX8M Plus
> > Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
> > on the Mezzanine LVDS interface (J10). The panel is an Opto Logic
> > SCX1001511GGC49 10.1" WXGA TFT LCD LVDS and the touch input is provided
> > by an ILITEK ILI251x capacitive touch controller.
> >
> > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
> > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > ---
> 
> what's difference with Add Toradex Capacitive Touch Display 10.1" LVDS V2
> 
> why not share one dtso?
> 
> Frank

Hi Frank,

There are two main differences:

1. The mezzanine one uses different backlight controll pins, so here we
use the 'backlight-mezzanine' node, instead of the 'backlight' one, used
in the one without the mezzanine.

2. The touchscreen GPIO and interrupt pins are also different with the
mezzanine board.

Leonardo

