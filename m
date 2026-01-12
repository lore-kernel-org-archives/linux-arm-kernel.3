Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B24C9EC99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 16:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SEhgUjECnk9waqiLf4vh2SAG8fSbncDeiW5IMVeFkBs=; b=r4/XsYyVF0KlXMOKUfDNKZlhxK
	YG1HUA+WMog2X/yL5mueUX8XN83GF1QewtQk3tjF/fMyXo1NUFWy3QDtDIJGpml4Mjw0VQlSFq9Wf
	CxLw3KMhAKEx487NXQdImuexrjwCMONAK6JkVzTc2iBuZp3XVquagIg4RISeSXP/E8+dcAjWI4UNk
	/GyTRpvcHxZGY2uAXCzOB7IuOzruEvILmd76lRbaHk+B2lPpyBd+UwuHRZf5DmgjC1/Fs5UJcJv+U
	WbMrX03gswJV2hghqmdWtOAQUT5coGXVLzCm5XeRzmTTNAvvYoe7xGx/IZfgTqq0sWf4MMGQU9zQQ
	0I1ZKFZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKP4-00000005h3W-02oe;
	Mon, 12 Jan 2026 16:04:26 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKP1-00000005h2P-1tM0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 16:04:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=SEhgUjECnk9waqiLf4vh2SAG8fSbncDeiW5IMVeFkBs=; b=t/3ERgCSv452Zu
	si/rfCFRMbdtABlf7EVwIMo8LEK6JoNmfPCNJC09dkQSV28EKnzb6ZqbcilAMhC0b50p71+ltdS2V
	ncQBxPgRsWoEbCqMe8bqMLKcLTMt1hcIUJrpkDgU+2XxU6P/cFx0uTpfpPbd0nLPx7E4rF/DSIKNs
	UVXIcbt8kbRJMAFBNJnBekOwXXiO7WvNDuVn50dtDoXljPCIx8Ye+h0LrcTkUqsK0L/Sn1iHPYUKS
	JD6CaTDxKFO9r9kP0QI4ZFB+czrB1yNE3tEkPYwtOI8pf2ENVlMsyWaAzSVuTu0QUcAhh4yjHKZjb
	OvLu9mvCKLJqWXMzJUFA==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1vfKOs-00FRCK-HQ; Mon, 12 Jan 2026 16:04:14 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
	(envelope-from <ben@rainbowdash>)
	id 1vfKOs-00000002Wzy-0tK8;
	Mon, 12 Jan 2026 16:04:14 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	oupton@kernel.org,
	maz@kernel.org,
	linux-kernel@vger.kernel.org,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] KVM: arm64: fix missing <asm/stackpage/nvhe.h> include
Date: Mon, 12 Jan 2026 16:04:13 +0000
Message-Id: <20260112160413.603493-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_080423_569817_1070C477 
X-CRM114-Status: UNSURE (   9.36  )
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

Include <asm/stackpage/nvhe.h> for kvm_arm_hyp_stack_base
declaration which fixes the following sparse warning:

arch/arm64/kvm/arm.c:63:1: warning: symbol 'kvm_arm_hyp_stack_base' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/arm64/kvm/arm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 4f80da0c0d1d..b3543ad2eb44 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -40,6 +40,7 @@
 #include <asm/kvm_pkvm.h>
 #include <asm/kvm_ptrauth.h>
 #include <asm/sections.h>
+#include <asm/stacktrace/nvhe.h>
 
 #include <kvm/arm_hypercalls.h>
 #include <kvm/arm_pmu.h>
-- 
2.37.2.352.g3c44437643


