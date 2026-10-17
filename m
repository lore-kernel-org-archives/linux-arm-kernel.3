Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51B9CCA463
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 07:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7Jp/43JCGcioHrezXAQzyss1rOMOoJtpTpqn9ONHl0=; b=HUHXiOAkTfDSgo8K1YEDpBO4z9
	gudoyYwhdIdLT+NUarTTX7nIDDT5Hyjz7MPN7b10djAfFcDTY4kshpoenu/YND/4zzEfdDcI+79Q0
	40A46jwWtS/pBgzz9kk4944KXmDBDfIv7klYiK+Bopeq6Jx29fHbUVz7MCTizDtp1D227HET6+7pV
	SvWqBmhi3B368qg3d660UmyLGANwZblB4MPZb3cr9J0MSiRIU0S/VRkvpXFA4BWKlXh7ppEfUUiiL
	Swf2kqWxwxYqHi+iGN9vFNuh7Oet6ncYSpbXv7BXzBiwbv++0cj+uP6nu07ASp8JUd0Qkbo03yu7D
	+xm8UjeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHysh-00000004WOF-2LY8;
	Sat, 17 Oct 2026 07:31:03 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHyse-00000004WNT-2zjP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 07:31:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=s7Jp/43JCGcioHrezXAQzyss1rOMOoJtpTpqn9ONHl0=; b=l
	KkmUHs8dycvmPGR8TvXE6m8i8nAUwGViOw0a5F4bLhhnXa8/kAPHbuCu07YF5t16
	Tp1HtM1mQ/oHYNOWTxGQfmrtCoNP+CXfLbADDGy6jppXGRnCt7kvGtAHSr7su966
	XtuwSDDQDpvTJJUlKreJIb3GkUZ+jlh5Llt9LJPgOM=
Date: Sat, 17 Oct 2026 15:30:44 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
	"Marc Zyngier" <maz@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
	"Radu Rendec" <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH 4/6] irqchip/gic-v5-its: validate MADT translate frames
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261016141357.2793046-5-yaojiale02@163.com>
References: <20261016141357.2793046-1-yaojiale02@163.com>
 <20261016141357.2793046-5-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAP6ZvUov4iefZukdnEkQgO0/WsS1vfQu2Y5Wc+wEgCbN4z0YdHxaDHHN8e6DOSarnDiOagNHzNRcb4JHLLJCVivUBoruVTrV2HBgPQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <1c8e50a6.184c.1a148c52fb0.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZygvCgD3T3ckJNNqXPtaAA--.855W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQSh22rTJCQNhwAA3A
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_003101_388036_E3F5CDEA 
X-CRM114-Status: UNSURE (   5.58  )
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

QXQgMjAyNi0xMC0xNiAyMjoxMzo1NSwgIkppYWxlIFlhbyIgPHlhb2ppYWxlMDJAMTYzLmNvbT4g
d3JvdGU6Cj5UaGUgR0lDdjUgSVRTIHRyYW5zbGF0ZS1mcmFtZSBjYWxsYmFjayBhY2Nlc3NlcyBJ
RHMgYW5kIHRoZSBiYXNlIGFkZHJlc3MKPndpdGhvdXQgY2hlY2tpbmcgdGhhdCB0aGUgTUFEVCBl
bnRyeSBjb250YWlucyB0aGUgY29tcGxldGUgZml4ZWQtc2l6ZQo+cmVjb3JkLiBBIHRydW5jYXRl
ZCBmaXJtd2FyZSBlbnRyeSBjYW4gdGhlcmVmb3JlIGNhdXNlIG91dC1vZi1ib3VuZHMKPnJlYWRz
Lgo+Cj5SZWplY3QgaW5jb21wbGV0ZSB0cmFuc2xhdGUtZnJhbWUgZW50cmllcyBiZWZvcmUgdXNp
bmcgdGhlaXIgZmllbGRzLgo+CgpGaXhlczogYTk3ZWZhNWJhNTk0ICgiaXJxY2hpcC9naWMtdjU6
IEFkZCBBQ1BJIElUUyBwcm9iaW5nIikKCj5TaWduZWQtb2ZmLWJ5OiBKaWFsZSBZYW8gPHlhb2pp
YWxlMDJAMTYzLmNvbT4KPi0tLQo+IGRyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXY1LWl0cy5jIHwg
MyArKysKPiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPmRpZmYgLS1naXQgYS9k
cml2ZXJzL2lycWNoaXAvaXJxLWdpYy12NS1pdHMuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtZ2lj
LXY1LWl0cy5jCj5pbmRleCAyOGUzOWIwNjVkZTAuLmRhZDNiOTViYTE1MCAxMDA2NDQKPi0tLSBh
L2RyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXY1LWl0cy5jCj4rKysgYi9kcml2ZXJzL2lycWNoaXAv
aXJxLWdpYy12NS1pdHMuYwo+QEAgLTEyMzMsNiArMTIzMyw5IEBAIHN0YXRpYyBpbnQgX19pbml0
IGdpY19hY3BpX3BhcnNlX21hZHRfaXRzX3RyYW5zbGF0ZSh1bmlvbiBhY3BpX3N1YnRhYmxlX2hl
YWRlcnMKPiAJaW50IGVycjsKPiAKPiAJaXRzX2ZyYW1lID0gKHN0cnVjdCBhY3BpX21hZHRfZ2lj
djVfdHJhbnNsYXRlX2ZyYW1lICopaGVhZGVyOwo+KwlpZiAoQkFEX01BRFRfRU5UUlkoaXRzX2Zy
YW1lLCBlbmQpKQo+KwkJcmV0dXJuIC1FSU5WQUw7Cj4rCj4gCWlmIChpdHNfZnJhbWUtPmxpbmtl
ZF90cmFuc2xhdG9yX2lkICE9IGN1cnJlbnRfaXRzX2VudHJ5LT50cmFuc2xhdG9yX2lkKQo+IAkJ
cmV0dXJuIDA7Cj4gCj4tLSAKPjIuMzQuMQo=

