Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9910ACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 06:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtbgRtg//fqWfjWdTmRs7c1F/bK6SAHJGEEEnummDn4=; b=u89FiRmkrlngflIoXU/9VhyKKa
	3r9RSIQ6eUKHSAFjT4kCpG/n6ubYtiM1HeCzbn2fcjUOWexq24/tJAQNagIxAkyesd+fiClQeyw20
	KJH9KuA0ClwHYMoPFt/5viw8ggFyhX0hETnU97VBgu4huILpbTg8X7vPY9Yns7T5/MEgKgLkZKlID
	wWSkL0L5ozg6fkt720EERzs/b9eVn/kKog+ZgHjl1MkIWWuIeccHA7i+pPb/g9YJW8MI8WN43bdaC
	HVU+Yr69KzSStzoHFLOY4GHN+KczXmDkoCcf+pwSYdNwI8IZXRVCq3bll1mKA5q6YoR2bEMhQjG+5
	A7VpToKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwEnE-0000000CMsy-2gmq;
	Wed, 10 Sep 2025 06:59:00 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwEnB-0000000CMs6-2fmc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 06:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1757487534;
	bh=KtbgRtg//fqWfjWdTmRs7c1F/bK6SAHJGEEEnummDn4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NkFW3CiVPTwd0wTpMajw9sGYLPA6GzaOFZrdG6scboFuIUzmRb5nZAlcTptUZynta
	 UyGNdUUDSJPeerKSdsIH6NdXx3jvs+5TrzZnT3bL+yVHAD0XLOu7JsmdkbXppxIgU5
	 5wOx6xH6lkE7XPOy3sknrTy3RHq+f2kSBsJn0xLstyvKHXuG8vr/lSMGXK6oeaeHgs
	 OFj0aTU3RbWIGpUiB3Tj3jIfyGqT9NRs32kZC+CpJs1I1iiiHC6+z2OtK0j5MrI3Qp
	 cD40/Ot5ji962Nx43M4FJW7ev58n6TC3fjcjpPamLxqkg/u/a9YJO3WDY6wpOZ0juH
	 D5HVjxJCP30IQ==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2B54E6443C;
	Wed, 10 Sep 2025 14:58:53 +0800 (AWST)
Message-ID: <8d7b13b2eb51929ca2c1c3040b9fcf9f7dd16412.camel@codeconstruct.com.au>
Subject: Re: [PATCH] crypto: aspeed - Fix dma_unmap_sg() direction
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org, Neal Liu <neal_liu@aspeedtech.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 Joel Stanley <joel@jms.id.au>, Dhananjay Phadke
 <dphadke@linux.microsoft.com>, Johnny Huang <johnny_huang@aspeedtech.com>,
 linux-aspeed@lists.ozlabs.org,  linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Date: Wed, 10 Sep 2025 16:28:42 +0930
In-Reply-To: <20250905115112.26309-2-fourier.thomas@gmail.com>
References: <20250905115112.26309-2-fourier.thomas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_235857_870528_077CF5C4 
X-CRM114-Status: GOOD (  15.87  )
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

T24gRnJpLCAyMDI1LTA5LTA1IGF0IDEzOjUxICswMjAwLCBUaG9tYXMgRm91cmllciB3cm90ZToK
PiBJdCBzZWVtcyBsaWtlIGV2ZXJ5d2hlcmUgaW4gdGhpcyBmaWxlLCB3aGVuIHRoZSByZXF1ZXN0
IGlzIG5vdAo+IGJpZGlyZWN0aW9uYWwsIHJlcS0+c3JjIGlzIG1hcHBlZCB3aXRoIERNQV9UT19E
RVZJQ0XCoAo+IAoKT2theSwgaG93ZXZlcjoKCj4gYW5kIHJlcS0+c3JjIGlzCj4gbWFwcGVkIHdp
dGggRE1BX0ZST01fREVWSUNFLgoKQnkgdGhlIHBhdGNoIGl0c2VsZiwgb25lIHNob3VsZCByZWZl
ciB0byByZXEtPmRzdD8KCkFuZHJldwoKPiAKPiBGaXhlczogNjJmNThiMTYzN2I3ICgiY3J5cHRv
OiBhc3BlZWQgLSBhZGQgSEFDRSBjcnlwdG8gZHJpdmVyIikKPiBDYzogPHN0YWJsZUB2Z2VyLmtl
cm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEZvdXJpZXIgPGZvdXJpZXIudGhvbWFz
QGdtYWlsLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvY3J5cHRvL2FzcGVlZC9hc3BlZWQtaGFjZS1j
cnlwdG8uYyB8IDIgKy0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NyeXB0by9hc3BlZWQvYXNwZWVkLWhh
Y2UtY3J5cHRvLmMgYi9kcml2ZXJzL2NyeXB0by9hc3BlZWQvYXNwZWVkLWhhY2UtY3J5cHRvLmMK
PiBpbmRleCBhNzJkZmViYzUzZmYuLmZhMjAxZGFlMWY4MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2NyeXB0by9hc3BlZWQvYXNwZWVkLWhhY2UtY3J5cHRvLmMKPiArKysgYi9kcml2ZXJzL2NyeXB0
by9hc3BlZWQvYXNwZWVkLWhhY2UtY3J5cHRvLmMKPiBAQCAtMzQ2LDcgKzM0Niw3IEBAIHN0YXRp
YyBpbnQgYXNwZWVkX3NrX3N0YXJ0X3NnKHN0cnVjdCBhc3BlZWRfaGFjZV9kZXYgKmhhY2VfZGV2
KQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoH0gZWxzZSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBkbWFfdW5tYXBfc2coaGFjZV9kZXYtPmRldiwgcmVxLT5kc3QsIHJjdHgtPmRz
dF9uZW50cywKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIERNQV9UT19ERVZJQ0UpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRE1BX0ZST01fREVWSUNFKTsKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRtYV91bm1hcF9zZyhoYWNlX2Rldi0+ZGV2LCByZXEtPnNy
YywgcmN0eC0+c3JjX25lbnRzLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIERNQV9UT19ERVZJQ0UpOwo+IMKgwqDCoMKgwqDCoMKgwqB9
Cgo=


