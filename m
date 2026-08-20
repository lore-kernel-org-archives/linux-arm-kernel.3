Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEF1C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 16:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKhR9WkhIUiBs/DXzAMG9ly3j13B+5WjNx96hhgAatQ=; b=vWUni9qW3vRRaWSHKA3+rfKEuP
	gsBo2hlmTJeQc6BZ3islkXvOl4NJH2FgNik45GOhrRK4eukIaYu8TlmW8WKCKeSJiYLseRlZQm9nJ
	xDsE/xU4+rGJUNyOJb9rVAlu1qePfSR0cT8G+dKRbIRTGqpu9bvDAu1OEq+aOC/nBdWJBdXRS1b3j
	n1o0UYJAu4z1eILqPy6fCHPIItxiSLnuDYToQti1ArjThWIWc5M6U35zndVatmCyEdBts/RFhZySu
	MoleWZK3azrIKFfAZrAYp8xF2/WZlPO1cHofyzlR0L9SRVajKW6OepwyCUn58Yvu2Jezq7hJEVCfl
	QxTyvmqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5YD-0000000Bsx6-0ueK;
	Thu, 20 Aug 2026 16:23:33 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5Y9-0000000BsvK-1zL6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 16:23:31 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c2055573c8cso362374766b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 09:23:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787243008; cv=none;
        d=google.com; s=arc-20260327;
        b=r1xbIrs1x5xGfqhmTQdAuLnQh5hE01OF3VouWuvC/N0A8D7TUSv6NwGlsxYCShu3nX
         PaxLajyEmc1wscnQ4W45JSfn02eSOCjD5uHzDsUrM7dM8X/4d7FgVGHY6+fIzVAwrY7R
         raj0eqx6qrWuNnDQI/jVv/FePsd6g78EWuVPeAY+kGcjrQfz0/VYwU5ch5jQBwDO5PFn
         tVqAD/s0zeOLliQvAFvQpstyFhNyA+mYnWyavUuVVPAYCO6O/X2Bhna4APbZlX5/XYnz
         v1zP7SD5WmsQHz4rgiLToGZ+PyX31zYDJKgWwSLiHiiaxczbpQ8BukoNGm7dB8kpioEN
         gneA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yKhR9WkhIUiBs/DXzAMG9ly3j13B+5WjNx96hhgAatQ=;
        fh=oBtHMxRJFH5rDlW/AZuBhnM7f7p9zy8V5Oy2zuiwklM=;
        b=ZfIiC7oMxEO0zM51Zz7CxNJU2pA2rIKj+CbMbfyHaWBR/fyNwsSsG62nY979fcjeEi
         t5/RzKMk39J7P7LsrX5XkqhnCuYL92WTm4xEd+ZArCPo3TkCEwLTDDSSWnJ+ly/uJQgc
         1E+24zfBo3vZG3n7QUrPfUcYa8/YO5yIiQYr9qtfvtcbkOkVysPFAyP2QSzUXcTGlPnl
         NcW8uGUQzJURd8d5XoP/z3V2rUq/CXPC0vPkwAYhZCg6e+D1jRzX2aEgXB6sv40FlLSM
         8QrnCB3MCPUtLtS1styKuOB4HHTY+ULqH5KqFCusMXvL0ttjvbGjYM8dZYV2N8NBROaR
         EseA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787243008; x=1787847808; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yKhR9WkhIUiBs/DXzAMG9ly3j13B+5WjNx96hhgAatQ=;
        b=dtaYYV171jUrwdgqahBBS8LFD3fH0Z4Xf8Go+XZhArdGCKOsreqSs24c554EwNt1Qr
         eW7V02dYOC9j3FDdbXCFGee2dWuuaJL9caape2LpIeu/2iFfk+WkDODlJJsMJsFQ27s2
         w5dSfismHKTCFetHDylSLEAXpwO/BQ/EPU4eYXAwXRv6sy3uEpwP9KLJWAvGfX1tjHDO
         ahCabHNqUIaWqUhgxFY2SvWR15ZrGY+oM8979gfkcoz5/3qSEZA0GSJtuGaRA4Dg++N3
         Yo5Ox3NZ0rSyPimtklOvgAtTXajwUIpF3wMZek0RGIthYkvP5YaaT0xIUu5mNT6zf16/
         7UtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787243008; x=1787847808;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yKhR9WkhIUiBs/DXzAMG9ly3j13B+5WjNx96hhgAatQ=;
        b=MP62Mk6iaUddmm5gphiJNts5SmY/vAqmHMwP8zJQArCkJV4llq55JxbYCqRs6Qgp5G
         H1+cMetmiFW0WLi5vWM0rIH5LEKlsb3GK8anqnMvtrU1PZ37HxyC5R/8AkPFefwOT7hm
         DRPWtmUA7KBmhxyyEp/dzkcmUR4Cyq2jr3wgjnmP9VPiaIXicwxoiHpLDBE9ZZ8/FAdt
         yDKCPsDumoTeMMTXLrh2RdyQceJluREXhujrw0OgCdKRQiXXc+1H8rEaz7Gsxz4NZA/o
         +3gxu0aipfYB7nqzhz58YMRioSPWMmT8H7tb5jp6W+86M52GpdKfBLZhN9dbNIV2o2sI
         8AYg==
