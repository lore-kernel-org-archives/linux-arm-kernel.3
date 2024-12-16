Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B88E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 10:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xQDDzZt4y0tR25eU8iMMeXksMyuUkWpuvz05sBggv+g=; b=LQEui1vtDYcWDFtHCSg4G0wXYa
	ZJl+O5IYjifClruomHN9L4HRxsIZT2amUVuIdjhVVpyoKO4sSajZvTYOh7NRCQ8WILdlvWCva8BCn
	8ReDgwSkfg5HGTpxcvPK7TKe/zC/oyek39Ten0zsF7b2nJzeIhxUxH98/KF9kHubuS/u8snvFFvBr
	2/xJMznOJl7bsV6tqtidScpz/aQluXMxN9nrPmdm90RP+NrKUVOrCwtEEJuRjoWvaiGFVv8pMC+no
	gtq7AQ34hbVH+Knf3BSHeuwBF28p5b2JHcLZt7NE5OVRS2xJGXLdm+OHt9vt0apjrQWUj1PDJoZtj
	8194uFHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8ht-00000009k7N-34Fj;
	Mon, 16 Dec 2024 10:52:09 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8gn-00000009jvJ-36z1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 10:51:02 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-436379713baso8881325e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 02:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734346259; x=1734951059; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xQDDzZt4y0tR25eU8iMMeXksMyuUkWpuvz05sBggv+g=;
        b=Zmx/mjhpZ+KhiS7h/b4IpSnMN/Ge3kHDs49l8aLCp8P2+6CGGa2KmR8Vu7s8wa40XF
         Dh1YgfFmgiZ4+beNFXuhFStNvqfY53OwVHMf+XwVkt5hE0ib36QMb83ueYbOpw1x/0jW
         LPUWBGcXXps5kT5ww4EWmPq16DTwwF+lsNciEkSlxGdSpF1XY6xhbr4NLRwjiLQ5yhsw
         ZiIb0NBv7IRADf6mN1rqABPZJtTjAVEevqcTq2TSE6Kc502BcosE1U6Ov3yP5MFE4JnG
         758qPBUoS5mx6taIBfx1blfzz19A5Xag/Bwk+hjTYA5Fm1UXvioINGBQAC6LZX/XBPQD
         T7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734346259; x=1734951059;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQDDzZt4y0tR25eU8iMMeXksMyuUkWpuvz05sBggv+g=;
        b=s2xygZeqn1FW2POraPO0APjXtVhosjsDyWYYczY/0OCyex3gvM5KjDME8csbxDzxOD
         2h23hd34mumUUWQIf++T5lZnlh3DqfDdEuaZMePhXbEF7UC2cRosx38ZuigOPafRcIfW
         Pbqi/+F4pRHhkU25uDrK0/EORE9LBmi3nspXzGoPYaCSY8mPCiDnWpEzebKj7RZCvyTi
         zZvriM9BDMtUVe9oJZs5UWrEfEAsZJ3Q13MF+O5nfkm+kUNsSVKLzYciEtbvp1FGndI5
         KndLWKfwUyIeKGxHmRxNFP62mnXXbz9xVSVFHQ7l1jQ/ETgH+I2uORA9i8sSABwHuGpe
         yrbg==
X-Forwarded-Encrypted: i=1; AJvYcCXXrWWWsNl501/daCwYERqT0hUd0ftDrie8q6AbKQWEQqKCw3n23LKlqZQK9vBE38fwuzLbci54JO7AonbCThhv@lists.infradead.org
X-Gm-Message-State: AOJu0YymSggrajxXHHS7OKQTjnX7DotDrK3yGHRCmfs49HbeZVmWK4D3
	P+P4Q7wLY/ngr7h/vFT8Ahl6mjrN1tsXzPtog+3lzquQi7inhYrZLdcmZM6h6rTx/u6NL+azrQ=
	=
X-Google-Smtp-Source: AGHT+IFBE3ka5DUpquNIVyUccGkw78xq0QQq56z5catf4lSJVI6W8C5lL8e99RfPzfOguFI3u5iJMdYweA==
X-Received: from wmfq8.prod.google.com ([2002:a05:600c:2e48:b0:434:a922:b240])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c12:b0:434:f623:9fe3
 with SMTP id 5b1f17b1804b1-4362aa3d8bbmr117977035e9.16.1734346259304; Mon, 16
 Dec 2024 02:50:59 -0800 (PST)
