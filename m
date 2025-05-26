Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BC7C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 21:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87fhuAp8NmqR1otDh/HGxIh14e89XZX4r9lz9YqYugM=; b=G/QtXawUMzbJygTxOPUhQZn32U
	oxM1dCdNHSXKI73A0jsYT8IDYURYqmEggAWbv9Eu5FJT98f+T3K23whUbHwCm6yJWThfehspoTCT7
	Z3mMKBXG//oWwIFA4N1Nr99+sQ0cTHu8c9Gu8OLYapYa8orCcSzZ4S+/zFlAYpOxDV74kueZLxcG4
	2qnX0cYiOfGHi3LTHfAbNsM2Pt8/WlWNqgIJrLZzubvGBy/+j0osPv3rCUUjQe54AuV+asiOGu2LF
	ZjmZsh/yn09AuAxSlD+IShBrmXOtziTLl7M+JP9BKODb4Hu/qddgCljDCGupgOKL7/l/e8He6l/Z8
	cyI3h/9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJf6O-00000009WNk-319o;
	Mon, 26 May 2025 21:11:20 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJf4F-00000009Vzf-3LEf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 21:09:08 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-87ded11e539so765386241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 14:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748293746; x=1748898546; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87fhuAp8NmqR1otDh/HGxIh14e89XZX4r9lz9YqYugM=;
        b=OeRLJP8mZHagOaJlDamgc4Y8b3c3guaON448GTqh4DkfDg9QF4TVmtCDITkBQ/hoHm
         ba5UP5lLFBs2gbljtG4bx7Of6wDamrJrowWCxh3XJxxU+CLUpUgjmVKoLRVjb/A/r53l
         +peTWszjdsk3U8QlVUguICRDt42emxZIY0mm1lJ9qLqXML/k/rHX9UbjvYQT80FcB0mF
         gYqgy/6gqhNNfll3FvTXOr1B0MTYSkWwCIcc4ozXN1jc86fNXCyvy/eTh/6DZD+PjQ4f
         l1R1Y0SE8PlVrmXWJq9ykzGkGI/oMePhzrZvvX2ozp26VlLZfkOU7XMlFPHVX0HuAOUS
         /sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748293746; x=1748898546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87fhuAp8NmqR1otDh/HGxIh14e89XZX4r9lz9YqYugM=;
        b=UQuLD2QH9tfj+bwdx+SZMEYYwH2qVQZAunGvE0VgCtyl3mLboRrrZkXHzNxRYQz1W0
         7D2YPBaHtFe8UoAY8NwzjNhfwl9jjdSJ4737FAKYwZqwcPlghLaXH3uBFOY73LW3j264
         D1ba6gIXACYV4V4I269lgBUZLkeSz8JuqH3oLU+8AePu7tgoE4h+CI/7ID8HHOLVG3KC
         D6zOB2lAeX1OtGDzdo87ksCObonb2dDuDYOB3EJp1gg++Bdg3JB0wfeDYyRWxEcNjZag
         QIDyW1xq8MskVRXrMK9lm6+jxlObKWHyPDggByJxHfhGF8GqfEz12PFMfWLl21gVLl7Y
         Pjjg==
X-Forwarded-Encrypted: i=1; AJvYcCVQov1SatOaxt5QO1+LOcOCANUg/AXRSQo3a3vrYDhlPxs7pIL3K+YGomVEpM58uJtr3fb79SEt2PbhAjsZjx8d@lists.infradead.org
X-Gm-Message-State: AOJu0YzzIYEBmxl0Vbly+avFL9RaLNYHQhSumJeICG88wsqVrlsM1V4a
	dN7nbNXSjsVEVE27MMeuZSUV4dnkmhi4/cRsR6adhtqCo+5rfVpETfJr5ZnPr+bVRzYM7ub4APC
	AtFL9G/Cu6cpOFPWPmYGldKslwiTsnVs=
X-Gm-Gg: ASbGncsZgztSyqU+nxKe94iIuN/xUDodFJU7XkMBw0OSTt+2d5t4HI05XRs5mrGAnfo
	n4UV05+d4+2rYegY6EAtXE+03v1fPLj57CztK9VFXnOXYVp9ytu9ZMPfIEeAUfakrStj6/wk454
	kg0X+xnvy9K1mLFMoyYzahv26yKJmry6jwrw==
X-Google-Smtp-Source: AGHT+IHJS491hwCg7QPzHL8sgVSadrrDFwt5Fkv2jVRTS71w6+V06+FNAv/Rmt5Zw/NYt58vCJJpAIGoZZeec3aMqrg=
X-Received: by 2002:a05:6102:6e85:b0:4e4:5e11:6832 with SMTP id
 ada2fe7eead31-4e45e116d29mr2273063137.7.1748293746485; Mon, 26 May 2025
 14:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
 <20250526182939.2593553-2-james.hilliard1@gmail.com> <a2ac65eb-e240-48f1-b787-c57b5f3ce135@lunn.ch>
In-Reply-To: <a2ac65eb-e240-48f1-b787-c57b5f3ce135@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 May 2025 15:08:54 -0600
X-Gm-Features: AX0GCFvBOmoEuniobTH4Q2bGCB-bMqy5gqMhcJ9AabATXY_w6ImnhtwMSjGOdz0
Message-ID: <CADvTj4rO-thqYE3VZPE0B0fTTR_v=gJDAxBA3=fo501OL+qvNg@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] net: stmmac: dwmac-sun8i: Allow runtime
 AC200/AC300 phy selection
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Feiyang Chen <chenfeiyang@loongson.cn>, Yanteng Si <si.yanteng@linux.dev>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_140907_834691_AAC59AD7 
X-CRM114-Status: GOOD (  14.51  )
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

On Mon, May 26, 2025 at 1:56=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, May 26, 2025 at 12:29:35PM -0600, James Hilliard wrote:
> > The Allwinner H616 ships with two different on-die phy variants, in
> > order to determine the phy being used we need to read an efuse and
> > then select the appropriate PHY based on the AC300 bit.
> >
> > By defining an emac node without a phy-handle we can override the
> > default PHY selection logic in stmmac by passing a specific phy_node
> > selected based on the ac200 and ac300 names in a phys list.
>
> The normal way to do this is phy_find_first().

Sure, but there are problems with that approach here.

The initialization sequences are rather different and the devices
won't be visible on the mdio bus until after they are initialized.

The resets will be specific to either the AC200 or AC300 so we
need to choose the correct PHY based on the efuse value rather
than a mdio bus scan to avoid a circular dependency essentially.

AC200: i2c based reset/init sequence
AC300: mdio based reset/init sequence

>
>     Andrew
>

