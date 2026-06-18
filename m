Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6FCCD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 09:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jYtovqB7kdiINejrOv1fG0IAw5VWPSFbwH/MJT2FPq0=; b=F2+HaVowjVs3WwfVzgytDL+xtC
	VR4Ku8j3hG5u8GeAh3ivjCSmKqSsPFUWtLgKPcqtD7MEHGN1e9rBnnmZWtMWSEm5zT/s6Me9wXuuw
	AdnGbpthTdV74zm1Ga3dWW4kc62LEASofQK17OjKNHF/NEGw0HsPltY/De9cVkb5SUuQm0TSt29Jg
	gzr0h9YZSyBDCzm0NbKEOzoctnRKbeduRLNkU7VMAK3aPn8V2EVv8PK8xNZ4REzwYKh7F8mDZIByf
	XOFhOUTRwxrno+HDdg7WF80Fs+E94fQWj0iol1G7dCVIpdW5lzoEbW3D2kh8cB9GnWkmsM945/T2N
	miznPN2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8cw-00000000tC2-3fS1;
	Thu, 18 Jun 2026 09:01:34 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8cu-00000000tBR-14pg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 09:01:33 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490b9cd54f3so4045635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 02:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781773290; x=1782378090; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jYtovqB7kdiINejrOv1fG0IAw5VWPSFbwH/MJT2FPq0=;
        b=LnFDOMpTkYnpwowJOt9b4/tOspK/uWmVJG2s6RUDyIZM6G/+oHUy+rUnwvA4DMjzEC
         iAfi1yQb5RfJhRDosniTLp9oZj7nOT6LPS3OHLsH5+juOxqUlIatjcjXku9MFwdptuUv
         dtGaHXlZJAi7ItTVG71EULxOEbwuzDBTrjAEMHfocItA2Jq9/NHUo5dZh6vUF1tQZ1Bx
         abpGDpMMD5rRWnaMlCAdv4pXsad+F7ZXJSl5x0tOixQwwjKzOLopcpHAwzaI8toa1SHm
         eKVgzj1GiegnJIBcJpxV7+tPV4BsqxbdqRUJkPzAeGEA2HGjD6H7NP7KAHgIwamyjZ0Q
         V6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781773290; x=1782378090;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jYtovqB7kdiINejrOv1fG0IAw5VWPSFbwH/MJT2FPq0=;
        b=CQ3ZijW6yKJbY4f7KECuwl4IqZenYQORjZi2FXkJ660Vy7yjaxi7reiJ8PBH22a1Qb
         qjFOEFf05jt/01GzzRzQ5u8JGFqLny57HHXoUBIItmS+wOM0ihT49Km/2fOHCXVcPCBY
         /Z7DspyTE/9e4r+np7l6k6jnpexuPIRY0nDWlCiUBIF7cFlgVbqWtxTXgQ0jwm6/04iq
         mEto0jFCIn+A2DWWeaFV0iIzwapPfl96saN7cNR6oUmY6547ObF566f2stsl2XfTPn8u
         sHMuNEr822rD1bNRkQyWGe3epCR6n6dl5qLJkuUDMezsDpcfZuIjNrwDb5yPpR5wcPcQ
         GVLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8i8vV2gcWCak94vGBxE1txdMDE1+disxNTBcVci4Ti8OG2ABzT9794ZPgNbo4vgqpQizbtc+QEsCaT4FDD0AEt@lists.infradead.org
X-Gm-Message-State: AOJu0YyhSe+LlODAIu6MMVhjpqzgF/jpO/3/ljlauvGBpBHaK6c6sUWa
	5QN/C0JSeL6w5nSUft++FQEb8fDC1KER5Q4Nmr8jRlvQwITeqqB6IEkMD7j1NHVZP372uOTO42y
	6vA==
X-Received: from wmrk26.prod.google.com ([2002:a05:600c:b5a:b0:492:2566:3b6e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4fcf:b0:490:c024:2ec8
 with SMTP id 5b1f17b1804b1-4923819e3f0mr44387665e9.0.1781773289396; Thu, 18
 Jun 2026 02:01:29 -0700 (PDT)
Date: Thu, 18 Jun 2026 10:01:25 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1189.g8c84645362-goog
Message-ID: <20260618090128.3913688-1-tabba@google.com>
Subject: [PATCH 0/3] KVM: arm64: pKVM is_created cleanup
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Keir Fraser <keirf@google.com>, 
	Hyunwoo Kim <imv4bel@gmail.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_020132_306370_164542CA 
X-CRM114-Status: UNSURE (   9.42  )
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

This small series tidies up the host-side kvm->arch.pkvm.is_created flag,
which tracks whether the hypervisor-side (EL2) VM has been instantiated.

It comes out of the ongoing pKVM (protected KVM) upstreaming work and runs
in parallel with it. The changes only remove dead or redundant code around
the flag, not any of the functional paths that work touches, so there is no
dependency in either direction and the two can be applied in any order.

is_created stays: the pKVM handle is reserved early (so host MMU-notifier
TLB invalidations have a valid handle before the first vCPU run), so a
non-zero handle no longer implies the EL2 VM exists. is_created is what
distinguishes "reserved" from "created", and the teardown path relies on it.
Only the cruft around it goes.

Cheers,
/fuad

Fuad Tabba (3):
  KVM: arm64: Drop the unused EL2-side is_created write
  KVM: arm64: Remove unreachable early checks in pkvm_init_host_vm()
  KVM: arm64: Drop redundant READ_ONCE() in pkvm_hyp_vm_is_created()

 arch/arm64/kvm/hyp/nvhe/pkvm.c |  1 -
 arch/arm64/kvm/pkvm.c          | 13 +++++--------
 2 files changed, 5 insertions(+), 9 deletions(-)

-- 
2.54.0.1189.g8c84645362-goog


