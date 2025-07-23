Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7640CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 14:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/wPQ6WhoFyH5XFyQpink/9h/QjM0ASPtT4WrEX/NAc=; b=1lxh/f1eBVA60YWCuowm3w0XW3
	A5eeWomrfL9pk/yW8Nrd13btBnqeM3gU5Wc1xEYFR04rN9bxPEFBZwvmn3KfaTAQjSyIX1NkBL3zk
	GKk8CYLaYj+fKEJAl6pgmuhuwu06keZWKeW6HrEtz5PAJJspPfNOlP4zQ6ci5tvkdtkv5hnlxQsfB
	9O+1CLq6q5XOTiCrr3dV/5JGF2/yNn9UkFd17+OYVj9ZAwvMFqxQJY8lBGm+JWJWOUQVJGNV4VDef
	tqhlHP+5S/mbueSVTGyg72dBKzg2FFVhNmrETMuq1bewer8uK3JDE69aAMITVinXR+brqH/gf02+i
	sYTv/5HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueaUG-00000005Cox-0bP7;
	Wed, 23 Jul 2025 14:30:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZjC-000000055SG-3a6P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 13:41:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D3925C62A8;
	Wed, 23 Jul 2025 13:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83DD9C4CEE7;
	Wed, 23 Jul 2025 13:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753278109;
	bh=zxxC/wQlJmLxLa47Q7NNudHjnXvG/vCvKPONP/39QCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PmuG7qTl4sg7/QMBKgyBmArSjY7MW6zMzETCIkWyLdi81B49I4VHdhuWfDtD85keA
	 s1bLp3unFlREP9Un4fUUX5JziSZMKwf4Hw/KgMn4VmYohw3DYwp/XXVUfyBh5wkyD3
	 R09TNEfWqkjGMY/LeDVi0f9DYMrxS2enzACUqqbvhnTzVcHNryjALifb57fyVeXAHb
	 L1ILoKBkyV+Sg2NQ8JbJ+iBlFG6RrkLTutCNyS6FMTUcZyOmERe66AVfkM7t7YxQvS
	 J5Dx9ktAMD/94OEX5E4E6anz65xzMbxXPuCU2irBMH4pS5JuXICjJt5QYIrsV2r6ZK
	 GQzPzDIu1LfKg==
Date: Wed, 23 Jul 2025 08:41:48 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Le Goffic <legoffic.clement@gmail.com>,
	Julius Werner <jwerner@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 02/20] dt-bindings: stm32: stm32mp25: add
 `access-controller-cell` property
Message-ID: <20250723134148.GA2136293-robh@kernel.org>
References: <20250723-ddrperfm-upstream-v4-0-1aa53ca319f4@foss.st.com>
 <20250723-ddrperfm-upstream-v4-2-1aa53ca319f4@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250723-ddrperfm-upstream-v4-2-1aa53ca319f4@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_064150_945861_A7F56EEA 
X-CRM114-Status: GOOD (  16.55  )
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

On Wed, Jul 23, 2025 at 03:05:46PM +0200, Clément Le Goffic wrote:
> RCC is able to check the availability of a clock.
> Allow to query the RCC with a firewall ID.

The subject is wrong. There is no such "access-controller-cell" 
property.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
> index 88e52f10d1ec..4d471e3d89bc 100644
> --- a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
> @@ -31,6 +31,11 @@ properties:
>    '#reset-cells':
>      const: 1
>  
> +  '#access-controller-cells':
> +    const: 1
> +    description:
> +      Contains the firewall ID associated to the peripheral.
> +
>    clocks:
>      items:
>        - description: CK_SCMI_HSE High Speed External oscillator (8 to 48 MHz)
> @@ -123,6 +128,7 @@ required:
>    - reg
>    - '#clock-cells'
>    - '#reset-cells'
> +  - '#access-controller-cells'
>    - clocks
>  
>  additionalProperties: false
> @@ -136,6 +142,7 @@ examples:
>          reg = <0x44200000 0x10000>;
>          #clock-cells = <1>;
>          #reset-cells = <1>;
> +        #access-controller-cells = <1>;
>          clocks =  <&scmi_clk CK_SCMI_HSE>,
>                    <&scmi_clk CK_SCMI_HSI>,
>                    <&scmi_clk CK_SCMI_MSI>,
> 
> -- 
> 2.43.0
> 

