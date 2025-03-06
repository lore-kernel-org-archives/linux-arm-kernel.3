Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7289FC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 09:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	References:In-Reply-To:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nGwcEVedx/JIyaFBS6j1W8a/OxxJvsbDFiq4EOhTUjo=; b=y4if6DunmVjdE5y4deKU6rsArq
	0XILuHoMApYvLYXFMe7uxEASu52047EY9OOXNDhW0ctE1n2fDMtikf2j+rWecUVEZQY2vZAXkjC48
	R82129dF1oh951WWlJaOtKJxWwbyYBvPgF1WlXu7hCo0rmtIkFo6Ou7c8Vkk4VXU9BwH3ScDxWCzl
	z8IsnbH143/vY+DD3zXZUV2LClhz0YghTz1ZjKUaR0grL6Cz/q9bPn26e1rSf6K6EIg4+Lti1K70R
	2ePWeFFeGaQsXuz1z9Jviz/QK7PXaGh3YicWP7tBoaOaDndNu5vpx4vFrhGBgEVObYRs3aFL8ZO9K
	8P/1Z7MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7A7-0000000AQhr-3GNB;
	Thu, 06 Mar 2025 09:05:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq72A-0000000APPV-3WXO;
	Thu, 06 Mar 2025 08:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nGwcEVedx/JIyaFBS6j1W8a/OxxJvsbDFiq4EOhTUjo=; b=k3byhzb00j7wIBgkXRuB3E8pTS
	/OQuf6LoqeNMJUOmIoB84peIoeaFfhwnL9Ps5VGAvTo8fqksJqagO5aOKcJRiV6UBMBeQN7vZ+u9v
	zzarYUAigIDkK4Tc9YeAwWk/AHoOauZ9BOyeoIxGRAajOddAt9MmcjXRbeZJwrq8r3Ew1yUJnr7f/
	EeLtyuSImhORYXRbjeHRBhdAly6qv1RNUzQEyYA/A9ULL6kPa8S61uZV+7hESCnFSW+d/ei1Z6GqW
	1X8eN7KPvqGLVPIALgm2thLbusDZ1TzTDASD2VvaQOMyoy0YWFfyR4PBs61mhJRe/0ElYOOydVfHg
	fnjKyHVQ==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq727-00000000yg6-295I;
	Thu, 06 Mar 2025 08:56:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 095C644346;
	Thu,  6 Mar 2025 08:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741251403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nGwcEVedx/JIyaFBS6j1W8a/OxxJvsbDFiq4EOhTUjo=;
	b=bcsa9PFyZi1TSiKo447e1/X2al16CgcgnqKVunZQwmCl3qnrX42lHDEfhvyrbmi8JXKkhB
	n46Csjqw3jAiRBM19KIhHdgmgeuOcDB9nXpJmo2rqQc6VkrgUp7DkciYqtcArEWHn73+zs
	vOaVZVP1a9rn2+5TNQVfaCcttQlc7xWDfaaCNHhImxl/3QrjVunzqykZTzJ+uZrQDZpbrk
	mQc62IoiFiU82VxHheDJGLNJIe17Q+EtySnPObBAlP183ahUQNB1rJMFzBM0rLgZNyf9gN
	ihY0C10PIAZEEmNNvFV5HSlCP3iqRxg87xIM0B21c1zjCt7p66avf6QbXYbKxg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: sst: register SFDP region into NVMEM
 framework to read MAC Address
In-Reply-To: <D891QPQIT13L.1S55ZM1J286PE@kernel.org> (Michael Walle's message
	of "Thu, 06 Mar 2025 09:39:31 +0100")
References: <20250305100134.1171124-1-manikandan.m@microchip.com>
	<D889CRJC6W19.2LDQCDVG7BLNG@kernel.org>
	<6fee6e71-106f-474b-9a0c-5df5fb0caa00@microchip.com>
	<87eczawo9q.fsf@bootlin.com> <D891QPQIT13L.1S55ZM1J286PE@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 06 Mar 2025 09:56:42 +0100
Message-ID: <87o6yev8ol.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdejfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopehmfigrlhhlvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepofgrnhhikhgrnhgurghnrdfosehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheppfhitgholhgrs
 hdrhfgvrhhrvgesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtuhigohhnrdguvghv
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_085647_675902_C4E16664 
X-CRM114-Status: GOOD (  14.57  )
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
Cc: Manikandan.M@microchip.com, robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org, vigneshr@ti.com, devicetree@vger.kernel.org, richard@nod.at, alexandre.belloni@bootlin.com, tudor.ambarus@linaro.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev, Varshini.Rajendran@microchip.com, krzk+dt@kernel.org, pratyush@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


>> >> I don't think it makes sense to have this one-off in a particular
>> >> driver. If at all, this should be handled in the core. Sorry, but
>> >> this really looks like an ugly hack.
>> >>=20
>> >
>> > Because the EUI identifier within the SFDP is unique to the=20
>> > SST26VF064BEUI flash, I opted to handle it here rather than in the cor=
e.
>> >
>> > Also here the MAC address data resides within the 0x260-0x26F range, I=
=20
>> > will resize the nvmem_config.size to 0x10 instead of registering the=20
>> > full SFDP region as NVMEM.
>>
>> Open question to all parties in this thread: how do we give an offset in
>> the device tree that is relative to the sfdp region and not the data
>> region? I believe we care not to mix these areas while describing.
>
> You don't do it, because there is not even a relative offset that is
> fixed. There should be a pointer to the vendor table inside the SFDP
> structure. Thus, you need to properly parse it.

If there is nothing static and the location can be derived by reading
the chip tables, I'd suggest to offload this out of the spi-nor core and
instead use some kind of an nvmem layout driver to retrieve the
corresponding region?

> Regarding how to reference it within the device tree, I'd assume
> something along 'compatible =3D "jedec,sfdp-vendor-table-NNN";' or
> similar. But no static/relative offsets.

I see. We need to invoke our DT binding gurus.

Cheers,
Miqu=C3=A8l

