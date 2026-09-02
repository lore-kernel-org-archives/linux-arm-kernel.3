Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D7CC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vFqszwfsC0pQvqlUC15Sh1caHswlSgRw+4WeB2DlbwA=; b=gE5gE/IG/OVQ2vNmNpqF/VSg8e
	FKKkSOkf0YsWyYtnGfAhT+q1fFW9pEDDAthHpba85DQPo6Wsuhf6SgvFpTdUB6v1cwjexlcV7qOHW
	J1DzzJ9u43K3p/snXf28D2wKKaTGUhQJLsVfPwqOowqp6QRpddZAtHvys40g654EEVCi2K7RHEw4G
	xW5moj51nHskMTNHZvRV0mAJA2sh31PpjRUQufC6w8pig4B30ZTDZ5uxg/TbeaUBxBUYKJWepHhq6
	HWT3W2+nPAo2qv5WVFwqhzV11S24w7ZowTeBNBIQx9YZyF6unZ6fntce9uubwbyicTuuPEAVcTfbC
	0b2lKa8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qYd-0000000FgvF-2kbx;
	Wed, 02 Sep 2026 19:23:39 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qYa-0000000FguX-3usw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:23:38 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so12239695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377015; x=1788981815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vFqszwfsC0pQvqlUC15Sh1caHswlSgRw+4WeB2DlbwA=;
        b=UJeUoBvWDfbjzPaLdcQ9dU38sQ6NuoBei3zeJ3wNL26sJ4bA1aE4HtXImkZepdNz4n
         Q1SkCcYu22YTB/i8L2SlrjvzmSMt0W2ppe6WGfm4GUsyibPbqgZIZDix8wuPEGGoKem3
         YTzH9obPkaSlgXC/cszYW8m9SnUuir7j8fSVc0kQAnzI/N/vlKsoKo0CqRfdwyx7nNIS
         TGWC3Er4QkCovIIdms1vHa6zLWEtiak5A5mZqs46OhxMG5NRtV6vTTQFRELkp2EpFMPn
         euR0pvxQOgqojNspwY06jl42ya7rd2kcSfah9sRpJ5wcR12p8oZCngUItetdCaTqjY5w
         ycqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377015; x=1788981815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFqszwfsC0pQvqlUC15Sh1caHswlSgRw+4WeB2DlbwA=;
        b=eB34H+VDLCKhjRUINz0bgsSWOeS8sbjRnt1hBhQ8IUZ8NTkynkbyUmTeLFqArjNbnv
         5kMAL2Ah1HYJj/Mh3r4ENJbZlFwozB3XajFvEOcWWTkN1dw/FfAJP0ahaYcfMNO26/V2
         OAebhzAcxFIuqsXqXA/63QQk0sAutaNr2gBHxtq5r3y1KSHGTL03+GKY44oA3rSK7k0h
         mBJtBI4u6PxPYSc91JZv1r94SvXz5QUhPj15fGe/3kCGjrjeSXCyh5GEtL1+WcqM7OHS
         ZuUsNOhoHUlqT0mjP5JcwDRVV4OEgyrpIa/HtTwerIdxIpPGAwjtKQm4p0YD+LqJzsNB
         MXvg==
X-Forwarded-Encrypted: i=1; AKwUvBxVsJz3Jr7By47xPH6/5gbw8bBi4W6qAXtImEIj888IY8KnlFAK1jYfa9cusORW6ad5CXO0e6pPnseOkCgsYdHp@lists.infradead.org
X-Gm-Message-State: AFuF++ng6b/mmOQD16sa9STs97Sb3gLG16s57dEsapHb9T9Gka+2uRV9
	W2ItnXyFr4gWZ1R901BBGMW3iVpzmFfR21Ij0bQPWORuYCB8C7bdi9jp
X-Gm-Gg: AYBFou1zuOqzk3gsMcIO16gf72+JoHJB12I1ngFlANoTYRTYJCpS0Kz9stylJJK1cDC
	Hx66P+iK79Ne9MVvTWGrloOUIwg+AEUqKxN9JRMbszXTfmvDwPszunuMLUjQMGN/9Ha5MTjUSEm
	owcOyXjbHHTmS58H3AiPZrq6BGEQ2xngERkAT8L5HI8zY6++TG08iYeAheeh604FS1jjSFWMXgS
	PJVT59viOJECwZltl/n1hzogxsAhHRDEumDKwQmGRN4h8dlmh177LU+clJNOROtGVg6Xrt+WifM
	bDNkzh307QlpdeaRqiI6Y5MsZC1goaV0WWKLPvlqDnCIMHLTh/cIhHp/lBkFhm9D8VI/0gywb3L
	f3rqcDsJKJ7U0xr54Vg8/qtJPQQKBYjuFPz820Y/hm8o3h8m8EuL0BKaAYvSe6hZZIky8fV1BaQ
	GT8Kbpqrb1oSxBy/ve62W493fHEuD7MK8d96spvDnKhvwK6VnAlB1a1Nozcgzl9dzEv2xcC9VlN
	HbIOy4hmhE9PJW/aiicok2x0YMtaltafIzrpspiWRxQaYAoJnpIKGG7+Ct3nD35NTaWW2Eud6WI
	UoUZFH85rQK1Cfw5TOHL3G/qYyR0V1tvUJA1CrUeSXJDRu0+oc04Yjrrxv6Q8e7baw==
