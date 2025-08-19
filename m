Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8567DCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 12:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fM8zG3gHwwiJoWRFj77q2jdEOBUX4NiKhdshksiS8ac=; b=HgR1Eoj7RPJhPpKBGUFqJXCz/c
	m0oBykvNZdeHxygQNX/WntRvRP2vBvlPvTzrFsFa5m/n8QLO2pCg2IJpl9nvFbevWUIqSNFVGyGm8
	Ou+xASHR+ssKj5tunEKwWAh20Nfx5yVCgvLYUwFUCaVemvk7lT2qJUqHY/SNcNBPQxoTy/hsoCwSp
	HHLR7B+c4ZdtMNxnQf2ZBCcPsCl1HsS3+xe1D2buhS+dZhzdqa2dUk5HOkgo1JQmw4blrOxBvWiiN
	OemDRFm6r6MrKPhMG7HSsZGBR1jsdnhbygNE/K7+/aFHQ4o30zcXrcj8TemFFzp30Y2kuVAnZoVQc
	/5H32kyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLoS-0000000AUZi-1BPT;
	Tue, 19 Aug 2025 12:51:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoK5d-0000000ACwK-2zcV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:01:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 63D4E46263;
	Tue, 19 Aug 2025 11:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A46EC4CEF1;
	Tue, 19 Aug 2025 11:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755601277;
	bh=aMp+SGnYO85K6FjMx+CQJAXcKtAWqNORTzvGcYqTZv0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=TxI4Cm12r6LHZn1X7XIONjiP0+HkBOSQaHIHeYMTLIHVe1/O+pu24I0gP8W5cMF30
	 4hHIQo3amR+gOHAvy+uuYdYtQ7y6akc8AU8imjjOKhXKv1x66qzwP1s7qefiQRlHMt
	 zxe7x6qjOU3EbBEIGuz5BRiIw0d9KwteFDFIkLTBTIH7re+eZiEpYA14rA0msm2gzW
	 XwX1ipERphXZ2UgTYEZVLuGFJsb+/kJn5UM2wiNI6fOMYBIgEopoZ5flBNYHfcy3GQ
	 sAzbgXKzy4r0SWnAMNhTR/UKorelZLeadipr/UYNjaosZ6GNjyeg11L98kJLWdxSDN
	 1NQxvuZPwyXsA==
Date: Tue, 19 Aug 2025 06:01:15 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Simona Vetter <simona@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250819-drm-misc-next-v3-3-04153978ebdb@foss.st.com>
References: <20250819-drm-misc-next-v3-0-04153978ebdb@foss.st.com>
 <20250819-drm-misc-next-v3-3-04153978ebdb@foss.st.com>
Message-Id: <175560127150.3969165.11609028288443229720.robh@kernel.org>
Subject: Re: [PATCH v3 03/13] dt-bindings: display: st: add new compatible
 to LVDS device
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_040117_810658_ECB8DAF2 
X-CRM114-Status: GOOD (  12.04  )
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


On Tue, 19 Aug 2025 11:15:56 +0200, Raphael Gallais-Pou wrote:
> Update the compatible to accept both "st,stm32mp255-lvds" and
> st,stm32mp25-lvds" respectively.  Default will fall back to
> "st,stm32mp25-lvds".
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250819-drm-misc-next-v3-3-04153978ebdb@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


