Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5234FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 16:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mz8D/T3QxACqjwu+5huws7UhafLI3x5hmsgeMhwaaFA=; b=qmf/SP+wn7yCmllaHRs08EDD45
	d451BCCUNDXsyCB1Jv7V7LkERlvuVbK1TtRtyhInjmV0Tuu+SPvJuGoNvK2Y2CdVvJHaNuPt5Azhx
	pRXrSKMdkZ4BuVabNhlPNszoGT0hB1oECXNZJqViv4C+EiaRtBLjI2SkcullsJmfP1OiJ15YAt4ya
	qlo3vwUsooFYRNkNc4PtqAWVovuUbmdyrMBr4lRhZGRzZxOH2mgwVOvDrwfgziwfY7kIDp5fusl/f
	C4dEZcUPZF91VsPgFrxjvguAS73GPNeiCnCFNWQ7f05mzr87oSZEAoS/v0nxFsfIqGaAAOwVwGNKG
	qDPEkriw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITqm-00000005hmI-2TfO;
	Thu, 30 Apr 2026 16:02:52 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITqk-00000005hlY-3G0P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 16:02:52 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-488bd1ee9e7so12447295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 09:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777564968; x=1778169768; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Mz8D/T3QxACqjwu+5huws7UhafLI3x5hmsgeMhwaaFA=;
        b=BZDm8XQOKLmKV9d+Zc98wxI1eCzocnnpprqPuho7dBTdr1EBewDIUe7hJLKJxOR6hK
         1BL5uSHWZNQhgi5evi9bDIm9WffsIHx72KoHUUhYrTZ+qHFHFNksMI7fXQq9o0DXdOQY
         2yQmk8qPgMw6JaISax4ftU6iNergOjp4XlihCK+vucmvspgvVfmZQu9kZfO64Jed9Gy5
         e/EwPRzPhJhZ3ihz+GS16051LFIDz6Eu5/QBjMMXd+o9ZGNe1LOK6lHAPp5UaC967B9n
         bEyba9R3dSKwA+DAt4DC2pUhD4rM8Is/Jtge3DsAwYhXDLN+zI72AEEiUCLPWjqqBH3Y
         ot1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777564968; x=1778169768;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mz8D/T3QxACqjwu+5huws7UhafLI3x5hmsgeMhwaaFA=;
        b=jGvsfNwvDLD0m43ZlFNPea07k7YlztBnC8a+OKG8Y+j2i5LxiaiMbjZEsOHlDOEBwS
         aa7szFDlUbEYoKYYyyUDljrRM+ENdLTRbayM2Mh9FYbDVuT+ReF+skrBfVsQ4M4c1f0o
         Ap9Q4BRnM6m9vqzzEEPNJ1KeFvWgeFExWIuSAzrjpEEdpnKgYrlNV4jWxKc1ye8gziBV
         cUeFpYX5H6nvg2NU6dWbUs9tkvysQA3dAW4SkBxhRTdOKlG936QqS0g9ggWkXxnTQRjX
         bAu5BidW9P+2Lp8g96N7lgTOeHzVQOtAJydkBEq59MREa+7sInI91RirDm0bSaoHOjVK
         aDiA==
X-Forwarded-Encrypted: i=1; AFNElJ+p/yXzCHJJRKGABJQP3DLkWEj3Vel1IP2gukMwlWovaDipGGQwfQV/RgrBXFTqpp9gfr72p8a8XEgsobP5qlxo@lists.infradead.org
X-Gm-Message-State: AOJu0YxurFPHCpfZZcywAuEpzIVVIZ4XzMICPsIqnF003wjan85U7f2l
	Ip+XNMidPs5KMiwpyHpMObwe4j5Qadfo7KGakcoOvgKRkDj20tMn2R/KcpGMXw+deSl7V0EvkSO
	bdjm5+YzcTBDvSzGdOdY3o8+86Fnt1Q==
X-Received: from wrqr3.prod.google.com ([2002:a5d:4983:0:b0:43d:6f5f:8c52])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a40a:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-48a8444a342mr47560585e9.12.1777564967927;
 Thu, 30 Apr 2026 09:02:47 -0700 (PDT)
Date: Thu, 30 Apr 2026 16:02:39 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260430160241.1934777-1-sebastianene@google.com>
Subject: [PATCH v2 0/2] arm_ffa, KVM: Fix FF-A emad offset calculations
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	sudeep.holla@kernel.org, will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_090250_823609_B5CCF55D 
X-CRM114-Status: GOOD (  13.03  )
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

Hi all,

This series fixes the Endpoint Memory Access Descriptor (EMAD) offset calculations
and adds the necessary bounds checks for both the core FF-A driver and the pKVM
hypervisor.

Prior to FF-A version 1.1, the memory region header didn't specify an explicit offset
for the EMADs, leading to the assumption that they immediately follow the header.
However, from v1.1 onwards, the specification dictates using the `ep_mem_offset` field
to determine the start of the memory access array.

The patches in this series address this by:
1. Updating the core `arm_ffa` firmware driver to correctly calculate the descriptor
   offset using `ep_mem_offset` rather than defaulting to `sizeof(struct ffa_mem_region)`.
   It also introduces bounds checking against `max_fragsize`.
2. Enhancing the pKVM hypervisor validation logic to no longer strictly enforce that
   the descriptor strictly follows the header, aligning it with the driver behavior
   and the FF-A specification, while also ensuring the offset falls within the mailbox
   buffer bounds.

Changes since v1:
- For pKVM, removed the strict placement enforcement for `ep_mem_offset` as it is not
  compliant with the spec, and avoids making assumptions about the driver's memory
  layout.

Link to v1: https://lore.kernel.org/all/ae9KN9nkOgDYJcGP@google.com/T/#t

Sebastian Ene (2):
  firmware: arm_ffa: Fix Endpoint Memory Access Descriptor offset
    calculation
  KVM: arm64: Validate the offset to the mem access descriptor

 arch/arm64/kvm/hyp/nvhe/ffa.c     | 24 ++++++++++++++++++------
 drivers/firmware/arm_ffa/driver.c | 14 ++++++++++----
 include/linux/arm_ffa.h           |  2 +-
 3 files changed, 29 insertions(+), 11 deletions(-)

--
2.54.0.545.g6539524ca2-goog


