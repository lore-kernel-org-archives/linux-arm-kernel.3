Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A798CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 22:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MwKb6nEz0xngMr6kLAn36qU8EjBx8G9juMYTuDROwc=; b=BAbvLKivCOeqZoXGRsTvQNPuyn
	gUc91x6yE05ktaOXWYBc4p0kRqJaiPX6qNxLDInU+5de8L6Gz+k7JZncoUHhyRi7NVIB/KJ+wYuaB
	pRleJrbPDN6k/843ITaFd6mvDsiALISymBMPxI8ahw+3JVSyjkrLpDGlXQBCiuigsrj1+9aoOjYd6
	tBkcmBT570tjrdgvqMFwbn8gkvUMfQ8OVdSzMTZU98enWUBJWje/zohATAdLD1L7StIHDcCItUanV
	IUoFmV9bpUaCYXmOtx0qMapoyG+ET5QvBOhv9efMB7+5KpE1tlGUYtPmjR4S1KYMV4RxDTg6DowHO
	IXyHtR4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umgZH-00000000gdu-12gb;
	Thu, 14 Aug 2025 22:37:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umgWi-00000000gUS-3bM4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 22:34:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 43A3C5C68D1;
	Thu, 14 Aug 2025 22:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E2BC4CEED;
	Thu, 14 Aug 2025 22:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755210867;
	bh=r5sVScVg8A+4RvvS2qufgrLSgNQ4hfZIM+ozBjWCA/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kPRDvgWKPpmzN7VJ2NuXCIhNUk20jsFdncWyMVJdPSCtDm2Mdpuqbyu2KbYY4Ctou
	 kQffSmYPoX7edg9+ZK2Ls6HIS1AGhO6N+RJ0jew1OVOCBGbC+YDl1DahkKC9bZcfTJ
	 jrCz2yko6n+qQfbrEhqNM+yUNY57d52ic1AIALYx3poUO30Dryfgw4kTknvlwQfTAN
	 FHei49OlsWYktOT61tiSUY850UnjADhShH2EkJTh2vMB+ur0yieyhTd/HErDvRTNjv
	 TSkq1CCv1Rbo8WmCfZBi0xkZ4hMdoBk3psBqOxtZ2yNb4n+w0fWTZCtCQIRfLkDpnX
	 YF842IRv9Va1g==
Date: Thu, 14 Aug 2025 17:34:26 -0500
From: Rob Herring <robh@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v11 06/16] dt-bindings: net: dp83822: Deprecate
 ti,fiber-mode
Message-ID: <20250814223426.GA4036754-robh@kernel.org>
References: <20250814135832.174911-1-maxime.chevallier@bootlin.com>
 <20250814135832.174911-7-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814135832.174911-7-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_153428_973400_5D5AF7B9 
X-CRM114-Status: GOOD (  15.95  )
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

On Thu, Aug 14, 2025 at 03:58:21PM +0200, Maxime Chevallier wrote:
> The newly added ethernet-connector binding allows describing an Ethernet
> connector with greater precision, and in a more generic manner, than
> ti,fiber-mode. Deprecate this property.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  .../devicetree/bindings/net/ti,dp83822.yaml    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/ti,dp83822.yaml b/Documentation/devicetree/bindings/net/ti,dp83822.yaml
> index 28a0bddb9af9..c1fd6f0a8ce5 100644
> --- a/Documentation/devicetree/bindings/net/ti,dp83822.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,dp83822.yaml
> @@ -47,6 +47,9 @@ properties:
>         is disabled.
>         In fiber mode, auto-negotiation is disabled and the PHY can only work in
>         100base-fx (full and half duplex) modes.
> +       This property is deprecated, for details please refer to
> +       Documentation/devicetree/bindings/net/ethernet-connector.yaml
> +    deprecated: true
>  
>    rx-internal-delay-ps:
>      description: |
> @@ -143,5 +146,20 @@ examples:
>          mac-termination-ohms = <43>;
>        };
>      };
> +  - |
> +    mdio1 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      fiberphy0: ethernet-phy@0 {
> +        reg = <0>;
> +        mdi {
> +          connector-0 {
> +            lanes = <1>;
> +            media = "BaseF";
> +          };

If you respin, just add this to the existing example.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

