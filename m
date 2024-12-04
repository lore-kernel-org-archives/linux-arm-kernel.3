Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF58E77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 18:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LKozLljYC5dwM4f9mxbC4dRaR9C7foO3ChfzLSA4OII=; b=MzX8qHI7xfyQsh25WViBSror8K
	NnbswNS/IE6zj7fFVhhCvXkRMAgVLdvjJHAiUpRWQR/7xQ1UoEaWizB442LWBKjAN3V0VkV1yw/i2
	MRiLAQ1mev9MCtC6artggyoINbzPNf4dKcNcb2a8mn38GU1sYyV5FYmJr5iTzftj0glgRJ8CLX8zh
	aHj6ZCsV8GI2zrLfXFDLyD2Kf5LUrPbN7oCo1cL+WjGiJGZ2mIGcNV7l0xM0UUFNiQYMpA6MIyEV8
	ioH9axq1lcTtGUrjsJb1bOnWGkEDU6rAUiOz1d8FYHDOFXsXczbQj7tMWuKyWotfwmZ/g58Lld8BC
	/WqO4yoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIuYU-0000000DanS-2baM;
	Wed, 04 Dec 2024 18:56:58 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIuWZ-0000000Da4d-00QN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 18:55:00 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-319-leywlU3sMBaz14PRQ0B5Ew-1; Wed, 04 Dec 2024 18:54:56 +0000
X-MC-Unique: leywlU3sMBaz14PRQ0B5Ew-1
X-Mimecast-MFC-AGG-ID: leywlU3sMBaz14PRQ0B5Ew
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 4 Dec
 2024 18:54:16 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Wed, 4 Dec 2024 18:54:16 +0000
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
Subject: RE: [PATCH 05/10] minmax: simplify __clamp_once() by using
 is_const_false()
Thread-Topic: [PATCH 05/10] minmax: simplify __clamp_once() by using
 is_const_false()
Thread-Index: AQHbROFQNBaBI/FNyUSmwK0ugw/OHbLWccOg
Date: Wed, 4 Dec 2024 18:54:16 +0000
Message-ID: <8b8262389bd6484586007d749132346f@AcuMS.aculab.com>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-5-4e4cbaecc216@wanadoo.fr>
In-Reply-To: <20241203-is_constexpr-refactor-v1-5-4e4cbaecc216@wanadoo.fr>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PbLt4x5tk8i_9n0F7l3z6mIc3sbFu0rHZr2RsFoltpM_1733338494
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_105459_179399_D11C870B 
X-CRM114-Status: GOOD (  13.43  )
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
DQo+IEluIF9fY2xhbXBfb25jZSgpLA0KPiANCj4gICBfX2J1aWx0aW5fY2hvb3NlX2V4cHIoX19p
c19jb25zdGV4cHIoKGxvKSA+IChoaSkpLCAobG8pIDw9IChoaSksIHRydWUpDQo+IA0KPiBpcyBl
cXVpdmFsZW50IHRvOg0KPiANCj4gICAhaXNfY29uc3RfZmFsc2UoKGxvKSA8PSAoaGkpKQ0KPiAN
Cj4gQXBwbHkgaXNfY29uc3RfZmFsc2UoKSB0byBzaW1wbGlmeSBfX2NsYW1wX29uY2UoKS4NCg0K
VGhlcmUgaXMgYWxyZWFkeSBhIHBhdGNoICdmb3IgbmV4dCcgdGhhdCBjaGFuZ2VzIGl0IHVzZSBC
VUlMRF9CVUdfT05fTVNHKCkNCmFuZCBzdGF0aWNhbGx5X3RydWUoKS4NCg0KSXQgaGFzIGZvdW5k
IHNvbWUgJ2ludGVyZXN0aW5nJyBjb2RlLg0KDQoJRGF2aWQNCg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogVmluY2VudCBNYWlsaG9sIDxtYWlsaG9sLnZpbmNlbnRAd2FuYWRvby5mcj4NCj4gLS0tDQo+
ICBpbmNsdWRlL2xpbnV4L21pbm1heC5oIHwgMyArLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L21pbm1heC5oIGIvaW5jbHVkZS9saW51eC9taW5tYXguaA0KPiBpbmRleCA5ODAwOGRkOTIx
NTNkYjEwYzY3MjE1NWJjYTkzMjAxZmZhYmVlOTk0Li40MzFiZjc2YWM0NjBhMTFhMmU0YWYyM2Fj
ZDkwYzBkMjZlOTljODYyIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21pbm1heC5oDQo+
ICsrKyBiL2luY2x1ZGUvbGludXgvbWlubWF4LmgNCj4gQEAgLTExMSw4ICsxMTEsNyBAQA0KPiAg
CV9fYXV0b190eXBlIHV2YWwgPSAodmFsKTsJCQkJCQlcDQo+ICAJX19hdXRvX3R5cGUgdWxvID0g
KGxvKTsJCQkJCQkJXA0KPiAgCV9fYXV0b190eXBlIHVoaSA9IChoaSk7CQkJCQkJCVwNCj4gLQlz
dGF0aWNfYXNzZXJ0KF9fYnVpbHRpbl9jaG9vc2VfZXhwcihfX2lzX2NvbnN0ZXhwcigobG8pID4g
KGhpKSksIAlcDQo+IC0JCQkobG8pIDw9IChoaSksIHRydWUpLAkJCQkJXA0KPiArCXN0YXRpY19h
c3NlcnQoIWlzX2NvbnN0X2ZhbHNlKChsbykgPD0gKGhpKSksCQkJCVwNCj4gIAkJImNsYW1wKCkg
bG93IGxpbWl0ICIgI2xvICIgZ3JlYXRlciB0aGFuIGhpZ2ggbGltaXQgIiAjaGkpOwlcDQo+ICAJ
QlVJTERfQlVHX09OX01TRyghX190eXBlc19vazModmFsLGxvLGhpLHV2YWwsdWxvLHVoaSksCQkJ
XA0KPiAgCQkiY2xhbXAoIiN2YWwiLCAiI2xvIiwgIiNoaSIpIHNpZ25lZG5lc3MgZXJyb3IiKTsJ
CVwNCj4gDQo+IC0tDQo+IDIuNDUuMg0KPiANCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2Vz
aWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVL
DQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K


