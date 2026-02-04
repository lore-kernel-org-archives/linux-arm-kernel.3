Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAD0E8B383
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 01:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Em0gyLmnLi+JfhwMVotc03fIey16WoQvzKKOe1+YjrI=; b=Bw0xa0yG+DovaCyWr2fg1bZTGa
	6F5oFTmMEtlV9hRYhjjHKrIRCjlbdicrAQiLZ4nw6m3xsUQwsDVchkbuDhtJrrfzpcKF0NOa7GFUs
	NbeE1hc+NELg5+LRU5CcMQ2Y5CGNbiXPZBwXNFnHoxcSmewfTB4dIsMcx+7xW/escCpdubkZtL81m
	rdSTy2v1x6pk6k4dVDfRlPYsa7YD8gSV6YCmGpY0+nmMxTsYENnHI+7TAxisZv5FSGWWsItB52Pyf
	Ztie9OjCVjrtQ3qvWyu4D6HnIzQHcqd7DL3fM1iB+Y1QF3lRGMqUcgPf6A1AX0WY8lXFMR2KKP7H/
	s2utz7Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnS7L-00000007jLL-1Hil;
	Wed, 04 Feb 2026 01:55:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnS7H-00000007jLA-3Krz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 01:55:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C150160121;
	Wed,  4 Feb 2026 01:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13756C16AAE;
	Wed,  4 Feb 2026 01:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770170138;
	bh=YKGDqmLZhf/kCrPdxoYx13Bcpad2AS7aHfIuOUnnoRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pbyatxe8/YIUqUwYOAABmXzYqbSEdeyoJU+o5S3WDFX3jcH1DtoNInyWL1VHROBlU
	 g557kokTpPQ+mAcH5uxwtMsd2Eo2UdSpxCvbnYzelmad0RpteHpHM/FGV/rUeIM1AM
	 hb7fnRVByWWIJ4kHNST+1oOtiBnPvvmbS9NAhvRuxxG+ChSOwbuP7+iTnH1jPUY4Gt
	 walTwphkUrVOdYCuBH0bNDdGiwHhptNyZ4Ef+ICQ8slYF+qB+O8qJtppetc4wyfl1T
	 8i1QjzBUprrbasEPuYWmyzM0Q+AOYmBJB5Aer/jwtehLj+/dhLIAR0I+vt3DQcfXON
	 4bRXCstTYS3aw==
Date: Wed, 4 Feb 2026 02:55:34 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: aisheng.dong@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, pandy.gao@nxp.com, vz@mleia.com, wsa@kernel.org, 
	B38611@freescale.com, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [Patch V4] i2c: imx-lpi2c: fix SMBus block read NACK after byte
 count
Message-ID: <aYKnAfQTvSrjJLhE@zenone.zhora.eu>
References: <20260123105459.3448822-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123105459.3448822-1-carlos.song@nxp.com>
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

Hi Carlos,

On Fri, Jan 23, 2026 at 06:54:58PM +0800, Carlos Song wrote:
> The LPI2C controller sends a NACK at the end of a receive command
> unless another receive command is already queued in MTDR. During
> SMBus block reads, this causes the controller to NACK immediately
> after receiving the block length byte, aborting the transfer before
> the data bytes are read.
> 
> Fix this by queueing a second receive command as soon as the block
> length byte is received, keeping MTDR non-empty and ensuring
> continuous ACKs. The initial receive command reads the block length,
> and the subsequent command reads the remaining data bytes according
> to the reported length.
> 
> Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

