Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5507CCD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7jHkATK0ZLZ/JtNRitDrZjkJGyPUVshYo0TAfRZu58=; b=bv6CVLpFuYJ1EO8YMaHJo0Iloz
	joG+w1h4Gf+y2o/f3ZpLHGb2bby5YDSNw3IKYtlyvshFGMl3fmRi1vezCjDWiv9vfBKVECyDpVCs5
	dJAKAC5V56JTNZqShSAF5OryShgJtr+BMPM6lMWYeDUEyvZ8lPlJsfuG3Xdd4tIUQcnDGwTGU5hP4
	ylV5awgTNsa/MUcsfJHbqyhDQwGMNNjD0IwcRPrEke7qvQE8HKM+VKUQxhaodvun2un0D3ubx7Kec
	JVm6c0eqNnJXHtBEs4mRQ7jc399yKBaJkz1Yg9QyXw31zxag25BU5j+xO6ePkgZ/WjCF97GvfEKCO
	OXeKlmkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Nh-000000014ym-2o8Y;
	Wed, 13 May 2026 03:35:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0My-000000013xw-0iou
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D677744512;
	Wed, 13 May 2026 03:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA04C2BCC7;
	Wed, 13 May 2026 03:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643287;
	bh=n0zIE5QeG6gMOvBsdlMrDubUOuT5GRIBXLzLQUDUXac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a8hdIHrTWDu0YaYDs2Z5CBvbdW+bWitNDdUfJ5nc9Xn1AQUgx3LQYnPbXwkcy6nLl
	 LVBcQM+HUK0uXO1vPwUyZpqwVo6IkIxTL0RvLRNtnV0I00nCR4gNAa5IUz/LDAgzxW
	 RTbdfAASG6K5VPvxaD1pL/RZuuUPwOSMSchZ2XSO/ajEbnpWh0Z8MU2ZZA6AbU5w4/
	 owoc7kBxF/YjZW4CNNRJ5Vm6JzJFe1B8WbRA8DXdz2ae40gFW5FK9WFSSKlZYybJw/
	 q8wgBbkT3kr+ncYmriogNmaitJkZoMwjCvXCuuiqP2DqgYVldLvBBkE8Z8Tdq/6Ti0
	 sqiXm5yyb0Umw==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Song Liu <song@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v3 05/21] arm64: vdso: Discard .discard.* sections
Date: Tue, 12 May 2026 20:34:01 -0700
Message-ID: <bff1bad8bbc43ddf123e91b844073229eeb56b56.1778642120.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778642120.git.jpoimboe@kernel.org>
References: <cover.1778642120.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_203448_230171_9627B6CF 
X-CRM114-Status: UNSURE (   8.94  )
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
Message-ID: <20260513033401.8lkCBPBF7mdJXo4BMnMNLB1XzrJ53jPX9kwBT0fc9bE@z>

In preparation for enabling objtool on arm64, add .discard.* to the
vDSO's /DISCARD/ section so objtool annotations don't cause orphan
section warnings or leak into the final vDSO binary.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/kernel/vdso/vdso.lds.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.lds.S
index 52314be291912..d5f96fa17e605 100644
--- a/arch/arm64/kernel/vdso/vdso.lds.S
+++ b/arch/arm64/kernel/vdso/vdso.lds.S
@@ -39,6 +39,7 @@ SECTIONS
 	/DISCARD/	: {
 		*(.note.GNU-stack .note.gnu.property)
 		*(.ARM.attributes)
+		*(.discard.*)
 	}
 	.note		: { *(.note.*) }		:text	:note
 
-- 
2.53.0


