Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5B1CD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 17:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ME+xNkoeE4ctIAxfAzYaPkyPD55bBWMm21iy3jKU/r4=; b=jRN7mKUX0QTtidsxS/lwk8z06s
	b9lkPn8mr1mkk1yC7UHuMwYEEjDosRB4Efw/l2WCEsyvCpKqClsyGBZBRhdgTB4ka2sEySajR5qvH
	qQjv7149ChTOG6ws0tkckhmAD9liZCGxSoyIwLFLCWV6ksFcxLgqojI25qeO0od2F9krdm5gmdIFw
	lftP0p54xXucLcbwvwHph5/vDM4DBUc2bF92lSKBykWIS0K0NZTOP2s5m1mc3mlFLUuGosWde3yE3
	JcPftC5Fb5ptmfs80EbY5Gdm/n5TS4IbQhp0Cpl24CE/U1c1UJwS71yMqrayj+nanx73dJLETMp0O
	2P/FxWJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVvGm-00000001k1E-2OEi;
	Sat, 06 Jun 2026 17:57:16 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVvGk-00000001k0v-2TBL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Jun 2026 17:57:15 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2bf0ddaf50fso20204155ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Jun 2026 10:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780768634; x=1781373434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ME+xNkoeE4ctIAxfAzYaPkyPD55bBWMm21iy3jKU/r4=;
        b=tC9Ytfz+kUiJIVJRdf7HEEZizH9FMKlkfQmSmFWOtyf3GX2zgsRQVicbVg/yzQPtEz
         DlYPQ7C/+ZPKwnPTvwm++T98KvUFtFdcyzlfop/3MMmycZUZe5ntxb0WRVtQoyc4D3Im
         7YDojDuJye92LSFjM/3cohV1bOiFOK7SCd2iAT0GNdT7wZzkGhfV+/as9mLMUo+BY78U
         gL2MkkYqq+EC53oYgVnxo9RzJinLvFFGUOv5I4pEEwpvACXL9EDm+De+dUxeC0yFwngw
         EYMi05fkaxBu9fgWIVt9D0XOAFQW7qiEFOWwScsH6I7efX+AqjY0PUbc2fhaHmOSljT7
         PWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780768634; x=1781373434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ME+xNkoeE4ctIAxfAzYaPkyPD55bBWMm21iy3jKU/r4=;
        b=pLFnUMIPe3MG98BNB1eHS83fByXd6LiryTqiCaF7JtnqU0w6VTL5c2qrLp2IJQ4CqJ
         dM8z7zI6kgw1yDz9U5nleEBHEL2fXUynI8wjSKCjYiysiDIkBmyjO59ytvt9+/fSknjc
         FTunbCpZfqimXLYSHDbot7PT8uhQcwVlK6alFqXy2xNHCrqre7TIVMOU4+MvhnC/ohae
         AkRRctAX0MXY9KuUigMFHJrNvwkZaEeCrIMe7veIKfvV7CLntWDZPV5LG37fZQ4KZUyo
         VoPHWKilNu960H8RwxlqQJ+bDkaqlGRvQ+uYzUfyv9Vk/l0Z6H7VRCZRZDUqF3+WVkLx
         pCHw==
X-Gm-Message-State: AOJu0YyhJ2+GanrcrEaDbFpj76VKfJkDFWmVz9//reigyz0YJWWN8gzy
	B5jbMu0VB4jRVz1A+UBS6OkQAsyLkweqrmWBp3zgGxmdTHSylStX2z9S
X-Gm-Gg: Acq92OHl67JK5MAVZKm2K7lic8LhapIKm1S/rYkAJWJS7Fj/ZvizUUO0pYznwEuhNoe
	N008GTZaBl7ODB32OJl0E5FWZLHBWfnPkKyKuKL6ZgKjYX9acmbIf607bAFeBWk1ifZEXbdlp8R
	6hgdI66xYB9zsFphvzZvX5b6/oPMo2WgPut4iVbclx0yKFJd9qcAXd21HVARiexyFwcU92Fh+hx
	eUVQGfS6mKWc7fHn4wkuPCu1CRARL3MRIPvxf2A8nGRW9TmG1ofIInqt/R67U6H7hwWY6kiLUg5
	iwKmPY7VkmtDb14jfBQeDYgXkPaXb2kgnPYruu6ORWDg6URiB0aHvgp7X7W32Syi+3s/picMSzX
	Vp38AK2d3Osja0707Anxu0V3UAi/NUawQH8np24U6po5RtLF3JNSyXR+i9CWzGX7H/hOvCtODNs
	Ju9yNGPIK1Au9l1/cXxCCyhqoiJa56Imn25est1fJ7SjIhh4+9HJKI6esKwst1Nvap0lU=
X-Received: by 2002:a17:902:e545:b0:2bf:1486:e6bc with SMTP id d9443c01a7336-2c1e80ee016mr102752615ad.29.1780768633594;
        Sat, 06 Jun 2026 10:57:13 -0700 (PDT)
Received: from v4bel.. ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d69csm129196425ad.2.2026.06.06.10.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 10:57:13 -0700 (PDT)
From: Hyunwoo Kim <imv4bel@gmail.com>
To: tabba@google.com,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	stable@vger.kernel.org,
	imv4bel@gmail.com
Subject: [PATCH v3 0/2] KVM: arm64: Sanitise host vCPU fields copied in flush_hyp_vcpu()
Date: Sun,  7 Jun 2026 02:56:09 +0900
Message-ID: <20260606175614.83273-1-imv4bel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_105714_628654_29469BD0 
X-CRM114-Status: UNSURE (   8.66  )
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

flush_hyp_vcpu() copies the host vCPU context and vGIC state into the
hyp's private vCPU on every run. This series sanitises two fields that
it currently copies verbatim (host -> EL2): __hyp_running_vcpu is
cleared in the guest context, and used_lrs is bounded by the number of
implemented list registers.

Changes in v3:
- 2/2: replicate kvm_vgic_global_state.nr_lr into hyp_gicv3_nr_lr
  once at init (guarded by gicv3_cpuif), instead of reading
  ICH_VTR_EL2 on every entry behind a gicv3_cpuif gate. (Marc)
- v2: https://lore.kernel.org/all/20260604151210.1304051-1-imv4bel@gmail.com/

Changes in v2:
- split into two patches, one per field, per review.
- v1: https://lore.kernel.org/all/aiFe-CXo-XVTFz1g@v4bel/

Hyunwoo Kim (2):
  KVM: arm64: Clear __hyp_running_vcpu when flushing the pKVM hyp vCPU
  KVM: arm64: Bound used_lrs when flushing the pKVM hyp vCPU

 arch/arm64/include/asm/kvm_hyp.h   |  1 +
 arch/arm64/kvm/arm.c               |  2 ++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 12 ++++++++++++
 3 files changed, 15 insertions(+)

-- 
2.43.0


