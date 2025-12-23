Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B45FE6F082
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=spoP0+Albf1P/crjcQ63AptEOAl1TVHeih5dAbMZP+Q=; b=sdNBkxhXzB3l5G
	nc7FQfblyAHle3eyPAwQ6+ydLyI54Kssj1GxVGq0KHfo3lQhU89VqD+aJYH626t2igZWWhsM2acOt
	EDvFdjHHuvo42w3SWEMtog5Cqho6v0MX8uPUkJdiVdcBlw+QXRuvcQPHkmZ9DuAVX82hO4ZDAYuaB
	QRhGowYbYa6+LH5VoL+oovxwXl/jy7SCIK6FMzXdZhQt4oVSkObdJ9s7MEwtJZPCvTlt00vIwsoLP
	0SpjOHIAGgztkWTPhhvVZs2UlfP3eElZuUtTOB3gy0U3Ndd93d4ur1yYy9+ORKnZ46FYDHYzZQdMW
	DC54jkfCq9NLDdqVC6CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY03m-0000000Euk5-2u8N;
	Tue, 23 Dec 2025 10:56:10 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY03j-0000000Euj7-0IC0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:56:08 +0000
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-455749af2e1so3588528b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:56:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766487366; x=1767092166;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spoP0+Albf1P/crjcQ63AptEOAl1TVHeih5dAbMZP+Q=;
        b=eEqttorm/rO5W8bWCbo6lGA32FCI5GEuqJOUV5CW71IIUA1ieaqK+rhjoqS0DH+pc6
         zxG4Of3iXkwNwT4jZ1nrJc1JL1+GIW+U3NDn8IYXZ5e3VIBhe/DXZwCiaGbo2yfvp2+H
         H6KkDdRtvfjHyn0DSYbubQW7PgAR/gV8n6LPLdAShm45RQKEgpDP2E5+zqGJum7GXpYu
         UueWiy81qEx21kZ/st3wWD0wz0NHtzKercJJtYF/vggyK0WKWLbY09pgu+ye4sr0UmgN
         fWwycqdDi5ViPgK7/6wFIJHwe7oRo5PhWOT0q0EIn4Qmm16RlGadivyWBMk9e6xyUbMa
         mM7g==
X-Forwarded-Encrypted: i=1; AJvYcCVy7dLvvFaRVXfI1qn/0OBNnz8ENUHF/7nWhw8mMeiI+9Cj+XfTWwOhrD8+tb/SEsRA25otEb8BRazTjDczfCC2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy58z44qw+DrbBCsXnyMbunXaY4AGXEc6iarKcEhJ/mtQ5kCYJh
	g6VJmkG6QAWLzZLVJBK0dhgVP2G8thbualyqWWUgnb54+USPP/1jTHBX
X-Gm-Gg: AY/fxX75E0K8XZ+JBswcjrMLQ7eKI3ecEAseeG3k/lGxiVfBW9Bg9zNeA9pu4LHjRUD
	p3sI6DgRccvKzzAVC1hDTTFaw6Ov1DaBH6v7L8RzxAxzaH5+IIl/xhkCS1i6CeKfPTPGD10JgNt
	gpKG4seA8DhM9nQOjFc9VMCVvZmrPrQHbZv3Y2/YUvnqu9ZJDRax9XTRCs9Jrb5yVtf2ivD3F93
	4U53mXT4e+y6yudbCjlx3FUWs8CkJZxAN9iwW9Gua9TE2Pcr7ks4s3ERXcDt0mSUxW/dNIIO+zp
	oTpYmVPVFpWGUHvQ/MLNSLlY+bKokWCv9dcxKfWmSDVDm0lKKxbMGC3A6V7okugXArhH6FRsIq7
	jivBLOJd+f/hG0aBuFJlMhMyaFg1GFHJBjNpV60Si0A9joooKjDSy84GyG7v2aCdizzVuG95Xb1
	T1OXjknRzGc5KQNmw+4NYT2ng=
X-Google-Smtp-Source: AGHT+IGiZkiYPTPZNUrOfsgRj6L7DBQ+OVmkgtvSX3FWGLRox+YADwlzHeeAwjVmg585DG80xaAIMA==
X-Received: by 2002:a05:6808:1b2c:b0:450:f45e:f4a7 with SMTP id 5614622812f47-457a28920femr7624447b6e.8.1766487365699;
        Tue, 23 Dec 2025 02:56:05 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:5::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3fdaac129c7sm7610763fac.21.2025.12.23.02.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:56:05 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH 0/2] arm64: efi: Fix NULL pointer crash in 6.19-rc2
Date: Tue, 23 Dec 2025 02:55:42 -0800
Message-Id: <20251223-efi_fix_619-v1-0-e0146b8b9d73@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC91SmkC/yXMQQ6CMBAF0KtM/pomzqBiexViCJYpjgs0LRgSw
 t2Nunybt6FoNi0ItCHr24o9JwTiihDv/TSqswGBIAc5sUjtNFmXbO3O7F198Rz7ZhDPR1SEV9Z
 k629rr3+X5fbQOH8L7PsHLVOPoW8AAAA=
