Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87005F5545F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 06:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ijh1gRZ/vz98nkJ2ibune9S4XQ/SnjSEuxpGe+HaeR0=; b=CyBRRqQunaSLbpuRfRxjoQIRq4
	WyJPF+MaYT6aq/ON/CrtKNIvAqGmE8HLNBxc2bZY3nfYACyqgqC6Gls7B0KWfb53Ve2f/sgFUYq89
	MHUL71NhxmhBcBr1Ih+7HihvrkWw2KT2z/9d0s9W78Yo03vWZ/46bWdEb/N+NxdDErJVir8v5j+IL
	+jQpzh6CejC+PWzPagGXOLfB2hKtJvuY+fZ1M/3SAOBJBZ3ZIBSNzmT9RUeonuxFbTdwtYPbukFTS
	h0GTm6xeiLagKUU/Xq78EKjTnzxFQ32ggI20lZlLLPgjUTesckoxlwN9VZ/XoptM1Dh8bSZ1hT35o
	89/QkchA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv80H-00000003H7r-0gsc;
	Wed, 25 Feb 2026 06:04:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv80E-00000003H65-34wt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 06:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771999445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ijh1gRZ/vz98nkJ2ibune9S4XQ/SnjSEuxpGe+HaeR0=;
	b=DSiEHwEgSpg+NZ3/tjJe/1Vs355QfowRJDnfbzbVwwAwxOnS134LWtf+K3wTCsAANq7Yb8
	RV3brwQaWKJTx3puQTjI4i5vvZAmwEsPz2Ax++9CLcgKtAfsmvWFf5RMPwkU+BxieKcf77
	v4NsY8VigCItSZdtUuqDuX5/vof9tuk=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-9Z4fiFK9OQifCzlf_GAz7g-1; Wed, 25 Feb 2026 01:04:03 -0500
X-MC-Unique: 9Z4fiFK9OQifCzlf_GAz7g-1
X-Mimecast-MFC-AGG-ID: 9Z4fiFK9OQifCzlf_GAz7g_1771999442
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ab0b2e804cso11292995ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 22:04:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771999442; x=1772604242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ijh1gRZ/vz98nkJ2ibune9S4XQ/SnjSEuxpGe+HaeR0=;
        b=vlxYxqdx55bRA+8JDp05HY3LIClImOb+o21SEFYNzHDWP5iylmcgysQ0zKWBG6JOsi
         uF42P0tnBecpXYeJ+zGLBTNcUBprEMloPcnSxfzpzDDbTFtt576j2PFuYQ46n84lgcau
         0pSb2Y/drdAAqvs76EJcqkqfSUIdgGiSIdrpqHGbWSVUMvzvEBmhV/P3Td/yMRtR09jO
         l37snKvG6F8CH+LY+TMG21jpdbco/CqE6qCy9Xbngcy06rNsIyj2vx6xt1UpoHFow6M7
         RoIc/xtqLDQsuIR96ZSILlbK36t3POGxYCOnC6au1dHRrCVG7t1CqZRY9pM0u/spXQjv
         IHhA==
X-Forwarded-Encrypted: i=1; AJvYcCV4nslJ/0gIJ/CQrNUlNcek1pMJN7C13sYGphmIFiXp3uedo6YDAbUSnpAmreyZltdJoD/esMwVxA0y+l6dIxPw@lists.infradead.org
X-Gm-Message-State: AOJu0YxoQSh0In3DwATCmDfjfPC2QH+/fKYi3d6pa/+SK7cDemj7q2Aw
	s5BTV2IQGqvi5Hzv2/6qrR4+F/B6+aFn6O/5ZAdhB40+4E/c8tsLmRkTE6sFG41DaEiXyx+U3WB
	RPseGTn7+in4lDCzH07yMn2/stHZJckEPwX0GTcVg7lcQHXE5GdrrkCTbwIArA31IBTD7n81iLU
	P1
