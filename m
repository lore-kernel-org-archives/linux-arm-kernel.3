Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C6EE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 20:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rbh5TWgsPQHCr8mZMQrSTFvQQ1zh/W5KLl3JgtcPfSk=; b=YtDy4gKN9eqMQF0/SfSYimUv5s
	kcqlA61AgpaVBZY10lknkqCY/JJ/6airFHIERFnoP6VAh7uQtWOWzGp6YVdd+Ao45FUijXYgl35g5
	n44nL165h6bhcXHYptBRQ92LqbmZSf82mR4t9n7AgLBjhFwYzlzwBh9J+Ubb8RDOC4Cuuk7wlyjvv
	9Lh4rPY9e/T4Nu4waKnXwZf+69CMeJwclvmfLjPTwpDDi7+0bw22O/A1kRS2fuwMBD+MB8rgSZtdW
	cF2h3veElHK0JMkdrxJZ9WsoozplK6Ix+YYFWoNUNRx6QrZlqvGBcxfpbJKt/UJmkUsGXNVEhxdLM
	pDLaDs2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJete-00000002gIn-2Bnh;
	Fri, 06 Dec 2024 20:25:54 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJesc-00000002gED-0JNG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 20:24:51 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-17-T5q5JrNWPoSE2npJYwkYcg-1; Fri, 06 Dec 2024 20:24:46 +0000
X-MC-Unique: T5q5JrNWPoSE2npJYwkYcg-1
X-Mimecast-MFC-AGG-ID: T5q5JrNWPoSE2npJYwkYcg
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 6 Dec
 2024 20:23:59 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 6 Dec 2024 20:23:59 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Linus Torvalds' <torvalds@linux-foundation.org>
CC: 'Vincent Mailhol' <vincent.mailhol@gmail.com>, 'Luc Van Oostenryck'
	<luc.vanoostenryck@gmail.com>, 'Nathan Chancellor' <nathan@kernel.org>,
	"'Nick Desaulniers'" <ndesaulniers@google.com>, 'Bill Wendling'
	<morbo@google.com>, 'Justin Stitt' <justinstitt@google.com>, 'Yury Norov'
	<yury.norov@gmail.com>, 'Rasmus Villemoes' <linux@rasmusvillemoes.dk>, 'Kees
 Cook' <kees@kernel.org>, "'Gustavo A. R. Silva'" <gustavoars@kernel.org>,
	'Jani Nikula' <jani.nikula@linux.intel.com>, 'Joonas Lahtinen'
	<joonas.lahtinen@linux.intel.com>, 'Rodrigo Vivi' <rodrigo.vivi@intel.com>,
	'Tvrtko Ursulin' <tursulin@ursulin.net>, 'David Airlie' <airlied@gmail.com>,
	'Simona Vetter' <simona@ffwll.ch>, 'Suzuki K Poulose'
	<suzuki.poulose@arm.com>, 'Mike Leach' <mike.leach@linaro.org>, 'James Clark'
	<james.clark@linaro.org>, 'Alexander Shishkin'
	<alexander.shishkin@linux.intel.com>, 'Rikard Falkeborn'
	<rikard.falkeborn@gmail.com>, "'linux-sparse@vger.kernel.org'"
	<linux-sparse@vger.kernel.org>, "'linux-kernel@vger.kernel.org'"
	<linux-kernel@vger.kernel.org>, "'llvm@lists.linux.dev'"
	<llvm@lists.linux.dev>, "'linux-hardening@vger.kernel.org'"
	<linux-hardening@vger.kernel.org>, "'intel-gfx@lists.freedesktop.org'"
	<intel-gfx@lists.freedesktop.org>, "'dri-devel@lists.freedesktop.org'"
	<dri-devel@lists.freedesktop.org>, "'coresight@lists.linaro.org'"
	<coresight@lists.linaro.org>, "'linux-arm-kernel@lists.infradead.org'"
	<linux-arm-kernel@lists.infradead.org>, "'uecker@tugraz.at'"
	<uecker@tugraz.at>
Subject: RE: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
Thread-Topic: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
Thread-Index: AQHbROFPJXcuwP9wN0+yRzIQ2cx/pbLWa+gggAFf14CAACMqUIABpzoGgAAClHCAAAPoAIAAAwjggAANnsA=
Date: Fri, 6 Dec 2024 20:23:59 +0000
Message-ID: <e806dd51b1ac4e289131297fbf30fc37@AcuMS.aculab.com>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
 <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
 <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
 <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
 <d23fe8a5dbe84bfeb18097fdef7aa4c4@AcuMS.aculab.com>
 <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
 <0f5c07b827c3468c8fa3928a93a98bfa@AcuMS.aculab.com>
