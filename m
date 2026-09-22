Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E818C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 10:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4BNeBv2Xk9F1CB1cgKUVArUM1oX+ebQd47lsZ5uxxag=; b=QjaKEFqlnE6nG7ZDyHflpX66Iu
	NXZYKHlqs4Gqs5slDbAStSLlgUwSn+fk83Cnc+WFYVD2NO6+YD1sBJvHFKw7CYRqgnsQyPLWP4uM8
	lJ0YZ28eoz7wQg0fMSes1NEcW7Ev8aqAcoxF5LZlB8PVcWI+ykO8MUEisRgBDkchmN1TXLmQf1lWJ
	LDFIzPChlMaWBU43kEzDqehv4tzRge7lp2PRc6T5vzRZRbtJ+diNg/+OJU7Ow49I6d08g6wk7NRj4
	23HoC065MyI7AV1j1ajNgy4vKGgITUsIzr/e8/COAUvXFmIiKWsP+LnMFuqAwowSLl/Y7pvy7rHlX
	E4ScMOIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xYB-000000051u1-41dL;
	Tue, 22 Sep 2026 10:16:35 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xY9-000000051tS-20xH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 10:16:34 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469d249c4so3503340b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 03:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790072192; x=1790676992; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4BNeBv2Xk9F1CB1cgKUVArUM1oX+ebQd47lsZ5uxxag=;
        b=Eq+YK4QI4TOMBuYGG8SOfrn3NAIodbASN8/rbCIh8iaM17Sy5dT2TdYpwl94GjQPsL
         kqMPBbpi0bBSIsKouKJcPZaGZRJN34xmrq6yt5c2/3H4zVKQscRCcWACThyxD0LfURrl
         Pkd6smGl7VzRwsZaymy0yZyauDGKmTDHmwMKKVqWmJuablnTKSKx8QHurhMkGIiwRNL/
         IBWBxp8H1GXRlovRciLC71Hd3JGW3dP5smAqsz31tvDVSJW6j7TdyjcGJ6m0t0Kg/jnc
         8cZNPK39XWTp8oz1izlVOqFoHrmzWSzqQzYpUOen8Svg6OM6vB6W6yBiL0jto7KB/ML8
         3yuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072192; x=1790676992;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4BNeBv2Xk9F1CB1cgKUVArUM1oX+ebQd47lsZ5uxxag=;
        b=rUxlZQBr7WyfhW8OlEhLEoJdhXL1VxYieCpj44aRGqC4jcQi2AHASfm2bP8Yhc6nF+
         2ta533m/++LgwiAX0SRALmJqQSIXj6l8F35qNGDKDzIYLD8uxVo9FEN3DzvaiYEI4TvK
         ntQTUgrAuwWxpIMXf3jX2ClmJffgaP8iqvD8BGZQVyPZ4GfjI5VxeNjwrO/uy9M7sdor
         Y4Rf1/8/j8pYVmkzxppIhykv0YN1DOoFZuLH8eHF6S+S2B7i++BX6ruCkpZqCYAC7h79
         56hIZj6wzZA31fvh2xbnhYWmKwBp7OhKE1QfvIKwvTY3/QrzWKnPM70+4s2U3jd3AqyQ
         0ePA==
X-Forwarded-Encrypted: i=1; AKwUvBxNTnej8zvUWQOQ1+FaxLQrCbuCRhkINfIheLJGP2Eu6pr9YXWzMaqZs/JVDVp4DfyoXnILLXiqGARdGSVCVExi@lists.infradead.org
X-Gm-Message-State: AFuF++mcxAznWLpdm2WogzUr2mdlQM0SynUfINyZVM0edeLob2NhsZKM
	73UJ3xTMGGWsBIGWD/uubaddBxpfA1E0KJ8V1s5jgNid4lQpz7Ra/SGd
