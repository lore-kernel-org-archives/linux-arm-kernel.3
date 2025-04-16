Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74ED4C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 15:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THyLcDlGIXVV8cn86M/Ck0fScGcZPZupKk8vOmy/1uo=; b=YgVFmiEgwK/4Ih9K9FQ4IqrVxJ
	IqqrgIFypuy4ZJ+AwnPwWZJpU9GJM7BP+WzOP7WFfO4vB/3rltQiMvLGw5j+dfIxDtGrNLRPEY7y8
	vyiMO4CyJrq865C53fI2USvCvZnVjotLa7a8ZdVHPTV4l0o7Jth7ham8m5YOQlMXQZ0+ix0zQFIyB
	mrR3LVUub/gP0eq5RET8zhT5RmqrVXZC1t6u9UqOWMULnfTcpLHepONwvAc5UVtvHGeInbTG0WsZu
	BdroqU1joVk45tFBVf0lDBLZrRAauCToIYb2uFzltbxxQFZk3PHtBG1g9yKgvpRrhx6B58nhTyAWh
	tyf5T3/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54qV-0000000A6js-1mkY;
	Wed, 16 Apr 2025 15:38:39 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54Nu-0000000A0j9-1EzZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 15:09:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=ssEC1GiSg5E0V6UFXRVMRch6ex2sT+s23sGhhuDgibc=; b=G
	hfIPeRva5WKmL/AszJf3SuA6X21obMR5uUwMDboCnsU8sO+qLZyzLjRYWgRD2Izk
	WAardEww6pb5LeRHVK7pdcGKfCirNaffVvGgpQOSVYYukz5n0pXJhO9yBlnf7Ybz
	9M/YrPw2qd/Y7HbGQ9zvUdx+65CeWwyKcQFWdBT8uk=
Received: from xavier_qy$163.com ( [2408:820c:3408:68f0:2136:e7d4:a861:aae3]
 ) by ajax-webmail-wmsvr-40-102 (Coremail) ; Wed, 16 Apr 2025 23:08:33 +0800
 (CST)
X-Originating-IP: [2408:820c:3408:68f0:2136:e7d4:a861:aae3]
Date: Wed, 16 Apr 2025 23:08:33 +0800 (CST)
From: Xavier  <xavier_qy@163.com>
To: "Catalin Marinas" <catalin.marinas@arm.com>
Cc: ryan.roberts@arm.com, dev.jain@arm.com, ioworker0@gmail.com,
	21cnbao@gmail.com, akpm@linux-foundation.org, david@redhat.com,
	gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org,
	ziy@nvidia.com
Subject: Re:Re: [mm/contpte v3 0/1] mm/contpte: Optimize loop to reduce
 redundant operations
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <Z_-m8s5EUrL4DAME@arm.com>
References: <f0e109c7-6bb2-4218-bc76-c5de39184064@arm.com>
 <20250415082205.2249918-1-xavier_qy@163.com> <Z_-m8s5EUrL4DAME@arm.com>
X-NTES-SC: AL_Qu2fBvSauUkq5SmfYukfmk4QgeY+WMW1vP4m34NSN5FwjCzp0ysiZlJTIXjNyvCDLzqKkAiHVTRiy9ZZf7hifrkol9Qpfs70rnBJOhES8Z4itQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <5d50fc6f.b19a.1963f250940.Coremail.xavier_qy@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZigvCgD3XIfyx_9n1OGXAA--.44848W
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiwhExEGf-pJJ9EwAGs0
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_080906_846886_414A2519 
X-CRM114-Status: GOOD (  19.50  )
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

