Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E02BC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 10:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cqCL16doApCg2zZ7bwDUqitLshWF7HWzSvNM7J3qWcY=; b=yACB7xxlPUFDAN
	4mrfjVT2B4jt8L5hJrMc0shTJeDlgjoHDbATi+YgyVChsWJbkYOrbGXKQenPRXxJT9DU5CAQ5nwlS
	jqP9UKjhDckYnOho/GF5KaNlPG89tkzI41leWARVQBz0OCYWvmuvQ3yAILHF3hSYGv8MMcSmV22YP
	nkCVXVCJ/ajrJ7tnn1HCcBZJau/3L5WgdRcUuCvT5JXbCmmp6lzFGBTG8SK+Nixw7A9MAku3mB1kI
	JO7O4ArlXWEaYNYzhX4tQKJaRs38n+F6EHZ/WTWstxmZ0AGeIHAy3Wawq4xvFQOg/j4zS7CWHgcQ0
	a621V8nZKNJCqMrBqQ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYLo-00000004ldy-2Kiq;
	Tue, 01 Jul 2025 10:36:32 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYJT-00000004lJW-01F9;
	Tue, 01 Jul 2025 10:34:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1751366038; x=1751970838; i=frank-w@public-files.de;
	bh=cqCL16doApCg2zZ7bwDUqitLshWF7HWzSvNM7J3qWcY=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=EAg/CecV4gJ+9UbG5OzBX9GVtapTeT2fSy2xKbkGHz5txreMdpc9NaYpb3y8n6RD
	 olBi+pcGoJ7iTCIsemQoK9MESh9B8iVI9li+TnVRkqVluDcy4nwcNGYAfWfbwOKgq
	 FscEnoxqRAlXgCf23SxkHvQlvfXUEY4fXUaba/CTNYKeO4skznFNuMrrt6kdha5zW
	 eJKno3jMlxvt3Qxbibx4i0c0HYMJ1m5FXqK1OAlVgZiXPPP6nsVeg6AUcS3UlWdKI
	 Pv7EHNbyn8Hi7vlxJb/hSfuG1Cj+jD0wIGVYOUKWklDIxMXQjitvA1ovYm5e5yqTN
	 zmk0wJJ6dk1W4m7uHw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [IPv6:::1] ([80.187.118.70]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNbkp-1uKlx71myR-00V8CJ; Tue, 01
 Jul 2025 12:33:58 +0200
Date: Tue, 01 Jul 2025 12:33:46 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Frank Wunderlich <linux@fw-web.de>
CC: MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v7_02/14=5D_dt-bindings=3A_n?=
 =?US-ASCII?Q?et=3A_mediatek=2Cnet=3A_update_for_mt7988?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250701-rebel-mellow-parrot-fda216@krzk-bin>
References: <20250628165451.85884-1-linux@fw-web.de> <20250628165451.85884-3-linux@fw-web.de> <20250701-rebel-mellow-parrot-fda216@krzk-bin>
Message-ID: <8C311FDD-094A-4F1C-AE26-7E3ABB337C14@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iDZ1HFnWblMRrSKckbE7RIe6FOjqP9jVceGRYihPuH0T9KW/xO4
 VwQWhlNKHAwO7w4FA/k1dAHrSE7gSECcacV1yG+FR8WeXYaQMbhRK8zKiPmHZxmtk0se36m
 XR3vDuQUsLb89KxskuGksrzMrEeBM5gHPkrT1Bsmh/f/EqszFblF1ijG1uYExmPRao1PHxR
 epZk/OGyNc7chl+Dn18KQ==
UI-OutboundReport: notjunk:1;M01:P0:ykrTOmJyAiw=;o2diJZbdNd3QRu6F/nKuXR6oxcJ
 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_033407_419258_12EBD23E 
X-CRM114-Status: GOOD (  21.43  )
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
Reply-To: frank-w@public-files.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Am 1=2E Juli 2025 08:41:42 MESZ schrieb Krzysztof Kozlowski <krzk@kernel=2E=
org>:
>On Sat, Jun 28, 2025 at 06:54:37PM +0200, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> Update binding for mt7988 which has 3 gmac and a sram for dma
>> operations=2E
>
>I asked why you are updating=2E You claim you update because it has 3
>GMAC=2E=2E=2E but that's irrelevant, because it is easy to answer with: i=
t did
>not have 3 GMAC before?
>
>So same question: Provide real reason why you are making updates=2E That'=
s
>why you have commit msg=2E

MT7988 had always 3 gmac,but no dts with ethernet
node till now=2E
As i try to upstream the dts,i fell over this=2E

Imho changing the regex for the mac subnodes was
simply forgotten to be updated on initial mt7988
support patch=2E

I try to rephrase it like this:

Binding was not aware for 3 MAC subnodes because
previous mediatek SoC had only 2=2E Change this to allow
3 GMAC in mt7988 devicetree=2E
>
>>=20
>> MT7988 has 4 FE IRQs (currently only 2 are used) and 4 IRQs for use
>
>mt7988 or MT7988? gmac or GMAC? SRAM or SRAM? and so on=2E=2E=2E it is no=
t
>easy to read and understand your commit msgs=2E

Ok,i always write those names in uppercase=2E

>> with RSS/LRO later=2E
>>=20
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>> ---
>> v6:
>> - split out the interrupt-names into separate patch
>> - update irq(name) min count to 4
>> - add sram-property
>> - drop second reg entry and minitems as there is only 1 item left again
>>=20
>> v5:
>> - fix v4 logmessage and change description a bit describing how i get
>>   the irq count=2E
>> - update binding for 8 irqs with different names (rx,tx =3D> fe0=2E=2Ef=
e3)
>>   including the 2 reserved irqs which can be used later
>> - change rx-ringX to pdmaX to be closer to hardware documentation
>>=20
>> v4:
>> - increase max interrupts to 6 because of adding RSS/LRO interrupts (4)
>>   and dropping 2 reserved irqs (0+3) around rx+tx
>> - dropped Robs RB due to this change
>> - allow interrupt names
>> - add interrupt-names without reserved IRQs on mt7988
>>   this requires mtk driver patch:
>>   https://patchwork=2Ekernel=2Eorg/project/netdevbpf/patch/202506160807=
38=2E117993-2-linux@fw-web=2Ede/
>>=20
>> v2:
>> - change reg to list of items
>> ---
>>  Documentation/devicetree/bindings/net/mediatek,net=2Eyaml | 9 +++++++-=
-
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/net/mediatek,net=2Eyaml =
b/Documentation/devicetree/bindings/net/mediatek,net=2Eyaml
>> index 6672db206b38=2E=2E74a139000f60 100644
>> --- a/Documentation/devicetree/bindings/net/mediatek,net=2Eyaml
>> +++ b/Documentation/devicetree/bindings/net/mediatek,net=2Eyaml
>> @@ -28,7 +28,8 @@ properties:
>>        - ralink,rt5350-eth
>> =20
>>    reg:
>> -    maxItems: 1
>> +    items:
>> +      - description: Register for accessing the MACs=2E
>
>Why making this change? It's redundant and nothing in commit msg
>explains that=2E

I was instructed (where we had 2 regs in previous
Version) to name the regs=2E=2E=2Ebut as we have one reg
again,i can drop this change=2E Thought a description=20
is better than a count=2E

>Best regards,
>Krzysztof
>


regards Frank

