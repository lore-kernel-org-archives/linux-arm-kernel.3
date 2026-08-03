Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88CFC55822
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 18:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2r8t0fZLO1G1B7jNQrzEMX2EdERqWbCFEmueS3AzIlQ=; b=l1+qX+QVuSWSt78t7YIwBHAqYi
	ZDd8COJ/2fa3L1mVOQW8eNNuRG9ukLwqM6nrkCqJGX+iHKgXmfOq0mMOXeyZy/+Cz8HqQA789GSDZ
	3zYslh07D9DNUao7UEAN191+hDRvgJj0O1c5Uw6EZygTUYTGGKdQPw0KQ5W8Jti3kVAcH55jzhJWw
	Hk+STgG1PqPz3rLwyhbD4Vydi67GA0SerEq31qBFYjrwi6hZ6EohdaxOzT3tWN8U+8L64ITCnOKhs
	PDwU9I/LlQWlAtzEAJdiD+mQtkjTyU3eX3Oh9K3W6BwN2akdkmJ0omFEdVWv/1wohUch69ikO4t7h
	iNdwmviw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx0o-00000000Hiq-3GMg;
	Mon, 03 Aug 2026 18:03:42 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx0l-00000000Hhy-3scX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 18:03:41 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so2102973241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 11:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785780218; cv=none;
        d=google.com; s=arc-20260327;
        b=GS/3b0U4+odW/AXoyADvuCd5liGxIjAZl65NvqOMqdK0o/LT5osDw9re8bzdXDt7BC
         fKpRUpgJXzaSNBx68eluiCyVKGc2O3psCG2n385+TsZokTWe7YAOv+UyLoRSHhWd8B4Q
         CT4xCavrtBa08iJYBUTy62uy9RdSVAVmESeFCsvBiZkjp2ub+pNxCxM4UMUjFpROcsXA
         In6ovIvDTv2W925kzj/ZuiIPFm29trxmC0ysL+XtoudJoprahY8EqZco7Wcj+US1p2gn
         VS/fnNFQlKLIOQXC5460eIG3ZrsLS8cXhX9RtLKCk0w//KbF4Yhwhmoz70hODnQNL1V2
         iP9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2r8t0fZLO1G1B7jNQrzEMX2EdERqWbCFEmueS3AzIlQ=;
        fh=hofhA80ZeQkgPoPDWkofpZ30I/HKhHMhqB5uvuGEueI=;
        b=q3QnoZYj54I3ROo9FxiET8UHZbc+7yFbqH+2PkhIKilCCF/Jm2rdIIXZodTy3I4P8Y
         2CzL3bFXML1iKfnbzaBmOm7W0OOpZrobZCbDtWwNQsXdBO6dTnxoikABlGUPJWokXoJT
         dcdDrcpxagyo6Y42lTB2Ezy6OvVWr4+N5oE+YLYy8s1pv4JYZ+jwifcXsl2NsdMcRuZl
         w3v7h79aneZHVlsyaAeNpybaPwvT5oHUrt2wOnwvEoJ69q052vvxQu7wgh9BA2z+X3+V
         FA3lmW+9U1DCdGtRPTdNuzXIiNwehwbuJ2XoLr75vh5/NBmi8aLUTled2pTz8A+Un32+
         kdAg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785780218; x=1786385018; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2r8t0fZLO1G1B7jNQrzEMX2EdERqWbCFEmueS3AzIlQ=;
        b=tBhmeTo1nFe5xBEGA4em/LpQx5VClY49TIhD1pUq6+70d5k5A4Tdbm9LMbA2uM6b+R
         bBzgik8r385PslEthjncDMrpcVLDktYvZrfYCuz86Gwmiqsw6IdMATLnwJ98tC0frOji
         I24AW3DKu9uXhgB7Tlw0npYxUe1q9lCuVnGmBEOjBf3WQasi4mqW1q18pI0dsSUpOVdx
         D1HhbkN3TZVZN/ENe4IGO8w/fdm7OdQQEel5oSr3xh7xaZdWV+5IKIO4FtgLwOEmOQPZ
         B3o9Tt+ZxhuDMpnYpm1eWyRaniT1iMuj5BTiKHryFRicEFWD69k2yhdfa484Z99g6Ca2
         E6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780218; x=1786385018;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2r8t0fZLO1G1B7jNQrzEMX2EdERqWbCFEmueS3AzIlQ=;
        b=i7tLccvuTo03pvwuxWLpxPLdUScuGhMbT4ZcH04lRAzy1oBU+cozhrtIU9SSmmVi8t
         iKbt/I6Fip+NMKl2MfRxUj8vTbukUHDGjwXJL8GpmDbKBRJk45MsjF3G8FLVIwiW9VGz
         XASqNv6v4XDBSbOPueA/z03FChaEqzb23J+wtH0mBA7yWgVuC4UCD9CU1cLhwIZFEkfq
         D+nbqO2ywjsCnSVqiitywpKc3J4qqNNKp3ZnJBcP5BtYwT60Tk2VqF7jIPOob+8WnHlQ
         vzCnUvT3r1Vh8NakJzvj8Bsn9WO1ZElWIhUX1BaKrT8b6Go5RYcVvXoOsEbXVVRQBBdz
         N3Uw==
