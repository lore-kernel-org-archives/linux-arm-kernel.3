Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9CBC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 08:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E7j1zMVs8admRJrnt3m1bTGeeQa8hMONzSvNZSlrsrM=; b=h5rqpod40Jf9Jm
	c0UPEHQ12vgL0GOjrLBo1XMDu0VeSGEbqPJvD4iYCGMb0NQ6Ca7Fnc9wCDEvrPOiws1W63gLB+TTO
	43WbBU1Vq4UAzryqQ1HiI5NXPqj8WXqc1uA8JG6wKaf9OV5R9gjSxO18G1AiVnOQGmJGizR17Vyx1
	RxLGM+FFAY5I1BNcP+s3ejSzUsgzuAzoBSrm6GDJ127TIdDBQYthYlQrWvlkBJC5aXN7xq07p+9om
	e5OzBUgvt7jPlTJrDHV/1wYUT19OcBTY5K3YUXlBuSH0deHv6dJ7ypZ2+VbD9kcJJB6QIoQd5G0Pz
	ONVQDRA63zbX5dbzrlNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAUI-0000000CPpm-1Qo0;
	Thu, 19 Jun 2025 08:19:10 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9xD-0000000CKfL-1cRf;
	Thu, 19 Jun 2025 07:45:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1750319089; x=1750923889; i=frank-w@public-files.de;
	bh=E7j1zMVs8admRJrnt3m1bTGeeQa8hMONzSvNZSlrsrM=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KDSIlsydjQILr150T83/rnnFI/HIbDoBD1DFASo2rHSTk8O/Ef+YoX1hnw0Pt+VU
	 M3G14wHE0QWTwZ5OvVSkaBqVdvhu9Ie78F8lq1K0S2vjdCThnuy6zSf8KNqYxpCBa
	 d2QGtlBuKKxW1+p9iqBmsB8CiwThyUVa53pT/b/o/0jthGmoQBBRPfyx4NLFzEOHF
	 6MAH0tPXEgv6z8Bp7k2hT0jXzUBOdl2DXRYqx3HX1boXDLb21el/xj03Cn/GClvWO
	 KiTuuBtFHuSt6dnI4aYwjwLTnn0PqQ1R6XiTlk/fb5yRvl1Zp0F9uW5hz+cMldJai
	 49GTIqZRHcF5EcHJUg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([80.245.76.73]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzQkE-1ufGuu3A36-00y85L; Thu, 19
 Jun 2025 09:44:48 +0200
Date: Thu, 19 Jun 2025 09:44:34 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <linux@fw-web.de>, Felix Fietkau <nbd@nbd.name>,
 Sean Wang <sean.wang@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Simon Horman <horms@kernel.org>
CC: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Daniel Golle <daniel@makrotopia.org>, arinc.unal@arinc9.com
Subject: Re: [net-next v4 1/3] net: ethernet: mtk_eth_soc: support named IRQs
User-Agent: K-9 Mail for Android
In-Reply-To: <20250616080738.117993-2-linux@fw-web.de>
References: <20250616080738.117993-1-linux@fw-web.de> <20250616080738.117993-2-linux@fw-web.de>
Message-ID: <9FD09C8D-A9DC-4270-AB4A-6EBE25959F12@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cvnCfbPm9jApwf1bb6bI535HNmtJBfTU83ZqvwNAL5KbV+YTrg3
 4vfY0HjgnJFl5yPG3DSaB+gceFfD9oVcWQ5e6iJBUQ5RllLfPmAxB3RtfF7osGn5Ha5OTNB
 jNs9walHULCZadv10NORqsmVJahy7C2acq1rKxbrJt8I/+SDPYvpx6nV2zVsbbrSMJxl9Nm
 H/m8VMy7MP2lOCCqE8QIQ==
UI-OutboundReport: notjunk:1;M01:P0:C4utcjxoB3w=;BooY4sGG5o1DVldjwGcwVNwtbzH
 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_004459_712771_9E1183C3 
X-CRM114-Status: GOOD (  10.04  )
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

Am 16=2E Juni 2025 10:07:34 MESZ schrieb Frank Wunderlich <linux@fw-web=2Ed=
e>:
>From: Frank Wunderlich <frank-w@public-files=2Ede>
>
>Add named interrupts and keep index based fallback for exiting devicetree=
s=2E
>
>Currently only rx and tx IRQs are defined to be used with mt7988, but
>later extended with RSS/LRO support=2E
>
>Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>Reviewed-by: Simon Horman <horms@kernel=2Eorg>
>---
>v2:
>- move irqs loading part into own helper function
>- reduce indentation
>- place mtk_get_irqs helper before the irq_handler (note for simon)
>---
> drivers/net/ethernet/mediatek/mtk_eth_soc=2Ec | 39 +++++++++++++++------
> 1 file changed, 28 insertions(+), 11 deletions(-)
>
>diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc=2Ec b/drivers/net/=
ethernet/mediatek/mtk_eth_soc=2Ec
>index b76d35069887=2E=2E81ae8a6fe838 100644
>--- a/drivers/net/ethernet/mediatek/mtk_eth_soc=2Ec
>+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc=2Ec
>@@ -3337,6 +3337,30 @@ static void mtk_tx_timeout(struct net_device *dev,=
 unsigned int txqueue)
> 	schedule_work(&eth->pending_work);
> }
>=20
>+static int mtk_get_irqs(struct platform_device *pdev, struct mtk_eth *et=
h)
>+{
>+	int i;
>+
>+	eth->irq[1] =3D platform_get_irq_byname(pdev, "tx");
>+	eth->irq[2] =3D platform_get_irq_byname(pdev, "rx");

Hi Simon,

I got information that reserved frame-engine=20
 irqs are not unusable and have no fixed
 meaning=2E So i would add fe0=2E=2Efe3 in
 dts+binding and change these names from
tx/rx to fe1 and fe2=2E

Can i keep your RB here?


regards Frank

