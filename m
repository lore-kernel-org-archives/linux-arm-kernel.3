Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA55CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 08:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnjXZyZU6nQwG3AVMZ4mrEOLDYwRmI5lE9MfWukoaF4=; b=KYyIC3L2JCCijrdNu9WAVvvMhN
	ZyXnNGsZpPh6qINaBL0CU0cC5FFuVEwyTJza8nwhzfHInPUxJv5Fuj78vxW5kWWpQEFlf7uKWKibB
	ypAG7lNVtU6JAB1FhhRAuDfkORlw9BlHfyUbuWVrcedJIqeZFMo+hfJIo6JeMMz4uQRfM5qT9IHrX
	gag639eKmEhLEC9UFkXk4oyCG+qWMF/sCE3wBL5B63gUwdnpd3UztwFlMMOKPKsT5ljE3uI6OCkEr
	k3VlA1onJaoVcyv11F/Je76bKPzYelEsrnr6dl2/dhRp4vonS/r4OrYMhGC+L2hPczM2ZHhH7zc/b
	PKBoWDnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRmtr-00000001Lhx-06df;
	Tue, 26 May 2026 08:12:31 +0000
Received: from smtp1-g21.free.fr ([212.27.42.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRmtn-00000001LhE-3kGy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 08:12:29 +0000
Received: from L30177.local (unknown [213.36.132.10])
	(Authenticated sender: vjardin@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 10920B005A2;
	Tue, 26 May 2026 10:12:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1779783145;
	bh=+DPMC/KrZCk4rVtESWROJTmVz5LPk9WoNgb7oufpbx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qFizvqVzYPKNFYIcW3si0zGbaZtRe8WyeohMEQ6KWPMEMBq/MocoVLpqRC6Cld4sL
	 USUACjmgBlTdomdUylNmtcmyq0tGBlB6rjcEPYTpyv/e6vZ9kXGsYSUligCr92tMfl
	 vcEMJYOsILPJx60NnYxCCesCjQ3BHx6vb1VirelHgsiPSL6ePrfmkc830smzcjUvVu
	 mV732C72lPZq4i22KrXVwT/bWXStPBwXqG4GN0GDbTbhMHzoYE+kMk+f7Y4SySaI61
	 X6JSGFBHQpZPfik4TVaT1yvFurhWWGEZVkZ84EFn2CNfkdBjcLoX+GCdXYwy6e3ilQ
	 0tHla7hwu5eLA==
Date: Tue, 26 May 2026 10:12:05 +0200
From: Vincent Jardin <vjardin@free.fr>
To: "Carlos Song (OSS)" <carlos.song@oss.nxp.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Wolfram Sang <wsa@kernel.org>,
	Kaushal Butala <kaushalkernelmailinglist@gmail.com>,
	Shawn Guo <shawn.guo@freescale.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] i2c: imx: fix SMBus block-read of 0 locking the
 bus
Message-ID: <ahVV1X_cdhHDmRwc@L30177.local>
References: <20260525-for-upstream-i2c-lx2160-fix-v1-v1-0-f30ab53dd97c@free.fr>
 <20260525-for-upstream-i2c-lx2160-fix-v1-v2-0-26a3cc8cd055@free.fr>
 <AM0PR04MB6802B906706F0CDE5BA73696E80B2@AM0PR04MB6802.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR04MB6802B906706F0CDE5BA73696E80B2@AM0PR04MB6802.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_011228_071136_5F7E84B6 
X-CRM114-Status: GOOD (  18.91  )
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

> Thanks for working on this fix, this looks good to me.

thanks for checking it. It took some times to isolate this issue and
then find a fix.

> SMBus block reads with a length of 0 seem quite uncommon in practice.
> Was this triggered by a specific device behavior, or mainly found
> during boundary / compliance testing?

It is trigger by the usage of a mpq8785 on the i2c bus: when the kernel attaches
on it using its pmsbus/hwmon framework, then the i2c bus get locked on lx2160 !

> Regarding the handling of len == 0,
> I see that the patch sets:
> 
>     msg->buf[0] = 0;
>     msg->len = 2;
> 
> It relies on the last-byte STOP handling together with TXAK. It will help I2C-IMX generate NACK + STOP and
> release the bus, right?

Yes, exactly. Reading I2DR for the length byte has already armed the
next byte, so we set TXAK to NACK it and extend msg->len to 2.
Next then i2c_imx_isr_read_continue() at msg_buf_idx == msg->len - 1,
ie the normal last-byte path, which clears MSTA to emit STOP. So NACK + STOP,
and THEN the bus is released. I do not see any other means to handle it.

> len = 0 is a legal behavior, So it go into a successful path.

Yes. count == 0 is legal (SMBus 3.1 6.5.7), so the transfer reaches
STATE_DONE and returns success.

> But len > I2C_SMBUS_BLOCK_MAX is abnormal behavior. So it go into a fail path.

Correct, and it is a protocol error, so it needs to end up with a -EPROTO while
a count of 0 is an ok case.

> Do I understand it right?

yes. I do not see any other means to handle it.

> Also, if possible could you briefly describe how you validated this change
> (e.g. test setup or steps, with and without the fix)?

On a lx2160a board, on its i2c, bind a mpq8785, and enable the Kernel pmbus/hwmon
framework, then the i2c bus becomes un-useable. Using a scope, we can confirm that
the lx21260a i2c cannot recover.

Best regards,
  Vincent 

