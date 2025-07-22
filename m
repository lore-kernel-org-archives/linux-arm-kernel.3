Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28404C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 09:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9hR42QpuegsrOqNZrIg+mtU4sgDTD0im7FtvEt+1js=; b=gfSxjfEutTp0h8pJ1LVoci6VvE
	oEpuThkmh3i+6ebv4K7YjVfLxhJYpLLfg1kuwQ/yUjuPU+vTAFFUKmmDbGCqOZIift2nzrwtiVcHC
	3IhrAChMKaUUQTiKRDZw80pH0h31cwGP3gPAxG7QkEfttGDwekrZYcE/WLGhj70kmXmZ3nZUV6voo
	S6MSD/7k9CWKkGjiYK/CgKgfyDsisiyCvg2k/aGKaNNrmoxg+xoK81hDV4WQzc2wEJUFYm/ltn7K1
	01KqBMwMg9GKLTUJ9+mdpxwbH/mGNB/R+k2GsNKeIWrOX4r/FXO6uUR3itvJlwShrSOEx8xYGJkZw
	VyHv5rhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9OO-000000021ZH-102E;
	Tue, 22 Jul 2025 09:34:36 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue95E-00000001y3l-1ieR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 09:14:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2180D43352;
	Tue, 22 Jul 2025 09:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753175684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y9hR42QpuegsrOqNZrIg+mtU4sgDTD0im7FtvEt+1js=;
	b=AC/2QcXXFQdFdcZZ3ah5NtQEdVzZS5Fv72MsSYFPI44WtrzCCNbhClR8o9ajNNaElOpejA
	oHhKfLcvkhD4+j+nIlnVyl2DIB+y+iXeStU/n0cNedk3uXbuUJSxRPM4gjIEkEeCeAS+mP
	bwWiSHmokEgwNg41kcbxL3pGydQ2GfVCvtQW84gAAWbWn8+9DY8ev+lPF2TIpusZLYQqvy
	9ZYKrPzk6s2+HTLLV9GFZh7rCfAlw1SdhZvM7cC1r7cBiD4YQt2FJrDhRX81+2EDgumC3R
	bLR/0icnlUHT81dL1J8Xtg/LdepwKyjPglRRCF3IkDE6hVCrYBOStabbFwCOwA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,  Peng Fan
 <peng.fan@oss.nxp.com>,  Carlos Song <carlos.song@nxp.com>,  Ulf Hansson
 <ulf.hansson@linaro.org>,  Stephen Boyd <sboyd@kernel.org>,
  "imx@lists.linux.dev" <imx@lists.linux.dev>,  "rafael@kernel.org"
 <rafael@kernel.org>,  "mturquette@baylibre.com" <mturquette@baylibre.com>,
  Frank Li <frank.li@nxp.com>,  "linux-i2c@vger.kernel.org"
 <linux-i2c@vger.kernel.org>,  "dakr@kernel.org" <dakr@kernel.org>,
  "festevam@gmail.com" <festevam@gmail.com>,  "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>,  "pavel@kernel.org" <pavel@kernel.org>,
  Bough Chen <haibo.chen@nxp.com>,  "len.brown@intel.com"
 <len.brown@intel.com>,  Andi Shyti <andi.shyti@kernel.org>,
  "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
  "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
  "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,  Aisheng Dong
 <aisheng.dong@nxp.com>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "kernel@pengutronix.de" <kernel@pengutronix.de>,  "shawnguo@kernel.org"
 <shawnguo@kernel.org>,  Jun Li <jun.li@nxp.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: Dead lock with clock global prepare_lock mutex and device's
 power.runtime_status