Date: Mon, 16 Dec 2024 10:50:40 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216105057.579031-1-tabba@google.com>
Subject: [PATCH v5 00/17] KVM: arm64: Rework guest VM fixed feature handling
 and trapping in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_025101_796187_00C974DA 
X-CRM114-Status: GOOD (  13.31  )
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

Changes from v4:
- (Oliver) Add assertion in kvm_init_pvm_id_regs() that vm_table
  lock is held.
- (Quentin) Carve out patches that fix RAS and that remove the
  feature KVM_ARM_VCPU_POWER_OFF from original patches, for clarity.
- (Quentin) Add a patch that refactors existing code to use
  kvm_vcpu_has_feature() instead of __vcpu_has_feature().
- (Quentin) Fixes to commit messages.

Other than added assertion, no functional changes between v4 and v5.

This patch series redoes how fixed features for protected guests
are specified in pKVM, as well as how trapping is handled based
on the features available for the VM. It also fixes a couple of
existing bugs in the process. Please refer to v4 for context [1].

This series is based on kvmarm/next (60ad25e14ab5), since it
requires the patches from the series that fixes initialization of
trap register values in pKVM [2].

Cheers,
/fuad

[1] https://lore.kernel.org/all/20241202154742.3611749-1-tabba@google.com/
[2] https://lore.kernel.org/all/20241018074833.2563674-1-tabba@google.com/

Fuad Tabba (17):
  KVM: arm64: Consolidate allowed and restricted VM feature checks
  KVM: arm64: Group setting traps for protected VMs by control register
  KVM: arm64: Move checking protected vcpu features to a separate
    function
  KVM: arm64: Remove KVM_ARM_VCPU_POWER_OFF from protected VMs allowed
    features in pKVM
  KVM: arm64: Use KVM extension checks for allowed protected VM
    capabilities
  KVM: arm64: Initialize feature id registers for protected VMs
  KVM: arm64: Fix RAS trapping in pKVM for protected VMs
  KVM: arm64: Set protected VM traps based on its view of feature
    registers
  KVM: arm64: Rework specifying restricted features for protected VMs
  KVM: arm64: Remove fixed_config.h header
  KVM: arm64: Remove redundant setting of HCR_EL2 trap bit
  KVM: arm64: Calculate cptr_el2 traps on activating traps
  KVM: arm64: Refactor kvm_reset_cptr_el2()
  KVM: arm64: Fix the value of the CPTR_EL2 RES1 bitmask for nVHE
  KVM: arm64: Remove PtrAuth guest vcpu flag
  KVM: arm64: Convert the SVE guest vcpu flag to a vm flag
  KVM: arm64: Use kvm_vcpu_has_feature() directly for struct kvm

 arch/arm64/include/asm/kvm_arm.h              |   2 +-
 arch/arm64/include/asm/kvm_emulate.h          |  29 +-
 arch/arm64/include/asm/kvm_host.h             |  25 +-
 arch/arm64/include/asm/kvm_pkvm.h             |  25 ++
 arch/arm64/kvm/arm.c                          |  30 +-
 .../arm64/kvm/hyp/include/nvhe/fixed_config.h | 223 ----------
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |   7 +
 arch/arm64/kvm/hyp/nvhe/pkvm.c                | 341 ++++++---------
 arch/arm64/kvm/hyp/nvhe/setup.c               |   1 -
 arch/arm64/kvm/hyp/nvhe/switch.c              |  52 ++-
 arch/arm64/kvm/hyp/nvhe/sys_regs.c            | 404 ++++++++++--------
 arch/arm64/kvm/nested.c                       |   8 +-
 arch/arm64/kvm/reset.c                        |   6 +-
 13 files changed, 446 insertions(+), 707 deletions(-)
 delete mode 100644 arch/arm64/kvm/hyp/include/nvhe/fixed_config.h


base-commit: 60ad25e14ab5a4e56c8bf7f7d6846eacb9cd53df
-- 
2.47.1.613.gc27f4b7a9f-goog


