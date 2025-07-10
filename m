Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2AFC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 11:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DwTBqxY5fhpDH45jt0TkZsDBkbjBOKihn4EmNoV0LNw=; b=fkAa4+S9cyxoalsJxLlJRyQGjO
	GC9c0b/qssngwwH28AO0nJMwxs+cVO61QwtXk263FJ7qdZhQllLy1yw7xcFKNJnBxN54Ll+eVJqok
	Ux1sgrM4Pneb9ZpXEc9Gd/TDqkDP1PuYuURV+4CnFUmcW9GPWxQy5vnoSUnayGbvYbV5KX1z8ZgJu
	u9riudUwRZwQ5Z+MNtMbv3drQjb8f5VHv7MuVp5p4MnUgHodM63n9o/31i+YMinJwJYty1vr5G8pn
	V55+ItONEEtuUhgn8GUVLOyaJ1+3teJfJWBsocJxTN0ueo77he3IStgNfDnSfE5hIU4Va2X3zVXhs
	lVo+wl8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZptw-0000000BgxQ-1hnx;
	Thu, 10 Jul 2025 11:57:20 +0000
Received: from mail-ed1-f54.google.com ([209.85.208.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZonp-0000000BWX9-3UhP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 10:46:59 +0000
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60c93c23b08so1464832a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 03:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752144416; x=1752749216;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DwTBqxY5fhpDH45jt0TkZsDBkbjBOKihn4EmNoV0LNw=;
        b=vzDbv0XnJsUYCWGv/2MqNMnWEt+FlmVhA9jZXPsEd5XXDhNZiW2KIvJcm4hHIY/Kja
         q+9bu19Q38ATwScLMBdMEc6msXBLD/QFwlC3cDSoPLTTgWVGP8DA8D2+O26D60qCGoo2
         VvavA9eg6ZJuM+M0tSMqpl+sXcACMnB9C+0TUB6bdHzwZdAFCkQ5adJZJFP1WAq4RZVe
         fRYrX5t+M6S+8WRHV8TtWP7ChufA2+ma9o1jxnRM6Rhh5iy9qsIhJs2nSxgUYWSn8ted
         WNiJpi44OktQHYOYNsokD3xjbeHhwImd8BYiI7tYT1/seG7jdAq2Ube4tC+8zDM0s63O
         6yig==
X-Gm-Message-State: AOJu0YxUpr+n/x5+O12qGZLmbwhnA7GU6xFdu+0Eem550lLu4MOJBnJB
	edegoO+cI4UWkVDEdqE2cMycwNzYez1Zx/uQjGgqxRsPjKEa9egchb3u
X-Gm-Gg: ASbGncv37Hpdytlq7TNtW3Sj3fos39wiFlG9uOxKFKQLzbYYYCyYW5Fxv7fFjoh1mpy
	49GK7928DxvHG3ZfgUdWx3ZZlB9X0MxJeez74fIUP5Zhk43HQopDNhW+5LSQ1miA/0+i23Pyk+K
	cLuzqoFGvUpPM1+4FIrNCJ+YgzmT9zjROFr43/KUOuYq0MSAB8Z99UA/qakRP+2gaeuUXNWbXsc
	wQnUUPYtGxuq/0Ch+uPV6lc0+ZU198Nm4+OXjKn0I9xJ8xNqqx4WY2ogCuPUE5sDROxDR6UodrP
	Mz2egwzZwDbXcglBzbYtZYeoU08gCsHPAKweyo8vBtCWfKJY8NlFxg==
X-Google-Smtp-Source: AGHT+IFmxE1MalHqQ4MMFqA2twYZFP14xfCT5MFa7IETBL9bkP3o+0HFx+OjxlMEEaHq34KFxBsUgw==
X-Received: by 2002:a17:906:696:b0:ae3:b22c:2ee3 with SMTP id a640c23a62f3a-ae6e7043eafmr155327666b.31.1752144415547;
        Thu, 10 Jul 2025 03:46:55 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:73::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e8f9b4sm112022066b.11.2025.07.10.03.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 03:46:55 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Thu, 10 Jul 2025 03:46:35 -0700
Subject: [PATCH] arm64: traps: Mark kernel as tainted on SError panic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm_serror-v1-1-2a3def3740d7@debian.org>
X-B4-Tracking: v=1; b=H4sIAAqab2gC/x3MWwqAIBAF0K0M9zvBrDDcSkSITjUfPRghgmjvQ
 WcB50FhFS4I9ED5kiLHjkB1RUhr3Bc2khEIzrrO+tqaqNtUWPVQ4/2cYp9943KLinAqz3L/2TC
 +7weXSEVdXAAAAA==
X-Change-ID: 20250710-arm_serror-77fca8d732d4
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, osandov@fb.com, leo.yan@arm.com, rmikey@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-dd21f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231; i=leitao@debian.org;
 h=from:subject:message-id; bh=NZ9JWewDIpJuTxlD3Y6Io3nlZ3dqQ52JIgXmz5U9mV0=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBob5oeoFlOCtV1wQ4BKu2P6QjzzQrcQ7yIvOeHt
 uBPUc4MA/WJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaG+aHgAKCRA1o5Of/Hh3
 bdz8D/4hCtVkn3bLmZOGXYjNhCn//p66gXF6gUi9vJkE50F15RQLs4ZMcNxTlMZ2jkp3MVcGWPc
 LU2DjpokdABLZu2XwLu+YF07c0qz87O6AsFaTXksx01GBzTSjWndJoMxtFQ+criNNmY620oo3Oi
 8MkPthH3Ci8SBZwwnLg1D95UIZtQfUgee7diT3Q6waeIM+a/ytZoWxP6ZqvxqSkYWSIzCGJD+Wj
 lj+xBD4skkXPpSb8ilSKAWDvHwZakMqwDMPb51Mbv7kV/IxoumcIHwWHNvnJ027kpre24C1aEFq
 ziq9YBFxyfJAr42qh2im5VM+PXAoLejEy/4rzVV/1JMgkWEdQyMNcG/F3V3jSCJC40sgpRh2wZX
 A/MZEgiHTXSiU4Kl7TJRYDNu7bxWLbYTBL0Y8ek6NO1v7YuOL5u3E39C9BhtPxJS18v92hzLtCm
 idaYBs6sb8Wumh7033T6urVmc4paeJdqPxjc9pLDxJ1ecSiLXvvLTaXgqrtlUujobr+za+2NH3h
 YTZd+R+7fk75SzmfX6OpexG9TiWK32D8xuhQUhvYJuj9IaBxgJmrxILpNhJc4QOrmb1uwA2wj2G
 44ygpXD9uAll2f2675510KN1O8LihSlDylnODShFmLT5vED0yE6A0g75Z02ihrtTdqkY2moBNTt
 /JUCPecFGMDliHg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_034657_874044_E751BABA 
X-CRM114-Status: GOOD (  10.04  )
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

Set TAINT_MACHINE_CHECK when SError interrupts trigger a panic to
flag potential hardware faults. This tainting mechanism aids in
debugging and enables correlation of hardware-related crashes in
large-scale deployments.

This change aligns with similar patches[1] that mark machine check
events when the system crashes due to hardware errors.

Link: https://lore.kernel.org/all/20250702-add_tain-v1-1-9187b10914b9@debian.org/ [1]
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/arm64/kernel/traps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 9bfa5c944379d..7468b22585cef 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -931,6 +931,7 @@ void __noreturn panic_bad_stack(struct pt_regs *regs, unsigned long esr, unsigne
 
 void __noreturn arm64_serror_panic(struct pt_regs *regs, unsigned long esr)
 {
+	add_taint(TAINT_MACHINE_CHECK, LOCKDEP_STILL_OK);
 	console_verbose();
 
 	pr_crit("SError Interrupt on CPU%d, code 0x%016lx -- %s\n",

---
base-commit: 8c2e52ebbe885c7eeaabd3b7ddcdc1246fc400d2
change-id: 20250710-arm_serror-77fca8d732d4

Best regards,
--  
Breno Leitao <leitao@debian.org>


