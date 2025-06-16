Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B5FC71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 09:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vR4Mo91o9W5Rfe7HfmnM13FB8xa17YYmej7HRSfPgE=; b=14A3xaH1GbofUO6TQaLCHL0ZO4
	/0rA/tq+96UnL6Z/rDLBMtzVIU6yU8f/ckV2noW3DGF2NL05eX74nRR2O2mocR95tYs0YFfEHZwfU
	EyB24WILjFec8NYpLj/iC7qmiZmafDtqwZEdpSGaArnC1pAxlqIncwq2Rg/DayCBZUHeRKto/dJmc
	INFgvr0WlciKfE7rPbPyqLRACkLqQWzNhyAJgnDbHJbljl2Fr1+k0G8D8XOyRs2n5DoSVW3CMG8lm
	PBBIKjlqk455PSGhHOmJ+dZk1TSg4RCHKy6hM9RRSTUGv/nxhwnoRMfjFFXR25/HgEwRxd8kDrtv0
	N5jrS7mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6Di-00000003viX-1sUp;
	Mon, 16 Jun 2025 09:33:38 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5ZF-00000003qXD-2kla
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 08:51:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB22543288;
	Mon, 16 Jun 2025 08:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750063905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8vR4Mo91o9W5Rfe7HfmnM13FB8xa17YYmej7HRSfPgE=;
	b=jrHj06NoqICbL4eSH/F0XmoLjMCcX8qYiJkPp8/S8yBzBsIDdROZHs1rGW4B+shClDr5w5
	4RWRcVwWqVSO0PfHdEvLs5hsWzKMc7vDEiryjiC2VVpeEfxzqacLra8GQHJifQsKwef24G
	lOb/OfPm00KTLCVwFCDYY49oISkgbZC3Yn0WPaanz39h0eevLhgMFf7yi66ob+fpIe2UZi
	3TCnJ6LYu9w//ZzMlHckkQm0odx+BU/c/h9/cpGWkAZxqKxYDbj6dvqHeeOTbPQPlCAUWE
	swSjsHxPZH96i/qiprto9lJhdqxJZ8pFDBehvlDOmAsgQuuu57tfv+TFqIhHoA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun Hung
 <schung@nuvoton.com>,  Linus Walleij <linus.walleij@linaro.org>,  Steam
 Lin <stlin2@winbond.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-arm-kernel@lists.infradead.org,
  linux-gpio@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: nuvoton: Fix boot on ma35dx platforms
In-Reply-To: <CAHp75VcfaU41FV-uN=82GdUqRadxYc6XaLX2Hr9x-4RfAV8CEg@mail.gmail.com>
	(Andy Shevchenko's message of "Sat, 14 Jun 2025 00:07:51 +0300")
References: <20250613181312.1269794-1-miquel.raynal@bootlin.com>
	<CAHp75VcfaU41FV-uN=82GdUqRadxYc6XaLX2Hr9x-4RfAV8CEg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 16 Jun 2025 10:51:42 +0200
Message-ID: <87tt4gnk69.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddviedugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopegrnhguhidrshhhvghvtghhvghnkhhosehgmhgrihhlrdgtohhmpdhrtghpthhtohephigthhhurghnghefsehnuhhvohhtohhnrdgtohhmpdhrtghpthhtohepshgthhhunhhgsehnuhhvohhtohhnrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtohepshhtlhhinhdvseifihhnsghonhgurdgtohhmpdhrtghpthhto
 hepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_015149_838696_20B873F0 
X-CRM114-Status: GOOD (  14.76  )
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

Hi Andy,

On 14/06/2025 at 00:07:51 +03, Andy Shevchenko <andy.shevchenko@gmail.com> =
wrote:

> On Fri, Jun 13, 2025 at 9:13=E2=80=AFPM Miquel Raynal <miquel.raynal@boot=
lin.com> wrote:
>>
>> As part of a wider cleanup trying to get rid of OF specific APIs, an
>> incorrect (and partially unrelated) cleanup was introduced.
>>
>> The goal was to replace a device_for_each_chil_node() loop including an
>> additional condition inside by a macro doing both the loop and the
>> check on a single line.
>>
>> The snippet:
>>
>>         device_for_each_child_node(dev, child)
>>                 if (fwnode_property_present(child, "gpio-controller"))
>>                         continue;
>>
>> was replaced by:
>>
>>         for_each_gpiochip_node(dev, child)
>>
>> which expands into:
>>
>>         device_for_each_child_node(dev, child)
>>                 for_each_if(fwnode_property_present(child, "gpio-control=
ler"))
>>
>> This change is actually doing the opposite of what was initially
>> expected, breaking the probe of this driver, breaking at the same time
>> the whole boot of Nuvoton platforms (no more console, the kernel WARN()).
>>
>> Revert these two changes to roll back to the correct behavior.
>
> Thank you for the report and the fix.
> Can we also add a comment on top of each of these if:s to prevent from
> blind change in the future?

I believe it's fine like that, The difference is subtle, it is okay and
unavoidable to make this kind of small mistake sometimes.

Cheers,
Miqu=C3=A8l

