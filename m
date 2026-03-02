Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83BDE9B36D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cn6EW3SsdY/4N0vlnXwNpj8zo6nlR0XbllYn3nMAaMQ=; b=Z4GF4+P2fCywciOsclsGjTeVcW
	X8E/De/Vsh1mpn2GsSLT2Azd8Iuy//r0nly7EYBWrBEhc6u2cmuP/SHmer3kSuy5KILtBBHK4ci+u
	wJ7hx4XmPCK0t7ic+bpuT7uu/daTyybMJ6Bd9KCQaoBObtyE9Tj+gjIVVK9pW6RDu2Sba7RkdZAOH
	HCkSSkK2BPcnYb/madMevNGu11LzsiRPGtJNB6rzSuFoo0TuvVak+mVe7lE8n2euhEHCph/pxETI8
	Kv+JCeyr5CcJLi4JCguBrFSrnDF3LVyMd0D+ljNeW3yTe4+LQb/lcZNypk/yI2Aw1BDB7FwTyRQkY
	9fYG3s2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1vS-0000000CtJp-0Hpn;
	Mon, 02 Mar 2026 11:59:02 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1vP-0000000CtIs-0Sg0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:59:00 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ae4988e039so7903985ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 03:58:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772452738; cv=none;
        d=google.com; s=arc-20240605;
        b=BcuWG0+7xbjca8Iggw3Zt1QmDAadZyJDMOLVX6NS0SQAYkZU46fqKnyL4w4obXh55I
         SwXpOEHvLaxQKzOSVGum99/C7JfkSohdq0t53M4JqFIiubZmkXRNDRlCQrD5U9dP/o9/
         WI7RZ2yLybK0lwlkp7JS13LT6WViHxflzwYgzD1xQKnqS04Ar0ZDNzeXaLi4FItIEdbj
         q8y77X95n3NZvIlcGM6x5TMs18pID6M/TgFJkGS9fIXXIkIvg4KF70nlO8C/o1rlnKWe
         wDjq2fOPhlCEY5DP+09WREVRotk4ypYux+rPaSY94r38+IjkXD2w8ZohSGd2sM/d4VVN
         Sc/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cn6EW3SsdY/4N0vlnXwNpj8zo6nlR0XbllYn3nMAaMQ=;
        fh=cO1YnCPJZ/3Wv/pylmtbrKpP/fc9eIsRa+C5+lAwHEE=;
        b=ixyzDwXiMHZBpKsrYr2BmXuSZIQKyla7u3KZz/37RJQqCFhebV9jFl1RjhU9aocRbg
         Uwb3BhNQv5cLKSPE7VBicEnR5R3xzFhHlxS5N6vLtwxzlrauepNhNFNJAwrnb/ESXL/9
         C8tCkkuZB1OsT2wRETcotWK6GBX+LpRKLt4cTxxbTBp5bolsos0ustZKrXMMx929I7f4
         LqgvL0yFP9Gycs7t5ON/fDmooD/NJvLu4gyXthzWhSrpoaHXiwAZKhParuRNW1YaoHaO
         5QpuRjDlV0f4+IDp9m1ztJAeJwQJNCidvScXDbaKVFLiJ0PsxtKHw5PUFfCUKVLdSGlX
         nzUg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772452738; x=1773057538; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cn6EW3SsdY/4N0vlnXwNpj8zo6nlR0XbllYn3nMAaMQ=;
        b=LL83v06q0K4iutoP1bsV9iYgIAnkLB0EdO+TCCtfZuJMfqc/D25asXvZ88XuUc/JXF
         PpZ64Gbfc7f3NWkzQqooE2+sH9LpzP9VUZSbrjir/pQ4XnG8u2Ff3ftv7VkpampuTVKw
         yjpW3kZukbJDNygxC7NQiCnmrTBiX0f0UfMv+Z42blEe1ejCMinyeNH5wM+FCxzmKsua
         ev1HUHkcHNEhOqS7xmvRlYueWczlKRpaHnYeD9+GvE4qxuVY+ZT5ecQz6Q39AVjyU0tG
         bcLHKaxVgeEjnv0LoRuVM3z/eZ+cnUcqs2Xt9QE4oaaQaUSC+3lxJwG8VI/XZBzlOMzW
         WSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772452738; x=1773057538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cn6EW3SsdY/4N0vlnXwNpj8zo6nlR0XbllYn3nMAaMQ=;
        b=cdWCCz8oTZJvXz5ualXDZaBVNS3LaY+wN5chb+iI+lEUvyt9u8SbXjk96EUTMsNjww
         3vNoo8/NcB3iN3SZ5KK7LzDIQPKoLnJBCg4yVphSMKdj47+dT0jXvdZCh+9a0CMQeZfK
         5PoniIE3uguEjsr8Rf1N0UFuSYJGJyJvBNYZTuar6Fn1CnnssNr7r6zAfCV63wGy/beK
         KRziwcIMC0MD9dmcFRykSDvC8wD+uOgsfFU8cI97baZ1Z6JD84rId+f6Ff9u2Vk80ZUO
         GnX3TRio4xOXvgnAc/wBMIVPjpY+fLZVrhSkM2WV3REWmArHiJzRRQbiYIH5SK5GLxdj
         GHGA==
