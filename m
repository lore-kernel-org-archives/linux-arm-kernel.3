Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FB1CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 15:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysY+8CHLH/16Skn1tWHViitmkNPIIbvlsVj2rL0JMwU=; b=spi3H2l7Yftt7CTC+rev95qA4v
	OjcAtH+OyTYapHqyn+M8xo5PAKmLisHewGFW6KeWvuhRuWDt1TzNlLFzpqUPGgHaVYc7WyLtuuXlD
	0UaP0P0dcpfzzGdOyyzEjpqPk2weajkWD4F1e82V0R80T0joPK1H/H4rmSj9+U2BHuNA732UXIsLZ
	ld3SHkfywUTlWbE2UbRXf30ZSFHGExuA86rzySCBqiJhXPPYNFGNSX/qnYxOqUjRXMeFx4Ojhq2MH
	jea0+R+S+oLNN2dAQ1HrPZPUFMHumsrs4Qgw5ZYU5zkJQYNwR+bD39H87wGx2KIHjZUrpAXUdLWji
	IywRV4cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waEOb-00000001TPB-2bIE;
	Thu, 18 Jun 2026 15:11:09 +0000
Received: from mail-m8143.xmail.ntesmail.com ([156.224.81.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waEOY-00000001TO6-1lDi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 15:11:08 +0000
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 42eee9502;
	Thu, 18 Jun 2026 23:10:55 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	runyu.xiao@seu.edu.cn
Subject: Re: Question: pinctrl-backed GPIO set_config and gpio_chip::can_sleep
Date: Thu, 18 Jun 2026 23:10:52 +0800
Message-Id: <20260618151052.3984665-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAD++jLmW3vgTFryRAL24x2TbgbR1tbhjw-nFFH3askoZfSibaQ@mail.gmail.com>
References: <CAD++jLmW3vgTFryRAL24x2TbgbR1tbhjw-nFFH3askoZfSibaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9edb49020703a1kunm36f35ee6a7202
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTB5LVkhMQhodGElMGUJISFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=gzs6lqpw8qXjSYqQdjgrqy4UbJUPryJIoyVGglA1ZVZcfxCG/eIUVOAVIzPb5PEX59uS0mPyTnv6o/4XjgTHf/Unef3VNBtVqrOhfLKbT1oN8HKDRFW0BZYcDIX/q4WC4FXp8ft1FKnO30JP/iIeQmbls/QGPs2rAlGcLiH3oi8=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=ysY+8CHLH/16Skn1tWHViitmkNPIIbvlsVj2rL0JMwU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_081106_742547_D97387A7 
X-CRM114-Status: UNSURE (   7.32  )
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

Hi,

Thanks for checking this.

I agree that marking these memory-mapped controllers as can_sleep is too
broad if the only sleepable part is the pinctrl range lookup.  That would
make consumers treat otherwise MMIO-backed get/set paths as sleepable,
which is not the contract I want to change.

I will hold back the at91-pio4/stm32/sunxi can_sleep series and look at
the pinctrl core direction instead, specifically whether
pinctrldev_list_mutex can be replaced by a non-sleeping lock for
pinctrl_get_device_gpio_range().  That should also line up with the GPIO
direction callback case discussed in the other thread.

Thanks,
Runyu

