Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518EFC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 22:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqeTCzYzGrUPhTBlgDjF1SVkJOaW9G/VvAMHeWXJCNE=; b=kbj2sJcj3Xn+a81jtF+fTnObc5
	rhxwhVcOoq4pMdw3kwMwOwy/ruWqtHnNFLu+TYwVjJVndmuPt8nhxacnXKJ7w86dsGaYAvHxhza/v
	k3mLEx7k/CqwX2rD3N4lGuOFb+HxzPxTTHmsXrCtb2L1tbl5cYJVLEnIEXXTxIenzhc7ZJSWrbb7G
	DIeLfvLy4D0WJsNyZ85XaJkTpiLdnmfS5rypFmKr7LPqtgDHvrPWYX1CyHLSNwlyrjV6GtI71CyIF
	xuBap7Uioyf331nPLC0jtF4AJy5Xs5GHwc0jg2M+Ic/pRbNDxnpU3UZ4viIx5u6edL2f7F7cVcuTz
	6ASqaufw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u46BK-00000000IWQ-2sQs;
	Sun, 13 Apr 2025 22:52:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4686-00000000IEM-2KbG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 22:48:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 717E160007;
	Sun, 13 Apr 2025 22:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1087DC4CEDD;
	Sun, 13 Apr 2025 22:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744584524;
	bh=Rh14R+jb2HtCQ2cFLnFZNGo21Tzn594Dks9gIKlxzh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l60+XYZPRa9VW7vDyJAQ1jvHWp6Fqxgm80UCkrSEzD62CuT3bfLZAGH74RHXAbcsJ
	 IS1hDiJSvw7MLVTYtZYbCslnlt58yRffWeooewfr1H4ITVu/gcyiQGcUD6orm45qyk
	 Wdhd+m91IBC6lYHmqhcEoQ/WFo2pu8GoD8s9kj2wLaPerImFSJJj7usrc5GT8sMn0W
	 d1wBEpla/4/mtStHlWtSCtdxmRNV9LCTV7Xaw7+O2nyzklKX8Z53zi6e+nRN4lDYbU
	 nrzxGw27yryEyMFBpMGlU9qnZuY42pzXrfnjtWJMTMbFjR+rPUd3DU0pSS8UqxPNwP
	 ynaRPHjWEXoIw==
Date: Mon, 14 Apr 2025 00:48:38 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] i2c: imx: add some dev_err_probe calls
Message-ID: <hrwb3arue6kshmjqohmhswmicidp44yed5qeswlhk6np2fhtbp@f6bvvazdmrxc>
References: <20250408100300.556703-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408100300.556703-1-alexander.stein@ew.tq-group.com>
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

Hi Alexander,

On Tue, Apr 08, 2025 at 12:02:59PM +0200, Alexander Stein wrote:
> Add corresponding error messages if DMA channels are not available during
> probe. Using dev_err_probe adds deferred probe messages as well.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

merged to i2c/i2c-host.

Thanks,
Andi

