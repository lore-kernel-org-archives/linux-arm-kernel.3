Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714F4FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 09:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdR4ZBFf3zX5HEGCtvdn0rELxAnYKrOtBZwiBhLPovQ=; b=sk46k7G6ZcOarzeHPwo83Wre1t
	nB2KjbYky6um77/H96kIpIO8Sw7PLSGIfJU3QqcUpMU10PM6/Fho4adsXgGbhQWTayMrmNurwctCw
	lX1SNTDIR6zQltN8kW8NEg/NtiIsD5VgK29tqo8x+qRjvSf87SVNkWEG2UkcLC+L8VX8M2oWzcXPf
	j8FgFXpDjpfjwy3vZ5EA9YQxQMoAp01GxbA4JCp8sx24oEbaCX5Wmdvvlpes+4qAMIlxNg4VE5+Ga
	oEk+Iwwsl9FpjEWiJ0gIUVOekucnm4FIg4TpY2BbsocaIuVLCEcwYnOgdMHqBB5iU/U1WW5JOH/tY
	CYQx4M/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZih-0000000EJnA-0J9B;
	Sat, 25 Apr 2026 09:54:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZif-0000000EJmo-0Gvb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 09:54:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B4A3A41866;
	Sat, 25 Apr 2026 09:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3858C2BCB5;
	Sat, 25 Apr 2026 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777110875;
	bh=RTKJFkZOhPvSkw4w1T5IdZXZkOeETqyobx085qFKyh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XFm/6Ir0UoLq2kqL/P6LiY88zut5JBR0WxqAguLcedSe9xjim+tjjko8QnNSavNvB
	 6XHYz+D2CRO6BO+Gx3lI30y0pu8sO8sOX6CpxHRglsvlm9Rw6z1f7+GdjxgyDy5O0R
	 yND4prjQDM0XaTC4XmbUhf1v1XOnxHwEHBcOgOw8vsEu0Cd2YY5L8d18KuRccNSflz
	 nTaxduh7rAAWfXdPbK/fNFb3toSgSgXuhr/ZsWWt+TDesHI//MM7Htd8pdphJYKfFy
	 sjYg0qnCmpeSTHSeY8IhZEl0jVvcAC/q7OwOcD7RAx03RDyeJt0n9I7i8r9JyOTiNw
	 oH4+7vR90xH3Q==
Date: Sat, 25 Apr 2026 11:54:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukas Timmermann <linux@timmermann.space>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Douglas Anderson <dianders@chromium.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH 1/5] dt-bindings: display: panel: Document Samsung
 LTL101DL02-002 panel
Message-ID: <20260425-subtle-silent-dolphin-0a7ae3@quoll>
References: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
 <20260423-manta-display-v1-1-196f80c5673a@timmermann.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260423-manta-display-v1-1-196f80c5673a@timmermann.space>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_025437_147925_F87341F0 
X-CRM114-Status: GOOD (  14.37  )
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

On Thu, Apr 23, 2026 at 11:14:37PM +0200, Lukas Timmermann wrote:
> From: Alexandre Marquet <tb@a-marquet.fr>
> 
> Add the dt-bindings for the LTL101DL02-002 panel.
> 
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> Signed-off-by: Lukas Timmermann	<linux@timmermann.space>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 24e277b19094..2de0a3a6d1fe 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -283,6 +283,8 @@ properties:
>          # Samsung Electronics 10.6" FWXGA (1366x768) TFT LCD panel
>        - samsung,ltl106al01
>          # Samsung Electronics 10.1" WSVGA TFT LCD panel
> +      - samsung,ltl101dl02-002

This looks like incorrectly placed (101 < 106) and comment should be
above the compatible, at least judging by context.

> +        # Samsung Electronics 10.1" WQXGA (2560x1600) TFT LCD panel
>        - samsung,ltn101nt05

Best regards,
Krzysztof


