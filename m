Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6168C88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NevuUkbIbY8Xir1EiuknrCzVePMTrnsw9qsLi8W12R0=; b=GNg7Ey1kqylS/egdOImw7sl/l0
	j0eIKz4PzsoZrmo+0pCm8Sjvxxedyi8FoLnSBLI8qNL69CfRPviVHeCvOUDcg+32lie6hWuUWuBaO
	5EvSv3NgvfeRu22sN2fEwvJG8s2s6qb67ToBAX6TysD5JOndyBklv8NfaivERWfRoezgABFao7l5Q
	0r6UNF3fofDa2+6+/LgSvwsURdd8LRpkZyxwEPn7sP9MOwyvoJsLJV34iXYdQWk9yACmOuiMo0Glr
	ykyM6VJYjlsalbGHHnRuJDlrx7qnVQviPZLPXDNY/t/czOhLreP7iRVuhdPK9usD0h3n+cShGH0yb
	f61+py/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6E1b-00000004hru-2Rs6;
	Mon, 14 Sep 2026 21:15:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6E1Y-00000004hrE-11DS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:15:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B4E6E43F51
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 21:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB281F0089D
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 21:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789420535;
	bh=NevuUkbIbY8Xir1EiuknrCzVePMTrnsw9qsLi8W12R0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nZ3svjAWFX3+xqUFjVpIL9dgPp8tQFeM5gg5QoY7Pu7qXBjj4Xt4sf+78cNwfD5Y3
	 gVAngk7ti3CFZ92sivt3gMZFqY2SYum3QAw2RronjZ8MTENStKYof7+tNtUAFp9zFW
	 51SM5bXydhxNXEQOy87BV8o3tqVL75/Y3pFuku/MJl/IR/oUUNdWZj+fQO5d1OmSxS
	 2+N/aeuRXGkaHbyOqCleTd55yqKAnO3VXOEgHsmKKhvoY/bhz23CuGFHm1Wtw706L3
	 w7ZPkrmlkJd8Yy8r6N0rWzr0l3nJdogRCztyFnYBBmfphr7Q+79HaU2FyG9C0BDZHz
	 xb2iaQxsriXZg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b899413537so4168324e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:15:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw7N4wK1QEIhKZ8ioeGr9MM8I0+J1AWNoRMiIOMKFt+zZuvgwwJWTWAjHWYKz2YMCE5hysuqs8kYK6HaZohPunP@lists.infradead.org
X-Gm-Message-State: AFuF++kubgnA01VSuM7WovseHyOmz8ySyZHusgtr6fupnIZ9KDAq0smR
	IzsfA099ocvIxe9Uq+I8Rty2F77UGlNman7lvJCxedrbonQkCNej4nwtoJa8RlrrDnUx5KRxMid
	T0DiBXdSrpqvsAElggL5HIRiboRc9ok0=
X-Received: by 2002:a05:6512:3f0e:b0:5b6:183b:d214 with SMTP id
 2adb3069b0e04-5b8ae6a6fbbmr1185441e87.59.1789420534106; Mon, 14 Sep 2026
 14:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260914155645.112508-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260914155645.112508-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 23:15:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLmu2vovxXa9jqX+pq32KV6ONQ-=Yoo3fKF-49oMFVv3GA@mail.gmail.com>
X-Gm-Features: AcwNN1W41lYuox0pw4JKzbuFr7Ojh_AWjTCNy5TnXF9BlZMG2RX-71m9k3IWIl8
Message-ID: <CAD++jLmu2vovxXa9jqX+pq32KV6ONQ-=Yoo3fKF-49oMFVv3GA@mail.gmail.com>
Subject: Re: [PATCH v2 net-next] dt-bindings: net: Use consistent indentation
 in the example
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Justin Chen <justin.chen@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Ulli Kroll <ulli.kroll@googlemail.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Alex Elder <elder@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, ath10k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Sep 14, 2026 at 5:57=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
>
> In cortina,gemini-ethernet.yaml also drop the wrongly indented mdio bus,
> because it is not necessary for the example.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

