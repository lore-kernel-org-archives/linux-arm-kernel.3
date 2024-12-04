Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F47E77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 19:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHwjlkQR3ShY5K4tBiUFaFw+YpTmPQOJPvoRV0HZLBA=; b=ohEMrmcRdesf9WxhHgnauH/RNU
	psIqv6LX9+/vpDk967NNiE1duTk1YQv5Mqr469DgfMubMogVQYD2oF6Zf1wd38hNG6ORfGtbk4ys6
	ENCzyDMTsyrS2ZgkLjm6UQRAUHeOBkPklpCpatm8gF4IL4yhsDraS5AaUiowo4hAvPyg5GH+ASTRq
	sBIsgbzsEnI0fVLbd45lOWknigpVKXpbn7PYK5kr+TmmAzfd9nxRE2k985UTMOn+WdQMZidbeGmyb
	1+bo8pWUuUA68SQ2vM+oxbmbM5mHzq7kxck641E92j8JmCbMMsY+wCrzbS2FAzMk1DwfFxXstzS0U
	A+vuFMpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIubj-0000000DbDh-1mmJ;
	Wed, 04 Dec 2024 19:00:19 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIuai-0000000Db5U-3LJo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 18:59:18 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-94-4n0Sm6D0MO2WXn6s9TvfQw-1; Wed, 04 Dec 2024 18:59:14 +0000
X-MC-Unique: 4n0Sm6D0MO2WXn6s9TvfQw-1
X-Mimecast-MFC-AGG-ID: 4n0Sm6D0MO2WXn6s9TvfQw
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 4 Dec
 2024 18:58:36 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Wed, 4 Dec 2024 18:58:36 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Linus Torvalds
	<torvalds@linux-foundation.org>, Luc Van Oostenryck
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
	<Martin.Uecker@med.uni-goettingen.de>
CC: "linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 06/10] fortify: replace __is_constexpr() by is_const() in
 strlen()
Thread-Topic: [PATCH 06/10] fortify: replace __is_constexpr() by is_const() in
 strlen()
Thread-Index: AQHbROCtAolgstMk70q+qVJ51CWvhbLWcpEg
Date: Wed, 4 Dec 2024 18:58:35 +0000
Message-ID: <ad4482cc835543578862051431f5174f@AcuMS.aculab.com>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-6-4e4cbaecc216@wanadoo.fr>
In-Reply-To: <20241203-is_constexpr-refactor-v1-6-4e4cbaecc216@wanadoo.fr>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ql_Zu3oJ-he54R1gRRjvMjEuKdyo_71FcBqXOwIGCas_1733338753
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_105917_098185_BA62E0D5 
X-CRM114-Status: GOOD (  16.65  )
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

RnJvbTogVmluY2VudCBNYWlsaG9sDQo+IFNlbnQ6IDAyIERlY2VtYmVyIDIwMjQgMTc6MzMNCj4g
DQo+IEZyb206IFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+DQo+
IA0KPiBpc19jb25zdCgpIGlzIGEgb25lIHRvIG9uZSByZXBsYWNlbWVudCBvZiBfX2lzX2NvbnN0
ZXhwcigpLiBEbyB0aGUNCj4gcmVwbGFjZW1lbnQgc28gdGhhdCBfX2lzX2NvbnN0ZXhwcigpIGNh
biBiZSByZW1vdmVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBNYWlsaG9sIDxtYWls
aG9sLnZpbmNlbnRAd2FuYWRvby5mcj4NCj4gLS0tDQo+ICBpbmNsdWRlL2xpbnV4L2ZvcnRpZnkt
c3RyaW5nLmggfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9mb3J0aWZ5LXN0
cmluZy5oIGIvaW5jbHVkZS9saW51eC9mb3J0aWZ5LXN0cmluZy5oDQo+IGluZGV4IDBkOTliZjEx
ZDI2MGEzNDgyYmJlNDZlMzVjNzU1M2MwY2NmYjhiOTQuLmUzZjJmNzcyYzU0MzllZjcxZWI0YTkw
NGI0Y2UyNzk1NmJjNjk3NDMgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvZm9ydGlmeS1z
dHJpbmcuaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L2ZvcnRpZnktc3RyaW5nLmgNCj4gQEAgLTI1
NCw4ICsyNTQsOCBAQCBfX0ZPUlRJRllfSU5MSU5FIF9fa2VybmVsX3NpemVfdCBzdHJubGVuKGNv
bnN0IGNoYXIgKiBjb25zdCBQT1MgcCwgX19rZXJuZWxfc2l6ZQ0KPiAgICogUmV0dXJucyBudW1i
ZXIgb2YgY2hhcmFjdGVycyBpbiBAcCAoTk9UIGluY2x1ZGluZyB0aGUgZmluYWwgTlVMKS4NCj4g
ICAqDQo+ICAgKi8NCj4gLSNkZWZpbmUgc3RybGVuKHApCQkJCQkJCVwNCj4gLQlfX2J1aWx0aW5f
Y2hvb3NlX2V4cHIoX19pc19jb25zdGV4cHIoX19idWlsdGluX3N0cmxlbihwKSksCVwNCj4gKyNk
ZWZpbmUgc3RybGVuKHApCQkJCQkJXA0KPiArCV9fYnVpbHRpbl9jaG9vc2VfZXhwcihpc19jb25z
dChfX2J1aWx0aW5fc3RybGVuKHApKSwJXA0KPiAgCQlfX2J1aWx0aW5fc3RybGVuKHApLCBfX2Zv
cnRpZnlfc3RybGVuKHApKQ0KDQpJJ20gc3VyZSBMaW51cyBzdWdnZXN0ZWQgYSB3YXkgb2YgZG9p
bmcgdGhhdCB3aXRob3V0IHJlcGxpY2F0aW5nDQp0aGUgX19idWlsdGluX3N0cmxlbigpLg0KDQpJ
bmRlZWQgaXQgbWF5IGJlIHZhbGlkIHRvIGRvOg0KCWxlbiA9IF9fYnVpbHRpbl9zdHJsZW4ocCk7
DQoJX19idWlsdGluX2NvbnN0YW50X3AobGVuKSA/IGxlbiA6IF9fZm9ydGlmeV9zdHJsZW4ocCk7
DQoNCglEYXZpZA0KDQo+ICBfX0ZPUlRJRllfSU5MSU5FIF9fZGlhZ25vc2VfYXMoX19idWlsdGlu
X3N0cmxlbiwgMSkNCj4gIF9fa2VybmVsX3NpemVfdCBfX2ZvcnRpZnlfc3RybGVuKGNvbnN0IGNo
YXIgKiBjb25zdCBQT1MgcCkNCj4gDQo+IC0tDQo+IDIuNDUuMg0KPiANCj4gDQoNCi0NClJlZ2lz
dGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24g
S2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==


