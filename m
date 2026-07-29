Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CE4C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BAmImkqu1SFwL8NSZDIz5I9w1IjXZHC7hoAV+KdJnaA=; b=2/75iR+5qtPKSFcS2VkeujOukp
	IK+j5h0Prym7pTOVet75NwcXpBD1ScIMEqFJXOoar4h24Pnk2HngKrH7midhOg+zuOD9ahF6VDfCK
	QXcxNLpX46wHE5Zabxjf5EGu8ze98uMrs8fI+avOa4kqyktvMYRRjFRLeT3m3lXOGFwPdh05xKDRe
	HUDXXRCwn17oJWv+dRJPjnjahUjXq5s6/EWRQAfOHq1hDH1OrKlEPHs9xkjg+oNljSjdBAOvwUkiZ
	i5vw3NywaXX8RmzhKGiiIWyMvuLsBy2y8n67r95j/4nRzr15IQpL4GV0tmeKxbSlcjqTa8fC34GJC
	4w5WDMug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3AE-00000007qag-0Fec;
	Wed, 29 Jul 2026 12:13:34 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3AB-00000007qZn-208J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:13:32 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4954fe32d6eso4687655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 05:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785327209; x=1785932009; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BAmImkqu1SFwL8NSZDIz5I9w1IjXZHC7hoAV+KdJnaA=;
        b=W7NvTPh4N4aqAKVn3ltU+wfKUV+P+Lzhhgq7Z3CUtXF3vwDlk/7IdJhx6LCXbUf2nr
         B9fhAWKQGIRXTdEnXj1nwIgi0s5eAh0B36V6xBblu+hQsKUQ6bOwHEZXIjRX/tmcdF5G
         MdnQdW2U4hKui7wdTOJdKa4FJhTIkz0aIboSsnDEfDO+u+x3UBjliRtxJmgr0VnFX3Rs
         WNM14U8DtHLickBrsViISfOGwiDlvVaDU/MaMU0ZxEYlTuntYuLG1aSBXXB5Zbr14SNx
         bBc/w3zHOICWMare/0uk+l6FrTWSUHpk8TJd21u4OPKryUZ+D5QODiYplIwX7sCEXWJR
         JVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327209; x=1785932009;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BAmImkqu1SFwL8NSZDIz5I9w1IjXZHC7hoAV+KdJnaA=;
        b=M201YMBlOOFxlCYHbPd/BtsW/LU6Kgop2o1E3kyEe/xtPBO23VPW4bmcns4c8+fDnv
         ik8OHZdIsH7L3+XHfoesX5A5mbdna6U34pJ3yn3U4Aw/LapPDKNSkSeUHG2BLUNQTC0n
         TjTlvGasDE4VCqrTOAG52eZkQr1NbEN0uhk9RT2f8wfLrVPvCBMKsjHxlavUXNH7MZfK
         AHx2xMaY40jE78SynAUCgY+G0+hHmfJdWC5PQOMlNmdwWAupmagXD1XUPB0Pnp3kZOOD
         DbybpWdYwlHDB3lvOxWmdrrUKtP5kOjAO1RVmRfwLBnW3JwT2es4kNzAPy5krDLiQFlE
         oDkQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6lAr86MaCyvwDMvKo/zQKCm1EmUl6PVtnDCA8UuyjgLNLYCQswHg+tPcYTLBmnf5VK2o0X5NgjVYeUOmHjy74@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5iAMVYjPgC94Xy2bdlFtrjZEisfG9m06Y18x0h3NuLRFO9Kbp
	re7GsBJyETHmXLxnZ6zUQydFdrgMAbEwtIyUsdsvcsMJ/FSV1+0jxHrE4iRDoqArDz+XmxpDh1W
	D1BZ/Tt97+0tn7mkHyJfKKD4oYi6svw==
X-Received: from wmbjj19.prod.google.com ([2002:a05:600c:6a13:b0:495:54c7:8c97])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4eca:b0:493:e460:1f6 with SMTP id 5b1f17b1804b1-496c60ba34amr69095735e9.0.1785327208512;
 Wed, 29 Jul 2026 05:13:28 -0700 (PDT)
Date: Wed, 29 Jul 2026 12:13:00 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260729121306.1519473-2-sebastianene@google.com>
Subject: [PATCH v8 0/7] KVM: arm64: Forward FFA_NOTIFICATION* calls to TrustZone
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	fuad.tabba@linux.dev, will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_051331_531361_D83A330A 
X-CRM114-Status: GOOD (  20.65  )
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

The pKVM proxy behaves as a relayer and it doesn't currently have its
own FF-A ID(only the host has the ID 0). The behavior of the setup
flow is covered by the spec in the: '10.9 Notification support without
a Hypervisor'.

While at it, enforce the MBZ/SBZ fields defined by the spec to prevent
odd behavior when a new version starts making use of the reserved
registers.

---
v8:
- rebased on 7.2-rc3
- no other changes

Changes in v7:
- rebased on 7.2-rc1
- collected the Ack from Will
- check for major version as well when doing the SBZ/MBZ enforcement

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

v7:
https://lore.kernel.org/all/20260629093558.2425257-1-sebastianene@google.com/
v6:
https://lore.kernel.org/all/20260626074545.433234-1-sebastianene@google.com/
v5:
https://lore.kernel.org/all/20260623115354.632361-1-sebastianene@google.com/
v4:
https://lore.kernel.org/all/20260616154149.2763214-1-sebastianene@google.com/
v3:
https://lore.kernel.org/all/20260616105417.2578670-1-sebastianene@google.com/
v2:
https://lore.kernel.org/all/20260608165549.1479409-1-sebastianene@google.com/
v1:
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
2.55.0.487.gaf234c4eb3-goog


