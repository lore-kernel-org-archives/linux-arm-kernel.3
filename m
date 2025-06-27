Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA05C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FMbaBQdFnuRHLmTwdguu7wsCdpFCc+3g+Au7TTcmw4=; b=NjS4Q3dPTgoYXCs/wxcjfnHg4g
	osAbUIfS+HiCjotk4GzGzow4oTVoa0vVUJKtXNUWXGkCrSw+NLp+Aqvlh7SIRj2Z8rivAsk/+sWPa
	389FVgyDm6suzUpU0YDkrAu2vGvjkD9Z53UxM2FXRkbtCr/1X5bNQ74+Qw37JaiEIMgU7BsAbuOAK
	pV82rAWijjTsRJfHZhSvsfT6dia13XwxHalb8/f7PDKZr321B4blFStsDWPoAuckiBYwCkbIIw/m4
	U6VaOoBG6FTXB1q4efOH1TwyP2QHPciReZyGoeuVPkaDdZ53KB77TE4Ph+10nheAQuxTcv+wmUVx5
	TJFtn0og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVF7D-0000000FhAM-3ABG;
	Fri, 27 Jun 2025 19:52:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEtx-0000000Ff0z-0TqS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 19:38:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 64D6C4475F;
	Fri, 27 Jun 2025 19:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E1FC4CEE3;
	Fri, 27 Jun 2025 19:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751053099;
	bh=735/kAbCuqWFzGQy/87S1JSxB/l43GhAFiWH7b5eExk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hv3JKSY7xsPIult6z98FBvCjWmWYP+vOw7hFbC3qqSEDzWLGlk9PB39DMgGDn4NbS
	 pHfesi22YUwypbfO06LdjDiPBepbwwUV1YFgR4acriSIeqXYQWqEBT+xyJhpOeahKn
	 r2iS7ymkJ5GArX5aC8dKyaISXLaOO5Cq2/hrfIwT9OBZc2jZFjLwGn8cgyMsk+DUDu
	 /ZgfrfM7hy2HGNXH29qTY70aGBlxRrIEeXfZirFgMwfS+LY3sw1hA1uPy8d+GHKjZx
	 gtBQo+pT8bnVY0eWfKkuhV+Sf8qJss6lFFzr2aDlf9dKhPRoW+bnqVgaCd8+lcWERm
	 wYwtnbRbpOv4w==
Date: Fri, 27 Jun 2025 14:38:18 -0500
From: Rob Herring <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	"open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS" <linux-media@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	"open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)" <linux-gpio@vger.kernel.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>
Subject: Re: [PATCH v4 04/19] dt-bindings: media: i2c: max96717: add support
 for pinctrl/pinconf
Message-ID: <20250627193818.GA4051037-robh@kernel.org>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
 <20250618095858.2145209-5-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618095858.2145209-5-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_123821_217223_7B985FD0 
X-CRM114-Status: GOOD (  16.30  )
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

On Wed, Jun 18, 2025 at 12:58:40PM +0300, Cosmin Tanislav wrote:
> MAX96717 is capable of configuring various pin properties.
> 
> Add pinctrl/pinconf properties to support this usecase.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max96717.yaml    | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index 167c3dd50683..5998e2518be9 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -121,6 +121,116 @@ required:
>    - reg
>    - ports
>  
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      function:
> +        enum: [gpio, rclkout]
> +
> +      pins: true
> +      drive-open-drain: true
> +      drive-push-pull: true
> +      bias-disable: true
> +      output-disable: true
> +      output-enable: true
> +      output-low: true
> +      output-high: true
> +      input-enable: true
> +
> +      slew-rate:
> +        description: |
> +          Slew rate.
> +          0 - Fastest
> +          1 - Fast
> +          2 - Slow
> +          3 - Slowest
> +        maximum: 3
> +
> +      bias-pull-up:
> +        oneOf:
> +          - type: boolean
> +            description: Enable regular 40kOhm pull-up
> +          - enum: [ 40000, 1000000 ]
> +            description: Enable either the 40kOhm or the 1MOhm pull-up
> +
> +      bias-pull-down:
> +        oneOf:
> +          - type: boolean
> +            description: Enable regular 40kOhm pull-down
> +          - enum: [ 40000, 1000000 ]
> +            description: Enable either the 40kOhm or the 1MOhm pull-down
> +
> +      maxim,jitter-compensation:
> +        type: boolean
> +        description: Enables jitter compensation.
> +
> +      maxim,gmsl-tx:
> +        type: boolean
> +        description: Enable transmitting pin value to GMSL link.
> +
> +      maxim,gmsl-rx:
> +        type: boolean
> +        description: Enable receiving pin value from GMSL link.
> +
> +      maxim,gmsl-tx-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Identifier used while transmitting value to GMSL link.
> +          Default value matches the pin number.
> +        minimum: 0

The minimum is already 0 being unsigned. Elsewhere too.

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

