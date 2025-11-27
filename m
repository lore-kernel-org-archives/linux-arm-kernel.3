Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E090D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 18:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B38D1znOKR5zK4pglzLs1u529JsXU2+dvpzVVxTlclY=; b=dEDJReOuHhqhNYqU9X26PiI3UB
	mzkvaVX/DTe2EuaPC1k8dYeqZ3hQV9ezpdTROaG/vL6dkig8NCu+PVZQeSm1JMg4O6hf5zasujIBH
	RBWPfLwpHxxgwv8A6xHSBlF+Og8CX0PFfMDLZLfxu/UFjooftnIRhLmDg+ueSbrBOZy0SxODJPFFo
	zM1Eev8bEASdx6pbOVg7U3q3xb/gQAEAs20RnremkGnZTiYibkoqRRSzcSDHGUdNSWJz0Dl736JGP
	ck1lrbO1T7Orpo2X2g9Lg3nJlTPW/dYQPt34UhvbHeDS9wr//mbfWKGQeCEkvC10eDs8YUDlobDls
	zLAorrAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOgXi-0000000H3pq-4Axg;
	Thu, 27 Nov 2025 18:16:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOgXd-0000000H3op-1JXk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 18:16:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9DB636014D;
	Thu, 27 Nov 2025 18:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192D6C113D0;
	Thu, 27 Nov 2025 18:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764267388;
	bh=6ixq0XVWHVxLUr4aT6Reqy57r8vKO5cAra3hnoC7JMQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rMR64hqauCjp4BzhYr2pOBC069zTXW83KN4sAup5rfoMam4U6MkiRoDbOpmMTykcL
	 wMx3rh02Y7h06GdOoMFicOdMHAhrScZeoEUFCF3HhcRRMkpwwWHkHYzm3Qx33vs/FZ
	 scjjUOe58oJ5nohzrvlkm7H2yT5KuvhwgQ65MDoZR9ReYE7SaNz6Uu+VQimUTYgKIs
	 dmPPeKJXMrdqPe80mvKvYNB2M7AdlV+2ADzWQChzJTWO5DrZewQcwrBaBw05EJCaoj
	 X/Xia8twSpEkjujQ8WAzIl/JhSt3q/ZONbOxpbtOhSRL4/mAu+/7rtFlFgNmR4ULfL
	 G05jma+lwJ+Lw==
Date: Thu, 27 Nov 2025 12:16:27 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Romain Gantois <romain.gantois@bootlin.com>, 
 linux-arm-msm@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
 Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, 
 Florian Fainelli <f.fainelli@gmail.com>, mwojtas@chromium.org, 
 devicetree@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>, 
 thomas.petazzoni@bootlin.com, Conor Dooley <conor+dt@kernel.org>, 
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>, 
 Simon Horman <horms@kernel.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Eric Dumazet <edumazet@google.com>, Herve Codina <herve.codina@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>, 
 Daniel Golle <daniel@makrotopia.org>, 
 =?utf-8?q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Antoine Tenart <atenart@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 =?utf-8?q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20251127171800.171330-6-maxime.chevallier@bootlin.com>
References: <20251127171800.171330-1-maxime.chevallier@bootlin.com>
 <20251127171800.171330-6-maxime.chevallier@bootlin.com>
Message-Id: <176426738519.367608.14469073626442288770.robh@kernel.org>
Subject: Re: [PATCH net-next v20 05/14] dt-bindings: net: dp83822:
 Deprecate ti,fiber-mode
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


On Thu, 27 Nov 2025 18:17:48 +0100, Maxime Chevallier wrote:
> The newly added ethernet-connector binding allows describing an Ethernet
> connector with greater precision, and in a more generic manner, than
> ti,fiber-mode. Deprecate this property.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  Documentation/devicetree/bindings/net/ti,dp83822.yaml | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251127171800.171330-6-maxime.chevallier@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


