Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F538C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 01:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JM5meLXWoWIL+dn5qgotmaTkpv/zP92VCKqY7DjRL4M=; b=uOMFVj5w7vpOEJrsnfBhn+DPJl
	6cDevPZ5rPJYoBsj0ETMcEWMH30RMTSYSNuJ9XMkE2+pJC+/L/XGQp4l3iDVZD/xq4CW7AR8elbIB
	4nF5t1VC1JawspyqJ8OgxUgHmCdg8DmBSM/8CkVXAVNE/1smXPWEnUj1DP755swc4xsLtF3t6P2qW
	Qm1qYZCb9/754FGoUM8GI9k0919EOjvCL0YEh31xV/QpjvaoYXPyMolissCFOZLfpIfKMpIHq+qRs
	bsdbepqb7JUuyowP1YmyETv9ZYlPrbq5pyZNUlIJr8zBUm9bvnCCSmG1p1Mdnv94B5XT8c3QmzWRX
	z1IrneIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7PFd-00000008zli-0BZI;
	Wed, 23 Apr 2025 01:50:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7PDk-00000008zNF-2Oyc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 01:48:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 74E67614BA;
	Wed, 23 Apr 2025 01:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6879DC4CEE9;
	Wed, 23 Apr 2025 01:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745372895;
	bh=b2Ty2Y4IHTlG+wCuGIQJJ+LjqBQxitk5tYKjHEox70M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Gw2Xi4CODtGpUsSD2n7vzegKZNAZrX7v7cP5MoWILH/deNzm1Mc6zYYPZyjAgzEUP
	 b5RHT7XkZw9rcxU1kAdZouBfsUPF/Ea6MAS1C68foXvQn9KlVl1IUKD/p+MG0GKTiM
	 e7OhHfTpWbI2gj2556A0HiCdv0k1eWyDTlWcfRaeLCq1PCYJo5Qt8Npe4cXlvMXjQI
	 VGQ2xKKQRHKx628jjrIuDHLjjb4OtLDEEonf3W43a6W0ZNI6itZhkhcbkxzEAMvFtR
	 +xBrfrLCLoDih5+yyQ3T9OaZ0DOQcb76WYojV5Dr/7OoVmG/CXNhQCNblxrZvQCD9f
	 syV4wS6dwAtzw==
Date: Tue, 22 Apr 2025 18:48:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, "Russell
 King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Biju Das
 <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v8 4/4] MAINTAINERS: Add entry for Renesas
 RZ/V2H(P) DWMAC GBETH glue layer driver
Message-ID: <20250422184813.02b21095@kernel.org>
In-Reply-To: <20250417084015.74154-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<20250417084015.74154-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 17 Apr 2025 09:40:15 +0100 Prabhakar wrote:
> +RENESAS RZ/V2H(P) DWMAC GBETH GLUE LAYER DRIVER
> +M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +L:	netdev@vger.kernel.org
> +L:	linux-renesas-soc@vger.kernel.org
> +S:	Supported

I'm going to make this Maintained when applying, please see:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#supported-status-for-drivers

> +F:	Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
> +F:	drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

