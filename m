Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482D2606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=be8oYRpU;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=qDgLWYLT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YSXATQnuiR/2Cds4ydGp0NOJ5A0pcMSXUyguAbgaEs=; b=be8oYRpU5817U/5Xf+O10rLpIl
	3p4Yh9vrq6eNHbRHmDm42Voo7LYUOibtaWQrn3GwyJhH8mOwouyhn/vgG+xBFhSGH0GxcN76KUrRh
	wxdxgfNbR9GHg5aE+jTjS5MrIKqmUfFom7j4o2kV3JtsYN8aPBApY5i8uRnP3wzE8xp/c0bunUVXt
	SFkGM+wMBEykujSQKiy3clhZXMJwvLslCi4fvMXrA+hTvssfgowUhDxYPueGPy3AfIe6TiHmN8yto
	3RFr6pDNWkCtEyBWhvho5I3TUhGBz29BZ8zu17PslDxNx35w8cICK2tJpsAcwca3L39rBBFMrMo+p
	LNQV5ZWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzVj-00000008gJE-0EwD;
	Tue, 20 Oct 2026 02:23:31 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzVf-00000008gIg-2dat;
	Tue, 20 Oct 2026 02:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=3YSXATQnuiR/2Cds4ydGp0NOJ5A0pcMSXUyguAbgaEs=; b=q
	DgLWYLT8BeTxcAl5CN7IulgbTCBlFcWAWJaakMNbdy50Hyiq0LMlmmW2l14GqN1m
	7sBI8oq66ZFHWMP2a691JUS3NAJ7MgMevUD/depCGkM1fCIMDFxv8eLx+dlR0rAd
	rJxI4LD65J757iCpoq7N4Ury6ylx2RWO61wVOHlEDU=
Date: Tue, 20 Oct 2026 10:23:07 +0800 (CST)
From: "Jiale Yao" <yaojiale02@163.com>
To: "Felix Fietkau" <nbd@nbd.name>, "Lorenzo Bianconi" <lorenzo@kernel.org>,
	"Ryder Lee" <ryder.lee@mediatek.com>,
	"Shayne Chen" <shayne.chen@mediatek.com>,
	"Sean Wang" <sean.wang@mediatek.com>,
	"Matthias Brugger" <matthias.bgg@gmail.com>,
	"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
	"Peter Chiu" <chui-hao.chiu@mediatek.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: "Jiale Yao" <yaojiale02@163.com>
Subject: [PATCH 10/10] wifi: mt76: mt7915: validate RF register response
 length
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261019101506.1926943-1-yaojiale02@163.com>
References: <20261019101506.1926943-1-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAPidvUEj4SeeYOkcn08ShO49XMOyvfoi2YFTc98FtwD2/gAgcWZ6I2D88/+uBy+FqSWSfhhg4+5wV5Ny/D1I43rTvc52AeP9fY9F2Q==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <192ec1cd.2297.1a1571ea203.Coremail.yaojiale02@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: hygvCgDXV7GM0NZqxzklAA--.655W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQyn4WrW0IzXqgAA3a
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_192328_032801_CA024A34 
X-CRM114-Status: UNSURE (   6.22  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIFJGIHJlZ2lzdGVyIHF1ZXJ5IHJlYWRzIGEgMzItYml0IHZhbHVlIGFmdGVyIGFuIGVpZ2h0
LWJ5dGUgcmVzcG9uc2UKcHJlZml4IHdpdGhvdXQgY2hlY2tpbmcgdGhlIHNrYiBsZW5ndGguIEEg
dHJ1bmNhdGVkIGZpcm13YXJlIHJlc3BvbnNlCmNhbiBjYXVzZSBhbiBvdXQtb2YtYm91bmRzIHJl
YWQuCgpSZXF1aXJlIHRoZSBwcmVmaXggYW5kIHJlZ2lzdGVyIHZhbHVlIGJlZm9yZSBhY2Nlc3Np
bmcgdGhlIHJlc3BvbnNlLgoKRml4ZXM6IDBhMTczMjlhZTljMSAoIm10NzY6IG10NzkxNTogYWRk
IGRlYnVnZnMga25vYiBmb3IgUkYgcmVnaXN0ZXJzIHJlYWQvd3JpdGUiKQpTaWduZWQtb2ZmLWJ5
OiBKaWFsZSBZYW8gPHlhb2ppYWxlXzIwMjZAcXEuY29tPgotLS0KIGRyaXZlcnMvbmV0L3dpcmVs
ZXNzL21lZGlhdGVrL210NzYvbXQ3OTE1L21jdS5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0
ZWsvbXQ3Ni9tdDc5MTUvbWN1LmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2
L210NzkxNS9tY3UuYwppbmRleCA0YTExYTRhMGRiZGUuLjY1MGVlOTEzNGRkZiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MTUvbWN1LmMKKysrIGIv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MTUvbWN1LmMKQEAgLTQyNTYs
NiArNDI1NiwxMCBAQCBpbnQgbXQ3OTE1X21jdV9yZl9yZWd2YWwoc3RydWN0IG10NzkxNV9kZXYg
KmRldiwgdTMyIHJlZ2lkeCwgdTMyICp2YWwsIGJvb2wgc2V0KQogCQkJCQkmcmVxLCBzaXplb2Yo
cmVxKSwgdHJ1ZSwgJnNrYik7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKKwlpZiAoc2tiLT5s
ZW4gPCA4ICsgc2l6ZW9mKF9fbGUzMikpIHsKKwkJZGV2X2tmcmVlX3NrYihza2IpOworCQlyZXR1
cm4gLUVJTlZBTDsKKwl9CiAKIAkqdmFsID0gbGUzMl90b19jcHUoKihfX2xlMzIgKikoc2tiLT5k
YXRhICsgOCkpOwogCWRldl9rZnJlZV9za2Ioc2tiKTsKLS0gCjIuMzQuMQ==

