Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294F3CA9ECE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 22:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nD84KsrwDgkTBQQV+472E0SUuRjtbi5qncXpaLstElo=; b=3s6SYGwKNIJycAJHIUFIub0p+1
	/71m4JUW7j69WUPQR6AidIt7ZMtHfMh+9XKSnEoIpQolGvkyOmVUtDeZCVNf0YCWcKFRGCE/YESMw
	UvufWhQF5x3QPyoztKvapebzM/nO8tG6ThhIh/We/SiY9hOm4reERc9tO8nQCF9IP6HNdH+bHsv6a
	ss7M7ZvDd8BWknk1UR2a4t2BWcy7l775WWI5YxWAu/L2URW6m2ZRtJz+K9nv1/odwskUIm1gOgSEd
	MhJMll+2qs06hODaDHXdPGymNkul9pMOGDUmAOYa4ar5uzEbCI+Cl/lEn53XKFYIkpV8iMBnRH+sM
	hplIbm2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFfB4-00000008ToS-2Oll;
	Sat, 10 Oct 2026 22:04:26 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFfB2-00000008Tnj-0PP3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 22:04:25 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-6776efd4ff1so502590d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 15:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791669863; cv=none;
        d=google.com; s=arc-20260327;
        b=PRJknyF4DPWseOdBeSKP/4Po/G8JE5e18Y9Los5JSFFDRF4FKQkLwdNHL5e7OrXP1U
         w8UU1gWwXxCicMLeqSxKg8G/iwH6nznKEXpBqiMSxXfm1m4ApYOJMqhMLsLW9NZ3EifY
         VmefeNKiQhTuPZhbDayYX7+QjCrZGOpY1RIgf/AFYecx9My6vZOcZCBen7BlTaeM2Hbq
         ptv/wggF0ldEr5/2tXTKfdvSDDmAqyhjvMyAlVRCiF5OfT5XciN9XhathXm29fFnFKWc
         iyc4rSdRaF6uD9KjLfNqJWSglaj90Qbm76s9cFD4QzciTkPBD1w4DcLS8IQFz0g6sank
         x0Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nD84KsrwDgkTBQQV+472E0SUuRjtbi5qncXpaLstElo=;
        fh=Zq4W+pUfiIQ04NZhSWAhBlRcriGGlmJ6iW9MEQQVTLc=;
        b=KeN0f7a3ygpGVBqlhdsdaWMg9wSZ+nW0zegQO4w3ue9UPsCHiGwMcbENjhSm8P2rBN
         I/OXIPXfqh8N5KfIROtK06gNT8SqbVQY35mlEkfyDKQbdkUDmTBwWx6NOCwRAMfD8tXG
         6VeTcvXmvbEOaK2BAnMBNQOnEEUs9ZcSIhZ9iohVzyVt0DrYYcAXHl+eauOGcw7AECxL
         0BQH3fGI759MtDoJlsL5cfsVVWLZKo7D80dv+MuyEW4ycOXgx/fdbaM36uQIfKzGm54b
         mI7sXMhyjnkQi2XlPw+4tgoDnAaHFGjoWmb1xXougMmqgWp40ZwuZGbCsAGjyBDLvfcN
         L+Yw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791669863; x=1792274663; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nD84KsrwDgkTBQQV+472E0SUuRjtbi5qncXpaLstElo=;
        b=m1Bjmqsi7BCNV472jJ0MuMSL5oyjriBUeLMnkr1yWfFBFBnrsFBzdGdT7lwa945ZE9
         PUzVNrOHko8QXeT4DV7ihscNZEPUlsQhGsXTXhiFQiEHelSdw+odj5n4QoX+soznmXTJ
         RMvasSC93lNJUcuZSwwt+j/SrF26FuGVTBOan1IXmIIsJmXYEfjar2AwEYAQrmjwAMTH
         axHOV7/xjU6x66PAKZoJZy3Bp6zsWrpIWjCVs7e6ie5pT/x+GN/iWw/lcZ2vSPI+K2KM
         9z93E777D3JRpA3DRIn2+AIHAjWr06pXv+cu6+jz6HAyfVulWtUeIRdsRhbBkkrIQ/VZ
         PiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791669863; x=1792274663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nD84KsrwDgkTBQQV+472E0SUuRjtbi5qncXpaLstElo=;
        b=blDjMKDAvtpoOj1MEDk+H9CnzewATUNLGbZ+yRs9ahNHEvMinM3JTXlAF/HJNtRy+j
         i67FUX9OtNfPliZCY1z5zN9qrqqfr2TFjeci904YWYRz8CRN6N7rUF/Uoxmxj++OHSTT
         dSMbBdr8xTpx889t4J1LbJo0y4FQu8mo61osX6C5gEOInBJlljP+rdRLE1dKeDppNZ+r
         TiCiFNSyrkxj3keTpC5D+CxSy1u2UVM2S7szzbmKQg925EtWEhfqqMVf6AGWvDdV/HYv
         jQLKAVTuvw9iHZfn2ANLvul4PDfAzILmv6OWfY18qq3Efx9vF1TqIoC1xUmZSLsR4yyq
         /VKw==
