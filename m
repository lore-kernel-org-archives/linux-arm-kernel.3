Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D4EC55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 18:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pLz8CqUuxfuhpUaYrzuwzfN7xMtH1IZWfv3SLyQlY8s=; b=yFp99QEvYhBpX75df7y9KjqGUc
	Hq2xjgYwV0ebK5IShOGiYnZPv7h8Q63blDaOD5fkCEiK/xd+vJyR+F8l9MOnft0MgPqza/XYgZAcf
	CHzvzmVBFa21oU8aR8Yc6nJ+CaNYso+FlsCAi6oav6to1mv26XicSYqI4J8Ru/I1YuAWGcmHs6gfc
	VI/d84AgbtFdWS/AlMFCG1LZjDDnKkKt3giAUBjjbCH79soE7FmKpT+ljo1q+GDVA4/x40OqG+0VO
	5xf0tTVil840riFFGK2PYcEDhb8+bAAA0BztCVj11cBJumjpdORjsmH3pIURiUBrWkkStYKPWxO8v
	tUJ+/HPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqapV-0000000Fvds-1nQR;
	Sun, 02 Aug 2026 18:22:33 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqapS-0000000FvdO-0gk3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 18:22:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso11189565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 11:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785694948; x=1786299748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pLz8CqUuxfuhpUaYrzuwzfN7xMtH1IZWfv3SLyQlY8s=;
        b=OYwm4Q/jHiKsX7y9PcDo2iQUFghzqF0/8eiAPWGLdt0bHs9Jjp5rpSU1hfTY32BvCd
         UQxPvMeirRVzdHgNzc2vlMOUEnO/UVhG/Y/0Xpe7OFUFv7iziIdJ+jM+sGCPRblhB4gr
         JWu1qo1aALvSxzPf9dj6pP/zENU+eedDZRosD6Kwojs024kpXdPCrxXnzd5h3be6O70z
         TbQlGshezy9u2M85+zytNijmX6eTMNI1CVf6brozrqoA0XnSxqHPh50juBeG82cRoA2m
         4PQylkEQTPHul/OX627Rg0bTh6QCvwJyUyGeJ0zjU/foUvp1OcOjUJbiw1VsVeW9TNUX
         3XOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785694948; x=1786299748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLz8CqUuxfuhpUaYrzuwzfN7xMtH1IZWfv3SLyQlY8s=;
        b=LmjzFxkxzmgJ+725TY7HSh7V5/9cTO02Qf6jMQvWh5ruthTLa+9cb2d0hiMUdvyz6f
         SRWpB+GyN1o++lwprFv0bL+yUCA6Cy4akA4yu20QSClqZeLDNcW5XBJuVuWA7AtHkQK/
         nl7P4+dw2qKpDqIUT3UQLGjRS6L3brbFoACDsB3s2IrbejhoVnWa4pGBFZ78W0rTTQaL
         Ux7s7Mu+QwPsZ3UNIuPrbpEwQ4OSpnHJyHkUEwWSjFxXqj69ygZ/Av7s5HjpnQI3Wr+q
         tk89uVIXLoRhpk4803v7sBQcrmky3u2Tfk+y55gyDSMwyyLmTHPcWYc1/GXn/Uh2yFY0
         IFzw==
X-Forwarded-Encrypted: i=1; AHgh+RrRkZmj34Gtt/w9QwVcA+TXjW4rDMlxRy8G01yqDVikkRHTxtvpjxHDHHJLFSpD8+kTfrAcP0BRWqRrEsCvSsAZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyD+RHZA7mQ5sbpX0HEr3zmypiobkyJBVt8Kk52Z193UDpF4b3C
	w8Wpv/8kXzkYeD983NPKodQRVwRmnprmsz1HaaXWZpruiNHVkR4oR/vp
