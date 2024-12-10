Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1A4E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 00:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iNlVsXLwGZKN2AC/gvuWwQs8wsgSrzfnTEtF33Qa/oU=; b=l3cj/r+XO2VJY09mlFgiU7O3H7
	Qk+3hgevGHLAMeEhHOJPHSykk35zItOg0Jj0/QEm7XwD912aLVWxVTBuMYVbdZad3uCwr+8fAjEhM
	3D5fbRAjReeu5kVhuvUKkPuRdaiASE6Q7UGBu4y/dtfAMqpKQ+fFTRJwqTNH8lhoCqUPHn7LSZ9hC
	MfbS45SK6lMorCpSFDicHCEaZ1ZM/J8wrzZOXglFasjF6SCHdARRssvhOsKbhS4WC4vOxeiZww09E
	AB4BDSWoTw+oHwfVPSJS6eIOAjKQnkknpFSYNzPigsi+qQn/KYtrgD8j1xD7RV1vQ3fn3XqeWk+zS
	vvvmJZNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKoME-00000009jTp-2Eor;
	Tue, 10 Dec 2024 00:44:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKoLB-00000009jMv-1O8O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 00:43:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EE5B25C5B97;
	Tue, 10 Dec 2024 00:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A6DC4CED1;
	Tue, 10 Dec 2024 00:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733791384;
	bh=RuCcFUDLbLjGKs6CmeSz+8foqRR83dy3HBN8E1REPgw=;
	h=From:Date:Subject:To:Cc:From;
	b=XwiLlCX3NpbW5Hm/QQaTrLYAbO7u1kk/ba5Q3+Yi9NKQHeeHQlFTMFOnvybDWQWoO
	 QIjJL986KmJ5TO5M8tlvosJ8aohW0UDGsglBpne1uU/BORySyjPoJeqmx42JoJChNM
	 o9ASe1zqgDbELymkdd5Hj/ylXasRwfI/pCj4jD0OnkmSAPNe2C54yAPRC6f4Ds9yPG
	 nnDsszJGXHV5SV5l+c2uO9YjyJNRXqlHrLThjRqCmXhNPQbPL74IkpdmZMqMQkGM82
	 8ecaEsVJrDaW0SEWBTRVJkOW+ZeKRc3YBX0n+ivxQpQdrlG+coQIDHwFWJMpidPnCm
	 N1SFD/qSqmF1g==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2024 00:42:53 +0000
Subject: [PATCH] arm64/signal: Silence spurious sparse warning storing
 GCSPR_EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-arm64-gcs-signal-sparse-v1-1-26888bcd6f89@kernel.org>
X-B4-Tracking: v=1; b=H4sIAIyOV2cC/x3MQQqEMAxA0atI1hOoVSvOVQYXoaY1oB1JYBgQ7
 25x+Rb/n2Cswgbv5gTln5h8S0X7aiCuVDKjLNXgne9b7yYk3UOPORqa5EIb2kFqjEOXaIq0hDG
 NUOtDOcn/OX/m67oBZlzzEmkAAAA=
X-Change-ID: 20241209-arm64-gcs-signal-sparse-53fa9cad67f7
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=2301; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RuCcFUDLbLjGKs6CmeSz+8foqRR83dy3HBN8E1REPgw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnV46Vtms1HDkXqNTBQOpNkKXM/NwnEd+RWOX8aUVV
 AbjDp5yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ1eOlQAKCRAk1otyXVSH0Nf2B/
 46IZKbsXIhvCH3YKyKwJdChGOWpXTBf6YEHh8T/jS05DXa9vZNHU+B/U9TxDHM1CRUdPUaDQbcPXRn
 Cav5lk1kZUrdoXnHYm/rOR9zaX0z1TLE+u9NuSeLglpLyzQyBfkdbLpQ5YgNt3I0Fm8RAnBl6zDPER
 L1Vch0wPxEUNOIpID45ry1unNSmMG5StXBNkYURQ18PTCDuQ+5ACgoY1lJifvm+MchS8oIzmzV9WzU
 RKhqAjUYSPe0PDDKklWHuCPCHqq6GrMtc2q7jCQGQ242brIFmQyTJ+SEs0GRzkCxwckTmOwjGRv8ix
 5JPpPWdYRqvVCKFWKwVyszinhF2iSX
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_164305_458933_01088BBC 
X-CRM114-Status: GOOD (  14.56  )
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

We are seeing a false postive sparse warning in gcs_restore_signal()

arch/arm64/kernel/signal.c:1054:9: sparse: sparse: cast removes address space '__user' of expression

when storing the final GCSPR_EL0 value back into the register, caused by
the fact that write_sysreg_s() casts the value it writes to a u64 which
sparse sees as discarding the __userness of the pointer. The magic for
handling such situations with sparse is to cast the value to an unsigned
long which sparse sees as a valid thing to do with __user pointers so add
such a cast.

While we're at it also remove spurious casts of the gcspr_el0 value as we
manipulate it which were the result of bitrot as the code was tweaked in
the long period it was out of tree.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412082005.OBJ0BbWs-lkp@intel.com/
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/signal.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 14ac6fdb872b9672e4b16a097f1b577aae8dec50..83ea7e5fd2b54566c6649b82b8570657a5711dd4 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -39,7 +39,7 @@
 #ifdef CONFIG_ARM64_GCS
 #define GCS_SIGNAL_CAP(addr) (((unsigned long)addr) & GCS_CAP_ADDR_MASK)
 
-static bool gcs_signal_cap_valid(u64 addr, u64 val)
+static bool gcs_signal_cap_valid(unsigned long __user *addr, u64 val)
 {
 	return val == GCS_SIGNAL_CAP(addr);
 }
@@ -1094,15 +1094,15 @@ static int gcs_restore_signal(void)
 	/*
 	 * Check that the cap is the actual GCS before replacing it.
 	 */
-	if (!gcs_signal_cap_valid((u64)gcspr_el0, cap))
+	if (!gcs_signal_cap_valid(gcspr_el0, cap))
 		return -EINVAL;
 
 	/* Invalidate the token to prevent reuse */
-	put_user_gcs(0, (__user void*)gcspr_el0, &ret);
+	put_user_gcs(0, gcspr_el0, &ret);
 	if (ret != 0)
 		return -EFAULT;
 
-	write_sysreg_s(gcspr_el0 + 1, SYS_GCSPR_EL0);
+	write_sysreg_s((unsigned long)(gcspr_el0 + 1), SYS_GCSPR_EL0);
 
 	return 0;
 }

---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241209-arm64-gcs-signal-sparse-53fa9cad67f7

Best regards,
-- 
Mark Brown <broonie@kernel.org>


