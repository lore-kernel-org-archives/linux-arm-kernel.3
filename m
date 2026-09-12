Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34DFC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 20:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fXb2RdQOVdFeimkTuBnAC0nV21XWeOYpcj6vU3s52nc=; b=q4EqNZd9BI1e5JyAKA1SX7KDQM
	hfOFWFBd3ySNDU1L+v+TbQWK3Sm3bg9NLYRlFakNJZReWmreF83bBVm+nTYP5bgMTTvyJv7fyG0yN
	SoV4cFdCfbV9yRpl+6Uti5Vh6p3JZ/VgYIOiq9XuJ6ea74FWi38GHEdGn60z38TEGWiFNltrjBklM
	W7fC1LSUgjHgBJuNjLFUBDt/vuu6jccPayXtw2qc4th4Tn5Kn2JXfp0DgH82B6/wmPYITOEDEAvtj
	bkGSWurn18gUN9WWx63WySJLWXyYuIc0VhUGAB0pM4TSpyJPGTmJXnEksH6PKJLPG8JobQS04QaGj
	u/urD5hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5UPa-00000001ANh-3zkN;
	Sat, 12 Sep 2026 20:33:22 +0000
Received: from mail-ej2-x05.google.com ([2a00:1450:4864:34::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5UPX-00000001AMI-3XUh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 20:33:22 +0000
Received: by mail-ej2-x05.google.com with SMTP id a640c23a62f3a-c299e97dc0aso8508866b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 13:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789245197; cv=none;
        d=google.com; s=arc-20260327;
        b=Q1rI169I7mBncW2ADTzICUFrFS8VcZe+WVTyM6+f9Xcpx9S5KNsXXk08ED59Vr+mvE
         Eixb1Cm2oh8fN2wxTSWCddJo7+pSBcVKmNrP2Gada2uuPcLCY66Z63xkkEmEIAbyEz2I
         r3Y9Gox/PqzxU2BlzjpRDwUEEkfFIeVJ90ARtqx7B9OK/qF90ZvJ7eltaUfBY2YbOyhY
         36WkQCMnuDrsS1ah3MGhQerOeANn9PzpshEFAl2EPHTchrNjTVaqD7J2Xn8lG3ouPoMB
         tv8O9pemXQ2oFyixQrGzLpWLBZIXqAYPAb3jxx+8LdBxIZztk5KUZLytjugBlsp7J7Q6
         eULA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fXb2RdQOVdFeimkTuBnAC0nV21XWeOYpcj6vU3s52nc=;
        fh=pVmt3O55aVUSs2EDbvuyxtrbwbtcKtsX6hjPzFN92kw=;
        b=d97kQMaxMCxM9+JGEYVjyOpRGFHf7bEdCzlrAidPuZHe4vtwcJ2NATui6BJSZPXVLm
         U7j816CiUpZa8ApaWOfERRNlTAlybte1rhvha+ZTkewpEWiTxdX/FqvXUA96FdOwZnF/
         ivtxDcu0KwY+HwWI5gLgYWwDM2nuZuqHioxETvqve40ens9Gd/TmmWLqw5L+6sm5yugy
         yDKGuJwDBQVtCmMgy/oNE7THJB1Dh+LWogvnJ1CvUC2pXVJlNecELoArOiOAL/j88Eab
         x6NrKA8fAXavgZbGvmUUy1xfPVU0LeB5FhC2nS4hWqKhgYQ057GZjS0rDJ5Dh9IiYQbG
         8ycg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789245197; x=1789849997; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fXb2RdQOVdFeimkTuBnAC0nV21XWeOYpcj6vU3s52nc=;
        b=nVUaoogTaAonFjYzZ0a/JkPVspUIVh1KfzZ6J0V23nQ+RRvDV3Tl/1AiP5MPBMCVf9
         f9TIRJDZ+WdXuxYrUzzYISMyYf1Mn/H5RcbethvaEEjeEvGZk2OeCH2xBQiOzbnwBQTm
         c6CWaE6lgBVQzXQJ9okBiXVhp+Pb1Zmhkpy+zwmdQ/3E3TgdbdjGTTVdsjw9L9YxA9/B
         MElV4+RcQaa5MYCUKM8dZEgZTN0VowW72oP+eCamnf8otcCjH+HfOA4eqesU3KGBZDrS
         nT4Tq9bEJYa/mgYFvGYKkXGi6GpztbWxNimnXt6jwHjRntKuTJqhajIF42vtkkdbX+b3
         /7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789245197; x=1789849997;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fXb2RdQOVdFeimkTuBnAC0nV21XWeOYpcj6vU3s52nc=;
        b=J0LI0eZ0CEaDq6jY9XeBG9Dj6ygg/JEFZPnQklOao/BMl+90uGPfrmb0vUCi6hkLbY
         i2302mj0kuLJHgLEqy+MlBCYq10sZP/Lu5Dqc+PZTfAC1JijK+PsRsXorxDU8+DaUccx
         kx40QKy/u10NPARgGul7ks3ieiXUzdupwRJO/CPWZIwO51jm/CP3LhtvZ31Iq4ryxI9W
         +q8SNKi4gjx+23PyELoZ/NPAN54lc8ofGOEZOW0XxxnZ7JeFEBIQWckgCzzgX6HiU0mi
         sypqK62aZE6r0Xh0ku/QL7YKyBXhVExLyrq6n/JMKD4HQKmC7St0p6Pe680YQXGxP6+u
         JNAw==
X-Forwarded-Encrypted: i=1; AKwUvBxjBcFNNrDlTXVnXgEBopGzFF+3cSaTT5dywtzhCafznVkcQdIWou3YJ+q3ONopZe8cFZSq+SARSJehLOQWR/z0@lists.infradead.org
X-Gm-Message-State: AFuF++n9wV19injY/blTTBKqbODKyGk7qHTGuWy8E2cKsm7j8LGziwJZ
	YcIcSKQUmJDXKPNoxU4I4SIMgEOag4l1vwn4zImG9fY2oKYLKMfxDUgICaiwN6rpC6TUnhZuVin
	czJFqVmTowortqW5uhMKbnIWY9IHrvwg=
X-Gm-Gg: AYBFou3+4SAniyXi9EhxRvehsciB3fHts8X9MZE6Z71ZY4DM2BQp6i8hiQGUnC5E0XO
	s/oa9JtsOKAK7InVD35Us8r17t3KhF4fxfsrNJ9Opp4fqUvhg359y+OAjMlFmlk1dnqw1EH529x
	kuAuGO/JNSolvfzl6khZPC/fOG7EBW1ori4WSZW1M9GH1vQ+Wf0oVTN25il8YRl/+easPG3Tmc6
	yme7+LyjrUlVDGGDWDYB7sGt1Sc5TtgL+YX1V0NgJZ1JyttORhp9Jmm9u4QY4KBJBO+t8Lo0ISO
	LzObKynhuGWWW7+XbqVwHpRCV8SpBHNuvbhf2G+JBzNKzMsocI9vN87Qew==
X-Received: by 2002:a17:907:d02:b0:c25:2a78:15ed with SMTP id
 a640c23a62f3a-c296659c61fmr976523566b.6.1789245197295; Sat, 12 Sep 2026
 13:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260907153713.2572547-2-coiaprant@gmail.com> <20260912131421.2960a12d@kernel.org>
In-Reply-To: <20260912131421.2960a12d@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 13 Sep 2026 04:33:05 +0800
X-Gm-Features: AcwNN1Wp1szdgOCnvhL-ujyIZJIERlGVxaN0L7OfiFu9TcpEfz4jyCgcrEH55iM
Message-ID: <CALj3r0itTv0+8R+mTg3wtMD95=4V3Znwsk48oxaSjrVMLoJfJA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 00/10] net: pcs: add basic support for RK3568 XPCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_133319_898711_E8C10E6B 
X-CRM114-Status: GOOD (  12.35  )
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

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8813=E6=97=
=A5=E5=91=A8=E6=97=A5 04:14=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon,  7 Sep 2026 23:37:03 +0800 Coia Prant wrote:
> > This series adds proper SGMII support for the Rockchip RK3568 SoC
> > using the integrated Synopsys DesignWare XPCS, along with necessary
> > fixes and refactoring in the stmmac core and XPCS driver.
>
> Sending the AI review FYI, please look thru it and judge if any of the
> comments are worth respinning for. We're waiting for a review on the
> device tree bindings, anyway.

I apologize; I have been so busy this week that I=E2=80=99ve repeatedly
overlooked my plan to reply to sashiko-bot's comment. I will get back
to you as soon as possible.

Best,
Coia

