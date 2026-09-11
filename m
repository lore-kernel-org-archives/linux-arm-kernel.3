Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD13AC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNWEqHyW6dPJ+VIt3wC0wcyv2zYFHYC6afR46j4BmEg=; b=X4p0dV9JDjVpJukvCWGNzM/iqT
	79x8UxlAkdI13IP4+epMrIzMbpKu1mFkKP41M1SNsJwSKnlaxvwLMg/Uhx30KmN+lLl9R8w/90Ooc
	va//Dk8BTCPfX64B1BqFU4uFzXjrqNqPLMvWzIfnN/ubGJhT8/qZjwI7k6Tq2GuN5veq28E9jss/m
	/DQL5qiNHoZUEFZk9+a+8oTB0jt0mOVentdzL5J3U4C8pwSIouA+UBkigfOzaF4ZOebfmlIANuQta
	GPvqk2bzVJauTgQhUOIFQX52QrEw3cb0tkvVCmG1gXptoVEa4iGNdcqCuxPde22ncXYLncbsKlBNH
	8Q8Sh/RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wjY-0000000G9Nw-3B9J;
	Fri, 11 Sep 2026 08:35:44 +0000
Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wjV-0000000G9NC-1NkP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 08:35:43 +0000
Received: from L23803.iliad.fr (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id BEFF278035B;
	Fri, 11 Sep 2026 10:35:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1789115735;
	bh=ig7/VBNGQp4N6xzwFvEIbedNVsU144MO3YycJQR+XF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sFuXVKC8gcz33vzI6iud7xnwtR8omZZp3V8ueO5FVefKCawC2bMckcOAoLHVCQxZu
	 STDdrciSt+1dY1QtAdusNQpJNyBvQryjI9LKTC5evbNxVtkhUIpqyUqWZ/wL8ZnIeM
	 nf+mnrjnpNmwUj9NTc2N2OZAVzqbf8r4LQsqjv36otaHyKNtcCGA8f+Fm8VuG1DZti
	 u9QhWinvUoMUiUOS9zyIamIVNfsjEFYjvcIlGx70Yj5qZQ8sKonivOTeDRZ1YSxxqB
	 xA7dRpu30XscryQaVmFIWPaIob8u1XjtkO1gJuXNrGNj3okA3X40HjHpZm7RY+HTVL
	 mvdgNt5W0QmnQ==
Date: Fri, 11 Sep 2026 10:35:20 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Carlos Song <carlos.song@nxp.com>
Subject: Re: [PATCH v2] i2c: imx: add I2C_M_REV_DIR_ADDR and I2C_M_NOSTART
Message-ID: <aqO9SMvI89rqoEGb@L23803.iliad.fr>
References: <20260812-for-upstream-i2c-imx-lx2160-reverse-v2-1-f1343714c5a9@free.fr>
 <apcYp0Zc7CrJMiOh@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apcYp0Zc7CrJMiOh@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_013541_793559_FCA9F50E 
X-CRM114-Status: UNSURE (   6.77  )
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

Hi Oleskij, Andi,

It is a "gentle" keepalive on this patch. It has been sent last month and
it had been ack'd by NP (both Carlos and Frank).

Is there anything else you need from me to have is applied on i2c/i2c-next ?

thank you,
  Vincent

> Reviewed-by: Frank Li <Frank.Li@nxp.com>

