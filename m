Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807D5E9B36A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glnHOe4x1n8QotwxnJCfVYRyCZYHnBdaRGVCFc6KFbk=; b=gshyVCADz7MX2EmWWLMyFrSbJK
	Oc1si9k7pZE33SUX7f6wFZuLd7dn2+ZuVf8awU2+kxYmXReI8/4ITFvxrHgnVR897npEvoLtMMYcJ
	N5krrvHcDzuf205xgGktG1YqaF1/ms2NV4vIA/vCqkPzM2Gj9472H94m33GCugCfRrrXNWzrIDvGo
	/uz0PuRRXVrOWdvJc6vFxEkscQkk5hdtNuEJ2CWZHlWm8GEQn/Pt83poST5D1ICQUhgENOxpOdWEt
	fIRwZE/wHljWRDbpB8Ot1pAR1OZqlgNHnwq/uqvpiGdLwk0el+Olv8vOq1R9nHa/VwLwD4a/L5L7h
	hJR7k5vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LW-0000000Cw28-05Lk;
	Mon, 02 Mar 2026 12:25:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LM-0000000CvpH-3W8T;
	Mon, 02 Mar 2026 12:25:50 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=glnHOe4x1n8QotwxnJCfVYRyCZYHnBdaRGVCFc6KFbk=;
	b=rxZQv7hKeFYWJyFKJsUWMqNlbl2vjnSpyMUWvtbM+KVkUK8WaqYOWnhTleOFkje/NFvInP
	Qt/vVXUdfFnn1iq74C1RCTqwoqvw522r7PU2TEuWmhtnt/N+13u0BFDqvSJ9+N50ZjfS4U
	BSarBmo8rYOEJLTRt0ek/3O3vhTop7sJQum0OPLLRalA9vrZx9iZHrKfjYg84JldDBDnZA
	t0WwlWRm4tnjSIcfZAdKa6/AeBM96TDCbJDRytzgPtYIaNnWXkYcPaqvUu9PXVyIRi67Kg
	DLHn9Iv+m+Ef7KGJDn9Agiynrv+ZuTEFjtwN8a9glkN8hM57G/egFrrJPWtgeg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=glnHOe4x1n8QotwxnJCfVYRyCZYHnBdaRGVCFc6KFbk=;
	b=4UlDmyzzjetdRsu/XceNY6w9k+iZB9u+rg7F/k0y7+4PQofKHMuBzzowktpEfzJO2FIgmM
	N2iAdlv556mYd5Bg==
Date: Mon, 02 Mar 2026 13:25:28 +0100
Subject: [PATCH 04/15] ARM: drop custom asm/auxvec.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260302-at-vector-size-arch-v1-4-a11f03ba2ca8@linutronix.de>
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=481;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=x3siZYFPocmk1PJ7pJ2spSV3FxjnTs1Nv3DHpd4VwUE=;
 b=rDZhb8bdTw53LKoUbzecX+TybS3+vD/iuZGnWTOdu4kbPRoekZDJcE/myi94bDcvoXoVfIa/j
 i0gchlTXUzRD5/MoKkZ/K9H2k8m5yzGUuEJql+dJlXH03noNQrp6bhu
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042549_078686_6BA04601 
X-CRM114-Status: UNSURE (   6.17  )
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

With the introduction of asm-generic/auxvec.h, this header unnecessary.

Drop it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/include/asm/auxvec.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/include/asm/auxvec.h b/arch/arm/include/asm/auxvec.h
deleted file mode 100644
index fbd388c46299..000000000000
--- a/arch/arm/include/asm/auxvec.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <uapi/asm/auxvec.h>

-- 
2.53.0


