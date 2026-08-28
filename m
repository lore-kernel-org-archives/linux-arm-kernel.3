Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53ACBC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 10:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O19Kqaz7Dc0R78cpyBBCb7hRpvdqq1kuEoC+NWYg7mY=; b=RgRkW1Tr7klFQn6ndYvBv7+13v
	/Jxsx2CVoNpqppKBexjZtkcdgLUGR+Lwo+h38/Dl+XTckRgggIGmvGh/G16GB3RZTgFtSb22jwpPG
	9Rrb4Uv6OVq2bi4R4zD+dEBkfyMo4GnguVIPGRXoEJvDWmyazAwqgvvONgfORe6kMcPxxPbwDMaWd
	DNeJGxg97Jy7xQBwZpmQuSw3+otCXaxGpJBE4+a8hvl56b4PSECl6KcB5Nj4xu+lazE87Q66/kdEY
	73N04JCV0O+m+s52DBnlhWasYnSMD8ykDQs7XvyYqXCKB1rjPCIl4xlVwhNuvP4mNryFyjtpM8C2k
	WfCiOelw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wztoi-00000005Ze9-479V;
	Fri, 28 Aug 2026 10:28:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wztoh-00000005Zdt-0JO7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 10:28:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 19CE7601F5;
	Fri, 28 Aug 2026 10:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 052001F000E9;
	Fri, 28 Aug 2026 10:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787912889;
	bh=O19Kqaz7Dc0R78cpyBBCb7hRpvdqq1kuEoC+NWYg7mY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HIjWXox84GVYA5/r5qnIDGTHPXsVfcElHLj7e6zkZzow0JfkOrlXCrbBE9kcfljnT
	 rO62Mb40W98e75UU5oJhfnTA8MOIfKbeshdvlhuz2m1iMDND8DDfxUs/xTD/oFC8hn
	 MQMcrg70klncgs4VW1DD5B9ztlK7OyaOretgMGZIfgpidmjJKzk03fyFmyuDU1eKCO
	 ds7RXxsyPjg7MmMsTlx4rAU3KlKszflh2YE30YS7idK8ObpOk0U3OpgvZXIhOBmwDk
	 kpGhW+kZLDc00wdSdW2Rs4kJGE5/E2N+ZTn8P2A2lZODO5KmikRbWceHDwvgCBIWlt
	 ib4IxtNfdRJtw==
Date: Fri, 28 Aug 2026 12:28:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>
Cc: NXP S32 Linux Team <s32@nxp.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, 
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, Ajay Neeli <ajay.neeli@amd.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Pedro Sousa <pedrom.sousa@synopsys.com>, clizzi@redhat.com, 
	aruizrui@redhat.com, eballetb@redhat.com, echanude@redhat.com, 
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 06/10] dt-bindings: ufs: Add compatibles for S32N79 Host
 Controller platform driver
Message-ID: <20260828-dark-foamy-guillemot-0b60be@quoll>
References: <20260826134048.854748-1-larisa.grigore@oss.nxp.com>
 <20260826134048.854748-7-larisa.grigore@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260826134048.854748-7-larisa.grigore@oss.nxp.com>
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

On Wed, Aug 26, 2026 at 03:40:44PM +0200, Larisa Grigore wrote:
> +  clocks:
> +    maxItems: 1
> +    description: UFS core clock
> +
> +  clock-names:
> +    items:
> +      - const: core_clk

_clk is redundant, just "core". Or skip names, not really useful in this
case.

> +
> +  nxp,mphy-boot-mode:
> +    description: |
> +      MPHY initialization mode. Defines how the MPHY firmware should be
> +      initialized and executed during UFS controller startup.
> +      If this property is not specified, MPHY initialization will be skipped.

Isn't this implied by the compatible?

> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - rom
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - $ref: ufs-common.yaml
> +  - if:
> +      required:
> +        - nxp,mphy-boot-mode
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        reg-names:
> +          minItems: 2
> +      required:
> +        - reg-names
> +        - clocks
> +        - clock-names
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1
> +        reg-names:
> +          maxItems: 1

I don't get why for the SAME device diffeernt initialization means
device has different address space or clocks. It's the same device, same
wiring, same hardware setup.

Best regards,
Krzysztof


