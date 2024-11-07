Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F67DD5AE78
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 09:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZEuVN3mQD2v8GbAx3eCizaC0Y84qZQlZOHowKAkk4I=; b=dY+1vMUVb3bHoY8IW8GWcm1QcL
	3YC2tdds+WQ6D2f2mKZ0OHoc2KRgbY2pIrlL5Gsn3fLul76UrQSXdXIXm/2AAUZrYu17ZCBIEcCJb
	UWITQpi+8ci+SNzKfWLpoFMRSqAp9VUG2+yK8F5E0OiPkQerdqR6Ktqb1FUIlcqIOq3pkd+Q1Dlbv
	HwhKR33dDdF5y3CEXszwZjd4pPoFd9S1MJoQ1IBs3PsvkBKSPPpZtFHtLrAxPQiY95Zcn28UY/XUW
	6BzY625d6x4ROv5MQCzq6X28Vnben1chlxvM0d0j9XAvroeYmsq3nftzB6JECMoShYPliu33V+WA8
	quEUunvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8yWA-00000006Fev-2HFS;
	Thu, 07 Nov 2024 09:09:30 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ySy-00000006F1L-1egf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 09:06:15 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4XkbkC0QdTzQsZM;
	Thu,  7 Nov 2024 17:04:51 +0800 (CST)
Received: from kwepemk100016.china.huawei.com (unknown [7.202.194.64])
	by mail.maildlp.com (Postfix) with ESMTPS id 343D018005F;
	Thu,  7 Nov 2024 17:05:59 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 kwepemk100016.china.huawei.com (7.202.194.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 7 Nov 2024 17:05:58 +0800
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Thu, 7 Nov 2024 10:05:56 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "maz@kernel.org"
	<maz@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>
CC: "james.morse@arm.com" <james.morse@arm.com>, "joey.gouly@arm.com"
	<joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"sebott@redhat.com" <sebott@redhat.com>, yuzenghui <yuzenghui@huawei.com>,
	"Wangzhou (B)" <wangzhou1@hisilicon.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH v2] KVM: arm64: Make L1Ip feature in CTR_EL0 writable from
 userspace
Thread-Topic: [PATCH v2] KVM: arm64: Make L1Ip feature in CTR_EL0 writable
 from userspace
Thread-Index: AQHbJFZMOfDGoLDLOEqZY8/BCs2q5rKrnz+w
Date: Thu, 7 Nov 2024 09:05:55 +0000
Message-ID: <e7174e103fd94023be1fd5127871540e@huawei.com>
References: <20241022073943.35764-1-shameerali.kolothum.thodi@huawei.com>
In-Reply-To: <20241022073943.35764-1-shameerali.kolothum.thodi@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_010612_785104_8261CC73 
X-CRM114-Status: GOOD (  26.58  )
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

