Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F11CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 16:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXVAQ6YCxaql2PnrFc8uwn29EJDszDo6Iic48te9xOI=; b=XMAfj4tjC9Pr+aEpkyIZpJ4bm0
	bmrHjhlEiygjXmoezRzqhIHhJjPBPWKII0I9fBbt8S004aY8CrMWyTG7IVtFDEqYdR9pMNHYwjKjL
	N5msSxYTG8w7inZURNO0dMI6z5icD569IGRfudukLLsAcXK6t1+ukTj7g8vHzp27mx4111R2sYp6Q
	Y8Fjb1KpqiIxTO9lIBNv2dJPdpAFWsbRfg3zdtRbPmkisZtHw96UP9ByRz5XBlogf1XEKzCy9BuE/
	Tj+ZDN6oLD3rvbrk2W+M+ad76W1ABs072vDrT21R2BgPre4tN+/zy3PImG4u4rwSPSL2nrh6I5G/C
	QHbWLR7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHPEI-000000005HQ-3Dse;
	Fri, 07 Nov 2025 16:22:26 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHPEG-000000005GW-1UZa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 16:22:25 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so550594f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 08:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762532542; x=1763137342; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:to
         :from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eXVAQ6YCxaql2PnrFc8uwn29EJDszDo6Iic48te9xOI=;
        b=UnZtZxWNJK1IYTYGrCtF7RW4MFPOWF3ErCD4/KMhCCHSAVRrGl6Kd9cWRPHSZuULXp
         acYF/PmFKiphtj7wxzRmjuyZB8OUnmg5YythszAcYgjvaEO3o7jrGPyskh6fQF6DX26N
         a4haKMsahJjMi1tVKoqrhqiw+LCYDWSr8tU4RlEJYGgoUuVLpYGLCRTELo1BQ5Spkq1E
         CmdXga4qnkZ9FsOnSwIA98LKPw+bXqnoJJoGSMXOH3fngOXW3SJgoaY94aN5rIEDHhn4
         EtaO2o++D31dlRvIr6XJnrycOxt0n4PbFEsiXxF6IYhJcmcz2qT6UkPfvNcVVFtaS+EJ
         UJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762532542; x=1763137342;
        h=in-reply-to:content-disposition:mime-version:references:subject:to
         :from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eXVAQ6YCxaql2PnrFc8uwn29EJDszDo6Iic48te9xOI=;
        b=o9NMmDwf7wkAIkAXBQO8zv/qOUlwDhFkPk1oZ04CioBH8Z+1y9rVJuc/77M3965b4R
         G9K5e4zfyZbmCA0za5IKfULoZYrI/9+MeKPRuSsT/+YpILkxrpVcdeaF919G6VXcVcix
         /feEwYzIEKs99BFIJK1g/XIn/VqJkIwlSc2B3yogIcLiJQlIyeYov4YM9jltG5/HaXZV
         lu3Uc0MTrZfma7dcfXjKppOcwhvNjeyA/j2Uu/hVZGZ/+0SCH/p28uhR/nlAezVQGFUp
         xiArEgYEo2VpLEcmotLkk+cEAZDcTam2Vm6zqz4Bn297kZqVQ1S0+MvaHpexoofllKJT
         oEzw==
X-Forwarded-Encrypted: i=1; AJvYcCUwWn6VVlwF2baNTAeOrSWiMCFjkbwH42ldViGLCOW3q9LJsbDWrYEZzcWsOgAZr8H+T5tNp1dDQcI5Hk1bcZ26@lists.infradead.org
X-Gm-Message-State: AOJu0YxKGCl2xiTbEBhhXRD7M9FtFvtN3lnU+xTkOKQ6B82ok3bq+ksz
	Uo+BUBk05c/PL40rbnd0W8tTuPeTRXJi3CpMtfLlVOfli59jt+ripK1x
