Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77598F53D69
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 15:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zEuqXYLwdnr/h2zdw/7lA5Y0YBEZ5aLcF0pDLSnsKRA=; b=hsrOUIfZIOF2cB8os5PUTnhnLp
	W10I9fDwR+WTcCin5GVgvfdYzo8en6mUbSaSCFBSuDnF8b3z8anwLQGytZnn9Ffsy1ce2oo/pPwGK
	yNGIjPtE7vfzfru1RqtZXyWaVHgfRBQbVxsqxuw6OS2MnfmgAHwy903c6FldWKQP1+sxhgcDYBjfG
	e81h4Kbb9o07qcKXGAC/ZT9BGlbiSOAjR37alNfD0NYT7xbsmHgh38nAwAg24+2k6AX7ITFQXMpis
	QLXNhI3/wHVJ4DzbWz1rBoAvFTp3k9OjPzSN1/fVME7R5+3cEYLeJnVwMBvEzi5jY63WONcFfuD+b
	thG55sWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AK7-00000004ONP-0FMl;
	Mon, 16 Mar 2026 15:57:43 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AK3-00000004OM0-3vwL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 15:57:42 +0000
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id C1FF71FA6D;
	Mon, 16 Mar 2026 16:57:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1773676652;
	bh=zEuqXYLwdnr/h2zdw/7lA5Y0YBEZ5aLcF0pDLSnsKRA=; h=From:To:Subject;
	b=CG/wOdvhkrI7VJK5Ltm22UKXsL1TWqPJGrEkmQM+OFCb5ErieX2h0GmDaGar7l/ze
	 dgScDmFbeGnU9gikIGI01vX8r4e+g2W5/9T84gM9+q8M+mrV1FfH+imeEH4nnXXcux
	 LrV3izZODDCLPPypcPFykWsZAJuI1caBi/1PnVJAhKqElkzp1GKzdxHXEiq7GphQ6D
	 8t/g9xlSqhRsoikEwRnegUgGcOFSUZJIrR8quurrXVH8VwaOlBShvhp1VVn4zzBk8w
	 5Uq2Ow60hu8UsLtkPE0RhPbdCfe08wV9+smZ8Vq03LZbtCOZv9qoSVdyJPcSGEjXq5
	 2TY3p4bNKKzcA==
Date: Mon, 16 Mar 2026 16:57:27 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Francesco Dolcini <francesco@dolcini.it>, ming.qian@oss.nxp.com,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, benjamin.gaignard@collabora.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	p.zabel@pengutronix.de, sebastian.fricke@collabora.com,
	shawnguo@kernel.org, ulf.hansson@linaro.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, m.felsch@pengutronix.de,
	fra.schnyder@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de,
	Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [PATCH v4] media: verisilicon: Fix kernel panic due to
 __initconst misuse
Message-ID: <20260316155727.GA43134@francesco-nb>
References: <20260306031059.801-1-ming.qian@oss.nxp.com>
 <20260312173349.GA137045@francesco-nb>
 <e559b822c5f4fc9167d40544172c6c450d88636a.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e559b822c5f4fc9167d40544172c6c450d88636a.camel@ndufresne.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_085740_874444_B25987EA 
X-CRM114-Status: GOOD (  21.29  )
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

On Mon, Mar 16, 2026 at 11:25:53AM -0400, Nicolas Dufresne wrote:
> Le jeudi 12 mars 2026 à 18:34 +0100, Francesco Dolcini a écrit :
> > Hello,
> > 
> > On Fri, Mar 06, 2026 at 11:10:57AM +0800, ming.qian@oss.nxp.com wrote:
> > > From: Ming Qian <ming.qian@oss.nxp.com>
> > > 
> > > Fix a kernel panic when probing the driver as a module:
> > > 
> > >   Unable to handle kernel paging request at virtual address
> > >   ffffd9c18eb05000
> > >   of_find_matching_node_and_match+0x5c/0x1a0
> > >   hantro_probe+0x2f4/0x7d0 [hantro_vpu]
> > > 
> > > The imx8mq_vpu_shared_resources array is referenced by variant
> > > structures through their shared_devices field. When built as a
> > > module, __initconst causes this data to be freed after module
> > > init, but it's later accessed during probe, causing a page fault.
> > > 
> > > The imx8mq_vpu_shared_resources is referenced from non-init code,
> > > so keeping __initconst or __initconst_or_module here is wrong.
> > > 
> > > Drop the __initconst annotation and let it live in the normal .rodata
> > > section.
> > > 
> > > A bug of __initconst called from regular non-init probe code
> > > leading to bugs during probe deferrals or during unbind-bind cycles.
> > > 
> > > Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > Closes: https://lore.kernel.org/all/68ef934f-baa0-4bf6-93d8-834bbc441e66@kernel.org/
> > > Reported-by: Franz Schnyder <franz.schnyder@toradex.com>
> > > Closes: https://lore.kernel.org/all/n3qmcb62tepxltoskpf7ws6yiirc2so62ia23b42rj3wlmpl67@rvkbuirx7kkp/
> > > Fixes: e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC")
> > > Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
> > > Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > 
> > What's the plan to merge this? It fixes a quite severe regression,
> > a boot failure.
> 
> To be decided this week. The commit message does not say if it was released, or
> came in RCs (and I didn't check myself yet). I'd say, if its the first one, it
> will go through next and backports, otherwise its is really tight to get that
> into the RC series, but serious enough. Please fill the gap if you have time,
> and I'll handle it later, probably tomorrow.

This fixes commit e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error
while decoding H.264 and HEVC"), that was merged in 7.0-rc1.

As of now, because of that, 7.0-rc is not booting on affected platforms
(i.MX8MP), to me this needs to get merged before 7.0 is released.

Francesco


