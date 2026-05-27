Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5872CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 03:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1eYeJpEHCAPY9Qi4Hjh6YOaoS1rocMPAJ4EFRgZ7L8=; b=UnXBVMoSNtXE4VaJy8yS7QpajW
	MknNjA1lKPdzCHRKnlSItd6QQCwDzEgs1YscUnXcwH+1ucMop/xlOQklr/JuD21ylfsd2rlVFQdRg
	DbtuCDH6zUUkgi3lxdzFgrUYWf6E9chED2QBLnq9sn+MDaRINcLpBGz8bXbAPfkECVfhUDt8arm0g
	s0kXYAmHUq3CaXDPZFVbr3Ice/GrlibpSnXoZX0CuNeB5liE446zGPS1xL+EIcLHzlg7MJ/yfagpg
	zjeKK0mB0uMitWYenVxpPJcDS48c/AaH2NKxLlUgQucBICI9QviUHCKS80Bsw5YGGKzm3LpZxg78j
	A+tFRv3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4xu-00000003EYT-1wXp;
	Wed, 27 May 2026 03:29:54 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4xr-00000003EVu-1LQk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 03:29:53 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-841513664bbso3083509b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 20:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852591; x=1780457391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1eYeJpEHCAPY9Qi4Hjh6YOaoS1rocMPAJ4EFRgZ7L8=;
        b=njw45fy92ZiCRoVDIOGyWIE8L7TZlg4oajZAiHz59EY3D8No8sf6wOrW+F1EAsQt9y
         jKyvszQCDK7uqs/0MkMXdZCaEyQ95upL16WJfqPV/HCodFXK8rzMAdKcqz4fAPZA5tNI
         IkNKPOIhqMOBNTO4OaprYhxpVVbEWiHtRjgDz4R/J3ihyJcccskGOtt3GP4p2YdaCmYM
         KI5u3CyTzEztUFbh0pFgTonINAnsXuFXtVIzXDejEhf0i8Yw6vzP3AkywDaYE167OoDg
         4H8oNqij5p98iLHY0IhxtJblkwFOGpsh/DLG0GxtWjzev3NUfY6Dj4w2831BeQt5BFH3
         uYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852591; x=1780457391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D1eYeJpEHCAPY9Qi4Hjh6YOaoS1rocMPAJ4EFRgZ7L8=;
        b=flWUjur3Qtm0mF6h9LLtRJHJ5Snybb9Y7bwWSzHXiO3pvPYq/nWCgKzW8WaTh9cU5L
         05VLIHPSmzfcdCcd//ddXKK/gSWZaVLipBAoX8ZIRQiC6sjPY8Z0GgUU5VVSOgJ90e6+
         eDEkjccTZHp06KHwKuF8PtwxjLKCNpzVI4yc5qYgcWOsqLC9EpkcUaM1iD/qhtwWDIQO
         Eg14NOc5FbRZ0hNmcpNxTfMc1swTuIx2xSWigftyJDn8BpsDH809y2wbqjJBtIhwjiXJ
         5SywDKqr499bQpzcStEiMrMbuuQmCj6veP4w3ygsyfjn5z7S1zQUhd//5SOwU+DQ3wEv
         5zsA==
X-Gm-Message-State: AOJu0YyjEhQCaqY1JB6C6fdwC8Ya2i9AwCQM6kg4ziP7SxDRqba8wyxw
	RFzrsSfgLNeiYaf9RIEZeOo7mbJBJKzsxLjO6rr+ExGcJvEjxTN0THTFRaxZEb87bqHJtg==
X-Gm-Gg: Acq92OES4cKKmuN9b5HWsd1q3EYgx2W1hCXGWtNGry3lhY52TnrGX7z8ddL/EBxnkNj
	nCvoXg2657xwJoDOnE6y22zmZ/ZdkJqxJrA8N1jtDyhLDbu4wEJ/fEEJUJd1F4LP9QH7UI/5Gv0
	HBP7XwBAfwFGPuzhLYXakW07UkIrBDB9OEMi/GZLjBUP+rS5pnMCLsLeJhArb938DvhLYM6Qkcz
	+Wro7bxj/EnYKAVt4dEAuCLUEqthYXTqonMxKYmpNxwVK9WrxHPkwjM8Uy51WoiTnBvmeKJ1S34
	nWARLaqpqtLGHFVCLzht5JjvAh5XkoP+AiW95flKtF6MjxdZCkSFpHimIEFGzZi8Vt6SRoWBkIs
	dLbX142tVDjYltnwJO1zgrVMfzP9JVUDSI4bHtq/PmMNMOUvYR2jPFYE5E6SI01AvADA9sWDltE
	hPXfU0kspL2DUvKgIIv+Oiz9phsOU6jGka7b6P
X-Received: by 2002:a05:6a00:b483:b0:82f:6de5:90e1 with SMTP id d2e1a72fcca58-841611e8e64mr16309875b3a.24.1779852590643;
        Tue, 26 May 2026 20:29:50 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:29:50 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
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
	quic_obabatun@quicinc.com
Subject: [PATCH v3 02/11] kexec/crash: provide crash_exclude_mem_range() stub when CONFIG_CRASH_DUMP=n
Date: Wed, 27 May 2026 11:29:08 +0800
Message-ID: <20260527032917.3385849-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_202951_366683_073A2BE3 
X-CRM114-Status: GOOD (  10.37  )
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