X-Forwarded-Encrypted: i=1; AJvYcCVEdVQFE4Kw0FzA+9R+m6a605m2y6MsyUUd8u/dEp9ISezovpNuesmNRkZuu+45wHtzjmU3DthFArGc2XmheiOq@lists.infradead.org
X-Gm-Message-State: AOJu0YxcqEYeqeomKG+mI+MoLENx1p0wszlctURd5hKVpOrQpk7d11r2
	6EaN4b3PpuHx95Oje9t+FNZmETJiZRjgWre3Jg14yowEmPmWmDqnVx9GA0i+PL1TlSkQPmPwDNB
	W9i+KOQHg5FmsDG1NfG33g6CHChLpO58=
X-Gm-Gg: ATEYQzyb0llMXUyF9BNmnrNZtJCpGQO09t40RJBU7hLl30Coa8oPXUaAfuFslhCYyLv
	sj34iF1LlQLipkPhyFNkWbXB1l9XLDQxhzVyirlUBRmLkSKXQnUvpc0C2ioI2JT7cKvXs4ooT+j
	LAXG35spAC89wni74/U8OmASdCirh5S+dV5PxGAE1CMSDiladL4kIwBVvJ37qmDAcv7Zq7i52cv
	TmYBFp0fg6tbNICi6kzBBsc+YvEWmgfDo/YHN1SAB6Z+Xf9v63plysC9QAihYt5FfZtQ46i5eth
	evAuBThPJYzQMK94NbsI9w8/JjHTq3zt4yGTy51D
X-Received: by 2002:a17:902:e950:b0:2ae:5a44:ea80 with SMTP id
 d9443c01a7336-2ae5a44fdbamr8590715ad.17.1772452738264; Mon, 02 Mar 2026
 03:58:58 -0800 (PST)
MIME-Version: 1.0
References: <20260228065840.702651-1-nick@khadas.com> <20260228065840.702651-2-nick@khadas.com>
 <20260228-quirky-lemon-reindeer-1045f6@quoll>
In-Reply-To: <20260228-quirky-lemon-reindeer-1045f6@quoll>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Mar 2026 12:58:47 +0100
X-Gm-Features: AaiRm50A5ixOEMCu9AMwpKXYw0q-1sXvRrgscdrkIScH0FsjWH2GNDFERRZkqCE
Message-ID: <CAFBinCAkxO4HoN0Cw0Fc2B3KRLLJqso1p5+qjNN_E0c26VOf2g@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: iio: adc: amlogic,meson-saradc: add
 S4 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nick Xie <nick@khadas.com>, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, krzk+dt@kernel.org, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-iio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xieqinick@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_035859_247041_D6F6DA34 
X-CRM114-Status: GOOD (  20.48  )
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

Hi Krzysztof,

On Sat, Feb 28, 2026 at 12:18=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Sat, Feb 28, 2026 at 02:58:37PM +0800, Nick Xie wrote:
> > Add the compatible string for the SARADC (Successive Approximation
> > Register ADC) IP block found in the Amlogic Meson S4 SoC.
>
> ... which is fully compatible with g12a?
>
> Write proper explanations.
Would you be fine with:
"There are no known differences between the SARADC on S4 and the one
on G12A. In the past differences between SARADC on the different SoCs
generations have been uncovered late, meaning that a dedicated
compatible string has proven to be useful."

Do you also require Nick to add amlogic,meson-g12a-saradc as fallback
compatible string for amlogic,meson-s4-saradc?

> >
> > Signed-off-by: Nick Xie <nick@khadas.com>
> > ---
> >  .../devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml        | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-sa=
radc.yaml b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.=
yaml
> > index bb9825e7346dd..5496a0dc714aa 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.ya=
ml
> > +++ b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.ya=
ml
> > @@ -27,6 +27,7 @@ properties:
> >                - amlogic,meson-gxm-saradc
> >                - amlogic,meson-axg-saradc
> >                - amlogic,meson-g12a-saradc
> > +              - amlogic,meson-s4-saradc
>
> If this is compatible with other device, you need proper fallback.
>
> >            - const: amlogic,meson-saradc
>
> And this one is now kind of fake - how does this device use it?
As you have noticed later, it is currently not used.
Can you please confirm that my understanding of the next steps is correct:
- you're expecting Nick to omit the amlogic,meson-saradc fallback
compatible string for amlogic,meson-s4-saradc
- and you would like to see amlogic,meson-saradc removed (from the
bindings and .dts files that are already upstream) - I will take care
of this once S4 support lands upstream


Best regards,
Martin

