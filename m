Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBC6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 23:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tl3idrE2LCcllxqdl/sbYQYJDQoP869azWPMoZLhxKg=; b=hT11+yc4oYsr7rEvZQlDuwOwy4
	7zOKfNaH/UkabSXKOy6oXt+F02zruvVS7pJ3JAYhzEzErPXCJ1IEc0i4d/WkebrmQDhmvHl8tywdT
	Mq5qT59vz0VpnYk4jElEeNS/o0AUiqU/3+sRwJRU0IpOLWiumFVwA4yGzWwSe+aI5ddHm4QNiFBdo
	YnpKDB79RZJTSIf+0clKPNrGEPlED09aiq66UPKiaqFaRTNw7S9MMVyDh5KD5efBLLVROGP5/Jh5c
	iamGKxGlFt6VI+VTa1p0XgTjqATX04i4BcB2BLn/ZZSOCapVZM0TrJ0f0K938uSDDCI++zDP2CPp3
	pAig1PFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOmgA-00000006HRL-1L1l;
	Fri, 20 Dec 2024 23:45:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOmey-00000006HK2-0kIe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 23:43:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B65A1A42A10;
	Fri, 20 Dec 2024 23:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95CFC4CECD;
	Fri, 20 Dec 2024 23:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734738234;
	bh=Tl3idrE2LCcllxqdl/sbYQYJDQoP869azWPMoZLhxKg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rs76IXBbEJgspYIxkUgYirKR9qdmMusTU04RfQ8aYSpA7brl0GXjq/Yq4/XWliLMK
	 BVByk3LAviLPBldIHj9nvLbKJrFXPJT04YyDvG41rkMKehi+edYeMbSlAVmHstwkF2
	 dnDuhgBnarL2HzdPqA013C4xnOUYU1rjlJgiyAwHL03/GuiRQlOhkrDu1lpumxFz/8
	 yRbtRkY4o6l9kLyimWgokfGcSoae5SSXslnAEPdyo9/3+g9N/Uaika5PnyU1tVhxLs
	 FMuSGTI2u3HPVTL+BJmSVzTNTndvgtCd3S3ePoqMWT8UdEhVk6HZpKDR2wnErrIVJR
	 ZRj3UaLGkLUXQ==
Message-ID: <ae80d29442890a356289ad1f0caab906.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241219105447.889CB11FE@mail.steuer-voss.de>
References: <20241219105447.889CB11FE@mail.steuer-voss.de>
Subject: Re: [PATCH] clk: clk-imx8mp-audiomix: fix function signature
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Nikolaus Voss <nv@vosn.de>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Fri, 20 Dec 2024 15:43:52 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_154356_287960_0E6B7DD9 
X-CRM114-Status: UNSURE (   6.41  )
X-CRM114-Notice: Please train this message.
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

Quoting Nikolaus Voss (2024-12-19 02:54:11)
> clk_imx8mp_audiomix_reset_controller_register() in the
> "if !CONFIG_RESET_CONTROLLER" branch had the first
> argument missing. It is an empty function for this branch
> so it wasn't immediately apparent.
>=20
> Fixes: 6f0e817175c5 ("clk: imx: clk-audiomix: Add reset controller")
> Cc: <stable@vger.kernel.org> # 6.12.x
> Signed-off-by: Nikolaus Voss <nv@vosn.de>
> ---

Applied to clk-fixes