SGkgT2xpdmVyLA0KDQpBIGdlbnRsZSBwaW5nIG9uIHRoaXMuIEkgdGhpbmsgaXQgc3RpbGwgYXBw
bGllcyBjbGVhbmx5IG9uIHRvcCBvZiBKb2V5J3MgdjYgb2YgTVBBTQ0KSGlkZSBzZXJpZXMuDQoN
ClRoYW5rcywNClNoYW1lZXINCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBsaW51eC1hcm0ta2VybmVsIDxsaW51eC1hcm0ta2VybmVsLWJvdW5jZXNAbGlzdHMuaW5mcmFk
ZWFkLm9yZz4gT24NCj4gQmVoYWxmIE9mIFNoYW1lZXIgS29sb3RodW0NCj4gU2VudDogVHVlc2Rh
eSwgT2N0b2JlciAyMiwgMjAyNCA4OjQwIEFNDQo+IFRvOiBrdm1hcm1AbGlzdHMubGludXguZGV2
OyBtYXpAa2VybmVsLm9yZzsgb2xpdmVyLnVwdG9uQGxpbnV4LmRldg0KPiBDYzogamFtZXMubW9y
c2VAYXJtLmNvbTsgam9leS5nb3VseUBhcm0uY29tOw0KPiBzdXp1a2kucG91bG9zZUBhcm0uY29t
OyBzZWJvdHRAcmVkaGF0LmNvbTsgeXV6ZW5naHVpDQo+IDx5dXplbmdodWlAaHVhd2VpLmNvbT47
IFdhbmd6aG91IChCKSA8d2FuZ3pob3UxQGhpc2lsaWNvbi5jb20+Ow0KPiBsaW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IExpbnV4YXJtIDxsaW51eGFybUBodWF3ZWkuY29tPg0K
PiBTdWJqZWN0OiBbUEFUQ0ggdjJdIEtWTTogYXJtNjQ6IE1ha2UgTDFJcCBmZWF0dXJlIGluIENU
Ul9FTDAgd3JpdGFibGUNCj4gZnJvbSB1c2Vyc3BhY2UNCj4gDQo+IE9ubHkgYWxsb3cgdXNlcnNw
YWNlIHRvIHNldCBWSVBUKDBiMTApIG9yIFBJUFQoMGIxMSkgZm9yIEwxSXAgYmFzZWQgb24NCj4g
d2hhdCBoYXJkd2FyZSByZXBvcnRzIGFzIGJvdGjCoEFJVklWVCAoMGIwMSkgYW5kIFZQSVBUICgw
YjAwKSBhcmUNCj4gZG9jdW1lbnRlZCBhcyByZXNlcnZlZC4NCj4gDQo+IFVzaW5nIGEgVklQVCBm
b3IgR3Vlc3Qgd2hlcmUgaGFyZHdhcmUgcmVwb3J0cyBQSVBUIG1heSBsZWFkIHRvIG92ZXINCj4g
aW52YWxpZGF0aW9uLCBidXQgaXMgc3RpbGwgY29ycmVjdC4gSGVuY2UsIHdlIGNhbiBhbGxvdyBk
b3duZ3JhZGluZw0KPiBQSVBUIHRvIFZJUFQsIGJ1dCBub3QgdGhlIG90aGVyIHdheSBhcm91bmQu
DQo+IA0KPiBSZXZpZXdlZC1ieTogU2ViYXN0aWFuIE90dCA8c2Vib3R0QHJlZGhhdC5jb20+DQo+
IFJldmlld2VkLWJ5OiBNYXJjIFp5bmdpZXIgPG1hekBrZXJuZWwub3JnPg0KPiBTaWduZWQtb2Zm
LWJ5OiBTaGFtZWVyIEtvbG90aHVtDQo+IDxzaGFtZWVyYWxpLmtvbG90aHVtLnRob2RpQGh1YXdl
aS5jb20+DQo+IC0tLQ0KPiB2MToNCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcva3ZtYXJtLzIw
MjQxMDE3MDg1OTI1LjQwNTMyLTEtDQo+IHNoYW1lZXJhbGkua29sb3RodW0udGhvZGlAaHVhd2Vp
LmNvbS8NCj4gDQo+IENoYW5nZXMgZnJvbSB2MToNCj4gwqAtQXMgcGVyIE1hcmMncyBzdWdnZXN0
aW9uIG1vZGlmaWVkIHRoZSB3YXkgc2V0X2N0cl9lbDAoKSByZXN0cmljdGVkDQo+ICAgdGhlIHdy
aXRlIHdoaWNoIGltcGxpZWQgb3JkZXJlZCB2YWx1ZXPCoGZvciB0aGUgdHlwZXMuIEluc3RlYWQN
Cj4gICBleHBsaWNpdGx5IGxpc3RlZMKgIGFsbCBwb3NzaWJsZSBwb2xpY3nCoHR5cGVzLg0KPiAg
LUFkZGVkIFItYnkgdGFncyhUaGFua3MhKS4NCj4gDQo+IFRoYW5rcywNCj4gU2hhbWVlcg0KPiAt
LS0NCj4gIGFyY2gvYXJtNjQva3ZtL3N5c19yZWdzLmMgfCAzOCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tDQo+IC0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva3ZtL3N5
c19yZWdzLmMgYi9hcmNoL2FybTY0L2t2bS9zeXNfcmVncy5jDQo+IGluZGV4IGQ5N2NjZjFjMTU1
OC4uMGEwZjMzNmIwZWRkIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2t2bS9zeXNfcmVncy5j
DQo+ICsrKyBiL2FyY2gvYXJtNjQva3ZtL3N5c19yZWdzLmMNCj4gQEAgLTE4NzIsNiArMTg3Miwz
NCBAQCBzdGF0aWMgaW50IHNldF9pZF9hYTY0cGZyMV9lbDEoc3RydWN0IGt2bV92Y3B1DQo+ICp2
Y3B1LA0KPiAgCXJldHVybiBzZXRfaWRfcmVnKHZjcHUsIHJkLCB1c2VyX3ZhbCk7DQo+ICB9DQo+
IA0KPiArc3RhdGljIGludCBzZXRfY3RyX2VsMChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsDQo+ICsJ
CSAgICAgICBjb25zdCBzdHJ1Y3Qgc3lzX3JlZ19kZXNjICpyZCwgdTY0IHVzZXJfdmFsKQ0KPiAr
ew0KPiArCXU4IHVzZXJfTDFJcCA9IFNZU19GSUVMRF9HRVQoQ1RSX0VMMCwgTDFJcCwgdXNlcl92
YWwpOw0KPiArDQo+ICsJLyoNCj4gKwkgKiBCb3RoIEFJVklWVCAoMGIwMSkgYW5kIFZQSVBUICgw
YjAwKSBhcmUgZG9jdW1lbnRlZCBhcyByZXNlcnZlZC4NCj4gKwkgKiBIZW5jZSBvbmx5IGFsbG93
IHRvIHNldCBWSVBUKDBiMTApIG9yIFBJUFQoMGIxMSkgZm9yIEwxSXAgYmFzZWQNCj4gKwkgKiBv
biB3aGF0IGhhcmR3YXJlIHJlcG9ydHMuDQo+ICsJICoNCj4gKwkgKiBVc2luZyBhIFZJUFQgc29m
dHdhcmUgbW9kZWwgb24gUElQVCB3aWxsIGxlYWQgdG8gb3Zlcg0KPiBpbnZhbGlkYXRpb24sDQo+
ICsJICogYnV0IHN0aWxsIGNvcnJlY3QuIEhlbmNlLCB3ZSBjYW4gYWxsb3cgZG93bmdyYWRpbmcg
UElQVCB0byBWSVBULA0KPiArCSAqIGJ1dCBub3QgdGhlIG90aGVyIHdheSBhcm91bmQuIFRoaXMg
aXMgaGFuZGxlZCB2aWENCj4gYXJtNjRfZnRyX3NhZmVfdmFsdWUoKQ0KPiArCSAqIGFzIENUUl9F
TDAgZnRyX2JpdHMgaGFzIEwxSXAgZmllbGQgd2l0aCB0eXBlIEZUUl9FWEFDVCBhbmQgc2FmZQ0K
PiB2YWx1ZQ0KPiArCSAqIHNldCBhcyBWSVBULg0KPiArCSAqLw0KPiArCXN3aXRjaCAodXNlcl9M
MUlwKSB7DQo+ICsJY2FzZSBDVFJfRUwwX0wxSXBfUkVTRVJWRURfVlBJUFQ6DQo+ICsJY2FzZSBD
VFJfRUwwX0wxSXBfUkVTRVJWRURfQUlWSVZUOg0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwlj
YXNlIENUUl9FTDBfTDFJcF9WSVBUOg0KPiArCWNhc2UgQ1RSX0VMMF9MMUlwX1BJUFQ6DQo+ICsJ
CXJldHVybiBzZXRfaWRfcmVnKHZjcHUsIHJkLCB1c2VyX3ZhbCk7DQo+ICsJZGVmYXVsdDoNCj4g
KwkJcmV0dXJuIC1FTk9FTlQ7DQo+ICsJfQ0KPiArfQ0KPiArDQo+ICAvKg0KPiAgICogY3B1ZmVh
dHVyZSBJRCByZWdpc3RlciB1c2VyIGFjY2Vzc29ycw0KPiAgICoNCj4gQEAgLTI2MTQsMTAgKzI2
NDIsMTIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzeXNfcmVnX2Rlc2Mgc3lzX3JlZ19kZXNjc1td
DQo+ID0gew0KPiAgCXsgU1lTX0RFU0MoU1lTX0NDU0lEUjJfRUwxKSwgdW5kZWZfYWNjZXNzIH0s
DQo+ICAJeyBTWVNfREVTQyhTWVNfU01JRFJfRUwxKSwgdW5kZWZfYWNjZXNzIH0sDQo+ICAJeyBT
WVNfREVTQyhTWVNfQ1NTRUxSX0VMMSksIGFjY2Vzc19jc3NlbHIsIHJlc2V0X3Vua25vd24sDQo+
IENTU0VMUl9FTDEgfSwNCj4gLQlJRF9XUklUQUJMRShDVFJfRUwwLCBDVFJfRUwwX0RJQ19NQVNL
IHwNCj4gLQkJCSAgICAgQ1RSX0VMMF9JRENfTUFTSyB8DQo+IC0JCQkgICAgIENUUl9FTDBfRG1p
bkxpbmVfTUFTSyB8DQo+IC0JCQkgICAgIENUUl9FTDBfSW1pbkxpbmVfTUFTSyksDQo+ICsJSURf
RklMVEVSRUQoQ1RSX0VMMCwgY3RyX2VsMCwNCj4gKwkJICAgIENUUl9FTDBfRElDX01BU0sgfA0K
PiArCQkgICAgQ1RSX0VMMF9JRENfTUFTSyB8DQo+ICsJCSAgICBDVFJfRUwwX0RtaW5MaW5lX01B
U0sgfA0KPiArCQkgICAgQ1RSX0VMMF9MMUlwX01BU0sgfA0KPiArCQkgICAgQ1RSX0VMMF9JbWlu
TGluZV9NQVNLKSwNCj4gIAl7IFNZU19ERVNDKFNZU19TVkNSKSwgdW5kZWZfYWNjZXNzLCByZXNl
dF92YWwsIFNWQ1IsIDAsIC52aXNpYmlsaXR5ID0NCj4gc21lX3Zpc2liaWxpdHkgIH0sDQo+ICAJ
eyBTWVNfREVTQyhTWVNfRlBNUiksIHVuZGVmX2FjY2VzcywgcmVzZXRfdmFsLCBGUE1SLCAwLCAu
dmlzaWJpbGl0eSA9DQo+IGZwOF92aXNpYmlsaXR5IH0sDQo+IA0KPiAtLQ0KPiAyLjQ1LjINCj4g
DQoNCg==

