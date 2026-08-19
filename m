Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A3BC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 22:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7ULPVsNiJGeOiMzRxtFMqgWR/S094ar6IrHsMXumteU=; b=hxi5CXnJFgPRcEdo8Hnquf/m7+
	j1j/txy75HJrsHcz9F0jj1ppVD8VfDVKPERB6rpjn5Vo6cyjd8bMPnoKT+nCIDf9O54heCrTc3rYE
	Mkkhf7c20mp/CbYEzv5rffyWgkUTIslMwUj9DSyOgIm5f2Yz/88hacobFDA0qsz1fsTlRd3LSOY54
	G9991T09KfcM/o//LpMNLGZZDxR9+PG0GYc/LScCgHB52faV2jTwLsFDVfY7ii0kCO6JVr32W+aDN
	KJZUNtU4lThQ7dYcDwelT8dvzY+DO1vH+lmvDI/8nCiKctnjm178URtlhvNviExlhE1/Skr64w88X
	pPXk6lqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwokm-0000000Ac09-0Yfv;
	Wed, 19 Aug 2026 22:27:24 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwokj-0000000Abzi-2drF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 22:27:23 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47f6609c657so729936f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 15:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787178439; x=1787783239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ULPVsNiJGeOiMzRxtFMqgWR/S094ar6IrHsMXumteU=;
        b=L7MYQBuxfXFXerGkT/edvJoz4RmxO40O0YmvyURa0OZzwlW/T4NESMsteQ4L86bO7c
         2w9W5WQ40Wkx/rMCnWAfEhFpu57E/8emW3gPvPfXFcTfz01kvkxOrUIQVOyrYxSoqxlB
         KAukJ+VJJktPUqje6qO68WLm99YP9qEwQfUC7yJIFlKpHmbgk4OJ4j5nwjmLylY92AaU
         IRUKTn7jANMbCmPLBGrztzccafSZFyzDPSVo+0su95M/IxUthvfZ4M7TZe2ueJcEoXvT
         483AYssLekIHbtB/2FiI9Pms7OM1BtIV2OkH2sWn8k7R6jdPfYcsko93FdB/LK7akfC6
         iNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787178439; x=1787783239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ULPVsNiJGeOiMzRxtFMqgWR/S094ar6IrHsMXumteU=;
        b=mm9o+FDBT2rNgfuwB1Wh6bVcdze3ihn5UpCcMd0+nvVnJlqzSSNDlXIDWONjn/Fkht
         ijYJDml9RNm/Mz85MqmbPmQAdTD7SFtawp4LzU3GKmi7AejsHJ+X1GtewxAqp3srE314
         F5lngPF1y9N3Fc7jFq4LdHNDn+ToXg+N433jh8itFWcaJeM3uPmHif+V49fDPdmx9Fjn
         cDyq5oMLEuNfUo8f9Cf52INnR3+Iz/5soZrok8Sa/qSMto1ysBnr+Sc2j+xjBKXA3spt
         l6b73mP9Ph4KTck17c4+u2ruuWJFrrFUugrBg27hPWfWtY8ndKi2xFwTy1hXQPT8swAd
         MXEw==
X-Forwarded-Encrypted: i=1; AHgh+RoH+BNct89TJ0aW+Q6CcpIJfe/rJQkjXuSfJ/A4GTfiOra3iXTnWRVMImINTChw0/XsuUSmd6Qj1AqT3OcbEMz8@lists.infradead.org
X-Gm-Message-State: AFuF++ntGrOyclSmUoO25WXfszKLvofrJWXuYx3fbyop9mS17x16Fdsz
	ogJZktMrqE5dfJ7Rv94pB8Scr/5uxQyd20QYbwjtC9AMRYtGuAMCwJTl
