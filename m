Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22EBE63C82
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 05:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kmusx+MqkhmDeC3UAb227ZvWFfKqkuZrPt4RmzV95Y=; b=vJWH4TZ37OAxCyy4iJtPAoRSLE
	GqkGIwaQkT2Yx2xYDVdKVViNjKm+AUjiCV+7yBQJL6uNv8UE2dhD8A005qlW73HA8yCcUWi0UN+hn
	tiC9aEfCGDUeE8XRB1uWz+9HT4fzRJ/x61K5e1brFlFBcOfcW4ndKepJ0dH1H1iH9cJODf5zOGzBb
	MVpVSgITXfe/HYhYaJ1VHWM+HHqAN+PAxOz4fxfnD6CPvihFp/iLv5Y4ssv5E36K2Z06EqeosKouN
	IqKya+3q2uNKOD1p9rdsxD50cIdngA3bvpQuqeDuUhH64UI19ESj94CjZKp2FzLi2zS/WlDuXJJof
	mKCLc6TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjt1f-0000000AtGy-2xO9;
	Sun, 25 Jan 2026 05:51:07 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjt1c-0000000AtGQ-0gKE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 05:51:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769320254; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dSTluIUg1ZvuNQajf3SJQZtFC47qgOiCluuPmretAnaYy3qEXXAfw12l1SuinrIkuTIRZfJR31MmYz5r6spPsJxZMoLbjXd+1xdkmxQeHJWZoCwxSDGaUYuXq3kOF7qo9PWdPFRCQ4/6JBiHaTov22Gkxan2PROLvfDtNTd0P3I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769320254; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7kmusx+MqkhmDeC3UAb227ZvWFfKqkuZrPt4RmzV95Y=; 
	b=WBLo2GPooj7hxieZJGDM1Qex0g3hZOSEzMm4I2tFp1ukYCmfFnuM3DqSt27sKBwWn2TV32I6s/OLlyXB2DY6U2/hhhUGqi82QbSx6QFm0LctY+SpVlAX5ZxYla4X7m+X1IT29Njx9sdNitezJuoLhqo/4o9PN3DJ7+ZocAo4ctQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769320254;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=7kmusx+MqkhmDeC3UAb227ZvWFfKqkuZrPt4RmzV95Y=;
	b=rTR69koYL0NpAmYBkVdfpkSYUbKGJBrLW085gQX2D96GmcI/dgw7ortSTm9m6V3k
	PT91fEUpMbG+8Dqv0q3hbWPewgHn/Vtexj28VcJV8gL/4bu+ozd4NNXgzLh7FwyAlmd
	sgb05Ra7AgqhnAaPKb8koZaqEd2KKBmDE0tK9YPw=
Received: by mx.zohomail.com with SMTPS id 1769320251684256.61624132047143;
	Sat, 24 Jan 2026 21:50:51 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Jan 2026 13:50:41 +0800
Message-Id: <DFXFOHVB1GAV.3L3EL4FVWFWDC@pigmoral.tech>
Cc: "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Maxime Ripard" <mripard@kernel.org>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/7] clk: sunxi-ng: Extract common RTC CCU clock logic
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: <wens@kernel.org>, "Junhui Liu" <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
 <20260121-a733-rtc-v1-4-d359437f23a7@pigmoral.tech>
 <CAGb2v65aMMVu8W1PW+6NZM+YM72YFV9_FWVWtj6QHJ1CgetEsA@mail.gmail.com>
In-Reply-To: <CAGb2v65aMMVu8W1PW+6NZM+YM72YFV9_FWVWtj6QHJ1CgetEsA@mail.gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_215104_575551_E6751DEC 
X-CRM114-Status: GOOD (  16.35  )
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

On Sun Jan 25, 2026 at 12:32 PM CST, Chen-Yu Tsai wrote:
> On Wed, Jan 21, 2026 at 7:04=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.t=
ech> wrote:
>>
>> Extract the IOSC and 32k clock logic from ccu-sun6i-rtc into a shared
>> module to simplify adding RTC CCU support for new SoCs. This is needed
>> because newer Allwinner SoCs introduce additional DCXO/HOSC logic that
>> prevents direct reuse of the existing driver.
>>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  drivers/clk/sunxi-ng/Makefile        |   3 +
>>  drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 152 +---------------------------=
-------
>>  drivers/clk/sunxi-ng/ccu_rtc.c       | 136 ++++++++++++++++++++++++++++=
+++
>>  drivers/clk/sunxi-ng/ccu_rtc.h       |  37 +++++++++
>>  4 files changed, 177 insertions(+), 151 deletions(-)
>>

[...]

>> +
>> +const struct clk_ops ccu_iosc_ops =3D {
>> +       .enable                 =3D ccu_iosc_enable,
>> +       .disable                =3D ccu_iosc_disable,
>> +       .is_enabled             =3D ccu_iosc_is_enabled,
>> +       .recalc_rate            =3D ccu_iosc_recalc_rate,
>> +       .recalc_accuracy        =3D ccu_iosc_recalc_accuracy,
>> +};
>
> You need to export the symbol.

Thanks, I will export them.

[...]

>> diff --git a/drivers/clk/sunxi-ng/ccu_rtc.h b/drivers/clk/sunxi-ng/ccu_r=
tc.h
>> new file mode 100644
>> index 000000000000..1c44c2206a25
>> --- /dev/null
>> +++ b/drivers/clk/sunxi-ng/ccu_rtc.h
>> @@ -0,0 +1,37 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2021 Samuel Holland <samuel@sholland.org>
>> + */
>> +
>> +#ifndef _CCU_RTC_H_
>> +#define _CCU_RTC_H_
>> +
>> +#define IOSC_ACCURACY                  300000000 /* 30% */
>> +#define IOSC_RATE                      16000000
>> +
>> +#define LOSC_RATE                      32768
>> +#define LOSC_RATE_SHIFT                        15
>> +
>> +#define LOSC_CTRL_REG                  0x0
>> +#define LOSC_CTRL_KEY                  0x16aa0000
>> +
>> +#define IOSC_32K_CLK_DIV_REG           0x8
>> +#define IOSC_32K_CLK_DIV               GENMASK(4, 0)
>> +#define IOSC_32K_PRE_DIV               32
>> +
>> +#define IOSC_CLK_CALI_REG              0xc
>> +#define IOSC_CLK_CALI_DIV_ONES         22
>> +#define IOSC_CLK_CALI_EN               BIT(1)
>> +#define IOSC_CLK_CALI_SRC_SEL          BIT(0)
>> +
>> +#define LOSC_OUT_GATING_REG            0x60
>> +
>> +#define DCXO_CTRL_REG                  0x160
>> +#define DCXO_CTRL_CLK16M_RC_EN         BIT(0)
>
> Please keep all internals in the .c file.

My original thought was to reuse these for the A733. But since doing
so is not appropriate, I will put them in the .c files separately.

>
> ChenYu
>

--=20
Best regards,
Junhui Liu


