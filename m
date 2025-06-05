Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F49C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 10:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HiFig5XrzaKxrne/VffAS5Dccms79XHv1+bktez4Dgg=; b=zGI+/jtxUorfQCm3LLP/GbSO26
	lRIrAy/XBChXYCQjKrI6Wn5HMrj9780lU+YP7EYzv7euETK+Yrsjok/rbUy8KM9MgYgzcG/bvYM95
	u04+3zSwAzQHvZjkMH70HZgWOs86ntoROQl022kydwyex+zky2q15py5NgBGjaLKz2Q8iD2yqGzBX
	BC7q1r6Seu8HDjNOUzjOLp0NhVBBp8yRKECXBcMHr7kh6uBO1V5AMFnrGrWQlLFa+XenSyKrGKGV2
	VmOUQfoB0hHCTh9uxbSClH8Ht2mqyh6fy93mOvH9z8bFvPBWPQb5L5/zH3e+d5D3O5PCua9rw+blF
	IQv1OrhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN84a-0000000FHQS-2UXd;
	Thu, 05 Jun 2025 10:43:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7y3-0000000FGaD-3XOB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 10:37:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749119822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HiFig5XrzaKxrne/VffAS5Dccms79XHv1+bktez4Dgg=;
	b=TtJoCBmxsAvqtB9W1k6aDDzX2i8cePPVyf/yZMvOSgKLdGmW1dNoZr3Kkmm53WuyOAlRQg
	HScGhHSmm6kxn9BSCkNqr3QJOTkJCs84IuiR4UJGafej4tiCRtocM+ULUiP37O2J/7l08V
	htSRfSYRBBONz6sSM+nJo2VAIoDJVO4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-UQ44OxGbPnCV5ak227Pg2g-1; Thu, 05 Jun 2025 06:37:01 -0400
X-MC-Unique: UQ44OxGbPnCV5ak227Pg2g-1
X-Mimecast-MFC-AGG-ID: UQ44OxGbPnCV5ak227Pg2g_1749119821
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451dda846a0so5893855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 03:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749119821; x=1749724621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HiFig5XrzaKxrne/VffAS5Dccms79XHv1+bktez4Dgg=;
        b=pZUzkhTE2sJxRqfU8IGcjOlyZItwQNc/hx9ai5kzwc1E2DXGrkpmqxDPFd6/SA87h5
         aZt6P27BSS1ZR2sTv3n5QirAB41HooYMTZeN3ScRcsNtCD0u1bHXksaseOSSyY8Z1f8q
         pwiaLMWEg9x60ev83o5I8mM7T+eFfZguMmVxfEsfMoKzIMAsnE1ci55p6MslQcSoxIqk
         51s43+Oi7Rtjb5bzYlr381lxOqXKloDD+2CcKuIXXM6gho1hQD9G2sw6sIYLZbAfCyeD
         0VRsr1CIixf96etiToJCSl3KaBvIYIPbmnMH0KVCmkcfrxjs1qWTkDltBum6r22orNv0
         XAlw==
X-Forwarded-Encrypted: i=1; AJvYcCUy6zXEh1ot0hy856Bg+sYKFMGj2qN6A7t068koeWyAp2bfUNhI1u+N/tHv4shmha5Swoo4ytLtUyJ8AA7zRCYI@lists.infradead.org
X-Gm-Message-State: AOJu0YxABG1nMCoYLRQ0l75c8gD52YVkmFb+N6sFquw7QIa7yVMDFlrz
	vpvDhmWerR6DVTpSEhNkfCV8Wq4Dm30bnGYnN1HD+qAnSuaEN6i4X9yzuMv6YIILkICrRWadisr
	GRPEDEB/3NZujN3Fm5uSY7xGzk9v2tb/2a2GWaAs6xx/GOiZZQ0MGKA6OTKyyRsiXHI+4g1lIRm
	9W
