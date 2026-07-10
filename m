Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AA1C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 04:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jp+8+5QI95ophkzdeX5PhLSIZp16xbFMwu4QDRkzOEs=; b=fKd9EsAPca+zIqg4iwU+XC9S4x
	TxdUrQsFzslOMd8gkSdvkRLiiRiJ7Kec8+ON563iYIaMZPMpjA94vUyvLpIk5UjycOAchC4qKI5l2
	LKYA59Y3rolxTUWxlRmGHx6pQRtVrt28V6NVZYRiQp0YPKk+borWiP69e7fv2eu3an5kha5AVmx9E
	VgH9L4qTwExgf1gifRJ/N9lUJEYDiHww+8cTwY5OLTytk7cYUD5mR9p0Gn4qbhI6Y4fe7h8Bo6HPk
	Kgg2ljheUUDgxHm07u8pWXdqKefTfQEL26v5JueaFZ6em5+gEmG4Wm4o9kdm/h0rZ6mct4eG7qDuJ
	8ztiB+bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi36w-000000046l3-1Lvj;
	Fri, 10 Jul 2026 04:45:14 +0000
Received: from mail5.25mail.st ([74.50.62.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi36s-000000046kY-2smP;
	Fri, 10 Jul 2026 04:45:12 +0000
Received: from localhost (84-231-250-126.elisa-mobile.fi [84.231.250.126])
	by mail5.25mail.st (Postfix) with ESMTPSA id C8E32617B5;
	Fri, 10 Jul 2026 04:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atomide.com;
	s=25mailst; t=1783658352;
	bh=jp+8+5QI95ophkzdeX5PhLSIZp16xbFMwu4QDRkzOEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CTaihVTY3xKeYwYurPIj1PGrGR+oQrwQf6TQ4FUpfmbKGRQQH/0vBl8OOK/WUw/zr
	 +CHCGjc9WZ0h+gMjDXgKIuG0sfG5b8v/fURlsq3junjLdDh4yjLeo/E3mnyZF5ILb5
	 0L9YsyLyaxt3ROVT6g7hv2fvRb3jKJLKIJ+xGvLZkROMhpsQ6xMpDQn/A0jBZLmU4Z
	 ZO8Iro9rshL2Y66OWXG4Ngkys+C/yPaKUbK202WNo4t9V08TAI3OILwZ+ejHZzDyNG
	 eSqlieskQg4bhu+Sw3PZD6vdc9fq9daM5LBBKO5PSTb9Angg33oCQkJipqydJDwaNj
	 eyyRZriX8WpVQ==
Date: Fri, 10 Jul 2026 07:37:46 +0300
From: Tony Lindgren <tony@atomide.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Peter Korsgaard <jacmet@sunsite.dk>,
	Michal Simek <michal.simek@amd.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	bjorn.andersson@oss.qualcomm.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-omap@vger.kernel.org, linux-mips@vger.kernel.org,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	aniket.randive@oss.qualcomm.com,
	chandana.chiluveru@oss.qualcomm.com
Subject: Re: [PATCH 0/6] tty: serial: propagate errors from uart_ops.pm
 callback
Message-ID: <20260710043746.GM30058@atomide.com>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
 <ak9OPNcVAhkfxHvZ@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak9OPNcVAhkfxHvZ@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_214511_215719_C5E7E41D 
X-CRM114-Status: GOOD (  12.48  )
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

* Andy Shevchenko <andriy.shevchenko@linux.intel.com> [260709 10:38]:
> Just no, please just properly implement runtime PM. The .pm() must die completely.
> I used to have the PoC for that long time ago [1], but due to lack of time and
> other priorities it went abandoned. Also Atlassian made a brain damages move to
> limit repository to 1Gb, so I haven't able to update it for a few years.
> 
> Note, that Tony (you have him in the Cc list) did a lot for some corner cases
> with that and we still have them IIRC. Tony, do you know what is the state of
> affairs with runtime PM for UART?

The RX side of things should work for hardware that can wake up to an incoming
event. Linux for sure needs more work to properly handle the various corner case
TX wake-up of a PM runtime idled UART. I'm mostly offline until Monday though,
will check my notes for more details next week.

Regards,

Tony

> [1]: https://bitbucket.org/andy-shev/linux/branch/topic/uart/rpm-plus

