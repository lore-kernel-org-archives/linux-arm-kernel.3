Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BE0D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 09:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Df7JFE6JZOg6oHYYmF0FcmB/eRSn4w6X2pJA25xo0Mo=; b=1+sE1y9bXy5KVVfphcdHh8hJ9z
	QxjounMhFE1Dn9XFYVR4rdrHqseqN4UYFevj+OCQQwHforElPsknbw4XajSSl1c07Zv2nmfBmFQLD
	mjGSdAqdFJ0OxzPH6SVzQb5Y65Y3X0O2s4LgF+/d7H9QTVc1JQKClbuo9nQeNfSmPgrytVl4npGEn
	8e4HIdtYHL23FAv/Vt/4pV0GV75ljDMs9LGAmw62MMFFCsZlzrNEGXuaqPnuyx4YISxYEQ5faIheG
	kasq5OscUzAue8Yl4/KRSYycwdBfJkBId4dyQ2iYulYh17MIeb3yPy8me6L+yE1zdAKNIDFHK0Gdi
	fikcDrbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPH9Z-00000001QDX-3G2z;
	Sat, 29 Nov 2025 09:22:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPH9U-00000001QCU-0Yjg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 09:22:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 73DC760120;
	Sat, 29 Nov 2025 09:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A8D0C116C6;
	Sat, 29 Nov 2025 09:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764408119;
	bh=sogpOuSUqfbJepFbkIkyP19GQaHrYVXkuJ/MaiPaku8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=iDmci5u+CYVqoAYFd0wuwL4uQi4YhU9ZKXiuB93HT1jRBNVjItxrPhQqbRxa4KEa0
	 gyPTyK49Q1/Sd/5zAI2QIu5OsjZlqZLCXdak43Pj5FpKmnsGUnyqcWP43pC6wm1dil
	 2ETCZH3s4qk6x+Te7aNj1JMIJSsuqsZHfbGYYtIpyo5iJ3ga++iWIDwai30rvbufVd
	 EQ4MnkIh/WNW5BzG49s9fSRDeoA9eGSwyOoKBzm1wJhJYyP4XW2gr/EGqnyR8ulz9q
	 DOZcIso6rXS79M6DwL8B3KaJmjVOUYAJYA7PYxmR/uRjTpYfjsO8w6mbJw2G1g1k+/
	 si/v7aDm2FzAQ==
Date: Sat, 29 Nov 2025 03:21:57 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 Paolo Abeni <pabeni@redhat.com>, Herve Codina <herve.codina@bootlin.com>, 
 =?utf-8?q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>, 
 netdev@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 Andrew Lunn <andrew@lunn.ch>, Dimitri Fedrau <dimitri.fedrau@liebherr.com>, 
 =?utf-8?q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, mwojtas@chromium.org, 
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>, davem@davemloft.net, 
 Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, 
 Simon Horman <horms@kernel.org>, Antoine Tenart <atenart@kernel.org>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, devicetree@vger.kernel.org, 
 Tariq Toukan <tariqt@nvidia.com>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20251129082228.454678-6-maxime.chevallier@bootlin.com>
References: <20251129082228.454678-1-maxime.chevallier@bootlin.com>
 <20251129082228.454678-6-maxime.chevallier@bootlin.com>
Message-Id: <176440811592.3523266.4372040709133421609.robh@kernel.org>
Subject: Re: [PATCH net-next v21 05/14] dt-bindings: net: dp83822:
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


On Sat, 29 Nov 2025 09:22:17 +0100, Maxime Chevallier wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251129082228.454678-6-maxime.chevallier@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


