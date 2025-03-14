Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53ABC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 11:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dGlveVYkNT3ORTsa8Y4KKrCzm4MLsBH8s3oP68vMpb8=; b=1OFP7378YnWKkmiU9PfUv3zJHb
	CF51XfSTbwCJ3cHkGP2pQXPayQROZFY8nvhXc4seL/nmTJwEpWF/Ez6zfq96GfxrLpebnY2D6Vyvc
	eCcmsUjnM1nrcoHipxQsjRtt/srEDsJ2L6LdhLJcCaOI2AOCZFP4MXh95GMc9jc2SCGg/kSua9qFj
	TT/MR1p7Iu/5zg92CT4ZLeWpv/6LX2kG16ZCK9y9QGL23DpSM/X1gYWFV+FHxJUD9/uxX46RNTmWK
	5tNzYci693C2m18En6yKVQaqcsweYYsy5TL0NzkaoNN0ObudB3C23YzbowGRepvcwmC/2NHs2z1fQ
	y+LqeHHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt36g-0000000Dz9i-2DGF;
	Fri, 14 Mar 2025 11:21:38 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt33k-0000000Dyao-270z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 11:18:37 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43943bd1409so15543745e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 04:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741951114; x=1742555914; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dGlveVYkNT3ORTsa8Y4KKrCzm4MLsBH8s3oP68vMpb8=;
        b=nRj2Y2FyvD3hkY5I2/s300KtxuohRC8B5uMOvSclhFv4O76nqdlZ+wmylgycCLllE1
         Orsoy8trcS2oFJlhfr32zCscxsaDWZIlji7LAuuCiNgKg54D7RL7wurc+65fxHGZfv4F
         BpMZ7I/0+8ebaXppbpIazujHjK/K0G8lclKL/Z2aH7miTNlzLHhJbS8dyff5r0qdRvvQ
         f6SSu0fVa15mtwmFRjJKR/cgp/D91msJt4QYrMS4xUzVWvTpCMYH/xYkfXdKdkzDL3TU
         BvWNzWcPTjT3rhYBVUDQOgcybDbHOzBqZeJQuOWvQbDO0KY+jMZvJlEFY7mnsJOCX9+F
         o56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951114; x=1742555914;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dGlveVYkNT3ORTsa8Y4KKrCzm4MLsBH8s3oP68vMpb8=;
        b=i0ymNmYh0B2bwC89fB1a5ftLadkooA4sB6WTzhhciCBGCttxVbXJodhtvX6nvROeaL
         2fgsjZUxr5mIPzAICG3PKr1f8SeZH87sWimaX/mVLFEZ/mejueUsm/9TNJ9lAScYvYy9
         Nm1ayCNXWKvRGm5o27RndbWnp87FNEFLobYmgZZdJ/Va9GVsQPV5oVIoQMPNoPal2IpN
         83T7Li4CZOHjAH6vQCrhbIED8LGk+MGwr1DjfFFnXu0Z/t8sARZWsGs55uuBxsqSdFV6
         1pzg6knREJnqyoEJoGFpd+gIQ3ynkf23qceRKwV2drlWfoDbELdfQO7JxaqH395kumgg
         v0BA==
X-Forwarded-Encrypted: i=1; AJvYcCVLHbd8eyLVz4x2GHHypGlGVaCfnBFxckZwkDB7F/xpdSbTOyHsFgjoF9BQ6iTq8pzI1FJrLuHr81GSG5RJPs7o@lists.infradead.org
X-Gm-Message-State: AOJu0YyjM5QQo0zuEply7Hv9nNOsKl8MHAHwdF9OU5ClIdx5ar0ZDAB9
	ngM9SHAeuuYLkratYvR1UNUMxYw/TptF/YyH/vHAqSjkWc8ShemaYGRANaSFnhU3x6fn6G2cKA=
	=
X-Google-Smtp-Source: AGHT+IGJOLU5r/fEt2G8VDB8bc+OCYCwiUAaTtua3hlqUyNrvce5rqhGBeHSxBkdMi8rNd4X/72wEQMn4A==
X-Received: from wmqd2.prod.google.com ([2002:a05:600c:34c2:b0:43c:f6c0:3375])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:510f:b0:43d:aed:f7de
 with SMTP id 5b1f17b1804b1-43d1ece301amr23196365e9.21.1741951114433; Fri, 14
 Mar 2025 04:18:34 -0700 (PDT)
Date: Fri, 14 Mar 2025 11:18:28 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250314111832.4137161-1-tabba@google.com>
Subject: [PATCH v3 0/4] KVM: arm64: Fix initializing HCRX_EL2 and other traps
 in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, mark.rutland@arm.com, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_041836_538148_EF1EC1B0 
X-CRM114-Status: UNSURE (   7.52  )
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

Changes since v2 [1]:
- Remove WRITE_ONCE when setting hyp handle (Quentin)
- Rebase on Linux 6.14-rc6

For context, please refer to v1 [2].

Cheers,
/fuad

[1] https://lore.kernel.org/all/20250226215520.1759218-1-tabba@google.com
[2] https://lore.kernel.org/all/20250214150258.464798-1-tabba@google.com/

Fuad Tabba (4):
  KVM: arm64: Factor out setting HCRX_EL2 traps into separate function
  KVM: arm64: Initialize HCRX_EL2 traps in pKVM
  KVM: arm64: Factor out pKVM hyp vcpu creation to separate function
  KVM: arm64: Create each pKVM hyp vcpu after its corresponding host
    vcpu

 arch/arm64/include/asm/kvm_emulate.h   | 24 +++++++++
 arch/arm64/include/asm/kvm_host.h      |  2 +
 arch/arm64/include/asm/kvm_pkvm.h      |  1 +
 arch/arm64/kvm/arm.c                   |  4 ++
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  6 ---
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 62 ++++++++++++++---------
 arch/arm64/kvm/pkvm.c                  | 70 +++++++++++++-------------
 arch/arm64/kvm/sys_regs.c              | 20 +-------
 8 files changed, 104 insertions(+), 85 deletions(-)


base-commit: 80e54e84911a923c40d7bee33a34c1b4be148d7a
-- 
2.49.0.rc1.451.g8f38331e32-goog