X-Gm-Gg: ASbGncslKJymyTIjqBuJHRMKRuBLmd11ehSwqwxnmsk20Mm/DExHrdqUbBQZuUZwdJk
	xuD13D0aX8CSTSkfmSHJ7j20U4JUlWmsVJtFfLaN2f3dl446yTmV0vHo+WIGZdS4o+5aN81ftcs
	3js8YFxlrGXWVgemoPRpZcNB/GimtiZU+hOx9r3GkXnTSx7zTRDpBZZsBzw1AmFN/w5ajCE5kZs
	hQ20fGK7bziDkvW8vf1f331YC7BAPbuIY0ur5OMLWgz9VSs4mqewZWNmUCRBwH470pCyvIAsf52
	9ZztpQou3rJLI7kg1D0ITeoc1HbQiOKdy9kiPUXGFJQLS41Kv9kJKR7HMnUyasuObwKKdsFSXQ=
	=
X-Received: by 2002:a05:600c:828f:b0:43d:ac5:11e8 with SMTP id 5b1f17b1804b1-451f0b26621mr50050455e9.21.1749119820630;
        Thu, 05 Jun 2025 03:37:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs6aFjV1ri9gglwDDly0k/rNzs1/j6SDKTIoXHxHHy0T2KK5H3bwQ524CbBRzv8yzrX28AyQ==
X-Received: by 2002:a05:600c:828f:b0:43d:ac5:11e8 with SMTP id 5b1f17b1804b1-451f0b26621mr50050275e9.21.1749119820235;
        Thu, 05 Jun 2025 03:37:00 -0700 (PDT)
Received: from rh.fritz.box (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f8311ae6sm14105175e9.2.2025.06.05.03.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:36:59 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Cc: Colton Lewis <coltonlewis@google.com>,
	Ricardo Koller <ricarkol@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v3 2/4] KVM: arm64: selftests: fix thread migration in arch_timer_edge_cases
Date: Thu,  5 Jun 2025 12:36:11 +0200
Message-ID: <20250605103613.14544-3-sebott@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605103613.14544-1-sebott@redhat.com>
References: <20250605103613.14544-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M2PXyQKEHeClGGgERminLp9jLPyfQTtoMzzl_BNK8ag_1749119821
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_033703_988596_65D074C2 
X-CRM114-Status: GOOD (  14.17  )
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

arch_timer_edge_cases tries to migrate itself across host cpus. Before
the first test it migrates to cpu 0 by setting up an affinity mask with
only bit 0 set. After that it looks for the next possible cpu in the
current affinity mask which still has only bit 0 set. So there is no
migration at all.

Fix this by reading the default mask at start and use this to find
the next cpu in each iteration.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index c4716e0c1438..a813b4c6c817 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
@@ -849,17 +849,17 @@ static void guest_code(enum arch_timer timer)
 	GUEST_DONE();
 }
 
+static cpu_set_t default_cpuset;
+
 static uint32_t next_pcpu(void)
 {
 	uint32_t max = get_nprocs();
 	uint32_t cur = sched_getcpu();
 	uint32_t next = cur;
-	cpu_set_t cpuset;
+	cpu_set_t cpuset = default_cpuset;
 
 	TEST_ASSERT(max > 1, "Need at least two physical cpus");
 
-	sched_getaffinity(0, sizeof(cpuset), &cpuset);
-
 	do {
 		next = (next + 1) % CPU_SETSIZE;
 	} while (!CPU_ISSET(next, &cpuset));
@@ -1046,6 +1046,8 @@ int main(int argc, char *argv[])
 	if (!parse_args(argc, argv))
 		exit(KSFT_SKIP);
 
+	sched_getaffinity(0, sizeof(default_cpuset), &default_cpuset);
+
 	if (test_args.test_virtual) {
 		test_vm_create(&vm, &vcpu, VIRTUAL);
 		test_run(vm, vcpu);
-- 
2.49.0


