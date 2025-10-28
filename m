Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919EECCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 16:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2gmi5A9sdMhOB9KSfIt5x+ZIc+vGxgYVE8BEvo1P9M=; b=wsxdu8wTPuDLwSGe1jF5rnFgZ7
	a7978VmP2V2F/HqxXbFFIpOBK5yY1RSpsDmFTwXLvUd+XZvcH9rvY8VbQZFUQZJ8aglH7deL6kZs7
	8WwTIkPWmXjmZjfEmhQHx0S4ovpCJKvD4BtRoR7asQY9LLtRsXx8VBea6S7Mnh99eW0002wILpeGy
	J4bP1PJgJYLNwWP4/h7A0zgPo3zy+LvilbpVKKXoe4w7cJD1P0k2yAE0O1QN8q9Y0pdQhqRznP0Ew
	Cxv4iDQwT/+7n60/pdd1TialovJFRvIfZaYlIexOhNnV4TN5wFMJUcFX3u430v6kcfES4I8PYf3hJ
	hQ00Tvtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmRX-0000000GIvU-2kNF;
	Tue, 28 Oct 2025 16:21:07 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmRQ-0000000GIu1-3z8L;
	Tue, 28 Oct 2025 16:21:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7148A1A170E;
	Tue, 28 Oct 2025 16:20:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40FF0606AB;
	Tue, 28 Oct 2025 16:20:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9DA7B117AC2F7;
	Tue, 28 Oct 2025 17:20:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761668457; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z2gmi5A9sdMhOB9KSfIt5x+ZIc+vGxgYVE8BEvo1P9M=;
	b=KCJnb7ZSsKeg4swbTs2c0T6Pg/HT+ws9lWd6MSyvhjUkIl7Q6MhbEsl/T5zqMTATMJAGI9
	+AcpEDrRx7loU39FZ/fM5LH4yxFqJEosm00gIDdispbgdjpE/aNCbUav02KAsaG7c/13jT
	gHJlm6Ea/1YV8NSJFbWcHzUCpgyxgxXA+eJqksWBGk7EGFLut/Z+1aKbo7ZoudjToC6PZD
	84QFupfTS0L5VwpWLPVW++YDZoKCVqr1YoCfSWwVb74hAa8l3PV0jvm0EF+nnf5eTXRLwk
	taILyzLFkR6wt/aT5PaWbxhw9YFJwIHQJ6TnsjXc8197SvOSRQ9kkhOJdF/7rQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@csie.org>,  Samuel Holland <samuel@sholland.org>,  Richard Genoud
 <richard.genoud@bootlin.com>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,  Wentao Liang <vulab@iscas.ac.cn>,  Johan
 Hovold <johan@kernel.org>,  Maxime Ripard <mripard@kernel.org>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/16] mtd: rawnand: sunxi: rework pattern found
 registers
In-Reply-To: <6097267.MhkbZ0Pkbq@jernej-laptop> ("Jernej =?utf-8?Q?=C5=A0k?=
 =?utf-8?Q?rabec=22's?= message of
	"Tue, 28 Oct 2025 16:41:48 +0100")
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
	<20251028073534.526992-8-richard.genoud@bootlin.com>
	<6097267.MhkbZ0Pkbq@jernej-laptop>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 28 Oct 2025 17:20:41 +0100
Message-ID: <87v7jz576u.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_092103_005172_A472FB5E 
X-CRM114-Status: UNSURE (   7.04  )
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

On 28/10/2025 at 16:41:48 +01, Jernej =C5=A0krabec <jernej.skrabec@gmail.co=
m> wrote:

> Dne torek, 28. oktober 2025 ob 08:35:00 Srednjeevropski standardni =C4=8D=
as je Richard Genoud napisal(a):
>> On H6/H616, the register ECC_PAT_FOUND is at its own address, and not
>> part of ECC status register.
>> So, introduce the pattern found register offset in sunxi_nfc_caps, along
>> with its mask.
>>=20
>> Also, introduce a non compile-time field_get() because FIELD_GET() and
>> u32_get_bits() don't work with non compile-time constant.
>> https://lore.kernel.org/all/cover.1761588465.git.geert+renesas@glider.be
>
> Urls should use Link: tag and be placed at the bottom.

I was about to apply, so I'll fix this while applying.

>
> Code itself looks fine.

Thanks for the review!

Miqu=C3=A8l

