Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DDBCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1u4zcic0l+T6GeQNUmUI9Uac9hp+HfKFNViGwyEQyPY=; b=s7FEUaaddkksYK
	1AukgSb7E7urzCPuAZ05gX+DPA5yLhZQD3eURpcQoG/h+jZYvMf5cINBMTHdqxVQ5O/wUWVlbYNbL
	tv5K+b9TEt3LOM5c5Qzm/3I1T/+hKUCmSIe9HSvXDc4/YyhxwI76gek7CbP8VUpW7HvQvxs7QIQ1X
	Hjv3Wfd7wOAwVmWtIsJCP2xWvK/eS9tqsKbYBLiCXNnp4sQfiUHr27QTFCGPPJvDzxGgo2LLUEBda
	bgXK2B6z7P+mVwRaJG5bfS6KWIITZ/75KoHGvbDUrwFeKVwfVoHzstFzc6FE8GaKqFRUoIn2XPbsI
	pi8kG/OcYeq/n6ID+niA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE7t-0000000FEEa-2QFz;
	Wed, 27 Aug 2025 11:15:37 +0000
Received: from mail-ed1-f45.google.com ([209.85.208.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDbv-0000000F6NO-003w;
	Wed, 27 Aug 2025 10:42:36 +0000
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-61c30ceacdcso1247152a12.1;
        Wed, 27 Aug 2025 03:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756291353; x=1756896153;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1u4zcic0l+T6GeQNUmUI9Uac9hp+HfKFNViGwyEQyPY=;
        b=P02a0atJRVl0SQv3wjsaMjADUv1bg6mTg5gAr8i4JD5t6sC5Fl5p3V0BjB6DdKu/FF
         in0E8VuSKQESv7yz/SKg40DPOCkY7dSmAvUVVYTCasUS77wOaYYP/0TzJ6PpW0F+g0CA
         NBEla23CNTkTg3U1oulDtOcWjfp1DTPerDzNIUwm83tv3IbeAE5GwUXuK0UntM8NdbOP
         /FBiIcpnrYRlJY8XZDsbaq/jP4VBaYCAHge++gqQ6W36PCdfeNrIoo7N4WzwlPyr28tp
         Gn5Jc5k4ti32C6nD210+xpon/bftE+fJO0gBm+nFCr++ND5d97QQVLEh95ZB0gytesrs
         nZ+w==
X-Forwarded-Encrypted: i=1; AJvYcCXxeSQDv5hqq38rJtUnJmjlWHqmFjXeMkWCAll9YFZcwdiKCID9lTHbBC67ZenwNn8xxvN0cnbmlE8Znw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf3mKcZfRuqgKBchu1/w/zn9m6dOdzOVkI4EZJ++BPEODdnTFd
	2Bh+NhjRapJHPmqb83QsTYGA2qYnysRS+DmkKUR+P9OtrCUCtXsuAx8U
X-Gm-Gg: ASbGncsM9NiRLlLNZ8XQ6c6pYLWqfEFU9+Li2J4N8d2DHAibD0iQ+gn3FaWSBVKxeb1
	zYbbswWLl3J7mDKgfruGluVc/Pnu0U8+kLURzkuEkN+q42t0yGTyhs3hhBBwdMbooNFwtsC49Ds
	lqGdDiarbB7N/XyE1hG62HXCb1TfKQnAMAFOjtkOqmTsJ7c/mgmhcgbD/5u2KdDbybU5zwCibXG
	T4jfHaNDXnoy1Mjr2gu5fEECsLoSRXgcZwjlRMU0y5U/xVHGMAnu62y6BITHaGos1cRApCPoUm2
	d0i6kRUS7YlfDQ++FcLza8pJ3rhcTfQnBizCNnDRlc17tTLEtO5N/Gor5+3buJVqW0oeFPaur/s
	Mx7rjQuHGoiDYHHIUWLDYY/c=
X-Google-Smtp-Source: AGHT+IGjq9XcVFJfT48t3D2sSSWpKBUwYgoLrOJ85gEuT6CFTvTN24ctslyJVbJFjI6uf4ov/6pprA==
X-Received: by 2002:a05:6402:4cb:b0:61c:4222:4856 with SMTP id 4fb4d7f45d1cf-61c983b899dmr3243783a12.3.1756291352988;
        Wed, 27 Aug 2025 03:42:32 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:5::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c3119ffdfsm8866926a12.9.2025.08.27.03.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 03:42:32 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH 0/3] kexec: Fix invalid field access
Date: Wed, 27 Aug 2025 03:42:20 -0700
Message-Id: <20250827-kbuf_all-v1-0-1df9882bb01a@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAzhrmgC/x3M4QpAMBQG0Fe5fb+tZrXYXkWSzcWN0BYpeXflP
 MB5kDkJZ3h6kPiSLPsGT2VBiHO/TaxkgCcYbayuTaWWcI5dv64quMHa6IwrOaAgHIlHuf+qad/
 3Awsgpn9aAAAA
X-Change-ID: 20250827-kbuf_all-b9d55c9291eb
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <bhe@redhat.com>, Coiby Xu <coxu@redhat.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.15-dev-dd21f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1971; i=leitao@debian.org;
 h=from:subject:message-id; bh=rML8t243wUUhsl2OLv0RtLzgEBGwxGXZlMqXmCPiepA=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBoruEXzwuDBBiV9rroaHj06zedE14jXSY01dNDe
 05pyXnMz2GJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaK7hFwAKCRA1o5Of/Hh3
 bQ8zEACrimEGA/OQuvFVrT8mrQ5Mr4ou2ECD6x2JT6IN4mZlhwCnR7sMQJqrC032rCxgekihaHs
 7Ki113795L3C7BTYvyPWbwWtUQaPsSQ0/UJ+6m2XCmjDAbJ7t/WO9A7UVM1FR5idIjTV1oBNTtC
 wpOrdPVNCg0WaxKKdASKjM8a8hVT3jA87Jk7R4lGAjpJaeJy9aftaNWBa8NsFXHwpy75km7tcGF
 SBFX3mhGEe8J9dGy4/nAeVnGht9vZ9Hq5YaznVRgYZyPIfY1G8ZuhDcm+EZtMwSxhi5W//q8LKY
 iUp/8X6lf79htbfC+5DOcq59ZKX/xLV4z90bdmafjP2oy/VIu5caJj1zAve2+Dz27xhy6vjd43W
 C657LTC1KH1FkT7zo9gIQ6ZaH2okMu4Whhj19eiml86fP+KfCoKc0hk/TokrLnuQyHD9aAkRLFn
 2ucGx3hvFvyGjiL7R5RPhWFjfrY2ZdERinWI7A3v1fnkQxK4MsXgGuMxujjh4Tu34tsjJn/o82U
 8x+dO26drFZw0H50CdChjQHWa8N22UHPNlVrbvc3PK6dK+5GSeqrTGqgvLdqEMu4d4/XNygR13L
 5qH8uiuMDjp1NxTTDlw9LR4RVGAebXqZVAEYDejtp/c80AVXiejNbHTcms+vFKQ3dspdi7xDESB
 kUAepqT0fXLi+cg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_034235_075880_9C20837E 
X-CRM114-Status: GOOD (  10.38  )
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

The kexec_buf structure was previously declared without initialization.
commit bf454ec31add ("kexec_file: allow to place kexec_buf randomly")
added a field that is always read but not consistently populated by all
architectures. This un-initialized field will contain garbage.

This is also triggering a UBSAN warning when the uninitialized data was
accessed:

	------------[ cut here ]------------
	UBSAN: invalid-load in ./include/linux/kexec.h:210:10
	load of value 252 is not a valid value for type '_Bool'

Zero-initializing kexec_buf at declaration ensures all fields are
cleanly set, preventing future instances of uninitialized memory being
used.

An initial fix was already landed for arm64[0], and this patchset fixes
the problem on the remaining arm64 code and on riscv, as raised by Mark.

Discussions about this problem could be found at[1][2].

Link: https://lore.kernel.org/all/20250826180742.f2471131255ec1c43683ea07@linux-foundation.org/ [0]
Link: https://lore.kernel.org/all/oninomspajhxp4omtdapxnckxydbk2nzmrix7rggmpukpnzadw@c67o7njgdgm3/ [1]
Link: https://lore.kernel.org/all/20250826-akpm-v1-1-3c831f0e3799@debian.org/ [2]

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Breno Leitao (3):
      arm64: kexec: Initialize kexec_buf struct in load_other_segments()
      riscv: kexec: Initialize kexec_buf struct
      s390: kexec: Initialize kexec_buf struct

 arch/arm64/kernel/machine_kexec_file.c | 2 +-
 arch/riscv/kernel/kexec_elf.c          | 4 ++--
 arch/riscv/kernel/kexec_image.c        | 2 +-
 arch/riscv/kernel/machine_kexec_file.c | 2 +-
 arch/s390/kernel/kexec_elf.c           | 2 +-
 arch/s390/kernel/kexec_image.c         | 2 +-
 arch/s390/kernel/machine_kexec_file.c  | 6 +++---
 7 files changed, 10 insertions(+), 10 deletions(-)
---
base-commit: 3c642997252eef4449cb6b6e02af3dc22515d817
change-id: 20250827-kbuf_all-b9d55c9291eb

Best regards,
--  
Breno Leitao <leitao@debian.org>


