Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7ADCCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 10:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKpe3z5G5wNg83hukDMWCPcV+/73KXkYMZGFSKYmlXc=; b=eh+C13/uztnPqbr1/lXpEMh9Qd
	n0ZLh0eELOaqJ8Kjqwig3WFXTBNTXUjxc+p6xdYKcXwN/5MJmVVPko9ww829bu5+2SPzZ80yDNT2T
	uqxSsscapcRJhF4A3TGXRU0daw6uBxU00pHx8/z5hpvtnY0atVpkJzOFxJW0EUjdxzUEbVK0G7NRv
	YNeh0CdTLY5kEtk5tIEDroKv4/OOkBaNUgDa1Q3ggfJY/IEj3efJhEDn+J+RQnTkKiujRK80LSxXN
	i5PCv2NQvZIuhntiIlkFL7QI3vMsTmTfwYbo3C9JonNq23N0k45cFe2c2pSEIhMnK/iCUu5Nktbp3
	ptPKxXmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2qp-0000000Gewr-1scx;
	Thu, 21 Aug 2025 10:48:59 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0AH-0000000GAMW-0TxY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 07:56:54 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755763010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DKpe3z5G5wNg83hukDMWCPcV+/73KXkYMZGFSKYmlXc=;
	b=IWXX3/U6I7+HHr++GdGynma55/AkGgR1sm30+k+ENj1HdEFP04/N2xFo3VxFBXdNyWRKHf
	c4XJBTnY0iOBTUrLVwbBesiNo7pBwvnO5ufuQarcV5ljDTYujVA8Y/VQsniE9h27dgnuJ3
	0VJ4eVTsqU0f+m8oDe/HOIO/Vc/rDBthT1PCnBQ1MdOrdBGtsH0WHfEFUR4JTKMN8reEYu
	FNl0RnpUdX408EvNfEwU/RrzO2HIxgRUuJ0wbARP+WYcuOVafUJLWf6da2xR5JVV9JYS7R
	mGAl3m8m+zDkWmj3bnaWYw8QAxjR72SLEph+rk9FH1HiGLZ/YRMa3BIb3yy+Aw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755763010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DKpe3z5G5wNg83hukDMWCPcV+/73KXkYMZGFSKYmlXc=;
	b=9zk31AtzpdmPxaTFSQUbw+mBH1MWo2IADY3PWWNi9m1UfpZKEJKwFxlnLwl2ItR7AGZdaJ
	JEB58TfQDYMEAzBw==
Date: Thu, 21 Aug 2025 09:56:46 +0200
Subject: [PATCH 3/3] arm64: vdso32: Respect -Werror from kbuild
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-vdso-arm64-compat-bitsperlong-v1-3-700bcabe7732@linutronix.de>
References: <20250821-vdso-arm64-compat-bitsperlong-v1-0-700bcabe7732@linutronix.de>
In-Reply-To: <20250821-vdso-arm64-compat-bitsperlong-v1-0-700bcabe7732@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: John Stultz <jstultz@google.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755763005; l=1019;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=D/12OQ8vo23/Cq4trcCIK/F1NjLqR+YjyfQAZanzypg=;
 b=UOnKhtIauSWminqVFhBdCB8SbfiQ8ZETo2KzSj4wDnSfKf2vZnopjrVJZNjn8WlU80go3kso5
 ShCCXhPMl/yBtMt3LrSOHvneDqpjioh+1OUKnhXObFwLaaGdUenORfV
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_005653_298038_397A7069 
X-CRM114-Status: UNSURE (   8.47  )
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

The compiler flags for the compat vDSO are built manually as they are not
compatible with the ones from kbuild. CONFIG_WERROR is not respected.

Explicitly inherit -Werror from kbuild.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/kernel/vdso32/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index fd80123bc8e620d868040a61244e83575d855e35..5de4deaf42992046463963df193de47cd07ec1ae 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -61,6 +61,7 @@ VDSO_CFLAGS += -DENABLE_COMPAT_VDSO=1
 # KBUILD_CFLAGS from top-level Makefile
 VDSO_CFLAGS += -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
                -fno-strict-aliasing -fno-common \
+               $(filter -Werror,$(KBUILD_CPPFLAGS)) \
                -Werror-implicit-function-declaration \
                -Wno-format-security \
                -std=gnu11

-- 
2.50.1


