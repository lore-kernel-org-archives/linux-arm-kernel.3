Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6586070CAD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gSBV2NKy;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tp0L74ts
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UAE+EXa2m8qZYQHjXbDMZQ7NH0V7cyRl19PP1GlhUu0=; b=gSBV2NKy17pIj5GAuj0Nu0piM8
	tD+Dlm/6M3T+jPauDQ2fx2qtJuh+5RxwBoxFADKbCHlomcWwGllpdSaCEgRaQ3sBIQj7PHp85yYky
	JpInlVyrrxdqlfxs7p42C4l4DmBPmxgXczEHIEzrYLS7RMl8xIwRTRWzsQxFbNzoMEi0gK78h3YFP
	D6slMXhHpiEyEmm2jtgVSv2QPjWMkMMN3GlUDWE89zwdeuHAx7wAXp0jxuyLIDJqb2kOAUwbhJetx
	z26RAjPtmZSpHY/M+vs4l6IAT9Bd2nbAEPBLddGvDWL1Ez3J0Rqxo2+P1XK4PIS9OTb8UBCuhiPE7
	TxCm1aWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsxk-0000000GnSF-1dK3;
	Mon, 02 Nov 2026 14:24:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsxi-0000000GnQJ-13N2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 14:24:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EEFE543977;
	Mon,  2 Nov 2026 14:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83CDA1F00A16;
	Mon,  2 Nov 2026 14:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793629477;
	bh=UAE+EXa2m8qZYQHjXbDMZQ7NH0V7cyRl19PP1GlhUu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tp0L74tsn9ZbGinp3afTlLuPKdsUT53/tzF8WGLTz1KnqL41FhK3fDQpPTMTo+t3L
	 pWCaEEuTBt1SmDmsF83slzeXX0byZtIBB3f6decq62kGbM1rjH+xzbY2Rg0CU9A4Mz
	 BHUm1RIR7dDA3ZWuCawZxCMdtXoqwpT0FOuZ8z58=
Date: Mon, 2 Nov 2026 15:24:30 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH] arm64: defconfig: Enable PINCTRL_S32G2
Message-ID: <2026110233-unlocked-outclass-9584@gregkh>
References: <20261102141635.3768024-1-khristineandreea.barbulescu@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102141635.3768024-1-khristineandreea.barbulescu@oss.nxp.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 03:16:35PM +0100, Khristine Andreea Barbulescu wrote:
> Enable the NXP S32G2 pin controller driver in the arm64 defconfig so it
> no longer requires a manual "make menuconfig" step. The symbol selects
> PINCTRL_S32CC, pulling in the common S32 pin controller support used
> across the S32G family.
> 
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 7b4985b29b21..545a2b7db8a5 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -704,6 +704,7 @@ CONFIG_PINCTRL_BCM2712=y
>  CONFIG_PINCTRL_SKY1=y
>  CONFIG_PINCTRL_IMX_SCMI=y
>  CONFIG_PINCTRL_IMX91=y
> +CONFIG_PINCTRL_S32G2=y

Why?  Shouldn't the normal platform-specific defconfig work for this
instead?  what defines the arm64 defconfig to require this now for all
arm74 platforms?

thanks,

greg k-h

