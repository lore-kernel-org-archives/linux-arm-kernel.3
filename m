Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB326CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 07:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zeJOCZLhCVkiT1VK2WkmVo/4/mMU1YIiY4Y789TDXh0=; b=IUHRxD+rOeG9Ctgd7JTd/ExrA2
	VLLvBXyKkx+GCm6BPjeAR4QxGrPDxD4wJ3aAYH8vI6wD6O+7ikZM5RZqUp2vPbwongdDL6b+Rd8Oy
	68+HnyCBLbBjzYM5vrWCdW39EhpPint+zo+inl8aIEQUGPEQA6UQ4gfKtHct+RWIIcak11LLbT9vP
	DmnSfYAQ1Gm5M9YGJdzEOKfOX450d+6GYU80466cpGkQEORvkoxTTcWU3Bl8vubTDurleC75PUQ8I
	ummuUuKTnvgrOCl56yfOdJdDN1qEC1IGm6wid34X+dEiKelUC5eYbrBm6d4A1xsxBfLdXYJ+C25UV
	kuYgtl+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1GE-0000000AhYo-0cJr;
	Fri, 26 Jun 2026 07:46:02 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1GB-0000000AhWi-0YKL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 07:46:00 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-4639f122c38so412374f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 00:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782459955; x=1783064755; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zeJOCZLhCVkiT1VK2WkmVo/4/mMU1YIiY4Y789TDXh0=;
        b=Z79eEnOslouRXvoEXibqD96YH2YkNL+53YbqptWPBZHYfiA3a+210Lh5ruaDEp1Ecy
         OoUg3SlJqWkCffudzba9ZEASvwJNHGvyqgEWvndo5vkjaI/PsSYfcO5ctHthpQ1UIh31
         Vuwkr7vu2rJ2qZWBlp1yFxDlBeUrIHfIYF0tta5BH5iehGAniAKEr1I6bew19+8yDbs0
         hFtjXS69/T0yyPy4eEnPQYGIVaMC9y4yVnJez2wcORcuRxKeI23IIhKOAgdt4rlFg/4B
         capRDbtso3pBV972XmrobGEaCe5hnu1PL+RZaCu0MSLR/CyVfM1B5WF/rSaXLPDtFYVp
         Tv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782459955; x=1783064755;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zeJOCZLhCVkiT1VK2WkmVo/4/mMU1YIiY4Y789TDXh0=;
        b=XlOY3IjYDozmq7HTX1xI7k+oDNkv5A+K3uzdkOa3yfYwDSW4htCdZCnMElCM73///P
         nkEAQ5Ldt00IpFkQBHZROdDLaug41VTcRLbeXZChPewDWBPo+DtOljXamXOUeEH8RDUz
         8io+0VZdenW6/KeK4/hVTTRrSW07UYEIG2fj/JYc8EKJznCK/D6uVjFxgEqjLKzZLtrg
         E5h1JvM9gmXIHpM1y0i+mO7BBFKoW1bqxH+f6ewJfr7EPodxPlYsGMxGWSQphMo39QV8
         A0/vpEK4CgqFrFukj8G5box/XXk2xc1i2ddqOFG3+gSXLybvbbsNLtF33tcScIqkrtdK
         0+Pg==
X-Forwarded-Encrypted: i=1; AHgh+RrVpPs5Yr+r3zgbIU60qOFYBADGcvfR4mQ6TXT6eB7Qsh1ROhPXaZznAX35jMRNJiypfpCWK0OmVeOfvS4QWx/2@lists.infradead.org
X-Gm-Message-State: AOJu0YybOuDxwVHpeBCDmNWZ9litFUvF50cbFmYMf6CTHe8dv4wQ5Uvw
	CHeJC5xxutM+aCgFFEKWvqu4AcZViqLIfAOmMus3q8J09Hg1IdGrh2t8VIkmZUXol9jH41ICk43
	CQuw362BqOVj4Vs3cdtwnywqnWGELOw==
X-Received: from wrpl17.prod.google.com ([2002:a5d:4111:0:b0:46d:fd7:d50c])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4608:b0:462:1a7a:9846 with SMTP id ffacd0b85a97d-46dbec3fd27mr8598500f8f.8.1782459955083;
 Fri, 26 Jun 2026 00:45:55 -0700 (PDT)
Date: Fri, 26 Jun 2026 07:45:38 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626074545.433234-1-sebastianene@google.com>
Subject: [PATCH v6 0/7] KVM: arm64: Forward FFA_NOTIFICATION* calls to TrustZone
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
X-CRM114-CacheID: sfid-20260626_004559_194168_ED251C7C 
X-CRM114-Status: GOOD (  19.22  )
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
Changes in v6:
- applied Will's feedback and re-ordered the patch series so that we
  apply the MBZ enforcement at the end of the series
- update ffa_check_unused_args_sbz so that we take into account the FF-A
  version because the spec changed the list of unused parameter registers
  for 64-bit SMCs from v1.1 to v1.2

Changes in v5:
- handle 32-bit smc variants correctly when doing the MBZ enforcement
- add check for FFA_FEATURES
- handle missing FFA_FN64_NOTIFICATION_INFO_GET
- collected the Review tags from Vincent, thank you 

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

Link to v5:
https://lore.kernel.org/all/20260623115354.632361-1-sebastianene@google.com/
Link to v4:
https://lore.kernel.org/all/20260616154149.2763214-1-sebastianene@google.com/
Link to v3:
https://lore.kernel.org/all/20260616105417.2578670-1-sebastianene@google.com/
Link to v2:
https://lore.kernel.org/all/20260608165549.1479409-1-sebastianene@google.com/
Link to v1:
https://lore.kernel.org/all/20260501114447.2389222-2-sebastianene@google.com/

Sebastian Ene (7):
  KVM: arm64: Forward FFA_NOTIFICATION_BITMAP calls to Trustzone
  KVM: arm64: Support FFA_NOTIFICATION_BIND in host handler
  KVM: arm64: Support FFA_NOTIFICATION_UNBIND in host handler
  KVM: arm64: Support FFA_NOTIFICATION_SET in host handler
  KVM: arm64: Support FFA_NOTIFICATION_GET in host handler
  KVM: arm64: Support FFA_NOTIFICATION_INFO_GET in host handler
  KVM: arm64: Enforce strict SBZ checks in the FF-A proxy

 arch/arm64/kvm/hyp/nvhe/ffa.c | 220 ++++++++++++++++++++++++++++++++--
 1 file changed, 212 insertions(+), 8 deletions(-)

-- 
2.55.0.rc0.799.gd6f94ed593-goog


