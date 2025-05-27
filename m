Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C6CC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 19:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yo3bhQdaPl9dYtLJru6xJKEpsk1miKUUzV53rooI+qI=; b=lTvF+UEHnn9MvtCPCgLrL+uCu9
	H96YBZBWNZO+7L9kQ1b/SkJSrpVnv8uTsEdg1X4IveUG0y7OL6P+Dlt0bQ78GUivy7baa2Nvc7EsS
	f0caRBpSb0UNwReRj5hbmQBTcvhRU+e2ZacC2tlftlMk2xgEg6zBk1ajukvfF5TF3Ss6QGPLFCjfP
	mCV3VH2EmAbRKLkW7OU2sjFiW4gPh4eou68+kx8RA1oX7qyHtPlpxv3vpjZZL5BE0n/bSzUpsHdYu
	+gorOJhxIZuYoZiw97yIJxiy6G2S9cbSSnLGDVe+ZXKRiVo1eykBFmYAZEzS3CbjBGLn3NVny+lmC
	PE0zTaLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK09H-0000000BS7l-14aI;
	Tue, 27 May 2025 19:39:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK04Q-0000000BRZt-3LtU;
	Tue, 27 May 2025 19:34:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F1CB9A4F2ED;
	Tue, 27 May 2025 19:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F4EC4CEE9;
	Tue, 27 May 2025 19:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748374481;
	bh=/h34jjkP8Tzegi+t/1woEurKobo1VjvZzZ4R9+gNIYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PhPia81TIe3Dg79bgkliFloVIeCDISxZ9ufFJkL734ooVeE42cK1mFQALvIa9AbE4
	 QI4jwwMZ9XrTAwd15ptjEXrUHPE/nISJ5rODk1d5EmiDpaBNKM9YBI5A+BwZDpy43H
	 kr0AAkQcOPTwsKF05CuEUo82vtXjtc6a9H1B/d2eldgiRIsq8InCm6vnc/+cirvBzh
	 2czuBVSw9jlEmNYRKFnzdjoeEGsDHSt29e+YbKnwNQqhvRfbmkOC6XvayihEQKhVAd
	 OfmlM36ik/twqLUlPYRb3J1Ap0vCIcoEfYQwnZon2N7aPqrVRPkH35sMh5MfTvOl7Y
	 akViLmW9olW5w==
Date: Tue, 27 May 2025 14:34:39 -0500
From: Rob Herring <robh@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>, linux-rockchip@lists.infradead.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] dt-bindings: gpio: rockchip: Allow use of a
 power-domain
Message-ID: <20250527193439.GA1101149-robh@kernel.org>
References: <20250518220707.669515-1-jonas@kwiboo.se>
 <20250518220707.669515-7-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250518220707.669515-7-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_123442_897750_CBD10D8F 
X-CRM114-Status: GOOD (  17.05  )
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

On Sun, May 18, 2025 at 10:06:53PM +0000, Jonas Karlman wrote:
> The GPIO controllers in most Rockchip SoCs are part or power domains
> that are always powered on, i.e. PD_BUS or PD_PMU.

Are these described in DT, so this is valid to add for all SoCs?

> On RK3528 the GPIO controllers are spread out among the PD_RKVENC, PD_VO
> and PD_VPU power domains.

So should be required for RK3528?

> 
> Add support to describe power-domains for the GPIO controllers.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> index d76987ce8e50..bdd83f42615c 100644
> --- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> @@ -41,6 +41,9 @@ properties:
>    "#interrupt-cells":
>      const: 2
>  
> +  power-domains:
> +    maxItems: 1
> +
>  patternProperties:
>    "^.+-hog(-[0-9]+)?$":
>      type: object
> -- 
> 2.49.0
> 

