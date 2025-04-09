Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65968C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 15:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mp2CsehvKqem/lx+OexYDU/oBQK2yMbEYL7KsM3zEk0=; b=cPXB7ZFMRIz+lYrKDmlI/ntfL8
	SvsPGJtgW0tKVZzSSgM70q9HgU16Pzy7o2xLEHOJJFq1saoCDPM8DA3hzK/Ejb18WC2oLkptLZpUC
	BzST0zjN1YhKUZ2AjOYcIO94P0rUwC9yN1JQSPBl4RnGRLHBzfZmovL3OIuY3GVsP05t464bJo8hL
	hX4fIw8tHQmkUePl13K+aKIERCqJQ2DykX8Vli/XuXt476+Lmrl7O4Qjz2mXN4KjqAoqloXW2JNB6
	zraMzAFYP2GlvlVhRbnwpUPdllmtRVsMM0r6ntRBZIw9YKIanvG6UaBdbBlFdPuC9gTarRm4MTD6u
	T/nlDvYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XIz-00000007foX-1JDu;
	Wed, 09 Apr 2025 15:25:33 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2X9M-00000007dbW-1cyE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 15:15:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=p17wyMtonYAQUADLGWTScq4n6sxeET0p55+B5KQ9WCU=; b=b
	ji4hMnNkUfdiRrheqU2nhsFtDk80YN1tS22La//IBIbHBi1XoQWcCCCrYmlNk/7W
	xjs/0h8i8q35eCkKL8tuIvKCFK6RQKZH/vCQeOPd7I2BBjH6kCuQVCQHjhmob8dw
	sWhPLkgKCVyrGgJOKtc4+yHs/iwHLJ/H+4Ga7V1KE4=
Received: from xavier_qy$163.com ( [2408:820c:340b:d070:c540:cde:b0c8:b3ab]
 ) by ajax-webmail-wmsvr-40-117 (Coremail) ; Wed, 9 Apr 2025 23:15:13 +0800
 (CST)
X-Originating-IP: [2408:820c:340b:d070:c540:cde:b0c8:b3ab]
Date: Wed, 9 Apr 2025 23:15:13 +0800 (CST)
From: Xavier  <xavier_qy@163.com>
To: "Lance Yang" <ioworker0@gmail.com>
Cc: "Dev Jain" <dev.jain@arm.com>, akpm@linux-foundation.org,
	baohua@kernel.org, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com, will@kernel.org
Subject: Re:Re: [PATCH v1] mm/contpte: Optimize loop to reduce redundant
 operations
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <CAK1f24nR9kYE7OA3onPYi0_jYeAPeX-yqLCFh8GJOkUuZOt45g@mail.gmail.com>
References: <20250407092243.2207837-1-xavier_qy@163.com>
 <20250407112922.17766-1-ioworker0@gmail.com>
 <5e3f976f.bca1.19610528896.Coremail.xavier_qy@163.com>
 <CAK1f24=hwXCg6K8a=qoWi2DGEWFGBcenSGRoKXtJEo=iR4DtDw@mail.gmail.com>
 <027cc666-a562-46fa-bca5-1122ea00ec0e@arm.com>
 <CAK1f24nR9kYE7OA3onPYi0_jYeAPeX-yqLCFh8GJOkUuZOt45g@mail.gmail.com>
X-NTES-SC: AL_Qu2fBv6avk8q5Saebekfmk4QgeY+WMW1vP4m34NSN5FwjD/pywkgQGVSIETq9eO0NCSzmgmGehVR0OBiRbhaTaA3/FwUOmzmXNlPer6WIiUFBA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <20c9bd15.b2a7.1961b1e9e88.Coremail.xavier_qy@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: dSgvCgBnrWMBj_ZnwbSSAA--.27509W
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiTgcqEGf18hkl0QAIs2
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_081536_779534_BF9888B6 
X-CRM114-Status: GOOD (  20.62  )
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

