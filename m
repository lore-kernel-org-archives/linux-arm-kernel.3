Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DC2CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 04:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Message-ID:Subject:Cc:To:From:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muL5Odg1PL2YBCDTHx39Smx59B2CA6afwPBNACoANYU=; b=LXSSahUFivW6tLxZCXHdlViRDu
	6FbGBfxoPvk5i5BJPaBiQh0naiLD8GeTGyHAq04JHEV7YUbxxoZ3lZAzIkIA94hQhV+rtiGv6j8B+
	rVYhY1g3M8mEekwC4yjMLA7ze8WXyS1zIgmusOyBwpb1MwPwGcy4uGBhczTpTPPHkInCDkj0Oulh5
	c8r2yq9L8o/VHGn7giUsVK8vMnvCTiUm9QBSVLHYNt2veWNzQ0NOxfqKlGdBflXdvHx0N53ce3Hbi
	vNoN1JyEBlNoq9hWQAPQw+Fmu7yTSyCLY6SgocAMNP3Mid/dUzMS9neztcANaZ+GXrXwueL+apqyO
	GM8MiydQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLZ8D-00000008B59-2NZx;
	Sat, 09 May 2026 04:17:37 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLZ8B-00000008B23-0wst;
	Sat, 09 May 2026 04:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Content-Type:MIME-Version:From:To:Subject:
	Message-ID:Date; bh=muL5Odg1PL2YBCDTHx39Smx59B2CA6afwPBNACoANYU=;
	b=qTuNjmkqxOmEgQ8T89bjSJTWb8bq5NpJXLJwBffc7IZeP9ctDSnVDYSY7rAtkn
	UuUZmTM2p8QPKe1cbCMTik2rCMVv1pD2yfb3er9BPigPBN4/VgFpqPSOi/MTMQTB
	dlb9p9/6HCdxtXiID1QmmrBkJmj3tlotkuEZqLn4RdHp4=
Received: from [127.0.1.1] (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDndNtTtf5p8oVGAQ--.38891S2;
	Sat, 09 May 2026 12:17:24 +0800 (CST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Jiaqi <shijiaqi_develop@163.com>
To: dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/6 v2] drm/rockchip: Fix vop2_create_crtcs() error path cleanup in vop2_bind()
Message-ID: <177830024278.246051.2541513211000360573@openclaw.local>
Date: Sat, 09 May 2026 12:17:22 +0800
In-Reply-To: <177830021804.246051.8309807801406217751@openclaw.local>
References: <177830021804.246051.8309807801406217751@openclaw.local>
X-CM-TRANSID: _____wDndNtTtf5p8oVGAQ--.38891S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr1kAF18ur1rCryxKry8Xwb_yoW8GF4kpw
	4kJrWUZr4DKr40qF1kAF1kuF4F9w4SyayfJFn2k343uFnrKr1qyr1Y9a4Fyr43XF4xCFyj
	vFZrJ3y5XF1j9r7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U_CzNUUUUU=
X-Originating-IP: [43.248.8.92]
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbCzhWc72n+tVWMoAAA3z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_211735_590756_CC9E910C 
X-CRM114-Status: GOOD (  11.37  )
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
IHJlbGVhc2VkIGluIHZvcDJfZGVzdHJveV9jcnRjcygpLgoKRml4IGJ5IGVuc3VyaW5nIHZvcDJf
Y3JlYXRlX2NydGNzKCkgZmFpbHVyZXMgZ28gdGhyb3VnaCB0aGUgZXJyX2NydGNzCmxhYmVsLCB3
aGljaCBjYWxscyB2b3AyX2Rlc3Ryb3lfY3J0Y3MoKSB0byBwcm9wZXJseSByZWxlYXNlIGFsbApy
ZXNvdXJjZXMgaW5jbHVkaW5nIG9mX25vZGUgcmVmZXJlbmNlcy4KCk5vdGU6IHRoZSBJUlEgcmVn
aXN0ZXJlZCB2aWEgZGV2bV9yZXF1ZXN0X2lycSgpIGVhcmxpZXIgaW4gdm9wMl9iaW5kKCkKaXMg
bWFuYWdlZCBieSBkZXZyZXMgYW5kIG11c3QgTk9UIGJlIG1hbnVhbGx5IGZyZWVkIGluIHRoZSBl
cnJvciBwYXRoLgpEZXZyZXMgd2lsbCBhdXRvbWF0aWNhbGx5IHJlbGVhc2UgaXQgd2hlbiB0aGUg
ZGV2aWNlIGlzIHVuYm91bmQgb3IKcmVsZWFzZWQgYnkgdGhlIGNvbXBvbmVudCBmcmFtZXdvcmsu
CgpTaWduZWQtb2ZmLWJ5OiBKaWFxaSA8c2hpamlhcWlfZGV2ZWxvcEAxNjMuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYwppbmRleCA4YWZhYmUyMTE4YTkuLjEyMzQ1
Njc4OTBhYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2Ry
bV92b3AyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3Ay
LmMKQEAgLTI3MzUsNyArMjczNSw3IEBAIHN0YXRpYyBpbnQgdm9wMl9iaW5kKHN0cnVjdCBkZXZp
Y2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQogCiAJcmV0ID0gdm9w
Ml9jcmVhdGVfY3J0Y3Modm9wMik7CiAJaWYgKHJldCkKLQkJcmV0dXJuIHJldDsKKwkJZ290byBl
cnJfY3J0Y3M7CiAKIAlyZXQgPSB2b3AyX2ZpbmRfcmdiX2VuY29kZXIodm9wMik7CiAJaWYgKHJl
dCA+PSAwKSB7Ci0tCjIuNDAuMAo=


