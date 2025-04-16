Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AD4C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 17:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47+gJAncXgsW/UcXh8b5zJQvQEDM/97e78NneI/DLfs=; b=gYm2VknspjzptPLvFzGv9xJjGP
	WIXcHTjpoqwLNYNVy3Cih10cH2YnJ+1Gsg6rsJja+8IKn/cYJtimEB9oQFNcUOi4q+TLhncziBIfe
	IslrnoWshuGexyUrPYXIQsQoEFRaJzR13weANoXpN14EUZWdA1hE8Kr8Lwp+UIyoSt+zrBjC9BMWV
	JnVPPaE406hrYn4VfG1e2Fw4iZ6JgoFKBjDmZfbw4jjF0GET++SEI0HFW0tXm3/Wk/qwaczltydo/
	gllAZ9Pjb0PkHdKcXv7F/wYd1mN5PLZ993h29lthKBJiZDrHZ+DDLNhdSxBb49kfEZ2EtHkMHni5w
	t1CEn/HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u568c-0000000ALr9-3LGc;
	Wed, 16 Apr 2025 17:01:26 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55Qp-0000000ADEg-0OIp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:16:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=E2lpbnQnbBedyoi0B/LK+sQPIFtcBCPeDplGCecK+HA=; b=D
	zRM4zOztmBCkE7fFty+203GCYYVh4T4AfQCmyzCP+csHf6fIZAwY20mMjpmieEkz
	u0RaTcR3a8jQ/C3pxJYBO8J82jRYZrXxN1U8ZWMHY2dR+vMgI0YVKrhYoekX7XDe
	jibYLu2Pdil4TNv/jOWXWc+OIdcXbo6aEFlYCzRXeM=
Received: from xavier_qy$163.com ( [2408:820c:3408:68f0:2136:e7d4:a861:aae3]
 ) by ajax-webmail-wmsvr-40-102 (Coremail) ; Thu, 17 Apr 2025 00:15:37 +0800
 (CST)
X-Originating-IP: [2408:820c:3408:68f0:2136:e7d4:a861:aae3]
Date: Thu, 17 Apr 2025 00:15:37 +0800 (CST)
From: Xavier  <xavier_qy@163.com>
To: "David Laight" <david.laight.linux@gmail.com>
Cc: ryan.roberts@arm.com, dev.jain@arm.com, ioworker0@gmail.com,
	21cnbao@gmail.com, akpm@linux-foundation.org,
	catalin.marinas@arm.com, david@redhat.com, gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, willy@infradead.org, ziy@nvidia.com
Subject: Re: [mm/contpte v3 1/1] mm/contpte: Optimize loop to reduce
 redundant operations
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250416095706.47a8afa2@pumpkin>
References: <f0e109c7-6bb2-4218-bc76-c5de39184064@arm.com>
 <20250415082205.2249918-1-xavier_qy@163.com>
 <20250415082205.2249918-2-xavier_qy@163.com>
 <20250416095706.47a8afa2@pumpkin>
X-NTES-SC: AL_Qu2fBvSZv0ko4SaQZekfmk4QgeY+WMW1vP4m34NSN5FwjCzp0ysiZlJTIXjNyvCDLzqKkAiHVTRiy9ZZf7hifrkoAhZ95jwxhkNyTfgk8IjyDQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <2b02076d.b3d5.1963f626edb.Coremail.xavier_qy@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZigvCgD3H+mp1_9noeSXAA--.33084W
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiwhExEGf-pJJ9EwAOs8
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_091611_532879_0A2499C9 
X-CRM114-Status: GOOD (  10.12  )
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

