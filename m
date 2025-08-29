Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463B8CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 12:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=txk6Ntr1OB9E+08Z6A0ZYjiGrZLcfjKX3b0L/eGpWQ4=; b=qm19CwA13Sz5QKykBmZvjvYUZB
	jLoJzvS7aKqi6V0MsUahZpPhOP7AuRzvNaCxW/y/FGKTPI5pBKV01CJeZy6oQMFLWb1SWUNXMMOf1
	APIXPPREQTdRwyg1KOpyRvfa0AEBZo0IhBoHHXju85pWCSKxFjqzJXIdenAAOlWALK2JMB3pYUqH2
	SdF4Afc0fuyhreNfMrh49Sm1wT1KDo+3E3sw1p7WyZoCHp+yISOW8jNqnVVd4Yn111j3Wh3gL7K0p
	h3epKnGyd8Dc/b/mAsVXGEtxfIlyXfrMirAm+AkzV/o9+quXqMpqI2eCHkgNuVYQaFMiZewtJOkKP
	x1M73RZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uryAp-00000005dkd-0wmd;
	Fri, 29 Aug 2025 12:25:43 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvlq-00000005Cv4-0OXZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 09:51:47 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45a1b0caae1so9392495e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 02:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756461104; x=1757065904; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=txk6Ntr1OB9E+08Z6A0ZYjiGrZLcfjKX3b0L/eGpWQ4=;
        b=2Q62An+Xc3e8u64T9+URlN+UQ18klcVtrbStd0zeOSi0zvYcab/BzqJVXD1tiPMgMe
         gIkNdOqnovGHzn890sImGdS2Zj3eO2xKZ3Tglp55Qh4UetUELGUqM8/RUmzwD0USMkH3
         uJpNG90CJB6pkXOoG2ZmPAxdAUinYsJhrYp3YrJ3SX8kyL013iESzVxiTfscQ8CSMR9p
         tJ1FY4bLCAerstTgm2yHJ77UOtXbVOyG+sES/QiNmSz2TQuC2hS2vx2yQw9ZvyGlO9eX
         p5w6sXKABYTqwkRxWAotyQOvxlASf/20NsCD7Cu6fqP4uz1nbdCiQd0gXZcPhloZGiB7
         3h2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756461104; x=1757065904;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=txk6Ntr1OB9E+08Z6A0ZYjiGrZLcfjKX3b0L/eGpWQ4=;
        b=KJoAwd9KaHwwQPF5X4q6x46ZmuPrqLeYkgA8QCDPoIxFgDQ0huiYea+V+4FEmHNOxq
         /cG+OCszn0g3oWL9rI/loPQiXt1LbjoeLZ7IOJCgA47BZjMLpKAe8VRc+8px6ZtENOkA
         D1XdKrQo79WCPtFOGGWgVmAzom2cNu7qUUmieCeoOQKBrxOYi7Dx2kO+ndjLpDBRATbB
         TwCSJbmrC1fXtx8q/z0lBdaJjXqRAhVwT95dDOhvP7UOurvkboN9l2pLgKtFe2EJQsUH
         dR+M+mFBoHys8SDjfLJI6X5atzEAW4KUUuDlnPQE0kC0NwJbuZNlblkwV7luHBetUfkw
         FrVA==
X-Forwarded-Encrypted: i=1; AJvYcCVoOXQZO1O+lBaQ5GUoFw6WBBD2hcBBd5uZcv9lwSVFbbyCQamx3Vth0zTFfM3i+ZyFJJilFyz2irkwYMOLt4Uy@lists.infradead.org
X-Gm-Message-State: AOJu0YwInOHoVICjtySfv/tusAid54eqeyJHVv8Ii2KrFB5bjiM1jPaP
	fUjc6A5jRAvKJd/NGTd6iRpK//DZDIBtNPvJxAyG0/8RJ/AUKAwvl7xOCKILmyKP/dV3gWuVhYS
	LnQ==
X-Google-Smtp-Source: AGHT+IEf1nkRoty1oRvWii9Is2r7lcOEZRt6GRqg0M5bkn7wWr7F2w87YgWyLO2mtNb12anWTrGICsLuyg==
X-Received: from wmqa7.prod.google.com ([2002:a05:600c:3487:b0:459:df20:248e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4248:b0:45b:7e86:7378
 with SMTP id 5b1f17b1804b1-45b7e8676f1mr12711315e9.34.1756461103846; Fri, 29
 Aug 2025 02:51:43 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:51:40 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
Message-ID: <20250829095143.123476-1-tabba@google.com>
Subject: [PATCH v3 0/3] arm64: sysreg: Fix sysreg field definitions and
 generation script
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com, 
	sebastianene@google.com, keirf@google.com, smostafa@google.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_025146_150114_50C0E6DA 
X-CRM114-Status: GOOD (  12.63  )
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

The sysreg definitions file has a few errors. In Enum Security,
NSACR_RFR is set to 0b0001 instead of the spec value of 0b0010.
Additionaly, the sign of the Enums DoubleLock and EIESB are wrong
(should be Signed and Unsigned, respectively).

Moreover, the file has some redundant definitions, e.g.,
RCWSMASK_EL1. While these redundant definitions are not wrong per se,
they add unnecessary code into the generated header file and could be a
source of future bugs.

Fix the Enums and remove the redundant Sysreg definitions.

To reduce the chance of this happening in the future, add validation to
the sysreg header generation script. I didn't want to go overboard with
validation, so I only added validation that would catch most of the
errors that I've seen, which also are errors that wouldn't generate a
build error later on.

Changes since v2 [1]:
- Added patch that fixes field sign definitions for DoubleLock and EIESB
- Removed whitespace fixes from first patch, since there are more
  inconsistent whitespace use in the file, and fixing it all would lead
  to too much churn.
- Collected Reviews/Acks
- Rebased on 6.17-rc3

Cheers,
/fuad

[1] https://lore.kernel.org/all/20250813164506.1203851-1-tabba@google.com/

Fuad Tabba (3):
  arm64: sysreg: Fix and tidy up sysreg field definitions
  arm64: sysreg: Correct sign definitions for EIESB and DoubleLock
  arm64: sysreg: Add validation checks to sysreg header generation
    script

 arch/arm64/tools/gen-sysreg.awk | 20 ++++++++++++++++++++
 arch/arm64/tools/sysreg         | 18 +++++-------------
 2 files changed, 25 insertions(+), 13 deletions(-)


base-commit: 1b237f190eb3d36f52dffe07a40b5eb210280e00
-- 
2.51.0.338.gd7d06c2dae-goog


