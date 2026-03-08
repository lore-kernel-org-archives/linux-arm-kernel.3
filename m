Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7412F55137
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 08:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1zjlA/klZlSHnIVdLeEaaV4ufSsDSYcjiWhkuDStlk=; b=priGQbt6XzP+gFTXOzVPhT2xwS
	td1hqtXFzOofgic1CajnTUaBQlyrnK1DyM8sC0gwgpLXLLx1wiSQd0rhKBgAASsNtv7rift91dMXF
	m8Jjk0civBS0FZv5ODk5jHvNpJHlVeC9HdU7tTT6/1w6BD66UsZrbiO3bWelnDPvHmGjxEKs0ZlWU
	LKIUWJQq5Div0QCAcuHl4bioKtYhfREDNHGN3o9ys3dHRmCFfmbM1YCnDrVuzzJpC/cJRoQVQiOmz
	gk9WwZdcHtY5HoqYMUw6V6Tsw/a6QahynhJxxu2kES1K1dtdhN07CD1RsaR8am6ld517JSTjJky8r
	mHsEpEGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz9w6-00000005p0K-0754;
	Sun, 08 Mar 2026 08:56:30 +0000
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net ([206.189.21.223])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz9w1-00000005ozp-1NQT;
	Sun, 08 Mar 2026 08:56:28 +0000
Received: from zju.edu.cn (unknown [10.190.130.78])
	by mtasvr (Coremail) with SMTP id _____wB3LryoOa1pXPYbAQ--.12670S3;
	Sun, 08 Mar 2026 16:56:09 +0800 (CST)
Received: from 12321260$zju.edu.cn ( [10.190.130.78] ) by
 ajax-webmail-mail-app1 (Coremail) ; Sun, 8 Mar 2026 16:56:08 +0800
 (GMT+08:00)
X-Originating-IP: [10.190.130.78]
Date: Sun, 8 Mar 2026 16:56:08 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5ZC05Yeh?= <12321260@zju.edu.cn>
To: "Andrew Lunn" <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
	heiko@sntech.de, romain.perier@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, stable@vger.kernel.org
Subject: Re: Re: [PATCH] net: ethernet: arc: fix use-after-free in probe
 error path
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.3-cmXT6 build
 20250620(94335109) Copyright (c) 2002-2026 www.mailtech.cn zju.edu.cn
In-Reply-To: <b6ac1471-e33a-41d3-9e67-e6463612f05b@lunn.ch>
References: <20260304025303.145493-1-fanwu01@zju.edu.cn>
 <b6ac1471-e33a-41d3-9e67-e6463612f05b@lunn.ch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <54c76f66.7eea7.19ccca93975.Coremail.12321260@zju.edu.cn>
X-Coremail-Locale: en_US
X-CM-TRANSID: yy_KCgAHo92oOa1pWuiGBg--.30391W
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/1tbiAhIDDWmrLgoMEQADsm
X-CM-DELIVERINFO: =?B?gEDuYgXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnavhLs56Y63gVsH20GwZZ/AGh8Wv4MBZHO6jCuJQoOblPSuqe12vv9oeen2DneSXRdoI
	7tVbAR91em3WWX0heT2vHM8yIkrmq1SNzgYBL9NM1zZZwJgA5uvlZHJ5sOtPkQ==
X-Coremail-Antispam: 1Uk129KBj93XoW7Zw4kCryDXr4DXFyUZr4kXwc_yoW8Kryxpa
	yDXF9YkrWDGF10qw4DGas7uFW8X3yxGws8CasYy39xuw15JFyftry7KrWY9r15urWUGw15
	XrWqy34DZa4DX3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUH2b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804V
	CY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AK
	xVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JM4x0Y48IcxkI7VAKI48G6xCjnVAKz4kxM4xvF2IEb7IF0Fy264kE64k0F24l
	FcxC0VAYjxAxZF0Ex2IqxwACI402YVCY1x02628vn2kIc2xKxwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr0_Gr1UMVCEFcxC0VAYjxAxZFUvcSsGvfC2KfnxnUUI43ZEXa7IU8zMNUUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_005625_687698_3CDD65B3 
X-CRM114-Status: GOOD (  10.67  )
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

