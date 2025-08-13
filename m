Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8304BCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 10:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7UbX7wwdujFeV96LuYWTurrjLvi+YelqhVDF3Pcf00=; b=37pT6GNO0KowtI9tFtXQLvYtZM
	1MgVcq8QLJcUPCxpzI6JUYU1Op40xaofODAFJPPC5JYmiQnRwbDuL1ADQ+6dnEQcNlW81dxBijdbF
	zRNDLUFYfbpvJiXD/RGRFv0UhsfZVtW7kAxdWJUkoHqzcogCR0INCiqsNWR9iojFWaFekcBtwIiTW
	PaGBeS6ftikgdrw+s/rl9NVmkrvLRufIiLij7K8itVHpdZ/5SXH39jKSdaspv5ZXKzCUb4AnRf/yx
	+ubHbwRmiqpwjAJPWgqnNub7doZreNL0lmt9Dz8Z0meq0u7ho/dRuDM94iJk+CiRTiSOHmiyon+C1
	u1PZj0FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um98E-0000000DRIQ-2ZX4;
	Wed, 13 Aug 2025 10:54:58 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8O2-0000000DKCG-0PFR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 10:07:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53C3243AEB;
	Wed, 13 Aug 2025 10:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755079631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G7UbX7wwdujFeV96LuYWTurrjLvi+YelqhVDF3Pcf00=;
	b=nhYc/d25atOCsZxnP1BEo73b0xDSNGkU898413PEZDQFCUgi/jl+A+7JH7vH20jh8/YOjs
	LdM1LNR+kiCqf0IvpJqxUZkxJACTkn9jRgelrng9Z4lSbWhOhBT8M9hiX/rzjkFWTDgb/X
	4N1EBLUBy8awRI84adTQSYNt+C2WnIZK7j+Ke50aNfBW4B8fjN0fTC6G4nyqAs+OgPZBht
	jywA83eeqdf2xFxU+Uyb3XGkSHC6HfhyiVBgbI6EQ/dZSN9G2DnURreLuaGIYlMGkmjcXi
	a0GWFTA2Ud24urjwlyzV/l78wWOVNxtF+xNzE+mQIwSIxEyqgK0CM1ArFj2qFg==
Date: Wed, 13 Aug 2025 12:07:08 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 4/4] ASoc: fsl: fsl_qmc_audio: Drop struct
 qmc_dai_chan
Message-ID: <20250813120708.7d0303b7@bootlin.com>
In-Reply-To: <0e73d47d15cf38ad5c4c35fbab545153829dde75.1754993232.git.christophe.leroy@csgroup.eu>
References: <cover.1754993232.git.christophe.leroy@csgroup.eu>
 <0e73d47d15cf38ad5c4c35fbab545153829dde75.1754993232.git.christophe.leroy@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeejleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemtggstdekmeelkeeltgemkedttddtmehfugekudemleehgegvmedvudehrgemfeeluddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdtkeemleeklegtmeektddttdemfhgukedumeelheegvgemvdduhegrmeefledutddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepqhhirghnghdriihhrghosehngihprdgtohhmpdhrtghpthhtohepshhhvghnghhjihhurdifrghnghesghhmrghilhdrtghomhdprhgtphhtthhop
 egiihhusghordfnvggvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitgholhgvohhtshhukhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_030714_262039_CE7ABC23 
X-CRM114-Status: UNSURE (   9.29  )
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

Hi Christophe,

On Tue, 12 Aug 2025 12:50:58 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> prtd_tx and prtd_rx members are not used anymore and only qmc_chan
> member remains so struct qmc_dai_chan has become pointless.
> 
> Use qmc_chan directly and drop struct qmc_dai_chan.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: New
> ---
>  sound/soc/fsl/fsl_qmc_audio.c | 50 +++++++++++++----------------------
>  1 file changed, 19 insertions(+), 31 deletions(-)

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

