Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9180C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1eYeJpEHCAPY9Qi4Hjh6YOaoS1rocMPAJ4EFRgZ7L8=; b=P9VPG2o2X0ej4EUIk1Nc8R/fwZ
	rdBZK4qZs0BynYK7ajLPRD/W0pUMNSluzMb6suG6jEJ+MGmjZBUsfaJ5+CRjn6MKpAYqj+fDrTZey
	0FdV2ztvFvCDhbtf15BId7oL2FYMt1fYA/LrxrlzIyKjO+jipfjQw+QPZBQpQGNGnb6t1HfEDnR9Z
	Bt9G5/ezgUwaWQa6je+VDjXclzbsDea+hnkvm2beqOcc5xSRmwEWjtn/AWW82hYdq2OpjBDnXtFkp
	/Rr87lxrDtCkpDZZNO05R9Fvfeb3/XjMFsSR/PcJSmB7wMayU7RqyQ+5rtEItLoNr2QyY0fZVZswP
	pdsaAiIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTC4-0000000G9G0-1JQg;
	Tue, 30 Jun 2026 07:47:44 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTC0-0000000G9E5-0525
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 07:47:42 +0000
Received: by mail-pj1-x1042.google.com with SMTP id 98e67ed59e1d1-37d70036426so1870527a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 00:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805659; x=1783410459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D1eYeJpEHCAPY9Qi4Hjh6YOaoS1rocMPAJ4EFRgZ7L8=;
        b=T1wSBuc6g2j0NttgVPFu6Jp0dmBuMD+XRqQTk7l+VY8jsXNfUJ3hlviPxU8Ct0G2Ad
         psOLcavGd1g21/gEusyNj2gLPZUzQE2mD3jMbbdmndAt+du1SygmSoNpY1bjnzhChcpe
         tsJ+CdNIlXePb2hvIqWC/4Rv8ym4+vh4qosIxfuOhOpRkl67BNHQmTMo03uzmYMgsMgj
         AvRmjmOhY/7U8AwsIn0Vl/MIMh2dU4oepyohJ/q/p5mh52KCN+v6ElXcjefQeRdAPvl+
         PELofXxnenmTXcjhZevynqNgGCKfKDmHyiY6Ag8gsES3hA9ci4u3qzHHLtG4dviVTWpf
         S7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805659; x=1783410459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D1eYeJpEHCAPY9Qi4Hjh6YOaoS1rocMPAJ4EFRgZ7L8=;
        b=ApSmvZ2lEZCM6d7dVtMY7HtTKCsFQJBwty6xeqp31hElpvld/auOlNcf610b7B2bgS
         S6AbOewytrovYZWO1JajLaW8CPKzswW+Ly8P1fdoKfEaSsUE+UxzpeRWTce3vbFXZyWd
         Na1N8AAv4UpmkKr+QgggIvqMkDHr8N8BEm8vCc6AzxtjyQ316zHb2g6TlIg2mUw8oZNH
         s+iQTOcIrk+C9cHeB9Gb5fe6cVLPMJmexwCyJyruprsv1R4TYQoiWSAbpGTjwVfaz8/Q
         DNZ4bgXyVyEcq9i9DFGhkgaOeirIkr/76nANj177UrGawdrz8TT5NuH03Rsz090vf0Js
         lU8Q==
X-Forwarded-Encrypted: i=1; AHgh+RphUAf1xq30QlKj9OCv1F76gU9V1hdnm8NFS0whMFjB6B9t/KKzUF+xQRcbPzzAfsKsCiohNpL2vtR22t7voZRv@lists.infradead.org
X-Gm-Message-State: AOJu0YwHo91Fgfwbd0mGMoGe/nrLcjPFo/nIsW29SiX+G8qoJdWpwzdb
	uCzieJkliSbgqrqiVgBpY1/lqkJgg/NKAqlldk14A7MUo1NnK3aKlkF3
X-Gm-Gg: AfdE7cmwrBonCBkgaBPd+TjliCdkckijRkL8bwOFed2SDzHX4Ttqnv1eTjOlRLI+mL8
	x5MhFYH+vpsSKQd3Dn1MdiZWzlxBPWtqpkuuTUac9aurk6rgnOftv/XO9rNzZ2oUKLHKGsOrAC5
	r52Ym+wyMq3du5OKhgqX9zHzD5hL2U7bGo2+rNhxyIoIHv3NjMBoaMHenz3uLT/YbMCbOdQizBg
	radwXcV36Pk6cOrVujc0KvuGLFlhcixhj5i0dKLMNOp2+Gbf2XrfdW/weP3zsfy27VxojVZI7bP
	2xnfds1DLdXlz7L/7+h7oaHIKftEaXRQWHyGkaZN/tTt6W2kEY7AsoFyDVM/ROK201WI9IJYaTX
	WImmue45/3D4ujBQqZRY+ckSMqzQ2NopLNOF7WgUFaFYnPZ1SSjU76ySptBeHcALAzIEikTKHZS
	aeSycDDyjTgXClwHZXpdaYHHYhuQ==
X-Received: by 2002:a17:902:d58f:b0:2c9:fa31:850c with SMTP id d9443c01a7336-2ca2ea33e96mr19629385ad.39.1782805659205;
        Tue, 30 Jun 2026 00:47:39 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:47:38 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	bhe@redhat.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Subject: [PATCH v4 01/10] kexec/crash: provide crash_exclude_mem_range() stub when CONFIG_CRASH_DUMP=n
Date: Tue, 30 Jun 2026 15:47:05 +0800
Message-ID: <20260630074715.4126796-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_004740_062261_78ED81AC 
X-CRM114-Status: UNSURE (   9.87  )
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


