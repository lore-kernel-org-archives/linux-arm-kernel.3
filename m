Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFF2C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 03:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpANIRIXCFEaCO+NoYgeEquheHUazRAsrSjmXdnDLkw=; b=EvRDU1ii6LjcfTP/uAaXmhJWk8
	p+QhL3W/saUQ566wgp6+AfWAREvHmnzXPtGrDnnvb18TFuoxdSAy2ShkcC8R4euxFrr2iwCGMpCQN
	OS74NfwcMGIIf91h7/5fIa4A1XPMd8Nzl84mntnTYvaq927mS7IjYWGNRaWQa8+BzS9z6lfebAQ5W
	Z/P5vajhaUjS+Kzkhxjx+mmZ5jaq4T41G6GMeELqcgCugFkvt87pjucOV2zCBc5VLGG+pphd/cH4N
	kEdzoNimusK5tDPjFHkAn4DEbbeVsHjPTxGgRDgpAwMMoBBC2yNPaoXfiO6zTwKve8eZzF1acUKRD
	hW6GUyDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqMsG-0000000FJCz-1Sh7;
	Sun, 02 Aug 2026 03:28:28 +0000
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqMsD-0000000FJAS-3uX5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 03:28:27 +0000
Received: by mail-pj2-x02.google.com with SMTP id d9443c01a7336-2cb3f5bb19aso6575375ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 20:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785641305; x=1786246105; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TpANIRIXCFEaCO+NoYgeEquheHUazRAsrSjmXdnDLkw=;
        b=H5mpKUwexT3Hx8L4CBH6b1rTFkoaJt1/ARPEcQ3lcjQvxWTz7CLC7qtPs2vtuunSJ6
         LU2YttO9t8lQFHHealSWgrR4Lks2Eo1m5gNU62goFIqiPJ4C/Y97n7rdpJbM2fcnJsiP
         SgM3V4ZP3+UTedukIoHxMwzt3s0FLtYcuNJAka6sV+N9S/LLssuETYqolbbF8Hws3gDx
         gzkAN/zJYEdgKf3i3Le8UJhhjJ+CE2ViZx9tauLluT1wg6UUxLBeLSCcrlPTAEPqkQGp
         hYHTWbrNs473YEQK4SFs5/2G/r005+AsnETWMSd3nUS8FHssEnbFGcOYw0B7TS45jtiZ
         +YRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785641305; x=1786246105;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TpANIRIXCFEaCO+NoYgeEquheHUazRAsrSjmXdnDLkw=;
        b=MfvU2M65lN+HcOPbvoaPB0quzToS/PXc8NUNrlT56tw865HTVGrL2pJBKpZKhaXNY2
         nnZEHufuYYvFVn3s8OqZUGMpSSaACLzu73ZPuFGr/xoI5dTXrUEZcTMCmFPXwuMB1B0u
         ZHfMEzsgsFy5FHfymjrIDtQhAnd5Vg6/9u+AMXfDZ9V553xhrp2wDLZmDw/JXzzuPkmr
         T5iDJnvcsA7Yj39egdkkh1vIMD4tXZ7rXQRRwfJKI5u5AJTQMcRG0nicAqeG1+41N9c+
         NkoIgLAw+jxbcaxdLQO/8lvbpK3b+K4YYHR1yyivq1nG+wH27n9SbAfSk3gU9vUDZArC
         5xhw==
X-Forwarded-Encrypted: i=1; AHgh+RplzM1JOZEyTLBfsR/95XZGQQO229sOqvtoYpXAqaqKibbOVSFI6hW84+99HzxmZLjP5lq+/4IBH0c13QOU3yOv@lists.infradead.org
X-Gm-Message-State: AOJu0YyrV0QGXenCbK5feGzcegzFnmqk2pGaWsbkGI34nrEqvpZ0ycwj
	RWDZ9ar54ayV3T+OyOJPZ5s9LXFlyoi7rESHDYaIEZMf8qtieTrZOWtr
