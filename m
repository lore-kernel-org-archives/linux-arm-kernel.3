Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E3FCC6B2A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 07:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKyrajglvkZym7GVxjZbY9UdP4w2Ty0ujD/pRoAfYBE=; b=jvqRaH1SepP0E81BCZ2zeKEZkp
	t3qsrAdeSGtQlHTHzpDGNTVNEhXiYjTC3I0beY4L7//qxzQolzvF/uuUVYfmcgbigA8+BtRvKGIK3
	h8QGN3z1beE2FAv1DSioEnpeGPw0R/VjvWBkjlQ+iPCHr7iIUSUjLpaQPZWKPhAw7t0bSqrW8W89Y
	gFqwT7WsWlchq8AbHLibyngdUpxP94nVFGoDLjuKDGXqu7k01JOBVwFn/Dunu2KUxi3auH4GONePS
	6ZoiGka981eoXzoYdIEoaBVOGAsoh43LTrdznHpYKcoGWsFVZnQPNXp+oq8cx5MZ1wLRRrHSZltge
	GXrnrgQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHyr5-00000004W9p-01S8;
	Sat, 17 Oct 2026 07:29:23 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHyr2-00000004W98-125U
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 07:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=HKyrajglvkZym7GVxjZbY9UdP4w2Ty0ujD/pRoAfYBE=; b=o
	Rm7JJB4txNDoYAuBRgHgDpgCcjD6vBF81b/9PmMeC5Ve4Fqw4sxFqhJwJ0Dmcy2/
	ck7NQYzUwAaizmUmfZn6vsTDXL5j7IWCDxv9QSQXyjCpWaSQQVGs2JU/HkcHnOmH
	KQ7F9n0ectGaQWLkURK73mGI8WU0vPGdDqBLzkDbs8=
Date: Sat, 17 Oct 2026 15:29:10 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Marc Zyngier" <maz@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
	"Radu Rendec" <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH 2/6] irqchip/gic-v3-its: validate MADT ITS entries
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261016141357.2793046-3-yaojiale02@163.com>
References: <20261016141357.2793046-1-yaojiale02@163.com>
 <20261016141357.2793046-3-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAP6ZvUku5iSZbekdnEkQgO0/WsS1vfQu2Y5Wc+wEgCbN4z0YdHxaDHHN8e6DOSarnDiOagNHzNRcb4JH46+Glb8VrgXrm+pkFOCPxQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <626e9340.182e.1a148c3bf1f.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZygvCgD3X4bGI9NqMPtaAA--.138W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQaJw2rTI8YH7QAA33
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_002920_704078_814B904C 
X-CRM114-Status: UNSURE (   4.65  )
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

QXQgMjAyNi0xMC0xNiAyMjoxMzo1MywgIkppYWxlIFlhbyIgPHlhb2ppYWxlMDJAMTYzLmNvbT4g
d3JvdGU6Cj5UaGUgTUFEVCBJVFMgY2FsbGJhY2sgcmVhZHMgdGhlIHRyYW5zbGF0b3IgYmFzZSBh
ZGRyZXNzIGFuZCBJRCB3aXRob3V0Cj5jaGVja2luZyB0aGF0IGZpcm13YXJlIHN1cHBsaWVkIGEg
Y29tcGxldGUgZ2VuZXJpYyB0cmFuc2xhdG9yIHJlY29yZC4gQQo+dHJ1bmNhdGVkIGVudHJ5IGNh
biB0aGVyZWZvcmUgY2F1c2Ugb3V0LW9mLWJvdW5kcyByZWFkcy4KPgo+UmVqZWN0IGluY29tcGxl
dGUgSVRTIGVudHJpZXMgYmVmb3JlIGFjY2Vzc2luZyB0aGVpciB0eXBlZCBmaWVsZHMuCj4KCkZp
eGVzOiAzZjAxMGNmMTk3MzIgKCJpcnFjaGlwL2dpY3YzLWl0czogUHJvYmUgSVRTIGluIHRoZSBB
Q1BJIHdheSIpCgo+U2lnbmVkLW9mZi1ieTogSmlhbGUgWWFvIDx5YW9qaWFsZTAyQDE2My5jb20+
Cj4tLS0KPiBkcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12My1pdHMuYyB8IDMgKysrCj4gMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlw
L2lycS1naWMtdjMtaXRzLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12My1pdHMuYwo+aW5k
ZXggZTk4MDdhZjIzNTM3Li40ODVhNzkwZTQ4NTYgMTAwNjQ0Cj4tLS0gYS9kcml2ZXJzL2lycWNo
aXAvaXJxLWdpYy12My1pdHMuYwo+KysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjMtaXRz
LmMKPkBAIC01NzI1LDYgKzU3MjUsOSBAQCBzdGF0aWMgaW50IF9faW5pdCBnaWNfYWNwaV9wYXJz
ZV9tYWR0X2l0cyh1bmlvbiBhY3BpX3N1YnRhYmxlX2hlYWRlcnMgKmhlYWRlciwKPiAJaW50IGVy
cjsKPiAKPiAJaXRzX2VudHJ5ID0gKHN0cnVjdCBhY3BpX21hZHRfZ2VuZXJpY190cmFuc2xhdG9y
ICopaGVhZGVyOwo+KwlpZiAoQkFEX01BRFRfRU5UUlkoaXRzX2VudHJ5LCBlbmQpKQo+KwkJcmV0
dXJuIC1FSU5WQUw7Cj4rCj4gCW1lbXNldCgmcmVzLCAwLCBzaXplb2YocmVzKSk7Cj4gCXJlcy5z
dGFydCA9IGl0c19lbnRyeS0+YmFzZV9hZGRyZXNzOwo+IAlyZXMuZW5kID0gaXRzX2VudHJ5LT5i
YXNlX2FkZHJlc3MgKyBBQ1BJX0dJQ1YzX0lUU19NRU1fU0laRSAtIDE7Cj4tLSAKPjIuMzQuMQo=


