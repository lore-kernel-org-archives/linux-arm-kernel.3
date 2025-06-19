Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27705C71159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 07:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=njQ31qrrY9HaE80KOkYp3xG43496qOQx+zhSn6xjDeA=; b=PoZMSdvOYS7thkisWiCCD4caGK
	IxsVUzu7v8HiITOIr5UQ2ikp8mwUdGOXUBCA53lmb711TKT/c/VByuxEiRS7Mx7Ud/rqgtNRonEjv
	mdABg4iHhZf0o0mS3UA5W8MrV34wpZUBzLwn5wGtroomANlTZOGx8oNlKPYepMasA9qEHmQmxC3Dk
	N9F2FnUJFgGRGfv7U7Tq3uuFGmzi7U4iSMjCqaPZNGjLcQNt9Yi7CM2X9RpjSv6r5/B2pFM/sVt4Y
	6Umh5BCbLoWhWREMJUdRoda15XU+a0qmPIz79AzthMhceU1ZM5VAcLepAIHWMGVG8AT5DRGkMFdey
	N1ls9yHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9k8-0000000CIi5-1K0U;
	Thu, 19 Jun 2025 07:31:28 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9EC-0000000CEcD-2hFV;
	Thu, 19 Jun 2025 06:58:30 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout2.routing.net (Postfix) with ESMTP id 50A125FB6C;
	Thu, 19 Jun 2025 06:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1750316302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=njQ31qrrY9HaE80KOkYp3xG43496qOQx+zhSn6xjDeA=;
	b=alG2FtT3L898ztBmhlM2pSNVcjIkFUk7/1xSwM2dgG9YK2I3a0t48c4zf1DP18CV4lZJhI
	cqhxtGUORlrTEY7zuo0CEIIN+s8RdFddsgQkMegRs9RelFqdh9G11AtkR7FfHwhbCUqP+M
	xZWy4Bx1lY8WMMg4m782Pb82ISFh3ck=
Received: from [127.0.0.1] (fttx-pool-80.245.76.73.bambit.de [80.245.76.73])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 72C3D808E4;
	Thu, 19 Jun 2025 06:58:20 +0000 (UTC)
Date: Thu, 19 Jun 2025 08:58:20 +0200
From: Frank Wunderlich <linux@fw-web.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Frank Wunderlich <frank-w@public-files.de>,
 Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 00/13] further mt7988 devicetree work
User-Agent: K-9 Mail for Android
In-Reply-To: <9cdf0624-f9bb-4b11-973e-9480fd655136@collabora.com>
References: <20250616095828.160900-1-linux@fw-web.de> <9cdf0624-f9bb-4b11-973e-9480fd655136@collabora.com>
Message-ID: <40C42E40-25C3-4FB2-8EB4-E7FCB677E415@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: 376531bd-c831-454f-b55f-f96f05563171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_235828_985415_5258C6E0 
X-CRM114-Status: GOOD (  18.03  )
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

Am 19=2E Juni 2025 07:57:09 MESZ schrieb AngeloGioacchino Del Regno <angelo=
gioacchino=2Edelregno@collabora=2Ecom>:
>Il 16/06/25 11:58, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>
>I think that this series is ready to be applied; however, I need someone =
to take
>the bindings before I can apply the devicetree part to the MediaTek trees=
=2E

Please wait a bit for the eth part=2E=2E=2Eseems like reserved irqs are no=
t unusable as i thought=2E=2E=2Ei think we should upstream them too and may=
be with different names=2E=2E=2Eas they are not fixed to function in hardwa=
re=2E

>Cheers,
>Angelo
>
>
>> This series continues mt7988 devicetree work
>>=20
>> - Extend cpu frequency scaling with CCI
>> - GPIO leds
>> - Basic network-support (ethernet controller + builtin switch + SFP Cag=
es)
>>=20
>> depencies (i hope this list is complete and latest patches/series linke=
d):
>>=20
>> support interrupt-names because reserved IRQs are now dropped, so index=
 based access is now wrong
