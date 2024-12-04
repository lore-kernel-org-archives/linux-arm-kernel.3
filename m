Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC904E77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 18:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhrL0uncEcrQ3AECIN+oYBnEJDHoGLltvd2rhDn6Kww=; b=py6tbULH/TGtZrZw4h7bJe7dtP
	CSQMgjLShZQEiVXv0Y243csXDXotHFTvOlm3opCM3U3sr/heENsyZJDhQFHgKJTPXNbiOS6e5c2/C
	3sJnKbwgPL+z3XXcpGyp85SUq2D62D1RLfRgHOvJ9vQvR1CrNzqM/ELFcakafLbOdw76DXBdiWJ0S
	4SmDmoDRD2iHJ/OFd0jgKWn0e1a0EtC0stOc6YybVLdR/vZJ2iPFpM/lB5mq2BHQivS0hWtdPMYaR
	9LdrMRapxpWPBcQo/yGfVAW3Gl/BJLmtRsV+V3Bu+MNRlfJ2m9KRgayBaGTMWqhFkz+JHr7zgkrLy
	0npTelww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIuAj-0000000DXVE-3ZPH;
	Wed, 04 Dec 2024 18:32:25 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIu9i-0000000DXNV-3bm6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 18:31:24 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-227-kUr0Et9cOBasZhKmceyLzw-1; Wed, 04 Dec 2024 18:31:19 +0000
X-MC-Unique: kUr0Et9cOBasZhKmceyLzw-1
X-Mimecast-MFC-AGG-ID: kUr0Et9cOBasZhKmceyLzw
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 4 Dec
 2024 18:30:40 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Wed, 4 Dec 2024 18:30:40 +0000
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
Subject: RE: [PATCH 01/10] compiler.h: add statically_false()
Thread-Topic: [PATCH 01/10] compiler.h: add statically_false()
Thread-Index: AQHbROCIk5mOE+KmUE+HEr8z57N8IbLWaz+w
Date: Wed, 4 Dec 2024 18:30:40 +0000
Message-ID: <e115a4245e5342a994a7e596cc6357fa@AcuMS.aculab.com>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-1-4e4cbaecc216@wanadoo.fr>
In-Reply-To: <20241203-is_constexpr-refactor-v1-1-4e4cbaecc216@wanadoo.fr>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e2H3uRk00VDpjLq_8Zip-7pIV_b_brzT3OHoVmf3usM_1733337078
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_103123_164698_09C45B14 
X-CRM114-Status: GOOD (  19.41  )
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
IA0KPiBGb3IgY29tcGxldGlvbiwgYWRkIHN0YXRpY2FsbHlfZmFsc2UoKSB3aGljaCBpcyB0aGUg
ZXF1aXZhbGVudCBvZg0KPiBzdGF0aWNhbGx5X3RydWUoKSBleGNlcHQgdGhhdCBpdCB3aWxsIHJl
dHVybiB0cnVlIG9ubHkgaWYgdGhlIGlucHV0IGlzDQo+IGtub3duIHRvIGJlIGZhbHNlIGF0IGNv
bXBpbGUgdGltZS4NCg0KVGhpcyBpcyBwcmV0dHkgbXVjaCBwb2ludGxlc3MuDQpJdCBpcyBqdXN0
IGFzIGVhc3kgdG8gaW52ZXJ0IHRoZSBjb25kaXRpb24gYXQgdGhlIGNhbGwgc2l0ZS4NCg0KCURh
dmlkDQoNCj4gDQo+IFRoZSA9PSBvcGVyYXRvciBpcyB1c2VkIGluc3RlYWQgb2YgdGhlICEgbmVn
YXRpb24gdG8gcHJldmVudCBhDQo+IC1XaW50LWluLWJvb2wtY29udGV4dCBjb21waWxlciB3YXJu
aW5nIHdoZW4gdGhlIGFyZ3VtZW50IGlzIG5vdCBhDQo+IGJvb2xlYW4uIEZvciBleGFtcGxlOg0K
PiANCj4gICBzdGF0aWNhbGx5X2ZhbHNlKHZhciAqIDApDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBW
aW5jZW50IE1haWxob2wgPG1haWxob2wudmluY2VudEB3YW5hZG9vLmZyPg0KPiAtLS0NCj4gIGlu
Y2x1ZGUvbGludXgvY29tcGlsZXIuaCB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9jb21waWxlci5oIGIvaW5j
bHVkZS9saW51eC9jb21waWxlci5oDQo+IGluZGV4IDQ2OWE2NGRkNjQ5NWZlZmFiMmM4NWZmYzI3
OTU2OGE2NTdiNzI2NjAuLmEyYTU2YTUwZGQ4NTIyN2E0ZmRjNjIyMzZhMjcxMGNhMzdjNWJhNTIg
MTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvY29tcGlsZXIuaA0KPiArKysgYi9pbmNsdWRl
L2xpbnV4L2NvbXBpbGVyLmgNCj4gQEAgLTMxNCw2ICszMTQsNyBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgKm9mZnNldF90b19wdHIoY29uc3QgaW50ICpvZmYpDQo+ICAgKiB2YWx1ZXMgdG8gZGV0ZXJt
aW5lIHRoYXQgdGhlIGNvbmRpdGlvbiBpcyBzdGF0aWNhbGx5IHRydWUuDQo+ICAgKi8NCj4gICNk
ZWZpbmUgc3RhdGljYWxseV90cnVlKHgpIChfX2J1aWx0aW5fY29uc3RhbnRfcCh4KSAmJiAoeCkp
DQo+ICsjZGVmaW5lIHN0YXRpY2FsbHlfZmFsc2UoeCkgKF9fYnVpbHRpbl9jb25zdGFudF9wKHgp
ICYmICh4KSA9PSAwKQ0KPiANCj4gIC8qDQo+ICAgKiBUaGlzIGlzIG5lZWRlZCBpbiBmdW5jdGlv
bnMgd2hpY2ggZ2VuZXJhdGUgdGhlIHN0YWNrIGNhbmFyeSwgc2VlDQo+IA0KPiAtLQ0KPiAyLjQ1
LjINCj4gDQo+IA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9h
ZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBO
bzogMTM5NzM4NiAoV2FsZXMpDQo=