X-Gm-Gg: AR+sD10EwlGuf13fOTE+1XgRSgAO2AjhShExT0k3DzUh/yDdaThsMsIjiZDVeKyEovp
	WDAhfpo52yBOZkib6jKTtpeqaGkJnzUT6DYoRAUlC6DO2EV3bJEX1tCwmBghJ2i4xQ0bRrLRGqg
	gGMs/N6oYyyTlkglQXhy0mpabISgG23IyYfT8Pa5DbHs/fJOeKkVtpfVf555cGK9vPMWCLoay3A
	PV6rKGAXVn5i8RQlHBk9sLX/NZSy8WFGjspK4zwkVVCK2W20inFP7svz+k0fA+hwgIznFWJDO71
	PelrGj7YHB3NZqEnFegWxy59gUlDVs2y1NgWk06JnJuEkUqkAFscwdUjUGvtvtpRutKAofLNwOz
	z0oNOWGsic4yUMtUG1lAgxIT9LOFT8wlG4Jjovru0TjR5waRO+LERPP8ynEqjRw/HJyfQ4/TRG5
	S+Jcks9WlgxfM+gZ/yr+FCSjbUM8jl5lJn6pyH5uW6pVBAw9VNMDyrUt5VCOUangWI3Do5UOQ15
	j9Zomq8LrVM0C5jFjPYnV/1f2FOgphSBDW4wsZvX77LEE9ECM89DNWIDuHDGslU+RNiwmqcko/d
	4AxIsujwDQmwS6eb4Km57eiWIyLXNLUPZ+xak4VlrMP/JcsJpRqVVZEu5YMDdULccf1UvE0JYcM
	yiw==
X-Received: by 2002:a05:6000:2c10:b0:47f:cb39:10c4 with SMTP id ffacd0b85a97d-482b1fd9f1emr13180340f8f.12.1787178439256;
        Wed, 19 Aug 2026 15:27:19 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ae9e-1d01-58d3-443d-4fa6-01cd.310.pool.telefonica.de. [2a02:3100:ae9e:1d01:58d3:443d:4fa6:1cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b145153fsm8636030f8f.12.2026.08.19.15.27.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Aug 2026 15:27:18 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] arm64: compat: Fix decrementing LDM/STM alignment emulation
Date: Thu, 20 Aug 2026 00:27:12 +0200
Message-Id: <20260819222712.81855-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_152721_685550_9F74BF3F 
X-CRM114-Status: GOOD (  17.19  )
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

The compat alignment emulator inherited unsigned long data addresses from
the 32-bit ARM implementation.

In do_alignment_ldmstm(), nr_regs is an unsigned int holding the transfer
size. The function uses the same address addition for both transfer
directions, negating nr_regs first for a decrementing LDM or STM. The
32-bit negation wraps before the addition, so the handler adds nearly
4 GiB instead of subtracting the transfer size.
The resulting address lies outside the compat task's address space, so
decrementing LDM/STM emulation fails, while incrementing forms work.

For example, a backwards-moving copy routine using decrementing LDM/STM can
take an alignment fault when called with unaligned pointers. The compat
handler should emulate the transfer, but this bug instead causes SIGBUS.

The offset negated in do_alignment_finish_ldst() is offset_union.un, which
is already unsigned long and does not have this width mismatch.

Make nr_regs unsigned long so its negation and the address arithmetic
use the same width.

Fixes: 3fc24ef32d3b ("arm64: compat: Implement misalignment fixups for multiword loads")
Cc: stable@vger.kernel.org
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes in v2:
  - Narrow the fix to nr_regs, leaving the address types unchanged (Arnd).
  - Leave 32-bit address-space wraparound out of scope.
  - Add Cc: stable@vger.kernel.org now that the fix is narrowly scoped.

v1: https://lore.kernel.org/r/20260817000231.21311-1-kmehltretter@gmail.com

Tested:
  An AArch32 reproducer was run under QEMU and on a Raspberry Pi 400
  (Cortex-A72). An unaligned decrementing LDM gets SIGBUS with the baseline
  kernel and passes with v2 in both environments.

 arch/arm64/kernel/compat_alignment.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/compat_alignment.c b/arch/arm64/kernel/compat_alignment.c
index b68e1d3..9b58d0a 100644
--- a/arch/arm64/kernel/compat_alignment.c
+++ b/arch/arm64/kernel/compat_alignment.c
@@ -114,8 +114,8 @@ do_alignment_ldrdstrd(unsigned long addr, u32 instr, struct pt_regs *regs)
 static int
 do_alignment_ldmstm(unsigned long addr, u32 instr, struct pt_regs *regs)
 {
-	unsigned int rd, rn, nr_regs, regbits;
-	unsigned long eaddr, newaddr;
+	unsigned int rd, rn, regbits;
+	unsigned long eaddr, newaddr, nr_regs;
 	unsigned int val;
 
 	/* count the number of registers in the mask to be transferred */
-- 
2.39.5 (Apple Git-154)


