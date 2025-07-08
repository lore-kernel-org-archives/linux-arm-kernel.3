Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF23AC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 21:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbqbJ/8nGxp/NE3fHnhm8zE7sj639Vmep8l6nx8og6c=; b=JYfuNM7/iPIHS/Dmp7H5vGNYLy
	xzqYDCIbgvpOhgeXQZUUMgo1mtPbskJuTVSeFdn8yLmxUyJBjuYpvSMr4CYdCX8mDdrKjVEjxjK76
	s5u6XRhz5iKv57bD+D5YWyTQUTdnBfhDxmWkQqeJB6mBXYRjaJX4oF0nDsqCMutGJOC1vRLHknTA3
	dL5Qr18dlKNk8wbvbvkZAE4kR3nMq95HRKXC83jrqp056faXSnN+immSF2Lpf33DmFBKHC5xuILKq
	C9gv7tCkv9xTD9svSABG5SXD5Lqhp5RkVv7FKFd4gW9Vy0KybLGkhduzPJeil3wN1GV8WuoqjtzDr
	sCVLp+zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFxm-00000006gGE-3K6X;
	Tue, 08 Jul 2025 21:34:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFs0-00000006fPS-1DlR;
	Tue, 08 Jul 2025 21:28:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C44345C583D;
	Tue,  8 Jul 2025 21:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396BFC4CEED;
	Tue,  8 Jul 2025 21:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752010135;
	bh=/FVYZTlnzmURxTAnDhSQXnN1fi5/lPABhioS/jIPt2g=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=RWHMAc3TJrBaVRWru5ozRY2k4hVQ2tLqRowlKtIBjXEDfJae5jLn0kKMpcdn5Roql
	 uPKVv1iXpSqCuSOuUCl594+js6ZeZcykvFfgbT+De0MqFLOgd7YvTT5DkjXjfIlYGB
	 9Z8ela6qK+E86ZoGNdsQQwYnBPtnp4N6enoEozYzD54u/yLl8QwpEC7wZJoS7UaUys
	 WSkcCi9ZMxlsVHYtxW8UD2e8a++3/7NhIW9MltZCWUulZk7EoxK8u+Ac8Wd+WYTOA5
	 ewRDNe1wXqUnOur3EjV3lqbxHvfTdvTjWjF1EZa2F5+v82jozl4lWu4O367R8m3QNb
	 xCW//ZHBJsu1A==
Date: Tue, 08 Jul 2025 16:28:54 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Stanislaw Gruszka <stf_xl@wp.pl>, linux-mips@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Johannes Berg <johannes@sipsolutions.net>, devicetree@vger.kernel.org
To: Rosen Penev <rosenp@gmail.com>
In-Reply-To: <20250708201745.5900-8-rosenp@gmail.com>
References: <20250708201745.5900-1-rosenp@gmail.com>
 <20250708201745.5900-8-rosenp@gmail.com>
Message-Id: <175201013411.1121693.17824456704959772294.robh@kernel.org>
Subject: Re: [PATCHv2 wireless-next 7/7] dt-bindings: net: wireless:
 rt2800: add
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_142856_370895_0582592D 
X-CRM114-Status: GOOD (  11.05  )
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


On Tue, 08 Jul 2025 13:17:45 -0700, Rosen Penev wrote:
> Add device-tree bindings for the RT2800 SOC wifi device found in older
> Ralink/Mediatek devices.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../bindings/net/wireless/ralink,rt2800.yaml  | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/net/wireless/ralink,rt2800.example.dtb: /example-0/wifi@110180000: failed to match any schema with compatible: ['ralink,rt2880-wifi']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250708201745.5900-8-rosenp@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


