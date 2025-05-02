Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C268C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 03:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=200bRbkNG4RFm4RNlBvwI80KWoLNHSBTitlUXIIUifY=; b=dlOw6jk2CwbRzrqDvma/W3nE/K
	vEUKMf47NocwHL3B5GAOVzBdsdBKOCrauptpplsK95QLpzkAa3Ubno1OmEm2+7UnLceD8c9Ow7z0w
	e7IbFlUpu4APgIKKHIGDkudijCQbAVCcAdGukCAGFZ8rFePCxw509ugAEmdusGZXMyykKwCE/9mmM
	ZVqemL5hOMIUdsS4uLHDLm+Sfg6A8qyVhiJdY5VxdCEt7LtP1D1syVR9/1CTt9EVzYloX27+Jh9/h
	5SixiT9cQws0uijSQZfHyob/wyWNDzZaYld3+iqowMmvqxWMmFXf7PV2NkL+iJ1zXmT93mLLhvNap
	QSJZuJOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAhRc-00000000iRg-0liV;
	Fri, 02 May 2025 03:52:12 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAhPf-00000000iGa-2RQq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 03:50:12 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-40331f302f1so1113790b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 20:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1746157810; x=1746762610; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=200bRbkNG4RFm4RNlBvwI80KWoLNHSBTitlUXIIUifY=;
        b=dy5mmAmXWKvQh5D9keByJkIjv9v1D8gghwwelYBoobAcKmU5QyJBYeL/ih5lZNkene
         mvsCU+sap0ItjGhVmAQRFmHSWaRkrDxtp/PR2y6cALE0SjwBL9kUmeLLz0OCRheY7Q0q
         kKgWP27kTL1zcSeZKeyQJdbv1/TDoFJSx0KotYwUoSxLfy7OSEpYD5qWtR3K6JCirwph
         KlrN4vUYEabsKQLVNgMAgHcEIX2ewrrDYiytXQ8CRPnYarKWlLzwlZrrX6aO1KaE0jNE
         BQVqRMwf9+gGN+EIh170L1pRr5ljLcaKy+3cRBW4KSUFUklsmFTC3mmDZgZWBds2aHj9
         5Gww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746157810; x=1746762610;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=200bRbkNG4RFm4RNlBvwI80KWoLNHSBTitlUXIIUifY=;
        b=qSR4DiJ6d286t7f2E7W//YEIEHvk+PlF9EoK2YkyTzgR8xbZXr7zjZI0e9X572qsqQ
         slBlnSkWwwetUdLHmcJWxFKtip4wQ1kh+XG8FSUrfgZfnPx8XD5i7DEJ4pPrGPc6OL+9
         o83X5atG7ytGljRUbB0sZeDoyzBDiWBK9H2mvP9w7JeOh1aMuJkyqyaklTUZLMAnJD/D
         2MHuZYvZcGcrOhDzQ0MJz6HQsqbwLt41kn36TuwzTkJ/h9E/fdUnRPl6bYbzRrD2/q/o
         KKhWebeHiRCWj8zBTh0ASoDKeES5ZYLhq3pYMy0MghMOPmEpn1raOMXRD9Gqms0ULHy0
         M3Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVhmJFEnIYDhOhFbmprYlmBS7EX36Dy59Lsz7/jlgVh/tWn5CxH7E4VjiQBbfKmGjcb3JawUmuLq1KTflvDdZq4@lists.infradead.org
X-Gm-Message-State: AOJu0YxcjcGAWAdTu2uN5aUBX2OtYQAzamfVMZtOzAzi0SpNQiEOxZ3c
	3MNg81w/Gh7MYYRlsMl6EQVOLBet+LvOvVtSDctBKduWJo4UR0T6ahbOdCRikWtAqi65DxBqWZW
	Hccb+rk9nLBmBtesfTCCPeO2XVbUYppcg9GxgXw==
X-Gm-Gg: ASbGncv50brPSyQ2yA6Yt3HF5lvUUu+H7KLBkpciNetARRpiU84xae2/E8WaUJESR++
	Hapez1BgQZnmor1ZWA7pxSGGCXo3JrI/e2Tl79j40/0xqrUcPpAEdW5DApyXKPauZb3M6kPXTvo
	VKI0hKHLtGzTKw04oeBA==
X-Google-Smtp-Source: AGHT+IFWDH1QH7ebTs8UuQsCRHiO0kkjYVbdpD1lI2qZLhDSsrRH3ei2huvBBDrcoqitjfmO+306hZ3bUjGoQYSjf1c=
X-Received: by 2002:a05:6808:4e11:b0:3fb:a7d0:3b1f with SMTP id
 5614622812f47-403414c0ac9mr902368b6e.39.1746157810107; Thu, 01 May 2025
 20:50:10 -0700 (PDT)
MIME-Version: 1.0
From: Per Larsen <perl@immunant.com>
Date: Thu, 1 May 2025 20:49:33 -0700
X-Gm-Features: ATxdqUH6DSpDNWj9GH7IVvgNReOtTawW4yUp6qlFfnIUyWLaN_WIyzpu7vU_EyE
Message-ID: <CA+AY4Xc7SEhSd-zQzhDnuewEOksxEqDHarcHzDwp-_SibDu2pg@mail.gmail.com>
Subject: [PATCH 0/3] KVM: arm64: Support FF-A 1.2 and SEND_DIRECT2 ABI
To: linux-kernel@vger.kernel.org
Cc: "qperret@google.com" <qperret@google.com>, "sebastianene@google.com" <sebastianene@google.com>, kernel-team@android.com, 
	"will@kernel.org" <will@kernel.org>, maz@kernel.org, 
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, yuzenghui@huawei.com, 
	Armelle Laine <armellel@google.com>, arve@android.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_205011_817944_10FAF16B 
X-CRM114-Status: GOOD (  11.96  )
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
2.49.0.906.g1f30a19c02-goog

