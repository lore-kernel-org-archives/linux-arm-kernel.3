Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73E6C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eq8D7b99yw3Y7viV0W3bDNKPEc6hnF+oLe9WxqDR290=; b=C7KzLI7uGh7GzZJTfL8u7g1mlz
	0b4xdn88POdkaV6xTh3/Rk6FklH85XugvLoUi2rM/Di7+uyiB5NF0o5QWvVdwn2tLQmNkB/4+h7h3
	N8TtFcj1KtX4g8Y58KYp9aD2R6CYnR/gMw5KtH/pK89CK5AfABXFJXKAjWZyz4JxloE7XfXE0GqYO
	We/KBK/x+bpCvBcoJvhab58v/GeeMqs5pmcnapg3xKCGyfqrbo+i/doFr06Ws+LLAlwImadIZ1+MF
	zW3DGAx0rqLcjPRPVpNLWazrPSgRjpFWcPOUflkbs7ej6DomNWPdPwhiDCKYw5K3FLnKRbfdliCc1
	ezh88sow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trdJC-00000002oTP-0Mf7;
	Mon, 10 Mar 2025 13:36:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcIk-00000002dUn-2zQ1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:32:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A6D65C631F;
	Mon, 10 Mar 2025 12:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D320C4CEEA;
	Mon, 10 Mar 2025 12:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741609929;
	bh=+yJXW3oB2sKwOAYNjS/cyatF0So7vPbPll756fs5Nps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XY0FhGNz/+TRaq1rubNK8SAY4CBRiH1RDdjwpGzDXcryn/LGrKkpSiJXxMN05qTto
	 GktCOuoFSdnUrIfGHOgrQo1OZFKBgcTJnyRqazDKuhi69HD8z3SJjX6rQDCAQ86oI9
	 H6KWiijonJVFQ+kGlJ3Qwx8/N7RZlUiYRaT3zAB/eLpnodG4uneirLn775Umqp9GvP
	 FTw5LBehq9qDwlE/arO5Xh9TtJW5betOcs0PF/moAReVhf2hEvMQuStoZ2EhVYtjtC
	 XbxYxvPMHJNgDlOusvJQWYu1/xgKTNZQCi+z0HAHBB5dn0RwjotXYCFZXjm6SVxsxT
	 lBwykbgDebHfQ==
Date: Mon, 10 Mar 2025 07:32:07 -0500
From: Rob Herring <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [RFC PATCH 09/24] dt-bindings: media: i2c: max96714: make
 i2c-gate conditional on compatible
Message-ID: <20250310123207.GA3853920-robh@kernel.org>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
 <20250308183410.3013996-10-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308183410.3013996-10-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_053210_835132_B46C98CB 
X-CRM114-Status: GOOD (  18.19  )
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

On Sat, Mar 08, 2025 at 08:33:38PM +0200, Cosmin Tanislav wrote:
> Devices to be added in following patches don't use I2C gate.
> 
> Make this property conditional on the compatible strings.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max96714.yaml    | 21 ++++++++++++-------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
> index 2f453189338f..d0a2aaf7df9c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
> @@ -84,14 +84,6 @@ properties:
>      required:
>        - port@1
>  
> -  i2c-gate:
> -    $ref: /schemas/i2c/i2c-gate.yaml
> -    unevaluatedProperties: false
> -    description:
> -      The MAX96714 will pass through and forward the I2C requests from the
> -      incoming I2C bus over the GMSL2 link. Therefore it supports an i2c-gate
> -      subnode to configure a serializer.
> -
>    port0-poc-supply:
>      description: Regulator providing Power over Coax for the GMSL port
>  
> @@ -101,6 +93,19 @@ required:
>    - ports
>  
>  additionalProperties: false
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - maxim,max96714
> +              - maxim,max96714f
> +    then:
> +      properties:
> +        i2c-gate:

Leave the original definition, invert the 'if', and here you just need:

i2c-gate: false

> +          $ref: /schemas/i2c/i2c-gate.yaml
> +          unevaluatedProperties: false
>  
>  examples:
>    - |
> -- 
> 2.48.1
> 

