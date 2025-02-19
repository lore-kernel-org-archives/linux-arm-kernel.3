Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD01CC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 21:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgZPZ+ceTXW3cuav2hm3FTf3VK88Ucbr24GDvpMjwPc=; b=bSJH4g1ejW5QkdsiM80s503dRs
	7+pE/3/3Ajf6GNza0wnqKlKSGqrLY3AwimzzK4YD1OBLk3bu+vxr12L/CnOic10MAfF80CpxJ1sEU
	DBb2GdziUGphiL0AfXkH0LgwD0qzcHn50NMkSbrvjjcx6PpZHVNMT9IgO7ZUGo0FSGyoAMa9v/VLv
	/dfpqdC7XyoaHv/C5vNo+psfbTXkI1cqAEj3/9tb7nZ2TO7QdxD6LF0g9/j5Q+jwu1r1qI3DJ3Lnh
	fSq92MareK39i7A+KzFw7F13a9mUpIuGkK9gFK5mmxjkv1cIyjKw1s+OAHWeowpusAiAfaqhZR+KR
	WyCCpy0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkruz-0000000FHU2-1DWS;
	Wed, 19 Feb 2025 21:47:45 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrtT-0000000FH5s-1URf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 21:46:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F19D5611C2;
	Wed, 19 Feb 2025 21:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8AEFC4CED1;
	Wed, 19 Feb 2025 21:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740001570;
	bh=V7MoC2zW7sWj9u+pbh19DBSYNN547r5t17dp94udUps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q4uNK/QFChz31+NC+j93t7UkCweE7BJU+8DRtb5qgKMD17V9p+kNw2zDIIO1vcf4V
	 7blwlLDwnpnB5h3WQw8/R1wV+Z4BBR1gTWNuWT3e2X2QVzYwjVah/M5hA7uckzcEwX
	 WjAfPnV+wUDh70Nr6UHgVwTqA1LFuis5Be73wYFNK5+F8dPRMKLX0ZM3NYaQZAVLGO
	 p2Ntz7KzCdvedb7XHLHJmdNQsGgax8m/NF3ynNcTpJv+utMaBoqsIhqEcZ3frnR39k
	 /zVKGzlZimahEhGWr4De65FYDeOA5ReS7PPHrku4HCIy076XjZEKIcjLso0NLjNaOH
	 lJ/qVSgQcUz3A==
Date: Wed, 19 Feb 2025 15:46:08 -0600
From: Rob Herring <robh@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: firmware: Add i.MX95 SCMI LMM and
 CPU protocol
Message-ID: <20250219214608.GA3003788-robh@kernel.org>
References: <20250212-imx-lmm-cpu-v2-0-3aee005968c1@nxp.com>
 <20250212-imx-lmm-cpu-v2-2-3aee005968c1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-imx-lmm-cpu-v2-2-3aee005968c1@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_134611_446990_92DCBC35 
X-CRM114-Status: GOOD (  16.00  )
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

On Wed, Feb 12, 2025 at 03:40:24PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add i.MX SCMI Extension protocols bindings for:
> - Logic Machine Management(LMM) Protocol
>   intended for boot, shutdown, and reset of other logical machines (LM).
>   It is usually used to allow one LM to manager another used as an offload
>   or accelerator engine..
> - CPU Protocol.
>   allows an agent to start or stop a CPU. It is used to manage auxiliary
>   CPUs in an LM (e.g. additional cores in an AP cluster).
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/firmware/nxp,imx95-scmi.yaml     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
> index 1a95010a546b14b1d3d97aa990c0305a551f2620..75f63819285b191a815dc4287e34d299983b1c40 100644
> --- a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
> @@ -11,6 +11,14 @@ maintainers:
>    - Peng Fan <peng.fan@nxp.com>
>  
>  properties:
> +  protocol@80:
> +    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
> +    unevaluatedProperties: false

Please add 'description' to these to say what the protocol is.

> +
> +    properties:
> +      reg:
> +        const: 0x80
> +
>    protocol@81:
>      $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
>      unevaluatedProperties: false
> @@ -19,6 +27,14 @@ properties:
>        reg:
>          const: 0x81
>  
> +  protocol@82:
> +    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        const: 0x82
> +
>    protocol@84:
>      $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
>      unevaluatedProperties: false
> 
> -- 
> 2.37.1
> 

