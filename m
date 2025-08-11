Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F95C87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 10:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owUx36sFQdfrwcgqsHOKfaL+gmeeLe3P4XTe6826VzE=; b=hvGw+3haLBq1EvbCBVgE+gek+h
	E/3Y/g/q1jGLfaJeo3Q84FzMN3h9Gej8FwHYGnixbws2VCTRL/KNi1LT9jwlwc+p8fy+iigLwVvBX
	me+r3wJ4jY/cYbvq00xEiasMAu2jrYL5DZH6/PfOrPgX5bGt7wngAuoCpPi7AIn54tUrOxBbvOq/2
	qyiOSSzSmst6uPLW3Tx/EDL6gaSUvGhDnIJdZt5CxGuKAcg1dadd9V+EJJ+jtNhv9DCcp7KffBbxg
	0i9OkrER/nDSkOQGxemHf48gyXYUGSDVjyPiSNGCV9meRpGL7nO9AJZc07Xz9F6QhweTRdHiZECpt
	KhTvzmDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPVl-00000007Hfi-397M;
	Mon, 11 Aug 2025 10:12:13 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPI0-00000007Fds-2nrE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 09:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=axFqqKjFyzO6OFlw3DpMgxsX7YxlZlAXL6gBJ6lZ8Kc=; b=N
	jg9IMiu1wRvVSUCqtNG4SCZqS0z25XYU1+v2GaNc3ydbNQVZspUlL3AOCzOo+JIT
	OirBpdEYC35F9SY7byd8lRO12piCfV0hCYsumHd6cmi81r1YnkzIPc4WOGbLjY0r
	/35kd2K+bnWRs9KioAd5kfdr5Wihv3Z0PXGi1W0BxQ=
Received: from fanqincui$163.com ( [124.127.58.139] ) by
 ajax-webmail-wmsvr-40-122 (Coremail) ; Mon, 11 Aug 2025 17:57:44 +0800
 (CST)
X-Originating-IP: [124.127.58.139]
Date: Mon, 11 Aug 2025 17:57:44 +0800 (CST)
From: fanqincui  <fanqincui@163.com>
To: "Marc Zyngier" <maz@kernel.org>
Cc: "Will Deacon" <will@kernel.org>, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Fanqin Cui" <cuifq1@chinatelecom.cn>, hanht2@chinatelecom.cn
Subject: Re:Re: [PATCH] arm64/module: Support for patching modules during
 runtime
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20250519(9504565a)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <86y0rq8cf8.wl-maz@kernel.org>
References: <20250807072700.348514-1-fanqincui@163.com>
 <aJXlegQfZTdimS3k@willie-the-truck>
 <3d4011c0.6aaa.198981027d7.Coremail.fanqincui@163.com>
 <86zfc68exk.wl-maz@kernel.org>
 <587b3c08.7e85.19898424fdb.Coremail.fanqincui@163.com>
 <86y0rq8cf8.wl-maz@kernel.org>
X-NTES-SC: AL_Qu2eBvWbuUot4iSdYukXk0wWhOw8Xcexv/0h1IBfPZ00qSTB2TA5dm57NHfH3PmCFgymoQmxeTRT5MtCc5tocb/Va24IOkWgsyfdbruvUtXG
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <56b98f57.954f.1989890838d.Coremail.fanqincui@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eigvCgD3V5CYvploBJwXAA--.6776W
X-CM-SenderInfo: 5idq1xpqfxxqqrwthudrp/1tbiQxGmpWiZpAP03wAFsp
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_025801_040498_372CE093 
X-CRM114-Status: GOOD (  11.44  )
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

