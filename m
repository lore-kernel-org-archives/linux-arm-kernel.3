Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F87C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 04:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6h7QlRJbPGmBtyZJll3w8PHkLoVkTYXG4+bbNBuj1qw=; b=vcOH+3CQCaEwKMWprfohIyVSIK
	2JpzZyxByBlCjR55MImEZbpJiQfZWh2LDfn4rhvvciJYjL3pU4xf0/TP3F9DCnGFZvVGpI8OCX9UU
	U/KgVkmhcsOguMwlGGvPDk7Gtr/kYhSwtkxLNPKIhH0LbnIVWhoLhJnEg3ngZ+f0epmhYcKyQRP8T
	qFJI2Cm0vKpcVlrxc6iAE+wrl1HSjdOsm1rVek2dpxqkQkOyhyX3TmDQVtfYhBjTs4WWdjM13JCPm
	wb6Cr9QY7wEP2vdW6+n4nvmBOr0bthGmK4I3rf7c3n9AXLMfLGhlqVDy8OInD67OK5mt74B4pcS0Z
	24UDhHLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0B5Y-00000006j8F-0cwm;
	Sat, 29 Aug 2026 04:54:44 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0B5V-00000006j7a-0bfW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 04:54:42 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-482e067e908so1122817f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 21:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787979278; x=1788584078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6h7QlRJbPGmBtyZJll3w8PHkLoVkTYXG4+bbNBuj1qw=;
        b=MM1idBdgRvQxwSVOaPjCamVHoOYbWlUpvu4gsDelkMhLrXXqF32VoO+To1Q4bLyGXn
         LylUXP6XF4ebRubGQ22UAS+MHENBk7rPXbklORmraicHdeISevO+zO2jDosUzdkNvnJ8
         f/yASydgstwFfAFNjlc2XBQDowN9JfPL7fBoUmmIEuORTZonbcS9tuS+0d4J3TYQgvaj
         BuCiq9iHLCxxmCLrVOWmdJZYLCt8AwXcM514Dh/yAiGF4bDsf3pyhDeFL20pTMcsCzWd
         kKRUyjGumcef5avMAOJq3Ws5Mk+z7LtWDWkoJENhfEBvQsTjeEGjHZtg14RSLgE7rNiN
         gSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787979278; x=1788584078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6h7QlRJbPGmBtyZJll3w8PHkLoVkTYXG4+bbNBuj1qw=;
        b=PGoOxP5yQdtU2hdL0tkh9kp5slacStQZ014KozO0cZ61JXoQFJzG7A+RKq68zZx+sf
         wA9dd38rj8ZXrEomiMvTeYfHMDKZJQs38co1oHa8Gl9SX7NAbJFeWNSthxNzNQs8197S
         tiDhsTkktBo2hmUBs0edwnVbJvzTARFQqNpN4xel6gz4rzICZgl6dHmMga8BcsbxNgNz
         XcpTg0FGaqFWRCZWoUIlx+r58SSRoaDZ5tbkOIlcp0/FHTzHShLNXa5/JMAmsW6T7ULD
         zzdr8uaBVkdyQuwYE0PzUFBA6ivnF7D7jWlVZhsTMGEsIiPnnVAizd0cq2TgTk97hNww
         6S3A==
X-Forwarded-Encrypted: i=1; AKwUvByu0CI99StcZjyCqMexsvOIbtmvVYQNYgN+jquZyMvGfFTgaXZKLnl61JXbvg4DJK5Ob3TD3wEWjwX9fwnRWda1@lists.infradead.org
X-Gm-Message-State: AFuF++mir1eOpJ45MKgXLjDXukM97PtN+he1BnCkckHEWqkAbrtW8KyU
	FzvI6IkQn6qNTGVEVqzFlh5zbtrzyddjtvm1/cIoN0c67cgDRszUB60+
X-Gm-Gg: AYBFou14DCli8MVmnZw9FEFT7KJp8OkRUdDYPMtHFfJOO8iAqAqvdNFmv9pJH++YcFg
	tvOnAdcurwuf8gp0b8mkOZO7TIut/T6MC7wP6zYg5fNBXC1ZcciLCdJ7XLWATxK6AN+tx3y5IkW
	JRM4Tcta+LvcznSm3DObpzFF1H4uwJwmVFtPBwCv0J3x1W6Co1JjZo+4SD0djx2wTFXzeI+VLwt
	wPWSEWrRGWKXtB27ZLG5gK4P7qdWU6xWBcR6gpSGW4w/8Ek73HqYSjaYsODKBFsrEEWY9Ud6/7S
	5S11ZcRPZLfsYAECAACm9/2ZslbbtOdja2Nht+5rGGu1msCOLDMGF2sRtjPbeJRV5KxMhQt7GKN
	Kcvm4L0Xo3MCZ2JQbNz8Wx66MClhm5olZiocMzbnjaQaFHsXiR6xTQBHglBz96ISJuugxID2fdU
	/nA33WcJQffWFsgZ3H9UemllfyGd2wcdL50FGtaM2Tksgw+2+bDkCPWR3hsgVl6F13jeXsz8Q3o
	VVjbJPTLaGOci+FEqygWhjQN97AL0KHKQDFr1tSOe5T1sp7dOXcjSp7PfuP34cyZ+9pBr7U9Wt0
	69Itf1xq5y07qXAIDKc0
X-Received: by 2002:a05:6000:4a0f:b0:482:e451:680c with SMTP id ffacd0b85a97d-482f79a7553mr19353727f8f.8.1787979278069;
        Fri, 28 Aug 2026 21:54:38 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-015-136.77.7.pool.telefonica.de. [77.7.15.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac4e24sm8111368f8f.9.2026.08.28.21.54.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 28 Aug 2026 21:54:37 -0700 (PDT)
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
Subject: [PATCH] crypto: atmel-tdes - sync output bounce buffer before DMA
Date: Sat, 29 Aug 2026 06:53:16 +0200
Message-Id: <20260829045316.92931-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_215441_212310_034C7B0C 
X-CRM114-Status: GOOD (  13.92  )
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

The slow path DMAs into a bounce buffer mapped once at probe with
DMA_FROM_DEVICE.  On reuse, nothing invalidates the CPU cache for it
before the DMA writes, so the copy-out can read stale data.

This was hidden by the copy-out calling dma_sync_single_for_device()
instead of dma_sync_single_for_cpu(): on ARM the misplaced for_device call
invalidates the cache, which is exactly what the missing pre-DMA sync
should have done.  Commit c8a9a647532f ("crypto: atmel-tdes - fix DMA sync
direction") corrected that call.  On ARM926 dma_unmap_area is a no-op, so
for_cpu does not invalidate and the SAM9X60 and SAM9X7 parts lost their
only invalidate.

With CONFIG_CRYPTO_SELFTESTS=y all four DES/TDES algorithms now fail on
SAM9X75:

  alg: skcipher: atmel-ecb-tdes encryption test failed (wrong result) on
  test vector 2, cfg="unaligned buffer, offset=1"

Sync the output buffer for the device before starting the DMA, in both
the PDC and DMA engine paths.

Fixes: c8a9a647532f ("crypto: atmel-tdes - fix DMA sync direction")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
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


