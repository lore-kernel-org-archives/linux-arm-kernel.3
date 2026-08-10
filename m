Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56594C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 00:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+bCXqXiVHaA5FZ3XKQFV9NmmEszADDHeGAjplPg15vc=; b=DUsXU7VA6f7l8x1IIIRjM5Aheh
	HULaUPHCbvCV5N0KKBIQ06Qzw9n0uMx5CI0xxg2j7MLp2pxKWpYnQOTpoN+1a3sNdxNX1CCyu/khT
	7dO5elLK6bT1CRHDhwC2HbFHWgcLKv8Dqho3GrMrUjPZyJv4VJivDC3Gx6IAodphggExtxCW5DACK
	Ts3fVpLVWiKjwiNP8zE2Y2iOvzvwf9+y2j9cRGs44/eEPf4PN0V6AMUlrll6wQN0DRiaFHnEgWvnc
	vFQPc0rUbpOuOH3MJQS0Oadj1iOOxiViWwhwoaHnPp7epZBrCw/GbqkonZdvKgRE333eD72RVzWFN
	rSd0eZ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtEJY-0000000ArlB-4BmQ;
	Mon, 10 Aug 2026 00:56:29 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtEJW-0000000Arkq-1WSe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 00:56:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4994c49f588so12067775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 17:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786323384; x=1786928184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+bCXqXiVHaA5FZ3XKQFV9NmmEszADDHeGAjplPg15vc=;
        b=UNGBm+PNa9bUBESxYZa37CQcQ7Zyx7/qi4niqkvVO2yjbrdQfUAGdlGetSvktAopbJ
         21MaF13vEDz1w/aSyETkqk97S0WEBoqlx6Ln/TWQyDYgBv0uOh4s0k7hPOse3IzL7t+X
         +YS2lQcDEjCgjzGN8MdeqZhzGci/pqYT/hWbSpLhfl6LTFJH0zrJxiNuNcOKVBHVUhRb
         AtS5JZ48mW3On5YduqGeoe+KmzYwQMKg9hxxBedeOSGQcI8BS2nJ0TWiCGTPsl5Y1BBM
         WdGngmRNJJLTkLXHxmWKxmv///APVOM9MCrA3CxDFS4dWR1T3tx2nc+fjQ4lMWnCkrmU
         vTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786323384; x=1786928184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+bCXqXiVHaA5FZ3XKQFV9NmmEszADDHeGAjplPg15vc=;
        b=cB3r7Uw6Z5AE+vf3ixVRwNUm03L+t8uPSBUpHMDbA1t+XFVLel8D7cqjNCUch4u9cS
         6U/k7/1XRLuYYeq/I2XTVlio7FWBhzdr64cSE/NmKGrLRtTlT00jS7KrpOzb9RUGIFFH
         B9D5OTrAnqRp62YWvW0wuhs5TeH/+TqlAXw27QgZue+ttulGcKAt0D6kvMi91XQJDp5a
         f+/q2MuhNoV3XBqQqFVitOrd5v5YP+i1Vb/MnXmxaTXb8iaKinZuc2Qij1dmwdMy/oBe
         V50+mNzGCAbuuoJBPXoBDlEaGGPrAzfWE2H6jRP4ImybbmnwhG+uW7zTiOvVokPw1v9o
         aCrA==
X-Forwarded-Encrypted: i=1; AHgh+Rp978heXvd8cc2qka2mJ4aY6ozl19SKEBRrvKatDqt1R0k9LHBupmZooE1mt1EXbNXt5FlKtoi5+vM9eVvYyimn@lists.infradead.org
X-Gm-Message-State: AOJu0YwAZFH16OvvxJdC8JpsyddGyJHDXX22+rKX6izzDf/6+k9FFTHf
	fKDbU0DKIoV09dgacH6/n1xZTrDB8ZM66ebywH9TPGQ5QGFzqGKQFv65
X-Gm-Gg: AR+sD11aGD+EzZJFq+YejFPUqzTVkC4BnkXeT5h0nQD3L+ljHDmh/W7rT4AXYbq+J5A
	/tqSbvuB0XCeXqJQath+CLHnOhz1x6LD99tD+OamPzwsqCTeMbTONxv/CVs3omQCaC4FoDTxE2o
	OnrBANyTbBIQQz9ts+JquchrBb3HdRwbLmr/FQvhzMmUZEwn1CXHLfQptnuKXLbnQ+nd+pDf98l
	FT5AEPM7YjT/XvOYtGDidgy9nPiUKwsxARdU12B3U5q5OP4DdZ/ltfSvNx7de4JP5x+CrHQwdq3
	lLsnozge/lESJcULyCTER+x5yEx/mVlXaJT15q2fwB/fIPITagAcXTH0BBJ1Tymebr6Bm6eXFSC
	FSp3vC0Gb7oU99oNAgjOm9hpH4NVnUFVNrZYuCs4srBSCLponO7HqxY6GEHTR8plrWgkeILGsdS
	pCkLO6JG63b4r6F+WvxH7VoOC+OSbXIVhgX+6TOHt9xYlSJCVclkx9+Q8rafFN4qfEgzJgecdSW
	Ni6mzE7dWIgZVyIcpKSfIph/XvDQQVZc7bzF1HXA3XLWqhvkRnkfRghoEfg7UwPvSyng/DIVZ3d
	VD6fFYukELmxpIrk/9FMNwv4EmVmMNVe7/fcPMpdkbTJxTEaMleUtqvcqswb9lVcUvyV
X-Received: by 2002:a05:600c:c87:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49962472d69mr139626325e9.6.1786323384059;
        Sun, 09 Aug 2026 17:56:24 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ac88-a501-9c5c-9666-3a00-3cdb.310.pool.telefonica.de. [2a02:3100:ac88:a501:9c5c:9666:3a00:3cdb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995422016fsm302405405e9.8.2026.08.09.17.56.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 09 Aug 2026 17:56:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: Fix AArch32 DBGBXVR<n> handling
Date: Mon, 10 Aug 2026 02:56:16 +0200
Message-Id: <20260810005616.13227-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_175626_441715_7F002D57 
X-CRM114-Status: UNSURE (   9.97  )
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

The consolidation of the breakpoint and watchpoint register accessors
switched DBGBXVR<n> from trap_bvr() to trap_dbg_wb_reg(). The latter
selects backing storage with demux_wb_reg(), which only handles Op2 values
4 through 7. Since DBGBXVR<n> uses Op2 1, an AArch32 guest access hits
KVM_BUG_ON() and marks the VM dead.

DBGBXVR<n> aliases DBGBVR<n>_EL1[63:32], and its AA32(HI) descriptor
already selects the upper half. Map Op2 1 to dbg_bvr[] alongside Op2 4,
restoring the pre-regression behavior.

Fixes: 3ce9f3357e9e ("KVM: arm64: Fold DBGxVR/DBGxCR accessors into common set")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested on a Raspberry Pi 400 with a minimal AArch32 guest. The unpatched
kernel WARNed in demux_wb_reg() and returned -EIO from KVM_RUN. The
patched kernel completed the access without a warning.

 arch/arm64/kvm/sys_regs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 5d5c579d4579..2862df188155 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -889,6 +889,7 @@ static u64 *demux_wb_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd)
 	struct kvm_guest_debug_arch *dbg = &vcpu->arch.vcpu_debug_state;
 
 	switch (rd->Op2) {
+	case 0b001:
 	case 0b100:
 		return &dbg->dbg_bvr[rd->CRm];
 	case 0b101:
-- 
2.39.5 (Apple Git-154)


