Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A79FC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 02:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ak6kVTFoArwDV/4ozE74qsjM9VnnJ3y5qUizMDA0RPU=; b=UpZnbdICv++jXeaGNtIb7mhiFJ
	1v1qsyOw7YIjf1ulhFJra/xNpJxazWTZHbIun2WKmr3UIlagdULwUmSWOlW2uq0vbJP9e85FC9kBp
	R8H6UjqpV7iCr3kTIpdDaplqH50CVZLJpxDLVWiyDYkjsh/bmox1vmLVThH/5tD7oiboCPCEZkIP/
	I8dQI06jvzx8ZM2qS2xv1LcdnGiRni3KTYU663BrcUHrxB+91Bt4H+McZMny2bJVyQtyjDvqtYD7N
	4ziKz2b/x7lo1T+OCgRgHhY9k9iPQEwfKQhsqN+rhNhRdFUZtpPioigJ/1ft6Q9mi6Ws97KOy/Gft
	WtliVUnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRj13-00000008rdI-1h0a;
	Wed, 18 Jun 2025 02:59:09 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRis8-00000008qs9-38mR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 02:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750214994;
	bh=ak6kVTFoArwDV/4ozE74qsjM9VnnJ3y5qUizMDA0RPU=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=V9brWjey/MQ5R9FzjHwP+8hFRC5Mdjc/FSFzXPmZ4bW3XdyAi3jeUYRsYyelmm8Oz
	 ay2Q8J3o0HY7OkQZ3nLmavnSPmqHsYUfVYTM3DjuLDHiyDbB8/EBsu14iI1Glum0zG
	 qccbl7kenLfdTpkU4AftytDU3lh2KeEuA+pk+hVyGYFQtgK2u+oJmGv7EWTs7xXNv1
	 MhL5N5AdesyHk0KhzFAKr030S/HIvLMlUk4AQYqylDX5d2Tgh4+km5byPtslY6XR6J
	 nOfUaYl0bbKXxQBF3RXA1yOxOxnYCaPYmnSQCgjePQTmHe2AtkStmf50nANOBhCZV6
	 M8q8+sIn2pvYg==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 00565640A0;
	Wed, 18 Jun 2025 10:49:53 +0800 (AWST)
Message-ID: <4e6fd85cc8ed6c4261844842bc2e5e54e5db04e6.camel@codeconstruct.com.au>
Subject: Re: [PATCH 5/8] mmc: sdhci-of-aspeed: Fix null pointer
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cool Lee <cool_lee@aspeedtech.com>, adrian.hunter@intel.com, 
	ulf.hansson@linaro.org, joel@jms.id.au, p.zabel@pengutronix.de, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 18 Jun 2025 12:19:53 +0930
In-Reply-To: <20250615035803.3752235-6-cool_lee@aspeedtech.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-6-cool_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_194956_978061_0D8000D0 
X-CRM114-Status: GOOD (  17.28  )
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

