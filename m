Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBB0CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oyw9vanLGG7tQ9dBSW9pJHSWXBGqZj5GxnQmef6pVg=; b=rkgdfUmO9Vd17q8tkiiyQ5sHEt
	G+dwLOpmQkPAJF8M+xO1Kpdy1cX+0OlBircOn/ml6CVav9QDhTVHO9/fflK5E2GM+jAfdKdaKrjOi
	rClhS/ZDqKs4d9y5GoyggAyMcdBlJtBOflSO4YXf6NhVtL/axpGPtGPrkeCdqXrRdQBW/uOjs6Foq
	ag2+9rx+qItFS/FEJVSsmqiqSdKkP4ZEVExVssjWtrbgw8dQeygx/fvYrlFDNnto0LxfHrx/Ne8+F
	wawqRXbQhb/08G2tpFWYeKUQlfoQOrLljFgYNof+BnYtJTe/lPJqJYHecOeCVnWRiWmw8PGkrtyGT
	lRAfpiSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd5I-000000046Mq-3Hho;
	Wed, 20 May 2026 09:19:24 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd5F-000000046Jq-38gZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:19:22 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-835386ff122so4772891b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 02:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268761; x=1779873561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oyw9vanLGG7tQ9dBSW9pJHSWXBGqZj5GxnQmef6pVg=;
        b=F0BC7GrQ9gz40k05v4xdh2evvBiag1cSC9iop9xn53qN2aJDBmUbtCOjJ3najRlZBO
         dTNzh8HkZtfRBLlvnVYwXhVpwMwW6E+EaiuJRB1jUspZO4CR5ZcR55WE/ZdNhRfzdf0e
         CDL6n/IlvbaKj3aF2uFgKBiQrHDRey1tIDEBUqn6YhTETkiys5vX1loKSztemkzJbqAm
         2RhwGH2paqIZENTEISkaNSHa7Cc69EF8LL7yu/13cBVT99+WBOH2XnXs2drZOPppQ5vX
         gBgSVM4wKTS3xN17+JYpUtafJciJAwly/XBPN+GI1hGN2+Y5HKYmzjEXaDx7jcBMiMIx
         +EPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268761; x=1779873561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9oyw9vanLGG7tQ9dBSW9pJHSWXBGqZj5GxnQmef6pVg=;
        b=Vw61xWHBeb2gzGlIJOQDzIQdAelXFw9auA3T5SAI4e/1s/bwyEiFEHRXfLpPiNohx+
         y2h7z3ugoQgqN9xbPj1PGYsBnq9EVLLeYtneLKOUo3eamSzNgn5wPkwhm10KWvbfCo8B
         2m/tQrtfihWWwsQALL+n7LdotBN8nGQnhyHA7QqUPrbM0VtT6oM0+UHOIH4JydTG7zZJ
         ModCX1QsO0lsekooU7d4MPAtxjPx8DuCykp7tup9gbHC7hv14z0CnanTshnW0aFHb1gP
         oz1Y0zqAhpKxa+vIJXxmiMrUizpeuv3VR+DCIVdOpwW6uUxsEHm/8ZcWgv9zydEQcYmT
         +cIw==
X-Gm-Message-State: AOJu0YzDR9WqIE//U8BIzZQCmFtIL3zVOR7FDxf0aQUPNZ2+VCDzWpLi
	sgJ6Ss6/gxJiaVRYOL9U8XweUt2tMUPXRlf61We5o6Ybjb7v48gJBuO5D2ofOksXgpIA667f
X-Gm-Gg: Acq92OETcPOcQIVaIguvPj2QcH8k9Mt2KckSfdOeFwjUgBMsTMwvbF2D3UwCH6Zk6Ev
	fgiiovsA7GV93+l6wt/NBWxVQ80cGaBhM+3nSLXFqItdrmxmlw18o4UVCRuvaxI4vEFCcS0hJFH
	BKaywuNLxjXRf1W3/58EuOn5ScYm2sS2I5KwPAWHNSmztaKh1xjCh57Smnf306t6rb6ZG1N8z1m
	2Ot2qI+KebOIB04zoaEerc3RaK8mqp82yTVX456qe9NHPncyXqnjkzZrRmuyYbxGt52lJ4iQ1KF
	XZX8wVOhVpPI+qo3wmh2YEZozZF4lV05LgsrC9RREpshWJIwMcpJl7WXRd7VTHwhLDkhEQIiCTK
	65+8I0VwGgo9frH375DpuXx1LEcesbx3L3axaUAtjYHYwhhOGCw0srMX72hBWupQgokcCEM1a7+
	gqoXCcfvlFY9Wpug3y3FoWd3pVHEfY/lfvd+yLrg==
X-Received: by 2002:a05:6a00:3289:b0:82a:7aa3:a2fb with SMTP id d2e1a72fcca58-83f33c9b2dcmr22248125b3a.37.1779268761111;
        Wed, 20 May 2026 02:19:21 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:19:20 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	leitao@debian.org,
	kees@kernel.org,
	coxu@redhat.com,
	tangyouling@kylinos.cn,
	songshuaishuai@tinylab.org
Subject: [PATCH v2 2/8] kexec/crash: provide crash_exclude_mem_range() stub when CONFIG_CRASH_DUMP=n
Date: Wed, 20 May 2026 17:18:38 +0800
Message-ID: <20260520091844.592753-3-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520091844.592753-1-chenwandun@lixiang.com>
References: <20260520091844.592753-1-chenwandun@lixiang.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_021921_792171_15F181AE 
X-CRM114-Status: GOOD (  10.42  )
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

From: Wandun Chen <chenwandun1@gmail.com>

From: Wandun Chen <chenwandun@lixiang.com>

Prepare for an upcoming change that excludes non-dumpable reserved
regions from the kdump vmcore and will call crash_exclude_mem_range()
from generic, non-arch code.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 include/linux/crash_core.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index c1dee3f971a9..0033d4777648 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -87,6 +87,12 @@ static inline int kexec_should_crash(struct task_struct *p) { return 0; }
 static inline int kexec_crash_loaded(void) { return 0; }
 static inline void crash_save_cpu(struct pt_regs *regs, int cpu) {};
 static inline int kimage_crash_copy_vmcoreinfo(struct kimage *image) { return 0; };
+static inline int crash_exclude_mem_range(struct crash_mem *mem,
+					  unsigned long long mstart,
+					  unsigned long long mend)
+{
+	return 0;
+}
 #endif /* CONFIG_CRASH_DUMP*/
 
 #ifdef CONFIG_CRASH_DM_CRYPT
-- 
2.43.0


