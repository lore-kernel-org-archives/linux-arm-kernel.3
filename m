Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2663CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fHtYPZ3p2t9f2nLF/1WXA269aMaG2YVhAxwX4n4X/s0=; b=xgG7JS3be7LzOOtV0GYO3rpQL4
	IRVdl3NM+4XLdxWdxpRUIwil6nuyC5Bq/QyclYgRvSzEcSluIeyXDQvO2YX84xPU4NmkTXLX758jW
	wG8KGulUkW//QiMgRcP0VurE0DR6Zza8hNfupjB3ghrSxISphhkS8k8QM7WjrI1PBVuOv+hgdDEMY
	A0N1fDKCzN1HqUI/Z0NgbYjPaUos+8Xfk0xra+5N1DoNQUsoaI5HBQW9yDqckD3RiZieV9NDuFqAq
	Z3IB2s0SSWdLQhqQ/p2vgbrxgaxW+NDyB0sE2PG2i1bLlb/VtvNDORTdtW/XUTXw6WVGfcL2RngrV
	erl/x6BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVvS-0000000G24R-1IXb;
	Tue, 16 Jun 2026 15:42:06 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVvP-0000000G23i-0MIC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 15:42:04 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-68d2339febdso5868609a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 08:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781624520; x=1782229320; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fHtYPZ3p2t9f2nLF/1WXA269aMaG2YVhAxwX4n4X/s0=;
        b=KykYEnlBegbKvmmyyKA3dtBA+rMNu2UmQaWeFVPv+Qe4ceVVdlj9UHTuMjBFzbTy0q
         AE6q12tex63QKJmv70DIzog+tCiDUHITHGVpglTmee5gnoNzppFeQeXlDTB2DLap67tv
         yUhedTZPqF8m4NobuxUYAHsqjaWBFCG5A/M4elj/I78hrJ2vVSGmkCEYh0i9ej72p9SD
         H5YCfji4niaPXSEjogTAM5GIewHK7O57BVLLXPTB9wd/ICWaFEgEeXzYvOleZrS2R9rt
         Tzsxk6xERakS3FxtxQp2OjURidng/SsgRFHzgV7EsPtjl9xPN7/nmwKkNhCWH/Cp4p+i
         m7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781624520; x=1782229320;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fHtYPZ3p2t9f2nLF/1WXA269aMaG2YVhAxwX4n4X/s0=;
        b=ejZRFhJHoOdylCiAvkmxU7GHZ0zC3WqjuU9zsHxbVnpTVrvsiOzL4bqE405g4qxoRZ
         o6gHEfTKOB5izpBtzlngZnQ3rj7Ly1md7HFB7hqm47rF3tn+baMug2QtfZaTlgO/J4X8
         5q7LdmQDSLFNcApuo307ZHWqlujIW7lD377r19kj3b2EXxegeojRa7lXtGtODgqagFUl
         yePWAaX/Wnhss7mQl97nNH3IP/LhARb39u88Puzb5cge+A5+vvmR+VS+DPS6fgL9KLC0
         xxBrEEFA2enjO7QCE6IoDnk3jgQFtaaBUnkkWlyrgMV7L4zZAg7lpo4JvbG3RdE97/5w
         SsoA==
X-Forwarded-Encrypted: i=1; AFNElJ//zBCCzaiuWc75hjaSTqgkUow0/WAi3QLSZJNWC/F0/93wLGm2zLWKqsCMiC/Nuf4Yk2Pa3EjBgQwUSALq7uGf@lists.infradead.org
X-Gm-Message-State: AOJu0YxxcbqdUji5eyXICoBK3c7HjIuMi7bba1Awt+KJQP/1TtAvZl7y
	P9Eh1Gvc+/oKWgbg/NXwTKTdNaBFLJcyVqg9vNZS/0TogSQmT+59pxU9VAbwLtGanH3X2PfG3jl
	BzkeqZ0SFavqMzfGIrxbhnhHGcfFtjA==