X-Gm-Gg: AYBFou0I6uy4T2cO82EQgRxtkkQenokaJDP1hZ9GIdtXgOMxPsUzirikBWL/J+0GP2b
	4lEEsiVETL5Yj6MSeVs3puI7Dou8q+fsG/4Vrxirj9zfZrSH8B9KqJq0/6DDnCAIG5AVMcs2qSZ
	QR9tDUwGp+/Z1+LMXUDjRurwjIesJA6i8uCUQNQ/yewWY9MTU+yoNFfnDhs1ItEqPsaJNl4axzv
	/HWOKBY/nt6GBu3bIYx4KJ8PGrL60lSRJ3vc4QIegfbpVy/3l/KrgVIlvPvh6NjYingg7qzKrO6
	hw/ZmRhou9e/sfh26h3fVsGyNIsiO0+FonyK2e2yDfBnscUjTOj+7h1cRm+VT6zCR6at1asCi37
	8ifMdKjXQiZFIOXC5hVZP2LBNirHC7u49+0uTcSywp6XeX2+qxsYRjUYmQwTkVn+wWBoTn/skVd
	OZnfWyYqdx/+LMb2NEfObd0ACCeb6dXMd2IjRxkpzCYr+nbLFWlY6/UM1pJlbSUyqJlVHaGXzJi
	Vmp7aizOk4S4erJULQblORtDcR6mwgUH8rJ5A==
X-Received: by 2002:a05:6a20:c91a:b0:3cc:faf3:331a with SMTP id adf61e73a8af0-3ddec5fa40fmr927062637.10.1790072192035;
        Tue, 22 Sep 2026 03:16:32 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:4d0:75ae:9920:3973])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc756a30002sm679379a12.13.2026.09.22.03.16.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 03:16:31 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Fuad Tabba <tabba@google.com>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: Re: [PATCH v3 0/1] KVM: arm64: vgic: Drop last_lr_irq and serialize overflow EOI replay
Date: Tue, 22 Sep 2026 18:16:23 +0800
Message-ID: <20260922101623.39468-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <87bj9r4h9z.wl-maz@kernel.org>
References: <87bj9r4h9z.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_031633_519259_2E069B0D 
X-CRM114-Status: GOOD (  13.45  )
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

Hi Marc,

Thank you for the candid feedback and for cutting right to the heart of
the problem with the 3-patch series on your branch.

Your series is vastly simpler and elegant:
1. Only caching last_lr_irq when LRs are genuinely full eliminates the
   overhead for non-overflow exits.
2. Holding a proper reference on last_lr_irq and releasing it under
   ap_list_lock in vgic_prune_ap_list() cleanly addresses the lifetime
   hazard without introducing lock-order inversions during folding.
3. Halting the VM (kvm_arm_halt_guest) on remote GICR_CTLR.EnableLPIs=0
   completely avoids cross-vCPU concurrency for an event that almost
   never happens in practice.

As requested, I wrote a KVM arm64 selftest for this scenario:
tools/testing/selftests/kvm/arm64/vgic_lpi_disable.c

The test:
- Configures an ITS with multiple LPIs targeting vCPU 0.
- Keeps vCPU 0 in guest mode with EOImode=0 while injecting bursts of
  MSIs to force its List Registers to overflow into the ap_list.
- Concurrently, vCPU 1 repeatedly toggles GICR_CTLR.EnableLPIs on
  vCPU 0's redistributor.

Regarding testing: I currently no longer have access to KVM-capable
hardware (my test setup is no longer available), so I cannot provide
a Tested-by for your series. The race itself was originally identified
through code inspection rather than a standalone reproducer, which is
why I turned the theoretical scenario directly into this selftest.

The selftest builds cleanly as part of the full arm64 kvm selftest
suite, and its framework plumbing was smoke-tested under QEMU TCG,
which by construction cannot exercise the race itself. I'd be grateful
if you could give it a spin on your setup.

The selftest patch is based on top of your kvm-arm64/vgic-last_lr_irq-fixes
branch and has been sent in reply to this thread.

Thanks,
Yuchao

