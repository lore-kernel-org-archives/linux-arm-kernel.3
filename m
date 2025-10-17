Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50122CCD1AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnyRJyBxqqT6Z/vke/OGUHeBh7T7CM9FTOlPeQxkIbU=; b=NP4fMOof0auxo2zYO24T4t2xbY
	uQnHRyKNIATIqKD98RW8J1Gr14ljD2Df/z07xAYViHGURJfku2WhudKB7oZBPXhou7XXrxZLfRm6W
	gfNT2AA+JP2PqZ16+VESpPtGxUCCmSXJeS5iUWBix5O1/X87Cddj/12ykCae1xddOTN8SBDBGK182
	hZNlElgSjvkscUWzE3dPz7L/POXcsCMlGK9jYLHqDq2P0tAukTKyNE1PFjPpC7O3tMIm5VK1Pc2QL
	JQNMznQRJ484dcAPEHTTFuXvk68/ptAqlAXEDONVYP+W63iFUUZxg1cLEOLpWS1cDtbpwXAYWvwc3
	lmAjF8Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfr-00000008VBf-05Sk;
	Fri, 17 Oct 2025 16:51:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfn-00000008V7j-1Pvi
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 16:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qnyRJyBxqqT6Z/vke/OGUHeBh7T7CM9FTOlPeQxkIbU=; b=aBSG0a91rd5JBLxmOnO0vfIgYT
	HQH9/FrHLSmqNrNKuyatQbQIaiC0ok4h1RCWbzTUwcCFKSghkqOZsF64/B/R1w9B2fi225NgjB9+G
	Ts6CsWui5AS9fSfitMGTG0zak/9EMvf4L+7IsVugDjnk8qkOXIFJItIkawpE2FyaKMS1sE5h93L9Z
	bZGHwXSX4rfIMseVixQ25zSq6ZBHLSEGqBLGSlwydZnvZ/YbMN/Hc0AGhOjwHAnzZurmb99fUlhMj
	EwhHD7jwNVR0LunAbK+7DoVy78PMDzkzzc6gLSDOZsBzTpe0Jx3EMCqYLS8RuJThdKRdL1qFhEgLW
	JGZOY45Q==;
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfk-00000007mnv-0m8I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:51:22 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cp9nc4Zdtz9sSq;
	Fri, 17 Oct 2025 18:51:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qnyRJyBxqqT6Z/vke/OGUHeBh7T7CM9FTOlPeQxkIbU=;
	b=F9oG5AadMHujS4rxilXnq9aHT15NPwRYd0bRa+jQjBORkZi2yiwZRFiq7dMLwqrbEgtGnF
	uVhQIpmLzP6MgJi2cdKVxACJC+lgTawa2grTfcPCTE74t1YJ3aC07XY1cLofvD7JL8HGlR
	nEP4xvjIqp+KSA1RKCDRBwm2tvHLT7AkpWoudVKprnU5DQOt4dNGoR/02HOKlT5vGX7whu
	5bYZetKhuYhZgGKCsGgQZzZLg6GR9J05mwTWHj7BK8Mw9Fi2xnkQ8B7UBiEy31GB+g55OL
	XxzpVRn74A3h2UUBT39eg38rQ1yrGrICQKFpBHU/PesyL2D7HzyJZo6KXDDN+A==
Message-ID: <85a35703-fc75-4fde-b9ca-a2ceb1214327@mailbox.org>
Date: Fri, 17 Oct 2025 17:54:41 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <2a22c45e-5de4-49ee-af3e-002941a7e2d0@nxp.com>
 <bf451620-c917-4d4a-999d-32148fbcf11b@mailbox.org>
 <182271f2-4986-4401-a4c5-ca379a02e69b@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <182271f2-4986-4401-a4c5-ca379a02e69b@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 21f322bb393c42677d5
X-MBO-RS-META: xow3qztriop681daecnza1kueomurrys
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_175120_487397_0E7D3A6B 
X-CRM114-Status: GOOD (  16.83  )
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

On 10/15/25 12:09 PM, Liu Ying wrote:

Hello Liu,

>>> This has conflicts with my in-flight patch series for adding i.MX8QXP DC
>>> prefetch engine support(though i.MX95 SoC doesn't embed any display controller
>>> prefetch engine).  You probably want to take a look at it, just a heads up.
>>>
>>> https://lore.kernel.org/all/20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com/
>>
>> Thank you for sharing that.
>>
>> Would it make sense to send 4 and 5 separately , so the fixes can land faster?
> 
> Maybe not, since there is no user(DT node is not enabled) so far.
> But I'd like to have more review/ack for that patch series(it's kind of
> hard to get sufficient review...).

I could test on the MX95 if we can somehow ... figure this out. Then I 
can provide RB/TB easily. I don't have MX8qxp device.

>> Also, could you please try and avoid the SCU dependency on patch 7 ,
>> and more in that direction , can the PRG be made a bit more optional, so the
> 
> Don't think there is any way to address them.
> 
>> iMX95 can still be supported by the DC driver ?
> 
> SCU dependency and PRG(even more other reasons) make me opt to separate
> modules for i.MX95/8qxp DCs.
SCU is only a register accessor, PRG is another block in the DC, I think 
those can be isolated. It seems the whole DC is a composition of 
multiple reusable blocks, so we can compose them for both MX8qxp and 
MX95 the right way and reuse most of the code, right ?

