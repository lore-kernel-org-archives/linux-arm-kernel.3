Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10BAC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 00:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrOwB60iRPSms6H0AJKyXzUgvUqpPNkdC9MViEx8qm8=; b=V73LXPOCBAzwxwW6NBUb1/5HDF
	YlhDVfhKjV+eui3GeQ1jlZMk71Odr7DmEoyFWnTO82RI5eOY3oRc/mXuLr+u2iEyAMf4Rsl0mR+D/
	NKxK6PjqgdXfaxLbejLZqqStxtVmTRyft5ulh5kXSSt3PyZLhBC7EFkzafSIAmZeBgjaCMhy/eh2g
	0Fn1EnsyUftIs1ewP4uf4kj+nKEywjGIg108YV0iprEr4Y7lVHSKjVu0OgH6V2dbglQCoYByxTimU
	LR//+ym6i7V15f3uwsPNQEr1zBOBUi7Jkgv5UuhlodaKedOZ5MBIliGw8IQU5qhX9+4g278sJXaMR
	/yhLH3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNhGJ-00000001Awc-4BSg;
	Sat, 07 Jun 2025 00:18:16 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgvX-000000019B5-1MmI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 23:56:48 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7462aff55bfso2345990b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 16:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749254206; x=1749859006; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VrOwB60iRPSms6H0AJKyXzUgvUqpPNkdC9MViEx8qm8=;
        b=OojWRQ6cDjSx8lZW57rR4gUNPMkcvNOEdsWZxDbKNTkEOHMwERBgfgECAN2AAlM4DO
         BuAFQmZOsonZjLyV/fDHKxOKlaefEYFxjXtw0QXCdRddQFXrs6SdkVvrMj2ywhrzY5MO
         q9o1gF8a9sqnu0vxsv4kFBnx3lWQi+BseAYEopCv5xKT59D4Bdza4PPy1ipZ4a5fjDtg
         4R90ElGKSKd5QqfhppG9OGUns/9K0fS/dHMezcen1T/u5f8YRSTqh7zWW3bOSvfWl44F
         R6p1NxgzptVHWpyXMyePe0ARHIzYNuMgSo7j0UL745dYeYn75qF3n58wtgdaj5MJ141T
         uiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749254206; x=1749859006;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VrOwB60iRPSms6H0AJKyXzUgvUqpPNkdC9MViEx8qm8=;
        b=ficPSIhj+bS1VFEhh5ML67+OjE7X6Q5BaIlbZhcTjgXonYbb9+zdmsth+AMX+quv0b
         7P+gXpVmrocBxP08LRS4se/g+6Ii4Ky1cm3y5VqLhyavEmSQSfXb1asCiExBGci155DT
         aqO1lKFp+8ScZ1uvbkueBrrV51tjFuMUcooGD/x82Otmc9nqaeDrY5qlxVpL36i1J5oD
         wTLOUsiFLXll4XmHmSVod4LgoqTP2cJtTLYCZD5Nd4jxaPQ9dagEl76ZaBbWo0dXtvne
         n/bgaHIpLx5I26EQ2KVPFtdeOh3DcRl0UfGScbtcS1PE5DfJjFPrTOtwXrBFxiOVY7vV
         6tPg==
X-Forwarded-Encrypted: i=1; AJvYcCWb20Tw3T2TaqDcLJBxNkK2wIdThbgM2NIpe1fIyZCNGSBs7uDxeDBc/jE1dRZ6CXcpyU1qxhAHjRcZ8EZ1b9nI@lists.infradead.org
X-Gm-Message-State: AOJu0Yylz3b7eRFCAXcwgPAiiNCA9oeniAaight6lsIZi1q3nIxMEvXM
	zMGETZCj7nNN2bIuEL1Uw2HZ8QKBhZw0KDrKcDzjtE0rAGnOqF9ZyWGr8tEu1O934fVh0XQ9Wuu
	ctDQ/ztBa6g==
X-Google-Smtp-Source: AGHT+IGcO5eLR5D4rJUvqyhcG7DPzhqjWvwjT9S1GiHqHVEpWgfsWBe6SJIclWzcovJY/XCNJMaAI3VDhG0T
X-Received: from pfbhm22.prod.google.com ([2002:a05:6a00:6716:b0:746:2bf3:e5e8])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1ad4:b0:742:aecc:c47c
 with SMTP id d2e1a72fcca58-74827fcd87cmr7087572b3a.7.1749254205891; Fri, 06
 Jun 2025 16:56:45 -0700 (PDT)
Date: Fri,  6 Jun 2025 16:56:13 -0700
In-Reply-To: <20250606235619.1841595-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250606235619.1841595-10-vipinsh@google.com>
Subject: [PATCH v2 09/15] KVM: selftests: Add a flag to print only sticky
 summary in the selftests runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, dmatlack@google.com, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_165647_356063_F4572EDC 
X-CRM114-Status: UNSURE (   9.53  )
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

Add a commandline flag, --sticky-summary-only, which only let sticky
summary print to the terminal and all other outputs are suppressed.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/kvm/runner/__main__.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
index 4406d8e4847a..2dcac1f4d1c4 100644
--- a/tools/testing/selftests/kvm/runner/__main__.py
+++ b/tools/testing/selftests/kvm/runner/__main__.py
@@ -124,6 +124,11 @@ def cli():
                         help="Print only tests which didn't run."
                         )
 
+    parser.add_argument("--sticky-summary-only",
+                        action="store_true",
+                        default=False,
+                        help="Print only the summary status line.")
+
     return parser.parse_args()
 
 
@@ -131,6 +136,9 @@ def level_filters(args):
     # Levels added here will be printed by logger.
     levels = set()
 
+    if args.sticky_summary_only:
+        return levels
+
     if args.print_passed or args.print_passed_status or args.print_status:
         levels.add(SelftestStatus.PASSED)
 
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


