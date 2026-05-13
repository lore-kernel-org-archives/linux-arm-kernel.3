Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97C6CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 12:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/LWtKHej8rl18VQ26+9Bk2Tn87bwxbK6xKpE2KuPJ9k=; b=wp0wl+O2gp7tK1uJ54X6ZLu5cM
	cK9YmRNXjPIJtjI2jX0z37+iZEv+FXpqCi0T5J4xn8R+/f6COnlH66kaQytWqNvHESZZfo3iiUvdo
	In2t09Y/u4OgqyxlzyI0nqeiIndKL2lQaxDdWbxzqEq0UG/Ewx5hzx00YvfHMnW3tZMD903A5jV7J
	5Z/1xGXHscSBf5tySfKSo3zKnVNfBA4EbEgGsrvUqPnSGo8CT5RuQGpMJJxkR7Ydjzr0akwBv3D2T
	sXEx2p0M1r/jieQGDpAmC7ZxGZkicJ4MUZOSadZ1HhoYy/vgAKa80PjCbVzwsn6lOvzJmH6FXtVcJ
	YXKR+1Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN91K-00000002YZR-3rZP;
	Wed, 13 May 2026 12:49:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN91K-00000002YYt-0dTY;
	Wed, 13 May 2026 12:49:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35D6660128;
	Wed, 13 May 2026 12:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD63C2BCB7;
	Wed, 13 May 2026 12:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778676540;
	bh=ZES+3v/n1Nkqlggfz/vnQ3phe7aIMIcVw0d8QGWt8OM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kc6vRVH5PTNBaRNaERh7Vz/ywZYymqZ+dSWs+mq6C/kx7Ek9LoRhk7Ag0kpM63FG/
	 wg6JnHqWTHLAy5mOECKmWAE81lJ/7utzV/wYWaezNXHxbhhqB+MC34kQQrJVMeHHhh
	 96vJoeVvCeU/FkrcXilIyAKd8UvxlZnr+vG2Nj6OvyjnPwzqOTHoBlCH8OC/Aluk23
	 qCRKf4ozX/mYVcJn40iP8rd4JZK14w2xT7gZm2hjXyhjUxuVefl/d6sG9jZ/18A7JI
	 NKh3sA4eh/iR+hL6MhmlDCNYGpfdTL2j0Open63lzcaYPHCY0H8uuUmzyXmNK1Siid
	 7+VTyoX9zwnXQ==
Date: Wed, 13 May 2026 07:48:58 -0500
From: Rob Herring <robh@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	=?utf-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?= <mai.kuznetsov.misha@gmail.com>,
	Charalampos Mitrodimas <charmitro@posteo.net>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 2/8] media: dt-bindings: add rockchip rk3588 vicap
Message-ID: <20260513124858.GA585254-robh@kernel.org>
References: <20260508-rk3588-vicap-v4-0-6a6cd6f7c90b@collabora.com>
 <20260508-rk3588-vicap-v4-2-6a6cd6f7c90b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-rk3588-vicap-v4-2-6a6cd6f7c90b@collabora.com>
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

On Fri, May 08, 2026 at 09:31:45PM +0200, Michael Riesch wrote:
> Add documentation for the Rockchip RK3588 Video Capture (VICAP) unit. To
> that end, make the existing rockchip,rk3568-vicap documentation more
> general and introduce variant specific constraints.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../bindings/media/rockchip,rk3568-vicap.yaml      | 187 ++++++++++++++++++---
>  1 file changed, 163 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> index 18cd0a5a5318174910e04f6ef7558c92cbfec899..897ed00c239bdfe33777a8f8474fb27fa6265e49 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> @@ -15,9 +15,15 @@ description:
>    the data from camera sensors, video decoders, or other companion ICs and
>    transfers it into system main memory by AXI bus.
>  
> +  The Rockchip RK3588 Video Capture (VICAP) is similar to its RK3568
> +  counterpart, but features six MIPI CSI-2 ports and additional connections
> +  to the image signal processor (ISP) blocks.
> +
>  properties:
>    compatible:
> -    const: rockchip,rk3568-vicap
> +    enum:
> +      - rockchip,rk3568-vicap
> +      - rockchip,rk3588-vicap
>  
>    reg:
>      maxItems: 1
> @@ -26,37 +32,23 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: ACLK
> -      - description: HCLK
> -      - description: DCLK
> -      - description: ICLK
> +    minItems: 4
> +    maxItems: 5
>  
>    clock-names:
> -    items:
> -      - const: aclk
> -      - const: hclk
> -      - const: dclk
> -      - const: iclk

Just keep this here and add iclk1 on the end along with 'minItems: 4'.

> +    minItems: 4
> +    maxItems: 5


