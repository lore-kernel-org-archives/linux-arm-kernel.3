Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87C0C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 09:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2A+cF1ypGsLN1/QniCjcaG5RIGOv1oGIJo5HtlBBUQI=; b=RQZb2NWzjqq8oItOvWsvS3gzWD
	D+aV374tGReIPo06zHsmCBvkjL7tIpqybVoMx3LS2YPpmZ5NkTzox/1NUSPqToP4n5OkzUJf9Ym8o
	cvswes0JislClB/18cRSXRbafckc2JsjbuuRE3PtsyhqHecmDKupM31u65D13B1jEaUNbR4QdVsBG
	xTGXegpsGdpx4gHmRm/h/s6cTK6XiHyWgrXBIfw5dzpVRjRdAz7sNOHgYW2qNj2pz5kjJ/RW6jy6J
	kNaXyyinEdHrptJ0yOumwpXkppT8qwxkyxiUMhijp7LGqJesEFR/mAD65bOWfDpOzUO2gbZbv59es
	3Qy4JVdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmgI-00000001Lm8-2zIa;
	Fri, 02 May 2025 09:27:42 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAma0-00000001KRn-1sEh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 09:21:13 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e743bffc234so1470647276.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 02:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1746177671; x=1746782471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2A+cF1ypGsLN1/QniCjcaG5RIGOv1oGIJo5HtlBBUQI=;
        b=AaLVyfZ4VLMdU4clSpvmSCUXbDDjipM50uokwLm6eOxsZGEHrb7TBFmNTcrp64UUGt
         lAjvH7VW7IuRMw/9OvCQTcqQT7mM6cP/RXBiSEyaqtOJXD6Sx3FWGWoq2KBi5lc0T3OS
         dtVZBHg8T403q2pU123assNYMOIs1oUUdRtmEXHvVOW0TiyeiJi7S+ukAbqquV2uGBAS
         2sXg0b0Hrh4Zclfy1qDWmf6PDT7LfTxLT8Tn+0KeOeiptIGMYuufwHu4DmCfKHI3SwVX
         P6W8rHWIFlHzy1KGLsH9OwsBabjqt1N4rW5ORTrR7QEqDdRDWLTfj4IZ+NfkphNCHBmZ
         6PIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746177671; x=1746782471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2A+cF1ypGsLN1/QniCjcaG5RIGOv1oGIJo5HtlBBUQI=;
        b=KdFDKzYf+KhPMqipToVlXUMttOn7j/VHAJZN9vHUYE5eOW8nKYEXnOxGpBexyrfLtY
         Xe2ndcPXaPyiFUNYkOE9ZT2ffENloQleVGFEbDQGgxR7b/StXcxqO/decxFIcWX6wHPH
         FVvdKBGAifgXUPaSFnNMLxx/hASd1d9ANt/4aixiuzzDe1SA3X9nQg8mWpkW77x4nkoA
         kD1MBiW+yJT06grTxnmPo8EDouLxKWV9qFkWgmCoCIG3+iAvbNf9yEXK8DEMyFAMErSD
         y3K4ct3EEKlHYpHC7f8H+FthApp/QN8XTQcJ3ic5JdLWbZIsH9nxCX6wyg206Qd5ZTuB
         E3gw==
X-Forwarded-Encrypted: i=1; AJvYcCVq6mIIDmLtFrbHnGhcDzX5PX7J0pCwyrAMqCcvQAE1hC0GTAw43oyRLAyJ4cFt++fUYfGhIyiYRJ/PNqwxZDms@lists.infradead.org
X-Gm-Message-State: AOJu0Yw12BeFTh5Dk2ixMc6ZIzXF3DjzC8LcUg+QZqDKmUW87NCitP9m
	cOwVHdI4t8q+3HYlupzn3xzUWwN2T5T0sEE+r6gk45XORn1MYx1KfiRMajwO6YWaWbBeiu5SQCz
	XOCE=