X-Gm-Gg: AR+sD11t62GZ7CCII7h/N4k5fESDfYyDQl3LOnEunB/Mwkuewso9D6hNowM9VB19bRo
	M3p/RO+cJPKO+IKCZC9ZQemvQ5BfWlX61qp2nvBpc3gQKxHI6hRUSivYlsPUujMeBjHv5KUdfGB
	w7/hvbM1Cff1wZXrdYfqKqUuV2slMler3i2Xv8/UizBUGbxUXOsSCL29w3jjwfBIhOJy/W5z+Ky
	bEed4ZvBnAsfI8gsRCDMm028ZDkbEOGUpqQoy87OynLk8umR8VeoVmv+gawmM0yZd+E+Lx7GbcL
	49r3zvZtWiNLMm8a6oL+TFVFbrpC4s3uSJ6QI6QErQpmY/rP8Tci7EIgi8o7eqDoWLTzi0HriiT
	Kylgzo+09jxvm2XHqGFaxYEdScWGVBea4V0mFKe3UvRaXBIdwwatdWKp+7DyBU6SOaWn4hls4IN
	nw5QMTQI8FU1/nxKyoyHediJx9MNP7rNF6Fe2TZo5dtG9kJeRUmk7wZdyi52XgO8y7qxA=
X-Received: by 2002:a17:902:ea0c:b0:2cf:6f7f:55d8 with SMTP id d9443c01a7336-2d0523f76edmr54404665ad.37.1785641304908;
        Sat, 01 Aug 2026 20:28:24 -0700 (PDT)
Received: from ehlo.thunderbird.net ([103.213.4.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae19ba5sm23124875ad.17.2026.08.01.20.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 20:28:24 -0700 (PDT)
Date: Sun, 02 Aug 2026 10:51:37 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Shawn Lin <shawn.lin@rock-chips.com>,
 David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_03/10=5D_phy=3A_rockchip=3A_naneng-?=
 =?US-ASCII?Q?combphy=3A_add_SGMII_MAC_selection_for_RK3568?=
User-Agent: K-9 Mail for Android
In-Reply-To: <0cf1f734-69d4-471f-aa22-e1a2e7d0341b@lunn.ch>
References: <20260801142244.679437-2-coiaprant@gmail.com> <20260801142244.679437-5-coiaprant@gmail.com> <0cf1f734-69d4-471f-aa22-e1a2e7d0341b@lunn.ch>
Message-ID: <7F609DE6-F3C6-487E-9113-449F5BE05D94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_202825_992017_062E75F5 
X-CRM114-Status: GOOD (  16.63  )
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

On August 2, 2026 4:58:39 AM GMT+08:00, Andrew Lunn <andrew@lunn=2Ech> wrot=
e:
>On Sat, Aug 01, 2026 at 10:22:27PM +0800, Coia Prant wrote:
>> On RK3568, the SGMII interface can be routed to either GMAC0 or
>> GMAC1 via the GRF register pipe_sgmii_mac_sel=2E
>>=20
>> Add support for this selection by introducing
>> the "rockchip,sgmii-mac-sel" DT property=2E
>>=20
>> The hardware reset value is GMAC1 (1)=2E If the property is set to 0,
>> the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
>> remains at GMAC1=2E
>>=20
>> This is necessary for boards such as the Ariaboard Photonicat, which
>> uses the SGMII interface connected to GMAC0=2E
>
>If SGMII is not selected, what MII is used? RGMII?
>
>Can this setting be implied from phy-mode?
>
>	Andrew

Hi Andrew,

If phy-mode is not "sgmii" (e=2Eg=2E, "rgmii" or "rmii"), the GMAC works i=
n
the corresponding mode and this register is not touched=2E The reset
default (GMAC1) remains, but it has no effect in non-SGMII modes because
the register only controls SGMII signal routing=2E

Regarding inference from phy-mode: phy-mode =3D "sgmii" only tells the MAC
driver that the interface is SGMII=2E It does not specify whether the
SGMII signals are physically routed to GMAC0 or GMAC1 on the board=2E
That routing is a board-level decision and cannot be derived from any
other DT property=2E

Also, the PHY (Naneng Combo PHY) is initialized by the XPCS glue driver
(pcs-xpcs-rk), not by the GMAC driver=2E The PHY driver has no way to know
which GMAC is using it=2E Making the PHY aware of the MAC ID would require
significant changes to the PHY layer, which is out of scope
for this series=2E

Therefore, an explicit DT property is the cleanest and most maintainable
way to describe this hardware routing=2E

Thanks,
Coia

