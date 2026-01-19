Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45748D29C43
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cqYx/rmicLVCTzWxpJX94exhCZFDVHuQzS79ABnXJGg=; b=3xBIEjPJ1pc4iD5Ii8TUbGHn29
	HOvSzndvCv9vtvmCtl7PUpcAWfs/ApZ0tD9QCB77fPULpTkHftJ1hhveDo8Cq1hZ0QyGHFiaBYNsm
	DATjfFVGd39QL2G3fc6mAFlBlitciuqfoaWf9/wQe1vClwCEZcSTBlRnn3sD6/5SIWlmgd8Nrzkq9
	PXhr76zGm91dOjdKciMEf07UVefql49k8lotJujgffzaJbswegzAs1bXsttqtZSbmJY+gZs4Y+ejP
	p9DoY0fyIGrHQ6iKMVDN7i3eciatnjoErpbC7PPaQis46+CS+EaHUzq2sf9AGuMQGh2TiZIUNntzX
	FmNNV2FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsYD-00000002ZNy-1Ukj;
	Mon, 19 Jan 2026 16:56:25 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsY9-00000002ZMd-26Vm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:56:23 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47ee33324e8so26113435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 08:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768841779; x=1769446579; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cqYx/rmicLVCTzWxpJX94exhCZFDVHuQzS79ABnXJGg=;
        b=GHnGviIbhH0mW/Jadrt4XX027jq/RE+gsn8yWPReoMPG4bD1+U3Z5SBXO7Qe/hDIDo
         lL2fQIO0BAKo5Nc/qajPAjWfTdXBHvR8I3YTB4+4K2CZvQKQH4fPlEi+DIBt4Gs66p6k
         +hiOMhGAY4Dt40YKw/uQ8SBiDtIksse7cf3PO90zGuexKYJIvu4K9/VO99nXInuDkBiZ
         VB3iKUBx/ZUXoIWWyWuStDVNKHSK6PGU3OFmpZ1O0TUK16qp0XMctYg7qfUsGUi/TzI4
         Z1+zkZWh4NNDMLDnKTpyrliQYQ2s3RGOfvaNqjbgS0uSk4dier5M1fT+xFhxNYEFyXQ/
         QPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768841779; x=1769446579;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cqYx/rmicLVCTzWxpJX94exhCZFDVHuQzS79ABnXJGg=;
        b=sIkHs3odSSEfrxnadMvZUgOVdoU1O6MQHuovXH6z8zuP5STHIn4K6lxeqTwfWxq14a
         zR0YaTdBw3gYTaVhGH7a7FSU4k0RD9vDIyavq5Dyc88RgrrooOzAHlXifzTVUNoslsc6
         os55ktGOII5yF5RW3XtK+nmq/u7triyrB32uTXa65AC2Sop99QUedWrHxiXGQNzYlVKZ
         RXaObxjK3iIJ3Ly3XDrwRj2cnqTQv5MA/E2HSoZjha0N1vewgVYFmvJ56fgnE0CiAlu5
         3DcxGwXA/+TU1U+C1sbvrnpaKdw2hhP0DxlsrX8uHj0I0hSadngD8WFgcp5WJEpXtYj3
         t0rw==
X-Gm-Message-State: AOJu0YwnssamBAosSg9eLVbj6+p+Qfdq79Pvp53zaqh1PyjBfKNuv7EK
	/C84blUAcVhajGvhMuNtupfWV2LNEMJAarw0dKtQWGggEhJi3ZpCNmJdMs9LgyGVU1Fv+hTETw=
	=
X-Received: from wmig10.prod.google.com ([2002:a05:600c:140a:b0:47a:9f70:c329])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4ec7:b0:47d:4fbe:e6cc
 with SMTP id 5b1f17b1804b1-4801e30dc6fmr154183145e9.13.1768841779319; Mon, 19
 Jan 2026 08:56:19 -0800 (PST)
Date: Mon, 19 Jan 2026 17:47:48 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1372; i=ardb@kernel.org;
 h=from:subject; bh=aFXAYxFLHefKQqOMkpCoaUbNGK1uxu0eQnnDcJ/NvoE=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JITMvweTYbSPzwrLd/e/qIuLfxspVdrHKTL2+/cGLWbINU
 ed+73jdUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZyrY6R4f8C0UfLDR6832Q5
 VyOtPjGKTy/0y17zdTfu9Mid3r5p2nJGhuYM00svCnPqyzX1nITWXT15gH2dQ8jJ9fOfe0/ewmu UyAEA
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260119164747.1402434-6-ardb+git@google.com>
Subject: [PATCH 0/4] arm64: Unmap linear alias of kernel data/bss
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_085621_595499_BE74BB0C 
X-CRM114-Status: GOOD (  10.34  )
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

From: Ard Biesheuvel <ardb@kernel.org>

One of the reasons the lack of randomization of the linear map on arm64
is considered problematic is the fact that bootloaders adhering to the
original arm64 boot protocol may place the kernel at the base of DRAM,
and therefore at the base of the non-randomized linear map. This puts a
writable alias of the kernel's data and bss regions at a predictable
location, removing the need for an attacker to guess where KASLR mapped
the kernel.

Let's unmap this linear, writable alias entirely, so that knowing the
location of the linear alias does not give write access to the kernel's
data and bss regions.

Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Liz Prucka <lizprucka@google.com>
Cc: Seth Jenkins <sethjenkins@google.com>
Cc: Kees Cook <kees@kernel.org>
Cc: linux-hardening@vger.kernel.org

Ard Biesheuvel (4):
  arm64: Move fixmap page tables to end of kernel image
  arm64: Map the kernel data/bss read-only in the linear map
  arm64: Move the zero page to rodata
  arm64: Unmap kernel data/bss entirely from the linear map

 arch/arm64/include/asm/mmu.h    |  2 +-
 arch/arm64/kernel/smp.c         |  2 +-
 arch/arm64/kernel/vmlinux.lds.S |  5 +++
 arch/arm64/mm/fixmap.c          |  7 +--
 arch/arm64/mm/mmu.c             | 46 ++++++++++++++++++--
 5 files changed, 54 insertions(+), 8 deletions(-)

-- 
2.52.0.457.g6b5491de43-goog


