Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21702C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 17:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:MIME-Version:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3rl9WRlfF1qhC6KkWtM+soeUVUGORv4VBrHtcu1jow0=; b=mzRCmINYsBowfYYd3si1TFmMmF
	bAflFOW9ZucbFU+Gvg8N1GZtsalZrAHT0AsEfKd7l1OWB/hLBkVJ+RLv1JkbmzR+gB9RdvsJHVhz6
	ifvvZIiUlYKSwuE0BEn+JxS2teX9UdKBEQdyG3yuQMc6hwcZVYCvEwu5WBE+LySSOCW2B5W4SmA6C
	uIHcFHjAp7jHPLtfX6hfvQXwdeFKfk54NN3KJAcwJ3KhReM4iBvS+4k3VMqtp4c/JtyzHYr/ceefk
	D4T4/jNwmEUETs6aPmYpJp0ADQ0wkMgh6f6iJHkygR8yfj1GdVQnNKqsKPprXVPIDQJ2VJTsgQZny
	PW/s7QlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkOJ-0000000AIzK-3Evq;
	Wed, 19 Aug 2026 17:47:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkOD-0000000AIvX-3PTC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 17:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787161669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3rl9WRlfF1qhC6KkWtM+soeUVUGORv4VBrHtcu1jow0=;
	b=VsmALW2b9PW9eeDbLQd+MMepzYD+KRYM/ori8SWkMhHsSPhg1ySBZegQqC5fZfNu3X1JLT
	pAuNZ4G9LLwWeyVqHepjcfLsQWrLXDRNKqvPZu7Ic9MTenhIguDIRkJjfn/Rl8OvzPicH4
	tNTYXd2aFApDgJ6Dhf0tJv0+rGoGC2A=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-o191-8EgOASYuwqBLVw5iA-1; Wed, 19 Aug 2026 13:47:38 -0400
X-MC-Unique: o191-8EgOASYuwqBLVw5iA-1
X-Mimecast-MFC-AGG-ID: o191-8EgOASYuwqBLVw5iA_1787161657
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so3056827a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 10:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787161657; x=1787766457;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3rl9WRlfF1qhC6KkWtM+soeUVUGORv4VBrHtcu1jow0=;
        b=pEGZVEvw6qFbv3A8h0zf1NJ3BPJxEHWYNTZvkJQuSzWhCIZGCGZIyFZK95LqT2CgQr
         bcww22ARt/TS1bu3iZ40m6Z5YPYsa60OnIIJceJjyM9mTbMDPJ1Qr0bYZzMlav9mAKFO
         dRuOp4oCEkNGgCukMv++nrfAmz6IWuVmU68aUIpLKXlwpdWdZZRdTnV9g4CJ2hq8cEjQ
         UTWjz3enwkVRL41MVczUduVc48RVkw5dWJh1kqsxsW9YTEw1d4oypOs2FmzSD9Jnr9Lc
         ogh3n/wGpqTJJakdcRquR9ws4wpQ5O+xq10Qhn3UYeWhxbgyPD5OT/++H+ZGF11AQeO4
         2q+g==
X-Gm-Message-State: AFuF++nNtTazy2zH8Uvp76hLZMrVWnCxcgzVSN4Ij+VVIuKJ7KKfGYrE
	XDQCVJ7RVtrikggAuv3s3PIQrUEMqzGT7RZYveYpN0yGqJ+iuOWALeoMwnisIst0hAYFJs4MqD+
	43s70pjayMPLWOQj9OfmhFanWCc7RA64Uq8W/6Eq0PLKQ2uT/PW0CbsdlindNcc70Yimi3SBbva
	2Ha4k2Wn+r
X-Gm-Gg: AR+sD11bhjdeGfcxq0M+yb7Bp7CIbl5QHv9HYG3ckoFIcpVLC12TgyJ73f3+D/Ta70A
	VakmWbEOcc3BI8e0alsY4HNi7VOCJlE+PfKq4LTsIk/tYGjUnbUDUlq1JmiGV5aWq3o/j2XWPjK
	lBS8ZaUeA8krncNGpFYivyuVdgevqZqoA716Iw2fZxujOYuSyTwk8VP0WWTf1yKjA5l05adZZL6
	znHN7WRmcHysRo0eL5V45JkBe1gre8yfmka2mJaHk1+nmhi5OfLn7SL2UfRJ2iVOnHmUjevmvEY
	P8lPmRYYF09x3P3GBs1qcNvDfdJG9KAJtmt0Wp73u9kgwGH9VtsMsC6IDvAduNUnKDUJT0k6HLp
	JP9DAHFYocE7oQ0ImGIV4Z79X/ZzvoIDR
