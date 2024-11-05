Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDF6D31767
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 16:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8aGK7Z8v6XDcP9ImnsPr0SruZINT8w1jjDwyvhJdeK4=; b=GxAEUpGR79hhZxGVWvYjb2bTPy
	MvrYysTmur5t/1wTX2IhrWLOl8faXO3aQSCbt18tLOomAyr+NIFtngeYjf0x6njE1DbAP68gtLuEu
	ie8z7uXGABCf8P+4lEAZeoGBoPQz1bpwSHkE1gZOXIECDdZ9cOPLUoBD3P4fVgKQAmyuGuDGP5pHa
	kBnA+dUFqMLN5lAshroTHz4DnkE3dK7RYmuP0jMwsnzXPlSU8NjROjAbdQ34lgBjjmwXpTHfnCMwv
	X1NwRCVDmwKCd1K4cu5rgzl/cau9UxX0RuvMNeFCkuOoGpYn39RUcE6GcBjmcU7OawM7qriaAg3PD
	1Gc6y7Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Mgh-0000000069Q-3V1h;
	Tue, 05 Nov 2024 16:45:51 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MC1-000000000Ic-1ZBU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 16:14:10 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6ea90b6ee2fso39235347b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 08:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730823247; x=1731428047; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8aGK7Z8v6XDcP9ImnsPr0SruZINT8w1jjDwyvhJdeK4=;
        b=iOk3KZX7cfuw9cznnB+6m6HGKE1VHzFpmUK1gWIfEnzAopOB6eXWusZAtBU2UmMppO
         17Z32+pYbtvrgqLLDVTUEco10/vldaqf0uXNgOSRU7NBDTmUwvtHVePtCNNUJi11WoaX
         H5xu+kb9EOxgOuCiXhrODwZ3F/MjcLchP0EOkoMoV9pi8jvrBoiYuZsmFV4D+yvAoW1v
         v6iMcijOr1BwO0pN4/EEK3rrBA63eseQdyJICeFPhjhpFg0kOqUbwY6BlM5GiHy8rgNB
         982gOpdIJZfpFQYMgdKkSqZCkMPUm7cflzmx1Hm+0hYBilH/U29uQR2bXnmnfu3nIwfm
         lweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730823247; x=1731428047;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8aGK7Z8v6XDcP9ImnsPr0SruZINT8w1jjDwyvhJdeK4=;
        b=nDLMca3nf+QXF6hRlzhOMxWdlvl2MYbv4xZboE0K0SfToZAk/n5GwR72VRc+WuRdk6
         tPEi6WHdDEGihkqlaVpFsqkKUj80IRRSqakQGJv0ZApy3ZC52NpvvDyX1QWh/+zP5c7P
         GYyMFd1D+6gcMS9UGbFiz1zpwxIeigqnRc1KyTEaYsDNC1CvjjdKO9e5v+I/4uQUqO0P
         wp0e5otMqxw20vMWa78IuraOymO7OTWF/+USHCw5vGWZkfaoQNwkFaIsAYrJ/nWN2tWU
         muuKjSp2sh8GyjmaWdtNZXC8H4oAeE85QWbMKuC+jlOPSPApTgs9emVu8Qv6tbnOlDDl
         wlxA==
X-Gm-Message-State: AOJu0Ywz7HyvTqGiyHc5uGNeqbBLqxofc9/zEJ9aqErSRmG3ILVYUA9q
	/9Qy4siQj4WgbJkk2Z0zpwHeusGvbvWUH1e450so/67k9dn42wPncot1/pp+r8MpY3AnpQ==
X-Google-Smtp-Source: AGHT+IFgQPhrMAKZuJf7yR51BZB3JEW7r+3P9Pk41hz0OBgjmmPUoYv34HFNtd350qIvCf5NfzctdqMY
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a25:83c3:0:b0:e2b:cd96:67a6 with SMTP id
 3f1490d57ef6-e30e5a904d0mr12569276.5.1730823246978; Tue, 05 Nov 2024 08:14:06
 -0800 (PST)
Date: Tue,  5 Nov 2024 17:09:00 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821; i=ardb@kernel.org;
 h=from:subject; bh=Pzrr73yq0Dd7jZRnQEQgJMh0/mIP5h5eFWKeB+7qJPw=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV3LWWbHtruB0yT9DUXnnppdv+ZosNX9TR/+aWc38yfla
 Ij6fgzpKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABP5PYPhn9pFraXNV9vXsG15
 ++n2+qLIHVbsjKXbM85aJTqcij3l5MvwP2BtgdjiZd1SE85+09FMVfBhW1VhN4+3W27X+cuMnDE X+QA=
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Message-ID: <20241105160859.1459261-8-ardb+git@google.com>
Subject: [PATCH v2 0/6] Clean up and improve ARM/arm64 CRC-T10DIF code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, ebiggers@kernel.org, 
	herbert@gondor.apana.org.au, keescook@chromium.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_081409_443596_6B7262B2 
X-CRM114-Status: GOOD (  11.31  )
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

From: Ard Biesheuvel <ardb@kernel.org>

I realized that the generic sequence implementing 64x64 polynomial
multiply using 8x8 PMULL instructions, which is used in the CRC-T10DIF
code to implement a fallback version for cores that lack the 64x64 PMULL
instruction, is not very efficient.

The folding coefficients that are used when processing the bulk of the
data are only 16 bits wide, and so 3/4 of the partial results of all those
8x8->16 bit multiplications do not contribute anything to the end result.

This means we can use a much faster implementation, producing a speedup
of 3.3x on Cortex-A72 without Crypto Extensions (Raspberry Pi 4).

The same logic can be ported to 32-bit ARM too, where it produces a
speedup of 6.6x compared with the generic C implementation on the same
platform.

Changes since v1:
- fix bug introduced in refactoring
- add asm comments to explain the fallback algorithm
- type 'u8 *out' parameter as 'u8 out[16]'
- avoid asm code for 16 byte inputs (a higher threshold might be more
  appropriate but 16 is nonsensical given that the folding routine
  returns a 16 byte output)

Ard Biesheuvel (6):
  crypto: arm64/crct10dif - Remove obsolete chunking logic
  crypto: arm64/crct10dif - Use faster 16x64 bit polynomial multiply
  crypto: arm64/crct10dif - Remove remaining 64x64 PMULL fallback code
  crypto: arm/crct10dif - Use existing mov_l macro instead of __adrl
  crypto: arm/crct10dif - Macroify PMULL asm code
  crypto: arm/crct10dif - Implement plain NEON variant

 arch/arm/crypto/crct10dif-ce-core.S   | 249 ++++++++++-----
 arch/arm/crypto/crct10dif-ce-glue.c   |  55 +++-
 arch/arm64/crypto/crct10dif-ce-core.S | 335 +++++++++-----------
 arch/arm64/crypto/crct10dif-ce-glue.c |  48 ++-
 4 files changed, 376 insertions(+), 311 deletions(-)

-- 
2.47.0.199.ga7371fff76-goog


