Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7E6CE8D7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 19:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKMt1e1xwwdyo6F25+2WBQwen7/c53HCz7lpJvGRleE=; b=C05Zaog7vFlzVwCm8GJiLZDxhd
	9WJYlkEzlLAiqx1GG5jFD2uIuSoBd/yXXpi+phUzhRiMm8HXuQTEO3+FUPWR426aSc8zoJlW4DWMu
	3NiSiELjDyqe1ijYtIxyNRYwrPGG282ztzbXMsisbAS1YEhHm64YbhHmFqvbZe0qL2WKHeg2Q4oYO
	D2aQojvAr6toHenWCogC1U2aDA4ZGe3xi7wvZw9mvHyV0OFSqSABv66fuckfpNeWwbm7vEupeeczY
	SydPMJ3g9siN6bGUzisI+sT8rGrSyCnHzDxZYmuRMSmaUv+bszI07EsPwmeKrfRYtI5bGLLfLk5S0
	KeHSnr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzaj-0000000D1c4-2FxQ;
	Fri, 14 Nov 2025 19:36:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzai-0000000D1bw-05n4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 19:36:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DCC260189;
	Fri, 14 Nov 2025 19:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E120DC116D0;
	Fri, 14 Nov 2025 19:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763148974;
	bh=ITF00HrK0W0pMP4VKbSDERXlz8TM7Nt545N6LU03Cqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=StIFBK5jd4GAuo9zZte+RK2fwQ52V4PCi1G0+AHF+OpYnuuoHbODPOO6Jrle2sEHw
	 p3n8I4Bhyue1WRD8BA3a1REz8sNPq1XSTEEYPFPlAVazWkCd82WOBA8y4mK5R5rBzw
	 3IH93v0uhYGxdmhY3m4nvdIYUW30up/W4uAHjZ0u12XAEYImTTR2agip0tcyAAjtwf
	 rT0fHV+xo34TMyw+8DRqcuWzrRI4GMmC0CfFsEKgEh6VqDXLR2NZYXJwW+X/SNxt/0
	 hgTaWGld3N+tdaRY1teQBx1wYcK53jQbvF6m6DbdmlNFqgm0trTP1hEYTJZOiDGwes
	 A56+2pphOc+Cg==
Date: Fri, 14 Nov 2025 13:40:42 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
Message-ID: <ej6u7f55wfhhbhmxnrubgrrzbkcsd564tkr76yieodw4ufaptl@szofah7assqe>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
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

On Wed, Nov 12, 2025 at 02:55:36PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Some qualcomm platforms use shared GPIOs. Enable support for them by
> selecting the Kconfig switch provided by GPIOLIB.
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8cb3fd0f29e277af94f20 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -316,6 +316,7 @@ config ARCH_QCOM
>  	select GPIOLIB
>  	select PINCTRL
>  	select HAVE_PWRCTRL if PCI
> +	select HAVE_SHARED_GPIOS
>  	help
>  	  This enables support for the ARMv8 based Qualcomm chipsets.
>  
> 
> -- 
> 2.51.0
> 

