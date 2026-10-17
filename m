Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21604CCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 11:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2VJKUNI2Amz8x09Pyp10zZpRdq+9eAmweb0GWmitbzg=; b=mDCIlS6VQQYSp5fMVCzjvy/7CV
	+1UCoCCIrzrGx9Xln61NIK84H4+6vjtdXIRqU6x97lawhWc7xn3b2d9ZyLDdfpnQdt7idEz/uy9e6
	nlIufaor8bKbxdZbWDqIK0X+dkWgaxQ/dWZozEOB0tCNFZawG1vKpqhOAtw4suLM9YHXzYuRL50Xy
	UPmgZQRf42MQ/bNz+dwG4Mpf5Bls0BPT9gy7aVRLsPMpb4rLeS6B5xLdFzAhh9iXEBOJSaBczYd7L
	6HaDRjefLdELP6Hc1DT3Bi8+/OYe06jSy/TPvmhwOvSvp2Xox5FSsl87/e3iPqG55zkt2h5DnXQ0n
	V9isdhQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2C2-00000004hLF-14oG;
	Sat, 17 Oct 2026 11:03:14 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2Bw-00000004hGB-3sUf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 11:03:11 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2e8fe8e343fso2758155ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 04:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792234988; x=1792839788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2VJKUNI2Amz8x09Pyp10zZpRdq+9eAmweb0GWmitbzg=;
        b=cxtAAR7aW0Fj0K+jovfpkCWlcaaoOVVeHcCFVbP+6AKrRNOmiRkP6oXzK7ikTSd5cn
         0kZdD03UwGFj7xxK3y2IpuJy3TN22ZuYt+CeaERFM4RLJcz+bOwu2UjyuOjosux1kiEq
         DKkmd4ilzEzzAbIny74/pHw3slhsbH+Oz8AC1PF7DLvvnwLlXcRwHLOLtX3wAntV3HJT
         5lQ78NEx+P9YJJY059y0y2EfNwvMnHebuoBE9NAI9IeoyDlBBDKEBlH9REKuumUlVo/B
         fiaXtT9vu7ZTjoaSmHClWh3S6m6sYYHes9GRg90oRV5QHqaSsaiqe9J7ATIBNEXrtkNV
         aCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792234988; x=1792839788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2VJKUNI2Amz8x09Pyp10zZpRdq+9eAmweb0GWmitbzg=;
        b=PPBJJeix1I8iXxOuJK15pHRJavPIw13m98ZM3Ol0WzGHVhRPHbUjYrSxFw0Dks1OL9
         X1UHycfUyYh55xH+7Rod8CM6Nu8vQUJFCCfottduUTnL5Ogzi0xXrXU2lnd93SGZtHlK
         2vUUgZmAIfLtYSZkamAV1f4DcWX8fC8j4DESsmbRTaopeOyEt0wSIPPHaoy3heHlhK+E
         n+3rT1gjvaSZUixAvNJasZ9QHeveSMSkaX2iAX87I+j6Eeg2M8tOqpj1PpvJrxahaShH
         c73cRqtMwkxH0gNHjDuW/jbInEY1KocXcrB+6IHxpPrsOF+NTzs4SfNFVN1Vz771Sf2C
         NvKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHUdbEsODsVssexPT+qmk6iLE+imukBR7AM4eefCrpc+zY9ncC3sFADshNiaY6fxSAF8rDZXee3q3MPXgNLowz@lists.infradead.org
X-Gm-Message-State: AFq9FYL3Xgx1qA8Om14afqSshvUkghMUth2/599PzMXy/rlaIEu9dtu/
	e8kEfgZy1zrzBwqCWI8vUMa4CLUZ6gYynrfRSDsIMw92qt5cyS6ZdSQI
X-Gm-Gg: AYBFou1rfvZ+1Qk+aHD4u4wBYllYfokRsVPoYWVhWe6jDcPz6cVjrlEhHKiU+a3jL0E
	5hnFBLtx9Le8sqh+Ix3L1T291XD6azYWmIvj4nEdG1Q5yYSPh3tNy8FKc/Es9201Fa0dw8+n4Rg
	nElWja37p1kzSIqgPDrzVw72bC4PYffll3XB3HmN7nQT796oe1dLnbhAwUOLnErRODHX00yZV1B
	WbFxOaBnLAmD5IhQW2J/EmY+RVUCvxHHiz8/zK2u5tAYFPQeaFa60hXnia+eTt8BfPsNrZKXArH
	zAycnnNmxrmFCJsHOgdGNVRepW2WTUf/zVVrIqf0j13ujQzw1YLjuIEK/BpvZBpa/puc4A5hoyO
	oG3CqpsdW4P8IKsyH3A2Ob5gdDVaAIbGg8WFyfUJuszu4NRUDDQOowGue+bAz0mN6HB3zw0CPD2
	z84FSqV+a5ph8++V/INTihQpTW0BflwG3LR2gkBbuQ6kmhSMINJUyOYTqBIfi3vNpHSOHKoPWnz
	/4MCskt8rxyY6qlOMq0JQ==
X-Received: by 2002:a17:902:e949:b0:2e9:7dda:bfce with SMTP id d9443c01a7336-2e9a6d3c1admr19606475ad.74.1792234988014;
        Sat, 17 Oct 2026 04:03:08 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:7c65:ff3e:80ba:b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804dd9sm20559955ad.16.2026.10.17.04.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:03:07 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH 3/5] KVM: selftests: Use the shared memslot base in memstress
Date: Sat, 17 Oct 2026 18:02:11 +0700
Message-ID: <20261017110213.46199-4-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017110213.46199-1-tharitt97@gmail.com>
References: <20261017110213.46199-1-tharitt97@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_040308_964769_DF8C40A3 
X-CRM114-Status: UNSURE (   9.90  )
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

Define MEMSTRESS_MEM_SLOT_INDEX using TEST_MEM_SLOT_BASE so
memstress and its users follow the library's reserved-slot
convention.

The tests affected but require no change are:
	dirty_log_perf_test.c
	demand_paging_test.c
	access_tracking_perf_test.c
	memslot_modification_stress_test.c
	x86/dirty_log_page_splitting_test.c

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 tools/testing/selftests/kvm/include/memstress.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/memstress.h b/tools/testing/selftests/kvm/include/memstress.h
index 0d1d6230cc05..4da03541e805 100644
--- a/tools/testing/selftests/kvm/include/memstress.h
+++ b/tools/testing/selftests/kvm/include/memstress.h
@@ -17,7 +17,7 @@
 
 #define DEFAULT_PER_VCPU_MEM_SIZE	(1 << 30) /* 1G */
 
-#define MEMSTRESS_MEM_SLOT_INDEX	1
+#define MEMSTRESS_MEM_SLOT_INDEX	TEST_MEM_SLOT_BASE
 
 struct memstress_vcpu_args {
 	gpa_t gpa;
-- 
2.53.0


