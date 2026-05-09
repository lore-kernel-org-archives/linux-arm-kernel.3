Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1CFCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 02:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Message-ID:Subject:Cc:To:From:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avdKvoGJRAuQ/G1nFjj02K4Uj83fbTKqWhjTGahl/7o=; b=x5EGKFZSSL3c6N0/ovDxnGzEOC
	tOfusoYrxsMsoN8/2/XVqAwKD6ZhRs0RHE4GVjRJOp7NNVv8h8tmm01W9C21W/r8tMCPMxPYWdVGg
	ellSlPuKVBWksXzFWhcW3zVciBVR9XeQ8rbpeKt1WacMwuYWbKkgy2g8aAyRDE7hmWDT1+oYHFBuP
	VGcY2C1rUrk9A4yM4kjVcMfdWmZJ6Va4Yg/SqyiWMYKhz8SpnB+KSaL0f1WvkcNbbBPCulyCdoVdl
	oOupbrTHzCdBTtNAUNSNvkAzM/jsnTvEX6v1fJ+xOhTmCSQ73KRR3w+kEpRvazJ6aPUgUs3iF11KO
	8BQiAVCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXKo-00000007zh0-3vIZ;
	Sat, 09 May 2026 02:22:30 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXKl-00000007zci-2IQN;
	Sat, 09 May 2026 02:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Content-Type:MIME-Version:From:To:Subject:
	Message-ID:Date; bh=avdKvoGJRAuQ/G1nFjj02K4Uj83fbTKqWhjTGahl/7o=;
	b=Cr64Osv9T83iz/CxiWFBCsaSVzBbmNQdVX58HaL8TiZTNt6PXHfhBhpdtP6D7T
	+wP0UWEmutiiM167mgVTBqyrsrsPy+H9aLR9Ph+nbS3fNCCsc+6FCEp0wx6Pz7ac
	IJugrIlYzii0iWmV4GcE+X8z+j+P2dmU0R96sjP/xi3y0=
Received: from [127.0.1.1] (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDHZMtWmv5psi07AQ--.29113S2;
	Sat, 09 May 2026 10:22:16 +0800 (CST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Jiaqi <shijiaqi_develop@163.com>
To: dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] drm/rockchip: Fix vop2_create_crtcs() error path cleanup in vop2_bind()
Message-ID: <177829333389.202156.8952879725754526045@openclaw.local>
Date: Sat, 09 May 2026 10:22:13 +0800
In-Reply-To: <177829330856.202156.9366848570650672090@openclaw.local>
References: <177829330856.202156.9366848570650672090@openclaw.local>
X-CM-TRANSID: _____wDHZMtWmv5psi07AQ--.29113S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr1DJr1DWr4kGF4DZryUGFg_yoW8WF4Upw
	4kJFWjvr4UKr40qF1kAr1DuFWFka1IyayxJrn2k343uFnFkr1qyr1Y934rAw45XF97CFyj
	yFZrJ3y5JF1Uur7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbEfOUUUUU=
X-Originating-IP: [43.248.8.92]
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbC7xjWKmn+mlgO7gAA3+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_192227_951925_CE145AE3 
X-CRM114-Status: GOOD (  11.84  )
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

SW4gdm9wMl9iaW5kKCksIHdoZW4gdm9wMl9jcmVhdGVfY3J0Y3MoKSBmYWlscywgdGhlIGZ1bmN0
aW9uIHJldHVybnMKaW1tZWRpYXRlbHkgd2l0aG91dCBjYWxsaW5nIHZvcDJfZGVzdHJveV9jcnRj
cygpLiBUaGlzIG1lYW5zIGFueQpvZl9ub2RlIHJlZmVyZW5jZXMgc3RvcmVkIGluIHZwLT5jcnRj
LnBvcnQgYnkgdm9wMl9jcmVhdGVfY3J0Y3MoKSBhcmUKbGVha2VkLCBhcyB0aGV5IGFyZSBvbmx5
IHJlbGVhc2VkIGluIHZvcDJfZGVzdHJveV9jcnRjcygpLgoKQWRkaXRpb25hbGx5LCBpZiB0aGUg
Y29tcG9uZW50IGZyYW1ld29yayByZXRyaWVzIHRoZSBiaW5kIChlLmcuLCBkdWUgdG8KLUVQUk9C
RV9ERUZFUiBmcm9tIGRvd25zdHJlYW0gY29tcG9uZW50cyksIHRoZSBwcmV2aW91c2x5IHJlZ2lz
dGVyZWQKSVJRIHZpYSBkZXZtX3JlcXVlc3RfaXJxKCkgd2lsbCBjYXVzZSBzdWJzZXF1ZW50IGF0
dGVtcHRzIHRvIHJldHVybgotRUJVU1ksIHBlcm1hbmVudGx5IGJyZWFraW5nIHRoZSBkcml2ZXIu
CgpGaXggYnkgZW5zdXJpbmcgdm9wMl9jcmVhdGVfY3J0Y3MoKSBmYWlsdXJlcyBnbyB0aHJvdWdo
IHRoZSBlcnJfY3J0Y3MKbGFiZWwsIHdoaWNoIGNhbGxzIHZvcDJfZGVzdHJveV9jcnRjcygpIHRv
IHByb3Blcmx5IHJlbGVhc2UgYWxsCnJlc291cmNlcyBpbmNsdWRpbmcgb2Zfbm9kZSByZWZlcmVu
Y2VzLgoKU2lnbmVkLW9mZi1ieTogSmlhcWkgPHNoaWppYXFpX2RldmVsb3BAMTYzLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYyB8IDYgKysrLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIGIvZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMKaW5kZXggOGFmYWJlMjEx
OGE5Li4xMjM0NTY3ODkwYWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9y
b2NrY2hpcF9kcm1fdm9wMi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hp
cF9kcm1fdm9wMi5jCkBAIC0yNzM1LDcgKzI3MzUsNyBAQCBzdGF0aWMgaW50IHZvcDJfYmluZChz
dHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKCiAJ
cmV0ID0gdm9wMl9jcmVhdGVfY3J0Y3Modm9wMik7CiAJaWYgKHJldCkKLQkJcmV0dXJuIHJldDsK
KwkJZ290byBlcnJfY3J0Y3M7CgogCXJldCA9IHZvcDJfZmluZF9yZ2JfZW5jb2Rlcih2b3AyKTsK
IAlpZiAocmV0ID49IDApIHsKQEAgLTI3NTgsOCArMjc1OCw4IEBAIHN0YXRpYyBpbnQgdm9wMl9i
aW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRh
KQogCXJldHVybiAwOwoKIGVycl9jcnRjczoKKwlkZXZtX2ZyZWVfaXJxKGRldiwgdm9wMi0+aXJx
LCB2b3AyKTsKIAl2b3AyX2Rlc3Ryb3lfY3J0Y3Modm9wMik7Ci0KIAlyZXR1cm4gcmV0OwogfQoK
LS0KMi40MC4wCg==


