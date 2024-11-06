Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0F3D59F68
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 19:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krNk9QZ4aoSbL/uIeucFo+XpMFh2YwtRi+jdnWIyJTE=; b=nM5fSAYDJ3tQiwraNTp7zO/vAU
	s1fZFd/XKc13m8l5DodmqxF/c/PQ+tv+d8XK2j3sfxoQM9NzDr538Za+IxQAfRAvUD0jF0lgHHaZM
	CDbH03GKoNUnATPGX02unOL4O9LkaFJZgmD0f8jgp80Zg+Wtn22XBjdDiFdmChXrUI+I7Q9u2jHmP
	3zRz1YUef2jEQZLKkwCP9J3A22IY9loJe4ikkiJtnzJNIjwN9t+hpSM24uvaa20RaR035JU8Isp96
	pkqOoiLqWu+aVKls+ZAI5UfPmTl1F7DKiOe9ezN6hDMFWtcw30rOrs/Fm+LDXeSkPOTGNExVj3N5M
	XD5gVhgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lIX-00000004R1Y-03v7;
	Wed, 06 Nov 2024 19:02:33 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lBj-00000004Phx-2fMb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 18:55:33 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e32ff6f578eso1641600276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 10:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730919330; x=1731524130; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=krNk9QZ4aoSbL/uIeucFo+XpMFh2YwtRi+jdnWIyJTE=;
        b=ycdW8jbuYjwmeBkrTqHAKrHj4P0lQCPe4tAylLZcB8xBDrQCfsDGar1IOhHfwcV32P
         iJ/4GT3qHZX39GpFBe1k+1CpG0wdCFK6HNdikbPEfOPtQzLtauxTVMnGiC5vJaQt9Qvk
         /PEmWZvsurW4ulX7YY4y0OJ4yZ2omvF6Sr6IvFApxeV6aJGc73nu08XypA+q7+LKHqjF
         wwHmIiJn9aaEuJAx9buYJ7Kv6asi/3hMa0z6zvgk8vnGWZnybHYlUltkK4TLlMMUNnXN
         ynEyNzNCorHS2eTqc5apm2zCUWp7Ai1/h/hOlKd1RpC7iGBAMdHftdUvm/2bFbqarsGQ
         hPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730919330; x=1731524130;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=krNk9QZ4aoSbL/uIeucFo+XpMFh2YwtRi+jdnWIyJTE=;
        b=MJWbOo+hx2cQXYtfRLRhDYLug5dsIWSSyGVg/Q8l0pZzx0WyUdnldSI/bE1wJGR0Sx
         3nVN4zEwtWRmrHYUIpkMV3v/EtVrZrZBKy/hIqOiNU2RYIK/nQ/Aex6hJh2hbRQteFww
         FiZ2UBIxFrQsDGDkNWHrZmbdutUoU8bxOUFB6UTWsz4J/yn5KyLAKvFwztQ0vscL4Z1Y
         w5gPVPK1QAArQC1JAtih0ix+zKeeTdFbuxzPpaId1yhYVhKaAqpqNjq8sUjbCilqiZ/E
         6BlfrkjDR6TIcp37ZlN2Gz3GYTFf8EJRmdF+6VUeSCvTct1rZ0cuRR6UM5CZh/I+0qxo
         4jeQ==
X-Gm-Message-State: AOJu0Yy8AEW2F1KATkeW87iy9tcyoCFZlsxYRaP92Kt1OJTB4bcnenx1
	Kwc4Vs4y/sTTNQaZVSB64SBh8i7On2TisxgHIWexWj/1EAjKdlxGxltwMOk41g6nUz4y+N6saLq
	InnIRCV9t1GrkLP0H3YTCouVpchNBQ0ilUmwPG8IoCZEU+Hvt0WS8UEhfGuN7nTaGeeyCHN2ZZ+
	mIC1iM2qv/pDbg2fFtRdo+HN52nay6Mptw/kAIp/Nr
X-Google-Smtp-Source: AGHT+IFbkxJB6KrLbWCDU1cgKWzrAqRmI38va8SSmxrOmcic+Pe7Yqx8yb8h/dHxF6bwqDfWqaz2TxW2
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a25:ae97:0:b0:e24:c330:f4cc with SMTP id
 3f1490d57ef6-e336928ba05mr1090276.6.1730919329805; Wed, 06 Nov 2024 10:55:29
 -0800 (PST)
Date: Wed,  6 Nov 2024 19:55:17 +0100
In-Reply-To: <20241106185513.3096442-5-ardb+git@google.com>
Mime-Version: 1.0
References: <20241106185513.3096442-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=634; i=ardb@kernel.org;
 h=from:subject; bh=j2UA0RsND//Ot7oim5vKIZverHOpKm5DSLP/ih9MoGw=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV179zTBpkfL/y6qbT7d6LSUd/ItK+dINSH2186+VS96q
 ybPy4juKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABMRmsfwv1rgS4/YMXa/U1ss
 nq/UU3375ypv9Ts7uxtCKy1OvC+RCmdkWN80V+trEY/Q3s6ghYwsoYs8+s44yUrnhwkJNotPaX3 ODgA=
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241106185513.3096442-8-ardb+git@google.com>
Subject: [PATCH 3/3] arm64/scs: Drop unused prototype __pi_scs_patch_vmlinux()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_105531_700495_3529F04D 
X-CRM114-Status: GOOD (  10.88  )
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

The function scs_patch_vmlinux() was removed in the LPA2 boot code
refactoring so remove the declaration as well.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/scs.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/include/asm/scs.h b/arch/arm64/include/asm/scs.h
index 934e9217cd74..a76f9b387a26 100644
--- a/arch/arm64/include/asm/scs.h
+++ b/arch/arm64/include/asm/scs.h
@@ -54,7 +54,6 @@ enum {
 };
 
 int __pi_scs_patch(const u8 eh_frame[], int size);
-asmlinkage void __pi_scs_patch_vmlinux(void);
 
 #endif /* __ASSEMBLY __ */
 
-- 
2.47.0.277.g8800431eea-goog


