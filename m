Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F7DFF887E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 14:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9iwjdiY9HfxG0fPYsz/o47Tp5boM0lZqduksjt0UfQ=; b=BG0WI/NgEuUf38mJLb0tc/7Cve
	bvpvqV2k5aPhB973cNz1qy7daCzi76Dhf6ACoaB9OnJbTq/JW1xsyHW1VZ7XviqfqyithsNweCTAS
	4nUBn1MetE8or8ES5PM8vPmqlOmVfTLsrsfRBavsFH0Gkug46y3dM0O+atcIHSdfu/eJd7V6vHnfR
	nOeFZxsEzKe4lKWwUhSlmdnFgtGUSNcBOkIdoMlPIePqWakYefLJPla3jWNfdWATeruJL0g6Ebp2C
	x2u4voTzlzCDSh5dDr/ZYByhK9xzobQ4ahqqkJph8sQ1z28bLADwyrUge9/TT7m7vqLfXito35jzc
	YVMemVSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5wu-00000003ljY-0vma;
	Wed, 29 Apr 2026 14:31:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5ws-00000003lit-3hpo
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Apr 2026 14:31:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=c9iwjdiY9HfxG0fPYsz/o47Tp5boM0lZqduksjt0UfQ=; b=Ctw37pcM7Lt2WnJWX8Wc2OfE7a
	w+actjxAVFsFcfVXF9FCLoKDTJmWCVRAEOwTLhGEzauWNGCd90tNu8zdS8FuwZPA/SQK52k16biBE
	VMK0DhFYKwysq0+oL5W/VQuZdm+bmxKLflUqeprg4liDT/hJkrDINyy9v0wLLbHDgegzc67Rfpe4W
	F7j4ndjt7q7pegoIZf16mwtlUCJz52XaKUOH0tR5NQSeggq2eRC2jBlkgxyEMIOjPLX6ESb+0tlHQ
	OKZJr3LzX2CekrfVvkOrFufOpnw1DoktDYpcgxTXCkO5+kEbsBIHcF5YAq1mAqQQai2TIBM2iBJwu
	SHF8kg9w==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5wp-00000005XK7-2iIf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 14:31:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 71D0CC5EF2A;
	Wed, 29 Apr 2026 14:32:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 338E0601DF;
	Wed, 29 Apr 2026 14:31:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0557B10729F10;
	Wed, 29 Apr 2026 16:31:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777473077; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c9iwjdiY9HfxG0fPYsz/o47Tp5boM0lZqduksjt0UfQ=;
	b=BwRQtTWjuP4S0+ncmYcC4KRp2moY/crlDfs0ZYChN7x3hoVW1bafofhycD0Jo3IqKaHSId
	M6Ch/gSwzl/VILP03mHTjnOFPE6R1vLZpUqpzsqE4u7kRku21Ng6eMTuumqpoOvJg3qrZR
	lt/yCmVXP4N5099nG4A0bJmRQ/HmRShj5YoP1QsFdazUSz+rI/lu1Z+M51gWeKWJxKWc7o
	AG8VYtAqsUZfgcrmdXH0TPgb0zsmIqnuqzcRsTvps0jVZVsXfEjDPtWW+ap7idAg4DsE0P
	WCeUmyth+W8U8dv6fdu/pEclYXmt+cfHH7Yhu4Df3VO5NiPIoFrCb/Jp6HLAiQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Russell King <linux@armlinux.org.uk>,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] ARM: at91: remove unnecessary
 of_platform_default_populate calls
In-Reply-To: <20260429-blazing-thus-c1a4eb9b6b0c@thorsis.com> (Alexander
	Dahl's message of "Wed, 29 Apr 2026 15:02:22 +0200")
References: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
	<20260105-at91-probe-v3-3-594013ff2965@kernel.org>
	<20260423-stoke-ocean-139dbe306256@thorsis.com>
	<20260424-worried-renewal-924d34ed945c@thorsis.com>
	<87tsswfnmy.fsf@bootlin.com>
	<20260429-lushly-greasily-c14c01c1aee8@thorsis.com>
	<87lde6cdc4.fsf@bootlin.com>
	<20260429-blazing-thus-c1a4eb9b6b0c@thorsis.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 29 Apr 2026 16:31:16 +0200
Message-ID: <87fr4ddeiz.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_153131_821117_EAB474F0 
X-CRM114-Status: GOOD (  15.01  )
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

On 29/04/2026 at 15:02:22 +02, Alexander Dahl <ada@thorsis.com> wrote:

> Hello Miquel,
>
> Am Wed, Apr 29, 2026 at 11:42:19AM +0200 schrieb Miquel Raynal:
>> Hi Alexander,
>>=20
>> >     [    0.958298] bus: 'platform': add driver atmel-ebi
>> >     [    0.958451] platform 10000000.ebi: bus: 'platform': __driver_pr=
obe_device: matched device with driver atmel-ebi
>> >     [    0.958566] platform 10000000.ebi: error -EPROBE_DEFER: wait fo=
r supplier /ahb/apb/pinctrl@fffff400/ebi/ebi-data-lsb
>> >     [    0.958649] platform 10000000.ebi: Added to deferred list
>> >     [    0.959429] bus: 'platform': remove driver atmel-ebi
>> >     [    0.959540] driver: 'atmel-ebi': driver_release
>>=20
>> Interesting.
>>=20
>> If you look at the very last line of the driver, the EBI driver does not
>> use a standard "module_platform_driver" macro, it uses some kind of
>> run-once probe that is kept in an __init section:
>> https://elixir.bootlin.com/linux/v7.0.1/source/drivers/memory/atmel-ebi.=
c#L637
>>=20
>> And this seems to be incompatible with probe deferrals:
>> https://elixir.bootlin.com/linux/v7.0.1/source/drivers/base/platform.c#L=
948
>
> Indeed. o.O
>
>> I would suggest trying something alone these lines:
>>=20
>> --- a/drivers/memory/atmel-ebi.c
>> +++ b/drivers/memory/atmel-ebi.c
>> @@ -633,5 +633,6 @@ static struct platform_driver atmel_ebi_driver =3D {
>>                 .of_match_table =3D atmel_ebi_id_table,
>>                 .pm =3D &atmel_ebi_pm_ops,
>>         },
>> +       .probe =3D atmel_ebi_probe,
>>  };
>> -builtin_platform_driver_probe(atmel_ebi_driver, atmel_ebi_probe);
>> +builtin_platform_driver(atmel_ebi_driver);
>>=20
>> Memory taken by the probe function will remain mapped. That seems to be
>> the drawback.
>
> This works.  Sent a patch, see:
>
> https://lore.kernel.org/all/20260429125930.844790-1-ada@thorsis.com/
>
> Regarding the drawback: This can't be much memory, can it?

I guess it is preferable to have the probe mapped at the cost of a few
hundred more RAM bytes than a brick...

Good to know that this fixed your problem.

Thanks,
Miqu=C3=A8l