X-Received: by 2002:a05:600c:8b05:b0:499:b65d:124f with SMTP id 5b1f17b1804b1-49ce5823d9dmr158504505e9.11.1788377014385;
        Wed, 02 Sep 2026 12:23:34 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a1c2-c401-11b2-c123-0d12-6c0f.310.pool.telefonica.de. [2a02:3100:a1c2:c401:11b2:c123:d12:6c0f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm12861865e9.4.2026.09.02.12.23.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 02 Sep 2026 12:23:34 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] crypto: atmel-tdes - sync output bounce buffer before DMA
Date: Wed,  2 Sep 2026 21:23:23 +0200
Message-Id: <20260902192323.29337-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_122336_998496_E6941DB4 
X-CRM114-Status: GOOD (  14.13  )
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

The slow path maps its output bounce buffer once at probe time with
dma_map_single() and DMA_FROM_DEVICE, then reuses the mapping for every
request.  After the CPU copies a result from the buffer,
dma_sync_single_for_device() must hand the buffer back to the device before
the next DMA transfer.  The driver omits this call, so cache lines from the
previous result can remain valid while the device writes the next one.

This bug was masked by the completion paths calling
dma_sync_single_for_device() immediately before the CPU copied the output,
where dma_sync_single_for_cpu() was required.  For DMA_FROM_DEVICE on
ARM926, dma_sync_single_for_device() invokes arm926_dma_map_area(), which
invalidates the cache lines.  The misplaced call therefore discarded the
stale lines before every copy-out.

Commit c8a9a647532f ("crypto: atmel-tdes - fix DMA sync direction")
correctly changed the completion paths to call dma_sync_single_for_cpu().
On ARM926, that function invokes arm926_dma_unmap_area(), which is a no-op.
The missing pre-DMA dma_sync_single_for_device() was therefore exposed on
ARM926-based SAM9X60 and SAM9X7 SoCs.

With CONFIG_CRYPTO_SELFTESTS=y all four DES/TDES algorithms fail on
SAM9X75:

  alg: skcipher: atmel-ecb-tdes encryption test failed (wrong result) on
  test vector 2, cfg="unaligned buffer, offset=1"

Call dma_sync_single_for_device() for the output buffer before starting DMA
in both atmel_tdes_crypt_pdc() and atmel_tdes_crypt_dma().

Fixes: c8a9a647532f ("crypto: atmel-tdes - fix DMA sync direction")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes in v2:
- Reword the changelog and use full function names. No code changes.
  (Thorsten)

Link to v1:
  https://lore.kernel.org/r/20260829045316.92931-1-kmehltretter@gmail.com/

Tested on top of:

  crypto: atmel-tdes - zero-initialize device state
  https://lore.kernel.org/r/20260829035821.67220-1-kmehltretter@gmail.com/

Without that fix, on the tested SAM9X75 the DES/TDES self-tests hang on
their first requests before reaching this test vector, so the failure
fixed here is not observable on an otherwise unpatched tree.

The two patches are independent and apply in either order.

 drivers/crypto/atmel-tdes.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index 2756dab3f4c7..ed80423b4209 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -370,6 +370,8 @@ static int atmel_tdes_crypt_pdc(struct atmel_tdes_dev *dd,
 	if (!(dd->flags & TDES_FLAGS_FAST)) {
 		dma_sync_single_for_device(dd->dev, dma_addr_in, length,
 					   DMA_TO_DEVICE);
+		dma_sync_single_for_device(dd->dev, dma_addr_out, length,
+					   DMA_FROM_DEVICE);
 	}
 
 	len32 = DIV_ROUND_UP(length, sizeof(u32));
@@ -402,6 +404,8 @@ static int atmel_tdes_crypt_dma(struct atmel_tdes_dev *dd,
 	if (!(dd->flags & TDES_FLAGS_FAST)) {
 		dma_sync_single_for_device(dd->dev, dma_addr_in, length,
 					   DMA_TO_DEVICE);
+		dma_sync_single_for_device(dd->dev, dma_addr_out, length,
+					   DMA_FROM_DEVICE);
 	}
 
 	addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-- 
2.39.5 (Apple Git-154)

