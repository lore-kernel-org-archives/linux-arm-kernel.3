Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A365BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 22:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:
	Subject:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SYdwHkJmBU/pcv/d+DYNr7WpOGo7tnfs2VifDPdDAhg=; b=ERkixf/PnmmdP/
	k5qbdPLD8yPLi6gsjPo/B2WlVc4RsXkpLslMpGpG2TU15z51Qanc6Z9HaYrRnoDS+Kkjd2ximfmPo
	i+PkTNyvKqPLrhLnpg9BzhEEyD1F+NdctqwJASS68hJewcHvdeSmDYlE1WCEPhR9NO1yj52Vn9dQS
	ukRoBB6mzo0hkIGV4e9O2svTIc9jbwW9Z0QGXcmMv0i5yEAzP1t4e4WvHd69+dXzIVGE4wRUnwuS/
	eHSV0r5poyaZEEddw7ctWF9wu4f06Y9p0KiksRRfO2e44NJ9flmGjpaq18Szj1XFUFmqB2TI9Mnf1
	CrT1j4LDZmlia38+f3Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL8NS-0000000CvwW-2SIc;
	Tue, 10 Dec 2024 22:06:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL8MQ-0000000CvdY-0VeT;
	Tue, 10 Dec 2024 22:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:
	MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
	bh=SYdwHkJmBU/pcv/d+DYNr7WpOGo7tnfs2VifDPdDAhg=; b=elWH/ZyocK/tcZ27SDkupqQSrV
	mMsGeUyIDQ1Uv0dvoGHjl/oD0yfeyxlenAU/kYL3tVB3MdurtvLMfHIiGwMCXw/7OzrezMDzy2rrN
	ojfMX9FB0Vw8St3Vk5nSRi9i9gfXalfe+iPtajv4kZO47yxKSjFbAM39j3N4KzRTR5k2hN/VNPFkg
	vXUY9Dv00i728iY1V2ENbuZreattmpNDI7umwQES+gcc04l3sxslyauesjTqo5LkOQ/TEDbpy8hp2
	Z+7MSy6oEHs8zBuvJrPdaR8ojvHqvd75fSCc4yOdXAclqz6BCRACUTmLqPtTEasVrTZL9FmFy/EpB
	HS0WMXkA==;
Received: from coral.oak.relay.mailchannels.net ([23.83.215.39])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL8MC-00000003jeZ-0Bkd;
	Tue, 10 Dec 2024 22:05:30 +0000
X-Sender-Id: hostingeremail|x-authuser|arinc.unal@arinc9.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 81F3124832;
	Tue, 10 Dec 2024 21:45:20 +0000 (UTC)
Received: from nl-srv-smtpout7.hostinger.io (trex-5.trex.outbound.svc.cluster.local [100.98.0.247])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 8AF5A24823;
	Tue, 10 Dec 2024 21:45:16 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1733867120; a=rsa-sha256;
	cv=none;
	b=hFP3QZjCni3Ip+98MFP1SXKWHbM3jP5XOrotbnnYkdE47JEO2yqpYuKMt1LMFHicSvTFc5
	+carobUQ/Wv063VPCooN79SBt6oRVu5edzaQG6YIhCnNhttSKo0Z47l1zh3NyieycbRx2E
	dIASUPOWQBl7AKdPMuJj9QvDo2Pu9ryiJ7RBdCAGrsHI845q3kv4JKzK3L65e5ecDzyfS0
	C7TI2LiyFBK89i6nE57o8UI18UWCddYL5R7Vdc1m1UETHppllY9rWTzu/3kU7HJ4YylTJ0
	XweUIWINlwQ8PvXeJcXACJbg3pE0Peof2I1C+sV7/KkUH/O0g8f0oVg3PIfNdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1733867120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=SYdwHkJmBU/pcv/d+DYNr7WpOGo7tnfs2VifDPdDAhg=;
	b=QrfbnH6L3CMm5LbRWznkqoqMitue4u8NE2ndpjiIs4Iv/dPhPlGvgv0tAeMUfp/OFBQfk8
	r9YryQB8GS9wfrHTexiw9AYoLEXJcUCcXcPgmDSPtU/4H0sxHHfDOQDJdfxFuPmAU6GOWx
	8a3GLlwTL5DyhHbxvG0hq1kB/l+XadMSf0lIC2Ex13Yi7KOXuNRwfcAvLA3puavPtz5v8q
	nOrTj7cX5+fe1cXh9t0yu+2U+HYbwQs6laMOjC2n35quNOeOMiy6YDB45KogRsHXdZSAku
	soxx0UkocrrBpCqE7K/csxr2eFjRq5rzx2ExEr1gZaHxqXqTKdFKIqKtcXOtxg==
ARC-Authentication-Results: i=1;
	rspamd-5d9d86ff64-sqxlh;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=arinc.unal@arinc9.com
