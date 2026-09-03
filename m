Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C865C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 14:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94IZdoKFOFB8Yp+Vrvaxxz4fkqe/10RPOdJvdOjnq08=; b=gUI0i1jHRmYbH7DrpNxKgcq6hZ
	BvzFLDCmbDey3ug7x3W+PjKRotG+aQwVUAu4Eu9C1Wah2JQOOX0OQCOe337Xsjr2+Gcs2U10riT6o
	nHeHS3Rz9XYlNC0JCSSHNrjmolwhiE9gHdejbQJRXDPMklFTO+pMrheAVkOmYY7bE9AjITMVgCRza
	Pml1R3ZF0/foTjRKrEhXDlYL0U3+Re7nnFyLDon4dOQh7Ya3xy0dPDkLLAfIVmH/06xaCk7BjSK6p
	Eu8gEhRGE+m+lGODxvEQ7hq9NCS+oXhJi3kOuZDs7PPQUDoQW0RVC6/o0X+NMNifj9qA8adO3CX3U
	MxZKHAXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28Mm-0000000HVUL-372B;
	Thu, 03 Sep 2026 14:24:36 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28Mj-0000000HVTM-2eZ5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 14:24:35 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48444ec4fe2so1373293f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 07:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788445471; x=1789050271; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=94IZdoKFOFB8Yp+Vrvaxxz4fkqe/10RPOdJvdOjnq08=;
        b=eJF2g++dgbggm7RYhDj7HJl6PesWmHNGUy0OjI2yC+15GCck638WLnlZXXslK3Vu2M
         44H7KLmft2Unv1QRJci9vY01gCBWV0BF62ptn4wSnv2JhM9d3ej8/KaBpoS0fabwsRZX
         O8pU43JovU5zf1NJb6t//1ZV69UVPgx3YyqsyV36+JaQv6qVuGPxQZplnH/Sr/5pAkZq
         RuvPA+pgquV9qyPZLIz9TBkbS7NHnPgePWFv8iHaQ/NBK5kQSpil3wS+o72aqLNG75kt
         RGSXBo2pMwbJlahlQF7fumJ76v5lsMa0/hTQP4EwMB5EcHBlQF/K1zTuyNXlvF0Huo58
         9a3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788445471; x=1789050271;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=94IZdoKFOFB8Yp+Vrvaxxz4fkqe/10RPOdJvdOjnq08=;
        b=XMLtnP0q4ymkM0Z/5NnLGHj0i4Er6h3igaiMCtrDRX0U/SIWudE6i7kFCrqKFH0dn8
         rTEg6MOgZ39rvdCWItSCEhaJQ7la0cp2J8ALa685o7SgcfOnFNaD0emKEZgwYJa3dmDP
         OBKz50XEYuqDGOH/EtpydPp5hk0YrhL6C/0ptzrDpwpHn4EMb6fu+FvJu6e17yZo+TSv
         35dTnE+Ppob34vHBYQHr7DsCUHyMXMa625UBam0fDoS8qNJFBwTiZ9SREV7qWvdLBSUT
         buqrbzYRQXF9mpWbijHk7KrUBVEy5X9VBJ7XRuRyEacyt+KdIWXrZH+MEhlJ0/KjvKaP
         74tA==
X-Forwarded-Encrypted: i=1; AKwUvBzxYOxAOSCQACvviYG4pggnEMWBBvMQW1lM1LZeftt9bMUwQUgnkkrkZJBjFwL56I+aGCGWJLpth+0c6AZgeFfL@lists.infradead.org
X-Gm-Message-State: AFuF++kFYRn9tBRBMSTiwOdnXul/79ltmAyS2PQvr5apb6A0vBM8lZM0
	UI5UD1SxrLtn0716qvYQZakb4Be87nBIvMRIaSX0FUp1wLC3XtBiyCkrPv8/DQK+EXI=
X-Gm-Gg: AYBFou1KSbjlEyvdQVeYBFCcUyBWzjtIT8dL+Qurb4yl2DsOZBhz5G3W1Fmks347CR4
	IlALnjaF0bBgnhxNjQH9MKTsrlwwtUuXB5Lbnikz17X2VkzjEH0FJ1HQV6BzYs+VAwIY+1anWIY
	tbiWIf9/zUIfsx/OekmCjiuJedlFvhRtqmm0olNodMXfIu10NrHQu+XoVFJvdZl3p7SFy0y8c74
	0X5hTKeMXbAidylsdpFIh5M3/6HhSJml2zIVLUWPOpTL/EpTu2LqJGkoVoPWis0boNpQhECopbu
	SqqBPfwRfTG6P8cZP2qHAChIIO8XbooXSptvmrOG9htY9QKoy1+szBqIek8PCZR+SciSb8DRjUd
	NvhnXW7TrlX2VGEyxlmpnnH3hx9YWxtTHGrQoFw10FrJP0AUkj6kLKiPRQNVzun0/A77IJpD4Dh
	IxJ1/jhutSbNEM9yVimeMvHhXDEDPzlEX04GvHsW7ZJDkul/wed1uzucfzozPVkIrjG8IY
X-Received: by 2002:a5d:5e87:0:b0:485:8101:dc40 with SMTP id ffacd0b85a97d-4858101dd2amr5715406f8f.9.1788445466583;
        Thu, 03 Sep 2026 07:24:26 -0700 (PDT)
Received: from localhost ([194.183.24.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed3706sm14464261f8f.18.2026.09.03.07.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:24:26 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 3 Sep 2026 16:28:04 +0200
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>
Subject: Re: [PATCH 1/3] arm64: dts: broadcom: bcm2712: add arm PMU
Message-ID: <apmD9OrMiGRiU5Yg@apocalypse>
References: <20260802145109.728793-1-pbrobinson@gmail.com>
 <20260802145109.728793-2-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802145109.728793-2-pbrobinson@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_072433_688000_17B58A05 
X-CRM114-Status: GOOD (  19.38  )
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

Hi Peter,

On 15:50 Sun 02 Aug     , Peter Robinson wrote:
> The bcm2712 SoC in the Raspberry Pi 5 has a standard
> arm performance management unit that aligns with the
> Cortex-A76 cores that are in the SoC so add the details
> in so it can be used.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com
> ---
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> index 9b36ecd7bba54..ae1fc9d728c00 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> @@ -10,6 +10,15 @@ / {
>  
>  	interrupt-parent = <&gicv2>;
>  
> +	arm-pmu {
> +		compatible = "arm,cortex-a76-pmu";
> +		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
> +	};
> +
>  	clocks {
>  		/* The oscillator is the root of the clock tree. */
>  		clk_osc: clk-osc {
> -- 
> 2.55.0
>

Tested-by: Andrea della Porta <andrea.porta@suse.com> 
Reviewed-by: Andrea della Porta <andrea.porta@suse.com> 

