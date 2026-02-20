Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA7FC55184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 10:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95n3S7OhyJLgWav5p8ft1mLShRbAAlU1n4biE46GLho=; b=A/I8SBG4568Ids5sX9Idoj/i80
	vYTa0Mu20nBWMq3OVL6YlrO5sLDbXT6Tm8t8/SoiCk2GnDMr5QVFG79VryrHX2wSk1ZRZcZXIeKUz
	J7KvcseOIVwN8qqKamEZVkUHmYysNdY3dQwyzURXPhHpMCDV6cnVOZjqxjR1thTxmgxg31lL8OHKp
	nmoZE+KEI7XcOlX6Tsv1xe5R2iGY03pX52gAY1mL3Oa2W8JQGkV97L4doO9fiEUGdwlZ5usnBou5e
	QxOk+nbccaCvlzBfKQS8B3fX0+RIrJvaP9nuA9d2Hp8OcNMu1Rfc0SR9ZDw06QMV34oSfLai5m7Jt
	IjYZ1U2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNu4-0000000E6vH-0jkN;
	Fri, 20 Feb 2026 10:38:32 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNu0-0000000E6sq-3mtj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 10:38:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 346A2148332C;
	Fri, 20 Feb 2026 11:38:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1771583906; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=95n3S7OhyJLgWav5p8ft1mLShRbAAlU1n4biE46GLho=;
	b=G7g+VOFZLjBF2BUmYiAdr1GiXzIa+8CnOYBDQCbrNJ9+Ra0s4qkJZnIZxpsrALLzT7lcTg
	lQRUz8fsYM4LjhrTHhuAR/l4kdAG1sF1vPP4bplE44rNxt4uEwbOLMCNO2oGFqtt0Bkj/B
	K5dSi4MyuZDF7Sk9Nph5L27TGl6+BQAGiTJYokLFdsU6LirFGkNq9XB0f611eEjRX13Rq5
	l91gGrD4UawxLvKnUr+ctIcb9PyhjQuq3yvohY1zv43VrGk9iZBeM4QR8Txo2SsJpUHCVX
	6uRhTrRsL7534DCokwloECZbwjizVGMHwfJBcHn5r4FAQLBzZwlSx7NADxUAcA==
Date: Fri, 20 Feb 2026 11:38:23 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Alexander Dahl <ada@thorsis.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v3 14/19] nvmem: microchip-otpc: Expose UID registers as
 2nd nvmem device
Message-ID: <20260220-maximize-glance-a0abd1806c44@thorsis.com>
Mail-Followup-To: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-8-ada@thorsis.com>
 <05128a16-553d-49d5-b09d-2c3e03cb4421@tuxon.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05128a16-553d-49d5-b09d-2c3e03cb4421@tuxon.dev>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_023829_288533_23DEA11A 
X-CRM114-Status: GOOD (  30.28  )
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

Hello Claudiu,

thanks for your feedback on this, see my remarks inline below.

Am Sat, Jan 31, 2026 at 06:11:56PM +0200 schrieb Claudiu Beznea:
> 
> 
> On 1/20/26 17:44, Alexander Dahl wrote:
> > For SAM9X60 the Product UID x Register containing the Unique Product ID
> > is part of the OTPC registers.
> 
> SAMA7G5 as well.
> 
> > We have everything at hand here to just
> > create a trivial nvmem device for those.
> 
> Please massage a bit the patch description to match https://www.kernel.org/doc/html/v6.13/process/submitting-patches.html#describe-your-changes
> 
> > 
> > Signed-off-by: Alexander Dahl <ada@thorsis.com>
> > ---
> > 
> > Notes:
> >      v3:
> >      - no changes
> >      v2:
> >      - Use dev_err_probe() for error reporting (thanks Claudiu)
> >      - Move required register definition over here from removed patch
> > 
> >   drivers/nvmem/microchip-otpc.c | 38 +++++++++++++++++++++++++++++++++-
> >   1 file changed, 37 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
> > index 34c0d7611f3e4..b35ed13b004bb 100644
> > --- a/drivers/nvmem/microchip-otpc.c
> > +++ b/drivers/nvmem/microchip-otpc.c
> > @@ -25,10 +25,14 @@
> >   #define MCHP_OTPC_HR			(0x20)
> >   #define MCHP_OTPC_HR_SIZE		GENMASK(15, 8)
> >   #define MCHP_OTPC_DR			(0x24)
> > +#define MCHP_OTPC_UID0R			(0x60)
> >   #define MCHP_OTPC_NAME			"mchp-otpc"
> >   #define MCHP_OTPC_SIZE			(11 * 1024)
> > +#define MCHP_OTPC_UID_NAME		"mchp-uid"
> > +#define MCHP_OTPC_UID_SIZE		16
> 
> I think you can drop these as they are used (individually) in a single place.

