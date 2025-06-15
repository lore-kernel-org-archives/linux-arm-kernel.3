Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEE8C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 20:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+pAFU9AytArnIwqdWcPlCccdu0jBWh6uQ/wP44N9Jo=; b=sB6vI6Z2PO0okDR0EAtAFco68A
	o3oeOpTSnF+9AH62i6aT29ftACsO0ssvM9NP4Z2v089C0ap+mZ3y765PbREM7kNarAmqku+vB1wLG
	geUMuNe3q+sdvAuaq6DQso1L5SJThg5yRbFRrXrdMcDsholX6dSRAgQhYUGUK/+C61BBJmmVd8yRY
	tzyKeMBvsEwJFtWjFfIr95ypEfLISFTg92y7/UWZ+W02uEkrVA62YDVei3WflcOyW5PteriRGtVrZ
	SPEB3Om2XQJG8di0mWhHBq+Y18DelO/zTBqDD8RZekUCsPGHrDxjBqnd6/GdpU5GqOXFoHtTEDA2W
	EB8S9z1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQtaf-00000002nhk-2Cf1;
	Sun, 15 Jun 2025 20:04:29 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQtYR-00000002na6-1oWN;
	Sun, 15 Jun 2025 20:02:12 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout3.routing.net (Postfix) with ESMTP id 6324E6022C;
	Sun, 15 Jun 2025 20:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1750017729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D+pAFU9AytArnIwqdWcPlCccdu0jBWh6uQ/wP44N9Jo=;
	b=SnQIebM+9MKdNtdv9x3At12yoE/FHiYKjhbH68HfMwBOlmVkpOuzTKRvB1Z24RYj+BPSef
	HI+Riy+dj13SXZnMnoiCOcJHPXyn7WeqyA0HQpENSV3rHU2e/aTFyDa/Yiza/xi8bAPU+V
	5kLMeS8lrn3noh0JkNEIu+18Og2Hv2o=
Received: from [127.0.0.1] (fttx-pool-217.61.157.124.bambit.de [217.61.157.124])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 84A6C8034B;
	Sun, 15 Jun 2025 20:02:08 +0000 (UTC)
Date: Sun, 15 Jun 2025 22:02:08 +0200
From: Frank Wunderlich <linux@fw-web.de>
To: Daniel Golle <daniel@makrotopia.org>
CC: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Simon Horman <horms@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5Bnet-next_v3_3/3=5D_net=3A_ethernet=3A_mtk=5Feth=5F?=
 =?US-ASCII?Q?soc=3A_change_code_to_skip_first_IRQ_completely?=
User-Agent: K-9 Mail for Android
In-Reply-To: <aE8ja1fbAtvWx2GN@pidgin.makrotopia.org>
References: <20250615150333.166202-1-linux@fw-web.de> <20250615150333.166202-4-linux@fw-web.de> <aE8ja1fbAtvWx2GN@pidgin.makrotopia.org>
Message-ID: <B8138460-D6EA-4142-B0D9-14C93B15D5B8@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: 9b720d70-be23-44b8-94ac-4f9468184a23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_130211_670544_50E86478 
X-CRM114-Status: GOOD (  16.21  )
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

Am 15=2E Juni 2025 21:49:43 MESZ schrieb Daniel Golle <daniel@makrotopia=2E=
org>:
>On Sun, Jun 15, 2025 at 05:03:18PM +0200, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> On SoCs without MTK_SHARED_INT capability (mt7621 + mt7628) the first
>> IRQ (eth->irq[0]) was read but never used=2E Skip reading it now too=2E
>>=20
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>> ---
>>  drivers/net/ethernet/mediatek/mtk_eth_soc=2Ec | 11 ++++++++---
>>  drivers/net/ethernet/mediatek/mtk_eth_soc=2Eh |  4 ++--
>>  2 files changed, 10 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc=2Ec b/drivers/ne=
t/ethernet/mediatek/mtk_eth_soc=2Ec
>> index 9aec67c9c6d7=2E=2E4d7de282b940 100644
>> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc=2Ec
>> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc=2Ec
>> @@ -3346,10 +3346,15 @@ static int mtk_get_irqs(struct platform_device =
*pdev, struct mtk_eth *eth)
>>  		return 0;
>> =20
>>  	for (i =3D 0; i < MTK_ETH_IRQ_MAX; i++) {
>> -		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
>> -			eth->irq[i] =3D eth->irq[MTK_ETH_IRQ_SHARED];
>> +		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT)) {
>> +			if (i =3D=3D 0)
>> +				eth->irq[MTK_ETH_IRQ_SHARED] =3D platform_get_irq(pdev, i);
>> +			else
>> +				eth->irq[i] =3D eth->irq[MTK_ETH_IRQ_SHARED];
>> +		} else if (i < 2)  //skip the 1st and 4th IRQ on !MTK_SHARED_INT
>
>Please use conformant comment style, ie=2E do not use '//' but always use
>'/* =2E=2E=2E */' instead, on a dedicated line=2E

Ok,not sure if the comment should stay :)
It was a comment for me and i forgot to remove it=2E

>> +			eth->irq[i] =3D platform_get_irq(pdev, i + 1);
>>  		else
>> -			eth->irq[i] =3D platform_get_irq(pdev, i);
>> +			continue;
>> =20
>>  		if (eth->irq[i] < 0) {
>>  			dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
>> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc=2Eh b/drivers/ne=
t/ethernet/mediatek/mtk_eth_soc=2Eh
>> index 6b1208d05f79=2E=2Eff2ae3c80179 100644
>> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc=2Eh
>> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc=2Eh
>> @@ -643,8 +643,8 @@
>>  #define MTK_MAC_FSM(x)		(0x1010C + ((x) * 0x100))
>> =20
>>  #define MTK_ETH_IRQ_SHARED	0
>> -#define MTK_ETH_IRQ_TX		1
>> -#define MTK_ETH_IRQ_RX		2
>> +#define MTK_ETH_IRQ_TX		0
>> +#define MTK_ETH_IRQ_RX		1
>>  #define MTK_ETH_IRQ_MAX		3
>
>Shouldn't MAX be 1 now?

No as we still need to loop over the first 3 irqs
on the older devicetrees=2E Or was the MAX
intented for anything else (e=2Eg=2E array size for
storing the sw irqs - not changed this yet,but
imho thi should be 2 now if SHARED_INT does
not need 3 entries)?


regards Frank

