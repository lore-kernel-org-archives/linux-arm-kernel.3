Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5650EC44512
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 03:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHtgDO4iANSGYS0dotrlCjZ5i/qoruq7hbwefKWAtmg=; b=TkAd95R2KDhQcqHZGAYv9SX4bU
	vVZJBDqUTk00PQgA5sTmHZzjiRPxmVlAOGtw62Ak8XRWUeLcOAX3/gSGAv9Zm+OqkqzpGSQw1qx4C
	VvuTIkfGe8bp8UubeR3riRgxvvinzA6h3BX3ajUzT5om8HPlrqpYoGPuzQuwNtHFkFYieh3JjRNwt
	8WGf9keiAJAVjaBP6JD9MUsrrpc3hsNCC9gXCEUjj4u7067N/7MYu3Z0mhlKnK+DhMmYTm5saa71p
	46aVlYYKvDALUDUuas2xNDYadsVomncAx+fEWwUISoZdYgdAfP2HbuvcoLDhKlA1WpHLyq7NhIGO4
	nfy0zGzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlIUO-00000004j4b-3h0U;
	Sun, 19 Jul 2026 03:46:52 +0000
Received: from flow-b1-smtp.messagingengine.com ([202.12.124.136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlIUK-00000004j1n-0LHq;
	Sun, 19 Jul 2026 03:46:50 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 28CF5130009F;
	Sat, 18 Jul 2026 23:46:47 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 18 Jul 2026 23:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784432806; x=
	1784436406; bh=OHtgDO4iANSGYS0dotrlCjZ5i/qoruq7hbwefKWAtmg=; b=Z
	6Vsg8Ow3IirzzCOQkLKWzA/oD82GWIZ8RlDp9ZVzq7z1XwRefjS+akcRuZiJyVMU
	OWz3jlyTb1GJyY758J54cetuAU7jHlGd2jU11rgFFvujlsl1bmAB9E+chpQpvQ4N
	yNipPcceI2aHAhbjcXWOORUjReAqkHe4Pty5Bjoh6Ctfztyyu2ZufAio7snYxLw+
	C24dsZL/Xqm9el0hzAwKbiMSqNRNmi+oYO5ezvu/mtTrYd0/W7LW4/1kpKaKYhQh
	//NWQYQtW8Thz/aJcUfl1oERdpP5GVjmWG5AbXS2c6tl4zOUuELIibqiPtbqXme9
	oMy9mNU5jWHDZGW0nCzmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784432806; x=1784436406; bh=O
	HtgDO4iANSGYS0dotrlCjZ5i/qoruq7hbwefKWAtmg=; b=KsacrUQn4eF/zW455
	Mm65KRH9BkQdNzri1dIxORKcgVmaW7+D8FDdbcRzcdLhuxUDXXidnHhbHOIiefF9
	p/n3HYrM+egkByzmCQLBBTbFDlvs3Pc2xDsJBW+jlObk7DO703yqC8TU9n2Sd21Q
	2vYBVIWqOS4hKB7/OAVvLRwNegeGfBVmGNdAvcqhglaI4kWDUhAiAz0JXca9F+AD
	UBzECGF1bP2OUhxhhMqDGnP/H6oHivWJDamx5e1IK05YOrGkxSk1IHzMcOdcthSC
	BbTCrklzjhy784OGQ2m5lx1tBPQgBf+KDVhraIHOSdf9YGAe9LQulUUfokYO1J/j
	wSRPg==
X-ME-Sender: <xms:pkhcah2kV_nEp6kd4TotHFKzfwMRk4EN3xEs8SaeKsY0GuszaVJaZg>
    <xme:pkhcauds6aote_O9_Sj2mK39_TSNU-HtS-q_zYEO4hXBlYAJPE74-c-MI9-GEEVWy
    8tOoRlYBeUD7egHgSus9VZmGnQ-IeAMKef7MQEeXd6uzPUMadOvnD8>
X-ME-Received: <xmr:pkhcauIJH7F9-IN4zEprZoaXTBstpl2k8ttMuDqVKQQGDs7oQG5DdRWwZoTNMbpLAYfzKZBqzl32AH1pKyE>
X-ME-Proxy-Cause: dmFkZTEvqSoJQqnPvukA/0nUn+XxJpYTlQNqXc2syNunyqumVYApwogtjNKdZXBpfO8rfR
    2Jx9JWiQHq2J5RmDUNfmbiSy7usanwZFiMdgwJ2HFO8oSvpsoMVUC1S7AfuWMXX9S4I0wK
    5sBL/nJc1wAe+EOGyIiJ3+1YF5WnPBu7Az9KD9wwDOjxFoeCuBSLONC1xQ/IDpqZZASB3i
    9aFIr9Y/79Hz1Vw4/wx43mF7b6lG4Xdmr3Qv+xi8VT374sGoR0MR15sTySeCXiHMBr56eK
    BMsIhNpmLtm3HXQXTdxlBIws6XSX0UisPcNoyzVJduslnTJDNWaprHMRJzqSkV4N2LisXI
    da9fUmFx6/KR9ZMe3ZBM18y+hf1OXvDZ8U4U6wC6YJleQ8hv9VSEnRVVsc4/9jg0t1LGCh
    116u9bE7sbcMUukrtOCYzOzsqIRNQG3ZBeBSMy33OYZA0B8JIdKvAngV+DhCA2RqfHGnUX
    cIeh8xMElXFdcUQR575d59ITd6Hel2TG52jAEiwcVi7/4XYGoFUILBxJUQSd5k3CkMaDxq
    uO5sh8ftqHGAVIfkYaJ8DEKJB19JbLZ1x0ucib5madw/lMTnovz4hocb7LyX8hw7ZSGxB+
    Hyn06azB0myWgSSfmA0CokdHWz0qYuwejw7VBZSsaF3mNo7nmzgCRxsTHD7w
X-ME-Proxy: <xmx:pkhcasrg3co0Ohm9gvmunatMLX0iddoyRKh61q6Dl0uAMewAnNYrQw>
    <xmx:pkhcass8kLcA2302yol_YRtDC5EqELNDih43Eas73u4-PVe0zL6wYQ>
    <xmx:pkhcamKQ1uFUFOjVO18x1VKOaehrS4rGuvKt0WJxCGM0H-2zx76O3w>
    <xmx:pkhcarpoWX7ibiSbui233ne9vBuBd1cj3BfsTBnB5YQ3tUzSayRwlQ>
    <xmx:pkhcaqXFda_eRBoIGyjmJJkk62L7-aJ71__-3sD4_dFFnCCndF6Vs5UB>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 18 Jul 2026 23:46:42 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: maxime.chevallier@bootlin.com
Cc: andrew@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	heiko@sntech.de,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: dwmac-rk: enable the reference clock for output mode
Date: Sun, 19 Jul 2026 15:46:40 +1200
Message-ID: <20260719034640.3623173-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <da7d4ee0-8122-4839-b807-5d23ee6aeef7@bootlin.com>
References: <da7d4ee0-8122-4839-b807-5d23ee6aeef7@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_204648_166547_6F175067 
X-CRM114-Status: UNSURE (   8.42  )
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

> You've taken my review into account (thanks :) ), but you're failing to
> address Andrew's comment.
>
> The PHY should be the one requesting the MAC to output the refclk, in
> that case the MAC will act as a clock provider [...]

You are both right, and I am sorry I missed Andrew's point on v1. The MAC
should not own the PHY's clock.

I have dropped this series. Instead the motorcomm driver now enables the
reference clock itself, which is the consumer that needs it:

  https://lore.kernel.org/all/20260719034555.3623003-1-gahing@gahingwoo.com/

The device tree names the YT8531 explicitly so the PHY is instantiated
without an MDIO ID probe, which it cannot answer before that clock runs;
the DTS goes to the rockchip tree. Tested on an ArmSoM CM5-IO: the PHY
links at 1000 Mbit/s with no dwmac-rk change at all.

Thanks for the review,
Jiaxing

