Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336B9C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1DBiA0IyE2Ft5pvUMescJhhLqoAG9H5I9OM90H7dNs=; b=JJHWwwke1KFfnJx52Dd3uGTcJJ
	iv8rLLAJui28q+ZZmno9a6WY1pWavvtQtz7moV0MnJmo5dnaEdQFhI8OT3uMEg1a6PzICy7zCAFrD
	ciK/j6LirswPfRbbK5Zhlft/qOaPo6q08zelZwiWzPDA8Si1oc6lHWj/8E9WQ8F9XNe3NcJZppRqN
	RV6+nP7RIo7GdcQfG6tYZPjks3dEkqHzc1R0n9zbH3c7RlASSiNTgIBmwzZAR1TtYjmJijbBOhqTw
	oExKlmhgN45r16Y4kWydpS/IinYxA1H2O3tYU/pdIF37wUJMCzI+wdtK150EnMceIKhcaw+r57MRt
	LcOwCo7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fec-00000002Ylr-1U7h;
	Mon, 21 Sep 2026 15:10:02 +0000
Received: from mail-vs2-x0c.google.com ([2a00:1450:4864:3a::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8feY-00000002Yjo-2g8i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:10:00 +0000
Received: by mail-vs2-x0c.google.com with SMTP id ada2fe7eead31-7a805351f5eso768268137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 08:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790003397; cv=none;
        d=google.com; s=arc-20260327;
        b=Bo1oSXjRro+o4HusDrR/aBOp9+CQH1In0vGO3W2ViNOIqj5dTmfSFM4LzRcGXOapC9
         iLa6kk7K1BXRU4DXoIoW5oLgrzWB0F3YvUXoutBjrzeSuYJ85Fp1xqu3qd8US2h+HUHa
         DeUjaVLn8HXlscZ3iV4n8PWCahihLCr5NbCmqH0hnyTUT/d7FVW4ekAU+7czSu4VPwYu
         I0TdTf9K13ESMcUAQagK3NKJEPgDS7RAW6P11T/Zh83bvA2nEYcV4c9j+uRz/3RGtLo1
         QDMm3sCGVb3W4dZbXMehA3tiiEHWIR+LDupPKxSwrmZsKApRB19VOJrNmWOFKCu7zvlM
         I9hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g1DBiA0IyE2Ft5pvUMescJhhLqoAG9H5I9OM90H7dNs=;
        fh=7JEmoO0nmtyA9ICZ3yp5uRdVQU2fQHkuugDS7CVODP0=;
        b=CmjBmOfCqEZk+yz1XTEcNXC5vE2wUrc8z1KlQt/VuWgUmp4E1fICBiWe1rX2TUsylE
         BVy0vLao+UHY4ojka2SKReuKAQs7MD5tdQ9Tz19Pob3Ugg4HiGZ931InapQuiSuYtNT7
         914zrW2Yo3/QBZdBx1vTqjHz0KIp70Pds/pSizy4rOWjOfy+cNrIzhXip0HoXdtVsEQd
         hm4BZ64kyATSpt+xwk1q2wpKiO7ACxkV7+HSS4XWRkH+f9Qq/LXiE6fSUnCxTfKaO5qS
         NF/MYUwwDOqIBR0P0ehmPrcLQLGzG1MFE+1mqGKiFwBGehkggmgXHq6l0fje5TXqSJzq
         QntQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003397; x=1790608197; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g1DBiA0IyE2Ft5pvUMescJhhLqoAG9H5I9OM90H7dNs=;
        b=poT8mCzep6OvWj4jsiVYLbVcKe7B+fGBWA7egntiSFKhE7dP9r62EUALa14phCx0FL
         xQIj85UpY5xLoS0xFKXfFUGkfC8wDkNxlRgF6GV9QUO5t9eCC1FYbVFNHGuNoVKKurfj
         eOtGy/P/qjMYNQjJd4Uqmr0kI1oQ/BLP1eQsz0JAj6oIWcup6uHOZs9oCGUH00p/TncY
         KygXP5jGR7xhrhmfhBXGao4aX0TpVUaBhPBYCL0nrrDya5xxDMuAUBf4+I12e/hBFfc4
         /BgRcSar/mOT3loVdJSEAdgl+io6YOsVKOytMnMv4j+S6a5R+iqrJX5ExcKqnjC9dSem
         r9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003397; x=1790608197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1DBiA0IyE2Ft5pvUMescJhhLqoAG9H5I9OM90H7dNs=;
        b=PnWoHp22tT18GL/Afrl1r+bINzHBEw/Hh4u0PPi84cYyReiFxGOiTomPkovzfdp5Gt
         EwliJp8yt2Sh83lUY8cCiAyaxKwi3PJWUvuPHm3fILLVlzc5Pnvf9fGkGuHvTYFSipnC
         4XNuYWjY8wrMlty8+GiXxrdvzRtlqlVN8HfxkHSBohpqlX0A66qNiNmiE9VRWh+Lx47P
         TcLX0tIZrsEbVIu4RVVAc+V4hmK8svAnW/kVp8NpXyc7Zw3UxW3W04AiIH9ZW2E0XE2x
         CS5sn7HMHrhpIroRnyKgZL7ZsSQ+vF2k4s+qYyKNVHaVQ6ehrS5wj792FUzQ2zoEEQGW
         0o/A==
X-Forwarded-Encrypted: i=1; AKwUvBxsBX/Y/IUeGRQ+g1/z04MPTGqI7C6/wY9os5rZWcGYedmO3ES3KhFQug4tYrI52dLGeJq1UaxHPJkd1XeXWFCO@lists.infradead.org
X-Gm-Message-State: AFuF++mH7bf/dkAZv728oS3/q6WE+JG+BSTSWnQwZWAQHxFIVvRvvcfZ
	Hh3i25YpXXNXwSefLa9gsiNNaGCssPky9CltnSKP6Jgq+vN1sN4V0d2eEpykyN0HX+qs1q2s7cX
	5+LRlOR+DqEsZ6/lNLzUk1IbwMeR3UEI=
X-Gm-Gg: AYBFou1AWDI8yW/Dq9tp9x6rNCBQeiBsmh0rlYsMVRCztX+dPeUyGJeAHesyGFkM8oA
	9CSM7HD9IzadOgO/CZS2vd/YhSU9mwiyljcnyjcBONrSlP0Hq+tni4nT1lIKkePXpc75q9IBu07
	yV2RgnWpBIfiC8YYgtpfmfkbuQMjBWxfJjzbc17sr18rPWSMxhG2wpIAxqUCbd3OpWWTZnElLFZ
	vnL9k/YHaIVB+ZDguvhWRd8zElYdHmKGYE3NJ0OzHHGIigVxKj482/umD/iRe1g35rtNM01ryX6
	N99AiDCzDAaZYYwpkz01l3wKGKtv0+MR+s72CfDlGemVev6r5Zdo32+hehiRfJXwK/djxqFjoLF
	NDZ68HObIPsjsJ/vkZ80La14mzNRCj9YF5PEyW61LC5rLzE5KNHBwr6g9x8EhYPJZNDletFL2OP
	m8RFNUdtwDkc6aQNjpVxfO+R9nP8I2X2eMciOuG0Ss/iRA7lkCXwOtmlg=
X-Received: by 2002:a05:6102:148c:b0:7a7:198a:c2b5 with SMTP id
 ada2fe7eead31-7a7198ad369mr3357929137.29.1790003396967; Mon, 21 Sep 2026
 08:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com> <475799c2-7eaf-45ed-a6cb-80c2c2c556e7@bootlin.com>
In-Reply-To: <475799c2-7eaf-45ed-a6cb-80c2c2c556e7@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 09:09:45 -0600
X-Gm-Features: AcwNN1VLNx3dtquO69cswaFe7FbqPEaN3LW5P0JUb4jisnZv9ewZXpukHo1wT2U
Message-ID: <CADvTj4qdVGDXGyXHmCGpb+ztvXs2kS3_joaCZkM0dq_sYvHscw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/6] net: stmmac: add Allwinner H616 EMAC1 support
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Christian Marangi <ansuelsmth@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, "Alastair D'Silva" <alastair@d-silva.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_080958_690334_4311FDCA 
X-CRM114-Status: GOOD (  22.85  )
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

On Mon, Sep 21, 2026 at 5:54=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi James,
>
> On 9/20/26 21:45, James Hilliard wrote:
> > The H616 secondary EMAC supports RMII at 10/100 Mbps and uses a separat=
e
> > system-control clock register at offset 0x34. Add its binding and a
> > sun8i stmmac variant using that register. A distinct compatible without
> > an older fallback prevents the driver from using EMAC0's clock register=
.
> >
> > EMAC1 connects internally to the co-packaged AC200 or AC300 EPHY and ha=
s
> > no external PHY pins. Leave PHY initialization to the PHY driver instea=
d
> > of using the H3 internal-PHY controls. The RMII-only variant does not
> > expose the RGMII clock-delay properties.
> >
> > First fix failed MTU-change reopening and hardware-resume cleanup in th=
e
> > stmmac core so the interface is closed without repeating NAPI shutdown
> > or resource teardown. Allow phylink to stop a suspended instance withou=
t
> > restarting its link. Then move the MAC software reset from probe to the
> > DMA reset callback, after PHY initialization. This lets the MAC and its
> > MDIO bus remain registered when the PHY driver or one of its suppliers
> > is not ready yet. Clear DMA and interrupt state even if the reset times
> > out. Keep the separate H3 MDIO-mux reset sequence unchanged.
> >
> > The AC200/AC300 EPHY driver and package bindings are already in
> > net-next. This series separates the H616 EMAC1 MAC driver and binding
> > support from the earlier combined series. PWM, MFD and device-tree
> > enablement are being handled separately.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes in v4:
> > - Add a prerequisite stmmac core fix closing the interface after a fail=
ed
> >   MTU-change reopen without repeating DMA, IRQ or NAPI teardown.
> > - Close the interface after failed hardware resume, and let phylink
> >   finish shutdown directly from its suspended state.
>
> [...]
> > ---
> > James Hilliard (6):
> >       net: phylink: allow stopping a suspended instance
> >       net: stmmac: close the interface after a failed MTU reopen
> >       net: stmmac: close the interface after failed hardware resume
>
> These new patches belong to net, don't mix the fixes and the glue code :)
>
> The glue can land without these, no ?

Should be able to.

>
> Maxime
>

