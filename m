Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A84BC369A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 16:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18LZ3UeBeD8+PKgIIQH47A2OwH8h/rcoFydIPYn9mgU=; b=i5H7UlxVE/7sYrQJzo9KQ8dm2R
	LJTekT0xbLXyCO8NPTjDHwBb7AduCaJzRVrcaYR5R65ulJgjRCAa6Hf2l/8hKcn1q94MZcSZcMygi
	hyH0qUzcrhkTw/ZkcESScDX4WOz4Ahc2Vx+Pu7G8nvd0FTYLfFFZ2H4+whTmzLnUPS+Gz6iqWn1/y
	kWYlmMsjQ6Hvmvy/bQhg9PdWcmasNz//CBIkAC/kMslJ85vingG5xXeIhpas+wgOf5u5nFJ9JgBZp
	mbLfWnrDv2aeZDE1kwuBLQXV4/01leY/tO/9CpoozhyuItHM82gH5A1vlQMmGG5b+DzDaKs0DWJpf
	YGqSQxug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pK6-00000001Amg-1zhW;
	Mon, 07 Apr 2025 16:27:46 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1m1c-00000000NX4-1dQt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 12:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=WMahgglQfhKL4OuHDIAWoSXkPdUPZsYVvzA3TCjbEf0=; b=X
	gQnXrBJb2R3WZcdOyq6khpMjlzuHyfF5MIDl29e+2RZQA47I/kH5MmOXRE8kMPy7
	FXhOVSL+UZDGWuhIL6XL/otpGtij/wphUcNCk8zWYJKFs6b9rgiAlPPWtK1xHNRL
	Y5YfFPlKGAZXDq76HgbgMd3XdLiCUvAoNhE2AmtcLs=
Received: from xavier_qy$163.com ( [117.131.123.221] ) by
 ajax-webmail-wmsvr-40-107 (Coremail) ; Mon, 7 Apr 2025 20:56:06 +0800 (CST)
X-Originating-IP: [117.131.123.221]
Date: Mon, 7 Apr 2025 20:56:06 +0800 (CST)
From: Xavier  <xavier_qy@163.com>
To: "Lance Yang" <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, baohua@kernel.org, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com, will@kernel.org
Subject: Re:Re: [PATCH v1] mm/contpte: Optimize loop to reduce redundant
 operations
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250407112922.17766-1-ioworker0@gmail.com>
References: <20250407092243.2207837-1-xavier_qy@163.com>
 <20250407112922.17766-1-ioworker0@gmail.com>
X-NTES-SC: AL_Qu2fBvyYv00t4CWcYekfmkgWgus/WcW2u/Qj3IRSO5FwjCHp5BA7Y1lTE0bM2/CDFx2OkAiHXThMzOpkY49pWoEMkBbwyGARC+fCx4rMd7OOzw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <5e3f976f.bca1.19610528896.Coremail.xavier_qy@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aygvCgCHr+dmy_NnpzeQAA--.53262W
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiTQYoEGfzsgefNwADs5
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_055628_740087_EE2118B4 
X-CRM114-Status: UNSURE (   7.93  )
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

CgpIaSBMYW5jZSwKClRoYW5rcyBmb3IgeW91ciBmZWVkYmFjaywgbXkgcmVzcG9uc2UgaXMgYXMg
Zm9sbG93cy4KCi0tClRoYW5rcywKWGF2aWVyCgoKCgoKQXQgMjAyNS0wNC0wNyAxOToyOToyMiwg
IkxhbmNlIFlhbmciIDxpb3dvcmtlcjBAZ21haWwuY29tPiB3cm90ZToKPlRoYW5rcyBmb3IgdGhl
IHBhdGNoLiBXb3VsZCB0aGUgZm9sbG93aW5nIGNoYW5nZSBiZSBiZXR0ZXI/Cj4KPmRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L21tL2NvbnRwdGUuYyBiL2FyY2gvYXJtNjQvbW0vY29udHB0ZS5jCj5p
bmRleCA1NTEwN2QyN2QzZjguLjY0ZWIzYjJmYmYwNiAxMDA2NDQKPi0tLSBhL2FyY2gvYXJtNjQv
bW0vY29udHB0ZS5jCj4rKysgYi9hcmNoL2FybTY0L21tL2NvbnRwdGUuYwo+QEAgLTE3NCw2ICsx
NzQsOSBAQCBwdGVfdCBjb250cHRlX3B0ZXBfZ2V0KHB0ZV90ICpwdGVwLCBwdGVfdCBvcmlnX3B0
ZSkKPiAKPiAJCWlmIChwdGVfeW91bmcocHRlKSkKPiAJCQlvcmlnX3B0ZSA9IHB0ZV9ta3lvdW5n
KG9yaWdfcHRlKTsKPisKPisJCWlmIChwdGVfeW91bmcob3JpZ19wdGUpICYmIHB0ZV9kaXJ0eShv
cmlnX3B0ZSkpCj4rCQkJYnJlYWs7Cj4gCX0KPiAKPiAJcmV0dXJuIG9yaWdfcHRlOwo+LS0gCj4K
PldlIGNhbiBjaGVjayB0aGUgb3JpZ19wdGUgZmxhZ3MgZGlyZWN0bHkgaW5zdGVhZCBvZiB1c2lu
ZyBleHRyYSBib29sZWFuCj52YXJpYWJsZXMsIHdoaWNoIGdpdmVzIHVzIGFuIGVhcmx5LWV4aXQg
d2hlbiBib3RoIGRpcnR5IGFuZCB5b3VuZyBmbGFncwo+YXJlIHNldC4KWW91ciB3YXkgb2Ygd3Jp
dGluZyB0aGUgY29kZSBpcyBpbmRlZWQgbW9yZSBjb25jaXNlLiBIb3dldmVyLCBJIHRoaW5rCiB1
c2luZyBib29sZWFuIHZhcmlhYmxlcyBtaWdodCBiZSBtb3JlIGVmZmljaWVudC4gQWx0aG91Z2gg
aXQgaW50cm9kdWNlcwogYWRkaXRpb25hbCB2YXJpYWJsZXMsIGNvbXBhcmluZyBib29sZWFuIHZh
bHVlcyBpcyBsaWtlbHkgdG8gYmUgbW9yZQogZWZmaWNpZW50IHRoYW4gY2hlY2tpbmcgYml0IHNl
dHRpbmdzLgoKPgo+QWxzbywgaXMgdGhpcyBvcHRpbWl6YXRpb24gcmVhbGx5IG5lZWRlZCBmb3Ig
dGhlIGNvbW1vbiBjYXNlPwpUaGlzIGZ1bmN0aW9uIGlzIG9uIGEgaGlnaC1mcmVxdWVuY3kgZXhl
Y3V0aW9uIHBhdGguIER1cmluZyBkZWJ1Z2dpbmcsCiBJIGZvdW5kIHRoYXQgaW4gbW9zdCBjYXNl
cywgdGhlIGZpcnN0IGZldyBwYWdlcyBhcmUgYWxyZWFkeSBtYXJrZWQgYXMKIGJvdGggZGlydHkg
YW5kIHlvdW5nLiBCdXQgY3VycmVudGx5LCB0aGUgcHJvZ3JhbSBzdGlsbCBoYXMgdG8gY29tcGxl
dGUKIHRoZSBlbnRpcmUgbG9vcCBvZiAxNiBwdGVwIGl0ZXJhdGlvbnMsIHdoaWNoIHNlcmlvdXNs
eSByZWR1Y2VzIHRoZSBlZmZpY2llbmN5Lgo+Cj5UaGFua3MsCj5MYW5jZQo=