If you don't mind I would rather keep it here together with already
present similar definitions, instead of sprinkling new literals over
this c file.

> 
> > +
> >   /**
> >    * struct mchp_otpc - OTPC private data structure
> >    * @base: base address
> > @@ -230,6 +234,16 @@ static int mchp_otpc_init_packets_list(struct mchp_otpc *otpc, u32 *size)
> >   	return 0;
> >   }
> > +static int mchp_otpc_uid_read(void *priv, unsigned int offset,
> > +			      void *val, size_t bytes)
> > +{
> > +	struct mchp_otpc *otpc = priv;
> > +
> > +	memcpy_fromio(val, otpc->base + MCHP_OTPC_UID0R + offset, bytes);
> 
> Include <asm-generic/logic_io.h> for this one?

Yes, include what you use, I'd add `#include <linux/io.h>` then, seems
the usual way in drivers/nvmem.

> 
> > +
> > +	return 0;
> > +}
> > +
> >   static struct nvmem_config mchp_nvmem_config = {
> >   	.name = MCHP_OTPC_NAME,
> >   	.type = NVMEM_TYPE_OTP,
> > @@ -239,6 +253,15 @@ static struct nvmem_config mchp_nvmem_config = {
> >   	.reg_read = mchp_otpc_read,
> >   };
> > +static struct nvmem_config mchp_otpc_uid_nvmem_config = {
> > +	.name = MCHP_OTPC_UID_NAME,
> 
> Should the type be filled here?

In general I would say yes, but looking at `enum nvmem_type` none of
them seems to match.  IIRC I more or less copied the approach from
drivers/soc/atmel/sfr.c here.

Greets
Alex

> 
> 
> > +	.read_only = true,
> > +	.word_size = 4,
> > +	.stride = 4,
> > +	.size = MCHP_OTPC_UID_SIZE,
> > +	.reg_read = mchp_otpc_uid_read,
> > +};
> > +
> >   static int mchp_otpc_probe(struct platform_device *pdev)
> >   {
> >   	struct nvmem_device *nvmem;
> > @@ -269,8 +292,21 @@ static int mchp_otpc_probe(struct platform_device *pdev)
> >   	mchp_nvmem_config.size = size;
> >   	mchp_nvmem_config.priv = otpc;
> >   	nvmem = devm_nvmem_register(&pdev->dev, &mchp_nvmem_config);
> > +	if (IS_ERR(nvmem)) {
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(nvmem),
> > +				     "Error registering OTP as nvmem device\n");
> > +	}
> > -	return PTR_ERR_OR_ZERO(nvmem);
> > +	mchp_otpc_uid_nvmem_config.dev = otpc->dev;
> > +	mchp_otpc_uid_nvmem_config.priv = otpc;
> > +
> > +	nvmem = devm_nvmem_register(&pdev->dev, &mchp_otpc_uid_nvmem_config);
> > +	if (IS_ERR(nvmem)) {
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(nvmem),
> > +				     "Error registering UIDxR as nvmem device\n");
> > +	}
> > +
> > +	return 0;
> >   }
> >   static const struct of_device_id __maybe_unused mchp_otpc_ids[] = {
> 