CgpIaSBDYXRhbGluLAoKCkF0IDIwMjUtMDQtMTYgMjA6NDc6NDYsICJDYXRhbGluIE1hcmluYXMi
IDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4gd3JvdGU6Cj5PbiBUdWUsIEFwciAxNSwgMjAyNSBh
dCAwNDoyMjowNFBNICswODAwLCBYYXZpZXIgd3JvdGU6Cj4+IFBhdGNoIFYzIGhhcyBjaGFuZ2Vk
IHRoZSB3aGlsZSBsb29wIHRvIGEgZm9yIGxvb3AgYWNjb3JkaW5nIHRvIHRoZSBzdWdnZXN0aW9u
cwo+PiBvZiBEZXYuCj4KPkZvciBzb21lIHJlYXNvbiwgbXkgZW1haWwgKG9mZmljZTM2NSkgcmVq
ZWN0ZWQgYWxsIHRoZXNlIHBhdGNoZXMgKG5vdAo+ZXZlbiBxdWFyYW50aW5lZCksIEkgb25seSBn
b3QgdGhlIHJlcGxpZXMuIEFueXdheSwgSSBjYW4gZ2V0IHRoZW0gZnJvbQo+dGhlIGxvcmUgYXJj
aGl2ZS4KPgo+PiBNZWFud2hpbGUsIHRvIGltcHJvdmUgZWZmaWNpZW5jeSwgdGhlIGRlZmluaXRp
b24gb2YgbG9jYWwgdmFyaWFibGVzIGhhcwo+PiBiZWVuIHJlbW92ZWQuIFRoaXMgbWFjcm8gaXMg
b25seSB1c2VkIHdpdGhpbiB0aGUgY3VycmVudCBmdW5jdGlvbiBhbmQgdGhlcmUKPj4gd2lsbCBi
ZSBubyBhZGRpdGlvbmFsIHJpc2tzLiBJbiBvcmRlciB0byB2ZXJpZnkgdGhlIG9wdGltaXphdGlv
biBwZXJmb3JtYW5jZSBvZgo+PiBQYXRjaCBWMywgYSB0ZXN0IGZ1bmN0aW9uIGhhcyBiZWVuIGRl
c2lnbmVkLiBCeSByZXBlYXRlZGx5IGNhbGxpbmcgbWxvY2sgaW4gYQo+PiBsb29wLCB0aGUga2Vy
bmVsIGlzIG1hZGUgdG8gY2FsbCBjb250cHRlX3B0ZXBfZ2V0IGV4dGVuc2l2ZWx5IHRvIHRlc3Qg
dGhlCj4+IG9wdGltaXphdGlvbiBlZmZlY3Qgb2YgdGhpcyBmdW5jdGlvbi4KPj4gVGhlIGZ1bmN0
aW9uJ3MgZXhlY3V0aW9uIHRpbWUgYW5kIGluc3RydWN0aW9uIHN0YXRpc3RpY3MgaGF2ZSBiZWVu
IHRyYWNlZCB1c2luZwo+PiBwZXJmLCBhbmQgdGhlIGZvbGxvd2luZyBhcmUgdGhlIG9wZXJhdGlv
biByZXN1bHRzIG9uIGEgY2VydGFpbiBRdWFsY29tbSBtb2JpbGUKPj4gcGhvbmUgY2hpcDoKPj4g
Cj4+IEluc3RydWN0aW9uIFN0YXRpc3RpY3MgLSBCZWZvcmUgT3B0aW1pemF0aW9uCj4+ICMgICAg
ICAgICAgY291bnQgIGV2ZW50X25hbWUgICAgICAgICAgICAgICMgY291bnQgLyBydW50aW1lCj4+
ICAgICAgIDIwLDgxNCwzNTIgIGJyYW5jaC1sb2FkLW1pc3NlcyAgICAgICMgNjYyLjI0NCBLL3Nl
Ywo+PiAgIDQxLDg5NCw5ODYsMzIzICBicmFuY2gtbG9hZHMgICAgICAgICAgICAjIDEuMzMzIEcv
c2VjCj4+ICAgICAgICAxLDk1Nyw0MTUgIGlUTEItbG9hZC1taXNzZXMgICAgICAgICMgNjIuMjc4
IEsvc2VjCj4+ICAgNDksODcyLDI4MiwxMDAgIGlUTEItbG9hZHMgICAgICAgICAgICAgICMgMS41
ODcgRy9zZWMKPj4gICAgICAzMDIsODA4LDA5NiAgTDEtaWNhY2hlLWxvYWQtbWlzc2VzICAgIyA5
LjYzNCBNL3NlYwo+PiAgIDQ5LDg3MiwyODIsMTAwICBMMS1pY2FjaGUtbG9hZHMgICAgICAgICAj
IDEuNTg3IEcvc2VjCj4+IAo+PiBUb3RhbCB0ZXN0IHRpbWU6IDMxLjQ4NTIzNyBzZWNvbmRzLgo+
PiAKPj4gSW5zdHJ1Y3Rpb24gU3RhdGlzdGljcyAtIEFmdGVyIE9wdGltaXphdGlvbgo+PiAjICAg
ICAgICAgIGNvdW50ICBldmVudF9uYW1lICAgICAgICAgICAgICAjIGNvdW50IC8gcnVudGltZQo+
PiAgICAgICAxOSwzNDAsNTI0ICBicmFuY2gtbG9hZC1taXNzZXMgICAgICAjIDY4OC43NTMgSy9z
ZWMKPj4gICAzOCw1MTAsMTg1LDE4MyAgYnJhbmNoLWxvYWRzICAgICAgICAgICAgIyAxLjM3MSBH
L3NlYwo+PiAgICAgICAgMSw4MTIsNzE2ICBpVExCLWxvYWQtbWlzc2VzICAgICAgICAjIDY0LjU1
NCBLL3NlYwo+PiAgIDQ3LDY3Myw5MjMsMTUxICBpVExCLWxvYWRzICAgICAgICAgICAgICAjIDEu
Njk4IEcvc2VjCj4+ICAgICAgNjc1LDg1Myw2NjEgIEwxLWljYWNoZS1sb2FkLW1pc3NlcyAgICMg
MjQuMDY4IE0vc2VjCj4+ICAgNDcsNjczLDkyMywxNTEgIEwxLWljYWNoZS1sb2FkcyAgICAgICAg
ICMgMS42OTggRy9zZWMKPj4gCj4+IFRvdGFsIHRlc3QgdGltZTogMjguMTA4MDQ4IHNlY29uZHMu
Cj4KPldlJ2QgbmVlZCB0byByZXByb2R1Y2UgdGhlc2UgbnVtYmVycyBvbiBvdGhlciBwbGF0Zm9y
bXMgYXMgd2VsbCBhbmQgd2l0aAo+ZGlmZmVyZW50IHBhZ2Ugc2l6ZXMuIEkgaG9wZSBSeWFuIGNh
biBkbyBzb21lIHRlc3RzIG5leHQgd2Vlay4KCk9mIGNvdXJzZSwgaXQgd291bGQgYmUgZXZlbiBi
ZXR0ZXIgaWYgYW55IHJldmlld2VycyBjb3VsZCB2ZXJpZnkgaXQgd2l0aCBzb21lCnJlYWwtd29y
bGQgc2NlbmFyaW9zLgoKPgo+UHVyZWx5IGxvb2tpbmcgYXQgdGhlIHBhdGNoLCBJIGRvbid0IGxp
a2UgdGhlIGNvbXBsZXhpdHkuIEknZCByYXRoZXIgZ28KPndpdGggeW91ciB2MSBpZiB0aGUgbnVt
YmVycyBhcmUgZmFpcmx5IHNpbWlsYXIgKGV2ZW4gaWYgc2xpZ2h0bHkgc2xvd2VyKS4KClRoZSBp
bXBsZW1lbnRhdGlvbiBvZiB0aGlzIG1hY3JvIGlzIGluZGVlZCBhIGJpdCBjb21wbGljYXRlZC4g
SWYgaXQKZG9lc24ndCBhZmZlY3QgdGhlIHBlcmZvcm1hbmNlLCBJIHdpbGwgdHJ5IHRvIG1ha2Ug
aXQgc2ltcGxlci4KCj4KPkhvd2V2ZXIsIEkgZG9uJ3QgdHJ1c3QgbWljcm9iZW5jaG1hcmtzIGxp
a2UgY2FsbGluZyBtbG9jaygpIGluIGEgbG9vcC4KPkl0IHdhcyBoYW5kLWNyYWZ0ZWQgdG8gZGly
dHkgdGhlIHdob2xlIGJ1ZmZlciAobWFraW5nIHB0ZXMgeW91bmcrZGlydHkpCj5iZWZvcmUgbWxv
Y2soKSB0byBtYWtlIHRoZSBiZXN0IG91dCBvZiB0aGUgcmV3cml0dGVuIGNvbnRwdGVfcHRlcF9n
ZXQoKS4KPkFyZSB0aGVyZSBhbnkgcmVhbCB3b3JsZCB3b3JrbG9hZHMgdGhhdCB3b3VsZCBiZW5l
Zml0IGZyb20gc3VjaCBjaGFuZ2U/Cj4KPkFzIGl0IHN0YW5kcywgSSB0aGluayB0aGlzIHBhdGNo
IG5lZWRzIGJldHRlciBqdXN0aWZpY2F0aW9uLgo+CgpJbmRlZWQsIEkgdXNlZCBtbG9jaygpIGJl
Y2F1c2UgaXQgaXMgYW4gZXhhbXBsZSB0aGF0IGNhbiBzaW1wbHkgYWNoaWV2ZQphIGxhcmdlIG51
bWJlciBvZiBjYWxscyB0byBjb250cHRlX3B0ZXBfZ2V0KCkgaW4gdGhlIHVzZXIgc3BhY2UuIE9m
IGNvdXJzZSwKdGhlcmUgYXJlIG1hbnkgb3RoZXIgc2NlbmFyaW9zIHdoZXJlIHRoaXMgZnVuY3Rp
b24gd2lsbCBiZSBjYWxsZWQsIHN1Y2ggYXMKbWFkdmlzZSBhbmQgbXByb3RlY3QsIGFuZCBzbyBv
bi4gQnV0IGVzc2VudGlhbGx5LCB0aGVyZSBpcyBubyBkaWZmZXJlbmNlLAphbmQgYWxsIG9mIHRo
ZW0gYXJlIGFpbWVkIGF0IHZlcmlmeWluZyB0aGUgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQKYnJv
dWdodCBieSB0aGUgY29udHB0ZV9wdGVwX2dldCgpIGZ1bmN0aW9uLiBJdCdzIHRydWUgdGhhdCB0
aGUgcHJldmlvdXMKdGVzdCBjYXNlcyBvbmx5IHRlc3RlZCB0aGUgYmVzdC1jYXNlIHNjZW5hcmlv
IGJ5IGRpcnR5aW5nIHRoZSBkYXRhLgpOZXh0LCBJIHdpbGwgY29udGludWUgdG8gdGVzdCB0aGUg
aW1wYWN0IG9mIHRoZSBuZXcgcGF0Y2ggb24gcGVyZm9ybWFuY2UKaW4gc2NlbmFyaW9zIHdoZXJl
IHRoZXJlIGFyZSBubyAieW91bmciIGFuZCAiZGlydHkiIGZsYWdzLCBvciB3aGVyZSB0aGVyZQpp
cyBvbmx5IGEgInlvdW5nIiBmbGFnLgoKLS0KVGhhbmtzLApYYXZpZXIK