WW91IGFyZSByaWdodCB0aGF0IG5vcm1hbCBkZXZpY2UgaW50ZXJydXB0IGdlbmVyYXRpb24gaXMg
ZW5hYmxlZCBpbiBhcmNfZW1hY19vcGVuKCkgdmlhIFJfRU5BQkxFLCBzbyB3ZSBjZXJ0YWlubHkg
ZG9uJ3QgZXhwZWN0IHJlZ3VsYXIgUlgvVFggdHJhZmZpYyBpbnRlcnJ1cHRzIGR1cmluZyBwcm9i
ZS4KCk15IG1haW4gY29uY2VybiBoZXJlIGlzIHRoZSBsaWZldGltZSBvcmRlcmluZyBpbiB0aGUg
ZXJyb3IgcGF0aC4gYXJjX2VtYWNfcHJvYmUoKSBpbnN0YWxscyB0aGUgSVJRIGhhbmRsZXIgdmlh
IGRldm1fcmVxdWVzdF9pcnEoLi4uLCBuZGV2KSwgYnV0IGlmIGVtYWNfcm9ja2NoaXBfcHJvYmUo
KSBmYWlscyBsYXRlciwgaXQgZXhwbGljaXRseSBjYWxscyBmcmVlX25ldGRldihuZGV2KSB3ZWxs
IGJlZm9yZSB0aGUgZGV2cmVzIGNsZWFudXAgcm91dGluZSBydW5zLgoKSW4gdGhhdCBzcGVjaWZp
YyBnYXAsIGlmIGFuIElSUSBpcyBzb21laG93IGRlbGl2ZXJlZOKAlHBlcmhhcHMgZnJvbSBhIHBl
bmRpbmcvbGF0Y2hlZCBsaW5lIGxlZnQgYnkgdGhlIGZpcm13YXJlL2Jvb3Rsb2FkZXIsIG9yIG90
aGVyIG5vbi10cmFmZmljIGFub21hbGllc+KAlGFyY19lbWFjX2ludHIoKSB3aWxsIGltbWVkaWF0
ZWx5IGRlcmVmZXJlbmNlIGRldl9pZCBhcyBhIHN0cnVjdCBuZXRfZGV2aWNlICouIFNpbmNlIG5k
ZXYgaGFzIGFscmVhZHkgYmVlbiBtYW51YWxseSBmcmVlZCwgdGhpcyByZXN1bHRzIGluIGEgVUFG
LgoKU28gd2hpbGUgSSBjb21wbGV0ZWx5IGFncmVlIHRoaXMgaXNuJ3QgYSBub3JtYWwgcHJlLW9w
ZW4gdHJhZmZpYyBwYXRoLCB0aGUgbWl4ZWQgbGlmZXRpbWUgbWFuYWdlbWVudCAobWFuYWdlZCBJ
UlEgdnMuIG1hbnVhbCBuZXRkZXYgZnJlZSkgc3RpbGwgY3JlYXRlcyBhIHJlYWwgcmFjZSB3aW5k
b3cuCgpTd2l0Y2hpbmcgdG8gZGV2bV9hbGxvY19ldGhlcmRldigpIHB1dHMgYm90aCByZXNvdXJj
ZXMgdW5kZXIgZGV2cmVzIG1hbmFnZW1lbnQsIHBlcm1hbmVudGx5IGZpeGluZyB0aGlzIHRlYXJk
b3duIG9yZGVyaW5nIGlzc3VlLiBJIHdvdWxkIGJlIGhhcHB5IHRvIHNlbmQgYSB2MiBhbmQgcmV3
b3JkIHRoZSBjb21taXQgbG9nIHRvIGVtcGhhc2l6ZSB0aGlzIGFzIGEgcG90ZW50aWFsIHJhY2Ug
d2luZG93IGFuZCBhIGhhcmRlbmluZyBmaXguIExldCBtZSBrbm93IHdoYXQgeW91IHRoaW5rLgoK
Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlcy0tLS0tCj4gRnJvbTogIkFuZHJldyBMdW5uIiA8YW5k
cmV3QGx1bm4uY2g+Cj4gU2VuZCB0aW1lOlRodXJzZGF5LCAwNS8wMy8yMDI2IDA2OjI5OjA1Cj4g
VG86ICJGYW4gV3UiIDxmYW53dTAxQHpqdS5lZHUuY24+Cj4gQ2M6IG5ldGRldkB2Z2VyLmtlcm5l
bC5vcmcsIGRhdmVtQGRhdmVtbG9mdC5uZXQsIGt1YmFAa2VybmVsLm9yZywgZWR1bWF6ZXRAZ29v
Z2xlLmNvbSwgcGFiZW5pQHJlZGhhdC5jb20sIGFuZHJldytuZXRkZXZAbHVubi5jaCwgaGVpa29A
c250ZWNoLmRlLCByb21haW4ucGVyaWVyQGdtYWlsLmNvbSwgbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnLCBsaW51eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnLCBzdGFi
bGVAdmdlci5rZXJuZWwub3JnCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gbmV0OiBldGhlcm5ldDog
YXJjOiBmaXggdXNlLWFmdGVyLWZyZWUgaW4gcHJvYmUgZXJyb3IgcGF0aAo+IAo+IE9uIFdlZCwg
TWFyIDA0LCAyMDI2IGF0IDAyOjUzOjAzQU0gKzAwMDAsIEZhbiBXdSB3cm90ZToKPiA+IFRoZSBh
cmNfZW1hY19wcm9iZSgpIGZ1bmN0aW9uIGNhbGxzIGRldm1fcmVxdWVzdF9pcnEoKSB3aXRoIHRo
ZQo+ID4gbmV0X2RldmljZSBhcyB0aGUgZGV2X2lkLiBIb3dldmVyLCBpbiB0aGUgZXJyb3IgcGF0
aCBvZgo+ID4gZW1hY19yb2NrY2hpcF9wcm9iZSgpLCBmcmVlX25ldGRldihuZGV2KSBpcyBjYWxs
ZWQgYmVmb3JlIHRoZSBkZXZtCj4gPiBjbGVhbnVwIGhhcHBlbnMuIFRoaXMgY3JlYXRlcyBhIHJh
Y2Ugd2luZG93IHdoZXJlIGFuIGludGVycnVwdCBjYW4KPiA+IGZpcmUgYW5kIHRoZSBJU1IgKGFy
Y19lbWFjX2ludHIpIHdpbGwgYWNjZXNzIHRoZSBhbHJlYWR5IGZyZWVkCj4gPiBuZXRfZGV2aWNl
IHN0cnVjdHVyZS4KPiAKPiBJdCBsb29rcyBsaWtlIGludGVycnVwdHMgYXJlIG9ubHkgZW5hYmxl
ZCBpbiBhcmNfZW1hY19vcGVuKCkuIEhhdmUgeW91Cj4gc2VlbiBpbnRlcnJ1cHRzIGJlZm9yZSB0
aGlzPwo+IAo+ICAgICAgQW5kcmV3Cg==


