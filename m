Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16407C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7Kmv08cr/vXN/lQoowvHwCG19gM8kPqiBIx7P0p2BM=; b=AIjy5iOWQyqoTwv+zmn2tLz4eU
	icSlqM4P7PVyrWmFUrlPszaXdkUPaOsknFnQTVdI8yqBSU542pW+NGJjMe3UfAKD9Y7Dg/o1yOS7o
	MVBfnlpxe/LXr+7qllYPURuIOxZbgVRJfpy4xYflPuc5BBqnNr3TyXrmBDcxEUJVrwdRpZ55rlNlH
	cPESOZNZtgj16Tpv2cJLT/sLYKHdmeK2wP7bAvIRybdcyQYudWiGn8dG8vAS1W19sgDZ5TMB+vZhj
	ULB7o9x2U0cBTJJzJDzYqW/UjL2H6UppHcAA1+e3Dz/INtEyCm0s6IfJnjlaWbBLSX11H3H36LxJh
	P5wbZSFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoWn-00000002VeH-0QYE;
	Thu, 09 Jul 2026 13:10:57 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoWk-00000002Vda-3H7x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 13:10:55 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-69532288224so1713751a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 06:10:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783602652; cv=none;
        d=google.com; s=arc-20260327;
        b=HdHO+RGikP27WZr7AFqEdTGxzrh/i1991ZuM3tm1bv//WfkqtMHLtD57uZaFfEEe3+
         GDppY1w78xX2/wEg2bPv98HvClU9Qu8iIbPnvMwigOiTnWwBQqOHvOO8+zKDwJQ0AR43
         IKAuqEBjtWTJSLsTSrn4hu1K01bUDsFTz7SFAoHcxKsMXzQEoFkzDS8IkGobh7HlaCl4
         aw0GdF3XFGZstf3xVWcFO3ZyPH4/Ei8diPsqwdFjXyvZCLVD/cQ8K4C2jDYjCgDYXsAH
         duzHXl6e0uQ3wxAeDWSQHK3WqCK4N7oZFRmo/FEmgfEEETASuTGU5uEPfvIKIiRVLZOu
         HuKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U7Kmv08cr/vXN/lQoowvHwCG19gM8kPqiBIx7P0p2BM=;
        fh=ZDK5p65z51oHB8piqjPv4unwuqXHS33L6ZGpcA+kOdA=;
        b=AvQgAApS3uDkcRVckIZl7238We7Mo33igRf8LgZMaMz2BaMlYQHFUn/KKOk+jIJtUJ
         H1MSTBEL5gDN+g/RwQlQEQMYnzh34dTnjDOQTrUHFr/LrCtVn1ZXkV559TKEDT9Asxeg
         qsbpGwH/Z6C7hM4hxFC9rA7rgf/lg1qzsKETM5T4UCy+hhonG/JoZ6NHtVnr41xiOcIF
         cuwphOmG+/wYL8nLKYyCAy2W+R7E5P4NMN5LuEe7y8YQBXof6nCXLE1/LFzTVFXfJgal
         JbikxL1JsH7CD8iX67v5NrAQdvk1Bkq8rfX9ZPeW/RWaNZzSAP0A6uA6jhuE5RRw2erB
         n2+w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783602652; x=1784207452; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U7Kmv08cr/vXN/lQoowvHwCG19gM8kPqiBIx7P0p2BM=;
        b=YDwqJAAHC3lDTEV4ZigDYxek4/WxoAies6gLqsRzUaRKRcuLd/bNACAAkqNm3fzeGo
         KwXeLQoEfpf8QytZaMeufQgclCoRfjyntDXT5bXYOrsnc6lbdI8UhhNBhz+2I5NBtFy3
         qL0wTjtCJFSD2ofqjQ/axI+LAV56ZQFjmwNpJoeOPG93+UV68ySdNsWs1Ks8sZq7f3QI
         e46CFf92MLheilgSiYL563JEgosVsfcYRkUVFyYuGIwDaGj+TIORCtEo2Jo2wEv3sD0b
         ajXKRcuTgVrowwH+m2LOBGiXhHq6LIxYX+wRYXbzBDyebvf73i2H/d/JYfC2f+Jyk4TQ
         v1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602652; x=1784207452;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U7Kmv08cr/vXN/lQoowvHwCG19gM8kPqiBIx7P0p2BM=;
        b=MqNF/1DnDkapLXtz/yFdO7lQmQHMnYiOke8604br5UN+E5uaKhgd744k3sGMomeizL
         lX4YAXmjShfQBLDaA3eVuuG5iU9Yjrg+yibnLUp46Hv/LyW3WhT/BwFjXVm6VVo76Skn
         DTXls+T/qtl4/q97GlNU+Jy5U/aR7UccHB4IcVOEGXDZcy5Xg2u4pdtc9CRqE6xrGaRC
         owZSKtzzwOCsIVxuVAQUvVsCcbKTfqR2BgovVQkve+L0TRykEguR63IT9678Y0kjRYPk
         d3y6I4QeTi+wsyGny69NJ+g99jbFLGZs7Ibs/WfMCQvO0WTlm60yUX/5z/ioiCACtk4S
         92uA==
