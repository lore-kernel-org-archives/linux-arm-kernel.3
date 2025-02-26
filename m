Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2945FC19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 22:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7IvPw5iGc/k53b4/rPiCRpRIXAnRcZkrel3cZcM0Zew=; b=npw8Xp05maHtJz7I3DnL2sy1YZ
	udExvDnIjEQcP+EViWOiw+qxDqiKrn1IL+QNqgO/pVEQsnTHWeqSCD1K8sNGsRZCeSo0xpF1B19N4
	5jrD1q/phYuQ09rFj76D5e6JFyizIJMN+oGWe5rvoJELJZ0B+HnTE/9ni6xGULs8SKMpJKO2NOFc5
	yD3+nUHnjkQmxWPVVyuaI/wsduTkF5K632CYc2HjNdSaQnaf4k+32PFliMQZRqmyFDZqpiEcHXe4V
	0tet5qU9BsiKUxBov97IPdZFqwu8CNKGUGtckBKperpIC0kiAd/O2W81wQKynu9IuytgBIpTtarA5
	3CsUM2dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPTl-00000005Xob-2cpB;
	Wed, 26 Feb 2025 22:02:09 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPNE-00000005X7q-4BYM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 21:55:26 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-38f28a4647eso71647f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 13:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740606923; x=1741211723; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7IvPw5iGc/k53b4/rPiCRpRIXAnRcZkrel3cZcM0Zew=;
        b=aBlU3snzz6U9GN5NJUdNW8fTEx4vjFwM7VopWjKbkJkjNi4HqB+3uqoivBdHwcIDdj
         vUpNDpTJbbzdmYbbVyNtkJhMFc+k1OqUgAg9cE24SqjgYl+O9vFMFKU6gJa3KT+/fwJp
         B0H+Z1kWZ4epdycuEC53jHisKa33q+Gx4qoL5cLV+2VBIetsmLNnl4926rks/oqJJT82
         2xj7Fsczo704OrRrsTtLksocpcNhXP+ztZ8Z1Oz6lt3ShgvkDhVPw9WXfks+ZNo9QNL2
         BVC3RhqwakysPvwl8QCLFV2iUc95c/cCg1BVm1VM+iGlNbT5WIALdFuKcZ3Mgx6FT5bB
         8rJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740606923; x=1741211723;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7IvPw5iGc/k53b4/rPiCRpRIXAnRcZkrel3cZcM0Zew=;
        b=Jo4s4WJ4f3AwzENx9oa4FCmIcNdCJ4ORcdwGFWpRlhotHkuwtLKhETE74KS44bmcbC
         X3e/OZAKTEvGdLLiJinUZRIHUGm2mzi5Y6I71/QENvYzn0+lcEjgNVqgPUIpARCln5OM
         OFceQUnk0l2RyY9FYVEioDkX/ifcji0UmjVo2qnRK1il/pG20G/Xo+X9bdBPmHuHFafz
         +LRmkS3M+oSmRA/kWI1uW9oLi46neoY+l7OBZMgDxk4bZ6RfBLVyC5LEz0uXcfpoMgb7
         SV/n1pzF77iF+AGJaxMl3IwGSrZFrpqV+SZnVEW5w/0xvqiiRFw5d0UtrKgls71VcIxg
         aZ7A==
X-Forwarded-Encrypted: i=1; AJvYcCUgHYmhEX+rB1+clFUx4Un/4uLluKThCARopUVRdYMZa1jG2skgLGGBQKfIWP/AybKpK5KdpAgc1Bu28RzkqDCz@lists.infradead.org
X-Gm-Message-State: AOJu0YxSjEZ66vF7Yf2Ymd00u6l/BVZrUSsCym+Vz8fLAbade+ML0U5t
	cENFNIpg1ipThJUzKKDDCVfOFWz6Lcdcs4zcdf8kIT8cf3tSkXVKH+TY88hT4lirgsX3j4eoRA=
	=
X-Google-Smtp-Source: AGHT+IGXlbqPAwAa2eKU5tILxiLuRG281n0weT0i//QObTL7/xbiqPS0o5r4y1I8zjQNvEu6szJcKMd1wA==
X-Received: from wmbg8.prod.google.com ([2002:a05:600c:a408:b0:439:88bc:d27d])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:588b:0:b0:38c:5dcb:312e
 with SMTP id ffacd0b85a97d-390cc3aff06mr7754343f8f.0.1740606922779; Wed, 26
 Feb 2025 13:55:22 -0800 (PST)
Date: Wed, 26 Feb 2025 21:55:16 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250226215520.1759218-1-tabba@google.com>
Subject: [PATCH v2 0/4] KVM: arm64: Fix initializing HCRX_EL2 and other traps
 in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, mark.rutland@arm.com, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_135525_040027_4A063692 
X-CRM114-Status: UNSURE (   8.49  )
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

Changes since v1 [*]:
- Factor out setting HCRX_EL2 traps into a separate function and
share logic between protected and non-protected modes
- Rebase on Linux 6.14-rc4

For context, please refer to v1 [*].

Cheers,
/fuad

[*] https://lore.kernel.org/all/20250214150258.464798-1-tabba@google.com/

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


base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
-- 
2.48.1.711.g2feabab25a-goog


