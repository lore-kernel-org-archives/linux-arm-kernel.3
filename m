Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D88D68BE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 03:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mPwbXqgnl9XrwzwWBl68KnzBBVTshHswhakrqB5B24=; b=21CDJnNQ/R8S61ZIg15JsWRRPb
	6aq7CHbJ8EpgLB7eHfnA6nlEgwX4RrnRur15iJDzdOgEa5nrTiMQeb6C84kymYnLaayufAmyVkivA
	yrq4Ey4TOhZJVOTSiJlS60D41ziQDkebjybqruDj6g4rMNlApxZpmk7gepAI1MAw4xy8eiTel6edH
	eLBw4bFfajZhAW9cAVEpO+N9XkpyXkcdDX7ttj6RaosnF1AhBF3H2hzC7cd8+ecx6hy6Tj8DIzS3r
	S6xG2tdp6VONmt4RBk6VaQ7VIckdbcFhSpFeqxyKK+X9i4DLr3q3YxCf5r5rNfr18b7WM2wwK/vJp
	Bh0eTvKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC9XJ-00000004t4w-2Sae;
	Sat, 16 Nov 2024 03:31:49 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC9WO-00000004t1h-1rOh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Nov 2024 03:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=8mPwbXqgnl9XrwzwWBl68KnzBBVTshHswhakrqB5B24=;
	b=gpXgdBXa+f7hGWMWaNsXNRxZs8DVzasNtoJ5a/rJ9woAz0YHpql6I1dHQ00UZ/
	vXvgNeddwMcR1yDUPqFSB8tpcsbKIACXJcG0jaSqdszBoXcG6QM4nPV96wdUMaRz
	HQAW++oNfsyaaMxINUI/feX9m31UhnngyxesoiIVtZNM4=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAHL7rHEThnfPKpAg--.27117S3;
	Sat, 16 Nov 2024 11:30:17 +0800 (CST)
Date: Sat, 16 Nov 2024 11:30:15 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Arnd Bergmann <arnd@kernel.org>, Peng Fan <peng.fan@nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: fix i.MX build dependency
Message-ID: <ZzgRx5BdYI3yzAGb@dragon>
References: <20241115230555.2435004-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115230555.2435004-1-arnd@kernel.org>
X-CM-TRANSID: Ms8vCgAHL7rHEThnfPKpAg--.27117S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF47WFWUZFyxWw4UWr1ftFb_yoW8CF17pa
	9a9FyDCFyDJr4rJF47Ar4xX3W09a9YkrWrJF4DG3y8Zrn8ZF4kKFyvgw15XFyku3savr10
	9F48Xws8WFyqya7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jrhL8UUUUU=
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhaZZWc3+Cc7HAAAsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_193052_972470_5AC2C797 
X-CRM114-Status: GOOD (  23.10  )
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

On Sat, Nov 16, 2024 at 12:05:18AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added SCMI vendor driver references functions in the
> protocol driver but needs a Kconfig dependency to ensure it can link,
> essentially the Kconfig dependency needs to be reversed to match the
> link time dependency:
> 
> arm-linux-gnueabi-ld: sound/soc/fsl/fsl_mqs.o: in function `fsl_mqs_sm_write':
> fsl_mqs.c:(.text+0x1aa): undefined reference to `scmi_imx_misc_ctrl_set'
> arm-linux-gnueabi-ld: sound/soc/fsl/fsl_mqs.o: in function `fsl_mqs_sm_read':
> fsl_mqs.c:(.text+0x1ee): undefined reference to `scmi_imx_misc_ctrl_get'
> 
> This however only works after changing the dependency in the SND_SOC_FSL_MQS
> driver as well, which uses 'select IMX_SCMI_MISC_DRV' to turn on a
> driver it depends on. This is generally a bad idea, so the best solution
> is to change that into a dependency.
> 
> To allow the ASoC driver to keep building with the SCMI support, this
> needs to be an optional dependency that enforces the link-time
> dependency if IMX_SCMI_MISC_DRV is a loadable module but not
> depend on it if that is disabled.
> 
> Fixes: 61c9f03e22fc ("firmware: arm_scmi: Add initial support for i.MX MISC protocol")
> Fixes: 101c9023594a ("ASoC: fsl_mqs: Support accessing registers by scmi interface")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I'm not sure this is the version we want to go with in the end, without
> having read the code in detail, but the version in linux-next is clearly
> wrong in multiple ways and this is the best I could come up with so far.
> 
> If we can agree on this approach, it needs to go through the ASoC tree
> as that contains the 101c9023594a commit at the moment.

Thanks for spotting and fixing, Arnd!

Unless Peng has objection to this change, I'm good with it.

Shawn


