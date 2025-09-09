Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D26CAC589
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 08:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1acfgimCOFblXvFIi2ykb4JvdpnCtTT9WTI2WJXrlYg=; b=TWQVFuIH/u/1su3miYA36a+Zm8
	OAyykbeWDvL2zMiTQry3hp9gr192AS8wEv4XYPidoyJUOlVUo8XsjQ4cdTqRXGlzkMKtCY9uNnRAy
	hrcB2GFELj+HkQzRE1u47DX+hc7AxUV9j3iubpoaj2TnGH4t71SfbHUUuzA/TOv8AlMO5gVovtlx0
	X6qk89YL52k4getUD/B34+cNN/phGDx+Dog1goDgGeIrjIARC9+cf84dpzEbQHiy4z65Y2uUScZg/
	l8aoFslC36kUSocUL5BZoY0VXBpa7DKQmEHmBc2fVhbj3cSETPx/RaQ8ykOznc9hLGzbrShN4E7go
	eArUweqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtIh-00000005PKU-1SPF;
	Tue, 09 Sep 2025 08:02:03 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsO4-000000051mL-0xOY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:03:33 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-323267b98a4so4836115a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 00:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757401411; x=1758006211; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1acfgimCOFblXvFIi2ykb4JvdpnCtTT9WTI2WJXrlYg=;
        b=Esa/tQ2swEB1o2VUoDaMVhWbeqs+9zZo/H2i1+dqAoppvR++nOqacQ/R/EIXCDavJa
         IaXnaXHM/W8DEVeDEcyBxFJCavgl+93fnsdggQ2nfErQj/7FssBP18oK1FxM22NKCIl6
         v0NlIJxuK3AOTxJBsf77RnuCkHXzof40Pm58Dbvw5YMVcTNV09UZXS7wl+TazvFZ28LF
         sspnGshDB3T9oeG/Na7jkwqmq647OA8uVb7hD4TOGNJCblLbPcM2X1yUegNB2RDugQNu
         Y16qr8iQanw0DysfH9w7A+QRUw2oVUif2XIxFHxQWGZi40cNcDJQB4Uy9/MNBN5w4SyA
         BsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757401411; x=1758006211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1acfgimCOFblXvFIi2ykb4JvdpnCtTT9WTI2WJXrlYg=;
        b=DD0/7qMIuQMD+3UVEMe59N7YSyeNWOMdCAq7OOl0xj49igFvcX9MRcdY3cUXw8kKq8
         Lvl15Dvy+Lvou6Yl0HN/vy3jr4T71LBRNC4wctqeG9jg4Bs30+/olTqd6TvSDoX44lAu
         6QVsJj4kN+lxZhvAWsy+VE2EKyFBFFG2C/9whbAz+iE50fQIcEl+DTZmQNvXEc5g+EUW
         Wn1ADWXMzLGewOBWCXj5kfqJReIvIZJCiDCXSjcpNh5SOI67PpjShCO2WlOtX1DoWxds
         Olvyqi1HtYarWG1Lo3IC7466IICPxufbkmuZoyo5zcbbF12EQsot0a2sHQdDd3lvPdhD
         mKmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIyv9XkQS/0l6wo9kA/PlqW5WfkbJ3mFcs7OM8aJnWYIUJRQPr7hThSfeSJLPVP9f4E/ySwJ9vkHC4+WpL5oSL@lists.infradead.org
X-Gm-Message-State: AOJu0YwndV+gjUmFuid86r+b7DhH8PG8li55AmGDsLIJj4zZkw24Bd/G
	2wiTYcmfGkNCHFDHthMgCt5P1N9TRHip3DEHZf5q/zfFsgfKKdIQwlBCENtA1OfPNbE=
X-Gm-Gg: ASbGnct7i6Piq5MSd09ZJooXnPb8rqMtgfEPilz4Xnspqc09WeZEOz/UCdnxUF3/qdO
	rfFbrM9LRbmfhLRWR13R1i05jtLYSLBovUOIHFsS7PiPSGeOjDkdw86W0AxeuWAZPnSouETZdVz
	2TLb4SgHESkyYltMI5NCyg2h+2qHai9u4LNKVETfm67Ixj34+adknmDobrwaePRWPkcQHnithwF
	Dzds6YT0jWgdr3vyOvD5xXk89fiCKZ6+vk0W0lVZOVkspfNS+3cPZVwwBunQYutgzvzKHNs8qym
	IFpQkHbl+8G0+TYseKDfLHRYRDInAfIXlmFSS+BAdU66+zpy5t0rz3GmtAWa9q2fkHx9U9g9DkV
	7fbrCfWMuC6ekwuvGG6b0Wzufag63As3IcnY=
