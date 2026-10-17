Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFF6CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 19:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iygLDIgOD8rajawodvAmwVYRk5k/3RMou3i6AByPjMc=; b=yr6ChhilLKi/weHFbKuseukvla
	8fjTQvXS5AUxmhrEpZwXxykxWItknNF02aOpxRuy9LifGzQp9gUIx16pJAcUIxM0IawnTzYVJQRba
	LFwg6oF5Ra8NAOCw8vLbieX1+oRM4rcC2m1KvllBFgKTVtg2zex+LlxUolNB5ra0tKvyU7CdupxnX
	4Un6NvDfURhsu37uNalpX6pLNaAleNsCL6s+AN5I8TWERul9nxtbxoRxX6izvO4ffZoU9jRvoyBmH
	+W0zrCdPBzACKuvGG5ke7a9ZimLyZjME60wBi4mJb4QBh5QwmsuZNnGF1Vh/Qg+Ufyhf7yih1/MYh
	Qr67J1ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMW-000000059Cs-34ek;
	Sat, 17 Oct 2026 19:46:36 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMK-000000058xC-3BIn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 19:46:26 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-8479f46ecd8so67496a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 12:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266384; x=1792871184; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iygLDIgOD8rajawodvAmwVYRk5k/3RMou3i6AByPjMc=;
        b=LyGST5xEH3LEnZE6ZuiizASwiL9cbM12I5mF/khnduO5flbJeW16p4KGRalcOIhQGG
         s+q9RJJRvqxeNca2Vk4WYh/Lo9t1UWKws8L3oNo6VTru4zxGNso6BX0OW7C6wZbQE1WS
         LFU3qiP/Ci9cmnkSeluesD/0frDMjQgMqo3Xf01zqo5kxRIQN9hSUaB1DwVx0Tkg+1Tt
         MzA7kqtDN61vEVzH6iJCxAgFAfLUid0JK+OO59hUMsvZ9ooxyhoOyDRMvnMZP+cbn2MT
         ugk1/RAAPqD1kMryRdISM4rTaagU6scmXhXpvJli/yDEGbTOeK1iKL5cr24pcHAepix6
         vDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266384; x=1792871184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iygLDIgOD8rajawodvAmwVYRk5k/3RMou3i6AByPjMc=;
        b=dxcRqaXhk9WRDUD/MvnpPdxx6H9KPmgu/IOisJoJLTw+tgoYao267y3fFY/0O9VuYR
         z9CEEbclFuFOsRT1ikpOoixWK2pifloRfoSdvamG4ZAyr7NlIRC8CI4Ed29GhxuVLyhr
         u5iXuJSd9ijxqR3d8bf9UPHopHjs06HxKNpKMv2Ffv2CbCd7Av295pV5qzJYGVqYMB+J
         76QnFgGuxBdXVBw7I4UeT5wtg8bc9M6dVTQI4MEnWtfFeu77n//drIRdBqJdrFIemy2a
         jY9+w5Vu8TadR3SIZlTFjzYJD5e0QqvpT4xxpeSntHZDG65C9/phbPAf06BzpnETrEM/
         1OGw==
X-Forwarded-Encrypted: i=1; AKwUvBy9WPOo71M7TP3zgqcryG+T2pCBYsQH/MsmH9Efk1kadvgPsodIB5Az5pFKWwO8BsAyesTYTb5eIa9/EehhCijh@lists.infradead.org
X-Gm-Message-State: AFq9FYIW7tCfnLCruzkkgg0iI7ohrrlot8nTVm0YP8iURQPJubxonJYQ
	ML7EZIsNvEoCIlYLl9vvi/dQjk2xuwZt8jkvYPE2g41ztoKxRnOr7ZDZ
X-Gm-Gg: AYBFou29OdrCwifkTSFmWos756QvILrbhoi7rtikPPDRz8URZ1r554s2aaZWMWYHE1K
	2rt2QYVORjjI08bY9dIytNcGpICJzbje3q8DzbEagyi2gNXsSXTNPj6x39dDgOYOOfqKzsLSkx6
	Qs4Q61zKdA+8g9ZLsdKGJIbKb7GLK8f48TVkSLzk5LTw7kjfEGyQumUJagh/CokD9ZxHRyQQsdE
	V0TRXgdsquiBUq6S++NqJGsosUya8zRDWobvBpw/3AVL6f+1JijP3bmnAtxYdiNLEutVn7Fx1CA
	+u1e1iFAObXNM0EjbQ3JqaS11uakFZfcan0TiAx4Wsa6O7wnzDq5PfS6EIa3t706lmYSlKPKTv6
	YsRe0A9oAKBrq1bmMM2hlC4c3eFw8bogAEIspNX50JwWDYOBw1+gS4mfxUhUlenrwTv4eIgBGtr
	nMo2evjuDKhzMcomjTWONkWYd3dHNTUjgL3A0hpspBc9fzWvJdrJH33IfvXRibfi+4j+UbOrQo7
	3EcmT5/oN08l8Yr9nDpeRYJRN8M42GBjWB7SdfYEBaifQ9/M0xrUoOxjWrC0qnpi0NcvyeRJ7Ix
	O2oCc4Lw0TEHtwZxzhwgeb3oeGOtJLG7diLujrGQvZ8UThMVBVubcirjYTiRdWgMJQV/M6rMG55
	IGuBrl9KhHJdH6JTiybyPmFxjdqGsW/o=
X-Received: by 2002:a05:6808:ec2:b0:503:aaf8:ef12 with SMTP id 5614622812f47-53ccfbb22ecmr2554952b6e.34.1792266383632;
        Sat, 17 Oct 2026 12:46:23 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:02 -0600
Subject: [PATCH v9 07/18] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-7-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_124624_887395_BA2FDA1B 
X-CRM114-Status: GOOD (  14.86  )
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

ECC exception mode recognizes physical all-zero and all-ones data
blocks. For each hardware ECC step, a pattern-found bit says whether
this happened and the corresponding pattern-ID bit distinguishes zero
from 0xff. The correction helper checks the current step's pattern-found
bit but always reads pattern-ID bit zero.

PIO processes one step at a time in hardware slot zero, so it is
unaffected. DMA processes several steps at once. For example, if step
one is all 0xff but pattern-ID bit zero is clear, the helper treats step
one as all zero. On scrambled DMA reads it fills that step's main data
with zeros and reports success. Requested OOB is also filled using the
wrong pattern. Conversely, a zero step can be classified as erased when
bit zero is set.

Test BIT(step) in the pattern-ID register, matching the error and
pattern-found bits already selected for that hardware step.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 1db6ee18594a..22cc8998d49c 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1120,7 +1120,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0


