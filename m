Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF8CCD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rr93txAorkGK4w7kSiV9wcRvir3FWXid5u8/S3kOYh8=; b=SjLbTvYEqJd3z7smyQVdJm54q5
	+KEZ5hNvnyb18A73b4GPE5Mo+zD119TGtbksYSZ4+kjhZckvjbWpqOyH9x+c0bA+CGoGy6poovuxr
	30dhREy5Yg3q4jGCtH5qAK6thelVlO3QOhU36145zzSbEA0ILo8swuIJrIv0KtBzdBJP5HVTRXHfc
	4oIrFVDLtEww3pj4tyb7KA+2bBG+AYQEBw+J8HZdcolL69iElwcUXNdqYeMrJJ1q1zfbGzROTBlBp
	j6dj3s/Fsa2IQaJyyOITcPXtCdRoMrZS4ILm124ya1EkF2U407XXkJDF1groBVBadN7+MXC9SpD2d
	5Jl9bITg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0XW-00000007wbM-0RS8;
	Fri, 29 May 2026 16:58:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0XT-00000007waR-4BRL;
	Fri, 29 May 2026 16:58:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 39E1D403AF;
	Fri, 29 May 2026 16:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794101F00893;
	Fri, 29 May 2026 16:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780073907;
	bh=Rr93txAorkGK4w7kSiV9wcRvir3FWXid5u8/S3kOYh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YcdEd8KIrgqEjIJyzfEWp3wxA2BOaPQFdZlliH+hhKlBpjybWVcwk0zVC6bgK5YTR
	 RmnqI08n1+vYEJMy4t8kaL28I/0vBbs8kisVrBWt4MBPRPPKVXK8zs4hov/GJ/al6F
	 AHt9PSSgT3oGgXaSXqe6NxsSK0q4PYe4GSO/3OyZMhBdkmr5XdhUmDf/OazuTy8zIM
	 pZmWz+Hx9kJHzKe6wH3BejyNDN0Vzad/IOXlRwj7othy/nDthuEY4IAlgp7pNCl3Zc
	 +eyfImujLBctVUARngY8my0TXcuI3qqcT5R5XiB4jgJHik3fElcHZ3O35fGpKUW+Uz
	 j1DqtFpAdUTVA==
Date: Fri, 29 May 2026 18:58:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Can Guo <can.guo@oss.qualcomm.com>
Cc: bvanassche@acm.org, beanhuo@micron.com, peter.wang@mediatek.com, 
	martin.petersen@oracle.com, mani@kernel.org, linux-scsi@vger.kernel.org, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Zhaoming Luo <zhml@posteo.com>, 
	Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: ufs: Document static TX Equalization
 settings properties
Message-ID: <20260529-neat-bright-shellfish-eab5e8@quoll>
References: <20260529113338.984301-1-can.guo@oss.qualcomm.com>
 <20260529113338.984301-2-can.guo@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260529113338.984301-2-can.guo@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_095828_086154_48CD99C0 
X-CRM114-Status: GOOD (  17.67  )
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

On Fri, May 29, 2026 at 04:33:37AM -0700, Can Guo wrote:
> UFS v5.0/UFSHCI v5.0 add HS-G6 support (46.6 Gbps/lane) via UniPro v3.0
> and M-PHY v6.0. In these specs, TX Equalization is defined for all High
> Speed Gears (not only HS-G6) to compensate channel loss and improve signal
> integrity at high speed operation.
> 
> For HS-G6, M-PHY uses PAM4 1b1b line coding, Pre-Coding may also be
> required depending on channel characteristics.
> 
> Add vendor-neutral DT properties:
> 
> - patternProperties for txeq-preshoot-g[1-6] and txeq-deemphasis-g[1-6]
> - fixed property tx-precode-enable-g6
> 
> Each property is a uint32 array of per-lane tuples:
> <Host_Lane0 Device_Lane0>, [<Host_Lane1 Device_Lane1>]
> 
> Accept 2 or 4 values (x1/x2 lane configs). PreShoot and DeEmphasis values
> are 0..7. Precode enable values are 0/1 and only applicable to HS-G6.
> 
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Bean Huo <beanhuo@micron.com>
> Reviewed-by: Peter Wang <peter.wang@mediatek.com>
> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/ufs/ufs-common.yaml   | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
> index ed97f5682509..d90cf25adfa5 100644
> --- a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
> +++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
> @@ -105,6 +105,51 @@ properties:
>        Restricts the UFS controller to rate-a or rate-b for both TX and
>        RX directions.
>  
> +  tx-precode-enable-g6:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    oneOf:
> +      - minItems: 2
> +        maxItems: 2
> +      - minItems: 4
> +        maxItems: 4
> +    items:
> +      enum: [0, 1]
> +    description: |
> +      Static TX Precode enable values for HS-G6 only.
> +      Values are specified as per-lane tuples:
> +      <Host_Lane0 Device_Lane0>, [<Host_Lane1 Device_Lane1>].

You need to include them in any of applicable examples, otherwise
nothing here is validated.

Why values cannot be on or off? Or even better: why you cannot just list
all the lanes which has it enabled, assuming disabled is by default?

> +
> +patternProperties:
> +  "^txeq-preshoot-g[1-6]$":
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    oneOf:
> +      - minItems: 2
> +        maxItems: 2
> +      - minItems: 4
> +        maxItems: 4
> +    items:
> +      minimum: 0
> +      maximum: 7

What is the meaning of values? Nothing here refers to the spec, so is
this driver specific?

Best regards,
Krzysztof


