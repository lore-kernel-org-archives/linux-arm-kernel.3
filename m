Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB24CC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 15:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v+V5afcNzjmQTBS8vhpoJ2KI1ZaPZAnRYb5xq/a2u/M=; b=A3hLkpdSsX0xWDTmo/KQUTdg97
	eOWPWdq7WZYlVnY/gQY0fPRhLy1EWXFLtfqBIJccAKG6FXlTEAeZh/nZDsJcgd6ADO6iVTCb2XYT/
	CtmkrW2mUzaMKZDifvhh1HTy0Xy10PLZghbQep/+Ql4phFFjgxWFmWXiFzr0BAXFGVgSsuiLjrBSJ
	0HCXVVhe6sHcVYNzmSRTre3sU/VrJZpPnPyopvmiCgWo2as7qGUFlJEPv+iTbOq/Eg48LrLx+3WZX
	8rAHgoRCVVrzAmZGa1lguLaRxII1nzhpJgDkf5A4ZqKPD1m4gMEmdeneuGm6AHAyKo7qjBnk+11/A
	zv0NX7SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJMk-0000000D7Bl-3MUl;
	Tue, 05 Aug 2025 15:14:14 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujI9M-0000000CuNf-33JB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 13:56:21 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-458a31421a3so21057725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 06:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754402178; x=1755006978; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v+V5afcNzjmQTBS8vhpoJ2KI1ZaPZAnRYb5xq/a2u/M=;
        b=g1dTxEmfU0nBhraNsP1sCJSVsrqdopv0osMJ1kh3RFAWLtth2btfBdOiZ1wzQ/dFPE
         5JZ0vc4P1ymgN8yLXd/l4DMhmDcEJlAUIiz4j/DX9NccBfpP8Reuh5liPF7ntuCE/C2d
         +vNnGGvgbP/iT2wTNcHDvVHQzlmT3K3ztCpU+kbXgcZg7AyZKM/1h9BB/jeWAhd/4UNB
         ZT47UApfLBK5m5j0h6KHWMPIkEQrlo+4vTifCuI1v8/ajWtJh7QpVStqCQT3hC8LrKW2
         IpshN+kzy0L7ISVG6tdt0PxiTgEDUoNNRbaB/3dzcggt/fq5ikJT1i4iDACngyNtpWKh
         Arng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754402178; x=1755006978;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v+V5afcNzjmQTBS8vhpoJ2KI1ZaPZAnRYb5xq/a2u/M=;
        b=TK6Ai7PvcV/QqWrU2ziSzMlgzD964LqeTNvxMxuSPysxf00HJyzPxWr0lYWuKHisvT
         RsvGj5ncNZP7/3NbpRNtbIt6al4y+JGDraC8Mvu2jQv2h5z/pz8Av53DwW5oLhO+zBdl
         8Lmik9r0//F+tPV/eTNhjXdzoeypU18i7PwyyFI7DIVmhY3DTqeuvCc3D9tUj8W7B+Ei
         6W6Z7bVAy9Okao3yc9GuzhQ6zKYCr1RZfdWZ/pXxLlmtSXIRucsQGMnk8YceWRaunMX+
         Hp6ptORvzINOYsEQHQGEUqILfv2ENhfWbLeb0o/3ewwZ2LjO0zx68oao3T/CIqRQNsSW
         erhw==
X-Forwarded-Encrypted: i=1; AJvYcCX2+2FIeNCOQUDkGVntNpHRZp+BEARrJ7Qa+AxFdD6eFYI//WOk6zDpiAoI7Ej13gFeR+pWlGfKDIxm+aqxjB/p@lists.infradead.org
X-Gm-Message-State: AOJu0Yy34q2ln/eDucIvSlpGlYSc5B94tkeC1oSBaib0272xHHSps/v9
	S/sPFdzefF8mEjdsb+UMFl5pg+tyFZVpP9/CeZpSUDJcLTbSDfW6LABZRGd6mIOnyVhx00pIjpW
	8gg==
X-Google-Smtp-Source: AGHT+IEv5Jetv/aXeCICi/z2t2gF4WBR54hMEQMLieFPQ9MiysPpZWHtfVuZ/f9eWtdzqFWO5hblP1TNWA==
X-Received: from wmbbi26.prod.google.com ([2002:a05:600c:3d9a:b0:458:b8ca:551])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c81:b0:458:c002:6888
 with SMTP id 5b1f17b1804b1-458c0027a9cmr82212805e9.32.1754402178529; Tue, 05
 Aug 2025 06:56:18 -0700 (PDT)
Date: Tue,  5 Aug 2025 14:56:13 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250805135617.831971-1-tabba@google.com>
Subject: [PATCH v1 0/4] KVM: arm64: Fixes to handling of restricted registers
 for protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com, 
	sebastianene@google.com, keirf@google.com, smostafa@google.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_065620_766476_C6117EA8 
X-CRM114-Status: GOOD (  10.49  )
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

This patch series is mainly about fixing issues we've encountered in
pKVM (in downstream Android code), related to the handling of protected
VM access to restricted registers and injecting undefined exceptions
into a protected guest.

The last patch isn't pKVM specific, but a fix to the vgic-v2 code
encountered while fixing the issues in this series. The issue it fixes
was indirectly introduced into the code with hVHE.

Based on Linux 6.16.

Cheers,
/fuad

Fuad Tabba (4):
  KVM: arm64: Handle AIDR_EL1 and REVIDR_EL1 in host for protected VMs
  KVM: arm64: Make vcpu_{read,write}_sys_reg available to HYP code
  KVM: arm64: Sync protected guest VBAR_EL1 on injecting an undef
    exception
  arm64: vgic-v2: Fix guest endianness check in hVHE mode

 arch/arm64/include/asm/kvm_emulate.h     | 184 +++++++++++++++++++++++
 arch/arm64/include/asm/kvm_host.h        |   3 -
 arch/arm64/kvm/hyp/nvhe/sys_regs.c       |   5 +
 arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c |   2 +-
 arch/arm64/kvm/sys_regs.c                | 184 -----------------------
 5 files changed, 190 insertions(+), 188 deletions(-)


base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
-- 
2.50.1.565.gc32cd1483b-goog


