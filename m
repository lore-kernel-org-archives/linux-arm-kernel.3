Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6633ECC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 07:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jl+U0D/FiXUkrTDEZdBlXfNsgWlEbpM5w7FZsJdpD+I=; b=Pk+1mTfBcqZra+1MXccdKpNkEh
	AJpAi9abJvP6Ajv8fzkJGT2pI+P0+ebiGfj/LnE7Op3AKC+2ghtieTueTfmDCTCMGq+q3bG+Eh8+m
	kgeRChsndx44vSOzfIx7WZWgh0W45lIO5LD/WY4sz5j7A78Nvb8AGMSKruXYuof01qiQDRYVKXeg+
	yXi+qWhAAwQUDBcj2N1cMR65lwJJJ1wV5aqc4TJ2PezHE6+vl26Hl7uP7p/ch0P7J52xCpotWRvw5
	ZLfyXfZmqce/nV+aIhOE5tXPRB7JHUqGHoa4iyKGygDaywjJYQTCtyrji13yC7wtwz2ipQX9XvKXf
	JhxoAKsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGWxx-0000000CDTo-3I1Y;
	Tue, 13 Oct 2026 07:30:29 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGWxg-0000000CDS8-2YPT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 07:30:29 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4a17ec7a49cso16903995e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 00:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791876609; x=1792481409; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jl+U0D/FiXUkrTDEZdBlXfNsgWlEbpM5w7FZsJdpD+I=;
        b=teSWjhRh5SNkXQ+osr0/PI7RFORzzW1cXR7YBaZsu74pHn0R3tFeNvEGELpWzoSicg
         3gxbIddprHnjhR2hUJOxOulVlEWS6pZF40hIhKFEQ8CWDq+TdCiyk9HKMNe7+0be3J40
         kvia8QoSDLSzxgVqz+sz37nUiJxY0KNPdJrCS72tEZ1nAIYH1rxgSwNDfLiwCxTe2fTL
         h9elW+edijcWn5r87X9UF/FAsa96TqYtGiLG3bSYgoCOLZBydf9f8ECRdW5Dw/o1KikW
         CUJtCJaqY9bqWHARmScdaqbKpTurSik+ToZpg4JJLQBA0N486rzAoXTFxh1kvwe3rIP/
         OuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791876609; x=1792481409;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jl+U0D/FiXUkrTDEZdBlXfNsgWlEbpM5w7FZsJdpD+I=;
        b=2CDSzHwJxKhL8DoLCLeiro2VXPeDWeX0794VZt6f4p/ocgqywX7te+HZZOlJfgwOX+
         pe8+uq1wkHFAdJm/WSbJO90RarnF48sKyo1YsOKp4hiqDLChAThncV4b8hWCBiX2XiYR
         omiqTHHQf5xzLBmNo4PWjaMIb+NL5eKb956NpILP7BzEjxKb5cBuUjrvCjmRe9hGHsPv
         y3uvdKHhjp/sRtTLFh2Pqo5JeJ8/NO6eisNElYyaJPuyd1D0lDZ4Q/IDQVztVc/skiHA
         aZfcg+9z2sano0AFOFKepRezBtxob7+zReh1Xwd+yieYofO5VLb17wGivJDm5MMXMNxf
         K/aA==
X-Gm-Message-State: AFq9FYLRXvZn71jfnFMuBioidP4lRegJy+3c0HqSsYJdflRiHS6uznka
	/RbHgRAYZ1QaxglLvdtRSeFY00yLq5QiCl4eB1NqAeUvQc4es8sl3ePhnyw5WbVK4aIN8X/e3w=
	=
X-Received: from wmxt8-n1.prod.google.com ([2002:a05:600d:8648:10b0:4a1:711a:c8d3])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3f06:b0:49f:ce78:356f
 with SMTP id 5b1f17b1804b1-4a18e4ca2acmr226773285e9.32.1791876609223; Tue, 13
 Oct 2026 00:30:09 -0700 (PDT)
Date: Tue, 13 Oct 2026 09:30:08 +0200
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013073007.1431719-2-ardb+git@google.com>
Subject: [PATCH v2] arm64/mm: Treat faults taken by EFI runtime firmware as
 kernel faults
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, 
	will@kernel.org, catalin.marinas@arm.com, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_003012_656918_7C52ED34 
X-CRM114-Status: GOOD (  12.30  )
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

From: Ard Biesheuvel <ardb@kernel.org>

When EFI runtime services are invoked from a preemptible kthread, the
kthread runs with efi_mm installed via kthread_use_mm() and preemption
enabled, so neither faulthandler_disabled() nor !mm applies in
do_page_fault(). A permission fault taken by the firmware on one of its
own (TTBR0) mappings then hits the 'access to user memory outside
uaccess routines' check and oopses, without efi_runtime_fixup_exception()
ever being consulted.

efi_mm has no VMAs, so there is nothing for the mm to resolve. Send such
faults to no_context directly, so that __do_kernel_fault() can recover
from them as it does when the call is made with preemption disabled.

Fixes: a5baf582f4c0 ("arm64/efi: Call EFI runtime services without disabling preemption")
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/fault.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 0b52557652be..87b5fd77d9ca 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -616,9 +616,10 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 
 	/*
 	 * If we're in an interrupt or have no user context, we must not take
-	 * the fault.
+	 * the fault. EFI runtime services may execute with preemption enabled
+	 * and mm == &efi_mm, but faults need to be treated as kernel faults.
 	 */
-	if (faulthandler_disabled() || !mm)
+	if (faulthandler_disabled() || !mm || mm_is_efi(mm))
 		goto no_context;
 
 	if (user_mode(regs))
-- 
2.56.0.385.gd3acb90ef8-goog


