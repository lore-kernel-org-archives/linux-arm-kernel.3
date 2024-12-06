Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55552E77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 18:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5djkSzgvcRhUsJUfE7u7JhGjk061MSHTTjG7mXapw+w=; b=RArCoTAwhm3r0SkXDkIB6gm47U
	OKohTVF2v9BdvkBlBA0amRrsMmDLTh12Ykg/nOKvHcLEUc7cgXd4AQAcHt4fi/dDZ8mmCvBxOeMId
	ldAL/zEUju6yRh6XbHgMG001OyalkrJmYD2z8B5aSIj/hxLmCUrs6lGJCKTczgO8NGu/bip9vh2F+
	X0TP8f/ZcpMoSOnUg/t06nmlAaDNC5SUvj5x6BszsKBoLhb1Xe1b3f029j9W9nsz/Hsyl8kKDeLYW
	9gArFRahEXASClDlr/vOjXROaVrgUEjzxi+q5OpK23ILiaXW6j38jqT0QR43+c/a9NA/xTvR9dNz0
	4xZXWKVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJd29-00000002RXu-3Sjc;
	Fri, 06 Dec 2024 18:26:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJd17-00000002RRn-1w6C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 18:25:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ABB015C5A0C;
	Fri,  6 Dec 2024 18:24:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0FBBC4CED1;
	Fri,  6 Dec 2024 18:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733509528;
	bh=6zPrOx2SudmgD/c40+Z4a9ztiOiUIdAL08zqV81/sfs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tl5mKPRJ4qW6dAOX/AFyy4x6zWaRQy9Z/ra+AtEAYP1YS+8iNTK13pAz/lwHUFmuW
	 vkO18VAW3gT75101h1AAzL4GWebmnOzOPe/RZUwWSkKQsPssck0zqGUeRH3vQU64G4
	 0c+pwI61ZfzdDMUK+pur+1WXpU9i2vQiDL27LgnsflrBquDTI0N031EaWffY/x3z+G
	 Uscw4QpmECno6h5u2jkEw7vFHzL45uDGHBkpiGnVt8TPbdmC/hS/tV+3JIOcQ9Zykk
	 yKni9yZvcLdKsSbookP0Y5Omwi9ArnXRDmdyVX+u4bpc0kMVQW+enQNSLexJwbWOtH
	 N7edetiR57TsQ==
Date: Fri, 06 Dec 2024 12:25:26 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>, 
 Hector Martin <marcan@marcan.st>, dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, 
 asahi@lists.linux.dev, Sven Peter <sven@svenpeter.dev>, 
 linux-arm-kernel@lists.infradead.org, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Pavel Machek <pavel@ucw.cz>, 
 Daniel Thompson <danielt@kernel.org>, linux-fbdev@vger.kernel.org
To: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20241206172735.4310-2-towinchenmi@gmail.com>
References: <20241206172735.4310-1-towinchenmi@gmail.com>
 <20241206172735.4310-2-towinchenmi@gmail.com>
Message-Id: <173350952667.3933863.13037602591337209524.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add
 bindings for Apple DWI backlight
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_102529_550375_2F6961E9 
X-CRM114-Status: GOOD (  10.45  )
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


On Sat, 07 Dec 2024 01:24:33 +0800, Nick Chan wrote:
> Add the device tree bindings for backlight controllers attached via Apple
> DWI 2-wire interface.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  .../bindings/leds/backlight/apple,dwi-bl.yaml | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/leds/backlight/apple,dwi.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241206172735.4310-2-towinchenmi@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


