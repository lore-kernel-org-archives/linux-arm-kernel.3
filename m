Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F57CA5FEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 02:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkvF2P6gjgd+qyME+B7YSCy6zerTBBjn3yMwdHKmKiY=; b=D1So9ywYRY6bMswAfJUxpc8GYl
	zt5WmcwuZ4niumhPmfNHgQ3C1hdT/6ieOi1onRC+aUyYrAAmH3sYyAI7frQopwnctkvw1bdbMpiiK
	rm0/U+VTbslRDy2th5gMTzEDS142ymYHiX7M48VuFsFNDuB5qPhLvjyAIjNMPOXfQsNDSfTxpduim
	9/fIyZB4HEb9GJS8WW+O/BfZ93RgGa/AdaIAPrtCgcEipeEwA6kNsu1k6EllVHN2UvDd8tE4HaRok
	mK6HP/mSIyvNLEXp52hVhtIIhuocNLkRNvnGxBbGCjpCZuRgRO8vkWNSQRelreUsdgJ58PSBn/n21
	BD6hyGbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhIcR-0000000GVoW-3H7s;
	Sun, 18 Jan 2026 02:34:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhIcO-0000000GVnp-25bK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 02:34:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B27F143A8A;
	Sun, 18 Jan 2026 02:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813BEC4CEF7;
	Sun, 18 Jan 2026 02:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768703659;
	bh=apwvLBDBISFrwUMw2VgWLrYuwUjiJ3bx+VoBhh7dTMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jGmwWkgjpUyKdcNrcUoPywQrBgW3lbY8UYEn5OQMVNQTRt/KdOKXbQnwRi7fP2w/8
	 vsQrRTPWeSuU0tNASu3EH5ZNnhKYFDR9V38zUmKPTITCfNrfNxZpfMHWrzGaf/cG7Y
	 MXgh7iIm1pHObYItQg7LhcPl7rHEcwcX+4FiFnaFW/kPjS3vV13mgFTJm2vMm04N55
	 xkLj2AO5BjIN7AwGf1rKQN2flk+EJp9MfqjQILAeh8hs4zgWt4780Hxw8DPYx+nT0T
	 oHBVo2K7THeODc3o88uIKuiGbTsHCqZwnz89SVO4nD8rr+a2r+YnT3wXWJWwDH4qrI
	 /gi870EGpopnQ==
Date: Sun, 18 Jan 2026 10:34:13 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marco Felsch <m.felsch@pengutronix.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] soc: imx8m: Fix error handling for clk_prepare_enable()
Message-ID: <aWxGpYwRYMI4dN5D@dragon>
References: <20260114-fix-soc-imx8m-v1-1-143de91ef077@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-fix-soc-imx8m-v1-1-143de91ef077@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_183420_577327_4F2477FD 
X-CRM114-Status: UNSURE (   7.96  )
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

On Wed, Jan 14, 2026 at 06:12:41AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> imx8m_soc_prepare() directly returns the result of clk_prepare_enable(),
> which skips proper cleanup if the clock enable fails. Check the return
> value of clk_prepare_enable() and release resources if failure.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202601111406.ZVV3YaiU-lkp@intel.com/
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied, thanks!

