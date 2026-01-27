Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8183CA6C9D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 08:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6gcw78eDfCGKXCKZBLgnF/iPeG+D4+74BvG9CfzhIA=; b=vvXCrnnZj6usldJUB+YKvdwBhq
	xwDfOozkHiM26HvVOvuJj2TX1dd8vg79OsW9oXxNoNvCdASlFPjtoqH9emXvmqkE9n7AyZ48CX8Ln
	CABUVXKfjJP2BXT2wze9ZhSxxBIg7yRs6x5jSjS2hgxgHGxaVuRz+SFGL8jCfCPKvjBDySDdbQh04
	4A783bzY0zSLuUmtMYN9w1yO9dChjAegrMCzJ/fvBU6YY9uCayBaVOAsSiPx0TRnwuRqpBn+xtY/w
	3S+iRFo0Iij6dBmN8w1uP6y/YakF3BbwxXJYgAxlTvRMTmlaur7Aie3KDiWptK+2bf/kCKZnKwfnu
	VH9Mte+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkerh-0000000Dsrl-22Zt;
	Tue, 27 Jan 2026 08:56:01 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkerf-0000000DsrP-0x3X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 08:56:00 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso46892715e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 00:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769504157; x=1770108957; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J6gcw78eDfCGKXCKZBLgnF/iPeG+D4+74BvG9CfzhIA=;
        b=VYyWGJJG6rAHexjC01yIZmIfXiTOkzXsiZ0718iJAE3whw65B9Ry6EMLWC9SJXFRZK
         RbvcVCmP9Ia1aP+QEzWApIR4S06iMeeEn2zReNKWJBE9zst9sW8bMhtImoVOKx6/f846
         B/DJMDKU6RXwpQFZFhT1NaFoHQCudGRtzUYHjxpYlebtGBIN1kAtlzog+Hn9v1cfYhrk
         QWkSaPwG1xAttZNbqGgzhNKs5ahFVPyJs5LkirfTAtEBU+/sOuT5aMbvYJh62qqG6eiT
         zEUUsAqqDkoWGuyfut2bNTARO2sW2KfUpBBTpwfoiKg6tsjT+fUdjvi3/GFt8RX033di
         2p3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769504157; x=1770108957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6gcw78eDfCGKXCKZBLgnF/iPeG+D4+74BvG9CfzhIA=;
        b=XDpIB3Kfj7b9FRcB+oFWRhTNfvDnkG9j1w1M81soaAcHjUfcd6DZ4KzRf5EE4uyZX1
         Uvn/PthT1QZwafVX8nLx3KmRkf1hu3t5Kpmtztem28Ad0lne2dSOzkrr/NqC6TeZS98S
         FX6s1r8+LECVW1r6Yr6YqDJZVoifTbktUgFA2Gku3VakTaYbHUF+TKJlKVZ40JL+7bxu
         QtXgfoe947KkQnZdg5WYbBJ4dyO1hK07LGQXyuwU2CVsRQeolo1h+Z1AxH74aLF/XRk1
         TH6sY/xNQZAoQgStiUivbVhuMvU2tyR0ihxp+/qGM6qVsblKwL61c1ySXQirnS5qhoz1
         hWdA==
X-Forwarded-Encrypted: i=1; AJvYcCWzPEffp65uphNYyty5SR+qA6toOU5d9BGyEXZTFNJ+rdo86ouD36cvOqLgbJBuakW9Rs0MiFUbpVJAOVM53yw+@lists.infradead.org
X-Gm-Message-State: AOJu0YwmZtHytIxCYMIpW4brWv57hYCM6MlJOy4w7y+711CZwpn5GHKq
	sUtI7sEDdVuExzeU4G56ENrbu64VmRIRAExfhToB7SypgXUppUNNm3GJhOHGI+aIz5o=
X-Gm-Gg: AZuq6aKShKpF3uI05B8HT6J3Gk5x4h4Inw2V0dcmHAa91MSS8KqxXjF0trqIYsRcTb7
	hAW68MelrJHkOBf602CoFgnFi4TNHCsP/qFgMK/U/ThD4E25adh9F9sR/RisJobwkmyjAoD0gqp
	ceupfWOjre7vx1CNSWo9nU/RS/TQlxoB3qVMxVDOpB38UjlCUBSj5NwaOftDMqnIpY6K3HoMT8T
	ndtOOc86DBNF2QuHp5aObi93ucVh1s857BqTZJQZJaXotIzNqp9EQhZkcgV88v+2fZoditF+Wvf
	hy1/rI9uvbATU2RKTvI9zKpJtx4TeuSGeVp05xdB8lXqN+DQwfDYeSNR7zL6U4rBEVwy7pZtS0J
	k36bkTRKQzXsbN5KujASO7I2HRY0iE9+qdFVDgyy22qre+x3TvMary1mBVXZptFKm+1qwNy22A7
	VryuJ4CLbpyhGf8C0=
X-Received: by 2002:a05:600c:33a6:b0:47d:52ef:c572 with SMTP id 5b1f17b1804b1-48069e0fd24mr6300105e9.1.1769504156658;
        Tue, 27 Jan 2026 00:55:56 -0800 (PST)
Received: from localhost ([41.210.143.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c42895sm50695725e9.14.2026.01.27.00.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 00:55:56 -0800 (PST)
Date: Tue, 27 Jan 2026 11:55:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Simon Horman <horms@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, robh@kernel.org,
	kuba@kernel.org, festevam@gmail.com,
	ghennadi.procopciuc@oss.nxp.com, alexandre.torgue@foss.st.com,
	linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
	shawnguo@kernel.org, mbrugger@suse.com, mcoquelin.stm32@gmail.com,
	linaro-s32@linaro.org, davem@davemloft.net, s.hauer@pengutronix.de,
	edumazet@google.com, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, conor+dt@kernel.org, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, Frank.li@nxp.com,
	chester62515@gmail.com, netdev@vger.kernel.org,
	kernel@pengutronix.de, pabeni@redhat.com, jan.petrous@oss.nxp.com,
	linux-stm32@st-md-mailman.stormreply.com, s32@nxp.com
Subject: Re: [v4,1/3] net: stmmac: s32: use a syscon for
 S32_PHY_INTF_SEL_RGMII
Message-ID: <aXh9lcfw6D6KouI_@stanley.mountain>
References: <8f2139e8adf02b485a4c84d558fc23f78cf04add.1769195864.git.dan.carpenter@linaro.org>
 <20260126152430.1390514-1-horms@kernel.org>
 <aXeJYo-0iiNuXVGH@shell.armlinux.org.uk>
 <aXeP1y7cK0XRx3Wo@horms.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXeP1y7cK0XRx3Wo@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_005559_309821_09252576 
X-CRM114-Status: GOOD (  13.52  )
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

On Mon, Jan 26, 2026 at 04:01:27PM +0000, Simon Horman wrote:
> But at any rate, I think the key question is should the case
> where regmap_write() returns an error be handled in
> s32_gmac_write_phy_intf_select() (by some means)?

Generally if register read/writes fail then there is nothing you
can do a the software level, you need to buy a new computer.  However,
in this case we may eventually put the registers behind an SCMI
interface so probably checking is a good idea.

Could I leave the error message out?  The callers has an error
message and if you ever see the error message, and even with SCMI,
the fix is probably still to buy a new computer.

regards,
dan carpenter

