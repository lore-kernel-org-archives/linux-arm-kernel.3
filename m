Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F18FCA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 09:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbC8FkGuCmX23W5lQsFHQNsR0b/h1CWXM40cX33mshg=; b=dLXFzMenuwFEo5QRTlu97XVSmO
	fiLHshOckVFcS98P+oN+Y22cWL+st+OQrrhqS5eUX4WU2TEHHy3WDtcMGSN7ASdhQ9eMG0/J68EeG
	h/0uaeWCCZbicPvTE/+45V45FKsNFcVfIgyWg8FINZg0xMoQcRw+gH6WaORi5UtA8/N3pKMdIwVu6
	GOOJVdkK963bjlgPV7effETiz/6UbyhXS8GEvQSr6FuH0h62k7sienCYjHGN8evoXzmWytG4FZ/wF
	sOIC6F4QAruDh00xbVkyZBVMAxiSbuBCzTCYfnIkOt+xSKspW9fImHmjpmvGzfQ8EIkxZFCI/PIp6
	b5mk/TEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjzy-00000003wep-21lH;
	Thu, 08 Oct 2026 09:01:10 +0000
Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjzv-00000003we3-1SFn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 09:01:08 +0000
Received: from L30177.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 3FEF4780502;
	Thu,  8 Oct 2026 11:00:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1791450064;
	bh=4F03o97iXSlmGOeJsrP5FuGxw5vNoZtKjrawKFd6mQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rZDzBkfRvSyiwKF5K42MielqdUUkE1C2gmHhhap35L/GORwrBU2l71Xl8FTU2RGdE
	 Zj4F/Q/xipQZ1CBnDytQM9ZnADLjNyuQxy16WuOTThMKR8ayJcFO7sDTsCnb+KgVlk
	 ZLYAuBiH+n7rV6id6vSfZ/JcIMK9I+LgNm6GuPNu91HGEhQlXjUMn7mAHqzolO6EcQ
	 wyJPf/EJfAxyuLPq4E6D46uTMc4QJFxsR22UOvN/RFESwJigwvSVSfwwdxhvqB9/R2
	 oT9Qlwqy9rW0uNGStUl+kUFDJw4dpp8hHvh5k6g0xyIvoAFsqAi+1qHuPz0RW0C4tk
	 rAc/VxzUeXXNA==
Date: Thu, 8 Oct 2026 11:00:48 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Carlos Song <carlos.song@oss.nxp.com>
Cc: Haobin Jiang <lemonoutput@foxmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Carlos Song <carlos.song@nxp.com>, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: imx: add I2C_M_REV_DIR_ADDR and I2C_M_NOSTART
Message-ID: <asdbv4ZWwJ72ObNn@L30177.local>
References: <20260812-for-upstream-i2c-imx-lx2160-reverse-v2-1-f1343714c5a9@free.fr>
 <apcYp0Zc7CrJMiOh@lizhi-Precision-Tower-5810>
 <aqO9SMvI89rqoEGb@L23803.iliad.fr>
 <arMUxCW5ZTzLT3VN@L30177.local>
 <arw0mVbacAXv_1H7@L30177.local>
 <asaElUqBu5ht6amB@L30177.local>
 <c72e3cfa-26f3-4557-858a-2a919bf68986@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c72e3cfa-26f3-4557-858a-2a919bf68986@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_020107_546627_1BD94DEE 
X-CRM114-Status: UNSURE (   7.87  )
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

Hi Carlos,

> This patch is a new feature, so I think it will be merged until v7.4 at
> least.

ok, understood. I'll wait and if needed a I can/will resend
an updated patch based on a rebased with v7.4

best regards,
  Vincent