X-Forwarded-Encrypted: i=1; AKwUvBzVGPnTBwTACbZ8hZQyacEtVD6YSfBYiI2c4Z51OtcKnlWOAV+nO43FgwnIbVPH9uAfHfqyOSFP6lYfekGq0WOd@lists.infradead.org
X-Gm-Message-State: AFq9FYLYDsYS9L3P0RAt76BElX+JIwrSZlNZsCdj5OGZJNEHSEEucV9j
	0v0FGs3WS34ffpzNkryxdSEdkwWzRioNCUpfPMDeiM1KpAonty81tQYa3zDsMpPhRTIf+8G99jz
	LOvF7CbY5prpHW2DHMP79PvMqlcHlKsA=
X-Gm-Gg: AYBFou0KGdkBD9eUCNRiLSvunn3Vu1LsvrJZNWRx4RqNyljUdVdS/ptbXtRsJfq7QA4
	tBD5T+Wdz3Zl5ocMfWHjsWnpUCRZgdfhfLXlyPwUhm7t7k2XpIOkrwxyl+P6NQQiAPSd/xUByz6
	qQXGF5Ab2KSWvmyILWI8b522iX4fAB/diXKXKLCzVuwGd+WUOSJSChhod/7xF4SLFXwmBPpsHIi
	TnR8CXC6lfCWySqtBlfUq/N3WELolhKCRyiUbX0UjuUL4HreLnmlvwcYFKokj7HUnuuJhC3HHj2
	En4C9LLRQ/6c9Z2NVQg/F7lr+jXbuX4Xdh3RxN3p3lh5PSgQDBO1FV9rLR7NEvhf+Se7FRMZ+TJ
	ZPodjtEISM/4orA==
X-Received: by 2002:a05:690e:1407:b0:679:24b6:fb2f with SMTP id
 956f58d0204a3-6793678c7e0mr2255529d50.12.1791669862784; Sat, 10 Oct 2026
 15:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-2-tanure@linux.com>
In-Reply-To: <20261010105900.247342-2-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:04:12 +0200
X-Gm-Features: AclHuK9eVPsrLu_8xG98kzx45q0ow1wl_zWO8WFmOGBNd_k8l5MABlydeHwbbRI
Message-ID: <CAFBinCAejxmeeHyDy+vMSg6dBm+9prhEo9qZ7FAsiWNB1W-HXw@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: net: amlogic,meson-dwmac: list the
 compatible combinations
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_150424_166700_3FE1E7CD 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

Hi Lucas and Conor,

On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
[...]
> +          - enum:
> +              - amlogic,meson8b-dwmac
> +              - amlogic,meson-gxbb-dwmac
> +              - amlogic,meson-axg-dwmac
> +              - amlogic,meson-g12a-dwmac
> +          - const: snps,dwmac-3.70a
> +          - const: snps,dwmac
> +      - items:
> +          - enum:
> +              - amlogic,meson6-dwmac
> +              - amlogic,meson8m2-dwmac
Meson8m2 dwmac reports: User ID: 0x10, Synopsys ID: 0x37
In case it helps I can submit a patch to change the Meson8m2 .dtsi to
use "amlogic,meson8m2-dwmac", "snps,dwmac-3.70a", "snps,dwmac" - then
we could move it here too.
That leaves only Meson6 with a single fallback compatible. I don't
have any Meson6 boards, so it'll have to stay that way.


Best regards,
Martin