In-Reply-To: <0f5c07b827c3468c8fa3928a93a98bfa@AcuMS.aculab.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hR7jPVTudbCrYmnLw8d2_WyPOWDPfdaBDcug7xUHSEw_1733516685
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_122450_380084_187D7824 
X-CRM114-Status: UNSURE (   7.59  )
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

Li4uDQo+ID4gPiAjZGVmaW5lIGNvbnN0X05VTEwoeCkgX0dlbmVyaWMoMCA/ICh4KSA6IChjaGFy
ICopMCwgY2hhciAqOiAxLCB2b2lkICo6IDApDQo+ID4gPiAjZGVmaW5lIGNvbnN0X3RydWUoeCkg
Y29uc3RfTlVMTCgoeCkgPyBOVUxMIDogKHZvaWQgKikxTCkpDQo+ID4gPiAjZGVmaW5lIGNvbnN0
X2V4cHIoeCkgY29uc3RfTlVMTCgoeCkgPyBOVUxMIDogTlVMTCkpDQo+ID4gPiBJIHNlbmQgdGhp
cyBtb3JuaW5nLg0KPiA+ID4gTmVlZHMgJ3MvY2hhci9zdHJ1Y3Qga2pramtqa2p1aS8nIGFwcGxp
ZWQuDQo+ID4NCj4gPiBPaCBDaHJpc3QuIFlvdSByZWFsbHkgYXJlIHRha2luZyB0aGlzIHdob2xl
IHVnbHkgdG8gYW5vdGhlciBsZXZlbC4NCj4gDQo+IEkgc29ydCBvZiBsaWtlZCB0aGF0IHZlcnNp
b24gaW4gYSBwZXJ2ZXJzZSBzb3J0IG9mIHdheS4NCj4gSXQgZG9lcyBnaXZlIHlvdSBhIHNpbXBs
ZSB0ZXN0IGZvciBOVUxMICh1bmxlc3MgeW91J3ZlIHVzZWQgJ3N0cnVjdCBramtqa2pranVpJyku
DQoNCkV4Y2VwdCBjb25zdF9OVUxMKCkgcmVhbGx5IGRvZXNuJ3Qgd29yayBhdCBhbGwgLSBzbyB5
b3UgYXJlIGx1Y2t5IDotKQ0KDQpTbyBtYXliZSB0aGUgc2xpZ2h0bHkgbG9uZyBsaW5lczoNCiNk
ZWZpbmUgY29uc3RfdHJ1ZSh4KSBfR2VuZXJpYygwID8gKHZvaWQgKikoKHgpICsgMCA/IDBMIDog
MUwpIDogKGNoYXIgKikwLCBjaGFyICo6IDEsIHZvaWQgKjogMCkNCiNkZWZpbmUgY29uc3RfZXhw
cih4KSBfR2VuZXJpYygwID8gKHZvaWQgKikoKHgpICsgMCA/IDBMIDogMEwpIDogKGNoYXIgKikw
LCBjaGFyICo6IDEsIHZvaWQgKjogMCkNCg0KSSBtYWtlIHRoYXQgOTggY2hhcmFjdGVycy4NCk9m
IGNvdXJzZSwgeW91IGNhbiByZW1vdmUgYWxsIHRoZSBzcGFjZXMsIG9ubHkgb25lIG9mIHRoZSBj
b25zdGFudHMgbmVlZCB0aGUgTCBzdWZmaXgNCmFuZCAnaW50JyBpcyBhIHNob3J0ZXIgdHlwZSBu
YW1lLg0KVGhhdCBjdXRzIGlzIGRvd24gdG8gNzY6DQojZGVmaW5lIGNvbnN0X2V4cHIoeCkgX0dl
bmVyaWMoMD8odm9pZCopKCh4KSswPzBMOjApOihpbnQqKTAsaW50KjoxLHZvaWQqOjApDQp3aGlj
aCBzdGFydHMgbG9va2luZyBsaWtlIHRoZSBURUNPIGNvbW1hbmRzIHRvIHBhcnNlIGl0cyBjb21t
YW5kIGxpbmUhDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJy
YW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lz
dHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=