X-Received: from edrj2.prod.google.com ([2002:aa7:c342:0:b0:695:469a:cfda])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4498:b0:68c:bf82:884c with SMTP id 4fb4d7f45d1cf-695086dce09mr2519000a12.6.1781624520031;
 Tue, 16 Jun 2026 08:42:00 -0700 (PDT)
Date: Tue, 16 Jun 2026 15:41:42 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260616154149.2763214-1-sebastianene@google.com>
Subject: [PATCH v4 0/7] KVM: arm64: Forward FFA_NOTIFICATION* calls to TrustZone
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_084203_139229_95204356 
X-CRM114-Status: GOOD (  16.26  )
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

Remove the FFA_NOTIFICATION* calls from the blocklist used by the pKVM
FF-A proxy. This restriction was preventing the use of asynchronous
signaling mechanisms defined by the Arm FF-A specification to
communicate with the secure services.
While these calls are markes as optional, there is no reason why the
hypervisor proxy would block them because:

1. Host is the Sole Non-Secure Endpoint: The Host operates as the
   only Non-Secure VM ID (VM ID 0) recognized by the Secure World.
   Because all forwarded notifications are inherently attributed to
   the Host by the SPMC, there is no risk of VM ID spoofing
   originating from the Normal World.

2. No Memory Pointers or Addresses: The FFA_NOTIFICATION_* ABIs
   operate strictly via register-based parameters, passing only
   VM IDs, VCPU IDs, flags, and bitmaps. Because these calls do
   not contain memory addresses, offsets, or pointers, forwarding
   them doesn't pose a risk of memory-based confused deputy attack
   (e.g., tricking the SPMC into overwriting protected memory).

While the pKVM proxy behaves as a relayer, it doesn't currently have its
own FF-A ID(only the host has the ID 0). The behavior of the setup
flow is covered by the spec in the: '10.9 Notification support without
a Hypervisor'.

---
Changes in v4:
- previous series(v3) had serious issues with the patch number and it
  appeared like it used a mixed bag from v2 as well. Resend this to
  restore the correct order of the patches.
- fix strict check in ffa_check_unused_args_sbz and make it "<= 17"
- check the receiver endpoint Id in
  FFA_NOTIFICATION_BIND/FFA_NOTIFICATION_UNBIND instead of the sender
- use hyp_smccc_1_2_smc all along 
- check the receiver endpoit Id when doing FFA_NOTIFICATION_GET  

Changes in v3:
- applied Will's suggestion to use the introduced method
  ffa_check_unused_args_sbz for existing calls and added a new
patch in the beggining of the series to do this.
- merged the handling of
  FFA_NOTIFICATION_BITMAP_CREATE/FFA_NOTIFICATION_BITMAP_DESTROY into
one patch as Vincent suggested and create one handler for both.

Changes in v2:
- enforce the MBZ/SBZ fields
- split the calls into separate patches
- rebase on 7.1-rc7

Link to v3:
https://lore.kernel.org/all/20260616105417.2578670-1-sebastianene@google.com/
Link to v2:
https://lore.kernel.org/all/20260608165549.1479409-1-sebastianene@google.com/
Link to v1:
https://lore.kernel.org/all/20260501114447.2389222-2-sebastianene@google.com/

Sebastian Ene (7):
  KVM: arm64: Enforce strict SBZ checks in the FF-A proxy
  KVM: arm64: Forward FFA_NOTIFICATION_BITMAP calls to Trustzone
  KVM: arm64: Support FFA_NOTIFICATION_BIND in host handler
  KVM: arm64: Support FFA_NOTIFICATION_UNBIND in host handler
  KVM: arm64: Support FFA_NOTIFICATION_SET in host handler
  KVM: arm64: Support FFA_NOTIFICATION_GET in host handler
  KVM: arm64: Support FFA_NOTIFICATION_INFO_GET in host handler

 arch/arm64/kvm/hyp/nvhe/ffa.c | 211 ++++++++++++++++++++++++++++++++--
 1 file changed, 203 insertions(+), 8 deletions(-)

-- 
2.54.0.1136.gdb2ca164c4-goog


