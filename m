Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D613E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 10:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFml3JSMGutEQ6gsrAJI0WkcZQLmE0G98yGh0i8+VMo=; b=uoSR5RLFcBjr/znwjbfstlBfZS
	WTyJQCnFaBqJoMmePrlQWtt0MM+ybR+UsBHX7j58BN7+2az1UCSBKhEG2qO3vxjD1qjMc/Q05GUkZ
	/5TT7K4Z4jK1YfUV9gZ2TD1bUJ1Db6n4lMqOIY1jvir3ayaKRMJB6TWqTr4l/VUxQyxtiKQjzMK84
	OzTxJ5dhHq6HsTiN3Hy9KgFhDVsdrQYf/nXw9fE3jRbOA1XOrBI87O8ppIQ9NFngfeZXL1k31e3qS
	H9JnPfGTZjLUfO1tHoxhiFiRArzPzEtYg20lKntIczGVcZ8NAvi1n9x4jRObFieL9KNm7lh3+fQkA
	g3DpR2dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8m7-00000009kmb-0ZM3;
	Mon, 16 Dec 2024 10:56:31 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8gv-00000009jwu-0qPO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 10:51:10 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4359206e1e4so36763495e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 02:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734346267; x=1734951067; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lFml3JSMGutEQ6gsrAJI0WkcZQLmE0G98yGh0i8+VMo=;
        b=yDwx2IjlRIr3LuTw0bejTfhMqUzAkKHEK5EumvPsIyPQqPnTRnPFj6ir8MjIihqZFt
         ExEvVycMcVOdJl59oIEEZSWdsNkju9J8miosmO8ZFtzKd2G4Mc5FaZOfLZoEwiOxHXc3
         f8zISsvKzBb3LiB79I6JDO0M+KwLXc5miMCHbpvd4V3S1ddIeGObtbf2XdCZHt5r2fYa
         v0DQTcvJJpi41A6bZLV63M/TjM93zHnIB34uqJFVYVjfToIgtx25/ezHJz5KZLxlFbnO
         dyWpsGf0iHrSiT/fdHrfXE22lwB76yY342EthsV0p/QcVexudoK0qI2Qu5iGKYqjS9k7
         4YBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734346267; x=1734951067;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFml3JSMGutEQ6gsrAJI0WkcZQLmE0G98yGh0i8+VMo=;
        b=lOQ4scO0uudktnqZILz1USvbEYeW6TcT5VyX8OzpXbc3uR7ktqM9k4kYWX3ebQsipn
         I8STrvGyhJNu2ZMHnJt9rIiKNTDMffijCI3/ZLkqLgsz9MV80sJYODxcpvMTUM9xsLGM
         kKOXAG5ioLfQFbGJJdc0sEKUWCIW8gTAMUXx2EDcDZeDWsnSUDsZg98ELKQoQ81Xtl51
         BUGR2FVsGRggH23XHg2kLzbInnq7FccnANYwTbrONcsk9lauKhBuhOrNyu4eYleIHz/C
         0hoX52F9sMy0EdNDfLZjV5M92Lu9trmjl2TBIjMQTu72aUbVnKELrJZoOH/Vw+OjU9fv
         9z+A==
X-Forwarded-Encrypted: i=1; AJvYcCV3ahMWUf1mnyJOEhmJdh4OHPx6/Bd7xzmE57zNceCOY4qAVrnEe+XT704I5df6zi+NGIx4oBHonqisgOn5DcNo@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3Y9jZBY3PIiZ2Yhk/yif4pgg7i4zuW1izn9Sf0NpFRvcF9pbc
	Fm995y6IytEPRc9hJAkRCNLYAQQHNvbcNg5qu6hAbVAN2uRc3VsSVoakCb3WPoiTv4AvDG4exA=
	=
X-Google-Smtp-Source: AGHT+IFP4ta5i0lcC91zFRM638m44kb4PpoOHu3nr7DtprXQkYFF+xVd+4sDwByOyyfX7UPh0ah2h9SuIw==
X-Received: from wmbdx10.prod.google.com ([2002:a05:600c:63ca:b0:436:1a60:654e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:468c:b0:434:a802:e9a6
 with SMTP id 5b1f17b1804b1-4362aa1b2d7mr107265045e9.7.1734346267353; Mon, 16
 Dec 2024 02:51:07 -0800 (PST)
Date: Mon, 16 Dec 2024 10:50:44 +0000
In-Reply-To: <20241216105057.579031-1-tabba@google.com>
Mime-Version: 1.0
References: <20241216105057.579031-1-tabba@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216105057.579031-5-tabba@google.com>
Subject: [PATCH v5 04/17] KVM: arm64: Remove KVM_ARM_VCPU_POWER_OFF from
 protected VMs allowed features in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_025109_236486_46ABE762 
X-CRM114-Status: UNSURE (   9.44  )
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

The hypervisor is responsible for the power state of protected
VMs in pKVM. Therefore, remove KVM_ARM_VCPU_POWER_OFF from the
list of allowed features for protected VMs.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index fb733b36c6c1..d3f67189497d 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -331,10 +331,8 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 
 	/*
 	 * For protected VMs, always allow:
-	 * - CPU starting in poweroff state
 	 * - PSCI v0.2
 	 */
-	set_bit(KVM_ARM_VCPU_POWER_OFF, allowed_features);
 	set_bit(KVM_ARM_VCPU_PSCI_0_2, allowed_features);
 
 	/*
-- 
2.47.1.613.gc27f4b7a9f-goog


