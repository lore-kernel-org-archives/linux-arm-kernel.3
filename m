Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92837C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 10:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIZpZklImMTtkGdAhdc3IXQa7tmz4JmMC0DpZWtpmFQ=; b=cP4jbtenv1gS8LzhiWEXk5TI4L
	6GEf2kM5csH4+HlwMcW2vMarsiydLNJtLuYhVmlz3FRlxcjkwucsbh6IVAs7TJ27taWoD0QdfOoDi
	nvoLHfUZeIrEsQvYvJQxV/MKQPtc1wlZwVYyMm7/QxaKVb1TToYsa2DxBIh/6CYsKsmPoxErNk0sR
	8I4WGITkGeEi+4kSFxhukE+Gok2wq2vOwZk0HMPHirBNw/UCo7QCMZDBfTYDBq81y6vV8GMAekjcV
	MV+7gpf26y3lKpMa/uNc6+Gag3/60ofwQ3vapcuYTmycSX2g6qME0eVOwfPR8O9eHC+TJI47asyGS
	7TmQt7fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYieb-000000024uR-0evG;
	Mon, 07 Jul 2025 10:00:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiFt-0000000200u-3OOD;
	Mon, 07 Jul 2025 09:35:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751880920;
	bh=KxcW44ReYaXX/YVr1c81zqjDrt3qzOZtstbYqbhmd0A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RVrqUW/TeUiGBqU56GhCWxR6xUF9bMyVuoV9RIM2fcly3Xf6kk1UPv1ndiBzimuJy
	 kCsjio3fRjwlrLB89Iixw3UdsNpk+Sm2QlQR6xh22XGkzRUW5UsjxvW7S8LdJzi4E4
	 We5WcoLLeOaToKRzi8MEOzqyhJeAFOvDKOf/DBwcdOAL5HxeKOWUcxK15QozjharVZ
	 V8OO8AbSoaNXza/iJnHPGaTTY9wAo7XkX0gJaNWDIznjcYAQZbWnlUoetyEFz1OvWJ
	 7oJpewOJyjN8u+JXvKIk4dy1I5yC50PulWkNc+LW9nMCJ3n5IeWDRBuHHuQ/MaI80P
	 XawMBmqBF/kkA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A5B5917E07C9;
	Mon,  7 Jul 2025 11:35:18 +0200 (CEST)
Message-ID: <57398fc7-2955-4717-9868-eee16d3a00d3@collabora.com>
Date: Mon, 7 Jul 2025 11:35:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 61/80] spi: Remove redundant pm_runtime_mark_last_busy()
 calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Frank Li <Frank.Li@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>,
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Andi Shyti <andi.shyti@kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>, Michal Simek <michal.simek@amd.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075447.3221784-1-sakari.ailus@linux.intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250704075447.3221784-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_023522_000940_B0C018BC 
X-CRM114-Status: UNSURE (   7.06  )
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

Il 04/07/25 09:54, Sakari Ailus ha scritto:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>


For MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