CgpIaSBMYW5jZSwKCgpBdCAyMDI1LTA0LTA4IDE3OjE3OjI3LCAiTGFuY2UgWWFuZyIgPGlvd29y
a2VyMEBnbWFpbC5jb20+IHdyb3RlOgo+T24gVHVlLCBBcHIgOCwgMjAyNSBhdCAxMjoxOeKAr0FN
IERldiBKYWluIDxkZXYuamFpbkBhcm0uY29tPiB3cm90ZToKPj4KPj4KPj4gSGkgWGF2aWVyLAo+
Pgo+PiBPbiAwNy8wNC8yNSA3OjAxIHBtLCBMYW5jZSBZYW5nIHdyb3RlOgo+PiA+IE9uIE1vbiwg
QXByIDcsIDIwMjUgYXQgODo1NuKAr1BNIFhhdmllciA8eGF2aWVyX3F5QDE2My5jb20+IHdyb3Rl
Ogo+PiA+Pgo+PiA+Pgo+PiA+Pgo+PiA+PiBIaSBMYW5jZSwKPj4gPj4KPj4gPj4gVGhhbmtzIGZv
ciB5b3VyIGZlZWRiYWNrLCBteSByZXNwb25zZSBpcyBhcyBmb2xsb3dzLgo+PiA+Pgo+PiA+PiAt
LQo+PiA+PiBUaGFua3MsCj4+ID4+IFhhdmllcgo+PiA+Pgo+PiA+Pgo+PiA+Pgo+PiA+Pgo+PiA+
Pgo+PiA+PiBBdCAyMDI1LTA0LTA3IDE5OjI5OjIyLCAiTGFuY2UgWWFuZyIgPGlvd29ya2VyMEBn
bWFpbC5jb20+IHdyb3RlOgo+PiA+Pj4gVGhhbmtzIGZvciB0aGUgcGF0Y2guIFdvdWxkIHRoZSBm
b2xsb3dpbmcgY2hhbmdlIGJlIGJldHRlcj8KPj4gPj4+Cj4+ID4+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9tbS9jb250cHRlLmMgYi9hcmNoL2FybTY0L21tL2NvbnRwdGUuYwo+PiA+Pj4gaW5k
ZXggNTUxMDdkMjdkM2Y4Li42NGViM2IyZmJmMDYgMTAwNjQ0Cj4+ID4+PiAtLS0gYS9hcmNoL2Fy
bTY0L21tL2NvbnRwdGUuYwo+PiA+Pj4gKysrIGIvYXJjaC9hcm02NC9tbS9jb250cHRlLmMKPj4g
Pj4+IEBAIC0xNzQsNiArMTc0LDkgQEAgcHRlX3QgY29udHB0ZV9wdGVwX2dldChwdGVfdCAqcHRl
cCwgcHRlX3Qgb3JpZ19wdGUpCj4+ID4+Pgo+PiA+Pj4gICAgICAgICAgICAgICAgaWYgKHB0ZV95
b3VuZyhwdGUpKQo+PiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICBvcmlnX3B0ZSA9IHB0ZV9t
a3lvdW5nKG9yaWdfcHRlKTsKPj4gPj4+ICsKPj4gPj4+ICsgICAgICAgICAgICAgIGlmIChwdGVf
eW91bmcob3JpZ19wdGUpICYmIHB0ZV9kaXJ0eShvcmlnX3B0ZSkpCj4+ID4+PiArICAgICAgICAg
ICAgICAgICAgICAgIGJyZWFrOwo+PiA+Pj4gICAgICAgIH0KPj4KPj4gUXVpdGUgdGhlIGNvaW5j
aWRlbmNlLCBJIHdhcyB0aGlua2luZyBvZiBkb2luZyBleGFjdGx5IHRoaXMgc29tZSBkYXlzCj4+
IGJhY2sgYW5kIHRlc3RpbmcgaXQgb3V0IDogKSBDYW4geW91IGRvIGEgbWljcm9hbmFseXNpcyB3
aGV0aGVyIHRoaXMgZ2V0cwo+PiB1cyBhIGJlbmVmaXQgb3Igbm90PyBUaGlzIGxvb2tzIGxpa2Ug
YW4gb3B0aW1pemF0aW9uIG9uIHBhcGVyIGJ1dCBtYXkKPj4gbm90IGJlIG9uZSBhZnRlciBhbGwg
YmVjYXVzZSBDT05UX1BURVMgaXMgb25seSAxNiBhbmQgYSBzaW1wbGUgbG9vcAo+PiB3aXRob3V0
IGV4dHJhIGlmLWNvbmRpdGlvbnMgbWF5IGp1c3QgYmUgZmFzdGVyLgo+Cj5ZZWFoLCBJIHdhcyB0
aGlua2luZyB0aGUgc2FtZSA7KQo+Cj5UaGlzIGNoYW5nZSBzZWVtcyByZWFzb25hYmxlIGluIHRo
ZW9yeS4gQnV0IHdpdGggQ09OVF9QVEVTPTE2LCBrZWVwaW5nCj5pdCBzaW1wbGUgbWlnaHQgYWN0
dWFsbHkgYmUgZmFzdGVyLCBJTU8uCgpQbGVhc2UgdGFrZSBhIGxvb2sgYXQgcGF0Y2ggdjIuIEkn
dmUgdXBkYXRlZCB0aGUgY29kZSB3aXRob3V0IGludHJvZHVjaW5nIGFueQphZGRpdGlvbmFsIGNo
ZWNrcy4gVGhlIG51bWJlciBvZiBjaGVja3MgaW4gdGhlIG5ldyBwYXRjaCBpcyBkZWZpbml0ZWx5
IGxlc3MgdGhhbgpvciBlcXVhbCB0byB0aGF0IGluIHRoZSBvcmlnaW5hbCBjb2RlLgoKLS0KVGhh
bmtzLApYYXZpZXIKCgo+Cj5UaGFua3MsCj5MYW5jZQo+Cj4+Cj4+ID4+Pgo+PiA+Pj4gICAgICAg
IHJldHVybiBvcmlnX3B0ZTsKPj4gPj4+IC0tCj4+ID4+Pgo+PiA+Pj4gV2UgY2FuIGNoZWNrIHRo
ZSBvcmlnX3B0ZSBmbGFncyBkaXJlY3RseSBpbnN0ZWFkIG9mIHVzaW5nIGV4dHJhIGJvb2xlYW4K
Pj4gPj4+IHZhcmlhYmxlcywgd2hpY2ggZ2l2ZXMgdXMgYW4gZWFybHktZXhpdCB3aGVuIGJvdGgg
ZGlydHkgYW5kIHlvdW5nIGZsYWdzCj4+ID4+PiBhcmUgc2V0Lgo+PiA+PiBZb3VyIHdheSBvZiB3
cml0aW5nIHRoZSBjb2RlIGlzIGluZGVlZCBtb3JlIGNvbmNpc2UuIEhvd2V2ZXIsIEkgdGhpbmsK
Pj4gPj4gICB1c2luZyBib29sZWFuIHZhcmlhYmxlcyBtaWdodCBiZSBtb3JlIGVmZmljaWVudC4g
QWx0aG91Z2ggaXQgaW50cm9kdWNlcwo+PiA+PiAgIGFkZGl0aW9uYWwgdmFyaWFibGVzLCBjb21w
YXJpbmcgYm9vbGVhbiB2YWx1ZXMgaXMgbGlrZWx5IHRvIGJlIG1vcmUKPj4gPj4gICBlZmZpY2ll
bnQgdGhhbiBjaGVja2luZyBiaXQgc2V0dGluZ3MuCj4+ID4+Cj4+ID4+Pgo+PiA+Pj4gQWxzbywg
aXMgdGhpcyBvcHRpbWl6YXRpb24gcmVhbGx5IG5lZWRlZCBmb3IgdGhlIGNvbW1vbiBjYXNlPwo+
PiA+PiBUaGlzIGZ1bmN0aW9uIGlzIG9uIGEgaGlnaC1mcmVxdWVuY3kgZXhlY3V0aW9uIHBhdGgu
IER1cmluZyBkZWJ1Z2dpbmcsCj4+ID4+ICAgSSBmb3VuZCB0aGF0IGluIG1vc3QgY2FzZXMsIHRo
ZSBmaXJzdCBmZXcgcGFnZXMgYXJlIGFscmVhZHkgbWFya2VkIGFzCj4+ID4+ICAgYm90aCBkaXJ0
eSBhbmQgeW91bmcuIEJ1dCBjdXJyZW50bHksIHRoZSBwcm9ncmFtIHN0aWxsIGhhcyB0byBjb21w
bGV0ZQo+PiA+PiAgIHRoZSBlbnRpcmUgbG9vcCBvZiAxNiBwdGVwIGl0ZXJhdGlvbnMsIHdoaWNo
IHNlcmlvdXNseSByZWR1Y2VzIHRoZSBlZmZpY2llbmN5Lgo+PiA+Cj4+ID4gSG1tLi4uIGFncmVl
ZCB0aGF0IHRoaXMgcGF0Y2ggaGVscHMgd2hlbiBlYXJseSBQVEVzIGFyZSBkaXJ0eS95b3VuZywg
YnV0Cj4+ID4gZm9yIGxhdGUtb25lcy1vbmx5IGNhc2VzLCBpdCBvbmx5IGludHJvZHVjZXMgb3Zl
cmhlYWQgd2l0aCBubyBiZW5lZml0LCBJSVVDLgo+PiA+Cj4+ID4gU28sIGxldCdzIHdhaXQgZm9y
IGZvbGtzIHRvIHRha2UgYSBsb29rIDspCj4+ID4KPj4gPiBUaGFua3MsCj4+ID4gTGFuY2UKPj4g
Pgo+PiA+Pj4KPj4gPj4+IFRoYW5rcywKPj4gPj4+IExhbmNlCj4+ID4KPj4KCgo=