T24gU3VuLCAyMDI1LTA2LTE1IGF0IDExOjU4ICswODAwLCBDb29sIExlZSB3cm90ZToKPiBQbGF0
Zm9ybSBkYXRhIG1pZ2h0IGJlIG51bGwuCgpDdXJyZW50bHkgaXQgY2FuJ3QgYmU6CgpodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5n
aXQvdHJlZS9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWFzcGVlZC5jP2g9djYuMTYtcmMyI24z
NzUKCkFyZSB0aGVyZSBmdXR1cmUgY2lyY3Vtc3RhbmNlcyB3aGVyZSBpdCBtYXkgYmUgTlVMTD8K
CkknbSBhbGwgZm9yIHJlZHVjaW5nIHRoZSByZWFzb25pbmcgZnJvbSBnbG9iYWwgdG8gbG9jYWws
IGJ1dCBJIHRoaW5rCnNvbWUgZGlzY3Vzc2lvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugd291bGQg
YmUgZ29vZC4KCj4gCj4gU2lnbmVkLW9mZi1ieTogQ29vbCBMZWUgPGNvb2xfbGVlQGFzcGVlZHRl
Y2guY29tPgo+IC0tLQo+IMKgZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1hc3BlZWQuYyB8IDcg
KysrKystLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1hc3BlZWQuYwo+
IGIvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1hc3BlZWQuYwo+IGluZGV4IDJiZGQ5M2EzZjkx
Zi4uMjJkZGU5MTVlNTFiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2Yt
YXNwZWVkLmMKPiArKysgYi9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWFzcGVlZC5jCj4gQEAg
LTI0MSw3ICsyNDEsNyBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfc2RoY2lfc2V0X2Nsb2NrKHN0cnVj
dAo+IHNkaGNpX2hvc3QgKmhvc3QsIHVuc2lnbmVkIGludCBjbG9jaykKPiDCoMKgwqDCoMKgwqDC
oMKgc3RydWN0IHNkaGNpX3BsdGZtX2hvc3QgKnBsdGZtX2hvc3Q7Cj4gwqDCoMKgwqDCoMKgwqDC
oHVuc2lnbmVkIGxvbmcgcGFyZW50LCBidXM7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBhc3Bl
ZWRfc2RoY2kgKnNkaGNpOwo+IC3CoMKgwqDCoMKgwqDCoGludCBkaXY7Cj4gK8KgwqDCoMKgwqDC
oMKgaW50IGRpdiA9IDE7Cj4gwqDCoMKgwqDCoMKgwqDCoHUxNiBjbGs7Cj4gwqAKPiDCoMKgwqDC
oMKgwqDCoMKgcGx0Zm1faG9zdCA9IHNkaGNpX3ByaXYoaG9zdCk7Cj4gQEAgLTI1Nyw2ICsyNTcs
OSBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfc2RoY2lfc2V0X2Nsb2NrKHN0cnVjdAo+IHNkaGNpX2hv
c3QgKmhvc3QsIHVuc2lnbmVkIGludCBjbG9jaykKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKFdBUk5f
T04oY2xvY2sgPiBob3N0LT5tYXhfY2xrKSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGNsb2NrID0gaG9zdC0+bWF4X2NsazsKPiDCoAo+ICvCoMKgwqDCoMKgwqDCoGlmIChzZGhj
aS0+cGRhdGEpCgpHaXZlbiB0aGlzIHNob3VsZG4ndCBiZSB0aGUgY2FzZSwgcGVyaGFwcyBwcmVj
ZWRlIGl0IHdpdGggYQpXQVJOX09OQ0UoIXNkaGNpLT5wZGF0YSk/CgpBbmRyZXcKCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRpdiA9IHNkaGNpLT5wZGF0YS0+Y2xrX2Rpdl9zdGFy
dDsKPiArCj4gwqDCoMKgwqDCoMKgwqDCoC8qCj4gwqDCoMKgwqDCoMKgwqDCoCAqIFJlZ2FyZGlu
ZyB0aGUgQVNUMjYwMDoKPiDCoMKgwqDCoMKgwqDCoMKgICoKPiBAQCAtMjczLDcgKzI3Niw3IEBA
IHN0YXRpYyB2b2lkIGFzcGVlZF9zZGhjaV9zZXRfY2xvY2soc3RydWN0Cj4gc2RoY2lfaG9zdCAq
aG9zdCwgdW5zaWduZWQgaW50IGNsb2NrKQo+IMKgwqDCoMKgwqDCoMKgwqAgKiBzdXBwb3J0aW5n
IHRoZSB2YWx1ZSAwIGluIChFTU1DMTJDWzc6Nl0sIEVNTUMxMkNbMTU6OF0pLAo+IGFuZCBjYXB0
dXJlCj4gwqDCoMKgwqDCoMKgwqDCoCAqIHRoZSAwLXZhbHVlIGNhcGFiaWxpdHkgaW4gY2xrX2Rp
dl9zdGFydC4KPiDCoMKgwqDCoMKgwqDCoMKgICovCj4gLcKgwqDCoMKgwqDCoMKgZm9yIChkaXYg
PSBzZGhjaS0+cGRhdGEtPmNsa19kaXZfc3RhcnQ7IGRpdiA8IDI1NjsgZGl2ICo9IDIpCj4gewo+
ICvCoMKgwqDCoMKgwqDCoGZvciAoOyBkaXYgPCAyNTY7IGRpdiAqPSAyKSB7Cj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBidXMgPSBwYXJlbnQgLyBkaXY7Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoYnVzIDw9IGNsb2NrKQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwoK


