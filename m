Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71782C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 15:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGJrMrC5GgDrciuEXkM5ywtIb5dq9WZZRsYzDkf8Yrg=; b=N+6nDhiy8/3ArLUI8+hJE1IArr
	wUSvomRHPHahl+3VOAxO/eAG13sYaVkyyxBwyfGymvq9Cp+2Cnyxykg695QSQCXJcUcc/+GFvQyGk
	jkQWyZtRyWsMsUqEfYgQKkkX8g7pE3f2bicIsXkMUHyOnxHJ5O6QjsdiZc9jJzlwwswz0RIO//rOx
	UaD/8acp2Kukeoz2suwEK9FwJqjXXvzGKbsGbCdeUh960s8JvNC14IlgSzBBr7cFgnDeOR+KPxM7a
	luLalD+rV59pQ+eIimBTlOvlCGpKgS8RUgLYmugtmpdlZAPeWSmc1sDXG9n7nsW1HPhbC2QG+7nIb
	FgYR5EhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKcs-0000000A8fS-1uWE;
	Fri, 25 Jul 2025 15:46:26 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKaN-0000000A8DL-05Qe;
	Fri, 25 Jul 2025 15:43:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A1F343979;
	Fri, 25 Jul 2025 15:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753458225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AGJrMrC5GgDrciuEXkM5ywtIb5dq9WZZRsYzDkf8Yrg=;
	b=ICcacUBMNsofq5G/8w66CrwZcfEtyXK1bYPPWz62hLo1wI1cIcnzLxJL7j7oQSkusQk8RV
	UcYq3BrsADr1HjqdsLTgangW8lcUEA2w+MuEnKmd5MpdfrbaSobiLIx3C4q2oCa5U+wSAn
	BR2kcZNWLaKT7pSzVYFr/TptYLX5teTmHZIis+3mH08f+kHMP0diAMiosNaKcuA9IZYOb3
	YN7ItV/IIb/KQ0fH4s55Nt2WYTrpl9l0qV1QGqaeGJ+eF0sEdEzSMZegYaLmby8e1GNMe9
	pIbyuHnGdurskVd5dshqm2B8RtobP3GIJHLGgZZm5M8SVLSoAH5eNQbnC1w8lQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Balamanikandan.Gunasundar@microchip.com>
Cc: <alexander.sverdlin@siemens.com>,  <bbrezillon@kernel.org>,
  <linux-mtd@lists.infradead.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <Nicolas.Ferre@microchip.com>,  <alexandre.belloni@bootlin.com>,
  <claudiu.beznea@tuxon.dev>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: raw: atmel: Respect tAR, tCLR in read setup
 timing
In-Reply-To: <24142dc4-a3a9-4d17-bc85-913cc9a56261@microchip.com>
	(Balamanikandan Gunasundar's message of "Tue, 22 Jul 2025 09:51:43
	+0000")
References: <20250701133333.3871085-1-alexander.sverdlin@siemens.com>
	<24142dc4-a3a9-4d17-bc85-913cc9a56261@microchip.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 25 Jul 2025 17:43:44 +0200
Message-ID: <87jz3ws2bz.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekfeelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopeeurghlrghmrghnihhkrghnuggrnhdrifhunhgrshhunhgurghrsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheprghlvgigrghnuggvrhdrshhvvghrughlihhnsehsihgvmhgvnhhsrdgtohhmpdhrtghpthhtohepsggsrhgviihilhhlohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhou
 gdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopefpihgtohhlrghsrdfhvghrrhgvsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_084351_187675_B230EDB4 
X-CRM114-Status: UNSURE (   5.21  )
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

Hi Bala,

On 22/07/2025 at 09:51:43 GMT, <Balamanikandan.Gunasundar@microchip.com> wr=
ote:

> Hi,
>
> This change looks good to me. But it didn't apply in any of my trees. Am=
=20
> i missing some thing?
>
> However I got this patch modified and tested in few of our boards.

Stable is missing, and I took the opportunity to report a nit, hence
this patch was marked done on my side, waiting for v2.

Thanks,
Miqu=C3=A8l

