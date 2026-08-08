Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30EEC55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 08:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FrZdKcH2ruwKtKo5KlReOpSBpXMc1Hr8DvI2W2K/qho=; b=WmxNh6w8blRtTK3lmd8/Uz2HPi
	cZcQ+5XrMYpgkJ83961XLXqg8X7DwREYF3cXehaWYCkj/JPSIgNzRt8ngHnrgy1T4ufVw0dT4/vaT
	0Titr5VQHd4TEfJAoM+vAE3SHQcM2dNePfFhMKUaID9BXnIpBI3MItUrHyJgZBlY0Vyo3zd2xQCJP
	Oh23hHBMPLPjHNNgnpJECTKF6xteuGsDtp4GAq4sz377WKwqhaGpJSnNuc9futlW04/uZSGGl9GLm
	v6Qi/3IEVWewkNyb9sW+OH43FE1+DW0H7NNIVpHrtgaettHMeOn1Zw8AyQb0nyLITb+eGiSItS/mR
	ZRALC9YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsct1-00000009Bac-1AlX;
	Sat, 08 Aug 2026 08:58:35 +0000
Received: from mail-ej1-x648.google.com ([2a00:1450:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wscsy-00000009BZu-3u3X
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 08:58:34 +0000
Received: by mail-ej1-x648.google.com with SMTP id a640c23a62f3a-c15fed5653eso17421066b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 01:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786179510; x=1786784310; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FrZdKcH2ruwKtKo5KlReOpSBpXMc1Hr8DvI2W2K/qho=;
        b=mIT/BYr1lVmmdGqeOMJGBkhRlujV92TYSQZH9O6IdHRDQm3Y07ySD+qE/D7+gUWwYX
         AWrXzA8WhUX3D7ZPeoQ76/yJAdIPKXoHj7Urt6CgbrzLRe84BOoWZ2cCLEULhZWNYg5j
         lHRxWfAhPdFYPIRnNS/h47FJbS+gwmwz3d6QKMCEDlQvRayCjKfMdFpnKXmF759g+GDD
         Qxfi5f3GLDjsC7TTsX5AU49LOdM0I+ekmbP1YmLEsPHqz5hjo1N1E0EjaUQR8ssgaQK5
         7jL1vQ3AWAj2Q5yM/w0B+uKR978JElmFath2oro+nr9BOAD5bRA6OE/YwbewBF1Cf4lb
         YOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786179510; x=1786784310;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FrZdKcH2ruwKtKo5KlReOpSBpXMc1Hr8DvI2W2K/qho=;
        b=lhPJZVWXCzKD1tMouk86AnoEhIVyzt0bMusIz/85N41ofTwRW89zQ7R6JTfvfD+GtY
         roxCgD8N2p71LeipPF6EewHFKdTir/wXYfgzuamHa33ksLlY2sQVURFpu6pB6rqVeYpK
         WojfKjStA0oghyODA6v2DxuP7UGD2I/FCYgaLQprooqTXTfe3dVqQNB/nCYunSpiz6Tw
         1Mq0RefoptyMIpe2yJ4qfHyYB+KoFZbwnsCqPZmwE5nSI6+6tiypvpk6DZtgk1hVXFT9
         U1shQJJr+dVBhvWz9oYTwmHU7hK5P6173GZcrLeGX2oVq/3VdvUo/NEvwoc06gTUUqus
         EPNg==
X-Forwarded-Encrypted: i=1; AHgh+RqBcu3k+TV3SNPFEbETgLDtz2YlVTzwzaW16vmcAAwcWMGz23QWwPmTc5B9u+QWwoanGeRSEmYDtjobEW/FXojO@lists.infradead.org
X-Gm-Message-State: AOJu0YzryvIxmIfzVHnXIOKoeJ9dLuHQE/6/EeMw4LvASOVj6KbBcYyZ
	CPqZPu2gq65neUen3R2D97ajilnRuWfdG/RnH/6iqxNv0ETQ5N2+2SAwMdjKMAmvCEftbxc5u2/
	DO/YyyPfY8fuVrQ==
X-Received: from edwt14.prod.google.com ([2002:a05:6402:3ce:b0:69f:274a:c867])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c04:b0:c1d:fb83:9394 with SMTP id a640c23a62f3a-c207339a850mr702312666b.24.1786179510049;
 Sat, 08 Aug 2026 01:58:30 -0700 (PDT)
Date: Sat,  8 Aug 2026 08:58:21 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260808085824.732659-1-smostafa@google.com>
Subject: [PATCH v2 0/3] KVM: arm64: Fixes for timers and pKVM
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, sebastianene@google.com, keirf@google.com, 
	yaoyuan@linux.alibaba.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_015833_004959_B7F61E93 
X-CRM114-Status: UNSURE (   9.11  )
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

What started as a  small patch ended up as a 3 patch series thanks
to Sashiko.

First patch from Marc to consolidate the offset calculation,
follow up patches fix issues with non-protected VM and timer
offset and protected VM running with broken CNTVOFF_EL2.

The patches have all the information so I will keep this short.

v1: https://lore.kernel.org/all/20260806150105.4010701-1-smostafa@google.com/
Main changes:
- Add comment based on Fuad review
- Add prefix patches that also fix the non-protected hang properly.

Marc Zyngier (1):
  KVM: arm64: Make timer_get_offset() work in all contexts

Mostafa Saleh (2):
  KVM: arm64: Fix timer offsets for non-protected VMs
  KVM: arm64: Fix hvhe and broken CNTVOFF_EL2

 arch/arm64/kvm/hyp/include/hyp/switch.h | 15 +----------
 arch/arm64/kvm/hyp/nvhe/pkvm.c          | 14 ++++++++++
 arch/arm64/kvm/hyp/nvhe/timer-sr.c      | 10 ++++----
 include/kvm/arm_arch_timer.h            | 34 +++++++++++++++----------
 4 files changed, 41 insertions(+), 32 deletions(-)

-- 
2.55.0.654.g21b8a5bc05-goog