Cgo+V2VsbCwgeW91IGNhbid0IGtub3cgYWJvdXQgdGhhdC4gV2UgcGF0Y2ggYmFzaWMgcHJpbWl0
aXZlcyBzdWNoIGFzCj5hdG9taWNzLCBzeXN0ZW0gcmVnaXN0ZXIgYWNjZXNzLCBhbmQgcGxlbnR5
IG9mIG90aGVyIHRoaW5ncy4gVGhlc2UKPnRoaW5ncyBuZWVkIHRvIGludGVyb3BlcmF0ZSB3aXRo
IHRoZSByZXN0IG9mIHRoZSBrZXJuZWwuCj4KPkl0J3MgYWxyZWFkeSBkaWZmaWN1bHQgdG8gZ3Vh
cmFudGVlIGluc2lkZSB0aGUga2VybmVsIGl0c2VsZi4gSGF2aW5nCj5pdCBpbiByYW5kb20gbW9k
dWxlcyB3aWxsIGJlIGV2ZW4gaGFyZGVyLgo+CgoKT2theSwgc28gdGhlIGtlcm5lbCBwYXRjaGVz
IHlvdSBtZW50aW9uZWQsIGFyZSB0aGV5IGFscmVhZHkgcGF0Y2hlZAp3aGVuIHRoZSBtb2R1bGUg
aXMgaW5zdGFsbGVkPyBUaGlzIGRvZXNuJ3QgY29uZmxpY3Qgd2l0aCB0aGUga2VybmVsIHBhdGNo
aW5nLgpJIG1lYW4sIHRoZSBzcGVjaWZpYyBwYXRjaGluZyB3aXRoaW4gdGhlIG1vZHVsZSBpcyB1
cCB0byBtZS4gSWYgdGhlCmNoaWNrZW4tYW5kLWVnZyBwcm9ibGVtIHlvdSBtZW50aW9uZWQgZXhp
c3QsIG1vZHVsZSBkZXZlbG9wZXJzCnNob3VsZCBhdm9pZCBpdCBpbiB0aGVpciBvd24gY29kZS7C
oAoKCkkgdGhpbmsgdGhlIGtlcm5lbCBzaG91bGQgcHJvdmlkZSBtb2R1bGVzIHdpdGggdGhlIGFi
aWxpdHkgdG8gcGF0Y2gKdGhlbXNlbHZlcywgcmlnaHQ/CgoKRmFucWluCgoKCgoKQXQgMjAyNS0w
OC0xMSAxNjo1NTo1NSwgIk1hcmMgWnluZ2llciIgPG1hekBrZXJuZWwub3JnPiB3cm90ZToKPk9u
IE1vbiwgMTEgQXVnIDIwMjUgMDk6MzI6MTkgKzAxMDAsCj5mYW5xaW5jdWkgPGZhbnFpbmN1aUAx
NjMuY29tPiB3cm90ZToKPj4gCj4+IAo+PiBIaSBtYXJjLAo+PiBUaGUgY2FsbGJhY2sgZnVuY3Rp
b24gaXMgZGVzaWduZWQgYnkgdGhlIGRldmVsb3Blci4gRGV2ZWxvcGVycyBuZWVkCj4+IHRvIHVz
ZSB0aGUgY2FsbGJhY2sgZnVuY3Rpb24gdG8gcGF0Y2ggdGhlaXIgb3duIG1vZHVsZSBjb2RlLiBV
bmRlcgo+PiB0aGlzIHByZW1pc2UsIGRldmVsb3BlcnMgYXJlIHJlc3BvbnNpYmxlIGZvciBwcm92
aWRpbmcgdGhlIGNvcnJlY3QKPj4gY2FsbGJhY2sgZnVuY3Rpb24uCj4+IEEgY29ycmVjdCBjYWxs
YmFjayBmdW5jdGlvbiBpbXBsZW1lbnRhdGlvbiBkb2VzIG5vdCByZXF1aXJlIGZ1cnRoZXIKPj4g
cGF0Y2hpbmcuCj4KPldlbGwsIHlvdSBjYW4ndCBrbm93IGFib3V0IHRoYXQuIFdlIHBhdGNoIGJh
c2ljIHByaW1pdGl2ZXMgc3VjaCBhcwo+YXRvbWljcywgc3lzdGVtIHJlZ2lzdGVyIGFjY2Vzcywg
YW5kIHBsZW50eSBvZiBvdGhlciB0aGluZ3MuIFRoZXNlCj50aGluZ3MgbmVlZCB0byBpbnRlcm9w
ZXJhdGUgd2l0aCB0aGUgcmVzdCBvZiB0aGUga2VybmVsLgo+Cj5JdCdzIGFscmVhZHkgZGlmZmlj
dWx0IHRvIGd1YXJhbnRlZSBpbnNpZGUgdGhlIGtlcm5lbCBpdHNlbGYuIEhhdmluZwo+aXQgaW4g
cmFuZG9tIG1vZHVsZXMgd2lsbCBiZSBldmVuIGhhcmRlci4KPgo+PiBGdXJ0aGVybW9yZSwgdGhl
IGNhbGxiYWNrIGl0c2VsZiBtdXN0IGJlIGV4ZWN1dGFibGUuIElmIHRoZSBjYWxsYmFjawo+PiBm
dW5jdGlvbiBoYXMgcHJvYmxlbXMsIHRoZSBtb2R1bGUncyBmdW5jdGlvbmFsaXR5IHdpbGwgYmUg
YWZmZWN0ZWQuCj4KPkV4YWN0bHkuIEhlbmNlIG15IHF1ZXN0aW9uLgo+Cj4JTS4KPgo+LS0gCj5X
aXRob3V0IGRldmlhdGlvbiBmcm9tIHRoZSBub3JtLCBwcm9ncmVzcyBpcyBub3QgcG9zc2libGUu
Cg==

