Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4005C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 18:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N7tr9vCzas4Dcx7c2Tgeu4LP6gHZKQuy1GdaO/TFlr4=; b=v3is3+a29RtdgwQ90wNeXz92dW
	4rdasFt18Ex6/2XV9MlncT89drnLBd9iF/S928Ye586OcuJ0LobFQQbGub2t9ylLouHHFxhiArMc0
	sFNZxHmelm7e/SzCQ0oknDpgrrGVdHvmPu6nRvkWyCf3Lza/HxGfxEOIJ03g2MQhwgkm8i5FCCKQd
	T8zFEqkFTRuopnLURe1rW/ypdlQM9rlwbsZlzlCsIOKl4w+eAHy/wEW+8L37RHAV1PPuAdXbypKaU
	esWPtCtvAkuX5UOBkTe5Rkcly3wy2SxJh2n9BGa8c/lzc5049onBIBV2RQOX6nU6RNekhv2VyrUCS
	fOyaMmLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRx6g-0000000B0iu-1VCK;
	Wed, 18 Jun 2025 18:01:54 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRu7E-0000000AUy7-1IWZ;
	Wed, 18 Jun 2025 14:50:17 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id 3474E41ADE;
	Wed, 18 Jun 2025 14:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1750258214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N7tr9vCzas4Dcx7c2Tgeu4LP6gHZKQuy1GdaO/TFlr4=;
	b=Nbknur+18KqPDja5RX/s65/bE/pPe42K7+j6BqbbBZ2lfnz1+IlheE52B92cm6xDpE+eM3
	+1J2JXUED1AfYvVCBLE/WbHiocrItKJfci05mR4apGeGPAdDixOTM5mR2MMA0ap8wmz/zh
	dXnO3+qaeB8OGQJndQ74liL4RhdsOEM=
Received: from [127.0.0.1] (fttx-pool-80.245.76.73.bambit.de [80.245.76.73])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 0453F360048;
	Wed, 18 Jun 2025 14:50:12 +0000 (UTC)
Date: Wed, 18 Jun 2025 16:50:13 +0200
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
 linux-mediatek@lists.infradead.org, Simon Horman <horms@kernel.org>,
 arinc.unal@arinc9.com
Subject: Re: [net-next v5 1/3] net: ethernet: mtk_eth_soc: support named IRQs
User-Agent: K-9 Mail for Android
In-Reply-To: <aFLFYe8mq4tbLfdf@pidgin.makrotopia.org>
References: <20250618130717.75839-1-linux@fw-web.de> <20250618130717.75839-2-linux@fw-web.de> <aFLFYe8mq4tbLfdf@pidgin.makrotopia.org>
Message-ID: <601853CD-F47A-452A-87AC-668E73A3E971@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: e609ebad-906a-455e-bb64-4bc71f18ceb5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_075016_509270_E0028460 
X-CRM114-Status: GOOD (  13.79  )
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

Am 18=2E Juni 2025 15:55:45 MESZ schrieb Daniel Golle <daniel@makrotopia=2E=
org>:
>On Wed, Jun 18, 2025 at 03:07:12PM +0200, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> Add named interrupts and keep index based fallback for existing
>> devicetrees=2E
>>=20
>> Currently only rx and tx IRQs are defined to be used with mt7988, but
>> later extended with RSS/LRO support=2E
>>=20
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>> Reviewed-by: Simon Horman <horms@kernel=2Eorg>
>> =20
>> +static int mtk_get_irqs(struct platform_device *pdev, struct mtk_eth *=
eth)
>> +{
>> +	int i;
>> +
>> +	/* future SoCs beginning with MT7988 should use named IRQs in dts */
>> +	eth->irq[1] =3D platform_get_irq_byname(pdev, "tx");
>> +	eth->irq[2] =3D platform_get_irq_byname(pdev, "rx");
>> +	if (eth->irq[1] >=3D 0 && eth->irq[2] >=3D 0)
>> +		return 0;
>
>I'd rather extend that logic and fall back to the legacy way only in case
>of -ENXIO=2E Ie=2E add here:
>
>if (eth->irq[1] !=3D -ENXIO)
>	return eth->irq[1];
>
>if (eth->irq[2] !=3D -ENXIO)
>	return eth->irq[2];

I would do this later after the consts are used
 instead of index numbers,just to not add lines
 that are changed later again=2EBetter adding the
 lines already with the consts=2E

>Maybe also output a warning at this point in case MTK_SHARED_INT is no
>set, to recommend users to update their device tree to named interrupts=
=2E

I understand the reason behind (documentation
 which irq is used for which purpose),but
 previous devicetrees of non-shared SoCs using
 at least the reserved irq 0=2E Mt7986 has 0 and 3
 defined in dts=2E That could be tricky in binding,
 so my way was starting with irq names now for
 new additions and leaving existing dts as they
 are=2E

Maybe i should add the mt7988 ethernet binding change from my dts series h=
ere=2E=2E=2E

regards Frank

