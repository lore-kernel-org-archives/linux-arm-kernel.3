Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D45C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 10:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvMZwrrK4O9JD71L3DzuziqxKKZYlUuX09bTEYlT1Yw=; b=0Ak8Bfdd8JyXnXoxTx4KzV3YrE
	+8dxznUr++q43chbnDiS/facdSHkhZ52nD+X1Z7HQJOKYoauK2lKnarcwA9g9dSVXigUQzxoWAKOd
	DrusonKgbWec5pU8STDK3IHnSyazg/b6B9gXge96qw2RvMesmQoAIg4XhGHIyyTiJHWlfvuuZOSNA
	eEnOcQpuADTfno2SzGGoB+QYJmAB5SUaRJyoPbQWxO+Vef2o+33gAHOGQo348kXZu28HQcNleWT7f
	zyXTMmQpkJvcI7D5kKc81+gzfMp713nU8YNtaisz37qiUtUQCLakH8MG+V95EQkHjqt61WhwfYZUb
	fDYVPmpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ8we-00000006yff-2fkN;
	Sun, 25 May 2025 10:51:08 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ8uX-00000006yAg-3nQ1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 10:48:59 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c922169051so67126885a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 May 2025 03:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1748170136; x=1748774936; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FvMZwrrK4O9JD71L3DzuziqxKKZYlUuX09bTEYlT1Yw=;
        b=RObATym1mR9JulCT+XlOSlfCjDRyXu1rPj+b2HjGyD8Edo9Um5J3+vOYUWYWNX7l/I
         DHgqSWaCCO2tQX8Ch7MqhQ6qgaxjkowPhDdeblA+tNxR1haoQ5VKWrIdSTrN8FRzcAZH
         83yp9gWVk822FsXxkVrf59uyGhpAi/O+C4JZd6rdxayvsHuq5VB4Ltd6j3bJmO+P2540
         nyQ8uFs/uIyqX20e0iL8d03wqfMVLNXOdvsb/ATqnX9++01r51ExQu/AS6/JQmpHk1dA
         hqtOdA/wiDDArDZ6yopoPTZ77F05XZOI2oMPaT4MPClu5BOb8sKTWWpRGlPk9H/YmmNK
         OdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748170136; x=1748774936;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FvMZwrrK4O9JD71L3DzuziqxKKZYlUuX09bTEYlT1Yw=;
        b=am0/ZMAt5I4dpDqosgv2acXJ97IarijVjzWW0KSNDPO/YAWifO972GFDU+7F4CXYcn
         UIqxV+Xsm8lYoeLlm7ij8EMQvPyBR5tntw/dJanYi2DL7noVBs0cOlfGKr6iLQ13jGHz
         m3xCYnEA5XXXJBtWhRYX75+TqXVYMX6C+fiQdCG4qLf9/+l475ZQaJL7NI6/YI/ZUlHt
         G3lBsOM9eBseOzChMVcJ3jBIbFH+e/g5kU3w9GIiJJS8aTG5zjc5vhHTKqGelaRFpN/c
         BEjSZxmrtG6ewqZqVMcerxa5H+OUW25a5NAbBdHAO+KfGVTlP5pTZC/pVUmTgJoeQZ1j
         2gyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYPJuJzejQFjqyBpHajrY7CDY7ue+26AS8HZbpzKRxrAlzA/bRBe9N0S+NtclUZ/ubl2VB9c4sb/71HcD9B9Ln@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6cVattkacronC81I6uxBiMPIYq5gjLyawMEr9keRj0T4aPo7L
	ZlsmWOKlx+bYmqqsCLhOia1qiU1z7hcHKDncY0SrsE3t2KCg58neU1SylkMZU08MminIj6/h8XL
	IFjJdzCed+OEOvMgxxuod9H1SERh5rqBNbSG1MmpJhQ==
X-Gm-Gg: ASbGncuDawgxjyykEVYpvVK8dHm2UJ4wLf0D6xzCZGp/cl0j6k9xsjs76dN8ra5oTR0
	rUlKLHscvs34msmkSOp/ZyjKLv7Qa8Hy/9QVzWAektgzrCIzF3sTowCS2FMQj5/m9oI2D65JrmT
	3ZGhoFd2rpbEH3RFybfBin+yemWdcmz9ihvghhY9K3
X-Google-Smtp-Source: AGHT+IHfLSQWm00np5MOUI9iSgjHG0uz8ZjLmKg3AyhQjzrIGk08erFcga0ZJK90E1+3HR6kZwenz2fYr+3ziRhndi0=
X-Received: by 2002:a05:622a:488e:b0:476:7d74:dd10 with SMTP id
 d75a77b69052e-49f46750736mr95207921cf.19.1748170136440; Sun, 25 May 2025
 03:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250525051639.68753-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250525051639.68753-2-krzysztof.kozlowski@linaro.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sun, 25 May 2025 11:48:44 +0100
X-Gm-Features: AX0GCFtHF5h48b9Isl1N9tQLNjTjzN8BGszS3KNow9_vXa4svv2OiPk4eOV2_U8
Message-ID: <CAPj87rMjAv-UphvFuQjop60o=wHrkfs4-XOM=JqH7f8Kk5dyVg@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: mediatek: Constrain iommus
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_034858_103265_5B581EA1 
X-CRM114-Status: GOOD (  11.94  )
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

On Sun, 25 May 2025 at 06:16, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> @@ -45,9 +45,8 @@ properties:
>        - description: OVL-2L Clock
>
>    iommus:
> -    description:
> -      This property should point to the respective IOMMU block with master port as argument,
> -      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
> +    minItems: 1
> +    maxItems: 2

The comment removals are not documented in the commit message, and
it's not clear why removing information and references would be a good
thing.

Please see https://www.kernel.org/doc/html/latest/process/submitting-patches.html
for information on how to submit good-quality patches that can be
better reviwed by maintainers.

