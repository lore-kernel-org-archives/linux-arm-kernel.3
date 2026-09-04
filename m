Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFDBC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 12:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjXI7c1o2fMUZ4gP/lf6VLU7Bny6ysM8MfilUau8IZs=; b=IwSFm6vk1fIsu3E3PXDIGcyDUj
	bm96fq/NGAbdD+3EZ+8jy8N1SbpYT2fZgyv2AwewT7rlo+osxA7u/dVA40dKeDXNAxCAU4W8AD4mi
	z+MxZ3x8FcTsCrs1s2cZKkIIU/9jj9F4vTERFIuvnPQHy7V0s/tkgjcq/8PUGtJ0cJtvDDgB0hRNt
	MiHDeS91n5Gfa9ByqGV5jMEiUzvtS/J36qoXQVG6L9J/N9e8m6oRMRVyWE//VU2kMiJ/MbWn54PiL
	wwjMOSJADAL0doyVwfhRHnV0CGe53TKlVjAqjnKRFpS/8KJI6scpdyMjs8VLjeiJam0AgwJo2WECu
	baCehdFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Sye-000000021Sv-0VGf;
	Fri, 04 Sep 2026 12:25:04 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Syb-000000021SC-2r6i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 12:25:02 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7f0167e59a3so662078a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 05:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524700; x=1789129500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjXI7c1o2fMUZ4gP/lf6VLU7Bny6ysM8MfilUau8IZs=;
        b=dB8xFV6bhffcEPPQbLD6S4nCreGbDqBTuYHel9mecOoxPIlM9B149j7L5GZ0KOPa4J
         Pt2z9scykHANUa5gNBvcZ13a8dR4tpHTwhdAlMyrwgae4VXzihr1H0ONGEOh3+KmIwmm
         A3OoOBpJO2Xp30L/BOiAJmTcqRI3CnF0RHDvVTP/IsO9/Ez0I/7IJA+H51wNgqD8Q2+2
         1BjEwmWRLYHduPo/wfU01hS/S+TNOpRG1L/3OtC8LM10M5davhOAVn3gJ8gURRlozH6g
         BHMCITcT6+HS/kT8+hAa2wK5Q5QZhE2OYQwKaVuq64A2OtwEqthUduyJHr7SbiWrfmb2
         SLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524700; x=1789129500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kjXI7c1o2fMUZ4gP/lf6VLU7Bny6ysM8MfilUau8IZs=;
        b=KMIE8jM8plCiQOoU4MEJFz1NGnO75Z1hwCTW+EnvxmYexpcRKBvAR/GHb4USrLV3ZC
         g6CzKzMd4UwO0eJLYyK1tydxNfp4Oa04fYZvKC8/3Y5tIhz2fkflDlnsHOuDlzpTMqBE
         FVT8ANa4GHOCvWhE2Blkt7vZhMeT8h97f+Sz66+qZYVlHMrpZB/irO2QqVUEUO/NK7Sl
         r5AEcyZYQd5I7r4IVXV4ZpBjrPX4arwCgqDTPODCQ+wwukpPA2y0MiMd4wPeGMdOUKuL
         m0Sfsjs7COV8B0u0TrSoL8LBhUsoEWBmzlJyMvwM9ibhmAwC/WU/vXm7DSnYJEph2joB
         UyDA==
X-Forwarded-Encrypted: i=1; AKwUvByN74oqo1websiTgPLHqD9tvvvFxvOsPUedDKRF8m0luisPAEsTN4NXSbWzDCbrRk3OBn9D27mQDMUIfgynuqDq@lists.infradead.org
X-Gm-Message-State: AFuF++kfZ7m+ilgDEq16Jrqzac9RMJUTxPtnbp5WpveOzP3gGbxlVQLI
	EPJbUV54n3AOud+lYymO5ep/COuDyEoRVcQtl3ZxbgZgYlcW/MLmFo6b
