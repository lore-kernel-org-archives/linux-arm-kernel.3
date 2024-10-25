Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6CCD149F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 21:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCuBo4Dj/92SXalGjYMDv+u+UIN0S7qgyRUpRJUeybY=; b=lyTydaIVLO1sMkK+tonueIhwVW
	kQvpe5TDrk43CtXOZ+xFlxJLaUdheaj51YF0kpCMXc61au7s1IFCSQvpMtlJETLZyzX3Yuj/wn82Q
	Itjmv0yjf8XufCA4PLgTtVrvY2cN0wFBnV86H9ipHfZGUyFqcLiYiYAD0viSWRdX4rvCrZo895IRs
	6TJBG+a3TZ+UNMp0LS03eDhvKPYgMvekxIimZOjk+IEI3ItsUexhs5uq1xz7zvq5ENGARe6mHNetF
	qvi0bUbCdXhoQUBtwgypDUASRGx+fyRcE4DIwsyT/BgUJnHJCbDZJNhUudr5olb5EvJxodP/xcwzY
	mzyb7TAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4SIX-00000005NYW-1ZL1;
	Fri, 25 Oct 2024 21:56:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4SGx-00000005NPO-12jM;
	Fri, 25 Oct 2024 21:55:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D3D85C5C91;
	Fri, 25 Oct 2024 21:54:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10538C4CECD;
	Fri, 25 Oct 2024 21:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729893306;
	bh=Qj3RrgeMczvK9hKxZ+77DcpwktRtCnGKCeQKnq3m7ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JujiVBGkzsjq7A8DOvqTbu4LsmbDl04bXl0ne7aE2WCYbgrUdkXGCi2401YpTRA2v
	 SjEIutJmoB2hczNOYz+z9l5iQdx9nWYZC5zjeMdl3EC6hkFvfJi1CVDmtYJXZrrZsC
	 jDv1Q1nJklEy/+oWqSw8lVFNO+FlLT/M+cnDp9ZrONDYODG62y5uUUDF2Ebjx7I48B
	 7WxSJu4pJHkzUCrLNH5IsmdJjQ4QreYGRZLUm/7mHUMZdjcM0ma6+9wzZbrDMHAhc6
	 cur2qWWxE0qLQtvef1foLGaYi3xK9z3uWsRn8Krgl+953SGJSCSQ0lp0vZxY4Bl0E8
	 6dgETIQFaiZAQ==
Date: Fri, 25 Oct 2024 16:55:04 -0500
From: Rob Herring <robh@kernel.org>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>
Subject: Re: [PATCH v4 02/10] dt-bindings: PCI: brcmstb: Update bindings for
 PCIe on bcm2712
Message-ID: <20241025215504.GA945212-robh@kernel.org>
References: <20241025124515.14066-1-svarbanov@suse.de>
 <20241025124515.14066-3-svarbanov@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025124515.14066-3-svarbanov@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_145507_360368_4A012E53 
X-CRM114-Status: GOOD (  16.56  )
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

On Fri, Oct 25, 2024 at 03:45:07PM +0300, Stanimir Varbanov wrote:
> Update brcmstb PCIe controller bindings with bcm2712 compatible
> and add new resets.
> 
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> ---
> v3 -> v4:
>  - Dropped Reviewed-by and Acked-by tags because I have to re-work the patch
>    in order to fix newly produced  DTB warnings on the .dts files.
>  - Account the number of resets for bcm2712 which are differs from bcm7712.
> 
>  .../bindings/pci/brcm,stb-pcie.yaml           | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> index 0925c520195a..df9eeaef93cd 100644
> --- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> @@ -14,6 +14,7 @@ properties:
>      items:
>        - enum:
>            - brcm,bcm2711-pcie # The Raspberry Pi 4
> +          - brcm,bcm2712-pcie # Raspberry Pi 5
>            - brcm,bcm4908-pcie
>            - brcm,bcm7211-pcie # Broadcom STB version of RPi4
>            - brcm,bcm7216-pcie # Broadcom 7216 Arm
> @@ -175,6 +176,26 @@ allOf:
>          - resets
>          - reset-names
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: brcm,bcm2712-pcie
> +    then:
> +      properties:
> +        resets:
> +          minItems: 2
> +          maxItems: 2
> +
> +        reset-names:
> +          items:
> +            - const: bridge
> +            - const: rescal

Sigh. Why the opposite order of the existing bindings?

I would make the top level:

minItems: 1
items:
  - enum: [perst, rescal]
  - const: bridge
  - const: swinit

Rob