X-Sender-Id: hostingeremail|x-authuser|arinc.unal@arinc9.com
X-MC-Relay: Bad
X-MailChannels-SenderId: hostingeremail|x-authuser|arinc.unal@arinc9.com
X-MailChannels-Auth-Id: hostingeremail
X-Bottle-Coil: 2fbcd1441e3f7124_1733867120287_3536260936
X-MC-Loop-Signature: 1733867120287:1317792024
X-MC-Ingress-Time: 1733867120287
Received: from nl-srv-smtpout7.hostinger.io (nl-srv-smtpout7.hostinger.io
 [45.87.82.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.0.247 (trex/7.0.2);
	Tue, 10 Dec 2024 21:45:20 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com;
	s=hostingermail-a; t=1733867114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SYdwHkJmBU/pcv/d+DYNr7WpOGo7tnfs2VifDPdDAhg=;
	b=prcz+Ngt+NRtMI52vtGLN3OQLVWpkPxinr5+LleVEp1gSCl76tsRj8xQ7XMI9r4BWoJ1xM
	a2LMV9zA8QPElKEHFbxaDsBLNzSFQ+jG0bFKlspi6XSW0rSwZf6/zPwI1miR1+p7Km2IrR
	dl8X72ZDAiAPAqK8wH3oJNFJMU15lTl5vUV9wniFiOQLW7zyBh097h/yy95tcJHBrk2MW7
	1jIrQUeXMaObWB1szYeWs3toHC00bBayYWcI+F7VOqw2Gw/veTUxD7Ua9JydTcPNJYRTLh
	maAd6RhXWFD9cyWuQkDE2eQ0bCgSoJJTk81w+KdzjPr7hbjNz+nacY2KL5q0JQ==
From: arinc.unal@arinc9.com
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel
 Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>, DENG
 Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Paolo
 Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>, Simon Horman
 <horms@kernel.org>, UNGLinuxDriver@microchip.com, Vladimir Oltean
 <olteanv@gmail.com>, Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH net-next 5/9] net: dsa: mt753x: implement .support_eee()
 method
In-Reply-To: <E1tL14J-006cZa-Rh@rmk-PC.armlinux.org.uk>
References: <Z1hNkEb13FMuDQiY@shell.armlinux.org.uk>
 <E1tL14J-006cZa-Rh@rmk-PC.armlinux.org.uk>
Message-ID: <3b9218282c34a1a0e10c4bc80a588082@arinc9.com>
X-Sender: arinc.unal@arinc9.com
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Tue, 10 Dec 2024 21:45:13 +0000 (UTC)
X-CM-Envelope: MS4xfJuZft709FxizpinMKGWhJhNuVkZgkBg+qc3Jglod8if95nnLuGy8biWUCFr5kuQapCfrsMBJit/W+EQFp9ExfhFRsMgaChMRyoVpzk96i1nf1hMBm0t rugRkpC2iB2Rhx0oVFDS0z98PC5IEggSkuZi1yGBZZrGG6QaW0lPwJw3+/TPoJBjnPN8FJIiWbFYzpqr6zvZOCZaK2NJ1ice5ZWKcEYuL2dPJP0it+tbzpph RLws0KOZfe7K6l2c0fCG/AmRGk6a8tpWJPX9mYEDRyArrhSB54NgYsmkl358i/wk38tMGVjqZeQIqIVFQhGUPIkP1LC1vfQ7M/zzRUIfPH7eziiUHLPn5kxg esfFq2hvhZp4mvqTHBnZTAf6SIw+4gt46hj2v0GGnhj0rHEMkFeYzDLGTL/Rwn5CKE7w3FYyrLzmTiG7dwJVt+QHVPNrl2e1y0TuKAfxlrSRkvuoT2swX5/R /2NMOPKxL9K11wsaSyml7zlKsITYEAd3AFagiW22SJoHX7sId2VkShlIZ5W+SxrBqDtGcGuVGR15bq3SW5Vm0XSS3s/Z2gYJ8FIOx6c9xZK49JWpGMg4zMS6 sap06jaGyY5vfJ3H4/Z4k2753n/XA0KWv24Fco4jgykckekYj3KbZ11QscrsAjiNCu/2UDmzx+pUxNyh0xxUt9uwTLkT2W7pa5mz/FaW4Z2LObtLEyb5z+/B vbZk8/Bc7qfud57FqoYsdIfA1QPV7fPZ/9KfEynUMNA+qTdmoYEUQp3XuyG6m8SaS4tzzu77sGtlBDcHUx/7/WaodcYWan1mZq2AtoznQ+Lj19n29yHcl6qS wD9NPfzszGRKDim4sx2h1A80/sWxdKlw19iv3smG3G2N42iXzypaYyqZ8qoyVw==
X-CM-Analysis: v=2.4 cv=K9lwHDWI c=1 sm=1 tr=0 ts=6758b66a a=5MOetqiP25nozuSVG0c2+A==:117 a=5MOetqiP25nozuSVG0c2+A==:17 a=IkcTkHD0fZMA:10 a=PHq6YzTAAAAA:8 a=GvHEsTVZAAAA:8 a=1IKdRoJznwPGE5zMZgQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=THfFRngN91AA:10 a=ZKzU8r6zoKMcqsNulkmm:22 a=aajZ2D0djhd3YR65f-bR:22
X-AuthUser: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_220528_738429_04951000 
X-CRM114-Status: UNSURE (   3.31  )
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

On 2024-12-10 16:18, Russell King (Oracle) wrote:
> Implement the .support_eee() method by using the generic helper as all
> user ports support EEE.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Much love.

Arınç