X-Forwarded-Encrypted: i=1; AHgh+RqDqivcHjC6vXnU58/uobHuO2K4pslIHyNHhFwFalM+4rfyxjHIHAhS1GPLeWbnynswZPsHq/172VsDM0o32RYK@lists.infradead.org
X-Gm-Message-State: AOJu0YzVAIpkkzxm8J7m5sBRCov9HUUl8n5has1sSDDKd4k+d1/s36+N
	2eytlCYtaFknel01yarqsC0j7IKBSvYefn2qUryra83b5xYN8eyCPHNRwEJL84mqJ7+6pQD8/y+
	AGBytLw5chaY1P+DSkNIOmaXXwHNdkvw=
X-Gm-Gg: AR+sD13GLqxcYhtvc4exXJ9tAc6z2nWRyhiTUhxy1DJ0id3zO3Yqhgs56Gb/nXwzUCH
	4N/3rUX+9XXNcBIx4oMzYk4tdUEuhJnwNrKigfQD5cpCjGZ+V3Mj9qPilDeeHORf8s4EFIlvgrh
	GPBwmWJ84lUMgaym1Q0TW0RCotz4Efp1cG1uXqXo008nw7F0bfZ4CNUcIuw94857Wcd889l9RMe
	fAfUZciTeOInTQDSsUfM1mIYntltNa2PmCKIOyFRcSRLxmPx/v8MqsMqvJrpWDnCNOM4jTWwmEA
	mAMjxKRyVZvclzX3uaC4IMVqr3qn1bzEgF95KYTDCOw=
X-Received: by 2002:a17:907:a647:b0:c12:9b93:61fd with SMTP id
 a640c23a62f3a-c23e86dd23fmr1141726266b.6.1787243007488; Thu, 20 Aug 2026
 09:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260820122242.120039-1-l.scorcia@gmail.com> <20260820122242.120039-2-l.scorcia@gmail.com>
In-Reply-To: <20260820122242.120039-2-l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 20 Aug 2026 18:23:16 +0200
X-Gm-Features: AcwNN1WN15gIPFE-wS5GMikP40k9b6tUzSd1TSg8R6uNQUbH06o6RfXy9sJzOY8
Message-ID: <CAORyz2Lgo=teK89gxm6QBMfREY=_cAFN2TuLUFvwGcYpozkWww@mail.gmail.com>
Subject: Re: [PATCH v9 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Julien Massot <julien.massot@collabora.com>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_092329_529778_37231944 
X-CRM114-Status: GOOD (  12.08  )
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

> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -40,6 +40,10 @@ properties:
>            - mediatek,mt6397
> +      - items:
> +          - enum:
> +              - mediatek,mt6392
> +          - const: mediatek,mt6323
>        - items:

Please disregard this patch/series. Sashiko correctly pointed out that
it's not necessary and actually wrong to provide a fallback on
"mediatek,mt6323", which was needed on a previous iteration of the
series but not in the current one.
I will mark the series as archived on patchwork and provide a revised
v10 once completed testing on devices.
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