CgoKQXQgMjAyNS0wNC0xNiAxNjo1NzowNiwgIkRhdmlkIExhaWdodCIgPGRhdmlkLmxhaWdodC5s
aW51eEBnbWFpbC5jb20+IHdyb3RlOgo+T24gVHVlLCAxNSBBcHIgMjAyNSAxNjoyMjowNSArMDgw
MAo+WGF2aWVyIDx4YXZpZXJfcXlAMTYzLmNvbT4gd3JvdGU6Cj4KPj4gVGhpcyBjb21taXQgb3B0
aW1pemVzIHRoZSBjb250cHRlX3B0ZXBfZ2V0IGZ1bmN0aW9uIGJ5IGFkZGluZyBlYXJseQo+PiAg
dGVybWluYXRpb24gbG9naWMuIEl0IGNoZWNrcyBpZiB0aGUgZGlydHkgYW5kIHlvdW5nIGJpdHMg
b2Ygb3JpZ19wdGUKPj4gIGFyZSBhbHJlYWR5IHNldCBhbmQgc2tpcHMgcmVkdW5kYW50IGJpdC1z
ZXR0aW5nIG9wZXJhdGlvbnMgZHVyaW5nCj4+ICB0aGUgbG9vcC4gVGhpcyByZWR1Y2VzIHVubmVj
ZXNzYXJ5IGl0ZXJhdGlvbnMgYW5kIGltcHJvdmVzIHBlcmZvcm1hbmNlLgo+Cj5CZW5jaG1hcmtz
Pwo+Cj5BcyBoYXMgYmVlbiBwb2ludGVkIG91dCBiZWZvcmUgQ09OVF9QVEVTIGlzIHNtYWxsIGFu
ZCBJSVJDIGRpcnR5K3lvdW5nCj5pcyB1bnVzdWFsLgoKSSBoYXZlbid0IGZvdW5kIHNvbWUgc3Vp
dGFibGUgYmVuY2htYXJrIHRlc3RzIHlldC4gSSB3aWxsIHdyaXRlIHNvbWUgbW9yZQpnZW5lcmFs
IHRlc3Qgc2NlbmFyaW9zLiBQbGVhc2UgcGF5IGF0dGVudGlvbiB0byB0aGUgc3Vic2VxdWVudCBl
bWFpbHMuCgo+Cj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBYYXZpZXIgPHhhdmllcl9xeUAxNjMuY29t
Pgo+PiAtLS0KPj4gIGFyY2gvYXJtNjQvbW0vY29udHB0ZS5jIHwgMjAgKysrKysrKysrKysrKysr
KysrLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+PiAKPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvbW0vY29udHB0ZS5jIGIvYXJjaC9hcm02
NC9tbS9jb250cHRlLmMKPj4gaW5kZXggYmNhYzRmNTVmOWMxLi4wYWNmZWU2MDQ5NDcgMTAwNjQ0
Cj4+IC0tLSBhL2FyY2gvYXJtNjQvbW0vY29udHB0ZS5jCj4+ICsrKyBiL2FyY2gvYXJtNjQvbW0v
Y29udHB0ZS5jCj4+IEBAIC0xNTIsNiArMTUyLDE2IEBAIHZvaWQgX19jb250cHRlX3RyeV91bmZv
bGQoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkciwKPj4gIH0KPj4gIEVY
UE9SVF9TWU1CT0xfR1BMKF9fY29udHB0ZV90cnlfdW5mb2xkKTsKPj4gIAo+PiArLyogTm90ZTog
aW4gb3JkZXIgdG8gaW1wcm92ZSBlZmZpY2llbmN5LCB1c2luZyB0aGlzIG1hY3JvIHdpbGwgbW9k
aWZ5IHRoZQo+PiArICogcGFzc2VkLWluIHBhcmFtZXRlcnMuKi8KPgo+Li4uIHRoaXMgbWFjcm8g
bW9kaWZpZXMgLi4uCj4KPkJ1dCB5b3UgY2FuIG1ha2UgaXQgb2J2aW91cyBteSBwYXNzaW5nIGJ5
IHJlZmVyZW5jZS4KPlRoZSBjb21waWxlciB3aWxsIGdlbmVyYXRlIHRoZSBzYW1lIGNvZGUuCj4K
ClRoaXMgcGFydCBtYXkgYWxzbyBiZSBmdXJ0aGVyIHJlZmluZWQuCgotLQpUaGFua3MsClhhdmll
cgo=