X-Change-ID: 20251223-efi_fix_619-3891ca7d2914
To: Ard Biesheuvel <ardb@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, riel@surriel.com, puranjay@kernel.org, 
 usamaarif642@gmail.com, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2771; i=leitao@debian.org;
 h=from:subject:message-id; bh=UFL3EYFptdWksL2TrqK20utlZjnMf15IQidFIh37P6U=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpSnVEfEn88+VR44GzKHbDtxIvHlHSEjjrsUc4Z
 UbZAdtQHR6JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaUp1RAAKCRA1o5Of/Hh3
 bVv/D/4xoP7Y2y+3fcB+zUfr4xmdyGo5n5zqDOli8tg0MB89tYdCdmkVdAYEMmP3vSKTXqClnvs
 UmrNtHWvGGzJYz5PIo+0Kl4WUqqptbSBIwmHGaJvKVEOtZFrTMZBV9if9ipzZG30ZnaMxLPbGZs
 mD3A8ViD32tj+U4sHI3yAuWeg/8oXXe19hP9nKi4z9FzFjoC6MQYlYT0etsbrR8yv/odZnBDCnz
 JipP/fejbbmkM1pUTy7gkR3jDrJXl2AopNSDNF9tHirQoZKuRMTXGvpUBjIC9GiEKDYVhEkskwG
 RNHb3wJjiPjkluPHGsEoJROxJLsbXoH/oDybAhg8sA/9rrm86lYLi0CDoFhqIWiCp9fPT6Z3WOW
 J48ClXay2ExTVxR3sxsQ4yxFL//XlDKp8z6eUSTCUZwN4UpEXk628sFIfqBeL/pgDY9nyehCJLi
 p0wiIiIfpD/pVZf+qFIXKvkRuFdb4Ok7VafjRFTJUxqdAEIL2t9/sVCX0de47D7lktxCi+7mbZi
 38hqCxb0nHW/tWoXkFy27ZDkgjCFtdhWpLh9KJmPValJ6pDFyZAwKV6Oe6wIHmxjViYKjwBKIbm
 iWROh78kfH/W1WOjwtQqe8LlRIA+jis99v58RIvBjtt/QCIW06ok5WKjvKIlx+c6djDZ4PhhhNe
 EExYfr5jjmGbHJw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_025607_225925_B2D121EC 
X-CRM114-Status: GOOD (  10.23  )
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

I am seeing the following crash on arm64 with 6.19-rc2 (commit 9448598b22c5
("Linux 6.19-rc2"))

	Unable to handle kernel NULL pointer dereference at virtual address 00000000000000c8

	Call trace:
	cap_capable (security/commoncap.c:82 security/commoncap.c:128) (P)
	security_capable (security/security.c:?)
	ns_capable_noaudit (kernel/capability.c:342 kernel/capability.c:381)
	__ptrace_may_access (./include/linux/rcupdate.h:895 kernel/ptrace.c:326)
	ptrace_may_access (kernel/ptrace.c:353)
	do_task_stat (fs/proc/array.c:467)
	proc_tgid_stat (fs/proc/array.c:673)
	proc_single_show (fs/proc/base.c:803)
	seq_read_iter (fs/seq_file.c:209)
	seq_read (./include/linux/ioprio.h:59 ./include/linux/ioprio.h:84 ./include/linux/fs.h:2177 fs/seq_file.c:158)
	vfs_read (./arch/arm64/include/asm/uaccess.h:46 fs/read_write.c:560)
	ksys_read (fs/read_write.c:705)
	__arm64_sys_read (fs/read_write.c:722)
	invoke_syscall (arch/arm64/kernel/syscall.c:46)
	el0_svc_common+0x90/0xe0
	do_el0_svc (arch/arm64/kernel/syscall.c:150)
	el0_svc (arch/arm64/kernel/entry-common.c:724)
	el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:743)
	el0t_64_sync (arch/arm64/kernel/entry.S:596)

This was bissected to commit a5baf582f4 ("arm64/efi: Call EFI runtime services without
disabling preemption").

After the commit above, it crashes arm64 with a NULL pointer dereference in
cap_capable() when running below (ocassionally). Unfortunately I still don't
have a simple reproducer, and it takes about 10 minutes to crash on my systems.
it always crash with below[1] application.

From my investigation, the root cause is that efi_mm lacks user_ns
initialization. When kthread_use_mm(&efi_mm) temporarily adopts efi_mm
for EFI calls, LSM hooks expect mm->user_ns to be valid for credential
checks. With it being NULL, capability checks crash.

This series contains two patches:

1. efi: Initialize efi_mm.user_ns to &init_user_ns (the actual fix)
2. kthread: Add WARN_ON_ONCE() to catch similar bugs early (RFC)

The second patch is mostly an RFC that adds a warning in
kthread_use_mm() to detect any mm_struct missing user_ns initialization,
helping prevent similar NULL pointer crashes in the future.

Link: https://github.com/facebookincubator/below [1]

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Breno Leitao (2):
      arm64: efi: Fix NULL pointer dereference by initializing user_ns
      kthread: Warn if mm_struct lacks user_ns in kthread_use_mm()

 drivers/firmware/efi/efi.c | 1 +
 kernel/kthread.c           | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251223-efi_fix_619-3891ca7d2914

Best regards,
--  
Breno Leitao <leitao@debian.org>


