Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327F4C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 18:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGsO74qlfZsPi9kGTe6Mf3rItgKav5O5SJKk6N7d7+Y=; b=2+SUCbBQXH5NxKQkahRjdAibRI
	t4/4BdrIIdcq7RTDNj0lEKThGOYO1d/m8csOJMC0sj9w0f5XFC14xfs4FbGvc13H9v/qBCO8hE2z5
	blSlTINi8g1WS5m5YLMbs3G85QfWFoUxZRXpGuj4wrmuftyHyGawSN582xpXx8KfKswWMsZNDm9/i
	rR6fZMFGuP219GpdNgF+/yo90X+XDrAW04EFKVBamHmO0NwBhViNfKxNCjbccJtzDvIF3/8dLK93D
	8UmyslFfCkb+tz9leWlcsMNQZ7R7aO49o2JK8H5VyVuhWvG9bpoVlxuFv4CsJjrFalJQ4CP2xdJd1
	gSwjqyBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8KR-0000000Cnk8-3lrR;
	Wed, 15 Jan 2025 18:41:23 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8AS-0000000ClH3-1XGU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 18:31:06 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2165cb60719so129037425ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 10:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736965864; x=1737570664; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eGsO74qlfZsPi9kGTe6Mf3rItgKav5O5SJKk6N7d7+Y=;
        b=wNmOjhd1c8hCYRFvTLrna97YGhT9ZZAOG9Av9zRxwpiu6Unr3OYYvk7kgbGC+hAdp/
         GrvmTNyKZXJbgr29wwUY0JRCC+aKkfTiRTVTJabJ5pJstVILrgiGLFmT8e1Z/rzFzisx
         2ztUoReBM3w/siIa5m5aY2EGzQB5hjVb5W92S2MuenA32N+e//A2GVQOkVDxpQcjWS8u
         vH7ktemggKWeyprK0JOsznelI9C7DhhW28nHfqPlCQTuoAKTJEwymbiYeSQebgdaCCQI
         /ddR+T/xVjY3nYYgoPOUZRS/FvlajgYy689Mb1QX9pG5f0jjMS48b2hgk2f1lC0jpSEg
         E5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965864; x=1737570664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGsO74qlfZsPi9kGTe6Mf3rItgKav5O5SJKk6N7d7+Y=;
        b=G5WNCZSi0rxiXySQ4OeYCXs2hoyux6MrS9G7eMzbNWHjmGk17wmnjtvsz49lS30d2p
         jzZNstTu2XWDhBevzAQFuD09491OkFeRkmp9NuZcduZMgLW2Cr/QKeOsMU7L9kQPabfx
         HopjP/akdtFjNlsY9YEfzqAjUAqeG22vPQeVWQDguv9EzwMVDecDq9CiTBFI5mraYB4p
         CQAG6cONOYPp02p6O4xtS8uiUM58JQrJ7PEtjIn+YOSOEYfAdULkx36aU5aN6PC7URti
         CbB0ARk1P5Fkbpcepxqp0AjRd9lsmUxBOBhnsYO0wZfoYrgleqxMIx07AbD0iVa14xDt
         1EFw==
X-Forwarded-Encrypted: i=1; AJvYcCUOarOEYGRWyI74g+uOe9b5LWuHhpUDY4oYP27NaQZa0eawvYnovsXsfZ7uDWln5TND1d5dnBEA73AYRtJthoKC@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq2Hx6PnVLbA/EWfmSritrRnspEB2HAXtZFxlxNMqbTveRyT2i
	Azs2IJsmeCHTOiC2X0HoYinI65HBPlDWww9FYnnLG9ddt+2wkm/RoVCUeAs+2l4=
X-Gm-Gg: ASbGncvruB7R5MHzEq5ivztdpwJdBpTXwivSxwBVltFzxiezLgHH/Uw++qpWtlk2tCf
	/Y1YNwRMvx5xl3O1td566gyxtntxHe+HXScjvVL6COhZ08Mlqzv9KMtQ14wzP/CMslBbF6WQa3K
	SluhLrbnCyeJQag6BOzHWwuXTOsoppU7xbQbeUp3JNIr2bm8vyTcU8ZS0zED35VA92UY8ZcuPox
	7EFHyFU0g1EjFPIYYFJRfbSzIxu9wEw4aeF4CDwFX0jlaJn0l4DMMsS/LkCka6Z07aTtg==
X-Google-Smtp-Source: AGHT+IEVuy0zAtOEk7axH9BqkY46Q1CUJK/CsgMJYOIS0qmHtHOLlyWCGQnQHM7bf0KJ01YfA5xjlQ==
X-Received: by 2002:a17:902:cccb:b0:216:6769:9eca with SMTP id d9443c01a7336-21a83fd35bdmr452990815ad.37.1736965862343;
        Wed, 15 Jan 2025 10:31:02 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm85333195ad.139.2025.01.15.10.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:31:02 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 15 Jan 2025 10:30:46 -0800
Subject: [PATCH v2 6/9] KVM: Add a helper function to validate vcpu gpa
 range
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-pmu_event_info-v2-6-84815b70383b@rivosinc.com>
References: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
In-Reply-To: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_103104_416455_D2A37B97 
X-CRM114-Status: GOOD (  14.18  )
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

The arch specific code may need to validate a gpa range if it is a shared
memory between the host and the guest. Currently, there are few places
where it is used in RISC-V implementation. Given the nature of the function
it may be used for other architectures. Hence, a common helper function
is added.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/kvm_host.h |  2 ++
 virt/kvm/kvm_main.c      | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 401439bb21e3..d999f80c7148 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1363,6 +1363,8 @@ static inline int kvm_vcpu_map_readonly(struct kvm_vcpu *vcpu, gpa_t gpa,
 
 unsigned long kvm_vcpu_gfn_to_hva(struct kvm_vcpu *vcpu, gfn_t gfn);
 unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcpu *vcpu, gfn_t gfn, bool *writable);
+int kvm_vcpu_validate_gpa_range(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long len,
+				bool write_access);
 int kvm_vcpu_read_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data, int offset,
 			     int len);
 int kvm_vcpu_read_guest_atomic(struct kvm_vcpu *vcpu, gpa_t gpa, void *data,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index de2c11dae231..b81522add27e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3283,6 +3283,27 @@ int kvm_vcpu_write_guest(struct kvm_vcpu *vcpu, gpa_t gpa, const void *data,
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_write_guest);
 
+int kvm_vcpu_validate_gpa_range(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long len,
+				bool write_access)
+{
+	gfn_t gfn = gpa >> PAGE_SHIFT;
+	int seg;
+	int offset = offset_in_page(gpa);
+	bool writable = false;
+	unsigned long hva;
+
+	while ((seg = next_segment(len, offset)) != 0) {
+		hva = kvm_vcpu_gfn_to_hva_prot(vcpu, gfn, &writable);
+		if (kvm_is_error_hva(hva) || (writable ^ write_access))
+			return -EPERM;
+		offset = 0;
+		len -= seg;
+		++gfn;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kvm_vcpu_validate_gpa_range);
+
 static int __kvm_gfn_to_hva_cache_init(struct kvm_memslots *slots,
 				       struct gfn_to_hva_cache *ghc,
 				       gpa_t gpa, unsigned long len)

-- 
2.34.1


