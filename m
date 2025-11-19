Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F302FCF3941
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zsMgANA5eM7ZKAX6n6+aWoRlKM8M0oaGArWvq51zEek=; b=z1kOC2e76hqR0J0dGcwKr/knmo
	bK6wq37xuNvi0n109cWdHBh3YBrQR47mPCbU5PGGFbI/WJXJTWVXdHhbujk14mPAPCVBl/jKSsq4d
	1exwENoIMTP7PlLw0P9GNJ61xWjtPk5mFrV1An/2MtWlhLGhhDbTt8NeuMQ+OjNthhgexk8eFnda5
	trDq2x/adKTyzC9aqkATkB77bcLlhn7O4Gb+995t6t3OvVTCiWSZv15+Ir5YzWwElmP3AS4HGEbOg
	jQuCOLL0zx1uQWIifQpVlrdQ/+0JZKRSBbhocQmNH5VJvAPZ0vMRoaoWFQLKnIwrI1TFoykv+muCl
	tlXNxO+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkQz-00000003YjN-32WL;
	Wed, 19 Nov 2025 15:49:29 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkQw-00000003YiQ-4AWM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:49:28 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-429c8632fcbso4854094f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763567364; x=1764172164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zsMgANA5eM7ZKAX6n6+aWoRlKM8M0oaGArWvq51zEek=;
        b=HpEQ6Xd50Io+7YzcYQ0bW/AQvOjjwmYU8GHp91WsV9vTt6FMQPFQTjKrn54b2g4wj6
         BZxIiruWZzG6PbfidjsSgAMN9JLGKejhg372F6/JgI0G0Ukn9sKXKOOtQjIsPMh6QvNt
         AXdXz9aHCLi3N32jHghcKaMq3gHr28mQLEFjBbLlPW91SPKbWfqHv29S7WZ+rhm/qBcY
         ZuabTDycC5Ei2iyYVH7mwM7yBImIadFszmfe3sH6XgRtGzW0Ex+dcARHsKRG+J4wUNT0
         iPn414c9gSb6Q6nkPWSxlc8QRu1LmMITbEyR61Mbi7YaVGsvhXwMadPwE5HTpjL2kpQY
         oQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567364; x=1764172164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsMgANA5eM7ZKAX6n6+aWoRlKM8M0oaGArWvq51zEek=;
        b=Siwp8csxdXoyYDz44ihvgsIAXfVn53uzH70Te7viRM2lZrOzNUyewM2Iq4vPwRXI32
         4g02tKU16XAoDx+PH+b6c2dAOpZbc5mySIb3kb1FG14rNadnoERouyaCzIqF6LyyLZ9b
         BEqVAXRZxP0p+LkYpHiH2UtRBul2GXshqsf/Qi0sT6PtZfs1zx75VugrMLR9L1TJgoVA
         okLkh3YjT7JgZRVaIm03P2kreWGrH2oo6/MjEDVVoiogBmkDMFAIijGBxEEjcZ2cZ6RQ
         T3Kkm+hJRI8F+lEdlen6R7GQuIRQgcC5a9yWs6SgN/0aA90VzYEvqn2zs15w/vO7+NSw
         mGDA==
X-Forwarded-Encrypted: i=1; AJvYcCXL8nuxKvnWhlW4RzVN6jphsFVITAmLct9zkUor+07sXnqTnf58npXXEHFx2sTrKkOb8l9Y6hOgLhHCwSnv05qb@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9gd4oBgYVCUGqsdtx0XSV56Q1nnLjkLdr1C7hQCbG/XFK5uGz
	NmEMxPrzhqlbSeIJ8y6ZwtV0j209VnO2T9n+opg1Cn4BUndNNyixJG0o
