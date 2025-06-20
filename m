Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0C2C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 11:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymGnUSpkRYHimfXYhbTcSoJdcHrDDRnjSW4Hs85r/BU=; b=hyhloyzbrHvB3/Ia96VgSC6gz+
	iaAdZqYXRSZ8LoMAWTS4FXahdD4WgRwwFuV1Ws6Cx1NpyiPnTZVEikeGPF1sha1rmtihqY2Gd+6qK
	54R6/T57rsKHFBdSuahTUS2+EmoRpesVxLzSPO4QJNrUb+dwprONmtJ9wyF+EmYbUAGaVZNhegdYc
	R0df9vP79E9+W4Nx6ga23rsaAOflTB5gNBc7+edBrUwCphtJORZWSAGYhCqUUCbaPsTPxbJGdABp/
	9olpAuHfVvA+4F7pVCpkoH2cTC2N38kCloP4ruO1t66ovVTV9HSLT8Lmowh40SLCwloSGxrQqT5qe
	DLlcu+UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZnY-0000000FS6V-2o4M;
	Fri, 20 Jun 2025 11:20:44 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZ6e-0000000FLhi-1QIs;
	Fri, 20 Jun 2025 10:36:25 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout1.routing.net (Postfix) with ESMTP id CFE9440265;
	Fri, 20 Jun 2025 10:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1750415782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ymGnUSpkRYHimfXYhbTcSoJdcHrDDRnjSW4Hs85r/BU=;
	b=BWZHLfWL6yztxVhkUvb6zkqvR+EVMfS3EFL+phNtPF05FcCJtKkzgV+XzVTyfpvhF6uzgl
	WfjlMArQzLuwmI7YLZLPOPD4hE21LQJBmbVArjo8W4rd1hNEGz/6lECib4SZGX1vD0w0u8
	hVxlUDd2Rdd8DARtsQCVbfb3HBqu6Hk=
Received: from [127.0.0.1] (fttx-pool-157.180.225.81.bambit.de [157.180.225.81])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 12D1580238;
	Fri, 20 Jun 2025 10:36:20 +0000 (UTC)
Date: Fri, 20 Jun 2025 12:36:22 +0200
From: Frank Wunderlich <linux@fw-web.de>
To: Daniel Golle <daniel@makrotopia.org>
CC: MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_01/13=5D_dt-bindings=3A_n?=
 =?US-ASCII?Q?et=3A_mediatek=2Cnet=3A_update_for_mt7988?=
User-Agent: K-9 Mail for Android
In-Reply-To: <aFU4jSUFjWJlJCWJ@pidgin.makrotopia.org>
References: <20250620083555.6886-1-linux@fw-web.de> <20250620083555.6886-2-linux@fw-web.de> <aFU4jSUFjWJlJCWJ@pidgin.makrotopia.org>
Message-ID: <8EFC68B9-E560-4BB0-AD16-98A847D2F084@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: 2c931364-7c27-4fb5-b79b-85688067c00d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_033624_521671_D0BE5763 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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

Am 20=2E Juni 2025 12:31:41 MESZ schrieb Daniel Golle <daniel@makrotopia=2E=
org>:
>On Fri, Jun 20, 2025 at 10:35:32AM +0200, Frank Wunderlich wrote:
>> @@ -40,7 +43,11 @@ properties:
>> =20
>>    interrupts:
>>      minItems: 1
>> -    maxItems: 4
>> +    maxItems: 8
>> +
>> +  interrupt-names:
>> +    minItems: 1
>> +    maxItems: 8
>
>Shouldn't interrupt-names only be required for MT7988 (and future SoCs)?
>Like this at least one entry in interrupt-names is now always required=2E

No,this section only allows this property and it
 is not listed in required section and so an
 optional property=2E But if it is defined in
 devicetree it needs 1 to 8 items=2E


regards Frank