X-Gm-Gg: ASbGnctEm5dOZqcQ39ipUAjPW4HxPX9JGaLPXuZo0dpS0v6m6qAcXYgsZICPrziCgtC
	4JvOYzeF07L7i6vSUIyeBskUG3OJGhgtfEGjuXonCXV4YvN3GLWO418DnVQ0HvqN5GtIUfq+0pv
	yE7KBQ3R+AZPuXrP794dQzOS1TUZhmLs4Ee2NQlwEkMRsVM2WRxEp0YIuordA17wu+bREdrqj3K
	oEE3ZVIVeO/xydkqA+FqK7Y+X6vgSvuIsYN6egaR7bByWUTk8LxWsbhsEAb8gjfg8yTPCnAarbj
	8V5deneJS19tu5ZTQzaX1tNABMzdU2XBXJPTKcZCUk64eFr/gpYuN09cnQi4rbICvK48zMdB0Hg
	iBU0gLFkiuD59VfWSFE4GQWDAP/C6dlWb7SAktLG3hJLafCu2sGBqIb86INw02vDUuabsnkkwTo
	qnKSdxm/fiFmFkNY9DgVfA9+M0MFeeERi3DU7yxR4=
X-Google-Smtp-Source: AGHT+IGFfr9CT1eblajtZCP2XVFU0Vr5uVwdsTRLDJcCXPnjm3McVM0mCmW9P9Gky5idSjyeK+nn1A==
X-Received: by 2002:a05:6000:2905:b0:425:7e45:a4df with SMTP id ffacd0b85a97d-42adc6896abmr3482205f8f.11.1762532542447;
        Fri, 07 Nov 2025 08:22:22 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b29e4b9bdsm1826631f8f.32.2025.11.07.08.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 08:22:21 -0800 (PST)
Message-ID: <690e1cbd.df0a0220.25b002.6c64@mx.google.com>
X-Google-Original-Message-ID: <aQ4cugRUZrJVqR3c@Ansuel-XPS.>
Date: Fri, 7 Nov 2025 17:22:18 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: mediatek-gen3: Add support for
 Airoha AN7583
References: <20250925155330.6779-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925155330.6779-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_082224_403843_15FB82A2 
X-CRM114-Status: GOOD (  19.24  )
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

On Thu, Sep 25, 2025 at 05:53:08PM +0200, Christian Marangi wrote:
> Introduce Airoha AN7583 SoC compatible in mediatek-gen3 PCIe controller
> binding.
> 
> This differ from the Airoha EN7581 SoC by the fact that only one Gen3
> PCIe controller is present on the SoC.
> 
> The compatible have -gen3 tag as the Airoha AN7583 SoC have both GEN2
> and GEN3 PCIe controller and it's required to differentiate them as
> different schema are required for the 2 PCIe Controller variant.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Any chance this can be picked? All the 2 patch got review tag.

> ---
> Changes v3:
> - Add review tag
> - Add comments for compatible inconsistency
> Changes v2:
> - Fix alphabetical order
> 
>  .../bindings/pci/mediatek-pcie-gen3.yaml      | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 0278845701ce..1ca9594a9739 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -58,6 +58,7 @@ properties:
>            - const: mediatek,mt8196-pcie
>        - const: mediatek,mt8192-pcie
>        - const: mediatek,mt8196-pcie
> +      - const: airoha,an7583-pcie-gen3
>        - const: airoha,en7581-pcie
>  
>    reg:
> @@ -276,6 +277,26 @@ allOf:
>  
>          mediatek,pbus-csr: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          const: airoha,an7583-pcie-gen3
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +
> +        clock-names:
> +          items:
> +            - const: sys-ck
> +
> +        resets:
> +          minItems: 1
> +
> +        reset-names:
> +          items:
> +            - const: phy-lane0
> +
>    - if:
>        properties:
>          compatible:
> -- 
> 2.51.0
> 

-- 
	Ansuel

