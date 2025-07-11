Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6248C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 09:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Y8yX5xQMywwx2BGoeeybXxG1RrCPIPIZg9LEWNi+Ro=; b=2SGcIq/gHWblL+mc647C1w4Z8d
	ifeuPeLs3cLBgslYaU2XaxSpen4GW+Hm9MDGVWB/etFO/Cz9jEm1yio0yyNDEGW1TOrF2NVGW9+iW
	Wg9WiYGfTf/g6WZnIkzXRNPsg2GSrZa6AQ7TO8BA9E3sc46gN75vhlsX+OSXb9wEHb/B1ZmaPNk38
	eoRaFsVJM33WGZ3imlVRvwH15JllIMirvGzRiZAHr4p0n/6oYGE+lJYSq890jGafzzbG/ElkBeGHX
	FrVTvCGw2UMgMZGeDFKoK12NyPShTfWXd4PEx6cDfBjrYj4hWIPviewdtPQZeRJcEx2GNoH806tkG
	DI03KCwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaA6D-0000000EJdN-1ECB;
	Fri, 11 Jul 2025 09:31:21 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9Bu-0000000E9kJ-1ifQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 08:33:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=8Y8yX5xQMywwx2BGoeeybXxG1RrCPIPIZg9LEWNi+Ro=;
	b=mKdXnCiZUf47xRIbDuBBOxjfsin0f++eakr7LNJiHSWmspHUYDLbebDA0qS/kL
	RbCf5oo/221nhX+1BHS8NfcT0SFBIuLno0YnufWl1otMcqUaXj6lSblWPEkqCdNs
	RhgMy6gZfj1MA3zVputyRAp2JE4ylScqYni8SogkboY04=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXTwYnzHBog9pTAA--.57224S3;
	Fri, 11 Jul 2025 16:32:41 +0800 (CST)
Date: Fri, 11 Jul 2025 16:32:39 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/2] bus: imx-aipstz: allow creating pdevs for child buses
Message-ID: <aHDMJ2U6H88uN6ow@dragon>
References: <20250707234628.164151-1-laurentiumihalcea111@gmail.com>
 <20250707234628.164151-2-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707234628.164151-2-laurentiumihalcea111@gmail.com>
X-CM-TRANSID: Ms8vCgDXTwYnzHBog9pTAA--.57224S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFWfur4xXF13Gr48GF4xXrb_yoWkurgE9r
	10qFWkCr1rKwn3K3Zayr13urW093yUZFZ8Jr4vqrZIqa43tr9rJrs09r93ZF1UuFs7ZryU
	Jwnrtw4Y9r45ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8HUDJUUUUU==
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBmHZWhwjvrM-wAAsg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_013310_798114_0250B92D 
X-CRM114-Status: GOOD (  12.07  )
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

On Mon, Jul 07, 2025 at 07:46:27PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> devm_of_platform_populate() passes a NULL as the bus OF match table
> to the underlying of_platform_populate(), meaning child bus devices
> of the AIPSTZ bridge will not have its children devices created. Since
> some SoCs (e.g. i.MX8MP) use this particular setup (e.g. SPBA bus, which
> is a child of AIPSTZ5 and has multiple child nodes), the driver needs to
> support it.
> 
> Therefore, replace devm_of_platform_populate() with of_platform_populate()
> and pass a reference to the bus OF match table to it. For now, the only
> possible child buses are simple buses.
> 
> Since the usage of devres is dropped, the complementary operation of
> of_platform_populate() needs to be called during the driver's removal.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Fixes: 796cba2dd4d9 ("bus: add driver for IMX AIPSTZ bridge")
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Closes: https://lore.kernel.org/lkml/5029548.31r3eYUQgx@steina-w/#t

Applied this one, thanks!


