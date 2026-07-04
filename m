Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F9AC43602
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 02:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aso6+ZsG3X+4VdCWyOlZl63tV16w6vCIPuhmM3D3paQ=; b=lVpYfCRN9zIHqXsME0ISBjVySc
	MTJIPc9OfToSYO73wvALrV0VFmDp4+1XuRihMTXEgcGSNIE24Y25x2dBDNDqmIx3+z3rB/jkT1pgT
	V04gKISpelXPJUBCtxOuM9uND5uCdAEL2GDOKkAKXP0kFx4HDV8we03IVYN7N4TwkM4NKLkXnLOtd
	JHjAc0HrRhk5chsJvOZCT7/RaKa8u955mkenZIWbxyN8R9Nzu0G51qWVjYf+nzH0yQGaSIQuieult
	wmmcMwTbJ2qt+W6YCCylHmeZT/VTSIxQDwArWni4WwdfvAI3xhJSjwYOgrOWXFX/nMJcfLRrsOCfw
	eqQOiaJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfplf-000000085uw-3ePk;
	Sat, 04 Jul 2026 02:06:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfplf-000000085up-0mgi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 02:06:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 613D3600AF;
	Sat,  4 Jul 2026 02:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B316E1F00A3A;
	Sat,  4 Jul 2026 02:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783130766;
	bh=aso6+ZsG3X+4VdCWyOlZl63tV16w6vCIPuhmM3D3paQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hWcrJ40unSWvU9QgvHJGS2bqy2j/RV6koWG01ewcqbsKK0HhEwP+TxwlMQ1VgSXG/
	 FVirmawuCmHeOhcJc9V52h/tbr5fFStsMtQPNAwB6ACqigw4kFuJtvrDbgtlMQ3p4D
	 V3n0HVrS1OYnqOKKk6Dd7VLEfxEUm9zsAttEHwqTItWKXlnJjmWNXqJoIxwvVkJbN0
	 pJOcjnNqtyUCuhV6HCJNIBCL8BxoeN1/rCPxRqGP1JN01wFCOq54QNfddBrZ7j0awW
	 3yOfeLuKFIt7MC8CQ907iypOIJoo9rfcbtyamDnTqNw6CXXliqaDGhbrKiNXopBXGA
	 ooMNLCiQX3WwA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Alexandra Diupina <adiupina@astralinux.ru>,
	Abel Vesa <abel.vesa@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Adam Ford <aford173@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Brian Masney <bmasney@redhat.com>,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH 5.10/5.15] clk: imx: Add check for kcalloc
Date: Fri,  3 Jul 2026 22:05:23 -0400
Message-ID: <2026070315-stable-reply-0029@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703121338.25747-1-adiupina@astralinux.ru>
References: <20260703121338.25747-1-adiupina@astralinux.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Thu, Jul 03, 2026 at 03:13:38PM +0300, Alexandra Diupina wrote:
> From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
>
> commit ed713e2bc093239ccd380c2ce8ae9e4162f5c037 upstream.
>
> As the potential failure of the kcalloc(),
> it should be better to check it in order to
> avoid the dereference of the NULL pointer.

Queued for 5.15.y and 5.10.y, thanks!

-- 
Thanks,
Sasha

