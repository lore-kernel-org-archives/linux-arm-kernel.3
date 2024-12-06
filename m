Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D46E7716F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 03:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDdmm0DHzlfUIVjgSjHafTsxqy+4Kuy7LBa8PuA68Ug=; b=rpdJJ89BSRPGcUaCTRYI50USt0
	UzRdGCBU7CLNK6whbLVWDaEHP26UsnQZPZRpEqiXy3VtK7H/B48HLuWh2gbzTeNYq7kWqR+GTeqgG
	AX/VoYhx+/o4bLicZUl3/6Lp/0zElBYl8W9xSHzLnz39qyQhpY2ET6astcZH/uEfHjgVI+CUpCrge
	yG+LUo82tGYH6WC12npvdV5rmsPiDYawgJUy3/BFfIKFUQwIsqi7xufxqsxzTjtPYs8CTBJn9oagz
	BLpePRESbbWtOigi0L5PNsRKXKM/sHEKP8RXp0+EvyNeNXrY88Pa9rRLHwUjLvDDh0saRYj9YXL9X
	/Fy+N1UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJPDy-00000000SD8-1vcV;
	Fri, 06 Dec 2024 03:41:50 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJPCx-00000000S6J-1CiS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 03:40:48 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-280-C8E4fnSMOAGX_JjFtXp91A-1; Fri, 06 Dec 2024 03:40:43 +0000
X-MC-Unique: C8E4fnSMOAGX_JjFtXp91A-1
X-Mimecast-MFC-AGG-ID: C8E4fnSMOAGX_JjFtXp91A
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 6 Dec
 2024 03:39:59 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 6 Dec 2024 03:39:59 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Vincent Mailhol' <mailhol.vincent@wanadoo.fr>
CC: Linus Torvalds <torvalds@linux-foundation.org>, Luc Van Oostenryck
	<luc.vanoostenryck@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Jani Nikula
	<jani.nikula@linux.intel.com>, Joonas Lahtinen
	<joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Rikard Falkeborn
	<rikard.falkeborn@gmail.com>, Martin Uecker
	<Martin.Uecker@med.uni-goettingen.de>, "linux-sparse@vger.kernel.org"
	<linux-sparse@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, "linux-hardening@vger.kernel.org"
	<linux-hardening@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
	<intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "coresight@lists.linaro.org"
	<coresight@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 01/10] compiler.h: add statically_false()
Thread-Topic: [PATCH 01/10] compiler.h: add statically_false()
Thread-Index: AQHbROCIk5mOE+KmUE+HEr8z57N8IbLWaz+wgAFe2gCAALnCYA==
Date: Fri, 6 Dec 2024 03:39:59 +0000
Message-ID: <b48e2f5dd8d64cbab471629ae03c7511@AcuMS.aculab.com>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-1-4e4cbaecc216@wanadoo.fr>
 <e115a4245e5342a994a7e596cc6357fa@AcuMS.aculab.com>
 <CAMZ6Rq+n0vG9zObF-kY-Xo+iP_Y3P8A6_nEfB8F=UhqeQBepRw@mail.gmail.com>
In-Reply-To: <CAMZ6Rq+n0vG9zObF-kY-Xo+iP_Y3P8A6_nEfB8F=UhqeQBepRw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MMVFQcjS_l598cOL6cEL0e7KC7vZErfo-kNA5RyPEf4_1733456442
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_194047_593799_83F4A5E3 
X-CRM114-Status: GOOD (  14.53  )
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

RnJvbTogVmluY2VudCBNYWlsaG9sDQo+IFNlbnQ6IDA1IERlY2VtYmVyIDIwMjQgMTU6MjYNCj4g
DQo+IE9uIFRodS4gNSBEZWMgMjAyNCBhdCAwMzozMCwgRGF2aWQgTGFpZ2h0IDxEYXZpZC5MYWln
aHRAYWN1bGFiLmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogVmluY2VudCBNYWlsaG9sDQo+ID4gPiBT
ZW50OiAwMiBEZWNlbWJlciAyMDI0IDE3OjMzDQo+ID4gPg0KPiA+ID4gRnJvbTogVmluY2VudCBN
YWlsaG9sIDxtYWlsaG9sLnZpbmNlbnRAd2FuYWRvby5mcj4NCj4gPiA+DQo+ID4gPiBGb3IgY29t
cGxldGlvbiwgYWRkIHN0YXRpY2FsbHlfZmFsc2UoKSB3aGljaCBpcyB0aGUgZXF1aXZhbGVudCBv
Zg0KPiA+ID4gc3RhdGljYWxseV90cnVlKCkgZXhjZXB0IHRoYXQgaXQgd2lsbCByZXR1cm4gdHJ1
ZSBvbmx5IGlmIHRoZSBpbnB1dCBpcw0KPiA+ID4ga25vd24gdG8gYmUgZmFsc2UgYXQgY29tcGls
ZSB0aW1lLg0KPiA+DQo+ID4gVGhpcyBpcyBwcmV0dHkgbXVjaCBwb2ludGxlc3MuDQo+ID4gSXQg
aXMganVzdCBhcyBlYXN5IHRvIGludmVydCB0aGUgY29uZGl0aW9uIGF0IHRoZSBjYWxsIHNpdGUu
DQo+IA0KPiBUbyBzdGFydCB3aXRoLCBJIHdpbGwgYXJndWUgdGhhdDoNCj4gDQo+ICAgc3RhdGlj
YWxseV9mYWxzZShmb28pDQo+IA0KPiBpcyBtb3JlIHByZXR0eSB0aGFuDQo+IA0KPiAgIHN0YXRp
Y2FsbHlfdHJ1ZSghKGZvbykpDQoNCkV4Y2VwdCB0aGF0IHRoZSB0ZXN0IGlzIG1vcmUgbGlrZWx5
IHRvIGJlOg0KCXN0YXRpY2FsbHlfZmFsc2UoeCA+IHkpDQphbmQgdGhlIGludmVydCBpcyB0aGVu
DQoJc3RhdGljYWxseV90cnVlKHggPD0geSkNCg0KTm8gZGlmZmVyZW50IGZyb20gQyBpdHNlbGYs
IHRoZXJlIGlzIG5vICdpZm5vdCAoY29uZGl0aW9uKSB7Li4ufScNCihkb24ndCB0YWxrIHRvIG1l
IGFib3V0IHBlcmwuLi4pDQoNCkkgc3VzcGVjdCB5b3UgbmVlZCB0byBwcmV0dHkgbXVjaCByZW1v
dmUgYWxsIHRoZSBjb21tZW50cyB0aGF0DQpjcm9zcy1yZWZlciB0byBzdGF0aWNhbGx5X3RydWUo
KSBmcm9tIHRoZSBvdGhlciBwYXRjaGVzLg0KDQpTbyBpc19jb25zdF90cnVlKCkgaXMganVzdCAn
cmV0dXJuIHRydWUgaWYgdGhlIGV4cHJlc3Npb24NCmlzIGEgJ25vbi16ZXJvIGNvbnN0YW50IGlu
dGVnZXIgZXhwcmVzc2lvbicuDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFr
ZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwg
VUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=