X-Forwarded-Encrypted: i=1; AHgh+RoVPAYAJ3GcuOmzET4a7eLFyr0lB7w6YsUyJHVEFO0hJWexF5AEj01rfIAy8B6YDjaHbbcuCNx1xpEkpiBbfrCb@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7gmlRf43jg7sKUYbbMTtutzwvjOFGMbjtbglB/YLCehKpIcjd
	JN5o+0rqaAkMl3zZ0VsD0r5a4xYIAAOd5Rlya2O8XQzZdEGwiFD02iRfVP5MBXNo8DjRqR1CjhP
	pKG5K9jTp1dA7zaQLe9P08T5KDattDFTSv2hRtIGV7MBppIVF433VP/o3ww==
X-Gm-Gg: AfdE7cnqDPDmOHsNcAFyq1yHWoIQJ+3Bym738EhStY8e+RFJLLAJXt+BqtODuVBYvEZ
	M5MXK5r8G1A0LxhqLqB3d9KLmFxVec1pLkZGQsCOWztul4IjT5LYZd1fyK0LoIZZnA7KrhODo9H
	DMJ9RtV/dCxOuN+kwDGvTde5z9f7Km49mVtMzXjUn725IW+6U0LZItPqRigjzFoWqUC1yYVQzdO
	QwWoL0xcYKYHN1wzeOG21qqWLWY3NOcHJVfAIm+dJhe4VhDEHbk/VjmoKpy+2CnN+Q01ucuytuH
	SQIOUGoU1yXvpUtklGBl41Lt8G8TBRQ=
X-Received: by 2002:a05:6402:3595:b0:69a:a9c1:c33b with SMTP id
 4fb4d7f45d1cf-69ab44aacddmr3005773a12.31.1783602651660; Thu, 09 Jul 2026
 06:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 9 Jul 2026 14:10:40 +0100
X-Gm-Features: AUfX_myQ0gFl-ytrmuBc8dxFLfDYOP7Y9AYpNDt10PW8eTtKc3T-jFh5D_m4h-M
Message-ID: <CADrjBPqGMUOWtm8nGHpkQTRkAHtxtpNi6SuTdE0x61zO0eG3Kg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: samsung: exynos-pmu: Restrict children
 with unevaluatedProperties
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_061054_853468_B0CEE8E6 
X-CRM114-Status: GOOD (  16.79  )
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

On Wed, 1 Jul 2026 at 11:57, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Each schema for a child node should end with either additionalProperties
> or unevaluatedProperties, so add missing one making the schema tighter.
> Defining 'type: object' is on the other hand not necessary when other
> schema is referenced.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../devicetree/bindings/soc/samsung/exynos-pmu.yaml         | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> index 76ce7e98c10f..d124f3ae9fbd 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -94,19 +94,19 @@ properties:
>
>    reboot-mode:
>      $ref: /schemas/power/reset/syscon-reboot-mode.yaml
> -    type: object
> +    unevaluatedProperties: false
>      description:
>        Reboot mode to alter bootloader behavior for the next boot
>
>    syscon-poweroff:
>      $ref: /schemas/power/reset/syscon-poweroff.yaml#
> -    type: object
> +    unevaluatedProperties: false
>      description:
>        Node for power off method
>
>    syscon-reboot:
>      $ref: /schemas/power/reset/syscon-reboot.yaml#
> -    type: object
> +    unevaluatedProperties: false
>      description:
>        Node for reboot method
>
> --
> 2.53.0
>