X-Received: by 2002:a17:90b:5289:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-39580aa5d7cmr13092133a91.6.1787161656955;
        Wed, 19 Aug 2026 10:47:36 -0700 (PDT)
X-Received: by 2002:a17:90b:5289:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-39580aa5d7cmr13092025a91.6.1787161656348;
        Wed, 19 Aug 2026 10:47:36 -0700 (PDT)
Received: from mpilaniy-mac.redhat.corp ([122.171.22.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f96ca41sm3319861a91.4.2026.08.19.10.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 10:47:35 -0700 (PDT)
From: Mukesh Pilaniya <mpilaniy@redhat.com>
Subject: [PATCH v2 0/2] kexec: fix probe error codes and error propagation
Date: Wed, 19 Aug 2026 23:17:21 +0530
Message-Id: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBBFf4XM2po+jFVX/IdhAe3UjhFKWmwkp
 P8u4NblSc49d4GEkTDBrVogYqZEYVhBHiowvh0eyMiuDJLLM78IxfqRXu1AM3Ou48ZcpVFCwaq
 PER199tS9+XF6d08007bfDE9pCnHev7LYvD/ZLJhgWmt7shwVd7qOaH07HU3ooSmlfAFPzfzOs
 wAAAA==
X-Change-ID: 20260813-mpilaniy-ffb0cc92c313
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Tao Liu <ltao@redhat.com>, 
 Philipp Rudo <prudo@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
 kexec@lists.infradead.org, Mukesh Pilaniya <mpilaniy@redhat.com>
X-Mailer: b4 0.15.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w-CgZ_TpayMNL4EYIJhZXhCBpXNTBLtVpb5kUMpaXPg_1787161657
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_104749_923545_E2A1A9B3 
X-CRM114-Status: GOOD (  15.33  )
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

While debugging a misleading error on s390x where kexec -s reported
"syscall kexec_file_load not available" instead of the actual EINVAL
from a kernel command line that exceeded the architecture limit, we
found that some kexec image probe functions return -EINVAL instead of
-ENOEXEC for format mismatches, and kexec_image_probe_default() has a
bug where it returns whatever the last loader returned rather than
always returning -ENOEXEC when no loader matches.

Patch 1 fixes all probe functions to return -ENOEXEC when they do not
recognize the image format.

Patch 2 fixes kexec_image_probe_default() to distinguish format
mismatches (-ENOEXEC) from real errors (e.g. -ENOMEM), propagating
real errors immediately and only continuing to the next loader on
-ENOEXEC.

kexec-tools patch:
https://lore.kernel.org/all/20260814075329.30203-1-mpilaniy@redhat.com/

Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
---
Changes in v2:
- Added patch 2 to fix error propagation in kexec_image_probe_default(),
  as suggested by Pratyush Yadav.
- Link to v1: https://patch.msgid.link/20260813-mpilaniy-v1-1-777d4d0e30f7@redhat.com

To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
To: Huacai Chen <chenhuacai@kernel.org>
To: WANG Xuerui <kernel@xen0n.name>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
To: Andrew Morton <akpm@linux-foundation.org>
To: Baoquan He <baoquan.he@linux.dev>
To: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
To: Philipp Rudo <prudo@redhat.com>
To: Tao Liu <ltao@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: loongarch@lists.linux.dev
Cc: linux-riscv@lists.infradead.org
Cc: kexec@lists.infradead.org

---
Mukesh Pilaniya (2):
      kexec: return -ENOEXEC from image probe functions on mismatch
      kexec: fix error propagation in kexec_image_probe_default()

 arch/arm64/kernel/kexec_image.c   |  4 ++--
 arch/loongarch/kernel/kexec_efi.c |  4 ++--
 arch/riscv/kernel/kexec_image.c   |  4 ++--
 kernel/kexec_elf.c                |  4 ++--
 kernel/kexec_file.c               | 12 +++++++-----
 5 files changed, 15 insertions(+), 13 deletions(-)
---
base-commit: dd8c49a14f169d58e7a07a2c96fb588f3456efa0
change-id: 20260813-mpilaniy-ffb0cc92c313

Best regards,
--  
Mukesh Pilaniya <mpilaniy@redhat.com>


