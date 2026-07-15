Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8933CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 15:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mg3ZeFY1mH/lkxcwLQcXVtiMYVBxfdswbYpOEBR4q8=; b=A32iPXowICaOki9XEdI7bg9yit
	NrBJ0C3QEbV9cZ36GSXk5dXx94Ow7T5c6SJuCRiAetfade4o9LnsDRYtccCa4Tdt8uet21mSOzWRJ
	IkKTDCiJO4JYhctBPaFU7a+Gcxkj5frYGoDR1F5jdxDw7zRyU5JAbBQjGf5ZpjAD4F2e60Ucby9tW
	NTGIRqvL/PKmwNnxsJnSaYZFAD97vWHuL4fe+g+VYMblsPAB2bT12n50LPXxhKjLr2AjUn42O7leQ
	rXg8etjzsRf25cPHtuoVBeSX1YeFEjzI/gV+ZdhNrb0G2mOLOOIdWZS7JYGXNiPpEDKyNP8yrYf06
	s8czqRkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1c3-0000000FKbg-1tiO;
	Wed, 15 Jul 2026 15:33:31 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1bz-0000000FKaT-20BW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 15:33:29 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so2346854b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 08:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784129607; x=1784734407; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0mg3ZeFY1mH/lkxcwLQcXVtiMYVBxfdswbYpOEBR4q8=;
        b=Py+a4S2TCAzGakNISCKb/tU0Hz+YyREGn3LlXQJEJ2h4hO1U7X1wErIZGs0ovNbxoK
         TNh9zfEegfLy2tYyEcQNBfsZd/BZDMTrtrxfLAZpBicRLIiWPEnvt2pwNJMUZqU+kvB7
         jndY2B0FU0Ou0u2m5bc4hmWJ7bTjVnfSg2O7xZXzqDX3Z1YLnM7Yxa2LhP+FWFeP16dy
         F50Di+mjkRkqpyOuI/qnBSx4HytIi6Yqs0NGBypoPK/1cJQQy3RsBA9Qn5UvsfNeKDtv
         5jknHslblX7c7xDQyFJ5S/Sd52Rf8SxmPoxJLnsDrwhsSDiC4RQ2eC1YpDnWIJHcFWcc
         VngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784129607; x=1784734407;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0mg3ZeFY1mH/lkxcwLQcXVtiMYVBxfdswbYpOEBR4q8=;
        b=ax2is+hYHBZDtMrZelwCremttLnFgUbl6s+qTbKeUVhGnrhc2z+Kdawqy8i29jT1ba
         3vhG3KA+hYPrqdYATDbQPhVerpvEpb6DyyclPfCxMPwgVV69UrSwsqmkfZleeFaWIzYt
         kVVMMUDgEk91gwsknQh2pxutXFYkcVCuvPjdlyM8oeR6foyWprYKQCaEQ4zNQDYl8KK+
         SUYV8r9oN+ws7ibtC6cTXlbleggIfuLBGNibYkmskkziYtg4JYGrkYegGyvHmjUbSQ0h
         WW7zv4i02DLEZPmRMsfzC5tFkE++bhsHFo8YwL0IhS/gYlpSLbH/Us9FSvE8wg2h/Szk
         XrKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1S7oXm4zZJntHDmJ/jLWLhK59LpS2ipBt0nGmMVy7ChEPHPSKaiXWgy7JbMdeRUsVRI26C+UfmiA8XEtIkw1x@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd2wwSAbE9DuY5CNSpAFir23BZ+CdlE3wQgbDHZ4lLJGVQ04Fr
	K4GDMchp1v+6xCZbyxA+ZVS9/71UTwokuOAO6vEePcghCGf1hIfGEwLT7pyeM9S3nAE=
X-Gm-Gg: AfdE7cmC0pyGhag8u8Cw+eAuvG1xHlnl5i6wphHoz9pB2aXqKmbFYuAsxc9c/YbLcPv
	VJcTT9hT/33p44dT30/ybL/CBPyo4AtjTz7iVMBvqCLr9K+51E1UUXuNWZ4xt1x2M4WdDtvXGgu
	97eOwTmPohTC5fv4BZdR/kUMQVN/STUv4aguscVXprzQ6FnMks1vhMUWSxB3v5ksKyUbLvE7XyX
	eAftVwgyjrFHwBMEZC2yyqyx96kOiABr4dQANJTSbixU7+8qpb7fabqE9wEL17lmW4y3U6G1jQi
	v3GoNPhEbl2j557vYciYQkQfnSLROwKrz1JmZadHitLxhG4lvzxDb1DQDFSEyTDRXIvCwew7P+j
	yg7tt4gxRB/C3+/LV5RpPB68uzWV3dl2ACjq7eTm2xkR3PNlJ6GudILd14aNRJtL7f/LFHS0KSc
	j22I+3+EnZx2be4qrd
X-Received: by 2002:a05:6a00:4f95:b0:847:9803:ec6f with SMTP id d2e1a72fcca58-84870373138mr20935586b3a.10.1784129606555;
        Wed, 15 Jul 2026 08:33:26 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4f38:9a5e:fd18:7a9b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7de23asm3373865b3a.49.2026.07.15.08.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 08:33:26 -0700 (PDT)
Date: Wed, 15 Jul 2026 09:33:23 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: remoteproc: Drop redundant $ref of
 firmware-name property
Message-ID: <aleoQy-YePWJC0sW@p14s>
References: <20260712145718.126492-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712145718.126492-2-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_083327_539108_EE61AD41 
X-CRM114-Status: GOOD (  17.31  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Jul 12, 2026 at 04:57:19PM +0200, Krzysztof Kozlowski wrote:
> The DT schema core defines the type ($ref) of 'firmware-name' property
> as string-array, so individual schemas do not need to.  They also should
> not redefine it to a single string, but instead just set number of
> expected firmware names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml | 2 +-
>  .../devicetree/bindings/remoteproc/ti,pru-consumer.yaml         | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)

Applied.

Thanks,
Mathieu

> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> index 3f710433e937..4cd5121b9a4e 100644
> --- a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> @@ -25,7 +25,7 @@ properties:
>        - const: amlogic,meson-mx-ao-arc
>  
>    firmware-name:
> -    $ref: /schemas/types.yaml#/definitions/string
> +    maxItems: 1
>      description:
>        The name of the firmware which should be loaded for this remote
>        processor.
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> index 2811334515d1..591471e5f93a 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> @@ -30,7 +30,6 @@ properties:
>        maxItems: 1
>  
>    firmware-name:
> -    $ref: /schemas/types.yaml#/definitions/string-array
>      minItems: 1
>      maxItems: 6
>      description: |
> -- 
> 2.53.0
> 

