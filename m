Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E06EC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 03:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jg24Yo+Bw83kcQE5Zz+uHIe9HXkorbFQAvED/E/Ahmc=; b=Eq666vxJPfjNaGrN3Q4R8OFmTa
	adFqU0tcvsVzrdY1hgDO5ooryGfY5mMc3GcZ0J0H31OolJgK3EYSrn2VzKz8tTTHB5NdRvjfo+tyU
	6dICrzBU9BzgP78yQH2tXkQLWMxp4J/C4Dk7cxHN0yEbck8/GDRLMCFQ9jU67euN7ffcPw5gnCQAu
	/LqQ14LGcxk8wmzMRCEwTzS7PDkMvSEAvKqO0bh0EhxfNaKpuacybtUTIX2gkrFxnOhEx86AxarrU
	SJthjA7GzDKM3ptwzgjEM/NCGVAIrYFIyQBC5tWaHdZZ5tq+UGUG+EAIot8GLLbwOFnKmL3WIn4ZH
	GhGbPHiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN0v5-0000000Ed1l-0ZSO;
	Thu, 05 Jun 2025 03:05:31 +0000
Received: from smtp20.cstnet.cn ([159.226.251.20] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN0sx-0000000EcoC-0LEY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 03:03:21 +0000
Received: from chenglingfei22s$ict.ac.cn ( [115.42.62.11] ) by
 ajax-webmail-APP-10 (Coremail) ; Thu, 5 Jun 2025 11:02:51 +0800 (GMT+08:00)
X-Originating-IP: [115.42.62.11]
Date: Thu, 5 Jun 2025 11:02:51 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?56iL5YeM6aOe?= <chenglingfei22s@ict.ac.cn>
To: sven@svenpeter.dev, j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev
Cc: zhangzhenwei22b@ict.ac.cn, wangzhe12@ict.ac.cn, 
	chenglingfei22s@ict.ac.cn, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, 
	andi.shyti@kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [BUG] rmmod i2c-pasemi-platform causing kernel crash on Apple M1.
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.1-cmXT5 build
 20240627(e6c6db66) Copyright (c) 2002-2025 www.mailtech.cn cnic.cn
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5c598fea.3165d.1973e0a9a3a.Coremail.chenglingfei22s@ict.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: tACowABnWYXcCEForT8GAA--.62932W
X-CM-SenderInfo: xfkh0wpolqwwthlsj2g6lf3hldfou0/1tbiBgoEDmhA0QvjOgAAst
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW3Jw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_200319_494329_D0211444 
X-CRM114-Status: UNSURE (   9.19  )
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

SGksIGFsbCEKCldl4oCZdmUgZW5jb3VudGVyZWQgYSBrZXJuZWwgY3Jhc2ggd2hlbiBydW5uaW5n
IHJtbW9kIGkyYy1wYXNlbWktcGxhdGZvcm0gb24gYSBNYWMgTWluaSBNMSAoVDgxMDMpIHJ1bm5p
bmcgQXNhaGkgQXJjaCBMaW51eC4gCgpUaGUgYnVnIHdhcyBmaXJzdCBmb3VuZCBvbiB0aGUgTGlu
dXggdjYuNiwgd2hpY2ggaXMgYnVpbHQgbWFudWFsbHkgd2l0aCB0aGUgQXNhaGkgZ2l2ZW4gY29u
ZmlnIHRvIHJ1biBvdXIgc2VydmljZXMuIApBdCB0aGF0IHRpbWUsIHRoZSBpMmMtcGFzZW1pLXBs
YXRmb3JtIHdhcyBpMmMtYXBwbGUuCgpXZSBub3RpY2VkIGluIHRoZSBMaW51eCB2Ni43LCB0aGUg
cGFzZW1pIGlzIHNwbGl0dGVkIGludG8gdHdvIHNlcGFyYXRlIG1vZHVsZXMsIG9uZSBvZiB3aGlj
aCBpcyBpMmMtcGFzZW1pLXBsYXRmb3JtLgpUaGVyZWZvcmUsIHdlIGJ1aWx0IExpbnV4IHY2LjE0
LjYgYW5kIHRyaWVkIHRvIHJtbW9kIGkyYy1wYXNlbWktcGxhdGZvcm0gYWdhaW4sIHRoZSBjcmFz
aCBzdGlsbCBleGlzdHMuIE1vcmVvdmVyLCB3ZSBmZXRjaGVkIAp0aGUgbGF0ZXN0IGkyYy1wYXNl
bWktcGxhdGZvcm0gb24gbGludXgtbmV4dCg5MTE0ODNiMjU2MTJjOGJjMzJhNzA2YmE5NDA3Mzhj
YzQzMjk5NDk2KSBhbmQgYXNhaGksIGJ1aWx0IHRoZW0gYW5kIAp0ZXN0ZWQgYWdhaW4gd2l0aCBM
aW51eCB2Ni4xNC42LCBidXQgdGhlIGNyYXNoIHJlbWFpbnMuCgpCZWNhdXNlIGtleGVjIGlzIG5v
dCBzdXBwb3J0ZWQgYW5kIHdpbGwgbmV2ZXIgYmUgZnVsbHkgc3VwcG9ydGVkIG9uIEFwcGxlIFNp
bGljb24gcGxhdGZvcm1zIGR1ZSB0byBoYXJkd2FyZSBhbmQgZmlybXdhcmUgCmRlc2lnbiBjb25z
dHJhaW50cywgd2UgY2FuIG5vdCByZWNvcmQgdGhlIHBhbmljIGxvZ3MgdGhyb3VnaCBrZHVtcC4K
ClRodXMgd2UgdHJpZWQgdG8gZmluZCB0aGUgcm9vdCBjYXVzZSBvZiB0aGUgaXNzdWUgbWFudWFs
bHkuIFdoZW4gd2UgcGVyZm9ybSBybW1vZCwgdGhlIGtlcm5lbCBwZXJmb3JtcyBkZXZpY2UgcmVs
ZWFzaW5nIG9uIAp0aGUgaTJjIGJ1cywgdGhlbiBjYWxscyB0aGUgcmVtb3ZlIGZ1bmN0aW9uIGlu
IHNuZC1zb2MtY3M0Mmw4My1pMmMsIHdoaWNoIGNhbGxzIHRoZSBjczQybDQyX2NvbW1vbl9yZW1v
dmUgaW4gY3M0Mmw0MiwgCmJlY2F1c2UgY3M0Mmw0Mi0mZ3Q7aW5pdF9kb25lIGlzIHRydWUsIGl0
IHBlcmZvcm1zIHJlZ21hcF93cml0ZSwgYW5kIGZpbmFsbHkgY2FsbHMgaW50byBwYXNlbWlfc21i
X3dhaXRyZWFkeSBpbiBpMmMtcGFzZW1pCi1jb3JlLmMuIFdlIG5vdGljZWQgdGhhdCBzbWJ1cy0m
Z3Q7dXNlX2lycSBpcyB0cnVlLCBhbmQgYWZ0ZXIgaXQgY2FsbHMgaW50byB3YWl0X2Zvcl9jb21w
bGV0aW9uX3RpbWVvdXQsIHRoZSBzeXN0ZW0gY3Jhc2hzIQoKV2UgZm91bmQgdGhhdCB3YWl0X2Zv
cl9jb21wbGV0aW9uX3RpbWVvdXQgaXMgb25lIG9mIHRoZSBjb3JlIHNjaGVkdWxlciBBUElzIHVz
ZWQgYnkgdGVucyBvZiB0aG91c2FuZHMgb2Ygb3RoZXIgZHJpdmVycywKaXQgaXMgdW5saWtlbHkg
Y2F1c2luZyB0aGUgY3Jhc2guIFNvIHdlIHRyaWVkIHRvIHJlbW92ZSB0aGUgY2FsbCB0byB3YWl0
X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQsIHRoZW4gdGhlIHN5c3RlbSBzZWVtcyB0bwpydW4gd2Vs
bC4KCkhvd2V2ZXIsIGJlY2F1c2Ugd2UgaGF2ZSBsaXR0bGUga25vd2xlZGdlIGFib3V0IGkyYyBk
ZXZpY2VzIGFuZCBzcGVjaWZpY2F0aW9ucywgd2UgYXJlIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBj
aGFuZ2Ugd2lsbCAKY2F1c2Ugb3RoZXIgcG90ZW50aWFsIGhhcm1zIGZvciB0aGUgc3lzdGVtIGFu
ZCBkZXZpY2UuIElzIHRoaXMgY2FsbCB0byB3YWl0IG5lY2VzYXJ5IGhlcmU/IE9yIGNhbiB5b3Ug
Z2l2ZSBhIG1vcmUgCnNvcGhpc3RpY2F0ZWQgZml4PwoKV2XigJlyZSBoYXBweSB0byBwcm92aWRl
IGFkZGl0aW9uYWwgbG9ncywgY29uZmlncywgb3IgdGVzdGluZyBhc3Npc3RhbmNlLiBBbnkgZ3Vp
ZGFuY2Ugd291bGQgYmUgZ3JlYXRseSBhcHByZWNpYXRlZCEKCgo=