X-Gm-Gg: AYBFou02VvQd+og8shBQiukhQI+M5HGigsM43X1c766ivHQc+Vi3clSkl5znQYPKHNB
	gHV0IAEhDrOtaCld4ZkCdi5OtcyGMCWih7NIG8Tmjjse5RT2i8UDhLRlguWVcMXhjvOstk+eQsE
	cKhx6C9bYYYf5Fvw8zHG18ipZoiVoF8+1kqGIxFZynrCJSQ+LalkftZCp0whs4QB2TWSdLpxJyg
	T5sS+N8dmZwhGYVQyOT+vSmcma0/I96i0eu1KeLjzaDL9YH++yhuhXKNdfT5k5S/0TtiZbtKttf
	xx0M5L5V3FFlQ1l9kocfQWUHpIraAui8iwJ5ZPafS/PqdZMaeuFfFMu7MQ6sls1O0x+/wvf05fi
	I7Zq3h08CmoFC5oxKBeoubvG7xqnRMMQyD2t1wfrFgcpRhITFjj8AfEdj+IeFmpQgMCFOJ9VIsI
	iqkQ2xLZIALoq5XlRB694vBX/RxRH0ss1Wds5WeVxhimxJgdvA3NrdbjRFumheKGBfSu1I4yYmD
	36nEsBnC/eZO5k=
X-Received: by 2002:a05:6820:160b:b0:6b0:1b86:fb0 with SMTP id 006d021491bc7-6b6fe59c86dmr3821145eaf.31.1788524700176;
        Fri, 04 Sep 2026 05:25:00 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f787esm5880860eec.23.2026.09.04.05.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:24:59 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/3] selftests: kvm: fix typos in comments
Date: Fri,  4 Sep 2026 17:54:41 +0530
Message-ID: <20260904122445.31163-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904122445.31163-1-hemanth.selam@gmail.com>
References: <20260904122445.31163-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_052501_729223_FDE16988 
X-CRM114-Status: GOOD (  14.24  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/selftests/kvm/arm64/debug-exceptions.c | 2 +-
 tools/testing/selftests/kvm/arm64/hypercalls.c       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/debug-exceptions.c b/tools/testing/selftests/kvm/arm64/debug-exceptions.c
index 7dc5f0b4f6ad..9da6dc5bcfe6 100644
--- a/tools/testing/selftests/kvm/arm64/debug-exceptions.c
+++ b/tools/testing/selftests/kvm/arm64/debug-exceptions.c
@@ -387,7 +387,7 @@ static void guest_code_ss(int test_cnt)
 		 * Enable Single Step execution.  Note!  This _must_ be a bare
 		 * ucall as the ucall() path uses atomic operations to manage
 		 * the ucall structures, and the built-in "atomics" are usually
-		 * implemented via exclusive access instructions.  The exlusive
+		 * implemented via exclusive access instructions.  The exclusive
 		 * monitor is cleared on ERET, and so taking debug exceptions
 		 * during a LDREX=>STREX sequence will prevent forward progress
 		 * and hang the guest/test.
diff --git a/tools/testing/selftests/kvm/arm64/hypercalls.c b/tools/testing/selftests/kvm/arm64/hypercalls.c
index 5d96cdf382c4..a24becda9e62 100644
--- a/tools/testing/selftests/kvm/arm64/hypercalls.c
+++ b/tools/testing/selftests/kvm/arm64/hypercalls.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
-/* hypercalls: Check the ARM64's psuedo-firmware bitmap register interface.
+/* hypercalls: Check the ARM64's pseudo-firmware bitmap register interface.
  *
  * The test validates the basic hypercall functionalities that are exposed
- * via the psuedo-firmware bitmap register. This includes the registers'
+ * via the pseudo-firmware bitmap register. This includes the registers'
  * read/write behavior before and after the VM has started, and if the
  * hypercalls are properly masked or unmasked to the guest when disabled or
  * enabled from the KVM userspace, respectively.
-- 
2.48.1


