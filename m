Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5693BD49209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 10:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zzh7nhip7P2NRDANsFNZDjlxnLfwoqac2YOb0mHrdHE=; b=c7Qbp6OI2GQpn7gd/rmHnKTt0c
	kLjBLyzdR/dFB+IfmkkPYRUQ1ZP1QeSO6sc9dscrx+ph9C6pKZ+18PswowrQnAnnt9CfoYhG7IK3N
	PpN+0CKEWZj8M1LtxDTm/Um2U6iaZoGFe130joe8wI9NloaFu5U1FmTzYQyZ5vOu2kbKTDMB1cmIK
	aDPi9qF7zuA7rVk06beEAKInE9wSTzUJjpCDQ4qep7TVSDRaskMo87LjD955Ndk7VPfMR0YwDcmqm
	JfA/wKGIa/oEdvBckpYlIg1UOrrifbcoT81i0Ew83TorIeRF4dJgZgROzxP/Ro9SpnGO/09xosu74
	lAqDV6Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCzR1-00000009ARq-1On4;
	Mon, 18 Nov 2024 10:56:47 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCzQ0-00000009ACy-0dHb;
	Mon, 18 Nov 2024 10:55:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30A776000A;
	Mon, 18 Nov 2024 10:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731927341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zzh7nhip7P2NRDANsFNZDjlxnLfwoqac2YOb0mHrdHE=;
	b=c+jy871sogY634JgCb022cxm3ui6nnQ+VW/olbgb8aXdgl/d4PenzcP8SjJImE+H2rCp94
	qhmv2swkL2b7rdpqSEntQaEs1jzIbpsyx7URkUek3or0FUBckUKuTVxTCRkg5XrEVjOPnE
	dXNXvLy3wnoIKgNi9mbnYYlxOSg8uyUN8QpETTxHTzc+A6lYfk5p3bSk0/oAuv/SM/8tSx
	lZp6Q8r8m2Idpk/WKr/vHf+J50DGAcOJyby0dKd2em3ATkN7rqnTEozLpEIktf2D3DtycP
	KpR5bTCFxAjv0lkkDITe6G1kOb4WbOzmXgp/r3g+yyJaI3IpXhvc1cNBvjWoAA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Daniel Golle
 <daniel@makrotopia.org>,  Chia-Lin Kao <acelan.kao@canonical.com>,  "Mika
 Westerberg" <mika.westerberg@linux.intel.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-mediatek@lists.infradead.org>,  Steven Liu
 <Steven.Liu@mediatek.com>
Subject: Re: [RFC PATCH nand/next 1/4] mtd: nand: Create param.c to do CRC
 check and bitwise majority for Parameter & CASN page
In-Reply-To: <20241020132722.20565-2-SkyLake.Huang@mediatek.com> (Sky Huang's
	message of "Sun, 20 Oct 2024 21:27:19 +0800")
References: <20241020132722.20565-1-SkyLake.Huang@mediatek.com>
	<20241020132722.20565-2-SkyLake.Huang@mediatek.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 18 Nov 2024 11:55:39 +0100
Message-ID: <87bjyczu8k.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_025544_334513_19924352 
X-CRM114-Status: UNSURE (   7.85  )
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

On 20/10/2024 at 21:27:19 +08, Sky Huang <SkyLake.Huang@mediatek.com> wrote:

> From: "Sky.Huang" <skylake.huang@mediatek.com>
>
> Create drivers/mtd/nand/param.c so ONFI parameter page & CASN page
> can both use nanddev_crc16() and nanddev_bit_wise_majority() directly
> like this:
> * For ONFI Parameter page:
> onfi_crc16() -> nanddev_crc16()
> * For CASN page: nanddev_crc16()
>
> nanddev_bit_wise_majority() is same as nand_bit_wise_majority().

Please use the same nanddev_ prefix.

> nanddev_crc16() is same as onfi_crc16(). But there are lots of
> onfi_crc16() call, so keep onfi_crc16() there and hook it to
> nanddev_crc16().
>
> Signed-off-by: Sky Huang <skylake.huang@mediatek.com>

Thanks,
Miqu=C3=A8l

