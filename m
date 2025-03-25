Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFEEC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 13:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Md5MIB9mJx/S4qLdIb4xccs3wi8qSq952js9omszYs=; b=3twllZD4dygJCSVyErqFGflJ30
	pAp6vFIu1hehkDFs7XEr+qHWBVebAXRD6HJW7mwadVrnHUSBwZYfXCb8ngdNM5sPFFJpPWT3S66NQ
	1owwwLrmQZjdp/h7xB8qKhCGpa0CX5g5wbXapb8hGr9zyLXvLn3/Pp2l6u1ph0vnK/0asksuSj66v
	i78ouSZ08kwMwkFmE48KRtlCuKmggvXeyWZmCDxmZk26T155e2gt1oOmWbf2GBX5RFT2tfsIYLf7n
	C1GrFVGdWa+gLScJgEiDpsqmBCTy+UrMSK7XBs1EfqJLC/DASgfKudgcTzWr/rrzmc1iytJuPeB4l
	FLsFBzWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4JG-000000061g5-3qum;
	Tue, 25 Mar 2025 13:27:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4HY-000000061Qv-2JKL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 13:25:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=0Md5MIB9mJx/S4qLdIb4xccs3wi8qSq952js9omszYs=; b=CISyyElrwjwk2kXVRHRqsuF2H9
	dxiSLGJW617XaSocSbVk8tDlLtWlTK1gwRzRTmFXvpPZsHJpjRnLcnIO7aCd4elRRweCvgegUEHaQ
	DjkI3IWOOra0vINMwT8jKUmkb23yCU2WJDN1D6wC5irb/75nwi/AK03aq8WF65TkgDyCWXzeoANmn
	NCZK621bxwuC8nqiXRI5X8yHA67rZceLed1NzCu+4jfN1JbvK0SstuC9cq3YWN4CsJyJNeKL38cHL
	2NjRPnFImxl+PI8qC/6IGgOm1HM4SzgOL8aaq5WmtU+WUdEfv2NIZCYP4oL93067dUcOC6PcEGkSG
	DJtglMew==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx4HV-00000005SVK-1cvH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 13:25:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2E0DCA4A286;
	Tue, 25 Mar 2025 13:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18D2C4CEE4;
	Tue, 25 Mar 2025 13:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742909121;
	bh=riM+PdIFp4F9Ca2yh3yjjOIAa8IAvG/TWOdBiFmYJ9I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=g6yTA+u242qu0hdKl4BvNNw97H3vXjD+RFcgUJ7/oTJrixxqztdDclDi9SN7xlVPn
	 KNdRpdTVoTccoffC8fgy+0i5yEQj+SengpKnB1MpQN7zB8+08NHbcisXimbWppiknD
	 WXGOGKweTmeINMT9M0R1EqXDfIRYsCLfWKgRDWuyYU++G1vez0DENGhNkUgm7NZ8vv
	 UdyuP0Xlf98AOWomB18BziEJHqVBFLL3jJkmZnRfT8N3njdePJfwMsVoSn36/IayoG
	 Uu2RdmNzRcMxYpfRGJapYf+XRXJ+NElXC0KF+Nvor5j7Y+nRLXUTndufa3QRgIUn6M
	 VkgxJtJhZwEgA==
Date: Tue, 25 Mar 2025 08:25:20 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: davem@davemloft.net, Paolo Abeni <pabeni@redhat.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Fabio Estevam <festevam@gmail.com>, Eric Dumazet <edumazet@google.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>
To: Lukasz Majewski <lukma@denx.de>
In-Reply-To: <20250325115736.1732721-3-lukma@denx.de>
References: <20250325115736.1732721-1-lukma@denx.de>
 <20250325115736.1732721-3-lukma@denx.de>
Message-Id: <174290912071.1778035.16692989163958141305.robh@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: net: Add MTIP L2 switch description
 (fec,mtip-switch.yaml)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_132525_671711_311D5C08 
X-CRM114-Status: GOOD (  12.22  )
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


On Tue, 25 Mar 2025 12:57:33 +0100, Lukasz Majewski wrote:
> This patch provides description of the MTIP L2 switch available in some
> NXP's SOCs - imx287, vf610.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
>  .../bindings/net/fec,mtip-switch.yaml         | 160 ++++++++++++++++++
>  1 file changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/fec,mtip-switch.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/fec,mtip-switch.yaml:19:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/fec,mtip-switch.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/net/fec,mtip-switch.yaml:19:1: found character '\t' that cannot start any token
make[2]: *** Deleting file 'Documentation/devicetree/bindings/net/fec,mtip-switch.example.dts'
Documentation/devicetree/bindings/net/fec,mtip-switch.yaml:19:1: found character '\t' that cannot start any token
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/net/fec,mtip-switch.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250325115736.1732721-3-lukma@denx.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