X-Google-Smtp-Source: AGHT+IHkDiF/6YwaQUzgE/xNLZqLa3zDoLihcHBPhzjoYmHrHw+d+76R53kpaEg8N/1vJrkgHwEwEw==
X-Received: by 2002:a17:90b:35c6:b0:32c:2c5:e21 with SMTP id 98e67ed59e1d1-32d43f85d9emr12290210a91.32.1757401411327;
        Tue, 09 Sep 2025 00:03:31 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7158sm1025535b3a.72.2025.09.09.00.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:03:30 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 09 Sep 2025 00:03:26 -0700
Subject: [PATCH v6 7/8] RISC-V: KVM: Implement get event info function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-pmu_event_info-v6-7-d8f80cacb884@rivosinc.com>
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
In-Reply-To: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-50721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_000332_273500_9B295310 
X-CRM114-Status: GOOD (  16.68  )
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

The new get_event_info funciton allows the guest to query the presence
of multiple events with single SBI call. Currently, the perf driver
in linux guest invokes it for all the standard SBI PMU events. Support
the SBI function implementation in KVM as well.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_pmu.h |  3 ++
 arch/riscv/kvm/vcpu_pmu.c             | 59 +++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi_pmu.c         |  3 ++
 3 files changed, 65 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
index 1d85b6617508..9a930afc8f57 100644
--- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -98,6 +98,9 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long saddr_low,
 				      unsigned long saddr_high, unsigned long flags,
 				      struct kvm_vcpu_sbi_return *retdata);
+int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low,
+				  unsigned long saddr_high, unsigned long num_events,
+				  unsigned long flags, struct kvm_vcpu_sbi_return *retdata);
 void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
 
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index f8514086bd6b..a2fae70ee174 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -449,6 +449,65 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 	return 0;
 }
 
+int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low,
+				  unsigned long saddr_high, unsigned long num_events,
+				  unsigned long flags, struct kvm_vcpu_sbi_return *retdata)
+{
+	struct riscv_pmu_event_info *einfo = NULL;
+	int shmem_size = num_events * sizeof(*einfo);
+	gpa_t shmem;
+	u32 eidx, etype;
+	u64 econfig;
+	int ret;
+
+	if (flags != 0 || (saddr_low & (SZ_16 - 1) || num_events == 0)) {
+		ret = SBI_ERR_INVALID_PARAM;
+		goto out;
+	}
+
+	shmem = saddr_low;
+	if (saddr_high != 0) {
+		if (IS_ENABLED(CONFIG_32BIT)) {
+			shmem |= ((gpa_t)saddr_high << 32);
+		} else {
+			ret = SBI_ERR_INVALID_ADDRESS;
+			goto out;
+		}
+	}
+
+	einfo = kzalloc(shmem_size, GFP_KERNEL);
+	if (!einfo)
+		return -ENOMEM;
+
+	ret = kvm_vcpu_read_guest(vcpu, shmem, einfo, shmem_size);
+	if (ret) {
+		ret = SBI_ERR_FAILURE;
+		goto free_mem;
+	}
+
+	for (int i = 0; i < num_events; i++) {
+		eidx = einfo[i].event_idx;
+		etype = kvm_pmu_get_perf_event_type(eidx);
+		econfig = kvm_pmu_get_perf_event_config(eidx, einfo[i].event_data);
+		ret = riscv_pmu_get_event_info(etype, econfig, NULL);
+		einfo[i].output = (ret > 0) ? 1 : 0;
+	}
+
+	ret = kvm_vcpu_write_guest(vcpu, shmem, einfo, shmem_size);
+	if (ret) {
+		ret = SBI_ERR_INVALID_ADDRESS;
+		goto free_mem;
+	}
+
+	ret = 0;
+free_mem:
+	kfree(einfo);
+out:
+	retdata->err_val = ret;
+
+	return 0;
+}
+
 int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu,
 				struct kvm_vcpu_sbi_return *retdata)
 {
diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
index e4be34e03e83..a020d979d179 100644
--- a/arch/riscv/kvm/vcpu_sbi_pmu.c
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -73,6 +73,9 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case SBI_EXT_PMU_SNAPSHOT_SET_SHMEM:
 		ret = kvm_riscv_vcpu_pmu_snapshot_set_shmem(vcpu, cp->a0, cp->a1, cp->a2, retdata);
 		break;
+	case SBI_EXT_PMU_EVENT_GET_INFO:
+		ret = kvm_riscv_vcpu_pmu_event_info(vcpu, cp->a0, cp->a1, cp->a2, cp->a3, retdata);
+		break;
 	default:
 		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
 	}

-- 
2.43.0


