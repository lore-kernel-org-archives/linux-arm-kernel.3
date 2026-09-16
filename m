Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00C4C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 03:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOA+W2OAbrZJ/yGP7NnAmIaJwzKfjJWJXYt5I5goVnU=; b=sgOZZSuRpYGj1ddnyr+NlIRg89
	1G2TOO1ke+Hmboo3zKO050L5EKPztAbZKsCiQAq8pdyyElp89uwgPishxLVlLZ1/W+jrmLt/Q25oA
	seC/BCkpz7eoobPwTFCOZWFZyROv2OUonQ/aIhXgtme6nlKHxFTzEDPaI5gy88oZ+1UObnGtQrBVT
	OrE5kIfS+PP5tpBjtP+59xSfg9sxtfHwIvAtcYtLOdI5Uf1oL8mARxezRsykbaDwa4Ivcy7F8O9+N
	xjaASW4rRgHCGb/F4HWoI4lWu5hZ02VJBGb1u8PrSIHGvwQVHpjKK3F4ytVRirbZ3UjSzfe9V092/
	5gLcdfBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6g4d-00000008EJY-353R;
	Wed, 16 Sep 2026 03:12:39 +0000
Received: from mail-vs2-x0e.google.com ([2a00:1450:4864:3a::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6g4a-00000008EJC-3JDt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 03:12:37 +0000
Received: by mail-vs2-x0e.google.com with SMTP id 71dfb90a1353d-5c67e53002bso256335e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 20:12:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789528355; cv=none;
        d=google.com; s=arc-20260327;
        b=KFAGN9EQZVqH50WS+H+zHcVf3o8hF/L5GPPtd7E15b82LxA76oSoekxoNusNTRmFg4
         p7+QfpWitY0OoX0Xt+bVEIrSxU7IlhDD7M078vDHTWl5QMH3b3L/w0iqf5J8pKjXLL1K
         uvwGsPVLsc0uX6kOjZzhfybDmLzlyIml7GMnoiNPx5yPLGQZArtsTyUGbxMLv1HIKIxX
         XpiupyVcAuEUWC8Ea/2erw996a2+SRwCvTYc9K0Fr5LqPHyqUzQUFjp8UOlpOTbzLuaK
         oHTWCDHhC/hfrnty8JUYBwvEQyL/6+HxzvyJsad5ZDok9aV97vbfkfTmN7sXeHfQ4fD4
         5o8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rOA+W2OAbrZJ/yGP7NnAmIaJwzKfjJWJXYt5I5goVnU=;
        fh=dU2rxEI7MeOG2jXdR5uNMTc3ErLeta2YVFkJqS+38gg=;
        b=pNRLccrFJDjrZTJYggBVtcOVI8H2YA5N2l6RcOcQb4OkrVdErL2HoICMaFsiUvJjhn
         nH0TBWz6PY0hNL6mr98fxL3xsYdhMKkOvrvNrOi5oRb2Jc/VbOifWTzxOFngU0IjUABg
         SIk8Vzn/MmkaEB3tNtGBdR0MzD/vv9CCNJ+tvkAY1YxviEm+OdFUbNF7yWIIi/vXGngp
         4qbbhFrOTcWs49V2+KheDMm3xrF/H3J8FizIU3KOhWXJI6wDTUfG5fds5PBKSoPYRY7U
         Gdc3zTdGbrL+cwoeDA0xxATQoTT8bx3p/WTJKdC7O/w0wv+v19T/CsJouiP3kdnHbC9D
         dY1Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789528355; x=1790133155; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rOA+W2OAbrZJ/yGP7NnAmIaJwzKfjJWJXYt5I5goVnU=;
        b=oouThf9yW619H06qrCMcyCW7kbmtnq7jp0fLi49ikcmuHI0tnE4QiVQjkCaKjc7xf0
         WtjY5IZoMcYh0V+1/OtleYqHy1SM6ypqjgJitJqEd0iGHoe58JELCwpKB52/G65VfZFt
         87SQC83YGIEOS+Qvg7pkoEvU1R0yL4VlZ1aaEFmSipxBRuFmDDr8wA6Q9Bv+o+YcNqcl
         mFy+LjvEC6oQCnTM/FV3yV1HD2kJK/vUWxn/MKYZLFMPicHjgvSImNbob4dtdVw5SP0k
         nTE4c0aCkQguz/5cg5dRDWpIXp15XGxqVzGvJOF17UfVrca8SibNU4uZN2Tyj3/wY1fr
         Fcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789528355; x=1790133155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOA+W2OAbrZJ/yGP7NnAmIaJwzKfjJWJXYt5I5goVnU=;
        b=FkBqmtKE0EdI87V3wuXR7GaHKUvhE6dhDk+DqWRtGd2C7niUzuK0J5wlp8QEv0jH5I
         FU+8XJ67v0HRVtp4W6KQZvtZUD8b6OtzntFAjYl6LNmgxsvLeMtmW7LW+6ZlMaIkOrcZ
         rix+U/3KeiptAlIu73Nt2yCLawPPFnbuV45UQ5E48CXnCyhBbW0ayTx1vIDsaMPOMrKO
         WB7QcY0obS1kvAteQnmz7A9OgvObWss3gKaItB1jOkeRH2NGZEL2/aaNV2sSsQ+R4zHM
         p/1J+OOG6J9Ntng4ckGjV3X090rkLbTyN/Z/R59V2XSblaYGwG7IVkzZ+CM9oe5fnN+6
         JQbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvfagzA+4TS2fVwz8N3B0gQPBAO/DPwDmfgBpzaBEPhPtIGRidvf+DMt16aZdnw1+QuiWgo+3EaYvqFB2d0Hmt@lists.infradead.org
X-Gm-Message-State: AFuF++kpE1tNXQ6zLWMoSykUEA+tgbWtGvaVDgLEtabvLR1HIjTIpL8J
	gDSJ0stXOZC1UlfaOpOq1LIBLPJV0ti/xNthX34sBgtUT3osZYCyCn8mcHOaJeAHcRYaR8yEENQ
	HfXtwg6qavxTWVdi/bnuXRtnKAkPrYFM=
X-Gm-Gg: AYBFou3XY1J41cZvlUQweFe1vpeulJp/nD5Bv7nX0/WS7BbziynkLVTLtXvLJwO/dLK
	IFH6VqYvxDuRhjx1jcbue3ZCWwRBjcXurs1Pk5T6dixFg0vDjLf3cGngQbrDARLcdBhHPe20SLt
	BBuyjsW7bVhJw4zdbNGlevD6znBuigZ7MEow/saeOG5++Mz8/jUdaWA3HzOhpwJnxCuzeheosyn
	nbrh9F7fuz16vysYmJQnASt7CNL+K+U8OqmD+r8GcRBjBhADMRS3YprkmGj6Psf9PcEYw6glpaF
	mlIHFPUYkS81RJxZQHfQGHhMkhSu6/RmRPk/q8Zt6zj7lOne/6pCKlt3dJ/eHYrBmL6mfMqQLYS
	bmFV0vWg0nxLzmOaHA8X9u6DaTvnC8vKXYUxpCR9X2cRDElvZaJljECgq9HUtnIPZ++tRW+h+pl
	z95chhAiCrYJK/5xZfjV7QJWpUs74fx/isOSWji5kAs4dk
X-Received: by 2002:a05:6122:8b11:b0:5c6:64ac:d6f3 with SMTP id
 71dfb90a1353d-5c99accf34amr894249e0c.3.1789528355167; Tue, 15 Sep 2026
 20:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
 <20260915-submit-h616-emac1-v1-v1-1-195de0bb1f8a@gmail.com> <5df35a3e-d2c6-4576-868f-d3194de3deb0@bootlin.com>
In-Reply-To: <5df35a3e-d2c6-4576-868f-d3194de3deb0@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2026 21:12:22 -0600
X-Gm-Features: AcwNN1VnOu-2I6GbVq8WQF9CNqEg1e8Y093roZVmrwYp1oBZ-wfj7f7of1XAwLo
Message-ID: <CADvTj4p6RRcr7jb5hJCveeniHC81gkzHxLrPA0T53+VVUrKAZA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: allwinner: add H616 EMAC1
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_201236_836679_DD7F17CD 
X-CRM114-Status: GOOD (  19.99  )
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

On Tue, Sep 15, 2026 at 2:33=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi James,
>
> On 9/15/26 21:03, James Hilliard wrote:
> > The H616 secondary EMAC uses a separate system-control clock register
> > and supports only RMII at 10/100 Mbps. Add its distinct compatible
> > without an older fallback, since using the primary EMAC clock register
> > would not work.
> >
> > Constrain the PHY interface mode to RMII, matching the hardware. The
> > EMAC1 clock register also retains the three-bit TX and five-bit RX dela=
y
> > chains, so allow the existing Allwinner delay properties for this
> > compatible.
>
> I don't think there's such a thing as RMII delays. RMII has a single
> clock, contrary to RGMII that has a TX and a RX clock with a 2ns delay
> between clock and data.
>
> I think it's just a leftover in this IP from the other variants that
> can do RGMII ? You should just be able to drop the comment changes here,
> and same goes for the dwmac patch.

Yeah, looks like most but not all vendor driver variants had RMII delays
configured here, I did test and it doesn't seem to be needed so I went
ahead and dropped the delays in my v2. So yeah, seems to have been
just a leftover config.

>
> Maxime
>

