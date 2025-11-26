Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A11D11195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 20:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qM7WihebRMCO7ieqM/5fOr82OKBudNQB0Ovr3Tl6t0k=; b=c6W8Q7jGlPW1caCPAD/qZGo5LM
	v7fk+lR5R9Rz5sU1ZNoHwHMl0H1av8Z6vsIztZEWqQWs2Gry5NnldyqINabDr/vyUjcMdttWc9iS+
	ydBxvGsh70TF5+tnXuUCXhQ5BY/Nv1FbGgc2aSQiNolSnTlIzle3+/wwnrq7VrPOmP1CIP342AASy
	HYQAIjDClgNoTm/HjXO1owLY/HdfTSop5UpaugaDdiDTzz8TL2BL7rbnijMT638BKVBHx+p51JYgb
	hZl/eMYISavwOXzhWpRSsGCMeqtT/PtXPo//J2Zst+g0SgTTrqxy1cXiMb3r90TA12X2mvmjBTv7l
	syunufAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOLpN-0000000FbNg-0dZh;
	Wed, 26 Nov 2025 20:09:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOLpM-0000000FbNa-08a8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 20:09:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 34ECD60139;
	Wed, 26 Nov 2025 20:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E89C4CEF7;
	Wed, 26 Nov 2025 20:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764187762;
	bh=17Gv13+1bUBiu5zt9XAZqjGO+TKpyge8B9fhPbk8Q+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vIivdruMDkOnKsuspoh6Us5Qnma/JLCzeTqG0sk5SyHjT7oKjDnup+SHQrfNsV1ac
	 6UJj3fusSV3OLlg2ZfIihQOrHS4PXgI8HjtuRXKZ1JmXrQS0DwsGYrqoIjieyo1/w9
	 1Y/MYe4AEtsTGdWm27Jg4A3rv0IyTioTpUONnivCCs24ut97QVo//9o1ZWp+52d1R5
	 yfRmnMKvZJittC/6+Y9Z9eGrBxgZXL2Ayj/EZtLY6J8udRMk07URLT95o8Ya8l6QpX
	 pJLO9sP9ewrBf2DkEI+mJ3wvR1OIPGzw3Bzr4FFSawijlyNvpQtZDYJdMWdxKwHAre
	 DvHYhjKkOkXFA==
Date: Wed, 26 Nov 2025 14:14:53 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	"S.J. Wang" <shengjiu.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev, 
	linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/2] remoteproc: imx_dsp_rproc: Skip
 RP_MBOX_SUSPEND_SYSTEM when mailbox TX channel is uninitialized
Message-ID: <mkgc3gpgzvdvotzw4752om5ascwxpscocaj2x5urzaa7ss4iys@rsqb3ebrexw7>
References: <20251125124903.962295-1-iuliana.prodan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125124903.962295-1-iuliana.prodan@oss.nxp.com>
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

On Tue, Nov 25, 2025 at 02:49:02PM +0200, Iuliana Prodan (OSS) wrote:
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> 
> Firmwares that do not use mailbox communication
> (e.g., the hello_world sample) leave priv->tx_ch
> as NULL. The current suspend logic unconditionally
> sends RP_MBOX_SUSPEND_SYSTEM, which is invalid without
> an initialized TX channel.
> 
> Detect the no_mailboxes case early and skip sending
> the suspend message. Instead, proceed directly to
> the runtime PM suspend path, which is the correct
> behavior for firmwares that cannot respond to mailbox
> requests.

Please use the allotted 75 characters of width for your commit message.

> 
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index f11662f9a12f..fc0470aa72c1 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1308,6 +1308,15 @@ static int imx_dsp_suspend(struct device *dev)
>  	if (rproc->state != RPROC_RUNNING)
>  		goto out;
>  
> +	/*
> +	 * No channel available for sending messages;
> +	 * indicates no mailboxes present, so trigger PM runtime suspend
> +	 */
> +	if (!priv->tx_ch) {
> +		dev_err(dev, "No initialized mbox tx channel\n");

Commit message and comment above says this is "normal" behavior,
dev_err() indicates that it's not. Should this be a dev_info()?

That said, it's still a message every time you suspend, so perhaps even
omitting the print (or a dev_dbg()) makes more sense?

Regards,
Bjorn

> +		goto out;
> +	}
> +
>  	reinit_completion(&priv->pm_comp);
>  
>  	/* Tell DSP that suspend is happening */
> -- 
> 2.34.1
> 

