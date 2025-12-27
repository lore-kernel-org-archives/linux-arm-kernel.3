Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79508E92714
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 16:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xQepFKbLSgWwslvs/nMpOgMMovKMH4umS/FdNhEKCI=; b=FBeyoCC20gfMagOsgZXly93WzX
	XA5r4mfbUjmmVILsabbcLM+T74KWTwiiDGcFXJcRtSbWs+xn8ApCZ1CSDiNIGPqdE+4XcohXoEjds
	oAG2ZwOl7vQFjABUmda3oYW8tQCJcyq7zWx4U36nh6GxrXSpWAsNoOJFn9GZKpGBgAU/ctqXX67lz
	c4GyNqXfGiQM6PIdOgYvaRpyTrXQbovWuetMeK2+uLHdQp/OLNTeDvJkABugWGri7df7aQNE8Iaba
	DQqR+NzkshoP/jZG41SW/040B3odInE0M6QAPuUn9DvF/Vea2oVkx6ijrIM9j5n7kxyCmepJXNWfI
	iYWaULiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZWuu-000000024T4-0eYg;
	Sat, 27 Dec 2025 16:13:20 +0000
Received: from dilbert.mork.no ([2a01:4f9:c010:a439::d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZWup-000000024SP-2Cr0;
	Sat, 27 Dec 2025 16:13:17 +0000
Authentication-Results: dilbert.mork.no;
	dkim=pass (1024-bit key; secure) header.d=mork.no header.i=@mork.no header.a=rsa-sha256 header.s=b header.b=k57w20PL;
	dkim-atps=neutral
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:10e2:d900:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.18.1/8.18.1) with ESMTPSA id 5BRGCXea1092612
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 27 Dec 2025 16:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1766851953; bh=6xQepFKbLSgWwslvs/nMpOgMMovKMH4umS/FdNhEKCI=;
	h=From:To:Cc:Subject:References:Date:Message-ID:From;
	b=k57w20PLkK0NnQT97ZSgjxTiFyMawI1HfymwWSj/dmV9dfAS0qmWGBcJ1DeXhHDTB
	 Ikjv2Rf43hQPgRm2SkAZK5mFlF3fTrfTBplyddiW09dNafUsFVtDwDIDFTy2FmJol/
	 uX9FVRLcPgMDx6rz8X0io7qVVg3U2DMkmysnOspg=
Received: from miraculix.mork.no ([IPv6:2a01:799:10e2:d90a:6f50:7559:681d:630c])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.18.1/8.18.1) with ESMTPSA id 5BRGCXAq1173802
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 27 Dec 2025 17:12:33 +0100
Received: (nullmailer pid 1325881 invoked by uid 1000);
	Sat, 27 Dec 2025 16:12:33 -0000
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Daniel Golle <daniel@makrotopia.org>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Eric Woudstra <ericwouds@gmail.com>,
        Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>,
        Lee Jones <lee@kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Subject: Re: [PATCH net-next 0/9] XPCS polarity inversion via generic device
 tree properties
In-Reply-To: <20251122193341.332324-1-vladimir.oltean@nxp.com> (Vladimir
	Oltean's message of "Sat, 22 Nov 2025 21:33:32 +0200")
Organization: m
References: <20251122193341.332324-1-vladimir.oltean@nxp.com>
Date: Sat, 27 Dec 2025 17:12:33 +0100
Message-ID: <87qzsfewem.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 1.4.3 at canardo.mork.no
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_081316_226447_36252159 
X-CRM114-Status: GOOD (  11.02  )
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

Vladimir Oltean <vladimir.oltean@nxp.com> writes:

> This set contains an implementation of a generic feature that should
> cater to all known needs that were identified during my documentation
> phase. I've added a new user - the XPCS - and I've converted an existing
> user - the EN8811H Ethernet PHY.

Hello Vladimir!

Will there be a new version of this patch set?

The firmware for AN8811HB has now been submitted [1], so I plan to move
forward with the driver. And without this series then I don't see any
other reasonable alternative than continuing with "airoha,pnswap-rx/tx",
like the existing EN8811H driver.


Bj=C3=B8rn

[1] https://lore.kernel.org/linux-firmware/20251225163003.4797-1-lucienzx15=
9@gmail.com/T/#u

