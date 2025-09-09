Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63915CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 08:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=txk6Ntr1OB9E+08Z6A0ZYjiGrZLcfjKX3b0L/eGpWQ4=; b=GK5pgyGRD/YPTxcxjy8RnV2rLg
	FIwEAsmbgziAJ/+WZcsgLh0et0YzvBCS+eDyqSHooMAe+Rshdhrf0mNWSY474uPMIsbn+aPcjIvle
	/nP/MAQIMOmxU0n18Dt4r8Y3AkuRUM2iP3Y3yIWvUIBFMptT8tvr1bVM4TwqqjOp5ohPH3/uNZnEu
	qFkGRjgbOY8wofk3nsDslP1NoA+4efQ7N6y4ciOiTQTMKTBGbDHnUHh5cmYla+aRXPhj0vJuCErXn
	XDsueD4LOK6NWy4VsABGveorAIIM06yQNK0NywGF/ASVIjbMOJ7hI+IFwiGH0ZGIia3sY5zN8JGnu
	uiLordjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvu9A-00000005jBC-05eJ;
	Tue, 09 Sep 2025 08:56:16 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvshK-000000058OS-3ttE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:23:28 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-628f17953c7so2536390a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 00:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757402605; x=1758007405; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=txk6Ntr1OB9E+08Z6A0ZYjiGrZLcfjKX3b0L/eGpWQ4=;
        b=pIUgVEiPxichIaS0Zsz25TD8PcgjlQx3iavhPiTCicbqOng7OONu/p9kC6svf+s8fY
         PpIKec3Ho9nGLdjH1Z/Siizcuj7MSmFFHEGp2CiqkmnkxNhEevoOV9qi9jX2eZTVLIkI
         gYaYh0In5NcB0KOkYsJfFfHHOeFgZiisANBfuMwLdG0vrk/+FS9dhsf2qtuiIVBmbqiH
         XchqFitBnIofkBDZpuTfMfaPgiR+hQ6xumX1dpdbkNBL2VNY8qkebKifkV05oOeUudny
         QZrA3eHjmOgLV5y6j/PD2yXXo7Q0nuMHhWpn8fCpWn8KhbQiKNxCBZUFq/KgmlU2ZT2D
         Hg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757402605; x=1758007405;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=txk6Ntr1OB9E+08Z6A0ZYjiGrZLcfjKX3b0L/eGpWQ4=;
        b=jTHy9bAqdlaKzgnZCt5kt9HwHPVe/m2Z6y6DisRo0fwjK9R3fqO7x0w3K6nMDE9RWq
         dL8J2knA8EMXCTQMumFVnT9DWYm2BUd8E+WxgUutFp+5qlhZCtjkBU3yCrV/UCFD5nmV
         M+8hO+VTkbmhprL3RDYsbmflsmpyYAI8MO4zdjY8mWPIXJ2zMUA04OTWxY3v20Pdh88H
         b3JkbtVdHUhoS0qv0rkAQbL8JOJUj0VWR9e5cdSDZVlv+k19cXqdEdj3Lcl5XeJBBfUG
         qWVSAbe89K8Koau/cx5OrU8jifnd4lFObHtXu99V1jw/eRi188o7kd9H/csOXSP0yddj
         iLYw==
X-Forwarded-Encrypted: i=1; AJvYcCVYP9CV1NupMTmiTm4DORqtAKp98fRxMeGj3Ym1FEwy/zdqxSwD3spxICx/ytD1cuJm0ar5TTH2f07/yxITfSrD@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0wZR2AWMQOQ7dsgqGlMKEDQOQa4yb1RVmJPYP+KauIqk/YA86
	gPY+1pQtlv8NpSol50Aa0ByDEMUwSCBWmNfiqVu1BJ5ST/MUqzenQGHIv+YfO0NCPajTVz6cPd2
	Qhw==
X-Google-Smtp-Source: AGHT+IE31mnI8tt35OKxh/bw5AtNubsZRR5apcr5fYboVoXcoTobk7h9dG7B1/QBDvJejQNdbu0DvRO4TA==
X-Received: from edbin10.prod.google.com ([2002:a05:6402:208a:b0:618:3425:80bd])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:4416:b0:626:d96d:c0bb
 with SMTP id 4fb4d7f45d1cf-626d96dc3e8mr8167866a12.9.1757402604824; Tue, 09
 Sep 2025 00:23:24 -0700 (PDT)
Date: Tue,  9 Sep 2025 08:23:20 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250909072323.4106202-1-tabba@google.com>
Subject: [PATCH v3 0/3] arm64: sysreg: Fix sysreg field definitions and
 generation script
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, vdonnefort@google.com, 
	qperret@google.com, sebastianene@google.com, keirf@google.com, 
	smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_002326_986271_F471EBF7 
X-CRM114-Status: GOOD (  12.99  )
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


