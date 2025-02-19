Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9998C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 23:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUHNUTl21u97chEzY34N2q7kVnPmyYXeAitv/c3TEaE=; b=0uQ6hfHZv6FMjSFvLogAE+VFGM
	CGHiljXggB12usnih3+n/kv/K2MEIO4xSvILI5V/8kkHMU2LoFpuR1zUWY8RS9X6wEIvoDXR3HGzc
	MO78s71hOx3HFyF1AT1p7L1qQ/G0ssNthUh1d4mIZwOb+aFj3UAib7u3F1dIVnsfP9B0HDJhLJl6R
	0FZnePjYd6I3ZKnY3ruwjtFgJ6P/Fn75S8NYL/RPfrFFq5qYHEfOem+Gj4XAT4BiHVezXxVt5HPHq
	A9ntNw6iRrRobXLJLTJ3D1p6iPLJHBz5H0Vy166VUKnLjYR5I7rx0ycVdfXAEw+3lNOlf5g/IKSFV
	q6Eb4K4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tktKa-0000000Felo-2dUR;
	Wed, 19 Feb 2025 23:18:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tktFy-0000000FdIN-0S7S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 23:13:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4FCC55C57DA;
	Wed, 19 Feb 2025 23:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDA2C4CED1;
	Wed, 19 Feb 2025 23:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740006809;
	bh=1hogxnuECIzSV/Tm1A6DPdaKyUbceozlacoXk8KBzwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XzKjMpVZTHiOg2EJoOlVL4olptH5P+B4qffLfXz7wGY66guDlrYX+4e5KUQkW9sKY
	 6R2AFlEJugpdEnFSQ/H2mlGKdXx+tdG3k60h6YqhneYWj1cIjubwOvc8uf0lWHFl24
	 GgA+JrgVRpMpG56fLXy48jK7Wbe8yPsBC/s9M8RoqDFRCgNcV26n7c4r9PLszkqtr3
	 F58GOyDBrW/fBfUUInEQz3HpjhKovHygjHOpeEinKTG+VCqsXO3B0oT61JLltE1rMQ
	 BxWYAOUo22Dhf1nKmmHbXpWSW9L7WEbKobvm/IhASjJ5FS/bntuL24BQh7wgdjowg6
	 A+oCUMMd+oG3Q==
Date: Wed, 19 Feb 2025 17:13:28 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, festevam@gmail.com, krzk+dt@kernel.org,
	lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org,
	tiwai@suse.com, nicoleotsuka@gmail.com, conor+dt@kernel.org,
	perex@perex.cz, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	broonie@kernel.org, Xiubo.Lee@gmail.com
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: imx-card: Add playback-only
 and capture-only property
Message-ID: <174000680771.3151442.2014916167117128565.robh@kernel.org>
References: <20250217021715.284951-1-shengjiu.wang@nxp.com>
 <20250217021715.284951-2-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217021715.284951-2-shengjiu.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_151330_187400_AA3EAC45 
X-CRM114-Status: UNSURE (   9.91  )
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


On Mon, 17 Feb 2025 10:17:14 +0800, Shengjiu Wang wrote:
> Refer to audio graph card, add playback-only and capture-only property
> for imx-audio-card.yaml for the case that only playback or capture is
> supported.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
>  .../devicetree/bindings/sound/imx-audio-card.yaml  | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


