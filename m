Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BBBCF857E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 10:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7b7g7jzmb3QO9iZiIJeiMx4p/PHQHaZ1A3diXPbujlY=; b=s5RAp8zkOArMtCHytti2xhvloe
	ea4S+GEP28W5tdZRRreumvZ5FJVLdSupxRC2yPivyw1rWtIdvCbiQSAWOfZoLgCET0IBZWLwVHszr
	ziLBAp2ua+Wq9YGnvG/JGmWAgxKVSR0Ycd1GoBK4Etj0Dm1NJueQ+IXIKZtuduHbl7g8k5Gpbt4Le
	O3VUVdzlTdMJYDIf6zUDvptDkP3Nt9ak7uUoHJM0Wxbuq308rzFoDQF+MiYI+N8p+9QS3qWTDJl76
	ZeuxxH1zVJC6dZ4qyOgd9h/7esM/jZBVQtuVHJPI1ug8eqV7x36l5vGe8zVdrFGbphGr/WfQCvEFp
	OhpNb+fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1k1-00000006V3t-0KBZ;
	Thu, 20 Nov 2025 10:18:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1jy-00000006V2n-0Mc9;
	Thu, 20 Nov 2025 10:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763633891;
	bh=N9v693C71p7JFwlB4qoGB1WvggPJvzKD5CU0K6//7i4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gn98WaMM5MoHPf+shmYmSr8cHZgiATwbYAeZOBC3+f/lhjCCiQjtPdqiShfvUQvjy
	 LdllZp3crc/xo+LwVTnX5mRkpRCxxAbwEoD8qbs7j78T1H7hlf5sUeL3uinfzc56L/
	 HiYZyIkxzUSfrlb7YAPRaDYcPh1nNchBgau2PvBxmNtYChFeIthfhFtbYZEYyLo3c3
	 X3fr4/uKTz35U+l7464qfH7Lx1SiMpLBrQmdzUYJts2VwSUCiYY8H3uDjkvjCgBEbr
	 YThhlG/v1vnGwsUeWl+HeV/Ke1k4qaxIeDZYsMVAW5A21gxv02mVKxIxYu5kfJgM/Y
	 0lF9pwkxNnzjA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7887C17E0CA1;
	Thu, 20 Nov 2025 11:18:11 +0100 (CET)
Message-ID: <15bf444c-0eff-4856-93a4-764668666c3c@collabora.com>
Date: Thu, 20 Nov 2025 11:18:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] spi: airoha-snfi: en7523: workaround flash
 damaging if UART_TXD was short to GND
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>
References: <20251120042753.640492-1-mikhail.kshevetskiy@iopsys.eu>
 <20251120042753.640492-2-mikhail.kshevetskiy@iopsys.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251120042753.640492-2-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_021814_276719_46DD5902 
X-CRM114-Status: GOOD (  11.83  )
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

Il 20/11/25 05:27, Mikhail Kshevetskiy ha scritto:
> We found that some serial console may pull TX line to GROUND during board
> boot time. Airoha uses TX line as one of it's BOOT pins. This will lead
> to booting in RESERVED boot mode.
> 
> It was found that some flashes operates incorrectly in RESERVED mode.
> Micron and Skyhigh flashes are definitely affected by the issue,
> Winbond flashes are NOT affected.
> 
> Details:
> --------
> DMA reading of odd pages on affected flashes operates incorrectly. Page
> reading offset (start of the page) on hardware level is replaced by 0x10.
> Thus results in incorrect data reading. Usage of UBI make things even
> worse. Any attempt to access UBI leads to ubi damaging. As result OS loading
> becomes impossible.
> 
> Non-DMA reading is OK.
> 
> This patch detects booting in reserved mode, turn off DMA and print big
> fat warning.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

This is important enough to get a Fixes tag.

Please resend with the appropriate one, after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