In-Reply-To: <CAGb2v64PfUiKjrJyhcthuLt6FXQS6VoaShYZ3A3WO__3pu4O+w@mail.gmail.com>
	(Chen-Yu Tsai's message of "Tue, 8 Jul 2025 01:28:08 +0800")
References: <VI2PR04MB11147CCEFE4204B852807AAF2E841A@VI2PR04MB11147.eurprd04.prod.outlook.com>
	<20250707105816.GF11488@nxa18884-linux>
	<20250707-careful-pragmatic-quail-e1a2d8-mkl@pengutronix.de>
	<CAGb2v64PfUiKjrJyhcthuLt6FXQS6VoaShYZ3A3WO__3pu4O+w@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 22 Jul 2025 11:14:41 +0200
Message-ID: <87pldsd1tq.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejgeehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeegfedtfeelvdeigedvjeelgfelgeejhffgueelvefgtdejheduffehvdehgeeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvkedprhgtphhtthhopeifvghnsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhklhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepphgvnhhgrdhfrghnsehoshhsrdhngihprdgtohhmpdhrtghpthhtoheptggrrhhlohhsrdhsohhnghesnhigphdrtghomhdprhgtphhtthhopehulhhfrdhhrghnshhsohhnsehlihhnrghrohdro
 hhrghdprhgtphhtthhopehssghohigusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_021449_083843_5EB4F28D 
X-CRM114-Status: GOOD (  18.54  )
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

Hello,

Thanks Chen-Yu for the heads up!

On 08/07/2025 at 01:28:08 +08, Chen-Yu Tsai <wens@kernel.org> wrote:

> Hi,
>
> On Mon, Jul 7, 2025 at 7:05=E2=80=AFPM Marc Kleine-Budde <mkl@pengutronix=
.de> wrote:
>>
>> On 07.07.2025 18:58:16, Peng Fan wrote:
>> > On Tue, Jul 01, 2025 at 03:16:08AM +0000, Carlos Song wrote:
>> > >Hi, All:
>> > >
>> > >We met the dead lock issue recently and think it should be common iss=
ue and not sure how to fix it.
>> > >
>> > >We use gpio-gate-clock clock provider (drivers/clk/clk-gpio.c), gpio =
is one of i2c gpio expander (drivers/gpio/gpio-pcf857x.c). Our i2c driver e=
nable run time pm (drivers/i2c/busses/i2c-imx-lpi2c.c [1]). System random b=
locked when at reboot.
>> > >
>> > >The dead lock happen as below call stacks
>> > >
>> > >Task 117                                                Task 120
>> > >
>> > >schedule()
>> > >clk_prepare_lock()--> wait prepare_lock(mutex_lock)     schedule() wa=
it for power.runtime_status exit RPM_SUSPENDING
>> > >                           ^^^^ A                       ^^^^ B
>> > >clk_bulk_unprepare()                                    rpm_resume()
>> > >lpi2c_runtime_suspend()                                 pm_runtime_re=
sume_and_get()
>> > >...                                                     lpi2c_imx_xfe=
r()
>> > >                                                        ...
>> > >rpm_suspend() set RPM_SUSPENDING                        pcf857x_set();
>> > >                           ^^^^ B                       ...
>> > >                                                        clk_prepare_l=
ock() --> hold prepare_lock
>> > >                                                        ^^^^ A
>> > >                                                        ...
>> > >
>> >
>> > This is a common issue that clk use a big prepare lock which is easy
>> > to trigger dead lock with runtime pm. I recalled that pengutronix rais=
ed
>> > this, but could not find the information.
>>
>> Alexander Stein stumbled over this issue some time ago:
>>
>> | https://lore.kernel.org/all/20230421-kinfolk-glancing-e185fd9c47b4-mkl=
@pengutronix.de/
>>
>> I encountered it too, while trying to add a clock provider driver for a
>> SPI attached CAN controller which uses runtime pm.
>
> Miquel from Bootlin posted a more formal description of the problem and
> some possible solutions last year [1].
>
> [1] https://lore.kernel.org/all/20240527181928.4fc6b5f0@xps-13/

I also sent an RFC in April:
https://lore.kernel.org/all/20250326-cross-lock-dep-v1-0-3199e49e8652@bootl=
in.com/

I haven't got the energy yet to process the interesting feedback from
Rafael and Stephen. But getting a broader audience and maybe more
feedback will certainly help!

Thanks,
Miqu=C3=A8l

