Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A51D1119B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 22:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=06gB16fa6KS/zoSWFVr7c45ocEVqzhsuohxeJKfmG+g=; b=Pjk8hkAe8lD3aKE4SKMd1QtBxo
	b3vR+6Fo0ISfdRpK7e5utTHTQY0FRFTuboIuiCQpab6lh6qAN3dPgi50qDvzQ8Reg8ZhVm4JowQYm
	7sY0mGVWcEquwz2ej2KOTvjfo0jJ1Qlf9L/uP1xG50qQ3VN0aWC0ZAkeIa613eWJ1MW/IFuqV3d/h
	2xHafmonZlm2pYNsRBKi2J5vFPg6DNfjCAmUtRpzzJUk7iDPRn26zap22tVnADJ9gnFmPtGLKlemo
	EPOP2oE2MB5JG8vOUC/jKpBu0IGDurZVUjHm0ToFuGCaBtuB3OEaA2QA3cLAONpAfKdFTEZ7GkBNn
	zaWIeRhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOO33-0000000Fimt-2Jqh;
	Wed, 26 Nov 2025 22:31:41 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOO30-0000000Fima-2sjb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 22:31:39 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42b3ad51fecso239378f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 14:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764196297; x=1764801097; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=06gB16fa6KS/zoSWFVr7c45ocEVqzhsuohxeJKfmG+g=;
        b=UZtKqkHxreBIm6Xv8JDfs/yVWLhyNl0+Uv8l1BiFy905OczqbL/qMhS3phDwz7IzO1
         lPpaDY60VaKMSAoALkSdvlS/Ww20vjrFtPN1aOWbpdFyOxRE7Kdzy69THN1WRWGe8lXn
         2T4V6D5YvkfqtvD+XVgSFL93O6AN+m+4xPhd6VugvC/yhGjWG5+RdFaclhaF+wn7/kIl
         xWjqgUHyM47yZXl7NRcYZ6/fprqfLJjQSkS+QrVTkuOgtjU8V7l1KxvKap1fRcUQDtBI
         ZsYi19UNhi9bUKrpW3ZzCxWUKG8HUf/MeaKnnevSmCilgGOXZExzXupWxkE7kYTcuUub
         g6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764196297; x=1764801097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06gB16fa6KS/zoSWFVr7c45ocEVqzhsuohxeJKfmG+g=;
        b=EQ6sL0ji/XBJTWpA88L+NoSjS62evbNzKg2KUwAaY9mzGjUF4Tx2gvLOgKq8OLiLRh
         drX1uUtoNl9pq4nWApZXEOAMUxuyrFePbbkZ9UnYZncbelUUU2ELx7HFkP1sgzqS1JK9
         oXuqR9DG99bT5ZAKE8YhqtRxU7yS/FL2BkR096ZIMYNR7fYVjpgd/uPBW6qx+xnbctGy
         U3q39qMQZp89a5+AII76IWmyhPWHFzW+nK2aV2Nmm9eXDX6gZVLWzMjmCvkmARyMyfVq
         TYMhXliBWuauGEGMZ2TPMVT84R+cYR37G/jMVyGgvkn2SNrFASgjLaqKjGPMCDaE82IQ
         4dxg==
X-Gm-Message-State: AOJu0YxkWqdGjBqCPjk1+r2Lgn+FBYK2hsHuw8br3m3KQS6pXX+lEb8P
	v6H26OK+QyCeJsz8I20bFfq5ffDZB5sB2MJbi4+tT7Nx+BQkJWVigy0W
X-Gm-Gg: ASbGncv7N+FJGZfnYP4tiJAk4H9xb639SKQPg/P91DP88DKgkrkzkuR6mii2DLH8nPe
	SxUgfKbC2JwdTuMcstWd7sEN1ULYs0+IeWk2LC81aU8/Rwk/hyMYsBpS/RpaKzULzX3AxuATtyl
	T+wjJZH+kaNxf6ZeHf4bGA3V9Vms21X+G7Tki9x0Wxl27fMNG1AwdXdWksngO0k29n9W9m2deAa
	0xaghPh5k/8vbK5nHHvcafa8DPYG1sz9aq/ZMUFIvAA0Boj5ObxZRqGNrS21nzX+/ZdI28CIqg9
	PVAZv/EAaurar4ayTTU6h/X9qMAjodA1aHbdPHmbiVBtGZKlmUMzD8e34uHDyY663jZtNQCCi8o
	Q7D15XeT7OUqmRGpwa5f6koi1A7bE1tx58R/owrP0Awpf3cW4OeydyJtpmXLFbouCYrWuPln9VR
	ip6s4XW4wHxnMts1o=
X-Google-Smtp-Source: AGHT+IFTq8xGRpCwoprbCeF3K9a3D/FqGda4o3Yl7FBKNxyW3D3EyyqfUlnqh/otuuy2/Zh5V/gmtg==
X-Received: by 2002:a5d:5d08:0:b0:42b:41d3:daf9 with SMTP id ffacd0b85a97d-42e0f1d5993mr9362364f8f.2.1764196296510;
        Wed, 26 Nov 2025 14:31:36 -0800 (PST)
Received: from osama.. ([2c0f:fc89:129:990a:83a3:6137:cef9:6de9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3592sm41705453f8f.21.2025.11.26.14.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 14:31:36 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] arm64: simplify arch_uprobe_xol_was_trapped return
Date: Thu, 27 Nov 2025 00:31:30 +0200
Message-ID: <20251126223130.216302-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_143138_737299_494625CC 
X-CRM114-Status: UNSURE (   9.46  )
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

convert arch_uprobe_xol_was_trapped() from explicit if/return true
return false pattern to direct boolean expression return in
arch/arm64/kernel/probes/uprobes.c

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/arm64/kernel/probes/uprobes.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/probes/uprobes.c b/arch/arm64/kernel/probes/uprobes.c
index 2799bdb2fb82..b38c1dab7eb4 100644
--- a/arch/arm64/kernel/probes/uprobes.c
+++ b/arch/arm64/kernel/probes/uprobes.c
@@ -103,10 +103,7 @@ bool arch_uprobe_xol_was_trapped(struct task_struct *t)
 	 * insn itself is trapped, then detect the case with the help of
 	 * invalid fault code which is being set in arch_uprobe_pre_xol
 	 */
-	if (t->thread.fault_code != UPROBE_INV_FAULT_CODE)
-		return true;
-
-	return false;
+	return t->thread.fault_code != UPROBE_INV_FAULT_CODE;
 }
 
 bool arch_uprobe_skip_sstep(struct arch_uprobe *auprobe, struct pt_regs *regs)
-- 
2.43.0


