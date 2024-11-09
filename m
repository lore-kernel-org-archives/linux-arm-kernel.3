Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2413D5E362
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 09:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRYsZ6ayQwcEYxFCPqmKlN9mSzxWMkZ1FBBiuyaMlc0=; b=m12RbrxNESRQY3Hxb/Q4tMDChi
	xSpQ0GawJzBzUvEyLTJ6lqh5I/CEDzpwTM645koq0adUUtC4yCBpFhjWX2UfpMKdM/f6Oe2HeaWrd
	9XigJ8iPvH3ev2QBUS3Gd6eFHm0oKyPBG0eX6LNnspOtw54cRdx5D88z6UQUy95+7H5/rcfYfB7GN
	XBONIwRoFlg60we8L9MPpxnmVM+FWgy4DsB5RLLO7V6PtfGEwDUhSBgNZnI+6qvqWApHiSvVoGqZB
	Tfc/CVztmcOY2I7LgGYBcMvVqPZKv0ZqqADbNmxZ758BEjcs3hXZfgUoscocfiWBB9vkEdMqir1ou
	yHR0qLQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9iBz-0000000D1lq-3VRf;
	Sat, 09 Nov 2024 09:55:43 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9i5d-0000000D14F-27Kk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 09:49:11 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-94-S7JoMMDMMHS9cQ8RB_P-nQ-1; Sat, 09 Nov 2024 09:49:05 +0000
X-MC-Unique: S7JoMMDMMHS9cQ8RB_P-nQ-1
X-Mimecast-MFC-AGG-ID: S7JoMMDMMHS9cQ8RB_P-nQ
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sat, 9 Nov
 2024 09:49:04 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sat, 9 Nov 2024 09:49:04 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Haris Okanovic' <harisokn@amazon.com>, "ankur.a.arora@oracle.com"
	<ankur.a.arora@oracle.com>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>
CC: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "will@kernel.org" <will@kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "wanpengli@tencent.com" <wanpengli@tencent.com>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"peterz@infradead.org" <peterz@infradead.org>, "arnd@arndb.de"
	<arnd@arndb.de>, "lenb@kernel.org" <lenb@kernel.org>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, "mtosatti@redhat.com" <mtosatti@redhat.com>,
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>, "cl@gentwo.org"
	<cl@gentwo.org>, "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>,
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "joao.m.martins@oracle.com"
	<joao.m.martins@oracle.com>, "boris.ostrovsky@oracle.com"
	<boris.ostrovsky@oracle.com>, "konrad.wilk@oracle.com"
	<konrad.wilk@oracle.com>
Subject: RE: [PATCH 2/5] arm64: add __READ_ONCE_EX()
Thread-Topic: [PATCH 2/5] arm64: add __READ_ONCE_EX()
Thread-Index: AQHbL7EN8akEXkbcIke1iZkICXXDerKutxnw
Date: Sat, 9 Nov 2024 09:49:03 +0000
Message-ID: <c2bee816a4a44d55951ca839fea0a6dd@AcuMS.aculab.com>
References: <20240925232425.2763385-1-ankur.a.arora@oracle.com>
 <20241105183041.1531976-1-harisokn@amazon.com>
 <20241105183041.1531976-3-harisokn@amazon.com>
In-Reply-To: <20241105183041.1531976-3-harisokn@amazon.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: a7PP8zGbzz70Ult_MhBmiSKqkDHbc8W_9LoErMJXBSc_1731145744
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_014909_842478_1653FCF4 
X-CRM114-Status: UNSURE (   5.33  )
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

From: Haris Okanovic
> Sent: 05 November 2024 18:31
>=20
> Perform an exclusive load, which atomically loads a word and arms the
> exclusive monitor to enable wfet()/wfe() accelerated polling.
>=20
...
> +=09atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(__x))__x);\

That doesn't do what you want it to do.
(It is wrong in READ_ONCE() as well.)

?: is treated like an arithmetic operator and the result will get
promoted to 'int'.
Moving the first cast outside the ?: probably works:
=09(typeof(*__x))(atomic ? __u.__val : (*(volatile typeof(__x))__x));

   David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


