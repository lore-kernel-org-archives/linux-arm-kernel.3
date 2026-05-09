Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E96CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 04:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Message-ID:Subject:Cc:To:From:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U177SE7mHbIC5vyiwjSTfV0OGUj1H2tKhJP6zbKEtGs=; b=mEE/bSehJYJm9c8LRmcAEIx2hp
	A4qSixFICni4Vn46YM9DN8M3g2V1NTunUX2jySFoFtbKuXlqFtZELhp12KhT1+XpFX6P+e7AC5aBB
	ik+XrcgWxBaMifcys+ObdEa5V4weZeoT+/9PLxZAjHHTJmqN96z3Y3L38M0sCDN1keslYFE0esVqr
	Zuz6pHBEzZ0QAx/hFH9QEIiPbVL9h6sFufX4XaDUtZMU0GG1SHTC/N0i/1Jw2w0ypdMUKVxE2dv/8
	sXtZ38XxIPPaIxGloF4tsgOKG9epLC2vWGa357ExKAuOGB3gi0Qhs5tuADWe2uCg1+KNdcERdWDzA
	w1VOvM4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLZ8K-00000008BBj-3jo1;
	Sat, 09 May 2026 04:17:44 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLZ8I-00000008B7x-0RrS;
	Sat, 09 May 2026 04:17:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Content-Type:MIME-Version:From:To:Subject:
	Message-ID:Date; bh=U177SE7mHbIC5vyiwjSTfV0OGUj1H2tKhJP6zbKEtGs=;
	b=WwjsVgjS1tGvkSd0ReCVLEBulB9vw7xqnyIibOF1YA2jOUvqpCsYI2Takz2K3m
	48GSozIioFsjl89r760ROoZ7f3aTCVM7n7b//GjgrRVC/TvVcHkibpUDqRoF2jQh
	y0lbC1gKAzc74oM1fNMQ0qO41Gi2Mjdw2CBY5yIZ/7Xvw=
Received: from [127.0.1.1] (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wBnHxdatf5p+85LAQ--.30253S2;
	Sat, 09 May 2026 12:17:32 +0800 (CST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Jiaqi <shijiaqi_develop@163.com>
To: dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] drm/rockchip: Fix vmap address caching in rockchip_gem_prime_vmap()
Message-ID: <177830025004.246051.109481289321643780@openclaw.local>
Date: Sat, 09 May 2026 12:17:30 +0800
In-Reply-To: <177830021804.246051.8309807801406217751@openclaw.local>
References: <177830021804.246051.8309807801406217751@openclaw.local>
X-CM-TRANSID: _____wBnHxdatf5p+85LAQ--.30253S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw1Dtr18uw15CrW5Gw1UAwb_yoW8GF1xpa
	9xu39IyrW8GrWjqrsrXFnrA3ZxK3Wv9ayxGryfKanI93WxWF9Ikr12kFyDJFZrJrsrCFWa
	qr4kA345ZrsFvr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U_DGrUUUUU=
X-Originating-IP: [43.248.8.92]
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbC8Bye8Wn+tVzNLwAA3f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_211742_964367_12E385B7 
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

SW4gcm9ja2NoaXBfZ2VtX3ByaW1lX3ZtYXAoKSwgd2hlbiBya19vYmotPmt2YWRkciBpcyBOVUxM
LCBhIG5ldwp2bWFwKCkgaXMgcGVyZm9ybWVkIGJ1dCB0aGUgcmVzdWx0aW5nIHZpcnR1YWwgYWRk
cmVzcyBpcyBvbmx5IHN0b3JlZCBpbgp0aGUgbG9jYWwgdmFyaWFibGUgJ3ZhZGRyJywgbm90IHNh
dmVkIHRvIHJrX29iai0+a3ZhZGRyLgoKVGhpcyBjYXVzZXMgdGhyZWUgcHJvYmxlbXM6CjEuIEV2
ZXJ5IHN1YnNlcXVlbnQgcHJpbWVfdm1hcCBjYWxsIHJlLW1hcHMgdGhlIHNhbWUgcGFnZXMsIHdh
c3RpbmcKICAga2VybmVsIHZpcnR1YWwgYWRkcmVzcyBzcGFjZSBhbmQgVExCIHJlc291cmNlcy4K
Mi4gSWYgdGhlIGdlbSBvYmplY3QgaXMgZnJlZWQgYmVmb3JlIHByaW1lX3Z1bm1hcCBpcyBjYWxs
ZWQgKGUuZy4sIGluCiAgIGFuIGVycm9yIHBhdGgpLCByb2NrY2hpcF9nZW1fZnJlZV9pb21tdSgp
IGNhbGxzIHZ1bm1hcChya19vYmotPmt2YWRkcikKICAgd2hpY2ggaXMgTlVMTCwgc28gdGhlIHBy
aW1lX3ZtYXAtY3JlYXRlZCBtYXBwaW5nIGlzIG5ldmVyIGZyZWVkLgozLiBNdWx0aXBsZSBjb25j
dXJyZW50IG1hcHBpbmdzIG9mIHRoZSBzYW1lIG9iamVjdCBjYW5ub3QgYmUgdHJhY2tlZC4KCkZp
eCBieSBzYXZpbmcgdGhlIG5ld2x5IHZtYXAoKSdkIGFkZHJlc3MgdG8gcmtfb2JqLT5rdmFkZHIg
c28gaXQgY2FuCmJlIHJldXNlZCBhbmQgcHJvcGVybHkgY2xlYW5lZCB1cC4KClNpZ25lZC1vZmYt
Ynk6IEppYXFpIDxzaGlqaWFxaV9kZXZlbG9wQDE2My5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3JvY2tjaGlwL3JvY2tjaGlwX2RybV9nZW0uYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlw
X2RybV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZ2VtLmMK
aW5kZXggOGFmYWJlMjExOGE5Li4xMjM0NTY3ODkwYWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Jv
Y2tjaGlwL3JvY2tjaGlwX2RybV9nZW0uYwpAQCAtNTIwLDYgKzUyMCw3IEBAIGludCByb2NrY2hp
cF9nZW1fcHJpbWVfdm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IGlvc3lz
X21hcCAqbWFwKQogCQlpZiAoIXZhZGRyKQogCQkJcmV0dXJuIC1FTk9NRU07CiAJCWlvc3lzX21h
cF9zZXRfdmFkZHIobWFwLCB2YWRkcik7CisJCXJrX29iai0+a3ZhZGRyID0gdmFkZHI7CiAJCXJl
dHVybiAwOwogCX0KCi0tCjIuNDAuMAo=


