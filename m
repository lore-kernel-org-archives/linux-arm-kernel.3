Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DF5C9833D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 14:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+0U5OPzlpccz9EfIO0qUyCoXFW1VvJ0arF3ndJw5Wo=; b=c5lKMjhApK+Ck1XyoaiJ/2SnRc
	TuDNx8N1nJdtwWYx880oZdOsubfmQHuxPegSX6Ay7w7R0YCB9lfZYQItY5xQP/yPHDntCG1NfiCt5
	DwKrjIwTQAPY7h6Tywa84WMGDNSlG3Sbpzp6uM/3hyxb1DenjCZ4rGKRvUXjOJGJkcv86Ovme85Ue
	dbBstvLzLa1c6ll+lU3vdVDTpJwDEvL72xKfwOO8va6lYT8gNy3LY6ikW4xTNjA02yWfpCuRCufnQ
	HdYNBgmBbalpWhBxLHV/A8BrxEIJQ0b0PQa7zYoho8/PtIhqbWYVvAt16Q1Pf4YkBAFkdbY927G5k
	SO6oYeXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATnA-0000000FYSw-0TPw;
	Sat, 26 Sep 2026 14:54:20 +0000
Received: from lighthouse.enpas.org ([46.38.232.102] helo=mail.enpas.org)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATn7-0000000FYSQ-1bA8;
	Sat, 26 Sep 2026 14:54:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.enpas.org (Postfix) with ESMTPSA id 61B2F104F78;
	Sat, 26 Sep 2026 14:54:04 +0000 (UTC)
Message-ID: <93a9dbca-4f3b-4b01-8e07-1dbc7035a96d@enpas.org>
Date: Sat, 26 Sep 2026 23:53:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Max Staudt <max@enpas.org>
Subject: Re: [PATCH v6 1/3] can: at91_can: release the rx-offload on teardown
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol
 <mailhol@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Heiko Stuebner <heiko@sntech.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Thomas Kopp <thomas.kopp@microchip.com>, Ming Yu <tmyu0@nuvoton.com>
Cc: kernel@pengutronix.de, linux-can@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>,
 imx@lists.linux.dev, Haibo Chen <haibo.chen@nxp.com>,
 Enric Balletbo <eballetb@redhat.com>
References: <20260925144558.2909639-1-ciprianmarian.costea@oss.nxp.com>
 <20260925144558.2909639-2-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US
In-Reply-To: <20260925144558.2909639-2-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_075417_577292_A0BFD4F7 
X-CRM114-Status: UNSURE (   3.65  )
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

This is not my driver, but the patch looks reasonable to me. While we 
wait for someone else's proper review, let's call it


Acked-by: Max Staudt <max@enpas.org>


Thank you!


