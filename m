Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CCDCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 23:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKZoc/t0PE0oCMMYE9oz7Kdp/2JdHrUYbcnC4UFkaB8=; b=m5PrKGISX+isgtU1mmH0yibzgm
	RJGuyr9WiMc/DpXDzjGmOSoezWO7ONzCv9Y3YTbwzNcYAMvLTYrUaKlAt5UQBFbP+5fY1IKiiLsFp
	0zrc51RwLq85Flq5OaIrovm6nha5xu1XuNj8r9qNio94DjqbqRCqrso5YXR1hlty62M55z/XxXTta
	anfrHiPpQACQElZtf4BdQ3BB69OQuXfeEYE8F0ofQRzI5qfw57TJF2HrvSjtjCJcJ3mfeHJYTQ5Ty
	HJmlrqHxLvD5D6A6zKvr8wxMs1gq9/7az2CEYPL3oN5WNsAC/renGsomR9jCbKQVuaLLZDSAstagS
	mgg2hqEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG3fC-0000000AlUA-2PXb;
	Mon, 03 Nov 2025 23:08:38 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG3f9-0000000AlTe-3VxX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 23:08:37 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d0nM20TShz9t8t;
	Tue,  4 Nov 2025 00:08:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762211310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SKZoc/t0PE0oCMMYE9oz7Kdp/2JdHrUYbcnC4UFkaB8=;
	b=mR83v1DWriew9VA6CcS7tSK/+AP1IWL1aBt1E65A2HXo9X43fmU3Nm49MJDWrlLQBl+WuL
	SGRZkKJTgyLFpIJMUh3BSXZdW6qUI4k8sJEtDUKix1AIItiN9355NiSJ71ybcy/69TBdzC
	Zfm2N25O40+Z9klqYcqGV2Ugh5Rg1hWMWuSbsayChAwBgsqLNIEsv3zMBMxGx8ig4I4yEw
	UtBhUR4Ff71Q8zx6k8bXVjmWYCskhSfIt2d5414AdcWw82zO+5zmU1ppU+6aqwJjCpn4uc
	U1YnoqWjWZRAeNvDefitM1HOmnLG8P1AY7vYiQoadqGGxZYUC8d2KODnnAoJIQ==
Message-ID: <25cd3b11-8417-44d3-af28-fa73419c713b@mailbox.org>
Date: Tue, 4 Nov 2025 00:08:25 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/bridge: fsl-ldb: Parse register offsets from DT
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251102170257.65491-1-marek.vasut@mailbox.org>
 <DDZ6KCUVYB55.330X4X5ETRXR3@bootlin.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <DDZ6KCUVYB55.330X4X5ETRXR3@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: e65bffa8f787aa60cf0
X-MBO-RS-META: ou9okzkmkj3oek4quigbzefj9mhbi5k1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_150836_030465_9F7C8809 
X-CRM114-Status: GOOD (  28.56  )
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

On 11/3/25 4:55 PM, Luca Ceresoli wrote:

Hello Luca,

> On Sun Nov 2, 2025 at 6:02 PM CET, Marek Vasut wrote:
>> The DT binding for this bridge describe register offsets for the LDB,
>> parse the register offsets from DT instead of hard-coding them in the
>> driver. No functional change.
>>
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> 
> I was initially a bit skeptical because normally register offsets are
> derived from the compatible string, not from device tree. But then I
> realized this is about the LDB which has its two registers in the
> MEDIA_BLK. This means all in all this looks somewhat like an integration
> aspect (the LDB component uses two resources of the MEDIA_CLK component)
> and your patch mekse sense.
> 
> So my only remark is that the above may be in the commit message, to make
> the "why" clear from the beginning. It took a bit of research for me to
> find out.

Actually, the LDB was always meant to parse the 'reg' offsets out of the 
DT, it then went somewhat ... wrong ... and we ended up with hard-coded 
reg<->compatible mapping. It was never intended to be that way. That is 
all there is to it, there isn't any deeper reason behind it.

What would you add into the commit message ?

> Laurentiu's patch adding i.MX94 support will conflict with this
> one. Whichever gets applied after the other will have to be adapted
> accordingly.

It would be good to clean this driver up before we add more functionality.

> [0] https://lore.kernel.org/dri-devel/20251103-dcif-upstreaming-v6-3-76fcecfda919@oss.nxp.com/
> 
>> @@ -309,6 +302,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>>   	fsl_ldb->dev = &pdev->dev;
>>   	fsl_ldb->bridge.of_node = dev->of_node;
>>
>> +	/* No "reg-names" property likely means single-register LDB */
> 
> Uh? If it is "likely" it means we are not sure this code is not introducing
> regressions, and that would be bad.

I can drop the 'likely' part.

>> +	idx = of_property_match_string(dev->of_node, "reg-names", "ldb");
>> +	if (idx < 0) {
>> +		fsl_ldb->single_ctrl_reg = true;
>> +		idx = 0;
>> +	}
> 
>  From the bindings I understand that having two 'reg' values and no
> 'reg-names' at all is legal. Your patch implies differently. Who's right
> here?
I think if you have two two reg values, you should have reg-names , so 
the binding should be updated ?

