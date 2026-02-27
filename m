Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E3B104891E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 23:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VvKc2xwSiMeKqSMW2egCmNGHEAhELGGoNUGyP7DRCNw=; b=CzeVVwdlQ1+vEm4fyMGQaQcmKI
	1HJYxMthWdXZ9Nk81yAoY7C3dx6H+1e74vZtre+s+UniMcG2amfJeqzLqMGBwYz9iXvmfWezmXONm
	vBfR38AWsv8JR7umzvUMVgU809HPLytuVz7d6Z6fYKwvtRNWTcub3IZMBItedrYSeQO4ww/nzf4t2
	7dcKX6096pel5zDWaXyCAaUuQHt1HQs0cNO18Bn7R/MoF9n2HfuqF1xO2mETnk3fWyoNPr5gG4Www
	j9Z/uo2oIoU8zsFYKjI016ojJaKpuGFANDTspYknvhPYVWoANO/K4t9pI5CZj0GKGk5Ltl9MZJMEe
	qi7xeUcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7IS-00000009GfG-1u9H;
	Fri, 27 Feb 2026 23:31:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7IR-00000009Gf9-0jnU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 23:30:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F7CB61338;
	Fri, 27 Feb 2026 23:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3586C19422;
	Fri, 27 Feb 2026 23:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772235057;
	bh=Lwcc9URf14dHVzzxPtmFHc76iirTitobfd0XRDxX8Z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u08WgcF6VOE4UW2WXxINT9tUE+z80VYkHkl8lpYH+0C/t4hBgwoSYmEI7fJktGJtu
	 acPA19t2lS+7bYJK4cXImNMlkiwR8AU/joUdK1ZoYJW4R/vFn0iSIOQMUrVYdpNaqi
	 yTS9kOtaaHpAfPTT2Sa7UCPhsDD3FuAdhUtcMN0GFESIC9GC/pCTtsgzgZN3vD8cUv
	 s3ES7ybw8A0sJDhkdbZWVkMoJIzyIRYnaN0FUqwlxIEyvl8oTDtiaztsoyKQf69Wk6
	 2nsOQUIqbs+rI+8sj+VN5CTPfiPJ/DBfpp3JmYyfhQwhHMdtEp6AmbMYx2QLqzyKfW
	 agt0YI3MwLLMw==
Date: Fri, 27 Feb 2026 17:30:56 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Peter Chen <peter.chen@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Marek Vasut <marex@denx.de>, imx@lists.linux.dev,
	Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Roger Quadros <rogerq@kernel.org>, linux@ew.tq-group.com,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v3 1/5] dt-bindings: usb: cdns,usb3: support USB devices
 in DT
Message-ID: <177223505600.967600.5996144600232538797.robh@kernel.org>
References: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
 <20260226153859.665901-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226153859.665901-2-alexander.stein@ew.tq-group.com>
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


On Thu, 26 Feb 2026 16:38:50 +0100, Alexander Stein wrote:
> Reference usb-xhci.yaml in host mode in order to support on-board USB
> hubs.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v3:
> * Fix commit message typo
> 
>  Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


