Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA26CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 08:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+TfhXHUSw3+oJhe7TatHLLAgu2372no2ChD3eKy/l5s=; b=D+p4x+bUh5LB7rlhQAKQnCygEZ
	4Fmtm56807M77WX96AJLH7n92+xkUHPmmEhojEm4J5/QRTCfCMMGEDz/RduCJcQ2QQtYN6qsG3a1E
	XIBFXBkJ77eOm+hxVKzXwH3jQcOItyfg0NcAoygbN4BZNTdiq1ujpt7dqVxpCzBLgl3YdH9PV3v22
	b7p8hnDudmfvJRi0kKtsIOsZkE5GRw4bcoQKCnlGYyIHlMjA5NSronfx+SkfNVjOR17OV74Bv5zt5
	x3rSCoWqUzTUKTL25RL6JzJZZdasqcusbnKl0oFwQnmbuE4Vh1Beb5n/hRzcOWYBSFKXZKHQWjAoY
	8s8e/VZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCOY-0000000BQGQ-30Fb;
	Tue, 04 Nov 2025 08:28:02 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCOV-0000000BQFb-1RG7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 08:28:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 936BE4E414EF;
	Tue,  4 Nov 2025 08:27:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6937E606EF;
	Tue,  4 Nov 2025 08:27:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3101E10B50096;
	Tue,  4 Nov 2025 09:27:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762244875; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+TfhXHUSw3+oJhe7TatHLLAgu2372no2ChD3eKy/l5s=;
	b=EBXHeENpL10W0F4oCmAVTOvzdSsmtfVjnvaAroBm8VttjnVHcjXb/WGl/w75922sMk7AQt
	lHtJfqbXyq9DJ0SqVQhmvCy3LcbEDJcnkCbMZ9nmUZciFDquW9SUtVP1zEsveKzE68tpt7
	wDrrbjJnR1ECFRllShwir2ZobUoR6HwPU9EASh+bjRRC6DHDyWD6BzcaHbLKZNTPsvXuKb
	NLUN5TGAlU+x3zDcd8VH7m9UgcMHPkzolvkaEuytnCzR+H9VYKgxTOUEut6xc4LAQSt1k0
	DOPPzhQ7fW0hEAe9r6Mkvn1yDotU0jYcQTKY/yw0IJ7gdrg06oisVUtR/zqJdA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Haotian Zhang <vulab@iscas.ac.cn>,  richard@nod.at,  vigneshr@ti.com,
  piotr.wojtaszczyk@timesys.com,  dmitry.torokhov@gmail.com,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: lpc32xx_slc: fix GPIO descriptor leak on
 probe error and remove
In-Reply-To: <57f7989d-6f05-4b1b-a31b-4b1dca308ffb@mleia.com> (Vladimir
	Zapolskiy's message of "Mon, 3 Nov 2025 18:21:47 +0200")
References: <20251028094747.1089-1-vulab@iscas.ac.cn>
	<57f7989d-6f05-4b1b-a31b-4b1dca308ffb@mleia.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 04 Nov 2025 09:27:51 +0100
Message-ID: <871pmeb3so.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_002759_888510_A00E0EEC 
X-CRM114-Status: GOOD (  16.59  )
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

On 03/11/2025 at 18:21:47 +02, Vladimir Zapolskiy <vz@mleia.com> wrote:

> On 10/28/25 11:47, Haotian Zhang wrote:
>> The driver calls gpiod_get_optional() in the probe function but
>> never calls gpiod_put() in the remove function or in the probe
>> error path. This leads to a GPIO descriptor resource leak.
>> The lpc32xx_mlc.c driver in the same directory handles this
>> correctly by calling gpiod_put() on both paths.
>> Add gpiod_put() in the remove function and in the probe error path
>> to fix the resource leak.
>> Fixes: 6b923db2867c ("mtd: rawnand: lpc32xx_slc: switch to using gpiod
>> API")
>> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
>
> The problem is well identified, thank you for the fix.
>
>> ---
>>   drivers/mtd/nand/raw/lpc32xx_slc.c | 2 ++
>>   1 file changed, 2 insertions(+)
>> diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c
>> b/drivers/mtd/nand/raw/lpc32xx_slc.c
>> index b54d76547ffb..fea3705a2138 100644
>> --- a/drivers/mtd/nand/raw/lpc32xx_slc.c
>> +++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
>> @@ -937,6 +937,7 @@ static int lpc32xx_nand_probe(struct platform_device=
 *pdev)
>>   	dma_release_channel(host->dma_chan);
>>   enable_wp:
>>   	lpc32xx_wp_enable(host);
>> +	gpiod_put(host->wp_gpio);
>>     	return res;
>>   }
>> @@ -962,6 +963,7 @@ static void lpc32xx_nand_remove(struct platform_devi=
ce *pdev)
>>   	writel(tmp, SLC_CTRL(host->io_base));
>>     	lpc32xx_wp_enable(host);
>> +	gpiod_put(host->wp_gpio);
>>   }
>>     static int lpc32xx_nand_resume(struct platform_device *pdev)
>
> The fix can be greatly improved though, I kindly ask you to send v2 by sw=
itching
> from gpiod_get_optional() to resource managed
> devm_gpiod_get_optional().

I've already applied this fix, however I will welcome a follow-up patch.

Thanks,
Miqu=C3=A8l

