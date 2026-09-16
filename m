Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E4EC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFdl8Va7Swxkjw5uQRSJKt+eRYekF3RPnToHL1YscsE=; b=XMa/XQ1/hccUHqihS8WyOzWtkJ
	Lq8RAur7NESTPqcEGlH52Aq/ozfarupSv+CimCmjdiEnkl9GqRB9PMDXCNy2SaOhc/NKyZOaEuTpw
	u7pkO/13l1o3uPGtnbYVHGqT4KaYUCugaG94M9SRAwseX74qX7Tmgoxgc9WdRGMbjFg8cQ1emVYS6
	33BXllnhxlcXWSFLcGIC1Qp/akt4Lv4GwH9SIvmm88lvXbnsNHo3OoSrVLFnB11P5YNydaNJN0vE/
	6lVBKG3Un/v2MWFDC1lXQlI1+txlZHSS407iXaBkv1BHHO19rD/Bh8bNNXuLkWBkgloGdBzyKnSrt
	cCn4ju3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kCH-00000008bQb-0rld;
	Wed, 16 Sep 2026 07:36:49 +0000
Received: from mail-vs2-x0d.google.com ([2a00:1450:4864:3a::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kCE-00000008bPC-2ChG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:36:47 +0000
Received: by mail-vs2-x0d.google.com with SMTP id ada2fe7eead31-78564421fdbso151930137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 00:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789544205; cv=none;
        d=google.com; s=arc-20260327;
        b=YeWVA9gFOVPGnadVtV+/O+JvZGM0sAmfEjAk0mp70sGlZerPSoNy9OhvTDe9urYkkN
         m/b8MB4bV65vQ1jQCHyQD74YAp5ucEV9DPTKs+tvrT17ESGvQikWbBEuXZ5lyctv5IcJ
         b0LvG2uCIX7pR5UXScH+jX5uWp4sxNWh+UEB/c86oGflg0eaRWtinPo+jOoc9jYVVmzl
         mtIJNEuOz0dbHn/khWC8mBEXhI8Wsr5DVjQ0Y6Eo9HHQ8itj/49BYfxOxN/oBTAwJgaS
         fLFRTSfwG14pC+tK6n1VeRHb2W9la73W01iZWZaGm1aQlRhsxQMudsrBanNhbQScVxn2
         faiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dFdl8Va7Swxkjw5uQRSJKt+eRYekF3RPnToHL1YscsE=;
        fh=m1UjxzN5CKXQbeV/GReX8L2OEybyiJH54rIEZoGPHqY=;
        b=ki3AbZc5ihAPV+7C0hwu54rHjZq0214V7ncyskdA1jF5omOW1kP42EJu04/AqcQouv
         avCtMqdUL3POrtOntH/mH73Yh9KZ+R5QyEIM3cT2BO4PREQMxoxszZn6iAHpAecKXm+l
         z/ew97jmaj4piWPtpm5bZcDfpM76JNDw8Keleo9c97aYBypH5PAknMf/7FbR0lyNFVq0
         g2RUkI7r/siFpszIaETfJr7xWwYOS8L0YikD7WCZjzbKxyCPSqfaKZlRZhcfDx3tcDR7
         A9iIc1foGKncpRQvbnA7Lq+pbW+7Iedz3g+7HJ35KXIl4f6nB2gFxdI6FI+b+xL1mSqM
         cnkg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789544205; x=1790149005; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dFdl8Va7Swxkjw5uQRSJKt+eRYekF3RPnToHL1YscsE=;
        b=LwTXbKcRfzDZ5YR5iQTVqaS9JiyuOigybhjzlJJIN/JsLt3CDz4eZEE0P4l0pHejNT
         IzzPzl9zpz4gTyFsG36FYVdUtYnuHI58SR+6cWPUKLZUmPwmSfrUVXm5ymsPVuAfCu2T
         FWcvpQmwxejoF/X0C1xWQxhy8+rROrizaJ6a1mu5npeY7A1DvoHz/A+dCr6jKT3huNU8
         XfZmYqjj5U3Tufj9NidUX0jZ9Z6/pJRQAR2dUB0WUow8yF1ncBZF3REO2DAE5N3thfu8
         jmq89me1ZMhhi+2Cje6EFe0q9u81fR8hweYRPhpq8+nNzjw+STanmH4X4DoHq8bhmAeN
         WvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789544205; x=1790149005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dFdl8Va7Swxkjw5uQRSJKt+eRYekF3RPnToHL1YscsE=;
        b=x60Ml62dhQVGiwwcXtpKO9hVJX4nkejkygl4D8+T3DQU9bXVLxgkFTloIfvNH20nY/
         Rnyet4GoFz8OYvy37i/muiWRlO/rTqmyoHQVAzAwC+wxaO7i6XrNI2AxmruVTNMTtul7
         fk6lyynInB9T+GMQfmrsGOjFA4V19dBklSbuQ2IeHoNCgII4S+ob7aHFzu6QqU/bxS9L
         1+UKt0UfuxWH4Aj1SkPlA4MXNPC/wMYpVNHRHOjuiEEm2N1Yi5JRGOzbxNewS9WhYqRk
         8iubBU0W7UDrE2GiRfcmzUbb00U9akOoagnm4cbr38UXSK7PLuYI6PIUR/Hs+FoWrQJm
         1dDw==
X-Forwarded-Encrypted: i=1; AKwUvBzvdV6tTJ2KO+rBBBkze64/bNsaCuGzX8PZR96mBm81cozOKUqkIO5wRaE39JngHDw+Fc9ooNGViWyR5nblCf9c@lists.infradead.org
X-Gm-Message-State: AFuF++l+1258pbnRI/rQKU0e0cx07M5Alnvi2o4DkDSxrGdni4vmDbcy
	4ZXBIaNciPrQBW/lbkzZXXTzj4+2sEEtBOdF6pr14XWHYaQhcaccO9KiQVyDY3lHMnZpAqXxMHi
	r6z8FZBYzGAGb/v0ncWbFjr0vDasKQjY=
X-Gm-Gg: AYBFou3krpTKbU6DLC4KQgdpTtVwUM3s6G5/urPEc/o06N8b3Fv/X5Sak7RZaA1Q8gp
	S607atF/Vzj2hrRU+t+xPWZNCdZBMo6O60L8B1XL1WD9IJW7rk0xuyfbrP5zaX9f54CgxoqXI44
	uDD6WLAjebo288Zodr9+flfJGyaqRqbqUE2WccvMgmFf6c4pJPEM2FWnBZJhJxOHCN+GxpANixF
	1IXob2akzPYS9zQX090hdWb45AxBQfJ8SuHsymYCMG54VH3oRPB5R5EL279I2Z/HnAfDs3b8U1Z
	HU4aLQzEmkHsIuXhBm5qybUVua7E5IoliM4imtPixIlok4YTTwSZMfDSzR8dfjB2btowv2a7vFz
	+4Y0M6OGW2yDFibyoQ80A8MqEQ7Xj7pmlyYiiWsYlLLRe29oRM0RUlDGPysn1JdoNV/K9QZjq8y
	yss5KflP/AJfNKsrddZ7v5nD9OQaJoB2bXcoU0HZduJ8tC8cxsnWMd43kA
X-Received: by 2002:a05:6102:4bc2:b0:79d:c493:f1d3 with SMTP id
 ada2fe7eead31-7a026c4142dmr757332137.7.1789544205003; Wed, 16 Sep 2026
 00:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com>
 <20260915-submit-h616-emac1-v1-v2-1-322b32e40eb9@gmail.com> <14e61e7a-29ad-4cc6-8993-dea7a8d7c846@arm.com>
In-Reply-To: <14e61e7a-29ad-4cc6-8993-dea7a8d7c846@arm.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 16 Sep 2026 01:36:34 -0600
X-Gm-Features: AcwNN1WscQQGHuBz-gQadqFD8U_llvHSSS-ajPx5e079eC1kBH6r8x1MbCO5ieo
Message-ID: <CADvTj4qtuV_JEW5Byix86eQZJBsc_dmPR75ypVWn4xjem9rpAw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: allwinner: add H616 EMAC1
To: Andre Przywara <andre.przywara@arm.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_003646_582091_51AE199B 
X-CRM114-Status: GOOD (  23.13  )
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

On Wed, Sep 16, 2026 at 1:26=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi,
>
> On 9/16/26 05:07, James Hilliard wrote:
> > The H616 secondary EMAC uses a separate system-control clock register
> > and supports only RMII at 10/100 Mbps. Add its distinct compatible
> > without an older fallback, since using the primary EMAC clock register
> > would not work.
> >
> > Constrain the PHY interface mode to RMII, matching the hardware.
> >
> > Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>
> Where does this come from? If Richard is the author, then please reflect
> this in the patch (git commit --amend --author ...), so a From: line
> appears in the body of the email.
> If not, it's unclear why this line is here.

This was loosely based off of a patch he wrote I guess, although it has
diverged a good bit so maybe should just drop it, idk.

>
> The actual patch looks good to me:
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>
> Cheers,
> Andre
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml  | 13 ++++=
+++++++++
> >   Documentation/devicetree/bindings/net/snps,dwmac.yaml       |  2 ++
> >   2 files changed, 15 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t=
-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-ema=
c.yaml
> > index 323a669fa982..2cae0133b3cd 100644
> > --- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.y=
aml
> > +++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.y=
aml
> > @@ -21,6 +21,7 @@ select:
> >             - allwinner,sun8i-r40-gmac
> >             - allwinner,sun8i-v3s-emac
> >             - allwinner,sun50i-a64-emac
> > +          - allwinner,sun50i-h616-emac1
> >             - allwinner,sun55i-a523-gmac200
> >     required:
> >       - compatible
> > @@ -33,6 +34,7 @@ properties:
> >         - const: allwinner,sun8i-r40-gmac
> >         - const: allwinner,sun8i-v3s-emac
> >         - const: allwinner,sun50i-a64-emac
> > +      - const: allwinner,sun50i-h616-emac1
> >         - items:
> >             - enum:
> >                 - allwinner,sun20i-d1-emac
> > @@ -91,6 +93,17 @@ required:
> >
> >   allOf:
> >     - $ref: snps,dwmac.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: allwinner,sun50i-h616-emac1
> > +
> > +    then:
> > +      properties:
> > +        phy-mode:
> > +          const: rmii
> > +
> >     - if:
> >         properties:
> >           compatible:
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Do=
cumentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 2ed4564ae99d..b20149c3e850 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -57,6 +57,7 @@ properties:
> >           - allwinner,sun8i-r40-gmac
> >           - allwinner,sun8i-v3s-emac
> >           - allwinner,sun50i-a64-emac
> > +        - allwinner,sun50i-h616-emac1
> >           - amlogic,meson6-dwmac
> >           - amlogic,meson8b-dwmac
> >           - amlogic,meson8m2-dwmac
> > @@ -623,6 +624,7 @@ allOf:
> >                   - allwinner,sun8i-r40-gmac
> >                   - allwinner,sun8i-v3s-emac
> >                   - allwinner,sun50i-a64-emac
> > +                - allwinner,sun50i-h616-emac1
> >                   - loongson,ls2k-dwmac
> >                   - loongson,ls7a-dwmac
> >                   - ingenic,jz4775-mac
> >
>

