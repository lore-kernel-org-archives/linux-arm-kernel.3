Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BB2D3E2BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 19:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EHRpW98vkhSvMXXUJxWa0SLmg5kabWdlwzG0QsKPAGI=; b=xMyXzqZuhcPnaCAfACdh11sB0e
	gFsAI19XM2WPsoNeCfQelK1ddEtks/Q1ORUqx34+rBNZLkWLvpaPQE229FqlZ6KWclXyApzbNF6mo
	optW/ZTz6/Y794A98oZVHm17AbQCc90TTMFdJGRuCDG/vmOCjwkf0MR1d07RO+yD0kBfdQybwC7HW
	ZZFQ/G3UtiUFUq2n0X0K/Nqu2Ukx5yXIi3msTAQodt3uy4V4dstova0obbLKe6W6wVaJboV9ZGkdb
	nfplJorF2Pr0bZkLlrRSN8RObhgYwNcJqflT7fkEVf1fXWnvf5SZiQLrC8k8I1oU5xadQIUwFqJa5
	bF9oMzBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5V6d-0000000BxH9-1D6a;
	Mon, 28 Oct 2024 19:08:47 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5V0a-0000000BvxT-2CGP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 19:02:33 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e29142c79d6so5995307276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 12:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730142149; x=1730746949; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EHRpW98vkhSvMXXUJxWa0SLmg5kabWdlwzG0QsKPAGI=;
        b=Z1JGNcoaycccomfmqp4s5xgelNElGkA+O7rsW696Lh4O7zfAJ6Phf4MPYMcLIegBSg
         DiYb02fn6sv/Q3GaKuhSqkWki5wDKPPS71LJjB4UejIRiaLp+fuFz1Q4pBRmI/fG9d0e
         4HY6ONUzXGLhKYWRmaWQIRsU5Fg+X+77Fk98+RuoqVYqHJTkZajuASrFD+Bb1uJrL66a
         sEf/bPfvz70oWFIfcsF80Iw0WIbawLoKOmXRnnwxCcAitEk1WetmNLv+/IYBRQmRbWzI
         wea8cW1kmEfxi6YQxKIYlT4P/FMAz374RZ+WLePU8SkDFXG5bzjhuw4liwACc9YBQhlV
         zDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142149; x=1730746949;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EHRpW98vkhSvMXXUJxWa0SLmg5kabWdlwzG0QsKPAGI=;
        b=v4WosvzGBZuMVBIEczFFbOgVzp8K+/0k4zXOPIYbQOLWOKMXmHe5vyrNdmNXnPI1eI
         bKjmSMDG0zf+08cIHBkALeaBXRTo7w8bFVrq6vvU4KGvolSp39UwkfF6MADUKof5dY20
         3fTaaODJ8y7Ra1GCeFiouK1kYrRTBxoioegzz2SNosP7bqk6IIWuAKSMVdWCHooWcoHj
         wp7VAKWJupOUVuq1bh6lPYBSrPKP0kZQAC35/AH3wjxPa5emXMkJHwBLnlZj8KcN/nb3
         tup/o72oc9BJxft6B8xdLWdaPyX9awi/OvvsmEPuuHn1Lyd7NHYhCeHnApROa1XcKuHc
         c+mg==
X-Gm-Message-State: AOJu0YwXbFPkfECLq5iW92pt4dfDEbkDohDxpaT8Y7sDIT0SFnrlQ0JC
	5VQXNNOSZqpQADUO7bkiSPu5G/yknCOayDAyVDmK/D/bGqQnDBduZNBlE4pbgIs6tVRvOA==
X-Google-Smtp-Source: AGHT+IExR0a9aLuAYmfV3AxBJbQdp7YaKic3simKLqUlMUU6g9QSdNMB4Ovb/3VBggT78IboqW/ELPi8
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a25:d882:0:b0:e2e:2940:9b43 with SMTP id
 3f1490d57ef6-e3087854558mr6137276.1.1730142149303; Mon, 28 Oct 2024 12:02:29
 -0700 (PDT)
Date: Mon, 28 Oct 2024 20:02:08 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496; i=ardb@kernel.org;
 h=from:subject; bh=LUzoz+2dD/g/ixA8BHwNhatmeDEXOA7MAd15Lgh8fyM=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV3+/oaLqzfPvhy+4+tr3SXO0vY3p/fl3JGwfcL0PymYY
 579o4t6HaUsDGIcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiag6MDNfSn2071Bd+43vj
 rf45T3PS9dxkZ6+6vnLq75Zv+svF96cz/FMQWypkvabtblasdeTnbRKhb8UYDP0Fsibvv+P+WqP OjBsA
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241028190207.1394367-8-ardb+git@google.com>
Subject: [PATCH 0/6] Clean up and improve ARM/arm64 CRC-T10DIF code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, ebiggers@kernel.org, 
	herbert@gondor.apana.org.au, keescook@chromium.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_120232_598563_9D3A7A5E 
X-CRM114-Status: UNSURE (   9.64  )
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

Ard Biesheuvel (6):
  crypto: arm64/crct10dif - Remove obsolete chunking logic
  crypto: arm64/crct10dif - Use faster 16x64 bit polynomial multiply
  crypto: arm64/crct10dif - Remove remaining 64x64 PMULL fallback code
  crypto: arm/crct10dif - Use existing mov_l macro instead of __adrl
  crypto: arm/crct10dif - Macroify PMULL asm code
  crypto: arm/crct10dif - Implement plain NEON variant

 arch/arm/crypto/crct10dif-ce-core.S   | 201 ++++++++------
 arch/arm/crypto/crct10dif-ce-glue.c   |  54 +++-
 arch/arm64/crypto/crct10dif-ce-core.S | 282 +++++++-------------
 arch/arm64/crypto/crct10dif-ce-glue.c |  43 ++-
 4 files changed, 274 insertions(+), 306 deletions(-)

-- 
2.47.0.163.g1226f6d8fa-goog