X-Forwarded-Encrypted: i=1; AHgh+RpMMIkOewXsoMRSaXaORVap+p5rp15pjRDKYMLncvLWP4SuFnWIXxOL9cnQmDhTDEnTK3A9T/cAYK5g/bB4Jm2K@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzsr3igORGvNPH0NqiFw3uIRL7dVP5w03z2QHLK3oZoO8k9db6
	4YF8lWixKCkSAyW/qAP1RGsgllXMG3ihi39ln1ywtrGvMd6S3AUIH7D4q3RY6aqGvHvOxIUd+EU
	MV2qA59DqicRpcVPqh2lLLWjJEboN4NM=
X-Gm-Gg: AR+sD13gDlAPm11iBIZAl3R4ZjQfzsbGXUX6k6UCO0RQPosCn9C7n1qiOVsZAxJoJNf
	nY5vlMnYDgO5imTQlbBcyMoE5e7yYMoAL3DPXdYNVG2Rwr8xHY6zEhbbkhGKMeDluZrV20RAFeo
	UYHZ5c3VAqTyCggT1Z4R0g145mLH6q4aA3+Jz6FF0hiyUNkG5wHXfDfxZI1xJ2F8iSqDoxpjVpw
	ZRSLILPJDJtlppWeBorc9zrMR1r8lZlik9z1jCSihTq6WC27DYTbWeTOnGIQRQMfCkvTjKYZfsp
	j2kFC/9oh6k9jexxmlfVlmHr8AS3KsdicT0s602ImdJj+RikXEf1lKcRWEEpL+WpLoqW3d08c0b
	csafxWnGbbrBoQkRMPqlPX0busOjQ8ABKBMOBOmS0wjIkA+BJJjuIscsFGhF9A7cNIES7ZzaUS4
	eO75Ya51K4yKG8BSKco/skR5iBwoC89XMAUY6PKJdt1YLxygry
X-Received: by 2002:a05:6102:6899:b0:726:8813:2085 with SMTP id
 ada2fe7eead31-75b23d6e2d3mr8230898137.13.1785780218392; Mon, 03 Aug 2026
 11:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-7-0a53cd9e21cc@gmail.com> <2979768f-4f83-4f28-ace3-826f4b4c6844@lunn.ch>
In-Reply-To: <2979768f-4f83-4f28-ace3-826f4b4c6844@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 12:03:27 -0600
X-Gm-Features: AUfX_mybO2gp37G6C7TCuAPmk0gNUYqtWf9KEEokxzjK6lix8AMcIQeuj4MOO0w
Message-ID: <CADvTj4prV688JDR-QAuNd+jTVFyE9aicRaciqq0M6sB0V2GiXQ@mail.gmail.com>
Subject: Re: [PATCH 07/21] dt-bindings: net: x-powers: add AC200 EPHY control
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_110339_978672_5958D519 
X-CRM114-Status: GOOD (  17.29  )
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

On Mon, Aug 3, 2026 at 7:40=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +  phy-mode:
> > +    enum:
> > +      - mii
> > +      - rmii
>
> Despite the phy- bit, phy-mode is a MAC property, it defines the MII
> the MAC uses. I would not expect to see this anywhere else.
>
> The PHY driver is told what MII to use, phydev->interface, which takes
> the values PHY_INTERFACE_MODE_RMII, PHY_INTERFACE_MODE_MII etc.
>
> Please explain why you need this here, why is the MAC nodes phy-mode
> property not sufficient.

I have reworked this for v2. The phy-mode properties will be removed from
both control bindings and their DT nodes, leaving the MAC node as the sole
source of the interface mode. The PHY driver instead passes
phydev->interface to the selected control provider.

There is one ordering complication: the control block must be powered befor=
e
the Clause 22 PHY identification registers become accessible, which happens
before a MAC has attached. Early discovery therefore uses the hardware's
reset-default MII mode.

For v2, I split the provider interface into separate power_on() and
set_interface() operations. Once the MAC has supplied phydev->interface, th=
e
PHY reset path calls set_interface(). If the provider is already powered,
this changes only the RMII_SEL bit; the normal phylib soft reset then
completes the handoff. It does not repeat the full control-block power and
reset sequence.

>
>     Andrew

