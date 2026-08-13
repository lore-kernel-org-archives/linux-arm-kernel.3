Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97392C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 17:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kz+jvI32wPERrbL870TVMeN4G7K9bL5RJ1JKWoZA1Q=; b=GoOTRo7BTYJQai
	IrdrWQ1+lJne/kVAaP8aCffFOhORbk/TnpGiJago9KcsHUzyG1x2hZJJXS8lI9Hl2Q38E4ZhGxxO/
	+wBwOW5LD0HngdAPLbz1wIYYvojnsv0qVlQtUJAFYSor9JshzOwJcSlU3GWa9s0oBbnHFF7AfNGu1
	zh6hgUiyPOC4zlEV+yKaOe9n+c1jIpw44ZPAILU4dIbArm2IXA4FTOZFqB2nh7Zrm/C1N60Qdp0ow
	rJjTGI9S9F60UbAzdsGt79dZ9MNYbguFTGfL5drqCHn0QIdCpruRZR5NKcqToFcOVpBIBdMkVg1oi
	zS6UfuCAREoPi/xlQpaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZGi-00000001IMb-079n;
	Thu, 13 Aug 2026 17:31:04 +0000
Received: from ale.deltatee.com ([204.191.154.188])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZGg-00000001ILy-1AMg;
	Thu, 13 Aug 2026 17:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=9kz+jvI32wPERrbL870TVMeN4G7K9bL5RJ1JKWoZA1Q=; b=BrKU/2d1rri5u9vmgacwHn1MUI
	ZHpp0GTxVHpY8teh3yMHnFNG1J2YK/+OR2P641SXEh/9xOhAsGzmWrdPYKr1TyHQFIAWs8Wv0N2z4
	PdKTylS+hQFqrZkg8asEh4M5ashON/XmnNl3rnu/VxcIUxQkFTqqC50w+6+fbUD/kR3FUxDrRVze8
	+NXhu0EYOxSfpxfHKSK4Hs32KJU17r+EfCUMrZdbbEk9UTCDQFIXpFsA5GBAPaEXKyL3iqJArWxou
	L80v7g3Nno34JxU/Z3I3NRZC8FY1yzGCY6QIUaoc9DR8OQb+YptrrqBpfwBY4INCvEpebpD8r0wej
	18FOpRvw==;
Received: from s0106ac1f6bb1ecac.cg.shawcable.net ([96.51.150.74] helo=[10.0.33.8])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1wuZGC-00000002RFD-3NzV;
	Thu, 13 Aug 2026 11:30:33 -0600
Message-ID: <11f666ce-ea7f-48c7-8219-baeb04498654@deltatee.com>
Date: Thu, 13 Aug 2026 11:28:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Frank.Li@oss.nxp.com, Jacky Huang <ychuang3@nuvoton.com>,
 Shan-Chun Hung <schung@nuvoton.com>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Binbin Zhou <zhoubinbin@loongson.cn>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 =?UTF-8?Q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Viresh Kumar <vireshk@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Kelvin Cao <kelvin.cao@microchip.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-trace-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev,
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
References: <20260812-dma-chan_dev-rename-v1-0-a67131f7d5c2@nxp.com>
 <20260812-dma-chan_dev-rename-v1-1-a67131f7d5c2@nxp.com>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <20260812-dma-chan_dev-rename-v1-1-a67131f7d5c2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 96.51.150.74
X-SA-Exim-Rcpt-To: Frank.Li@oss.nxp.com, ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org, Frank.Li@kernel.org, paul@crapouillou.net, Eugeniy.Paltsev@synopsys.com, andriy.shevchenko@linux.intel.com, zhoubinbin@loongson.cn, patrice.chotard@foss.st.com, amelie.delaunay@foss.st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, thierry.reding@kernel.org, jonathanh@nvidia.com, ludovic.desroches@microchip.com, vireshk@kernel.org, keguang.zhang@gmail.com, afaerber@suse.de, mani@kernel.org, daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, kelvin.cao@microchip.com, ldewangan@nvidia.com, vigneshr@ti.com, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-trace-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev, imx@lists.linux.dev, Frank.Li@nxp.com
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH 1/2] dmaengine: use dma_chan_name() helper to get
 per-channel device name
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_103102_395171_1938BCC8 
X-CRM114-Status: UNSURE (   8.51  )
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



On 2026-08-12 3:24 p.m., Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Use the existing dma_chan_name() helper to obtain the per-channel device
> name instead of open-coding: dev_name(chan->dev->device) /
> dev_name(chan2dev())
> 
> Simplify the code and improve consistency.
> 
> No functional change intended.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Makes sense to me.

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>



