Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19120C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+CRjLtzZlQPexomBbHw5/yUmpMluSz1BR7RnnnOQPNw=; b=Cg7LQb1xLdcKhOt5/uwf4UZvDZ
	DsmAPOWVZvqDft5opsG2uDgwlam3mLpJWPO73Gyc8IXUhlbhDnn9wEv8CtAqQEs6zTsOtENpxtIc9
	4N/lYROPOENBGJN2TxB7yWhvwQmKWuEMOWBUKQ2B8lpaVGteT06esEkpK6895NIdSRWRDN7FKDASS
	NcRKBs6aJOdFRtL9VOnqFpCbBQNz7045vK/i2HmkVfWh9QUv38JMtuK/vCcy+tB2KwED8Noncla1S
	0bYHSAJOlYL2xk5V72BNPuKYuYB+92OVQgQpNrcPikJpuwI29D34ntSp+kiUl3wZtvnDObN9IkqIo
	fHhMZwFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woL1o-00000002nJR-3d2K;
	Mon, 27 Jul 2026 13:05:56 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woL1l-00000002nII-38Kd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 13:05:55 +0000
Received: by chaosmail.tech (Postfix) id B143B1C9733;
	Mon, 27 Jul 2026 13:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785157547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+CRjLtzZlQPexomBbHw5/yUmpMluSz1BR7RnnnOQPNw=;
	b=pHpmR5nH6TZ1kYs7zQkAoSXNb72SC3jEOTFMvYJ1u3qq7piGC8M4qWsbFM1msqQKlIaCc7
	GODdhSW6AL6/hfh0YfTBMpCj5mmcg+7V7ZIBcrgltI+Z7EnPkBmxfibJUi7pdb+dw29tG2
	MX2FVufJSG8Q0r0lq38IO8pH00GNAaI=
Content-Type: text/plain;
	charset=us-ascii
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] usb: typec: tipd: Factor out i2c specifics
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <amdVkYEiv_tOZuwG@black.igk.intel.com>
Date: Mon, 27 Jul 2026 15:05:35 +0200
Cc: Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Alyssa Milburn <amilburn@zall.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2D85C0F7-4223-4DA3-89E8-EEC96DB4FBC6@chaosmail.tech>
References: <20260725-tipd-ace3-v1-0-73202d36138a@chaosmail.tech>
 <20260725-tipd-ace3-v1-2-73202d36138a@chaosmail.tech>
 <amdVkYEiv_tOZuwG@black.igk.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_060554_249516_9CCD6A0E 
X-CRM114-Status: GOOD (  17.86  )
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

On Jul 27, 2026, at 14:56, Heikki Krogerus =
<heikki.krogerus@linux.intel.com> wrote:
>=20
> Hi,
>=20
> On Sat, Jul 25, 2026 at 06:20:57PM +0200, Sasha Finkelstein wrote:
>> From: Alyssa Milburn <amilburn@zall.org>
>>=20
>> Make the core driver more bus-agnostic to prepare for SPMI variants =
of
>> the tipd chip
>>=20
>> Signed-off-by: Alyssa Milburn <amilburn@zall.org>
>> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
>> ---
>> drivers/usb/typec/tipd/Makefile           |   2 +-
>> drivers/usb/typec/tipd/{core.c =3D> core.h} | 109 =
++++++++++++++++++++++++++++----------------------------------------------=
-----------------------------------
>=20
> That has to be a mistake, right? You don't move code into a header
> like that.

Yes, it was a bad idea, already fixed in a v2 that will be sent in the
near future.

>> +static struct tps6598x *tps6598x_from_device(struct device *dev)
>> +{
>> + struct i2c_client *client =3D i2c_verify_client(dev);
>> + struct tps6598x *tps =3D i2c_get_clientdata(client);
>> + return tps;
>> +}
>=20
> You should not need anything like that.

This should make more sense together with the following patch, as it
can get the tps6598x from either the i2c or spmi backend.

>> --- /dev/null
>> +++ b/drivers/usb/typec/tipd/i2c.c
>> @@ -0,0 +1,86 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Driver for TI TPS6598x USB Power Delivery controller family
>> + *
>> + * Copyright (C) 2017, Intel Corporation
>> + * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> + */
>=20
> This driver is not coming from me.

I kept the attribution as both core and i2c are your driver, but split
into two. Should I have done something else?

>=20
> Thanks,
>=20
> --=20
> heikki



