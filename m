Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3F5C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+aPWbmTLZvhLqGM4vE8H/jD9xFWXLFtEDa5uftDvlQM=; b=MaaEKJJqdCCQVI2AFm/7zPaI0u
	VbTC94oHTy3FO0kFpZZwAjw3ni2P7NmLopkt/q3GK1PVRLFMsxOytG2+/PAbKqUqcjjRlbE+J3OFf
	JJR0wX9eOGAevhr8mHrBhGB55JJw9shZu1M2E7RzZK/ipTE4VcmuJwuwb37YF+JowudAKj9FpWfVR
	JFbMjdADAneZeXzLkDeVsMcBfE4XAGNSFPvEkuKl8LmsLBChc99xxAQgoKTQyxksrLK8uIQ7Yw6hN
	DcU4qAH0sF459dmKYiXJdgGqTgvDz3LFBy46ZDVPYyyFE7V/5g0bWWg1ncuHkoA35n8yt8qtVffqs
	84iOnufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U04-00000002DrA-1wjC;
	Fri, 04 Sep 2026 13:30:36 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tzt-00000002Dls-3Yka
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:30:28 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-490a767b782so7896285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 06:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788528623; x=1789133423; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+aPWbmTLZvhLqGM4vE8H/jD9xFWXLFtEDa5uftDvlQM=;
        b=YsUHjBcebn/vOv8eAOmCHitI5vn/WRERAwVcKy4XjscYEauoCeHRYOvN11cTk3Zfnp
         Cg4iO4Yn22Gm8PD9Z0oMb3dqksl+xog9nFDB8eKSRGSQEfcqiBAbO8CqgCty2BmPVJFf
         +ceySjvjmfp6Ybqkpdws1FlsZebY8m9IcEcpYPqrBiRPEphKI7/42CYUEbkQtJt6RjMg
         lrasCt/1fOQ+IIkp+zuSwUF3cUsMy7H7gwJfKS7oRbB5cdF/k3l115Swacj4F1fic+My
         EuAcDXYmdLHG0uK5LWxsASMGBdHDoiPhnLfPD/fa/C7EfW6+NP+68H0KOHXw30SQC3YG
         3Txg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788528623; x=1789133423;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+aPWbmTLZvhLqGM4vE8H/jD9xFWXLFtEDa5uftDvlQM=;
        b=VoguO7x32rdVtP6GesulzX82lS8XvUsCkdSy0o03G43uYvFXM3oU51AwyJf/Wp3TNa
         ixpyZRJWalGkLGlb23ZBUY6SYtdPj3I+XoguoVe+AEGepeuwNUTGjW8JWqCcUO9E2v4L
         1o80DJcg9fiuFrKnuAaHWXvMX9ookrYfq6umFmA9GxdaYGAfeUR8wtCd9txiXNCqK/Cu
         8MrX5Rn+ApS3nE/FNWJ4L8bp3MzYwTGpWCM59421EnbreaFmyfezAFlcqHzthYNnWDdM
         9GJZuQPoV7sE+2JEf1yh6sgddmkaN9n0MFXxWPLEEw/o7jzmacGwxotBqAvr706G+xxw
         TfKg==
X-Forwarded-Encrypted: i=1; AKwUvBzi0Cr0bFHsbrbiy0n4Ed3T5eEoLQbuR/62oGh4s2RSu7/2Z1pFh+SuRa+q8L+IVNDMYgaKkqa8uV/vYeRaRY5t@lists.infradead.org
X-Gm-Message-State: AFuF++kc+MBFpw4s6xOhuUDs7j2MbFlknErUuZvGkUl0lB0zNRNNWjgw
	RVFoLE07g+7I0nlBvLw66L7nK2F0Wg+0nnfK8B69MKr5mZ+AKfX6o0fq8a+KQJkIXvJg+0t0TL6
	LRpmfVJR2Eb6KWg==
X-Received: from wmbdx16.prod.google.com ([2002:a05:600c:63d0:b0:49c:edfd:aa4c])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc5:b0:49c:fe18:6dd5 with SMTP id 5b1f17b1804b1-49cfe186dfemr25609645e9.29.1788528622474;
 Fri, 04 Sep 2026 06:30:22 -0700 (PDT)
Date: Fri,  4 Sep 2026 13:28:53 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904132855.638117-1-smostafa@google.com>
Subject: [PATCH v3 0/2] KVM: arm64: Add support for BBM level 3
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, sebastianene@google.com, keirf@google.com, 
	qperret@google.com, linu.cherian@arm.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_063025_933091_B16BFE0B 
X-CRM114-Status: GOOD (  15.68  )
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

This patch series adds support for BBM level 3 to KVM pgtable.

Changes from v2:
https://lore.kernel.org/all/20260723182140.4025575-1-smostafa@google.com/
- Add extra checks to ensure PTE updates with BBML3 follow the arm
  architecture.
- Limit the extra smp_wmb() to non shared walkers.

Motivation
==========
I have been looking into this for the context of:
- Page table sharing between the host CPU stage-2 and the SMMUv3 for
  protected KVM.
- Use the pagtable code to populate SMMUv3 stage-2 shadowed
  page table [1]

However, BBM level 3 is still useful for CPU only operations as it
avoids intermediately breaking translation.

Design
======
Some of the conditions that BBM level 3 will be useful in (RWHZWS):
1) Changing from block to table
2) Changing from table to block

Initially, I encapsulated the full logic of BBM in one function,
which was not readable, due to different ordering and dealing with
CMO, TLBI.

Instead, I kept the logic into 2 functions, where BBML3 is added in
the make step.

One interesting case, as BBML3 will update the PTE atomically, it
can only know it raced with another core at the point of the cmpxchg
failing, unlike the SW implementation which locks the PTE first.
And as we must issue CMOs to the new mapped page before the update,
that means with BBML3 racing cores will issue redundant CMOs, to
avoid this, we limit the use of BBML3 to systems with FWB and DIC.

Testing
=======
This was tested with:
- C1-Pro cores, unfortunately the version I have does not run
  upstream, I backported the patches to Android kernel (6.18).

- mainline(7.3-rc1) kernel on a Qualcomm X1 with a hacked cpufeature
  as it does not support BBM, I did not see conflict aborts or TLB
  corruption.

I tested with VHE and protected (hvhe) modes, running VMs
(and protected), and running some selftests, that might exercise and
stress this path tools/testing/selftests/kvm:
- demand_paging_test
- memslot_perf_test
- memslot_modification_stress_test
- dirty_log_test

Mostafa Saleh (2):
  KVM: arm64: Add stage2_clean_old_pte()
  KVM: arm64: Support BBM level 3

 arch/arm64/kvm/hyp/pgtable.c | 172 +++++++++++++++++++++++++----------
 1 file changed, 124 insertions(+), 48 deletions(-)

-- 
2.55.0.979.g7e5102b832-goog


