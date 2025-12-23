Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFCFE6F084
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+FdLdYIbfO7vOmrfvIwEh+YRn/9rHzC4lMj63oYJMc=; b=MITgdetOMWqEUTMQ3bPtJeAHGp
	LRPxyDJRoxCnpiJuR12mPRlUBLjryy42Cc0PX+LtqcJlq3AZERMaTU2VDaeKG0DB+bYUTo/RFwEhD
	o40TwxZcu1U0CxN3WkVsJXrHk2vNbDn7i8Iowli/tXCtnP+0lx0FU3yOR+VyVPrPl/qaHBzo+2o1h
	GJbKWhA3l3txVdA/LAJuZ2AFOlcUFeRdWOO8daLFqjpzpPHZh5V5fYe4gsjh5U8nPjl5IxmmMkw6l
	v6htCImpPfcB4VPti68H/RuShHZSvitm3arEiQfVRoXIRYoIYG1yYqf4pQ2jr0Ip6xawJGioTJ0Rl
	lkknXeiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY03q-0000000Eukp-0CIO;
	Tue, 23 Dec 2025 10:56:14 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY03k-0000000EujP-1Wk2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:56:09 +0000
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7c6cc366884so2292768a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766487367; x=1767092167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P+FdLdYIbfO7vOmrfvIwEh+YRn/9rHzC4lMj63oYJMc=;
        b=XJjIHNLkf46Cy4EDsxSTipkZU0JseZd70zIIWkd0pgn+VZnSISovzDfdsOJwUVE1pb
         BCIDJkt2SRznlLmrrnCIYFLDA+QcocCDBEEYuunArc/hG1i1KdpLZjU88Jt7Ud3VPql5
         hghW/WDiRPadVPCsZV5GCP7YudQMDIKwLkcGoTbAdvjq06919SEpTXOhjBeXYYrRboa+
         Qc8ebTQGcajztXMvwCqsM6kFrwvBhgB6IMBu+xqbEisKvmgrZNzae0pW8ytHB5ZBgxX1
         x4Hf4B/5tqD5KrEH3oo9MpuIBu2XuUFHQTYGZUBlMsRGdR5ECcmcpdh4ZTwHYCpMK9z4
         CHtg==
X-Forwarded-Encrypted: i=1; AJvYcCWIckQ8ZBfDwAg96823yN/uGueCmXRJXAuodkSmpDbbZ+vUDo9MzPsPCoyPFFl2O7omGjAmZecKascdQVaLI4Cw@lists.infradead.org
X-Gm-Message-State: AOJu0YznD900E3PfJSKaj5p+zs/WwKSaRzGZnJTV9HE3gwIblBnnq3/2
	lO6b+yP43Fw/6w2wlT7xmh9vm56jBVFZzsN1FLBEcw/QjCFZXSuom9Dp
X-Gm-Gg: AY/fxX6iX4US9bNIgBd5HzixolmZ4VZVpPSnfKMITrCSRVBTVptGnjmFGqjDbSiA2Xx
	+jSSIMqcVhroc9dMT8u5frE8w/Z6Xx7MXpqqSTFybIDMVwRdI0XFTm97JlGaVseO/QhJ/JV0odA
	pqewdU8byYL4PEOP3R/ngxaX+bRHLU9Z4Mf4HRUhB8wAP9ebmoEqqOn2hIpNdWRYTqpiWilDIHu
	l1fWnDBzQFw87D0FFVMm4Esl4deAGppenKatfRr1qgPfIow8rK0K/MgiAFbveFyruSOWvtG4dpT
	odcmgyajkb11SThoe4qIpI0cvobWlfu5J1BZqCRC6vJrwXBdHKIyLZJRpee2dPxmYXsWQzQcAGV
	wWWNJrvTvXvh8OabtE1geYAlcoI8b0h1dLfsNwphQdbq8xarski7UTs77jnddMSudGzY/vGl4iu
	9dlZbQ6ZGTISdn8Q==
X-Google-Smtp-Source: AGHT+IHN2V35Klregw+9YTKsH2OtlmwwB/mDyXPjK++QZTB2CC0RR+jqY6r+PZxq7ko/5WlgLmeZrw==
X-Received: by 2002:a05:6830:314e:b0:7c6:cb39:adf7 with SMTP id 46e09a7af769-7cc6689c9d0mr6676247a34.6.1766487367049;
        Tue, 23 Dec 2025 02:56:07 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:49::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc6673bdabsm9065064a34.10.2025.12.23.02.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:56:06 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Tue, 23 Dec 2025 02:55:43 -0800
Subject: [PATCH 1/2] arm64: efi: Fix NULL pointer dereference by
 initializing user_ns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-efi_fix_619-v1-1-e0146b8b9d73@debian.org>
