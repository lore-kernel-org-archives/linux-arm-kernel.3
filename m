Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD84D11196
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 20:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LgBkLvTzdjX1tel25OOFfwnJY7q3wZ0Q6M7aSFY+C4c=; b=JqVrxFcM7ZZrfyzWHcNTgMvKEy
	L1ftIhf/aXX4dAjJusu9o9ogLuGDvnhNaf6bQnZLhPZdvb5KxTO7xUPNhfNGXUmvypxDM6ayTjMTo
	HIT1cZE7K1UuGACCeRCdQIwO6m5XMbcpCfhWbklPcBlQxrAU8yogyixIeaV1Y6kMKOeIWMknJMaGc
	1x9IbbKnyiQEAq6ITFqBSty0eXd6ejGRUmEHLWayhHIL/l56Cbxhv1jBK5me3Ttupi6BmIJxCKfXz
	t33yOWqwvlIrdczJPwrWRqsnjWgwkkEzXq9zM8Jw9lI1YaukFEOOj5rI7kTdglBam/xE4YvYcfBeY
	Jb54+i7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOLvv-0000000FbiH-1Q20;
	Wed, 26 Nov 2025 20:16:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOLvt-0000000Fbi7-1y3I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 20:16:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EF6A60234;
	Wed, 26 Nov 2025 20:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5917EC4CEF7;
	Wed, 26 Nov 2025 20:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764188168;
	bh=ca2sjCvnRDuW1i5GbDUrILqH8PBini0FSqqmDzg9C1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4BiiXZP20Qv9l5vEF/0G8HSdiQ/zOnCclpNc2G7EBpm8FCRcWKhS8jN/RZIOFHpD
	 APAGL+S+Z70XsaCsWWv1wkEQ++Mrhw0iuHNSKM7xy/0YQ/3Xhe0A5zQwTyVGzZueur
	 t5VdMjp5Jw7X5HZE26z47XWRAhvjOycRACDD27aIhcwDbrCPUhe4hDuJVhboOpKO0/
	 QqZbDmpOowikFMffVgqgcVlx+/f/dXISZoevmKh+pgaNy2YVolByud3MOokWMUdZIB
	 6Hmkazb4IZnF0ywpQfMLW2t6r9obrpzzPe/7hIkxUZbO/LQy7WeVsoYoDZo+obqWR7
	 1Tjt7qZrFatUA==
Date: Wed, 26 Nov 2025 14:21:39 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	"S.J. Wang" <shengjiu.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev, 
	linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 2/2] remoteproc: imx_dsp_rproc: Wait for suspend ACK only
 if WAIT_FW_READY is set
Message-ID: <l5udmggplyatnozipk7tjugkkzwtglckjejq67aa7q4mlywxw4@4vhjkbhjthnn>
References: <20251125124903.962295-1-iuliana.prodan@oss.nxp.com>
 <20251125124903.962295-2-iuliana.prodan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125124903.962295-2-iuliana.prodan@oss.nxp.com>
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

On Tue, Nov 25, 2025 at 02:49:03PM +0200, Iuliana Prodan (OSS) wrote:
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> 
> The DSP suspend path currently waits unconditionally
> for a suspend ack from the firmware.
> This breaks firmwares that do not implement the
> mailbox-based READY handshake, as the DSP never
> responds and system suspend fails with -EBUSY.
> 

But if the firmware doesn't implement "mailbox-based READY handshake",
do you still want to send the RP_MBOX_SUSPEND_SYSTEM message?

If so, can you clarify here in the commit message that the firmware
expects the mailbox-based message, and only the "handshake" part should
be omitted.

If that part isn't implemented either, then I think you should fix the
code to not poke the mailbox in the first place.


Also, wrap your commit message at 75 characters, please.

> The driver already uses the WAIT_FW_READY flag to
> indicate that the firmware supports the READY
> handshake at boot. Apply the same logic during
> suspend: only wait for the suspend ack when the
> firmware is expected to support it.
> 
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index fc0470aa72c1..e25dbe32ef79 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1327,10 +1327,11 @@ static int imx_dsp_suspend(struct device *dev)
>  	}
>  
>  	/*
> -	 * DSP need to save the context at suspend.
> -	 * Here waiting the response for DSP, then power can be disabled.
> +	 * The DSP must save its context during suspend.

Please double check that this comment reflect above conclusion.

Regards,
Bjorn

> +	 * Wait for a response from the DSP if required before disabling power.
>  	 */
> -	if (!wait_for_completion_timeout(&priv->pm_comp, msecs_to_jiffies(100)))
> +	if (priv->flags & WAIT_FW_READY &&
> +	    !wait_for_completion_timeout(&priv->pm_comp, msecs_to_jiffies(100)))
>  		return -EBUSY;
>  
>  out:
> -- 
> 2.34.1
> 

