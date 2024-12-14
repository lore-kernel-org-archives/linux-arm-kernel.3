Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97CAE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 18:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7rTlp2Fy0rmh8iTu37cPNHXE5zBs2vgpiuv/ttvAcM=; b=emQO15FAVfE4Zx1Kz31rBEGwCj
	ZGi6D72yD1m1CdJd9cP6B3Mo4CLj9t/Bo/cCr/e6fgc1/RMly14FShc3cQ4o7APkQ2k+GYD79L2IV
	8qd1DOQSkXD+WHw5MW6hFcCG5ppfplD75jidxM1z0zTfRpkay2MVlq/juKRSjxFuLIY7NziH0/uyg
	SY/AkCZvOxvWxeOvA2StBJNbkN6G//miqoh/OW5dB68O4Z8r162w9WZuzJRS8lPySg6gzf5vL6E0f
	+wPwUkMsalMLDBeJJgv16Bcc8cZIf1NyTesGC8PsxXK7rxhhH2ZnWNNMBPj0PvAP+a4hFrarAcOGu
	s8bgNHaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMX5s-00000006nKA-01Ws;
	Sat, 14 Dec 2024 18:42:24 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMX4j-00000006nAH-0Mzp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 18:41:14 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-280-3Kd5c3ElMVu5EUN2SKtuRQ-1; Sat, 14 Dec 2024 18:41:08 +0000
X-MC-Unique: 3Kd5c3ElMVu5EUN2SKtuRQ-1
X-Mimecast-MFC-AGG-ID: 3Kd5c3ElMVu5EUN2SKtuRQ
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sat, 14 Dec
 2024 18:40:11 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sat, 14 Dec 2024 18:40:11 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Arnd
 Bergmann" <arnd@arndb.de>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-rt-devel@lists.linux.dev" <linux-rt-devel@lists.linux.dev>, "Ard
 Biesheuvel" <ardb@kernel.org>, Clark Williams <clrkwllms@kernel.org>, "Jason
 Baron" <jbaron@akamai.com>, Josh Poimboeuf <jpoimboe@kernel.org>, "Linus
 Walleij" <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>
Subject: RE: [PATCH 3/4] ARM: drop CONFIG_HIGHPTE support
Thread-Topic: [PATCH 3/4] ARM: drop CONFIG_HIGHPTE support
Thread-Index: AQHbSx10HM4hb1GiOk+xX2rPfGcyA7LmGAAw
Date: Sat, 14 Dec 2024 18:40:11 +0000
Message-ID: <d54e11cf3f4d4216b5cecf29b761cd45@AcuMS.aculab.com>
References: <20241210160556.2341497-1-arnd@kernel.org>
 <20241210160556.2341497-4-arnd@kernel.org>
In-Reply-To: <20241210160556.2341497-4-arnd@kernel.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -wkkBzYO6s9Sm1a3XEnBZwPO6XsPCB_i9PPg-BOOIco_1734201667
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_104113_537418_8A93D95C 
X-CRM114-Status: UNSURE (   7.90  )
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

From: Arnd Bergmann
> Sent: 10 December 2024 16:06
...
> Since Arm is the last architecture remaining that uses this, and almost
> no 32-bit machines support more than 4GB of RAM, the cost of continuing
> to maintain HIGHPTE seems unjustified, so remove it here to allow
> simplifying the generic page table handling.

'Picking at nits' 'highmem' support was needed for systems with 4GB of RAM
in order to use more than 3GB or 3.5GB (depending on the bios) because
of the physical addresses that are reserved for PCI (and other MMIO).

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


