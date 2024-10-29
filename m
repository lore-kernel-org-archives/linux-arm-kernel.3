Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7F2D3A661
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 16:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvaMXm3uDAR/jJVA96dAm0w8k86axnkYNL79ra4y3A8=; b=LqPlHQwYUyY+J1dtKTFFyi4LhZ
	X5sVvjxT7eYVEuQAf1u1ojYB60BrS21ARFrAp7Ds4oJ899pUJFxt479AERHuv4MyTC4tm+LOii1c3
	w21zQddxuj0lQTdB5q4x2ML793+DM8N1AwpXYDPQ21tEXeRmpR8UdnUXATVOFciIZQlOsdXyv8ZVO
	wg2z6UT0qlyNwNmcO2QdRdRWPFoQ75AasaXRVw83o6OQrTGjkfHsTPjnAXWZqqH882qQdQ3PWWZy/
	SarBtB6wGTvTOv2a4MRzcf6Ld3EXlBfS2VQHlzQIGxxhKFoVxBB9VpOqyeodFMDEhmH5IfsbZlnV6
	IorYyz9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ody-0000000F2fz-3Ibi;
	Tue, 29 Oct 2024 16:00:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nU5-0000000Elss-0exE
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Oct 2024 14:46:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bvaMXm3uDAR/jJVA96dAm0w8k86axnkYNL79ra4y3A8=; b=F52F1fRUtypKVtFXoNoyImiu/8
	g68aLFJzdZpmW2PxqXtbmX3MN0V6bji9xR3wLmdlnWd2sbexKf/8n3NrcpZl2WgC8x29NsKIVe17a
	oGotAttUnYpV4oWlC/IFAmUEmaV0XNj4Cnyg+vQbfhxuNlknTnuaE5Kpp5fZtp4bI9IJd8VL4DYR+
	zsKipGxSCXioIjB+ROUuu2bjkm6HjFj+M/L335tccLUwRfXV4bXVVailTjKgI11634IzQDY8Kqh8Z
	jaEIrU+/gY9lugBlfq+ReB1K7OK8LWa94VYjP3WvUeovHNGnFX/2cP9oy0xGrZqzadqJirSmJvZgr
	JzI+9njg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nU1-00000009uo0-2Xqq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 14:46:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3161E15DB;
	Tue, 29 Oct 2024 07:46:36 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FD373F528;
	Tue, 29 Oct 2024 07:46:03 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	aruna.ramakrishna@oracle.com,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	jeffxu@chromium.org,
	joey.gouly@arm.com,
	keith.lucas@oracle.com,
	pierre.langlois@arm.com,
	shuah@kernel.org,
	sroettger@google.com,
	tglx@linutronix.de,
	will@kernel.org,
	yury.khrustalev@arm.com,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v3 3/5] arm64: signal: Remove unused macro
Date: Tue, 29 Oct 2024 14:45:37 +0000
Message-ID: <20241029144539.111155-4-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029144539.111155-1-kevin.brodsky@arm.com>
References: <20241029144539.111155-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_144610_022063_55146D11 
X-CRM114-Status: UNSURE (   8.76  )
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

Commit 33f082614c34 ("arm64: signal: Allow expansion of the signal
frame") introduced the BASE_SIGFRAME_SIZE macro but it has
apparently never been used; just remove it.

Reviewed-by: Dave Martin <Dave.Martin@arm.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/kernel/signal.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index d5eb517cc4df..b077181a66c0 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -79,7 +79,6 @@ struct user_access_state {
 	u64 por_el0;
 };
 
-#define BASE_SIGFRAME_SIZE round_up(sizeof(struct rt_sigframe), 16)
 #define TERMINATOR_SIZE round_up(sizeof(struct _aarch64_ctx), 16)
 #define EXTRA_CONTEXT_SIZE round_up(sizeof(struct extra_context), 16)
 
-- 
2.43.0