X-Gm-Gg: ATEYQzziLqy2Mkos7hKEmn1FUvTCC/J4U0rzDbgOhhQd481g96GfBgDvaLoIerhN1Ym
	3s35mMuNN8v6UkVQJyL0fHrpcFxn7HT1jkf/Am7ZuhuBqoMZX2tIlKjK2RdwoRTqmraEx/WbrOd
	gDK6Hn96zP19lnGF8zQFhxMU3DfIkk9zxoremIM/wx2TvJIZurA4FYDLjqjDxuK77El1ExJsLEt
	kq1HMrPo9hJC0CVQNvfdtndAVNRx++7u0oZwYVaSZklMDmICDcnfTBNvYBkKylF03iypSc8J2ro
	v057B7kSxU2p0ThNZLHMa4f7vO8yus2wpD13xeMfPVOq6Y/Xwq+Ac7upA8SA7tS7QGQSxV7RhLM
	KOcNx5C+dYmGX
X-Received: by 2002:a17:902:e787:b0:29b:e512:752e with SMTP id d9443c01a7336-2ad74556edbmr127353835ad.47.1771999442355;
        Tue, 24 Feb 2026 22:04:02 -0800 (PST)
X-Received: by 2002:a17:902:e787:b0:29b:e512:752e with SMTP id d9443c01a7336-2ad74556edbmr127353515ad.47.1771999441818;
        Tue, 24 Feb 2026 22:04:01 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e3507csm127703285ad.8.2026.02.24.22.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:04:01 -0800 (PST)
From: Coiby Xu <coxu@redhat.com>
To: kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 2/3] crash: Align the declaration of crash_load_dm_crypt_keys with CONFIG_CRASH_DM_CRYPT
Date: Wed, 25 Feb 2026 14:03:45 +0800
Message-ID: <20260225060347.718905-3-coxu@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225060347.718905-1-coxu@redhat.com>
References: <20260225060347.718905-1-coxu@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ykL3eNd5iqmoEjVv_wxP6tII3QPFQuPFKoYIOqi0lBk_1771999442
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_220406_841141_830EFDA2 
X-CRM114-Status: GOOD (  12.97  )
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

This will prevent a compiling failure when CONFIG_CRASH_DUMP is enabled
but CONFIG_CRASH_DM_CRYPT is disabled,

       arch/powerpc/kexec/elf_64.c: In function 'elf64_load':
    >> arch/powerpc/kexec/elf_64.c:82:23: error: implicit declaration of function 'crash_load_dm_crypt_keys' [-Werror=implicit-function-declaration]
          82 |                 ret = crash_load_dm_crypt_keys(image);
             |                       ^~~~~~~~~~~~~~~~~~~~~~~~
       cc1: some warnings being treated as errors

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202602120648.RgQALnnI-lkp@intel.com/
Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 include/linux/crash_core.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index d35726d6a415..c1dee3f971a9 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -34,13 +34,6 @@ static inline void arch_kexec_protect_crashkres(void) { }
 static inline void arch_kexec_unprotect_crashkres(void) { }
 #endif
 
-#ifdef CONFIG_CRASH_DM_CRYPT
-int crash_load_dm_crypt_keys(struct kimage *image);
-ssize_t dm_crypt_keys_read(char *buf, size_t count, u64 *ppos);
-#else
-static inline int crash_load_dm_crypt_keys(struct kimage *image) {return 0; }
-#endif
-
 #ifndef arch_crash_handle_hotplug_event
 static inline void arch_crash_handle_hotplug_event(struct kimage *image, void *arg) { }
 #endif
@@ -96,4 +89,11 @@ static inline void crash_save_cpu(struct pt_regs *regs, int cpu) {};
 static inline int kimage_crash_copy_vmcoreinfo(struct kimage *image) { return 0; };
 #endif /* CONFIG_CRASH_DUMP*/
 
+#ifdef CONFIG_CRASH_DM_CRYPT
+int crash_load_dm_crypt_keys(struct kimage *image);
+ssize_t dm_crypt_keys_read(char *buf, size_t count, u64 *ppos);
+#else
+static inline int crash_load_dm_crypt_keys(struct kimage *image) {return 0; }
+#endif
+
 #endif /* LINUX_CRASH_CORE_H */
-- 
2.53.0