X-Gm-Gg: ASbGnctA3sZaWHNUm8vSnTDZZy81aZEj5e2k6P41k8oQH+xZQp3AVIdtd5NxejxQcEU
	MDlNdPsFivmgUyr8CX86fPrGgQLV0Y6wBlgTxJ7QELMMDRH5OVTqfifIhHP2KVultMKdwTjVG/Z
	l8+h9Q2ZhXuEjwPGspdQYeOT+rFBoMU6NAJN9tbpVCi5g8xNlGvIprWdSFij3W7wW/nwYZISCBd
	jG7J/+MmSRX70qfbRTR/Axv4AWrPHXRuOAI/wdqEmPimuXTjhKpK2GdNQhuXzDLTLyicjUM4XRX
	nsl6WDpThYp5gQhogS9cjsKNMXKM/nXKVOeFMr5v4w==
X-Google-Smtp-Source: AGHT+IES/Q0SMdE8NP/DkStYtsSPsdbbvB4SZ0B+blj2b434IG8B0bEw+BlpUrAg4H/4nmm8w7JUpw==
X-Received: by 2002:a05:6902:200f:b0:e72:d424:8e35 with SMTP id 3f1490d57ef6-e75656272afmr2925615276.38.1746177671207;
        Fri, 02 May 2025 02:21:11 -0700 (PDT)
Received: from donna.immunant.com ([12.9.190.3])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e755e7d92d0sm556427276.55.2025.05.02.02.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:21:10 -0700 (PDT)
From: Per Larsen <perl@immunant.com>
To: linux-kernel@vger.kernel.org
Cc: sebastianene@google.com,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	jean-philippe@linaro.org,
	kernel-team@android.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	lpieralisi@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	qperret@google.com,
	qwandor@google.com,
	sudeep.holla@arm.com,
	suzuki.poulose@arm.com,
	tabba@google.com,
	will@kernel.org,
	yuzenghui@huawei.com,
	armellel@google.com,
	arve@android.com,
	ahomescu@google.com,
	Per Larsen <perl@immunant.com>
Subject: [PATCH 0/3] KVM: arm64: Support FF-A 1.2 and SEND_DIRECT2 ABI
Date: Fri,  2 May 2025 02:21:05 -0700
Message-ID: <20250502092108.3224341-1-perl@immunant.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_022112_681211_FF1B2F37 
X-CRM114-Status: GOOD (  12.62  )
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

Hi,

The FF-A 1.2 specification introduces a new SEND_DIRECT2 ABI which
allows registers x4-x17 to be used for the message payload. This patch
set prevents the host from using a lower FF-A version than what has
already been negotiated with the hypervisor. This is necessary because
the hypervisor does not have the necessary compatibility paths to
translate from the hypervisor FF-A version to a previous version.

Support for FF-A 1.2 in the hypervisor is added as a precursor to the
addition of the FFA_MSG_SEND_DIRECT_REQ2 messaging interface. The bulk
of this change has to do with the upgrade to SMCCC 1.2 required by
FF-A 1.2. Additionally, unimplemented FF-A 1.2 interfaces are added to
the list of unsupported functions.

Tested by booting Android under QEMU and loading Trusty as the guest
VM and observing the SEND_DIRECT2 ABI being used successfully during
guest boot.

(This is my second attempt at sending out these patches; sorry about
my broken first try and the resulting duplicate messages.)

Thanks,
Per Larsen

Per Larsen (3):
  KVM: arm64: Restrict FF-A host version renegotiation
  KVM: arm64: Bump the supported version of FF-A to 1.2
  KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in host handler

 arch/arm64/kvm/hyp/nvhe/Makefile |   1 +
 arch/arm64/kvm/hyp/nvhe/ffa.c    | 235 ++++++++++++++++++++++++++++---
 include/linux/arm_ffa.h          |   2 +
 3 files changed, 221 insertions(+), 17 deletions(-)

--
2.49.0


