Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D131C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 08:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qi6w7r5P/Ge/PKpEpWHhufA1GBE7d2tXP0ySCwD2dqs=; b=GPfkXoNKyrlSGErNLGXud1m18/
	s0PvjmcgG+wzRSzKXVcqxv9q1hZmpn1GzTCAPUpbXyXLxyRkot6YXvt44do45Qc+XUxFepz7/bNQA
	Fopdv2Nie3kucjRxdbGSSEvu5zh8w9gpMfzjEOHQ1eBBPdrC5RCaCXC/uOxwXFnLrtKV2r6IVyEXH
	YneuH7iT+AIOLy+wgxqc2Wc9CYnlggOrIL8r1HUlRKBoAAXNdCjyFA+6CINOGjosKizGt8AmwYcYR
	8TQeJCMf0wA/QXrsZjVuSP+mXUCKSkvuW37AqVbvDTw0VOpzWoAwibIPyAuvOHGdyVw/2YVcyBSc4
	0hCOT7Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOZz-00000004kIt-2s9S;
	Fri, 21 Feb 2025 08:40:15 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOYS-00000004k0k-0ph8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 08:38:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740127120; x=1771663120;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nqodSYX9zfwa+wP+jRooDOmd19luEYIiS/x1QP3QuqQ=;
  b=cRNDj7Dyy5ybFnbejEr3tuNkbavsqAPRmB92vlO9nit68D0zi74awByQ
   GPJKTTsVYw/AtnWNOlWBhIRo/lN43rNTELpuUAZSU5TVZ945Wjuk6ptZo
   Sni8uCdGcI0NAoxw45dhYLt+Q6bMTVOfSYaRczJF1y2hgEEWZ98LZ7vnX
   wViGeUxKA+nyQRJB8UFV93DQ+HMl88m9qSc7ru4jM+OwIf+4hy/DSUWDP
   U+TX+xvF27wV1FLk5iqIslULaj+eOSSreuHT3i85ITAPBsuPNiu17Zf0c
   DoQ9Jr6zzvt1ORrG8r8XCNxcNtWwXJzkwpAv3KQl9CwedjxDI+eziLSHA
   Q==;
X-CSE-ConnectionGUID: ssdphKa0TV+jTNgZQu/BkQ==
X-CSE-MsgGUID: ukVb6hFLQqKffgb8ms7siw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="41058465"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="41058465"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 00:38:39 -0800
X-CSE-ConnectionGUID: yBxMvSy1Rh+CXJ0lab4mqA==
X-CSE-MsgGUID: 08+yRwERQR+OdaXElvcbxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="115255765"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 00:38:35 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 81C82120289;
	Fri, 21 Feb 2025 10:38:32 +0200 (EET)
Date: Fri, 21 Feb 2025 08:38:32 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: media: video-interfaces: add support
 for Virtual Channel IDs
Message-ID: <Z7g7iCUlsUN2LBIW@kekkonen.localdomain>
References: <20250220230818.275262-1-demonsingur@gmail.com>
 <20250220230818.275262-2-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220230818.275262-2-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_003840_274002_9894019E 
X-CRM114-Status: GOOD (  26.30  )
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

Hi Cosmin,

Thanks for the patches.

On Fri, Feb 21, 2025 at 01:08:09AM +0200, Cosmin Tanislav wrote:
> Multi-camera systems often have issues with receiving video streams
> from multiple cameras at the same time because the cameras use the same
> Virtual Channel IDs.
> 
> CSI bridges might not support remapping the Virtual Channel IDs, making
> it impossible to receive the separate video streams at the same
> time, while the CSI receiver is able to de-mux streams based on VC IDs.
> 
> Cameras sometimes have support for changing the VC IDs they output
> themselves.
> 
> For a practical example, GMSL2 deserializer chips do not support VC ID
> remapping in tunnel mode, and neither do the serializers. Allowing the
> cameras to have their VC IDs configured would allow multi-camera setups
> to use tunnel mode.

We've tried to avoid having virtual channels in firmware and in UAPI,
I'm not yet entirely convinced we need to depart from the established
practices. Let's see. Apart from that, please see my comments below.

> 
> Add support for specifying these Virtual Channel IDs in Video Interface
> Endpoints. The supported values are 0 to 3, with a maximum of 4 values.
> Although the CSI-2 specification allows for up to 32 virtual channels,
> most hardware doesn't support more than 4. This can be extended later
> if need be.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../devicetree/bindings/media/video-interfaces.yaml   | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> index 038e85b45befa..414b5fa8f3472 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> @@ -231,6 +231,17 @@ properties:
>        shall be interpreted as 0 (ABC). This property is valid for CSI-2 C-PHY
>        busses only.
>  
> +  vc-ids:

Other properties aren't using abbreviations, at least most of them. How
about "virtual-channels"?

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 4

Shouldn't this be 32?

> +    items:
> +      maximum: 3

31 here, too.

> +    description:
> +      An array of Virtual Channel IDs. These are unsigned integers that specify

I'd leave out the explanation on the data type. It's redundant.

> +      the VC IDs used by the device for its data streams. This property is valid
> +      for MIPI CSI-2 only.
> +
>    strobe:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [ 0, 1 ]

-- 
Kind regards,

Sakari Ailus

