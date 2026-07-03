Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B58FC44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 10:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUxpJqYYa0VhNofPWE55WEfT0pzSsC+tc3Iw1yJfJ80=; b=L6N/3OM+lk+fF4suhYozeu/B0s
	WTUlIRhqIHuLoPn60BxXF3oh10HX0tPQ1Fb6Qrq66OANy1VjzovZWokSftpEw12oRzKuf/kQzw5nD
	NltPOh1SAdOTa4QQOWlyH178ML2vyMSPocxvw745Fc3yUSSr8WV+O89II6uUkzUZ0KJVFLnOqBOs9
	NsgspdXfUEpXXfQ57EPNHthegmi+PuYyoBKcWyQr1Xne1I78OohF/XarLERevLTd2nq6z1IWZ+fQc
	cOTjqRmPE25fG/Jd+QbxxHmBy++EscRG1kyj6GBS4d2u2lErgy8zC+PsZ6PzpLWm2n1h9/OZXJdCy
	Dp/IGtuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfar9-00000006Ymn-2YgH;
	Fri, 03 Jul 2026 10:10:47 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfar5-00000006YlW-2Xpn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 10:10:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7F4141A0DFC;
	Fri,  3 Jul 2026 10:10:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 50ABA60300;
	Fri,  3 Jul 2026 10:10:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EAB20104C8399;
	Fri,  3 Jul 2026 12:10:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783073438; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KUxpJqYYa0VhNofPWE55WEfT0pzSsC+tc3Iw1yJfJ80=;
	b=HKxugvqmlXpYp00MdUMi8LdjB/ut+8I3zFW6xoA9fpxouy34H7l4QeEH1BXYeBOE7FxOE9
	NjQNxmrt6ulvJwxDl30gHKLWJVYbXabaScEloreVGrP+rikqz0/W84cCWMSgkEV6pEPH35
	YSkiOVtvZQmbC5WBMXXMIgbrS71E0PZqMzeP+NCrWcFcX93tadIRVjAQ8A9tfIXM1jxKaI
	SuX6hqE52+3qO6W2bu5QjqYnXPsI0GwvUwtlbNS6AaqWB2b7Uy3ZgKjnQYUoT9jbq9quM1
	lf/0rDB21QVeASXPQ/PTNk8FNmD5by4w2OLHa48KLXakvZE970v99pA5YSpuJg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Manikandan.M@microchip.com,  krzk@kernel.org,  pratyush@kernel.org,
  mwalle@kernel.org,  takahiro.kuwano@infineon.com,  richard@nod.at,
  vigneshr@ti.com,  krzk+dt@kernel.org,  conor+dt@kernel.org,
  srini@kernel.org,  Nicolas.Ferre@microchip.com,
  alexandre.belloni@bootlin.com,  claudiu.beznea@tuxon.dev,
  linux@armlinux.org.uk,  richardcochran@gmail.com,  linusw@kernel.org,
  arnd@arndb.de,  michael@walle.cc,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  netdev@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: mtd: jedec,spi-nor: allow the SFDP
 to be exposed via NVMEM
In-Reply-To: <20260702163723.GA227454-robh@kernel.org> (Rob Herring's message
	of "Thu, 2 Jul 2026 11:37:23 -0500")
References: <20260630092406.150587-1-manikandan.m@microchip.com>
	<20260630092406.150587-2-manikandan.m@microchip.com>
	<20260702-utopian-termite-of-perfection-f1f3ec@quoll>
	<860213fd-6a4b-42d4-a8f7-7308e070f09e@microchip.com>
	<20260702163723.GA227454-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 03 Jul 2026 12:10:32 +0200
Message-ID: <8733y0penb.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_031043_771897_7302CCFC 
X-CRM114-Status: GOOD (  13.78  )
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

On 02/07/2026 at 11:37:23 -05, Rob Herring <robh@kernel.org> wrote:

> On Thu, Jul 02, 2026 at 06:55:15AM +0000, Manikandan.M@microchip.com wrot=
e:
>> Hi Krzysztof,
>>=20
>> On 7/2/26 11:46 AM, Krzysztof Kozlowski wrote:
>> > EXTERNAL EMAIL: Do not click links or open attachments unless you know=
 the content is safe
>> >=20
>> > On Tue, Jun 30, 2026 at 02:54:00PM +0530, Manikandan Muralidharan wrot=
e:
>> >> Add an optional "sfdp" child node (compatible "jedec,sfdp") that
>> >> describes the SFDP as a read-only NVMEM provider via nvmem.yaml, so i=
ts
>> >=20
>> > What is SFDP?
>> >=20
>> SFDP is the Serial Flash Discoverable Parameters -- a JEDEC-standardised
>> (JESD216) read-only parameter table present in most SPI NOR flashes, the=
=20
>> table contents provide basic information about the flash. There are=20
>> standard tables which are specified by the JEDEC standard and there are=
=20
>> vendor tables.
>
> Is SFDP present or not discoverable? Or we have a table of discoverable=20
> parameters that itself is not discoverable.

SFDP is almost always there. I don't think there are any non SFDP chips
manufactured today (?). The thing is, even if we don't need to define it
in DT, we might need to point to it in order to extract eg. a unique ID
or a MAC address through the NVMEM interface.

SFDP is split into several sub-tables, the first one is mandatory, but
then there are optional tables which can be discovered dynamically.

Thanks,
Miqu=C3=A8l

