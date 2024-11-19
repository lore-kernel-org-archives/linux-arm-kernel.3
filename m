Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CC6D6C281
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 18:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNN2UsDWlNXg3V2WgYv3ox138O7Ap6NXhrG7kHJklgc=; b=OgvG6H0X3L+tZcBiA0b7hvkDH1
	IE1GWzqdey2kfKmIclPItJxV/Bk8ansxY4F+bxtt7v+hE7ycr61cNszmLJABBN5UgaYJsnGYnnkMv
	yCQdPomUs6Qt+2MkmTGP+OcXiwkUZBbYBozHMnqk17j6BCEa52Q1NJ4hRWjsFZltlFZ/GhdTvdIcL
	ceNOEQbXz/Fclo11Nh4WeYUy31xZ7uCazv7YIl4sgy5jyhvylBeuSNy0d055TTGGRumGHSgu3GaZN
	Q6F3yqWfWG/LuixJhRw8oTZyQUg6HzoKNa/+jhwVeufE3uywy5Qwk3sdxKcvd4ptAjHrzJpGNnqSk
	zYP1AFgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDStI-0000000DNM9-2vwy;
	Tue, 19 Nov 2024 18:23:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDSsM-0000000DNAj-47ic
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 18:23:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AAD38A42DD2;
	Tue, 19 Nov 2024 18:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3913C4CECF;
	Tue, 19 Nov 2024 18:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732040577;
	bh=H+g7KtGZVKeFClzWJ6E9sLHyjgEpc8Kl/xs6k2Oomfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=klRdFrLUo7vC2s64ErxhsqLMBiAAqDKLzqloFX+Z82AgvFl8Uzxha69clYR4sSuZ1
	 t/LzpL3zrD/m/aYdQTCNiez/T64V2rlZBgpxpYudrtDDgm2Eb409gWOaSeF7FJKr48
	 zqw6wTSko2rKTg/D9H/3aeKPT7xAuWDbXMifiwXY3i+xyIrrtrd8BDtPL0xfDPvXqA
	 RcerYNuVRXMRo88IjKv4sCFdiFDCL6ZLmgkZxK/Qb1ZJCqssKSYapKSv3inaBhjTpR
	 UFsyDpQfyRFni+XE7/X8/0ovla3H+pwjyXwvcwxYRIiZnPIUEpn72ICbBOu9qWzdjS
	 +EZTZtx6FvY2w==
Date: Tue, 19 Nov 2024 12:22:55 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Russell King <linux@armlinux.org.uk>, jacob.e.keller@intel.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v3 8/8] dt-bindings: net: sparx5: document RGMII
 delays
Message-ID: <20241119182255.GA1967508-robh@kernel.org>
References: <20241118-sparx5-lan969x-switch-driver-4-v3-0-3cefee5e7e3a@microchip.com>
 <20241118-sparx5-lan969x-switch-driver-4-v3-8-3cefee5e7e3a@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118-sparx5-lan969x-switch-driver-4-v3-8-3cefee5e7e3a@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_102259_155560_BE317199 
X-CRM114-Status: GOOD (  18.85  )
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

On Mon, Nov 18, 2024 at 02:00:54PM +0100, Daniel Machon wrote:
> The lan969x switch device supports two RGMII port interfaces that can be
> configured for MAC level rx and tx delays.
> 
> Document two new properties {rx,tx}-internal-delay-ps. Make them
> required properties, if the phy-mode is one of: rgmii, rgmii_id,
> rgmii-rxid or rgmii-txid. Also specify accepted values.

Doesn't look like they are required to me.

> 
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> ---
>  .../bindings/net/microchip,sparx5-switch.yaml          | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
> index dedfad526666..2e9ef0f7bb4b 100644
> --- a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
> +++ b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
> @@ -129,6 +129,24 @@ properties:
>              minimum: 0
>              maximum: 383
>  
> +          rx-internal-delay-ps:
> +            description: |

Don't need '|' if there is not formatting to preserve.

> +              RGMII Receive Clock Delay defined in pico seconds, used to select
> +              the DLL phase shift between 1000 ps (45 degree shift at 1Gbps) and
> +              3300 ps (147 degree shift at 1Gbps). A value of 0 ps will disable
> +              any delay. The Default is no delay.
> +            enum: [0, 1000, 1700, 2000, 2500, 3000, 3300]
> +            default: 0
> +
> +          tx-internal-delay-ps:
> +            description: |
> +              RGMII Transmit Clock Delay defined in pico seconds, used to select
> +              the DLL phase shift between 1000 ps (45 degree shift at 1Gbps) and
> +              3300 ps (147 degree shift at 1Gbps). A value of 0 ps will disable
> +              any delay. The Default is no delay.
> +            enum: [0, 1000, 1700, 2000, 2500, 3000, 3300]
> +            default: 0
> +
>          required:
>            - reg
>            - phys
> 
> -- 
> 2.34.1
> 