X-Gm-Gg: ASbGncuO5iXq0+SmCTAx/aab5uiMBOnXSTtXxXEMn5gRhyJKuVNPn4dAogTtu4dmt7x
	fPZ7Rj/v3iPZTNt95pemut9KmG2yEDRzjRi6S13Q590nMnm5VGUXDSg2q9Lyxzv65h35ZOGTXBO
	E8KGo8tVY58liPb+8cEhg7bpxW8iYbFRzwCT4M8T3whdEeFoJ0m3TX5Kaf8xwBsegJy6qK87ObI
	j3uUkhYOLcerra+qozWfOcXkD0/4uQlUKKJ1/AZqtyx4XCgPDwDoG28jeaelprRutrrCSHv7GM7
	2MgL1vGjx9djtRGN0XXgPVYziG5HrgVclebP1911zzLUK77B3BjfnVfF+hojjbHkw5VRALpYIVW
	CUrwm1q/SY9rH6VEpqct62dzo1khckEBn9TQi4k4DagHQQndA57DCeOFtNdNeOA8QQosBeFnbGZ
	YgwtBTFBv83eVnNYWnwtDWFUXulNr0TH35qzr/RBupbnpSqJZ2Up/YzchR32nMEH71Ug==
X-Google-Smtp-Source: AGHT+IHKBCKSyXwqmqDibyNSehgzgh3KJ1v3HqV1svmFXRruujCX1mFQdmNmlH2lr9fy9Bcfr5S55w==
X-Received: by 2002:a05:6000:4024:b0:42b:2dd5:42be with SMTP id ffacd0b85a97d-42b593234e0mr18915716f8f.8.1763567364171;
        Wed, 19 Nov 2025 07:49:24 -0800 (PST)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.3.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42c9628ebacsm25969755f8f.30.2025.11.19.07.49.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Nov 2025 07:49:23 -0800 (PST)
From: Jack Thomson <jackabt.amazon@gmail.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	pbonzini@redhat.com
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	isaku.yamahata@intel.com,
	xmarcalx@amazon.co.uk,
	kalyazin@amazon.co.uk,
	jackabt@amazon.com
Subject: [PATCH v3 0/3] KVM ARM64 pre_fault_memory
Date: Wed, 19 Nov 2025 15:49:07 +0000
Message-ID: <20251119154910.97716-1-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074927_053206_EC3C62F2 
X-CRM114-Status: GOOD (  12.14  )
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

From: Jack Thomson <jackabt@amazon.com>

This patch series adds ARM64 support for the KVM_PRE_FAULT_MEMORY
feature, which was previously only available on x86 [1]. This allows us
to reduce the number of stage-2 faults during execution. This is of
benefit in post-copy migration scenarios, particularly in memory
intensive applications, where we are experiencing high latencies due to
the stage-2 faults.

Patch Overview:

 - The first patch adds support for the KVM_PRE_FAULT_MEMORY ioctl
   on arm64.

 - The second patch updates the pre_fault_memory_test to support
   arm64.

 - The last patch extends the pre_fault_memory_test to cover
   different vm memory backings.

=== Changes Since v2 [2] ===

 - Update fault info synthesize value. Thanks Suzuki
 - Remove change to selftests for unaligned mmap allocations. Thanks
   Sean

[1]: https://lore.kernel.org/kvm/20240710174031.312055-1-pbonzini@redhat.com
[2]: https://lore.kernel.org/linux-arm-kernel/20251013151502.6679-1-jackabt.amazon@gmail.com

Jack Thomson (3):
  KVM: arm64: Add pre_fault_memory implementation
  KVM: selftests: Enable pre_fault_memory_test for arm64
  KVM: selftests: Add option for different backing in pre-fault tests

 Documentation/virt/kvm/api.rst                |   3 +-
 arch/arm64/kvm/Kconfig                        |   1 +
 arch/arm64/kvm/arm.c                          |   1 +
 arch/arm64/kvm/mmu.c                          |  73 +++++++++++-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/pre_fault_memory_test.c     | 110 ++++++++++++++----
 6 files changed, 159 insertions(+), 30 deletions(-)


base-commit: 8a4821412cf2c1429fffa07c012dd150f2edf78c
-- 
2.43.0


