Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02413CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 17:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5JzFqGxHzHN5rnVUak2+jKVigs7VEUnyyVH0rb7Zh1U=; b=Jy87t9HpWf8mJtyxWPsHVU6/1N
	+QoW6AXCnXRhR5VCwvftE+QytPedOHJmm3dLjg6Q4gmOMEB9PBZG7aBabBxY0jCKJpzkdJjSfD7Q0
	dwHYhxsMoaViMy/0C+xsZRlDBM7tyRgUQhIGA3CPlvoEqIy9ow/XS8rmOmZakvdB2bDPnzZXJWZsF
	hUWkrT2te3H5M4eaLKTfMqAWHjkQFENGyj0v6u9lmnZgsQrsk/+rXUTpWBjmGVKb3KKbBoV19DsfF
	yXK0Plyd2+iIgmxX1YrHzIHte/xQ2NJZ1+7NSIFhFr/mIf57UUOwtpVjAP3jGTy0tE8A+zMGerK+R
	O4mSh/lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgjF-0000000DmLG-2WFB;
	Tue, 13 Oct 2026 17:55:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgjF-0000000DmLA-0pwY
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 17:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5JzFqGxHzHN5rnVUak2+jKVigs7VEUnyyVH0rb7Zh1U=; b=hon0RSKUJrDDIIj46yaFAMjyYp
	JgbYPnOOTtOuPjMDtHPL9RkwlJhBb/XydcEiVRs3i7VdeZ3vR4dq0rkdZVWtuzKCogBpwoMXOXGYD
	Ij9NdJQy/cl35OsIspeyLl9+v9vFmoioDNyhM/GiiYehwViBKnZ7ow001Z0elJiHjTQvOvN7EMrxs
	QrWYybCj7xiFVaPmST3IXJxOsAE1ZDPa6M9IYQmAFt/aDjTF27rp7qvB6Xqjj9uoUPup/K5oXmPhk
	mWpsdhHXH3opqP01NH/+t2f9mXHq62GqPkCKkIzhzbTEw5Wn2q3ZV3AKyKk3nHLIvNZDG7F6BFBX8
	0TEpxb7Q==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGgjC-0000000FtTo-1DHG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 17:55:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1C134C653FA
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 17:56:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A7726075C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 17:55:52 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 01C7911D718C1; Tue, 13 Oct 2026 19:49:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791914152; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5JzFqGxHzHN5rnVUak2+jKVigs7VEUnyyVH0rb7Zh1U=;
	b=Vctox5wWoeRxml3XUIb5H/SML7kLIV5LLbzjghzY54RfWBymoC+4xbARJqpByfO/nFmjBS
	PIX49sW4FhlmriAGJqRwisbnDGfjuVxhu9bvYAIk/XKvOn78TrB8RZYyQCMRsfw6hczihM
	qWkMbSMQYSETiEN7FYTcbyKQsB5XCdOttikiqFcIdlnIxZI291xzg6Gj23UHleznuZG3O6
	ihCsdyYdoPU5jM6Q/JkQbZIEKZKTPtYmNhoqivi+3q95JHXuiHJvG6zZLrVsvhSOFiOFJy
	PaZZruKyDgWRapgSowJaJpZwHPOTT43xUaYnJXcoIrVmbxa8NapCNG6PSAR8fQ==
Authentication-Results: mail.galae.net;
	none
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: mvebu: dt for v7.4 (#1)
In-Reply-To: <28ced1ee-b0e0-49a9-a414-0b1e6eeb28fa@kernel.org>
References: <87o6d96w7w.fsf@BLaptop.bootlin.com>
 <b2e182bc-6707-4147-bc04-fba3c379160f@kernel.org>
 <28ced1ee-b0e0-49a9-a414-0b1e6eeb28fa@kernel.org>
Date: Fri, 09 Oct 2026 16:35:15 +0200
Message-ID: <87y0c754d8.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: TMJZZvMpmX7E
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 01C7911D718C1
X-Spamd-Result: default: False [1.49 / 30.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[99];
	BAYES_HAM(-0.91)[79.82%];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	BCC(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[BLaptop.bootlin.com:mid,bootlin.com:url,localhost:rdns,localhost:helo];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,lists.infradead.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_185554_404233_5B9A373A 
X-CRM114-Status: GOOD (  12.00  )
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

Hello Krzysztof,

> On 09/10/2026 09:21, Krzysztof Kozlowski wrote:
>> On 04/10/2026 22:34, Gregory CLEMENT wrote:
>>> ----------------------------------------------------------------
>>> Krzysztof Kozlowski (1):
>>>       ARM: dts: marvell: Replace spaces indentation with tabs
>>>
>>> Rosen Penev (10):
>>>       ARM: dts: helios4: fix lm75 supply name
>>>       ARM: dts: armada-385-clearfog-gtr: fix vmmc property name
>>>       ARM: dts: marvell: add missing SDHCI clock-names
>>>       ARM: dts: armada-395-gp: drop unsupported SDHCI clock-frequency
>>>       ARM: dts: armada-388-helios4: fix vmmc property name
>>>       ARM: dts: helios4: fix vbus-supply for USB2 PHY
>>>       ARM: dts: helios4: fix spi1 location
>>>       ARM: dts: helios4: use national,lm75 compatible
>>>       ARM: dts: helios4: add #phy-cells to USB nop phys
>>>       ARM: dts: marvell: armada-388: use onnn,pca9655 compatible
>>=20
>> Your pull introduces new warnings for undocumented compatibles:
>>=20
>> https://lore.kernel.org/all/202610021617.AlVUa9No-lkp@intel.com/

Is it OK to resubmitted a PR without the patch introducing the error ?

>>=20
>
> And I found the binding patch which is not right (which was pointed out
> at v1 but never responded to), so neither is DTS change.

I finally found what you refereed;
https://lore.kernel.org/all/20260907-unnamable-geography-d04f61df0fe5@spud/

I was not in CC for this one, and indeed when applying the patch I only
checked that the driver supports the compatible string, I wrongly
assumed that if the driver support it then the binding was already
merged. Sorry for the mess.

Regards,

Gregory

>
> Best regards,
> Krzysztof

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