References: <20251223-efi_fix_619-v1-0-e0146b8b9d73@debian.org>
In-Reply-To: <20251223-efi_fix_619-v1-0-e0146b8b9d73@debian.org>
To: Ard Biesheuvel <ardb@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, riel@surriel.com, puranjay@kernel.org, 
 usamaarif642@gmail.com, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2290; i=leitao@debian.org;
 h=from:subject:message-id; bh=JPX11ECPaVPrf1MUlS1NHwPHSQuz31NB4jHoPAD7UEs=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpSnVERN1w34K2bU0P1LvowG6Xgn8s0jFHxj1T+
 myf6uG4fiKJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaUp1RAAKCRA1o5Of/Hh3
 bcV4D/wMbGBfSuzqozvQHGdYEhbyw9hw7JGeECYucULIyAmq1QKPRk6tmC/KNW66EbKynHk3W0B
 lwz/otxPI/YJZKk9TW7HbW64zgXZ2cICMblLGA8+G/0hqDbsYorXNZ7b+cIRTU3ACDrnP/2zlIP
 iYRjfPI25MWAo08KO8n/FFnekS8D65B1BJqNz/gE9L0qOcRqxQAZfeDvx5kKtlpgwXXsXkaBv+v
 pklHh9H5eJGNGf/LECjmedGBDU2lknktPo807TbRjjF2WhitXoY7UG7mc/3lDvLQ0yjPGno3Nxw
 +1tvxWsEDPI/S241Q18a67nm6rLr4CoF8JY+c+6XaktdUI0bQKOVRXsBI3T/ZRR5nyD8lGdVhk8
 H8IdIJhpJ9pdpbUwYFY9bEOGmP85bjrYtMH7Bl2Fk/ijhZQHzp+HnQL02jQ0eNW6iZJKpltBy9Z
 /k7eShirBHO01BNDZjdc7P3jHTrE33iTh9BCsUnWChJxFhcVToq1RXIJ8FrSY5n6OJBq1ePcqXm
 GwCwSu70Xut+SZvBgSm2ofGBPoqwsz5DS99ipygfYmKcZoyXuJDcjFsFFPAQvZw+JtrTHxWf0KP
 QT8O93E6sgd/j/ZSmvroKHwXYp43yIUyo5R2BZm+OYi+Fwz8yjaA26DoKvT3SneoCsDHtlS3yyK
 MU54OZsno/DXPFA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_025608_419011_9369369B 
X-CRM114-Status: GOOD (  11.56  )
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

Linux 6.19-rc2 (9448598b22c5 ("Linux 6.19-rc2")) is crashing with a NULL
pointer dereference on arm64 hosts:

  Unable to handle kernel NULL pointer dereference at virtual address 00000000000000c8
   pc : cap_capable (security/commoncap.c:82 security/commoncap.c:128)
   Call trace:
    cap_capable (security/commoncap.c:82 security/commoncap.c:128) (P)
    security_capable (security/security.c:?)
    ns_capable_noaudit (kernel/capability.c:342 kernel/capability.c:381)
    __ptrace_may_access (./include/linux/rcupdate.h:895 kernel/ptrace.c:326)
    ptrace_may_access (kernel/ptrace.c:353)
    do_task_stat (fs/proc/array.c:467)
    proc_tgid_stat (fs/proc/array.c:673)
    proc_single_show (fs/proc/base.c:803)

I've bissected the problem to commit a5baf582f4c0 ("arm64/efi: Call EFI
runtime services without disabling preemption").

From my analyzes, the crash occurs because efi_mm lacks a user_ns field
initialization. This was previously harmless, but commit a5baf582f4c0
("arm64/efi: Call EFI runtime services without disabling preemption")
changed the EFI runtime call path to use kthread_use_mm(&efi_mm), which
temporarily adopts efi_mm as the current mm for the calling kthread.

When a thread has an active mm, LSM hooks like cap_capable() expect
mm->user_ns to be valid for credential checks. With efi_mm.user_ns being
NULL, capability checks during possible /proc access dereference the
NULL pointer and crash.

Fix by initializing efi_mm.user_ns to &init_user_ns.

Fixes: a5baf582f4c0 ("arm64/efi: Call EFI runtime services without disabling preemption")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/firmware/efi/efi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index a9070d00b833..55452e61af31 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -73,6 +73,7 @@ struct mm_struct efi_mm = {
 	MMAP_LOCK_INITIALIZER(efi_mm)
 	.page_table_lock	= __SPIN_LOCK_UNLOCKED(efi_mm.page_table_lock),
 	.mmlist			= LIST_HEAD_INIT(efi_mm.mmlist),
+	.user_ns		= &init_user_ns,
 	.cpu_bitmap		= { [BITS_TO_LONGS(NR_CPUS)] = 0},
 #ifdef CONFIG_SCHED_MM_CID
 	.mm_cid.lock		= __RAW_SPIN_LOCK_UNLOCKED(efi_mm.mm_cid.lock),

-- 
2.47.3


