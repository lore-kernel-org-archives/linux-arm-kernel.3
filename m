Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102D4D597AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 21:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNcgNPQUS5w0e2xKLQNX2Q32FCLJRV3b3KQ0eTd0R5k=; b=U7OM8/os34RCEvTwaBmkFIuyOo
	pFq9FrXkHsZJtnfHCuRHRR2mb0IcnY6mK0DwsN4XheaLJRvtfhocWtg+cpWczqr2CQdFkfcrwIoDT
	CuMytLAV6d7d8hCRFkE1MBEO7p2gDCaej9Csbw3vA/Hkpfqnzlll68KqY581Q2Z5MqxlhvtFC6/2J
	+1Mx0KkLh/R+X9xIR/bocmCnMyA8w5BK5Um2GP3zmQZF7bfxQ/lD7XcSCeE9vpdkdFY34AUd3fV7s
	Q/ClhGtra+a7p2RvEAs69jWs9r2gjpmkiQfT+VyjYGVP9MLdKbhpLxcHC7WrPud52pddgwkegSiio
	5L0I5h4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAyt8-000000054us-2PcZ;
	Tue, 12 Nov 2024 21:57:30 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAypa-000000054T4-2Vgr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 21:53:52 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 248EB894B2;
	Tue, 12 Nov 2024 22:53:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731448427;
	bh=pNcgNPQUS5w0e2xKLQNX2Q32FCLJRV3b3KQ0eTd0R5k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=quIs6HjEPhWbHZZO5Fd0JVWw1y6YB8bAEzDt8tGe+NJuQNCS6lFXVGmzSTlGie/dD
	 Aw7u6x7DNAO2JMpLJU3hMsYz3SGP5KJUW5QTjPTKScP4e6WSpw7pgopn1rtihPiR2a
	 sqSCcVNR+REIoEsFApgikIteur/9Phrc7SwC2p5Tiv8kIS8a3cdla6WFlkC14TP9LX
	 EcaupzPEX71WNKHgHBILE/4leawvI+jYM8gOb1b6vd7+MZiAGlEsvEYwZz9Npv+sL7
	 Q5T2t5tksanbPr6RCIEaUoqewzJu79OtjKRoBA/hX+L1WR+YH8Ohvm5VBf7f0g4Lr0
	 m028EPCXj75eA==
Message-ID: <0a62d3b7-b435-40cf-9795-2fb4ea80a693@denx.de>
Date: Tue, 12 Nov 2024 22:27:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: imx: pll14xx: Extend dynamic rates support to
 PLL1416x
To: Liu Ying <victor.liu@nxp.com>, linux-clk@vger.kernel.org
Cc: Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20241111214516.208820-1-marex@denx.de>
 <e58af9fa-f1b2-4d1b-8ca3-d256a7dee4ec@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <e58af9fa-f1b2-4d1b-8ca3-d256a7dee4ec@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_135350_838323_F5BA2C5D 
X-CRM114-Status: GOOD (  16.74  )
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

On 11/12/24 4:26 AM, Liu Ying wrote:
> On 11/12/2024, Marek Vasut wrote:
>> The pll1416x PLL so far only supports rates from a rate table passed
>> during initialization. Calculating PLL settings dynamically helps in
>> case e.g. multiple video outputs are used and they each need their own
>> separate source of accurate pixel clock on i.MX8MP. In that case, e.g.
>> PLL1416x PLL3 can be used as another Video PLL for another output.
> 
> Just want to point out that i.MX8MP audio AXI clock is supposed to be
> derived from PLL3 to run at 600MHz in nominal mode(i.MX8MP data sheet
> specifies that rate).  So, if a particular i.MX8MP system doesn't use
> audio, PLL3 can be a free clock source to be used by an i.MX8MP display
> pipeline, otherwise, video_pll1_out is supposed to be shared by i.MX8MP
> MIPI DSI and LVDS display pipelines.

In the end, I started using Audio PLL and Video PLL PLL1443x for 
accurate pixel clock generation and PLL3 to feed CLKOUTn where the less 
accurate PLL3 PLL1416x is just fine.

With the disparate display requirements, sharing one Video PLL for 
multiple outputs like DSI and LVDS is unrealistic. (maybe the next SoC 
should have some nice PLL per display output)

> Currently, IMX8MP_CLK_AUDIO_AXI_SRC's parent is assigned to
> IMX8MP_SYS_PLL1_800M in imx8mp.dtsi.  Although it's rate is assigned
> to 600MHz, the actual rate is 400MHz according to clk_summary because
> the divider cannot find a ratio to reach 600MHz from the clock source
> running at 800MHz.  Looking at imx8mp_audio_axi_sels[], sys_pll3_out
> is the only free/appropriate clock source that can derive 600MHz audio
> AXI clock from.  Maybe, someone will change IMX8MP_CLK_AUDIO_AXI_SRC's
> parent to IMX8MP_SYS_PLL3_OUT ?
Is the 400 MHz sufficient for audio-axi or does it have some negative 
performance impact ? If the later, better send a patch to use PLL3 for 
audio-axi .

Thanks !

