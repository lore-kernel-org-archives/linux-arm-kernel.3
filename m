Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0694ACCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+vA4VA3wcmg6yTImrxLCggMqdpiPLMzpNBuNEaeZ7I=; b=2tO0Dl8MHtZaI5nVVqkZcR2HYz
	jEkdJ0lEgbR4CH2th+r6XxOuD3y6xaTVCwuknrcXpk+dYozJVE1jBNmVioX8C8TPebeB93PaHW1Ie
	OeLpyJSExLgUyJUCbDODbmhf9lxxe/pJkiQ7h+qYDMCe4iOvICATBGP84GB2+veq1JgKX5iEI6SO8
	SXoEC+mLRJJ0wzqvH8u/uD6nEWITqCCxKrKGDu/BM92Fy9RRuIJ8kyJvwDjhsmw7rF4jG/QD3Qrtq
	leRrLguMLb4Kbz7nA5pobwhJwz4thLpDRb/j06yujAtYZtO+YRUAXV6+cxiIwTPrhcxE7vvv6KlMp
	W8c/+MPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfq-00000008VBG-2mVx;
	Fri, 17 Oct 2025 16:51:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfj-00000008V5b-3e5c
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 16:51:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=k+vA4VA3wcmg6yTImrxLCggMqdpiPLMzpNBuNEaeZ7I=; b=g9LqkO87T5YBXSJ7amQvkWSJDf
	3XRl/bC5oTnsnYVvZQyV55omj7T/Gi/5pheA52bc/A+zrMx0P8cr7y0cig5OKDwtHp/OBMnCaPdeK
	ZPxoA/aZKAl5lW/T1OVXoxFJ4yzoKA5x9PKB2MpaZDNlxgOfZdikHyqXpmM6N1GqOK+Q4eAOXXyzC
	u4qSPhkDBcyOzN27oDQp5FhChyR27hJO5s81ux/JVAfrrY1AM0BtZ7cZ1Yw2WB53BbiGad+SNvQ4y
	GePofA9J535qqGxLUMYpCZQbutnZeBVW0+mOPiTu5qvtiqhuBTHswIfjiXuKGRh6iGeiqFzDYZBQz
	wTSzEg4A==;
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfg-00000007mmK-27NR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:51:18 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cp9nY4kYTz9t0n;
	Fri, 17 Oct 2025 18:51:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k+vA4VA3wcmg6yTImrxLCggMqdpiPLMzpNBuNEaeZ7I=;
	b=VzJzrDRZkioCyWM9BTCDR/H+WlVp/vuSwErX3QlP53vW+pcPv1ngnvKDufQRqOrCS+bGKP
	dcOxAWGAcpEeb7twE8JxHQTpeJne8uX0Snb3jtzoTO9FngTUjgIpxZJ56Uj6HRL04QWMFP
	TPhIj2CWfzeJdoPHO1yjpphm41zMf2BFTUds9NZDCkaDTAgz2AAZ/ATdKpfiDEEPKsAZr/
	xYfLuuBy9bB18Oyvd4EDXc+S7rd+DT5S1McuAXHJdMgnyp5nGuddSR9stu7/6tsacRHfvX
	MA1nBX6svQ13G0q/TGeJkt9tArCx2jmSRMqg/o6CoNcIreyc7BxRWFW7NWV7Iw==
Message-ID: <14e7e6e2-c4d8-4d8f-bfdf-81d78c4a4a9f@mailbox.org>
Date: Fri, 17 Oct 2025 17:49:40 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 31/39] dt-bindings: clock: Split support for i.MX95 LVDS
 CSR
To: Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-32-marek.vasut@mailbox.org>
 <aO1QMD6e1Wx+/hFP@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1QMD6e1Wx+/hFP@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: b1cbc6cd40a0cc186ef
X-MBO-RS-META: fxhqboiagin4cddoh4t8gtmp8shoygpn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_175116_657650_F56CDFEF 
X-CRM114-Status: UNSURE (   5.60  )
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

On 10/13/25 9:17 PM, Frank Li wrote:

Hello Frank,

[...]

>> +  "^phy@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
> 
> Is it standard phy interface? need phy-cells

It is drivers/gpu/drm/bridge/fsl-ldb.c .

It is LVDS PHY, but modeled as a bridge driver.

The rest is fixed, thanks !