>> https://patchwork=2Ekernel=2Eorg/project/netdevbpf/patch/20250616080738=
=2E117993-2-linux@fw-web=2Ede/
>>=20
>> for SFP-Function (macs currently disabled):
>>=20
>> PCS clearance which is a 1=2E5 year discussion currently ongoing
>>=20
>> e=2Eg=2E something like this (one of):
>> * https://patchwork=2Ekernel=2Eorg/project/netdevbpf/patch/202506102331=
34=2E3588011-4-sean=2Eanderson@linux=2Edev/ (v6)
>> * https://patchwork=2Ekernel=2Eorg/project/netdevbpf/patch/202505112012=
50=2E3789083-4-ansuelsmth@gmail=2Ecom/ (v4)
>> * https://patchwork=2Ekernel=2Eorg/project/netdevbpf/patch/ba4e359584a6=
b3bc4b3470822c42186d5b0856f9=2E1721910728=2Egit=2Edaniel@makrotopia=2Eorg/
>>=20
>> full usxgmii driver:
>> https://patchwork=2Ekernel=2Eorg/project/netdevbpf/patch/07845ec900ba41=
ff992875dce12c622277592c32=2E1702352117=2Egit=2Edaniel@makrotopia=2Eorg/
>>=20
>> first PCS-discussion is here:
>> https://patchwork=2Ekernel=2Eorg/project/netdevbpf/patch/8aa905080bdb67=
60875d62cb3b2b41258837f80e=2E1702352117=2Egit=2Edaniel@makrotopia=2Eorg/
>>=20
>> and then dts nodes for sgmiisys+usxgmii+2g5 firmware
>>=20
>> when above depencies are solved the mac1/2 can be enabled and 2=2E5G ph=
y/SFP slots will work=2E
>>=20
>> changes:
>> v4:
>>    net-binding:
>>      - allow interrupt names and increase max interrupts to 6 because o=
f RSS/LRO interrupts
>>        (dropped Robs RB due to this change)
>>=20
>>    dts-patches:
>>    - add interrupts for RSS/LRO and interrupt-names for ethernet node
>>    - eth-reg and clock whitespace-fix
>>    - comment for fixed-link on gmac0
>>    - drop phy-mode properties as suggested by andrew
>>    - drop phy-connection-type on 2g5 board
>>    - reorder some properties
>>    - update 2g5 phy node
>>      - unit-name dec instead of hex to match reg property
>>      - move compatible before reg
>>      - drop phy-mode
>>=20
>> v3:
>>    - dropped patches already applied (SPI+thermal)
>>    - added soc specific cci compatible (new binding patch + changed dts=
)
>>    - enable 2g5 phy because driver is now merged
>>    - add patch for cleaning up unnecessary pins
>>    - add patch for gpio-leds
>>    - add patch for adding ethernet aliases
>>=20
>> v2:
>>    - change reg to list of items in eth binding
>>    - changed mt7530 binding:
>>      - unevaluatedProperties=3Dfalse
>>      - mediatek,pio subproperty
>>      - from patternProperty to property
>>    - board specific properties like led function and labels moved to bp=
i-r4 dtsi
>>=20
>>=20
>> Frank Wunderlich (13):
>>    dt-bindings: net: mediatek,net: update for mt7988
>>    dt-bindings: net: dsa: mediatek,mt7530: add dsa-port definition for
>>      mt7988
>>    dt-bindings: net: dsa: mediatek,mt7530: add internal mdio bus
>>    dt-bindings: interconnect: add mt7988-cci compatible
>>    arm64: dts: mediatek: mt7988: add cci node
>>    arm64: dts: mediatek: mt7988: add basic ethernet-nodes
>>    arm64: dts: mediatek: mt7988: add switch node
>>    arm64: dts: mediatek: mt7988a-bpi-r4: add proc-supply for cci
>>    arm64: dts: mediatek: mt7988a-bpi-r4: drop unused pins
>>    arm64: dts: mediatek: mt7988a-bpi-r4: add gpio leds
>>    arm64: dts: mediatek: mt7988a-bpi-r4: add aliases for ethernet
>>    arm64: dts: mediatek: mt7988a-bpi-r4: add sfp cages and link to gmac
>>    arm64: dts: mediatek: mt7988a-bpi-r4: configure switch phys and leds
>>=20
>>   =2E=2E=2E/bindings/interconnect/mediatek,cci=2Eyaml   |  11 +-
>>   =2E=2E=2E/bindings/net/dsa/mediatek,mt7530=2Eyaml     |  24 +-
>>   =2E=2E=2E/devicetree/bindings/net/mediatek,net=2Eyaml |  28 +-
>>   =2E=2E=2E/mediatek/mt7988a-bananapi-bpi-r4-2g5=2Edts  |  11 +
>>   =2E=2E=2E/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edts  |  19 ++
>>   =2E=2E=2E/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edtsi | 198 ++++++---=
--
>>   arch/arm64/boot/dts/mediatek/mt7988a=2Edtsi     | 307 +++++++++++++++=
++-
>>   7 files changed, 498 insertions(+), 100 deletions(-)
>>=20
>
>


regards Frank

