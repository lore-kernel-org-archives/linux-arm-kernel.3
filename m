Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF12CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 02:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Message-ID:Subject:Cc:To:From:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tchYBoWpbe7hHLMNFetVCDkmnuu3ZHUBLWljHyRvAYA=; b=sezq0yi1t99e8S9FAVvcmqU1ma
	NopdDP1gHAarSQOWgjm+nCVmOz1K6PofB9F4IuZa6z7KNrDuMgPcbNC/69VinVtWU8vbC6GpOia2Q
	acRuVnp9G6y/09Tf6Kl6hZRK+fRGdoqgJZ/If9+BYauGyBhV+cNsFt/uCpwvn/ixSE1V1/H2lOLdm
	Ja9h3cPvgrpHa0mysNuRbdMQd45Lpf6Z3Ri2S/rSjb5ehm9OznYuvXanmBb/MtNosJiJbJVr2Mbal
	xaGrucid71klV58asNPWkcs97r4WyfpkI9Jif+WDBVUmNf6KuPZGcFjnyqxK0L41OhGpnK0bEIdXA
	RVfDYEiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXLH-00000007zzL-11iW;
	Sat, 09 May 2026 02:22:59 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXLD-00000007zvj-3bsi;
	Sat, 09 May 2026 02:22:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Content-Type:MIME-Version:From:To:Subject:
	Message-ID:Date; bh=tchYBoWpbe7hHLMNFetVCDkmnuu3ZHUBLWljHyRvAYA=;
	b=VV7HMrJHmC0oLMpc+4hJMrK0ea4b2Uucy9176g/rCzRGzaoEnPx1+rLGGC9bfX
	vuEj6svlXcEnXw54b4m4igrsgBE/dmDuUlMkW4BGBOsxuiFwRf2cz1k/PjZ8NSeb
	ucIrWWrom83h4YI1xr/rx6Wzmm0UujOovBlphplPL8kRU=
Received: from [127.0.1.1] (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wCXcdNvmv5pFuUxAQ--.29820S2;
	Sat, 09 May 2026 10:22:41 +0800 (CST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Jiaqi <shijiaqi_develop@163.com>
To: dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] drm/rockchip: Check return value of cdn_dp_grf_write() in error path
Message-ID: <177829335837.202156.6022932115053585800@openclaw.local>
Date: Sat, 09 May 2026 10:22:38 +0800
In-Reply-To: <177829330856.202156.9366848570650672090@openclaw.local>
References: <177829330856.202156.9366848570650672090@openclaw.local>
X-CM-TRANSID: _____wCXcdNvmv5pFuUxAQ--.29820S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF1kCFyDKFWDCw1UJw1UZFb_yoW8Gry3pw
	4DJ34YvFZ29asrJayxKa48JrsYgayUZr4I9r97Cwn2v3W3Cr4ktr9IqF12qF4fXrs2yFyI
	yF4kJryrJrs0vr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbl19UUUUU=
X-Originating-IP: [43.248.8.92]
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbCzRHcMGn+mnHWcQAA3r
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_192256_336553_43149087 
X-CRM114-Status: GOOD (  12.37  )
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

SW4gY2RuX2RwX2VuYWJsZV9waHkoKSwgd2hlbiBhbiBlcnJvciBvY2N1cnMgYWZ0ZXIgdGhlIEdS
RiByZWdpc3RlciBoYXMKYmVlbiBzZXQgdG8gRFBUWF9IUERfU0VMLCB0aGUgY2xlYW51cCBwYXRo
IGF0IGVycl9waHkgY2FsbHMKY2RuX2RwX2dyZl93cml0ZSgpIHRvIHJlc3RvcmUgRFBUWF9IUERf
REVMLCBidXQgdGhlIHJldHVybiB2YWx1ZSBpcwppZ25vcmVkLgoKSWYgdGhpcyByZXN0b3JlIHdy
aXRlIGZhaWxzIChlLmcuLCBkdWUgdG8gYSBidXMgdGltZW91dCBvciBHUkYgcG93ZXIKbG9zcyks
IHRoZSBHUkYgcmVnaXN0ZXIgcmVtYWlucyBpbiB0aGUgRFBUWF9IUERfU0VMIHN0YXRlLiBUaGlz
IGxlYXZlcwp0aGUgRFAgUEhZIGNvbnRyb2wgaW4gYW4gaW5jb25zaXN0ZW50IHN0YXRlLCB3aGlj
aCBjYW4gY2F1c2Ugc3Vic2VxdWVudApEUCBsaW5rIGluaXRpYWxpemF0aW9uIHRvIGZhaWwgb3Ig
cHJvZHVjZSB1bmRlZmluZWQgYmVoYXZpb3IuCgpGaXggYnkgY2hlY2tpbmcgdGhlIHJldHVybiB2
YWx1ZSBvZiBjZG5fZHBfZ3JmX3dyaXRlKCkgaW4gdGhlIGVycm9yCnBhdGggYW5kIGxvZ2dpbmcg
YW4gZXJyb3IgaWYgaXQgZmFpbHMuCgpTaWduZWQtb2ZmLWJ5OiBKaWFxaSA8c2hpamlhcWlfZGV2
ZWxvcEAxNjMuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9jZG4tZHAtY29yZS5j
IHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvY2RuLWRwLWNvcmUuYyBi
L2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9jZG4tZHAtY29yZS5jCmluZGV4IDhhZmFiZTIxMThh
OS4uMTIzNDU2Nzg5MGFiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvY2Ru
LWRwLWNvcmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvY2RuLWRwLWNvcmUuYwpA
QCAtNDI1LDggKzQyNSw5IEBAIGVycl9wb3dlcl9vbjoKIAkJcG9ydC0+cGh5X2VuYWJsZWQgPSBm
YWxzZTsKCiBlcnJfcGh5OgotCWNkbl9kcF9ncmZfd3JpdGUoZHAsIEdSRl9TT0NfQ09OMjYsCi0J
CQkgRFBUWF9IUERfU0VMX01BU0sgfCBEUFRYX0hQRF9ERUwpOworCXJldCA9IGNkbl9kcF9ncmZf
d3JpdGUoZHAsIEdSRl9TT0NfQ09OMjYsCisJCQkgICAgICAgRFBUWF9IUERfU0VMX01BU0sgfCBE
UFRYX0hQRF9ERUwpOworCWlmIChyZXQpCisJCURSTV9ERVZfRVJST1IoZHAtPmRldiwgIkZhaWxl
ZCB0byByZXN0b3JlIEhQRF9ERUw6ICVkXG4iLCByZXQpOwogCXJldHVybiByZXQ7CiB9CgotLQoy
LjQwLjAK