X-Gm-Gg: AR+sD11CruQDmkJIZlj9uNlx5s3zPOn8KXPdVDPqkB40o2smpxR20usXzKA0RbbPSD8
	mtjBw3uFSmBn3m9kQJKVzJWdqjujUf971vkiBLFRr1uxfmdCac4Dlfc+GXOEnkY2yb8IXn1TA3I
	AVbqzbe4QqwQMqRk256oDifaU4tDKs0XdRqfB2W/0t2P2vw6L3w86kjuhinbzP//R8BGtFBUavl
	oEIx7ARFhS7zJ9qATA4xnvcw9VqM7mjlk0DgskKfjTwtn1vSujn2vXwyh8W6oDvQL4jvnT6QTUt
	wK5A3lDk4p6iu1j5nSQpkcBGfyhEMkz8BhG0lecoq2A/ZUGpvtZiRoAa/2+F6gUi2NNRZrj9kZr
	tvjAh06y+EOYvgxShojt/YEO4CCVxSjVn6sn7nNfL6CJZLswGhim866GuRfClL/wh07QdsKRw3c
	uKYMgC0QT1PLpNgUzlRRTUJyUXuppgXuddRU2n8dIdqybSTHS5mYe9TzGL7iHSBGlM9W3D42z7R
	bM5A2EM8VqHdmZ4BptWIyf/8jptlRuTY3s53D+goiWgi4IKmBi0yo51+plDB4h/I2ouFuAl6q40
	+wYqRSPZihSTQFmAFxc0CmDW7YNYdWNmyT48quUBj22r3oTHz0wQ72k7PrGABaJDIhN7b1ILaMQ
	Sqw==
X-Received: by 2002:a05:600c:354a:b0:495:4e89:3f30 with SMTP id 5b1f17b1804b1-4980c673874mr155891915e9.15.1785694947549;
        Sun, 02 Aug 2026 11:22:27 -0700 (PDT)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-ac60-3101-f9d3-c495-76bf-b296.310.pool.telefonica.de. [2a02:3100:ac60:3101:f9d3:c495:76bf:b296])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807ba13e9sm234230405e9.13.2026.08.02.11.22.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 02 Aug 2026 11:22:26 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] KVM: arm64: Preserve GPRs for AArch32 CP64 reads generating an UNDEF
Date: Sun,  2 Aug 2026 20:22:22 +0200
Message-Id: <20260802182222.2239-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_112230_215720_F45E05F5 
X-CRM114-Status: GOOD (  12.33  )
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

kvm_handle_cp_64() only seeds params.regval for writes. If a CP64 read is
decoded but UNDEFs, emulate_cp() still returns handled and the caller
writes params.regval back to Rt/Rt2.

This can happen for PMU counter read accesses generating an UNDEF. KVM
injects the exception into the guest, so the MRRC GPRs must remain
unchanged.

Instead, the uninitialised regval is copied into the guest GPRs. With stack
auto-initialisation this is a deterministic zero or pattern value. With
CONFIG_INIT_STACK_NONE it may be stale host stack data.

Match kvm_handle_cp_32() and kvm_handle_sys_reg() by seeding regval from
the GPRs before emulation.

Fixes: 62a89c44954f0 ("arm64: KVM: 32bit handling of coprocessor traps")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Runtime tested on a Raspberry Pi 400 with a minimal KVM harness running
an AArch32 guest. On the unpatched 6.1.21-v8+ vendor kernel, the PMCCNTR
MRRC test took UNDEF with r0=0x00000001/r1=0x00000000 instead of the
guest's sentinel values. With this patch on v7.2-rc3-278-g38436106b2f5,
the same test preserved r0=0x12345678/r1=0x9abcdef0.

Changes in v2:
- Rework the commit message to use correct terminology, omit the
  unreachable GIC example, fix the Fixes tag and drop the added
  comment in the source code (Marc Zyngier).

Link to v1: https://lore.kernel.org/r/20260801153616.71960-1-kmehltretter@gmail.com

--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4860,11 +4860,9 @@
 	/*
 	 * Make a 64-bit value out of Rt and Rt2. As we use the same trap
 	 * backends between AArch32 and AArch64, we get away with it.
 	 */
-	if (params.is_write) {
-		params.regval = vcpu_get_reg(vcpu, Rt) & 0xffffffff;
-		params.regval |= vcpu_get_reg(vcpu, Rt2) << 32;
-	}
+	params.regval = vcpu_get_reg(vcpu, Rt) & 0xffffffff;
+	params.regval |= vcpu_get_reg(vcpu, Rt2) << 32;
 
 	/*
 	 * If the table contains a handler, handle the
-- 
2.51.0

