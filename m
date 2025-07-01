Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38BDC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 18:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7Wjl7TqtpfpT/cVhyOMYZ+YoZwvVH3I5MuberAw7nso=; b=L1APACPYLSkVdI
	MaRC101GAoC6wu9ek7QYCPm9DqZHGs7anGOCrXtdS7ez+KyJTlX026Pd1YKPqqGISrIBQl869bm2m
	vC9xTT2iBYplvq7JabcXgQVd5YpzpOQvY9Tehn24vKVwiXfEnfIUnNSXGy3OnpiOQ2Ivzui+gjg/x
	xUlbzz1X3JezBqhOzI4d4JohBXSTffhMNPCwCkdpSmn5TyFJVDYk6YqUfVDyoJ0W6aiThDERFClnn
	OflwWbfA9Z5HlkUU0pv6SrHlwGnfd5ulP9yrIGxIN4trYKRN3E10gVvm+NN99gcaonxu8jmcoE+BN
	nTK6jNGnbj5KxZnS/2bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWflJ-00000006Kk1-0G4g;
	Tue, 01 Jul 2025 18:31:21 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcyi-00000005tsg-2rNp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 15:33:02 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-450ce671a08so23035865e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 08:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751383978; x=1751988778; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Wjl7TqtpfpT/cVhyOMYZ+YoZwvVH3I5MuberAw7nso=;
        b=DF/fbtGqdPRoPJkxDymg5ogZYd4AnWFth5uezs47hr/h27d/EBnnvMNx3t0rVU2Ihr
         vn0mbFT2Na4UwZnuWAUuFr16X+7NFLNyc0TpTnYwbm+LNNJVnZ2m8q1rigDoOxgsvanT
         VUK8PyB3hCps7Y9IaUKfBJhQ0KoHJ0QtpcQ4f/7eB6M/uC2ryV6AT28yvzxltYyAKrTa
         +ajfLDHMmDyDbSbTUVo9htzqToNBQ1BTX6A0P+se9R+rIY1RRR0YrYVPdQbtF6vnTVIp
         F+68NiiJN/XoIINvm189fwoflwcsfA1nC+OHZyyDqWCGBBeEAZLW+MsaJwxmCOSAfH0C
         TNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383978; x=1751988778;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Wjl7TqtpfpT/cVhyOMYZ+YoZwvVH3I5MuberAw7nso=;
        b=akjBOau44xkC5TVmdY0bbCsiuJpY0ELz1OkTF5xdtPRyO1zZrQZt9LWvvA1StO2fmB
         uXS9NlefLGX5jdHSVeHEMp2bbFRgJ2E9KNdOGxB4e4erdR1XpejRHLHv/i0rXeD0qfUd
         rSK6wIPuY0BOHdU8cebrFePCk8S17PzCNvCXTQOVKFhiTajp63f/G0orLUdIpVb16j9y
         mMYGId4T7F0i5YtOEFY6hDUwO+ftzQCBnH+rdU7qKisyPRM+PLyDzgxGQmz3OOvfWFl6
         QeU8FV3cM6iJKpnLL/lyImRTPVNd9v/efyAPkOFDfK7n5LhTkwYgAVBwxv6h5mEZfTSD
         i5PQ==
X-Gm-Message-State: AOJu0YwlpeztVAVqsEgmYEJYgQrbTMto9oDkpMeQP1nC2OTVpLy115J+
	pMS5d6ko2M34LWnaTvMUQrLDWXLWihDefXHiZnpSNKwiYicfSlaCUEgNA4ELTD3zaTI=
X-Gm-Gg: ASbGncs9IQNhaMJuc2Wqaxb17EhAvteomMG6FHyBFj3B1np2CEzBde0o6UrOHRPM6Pd
	SL6Rj1SJHkTpWQ/+doEHszPy+TA4A3esRoigL1ezdmIKl8zDMfdL3FAbVgL50pz/H3skDElX47A
	tBxdx0bxpn6bQWNaJIfrh9oQfiGa5hanlXvFK/OEhi3X0trtrMURUDIzHLeRCwKPQ1Z786uFKJ4
	jp2FufxNUswzcrWhAYTgQf0144cbiDQWVXySekP7tMogDkLJ9XTpZoFNL9mDqxzRewrzQOznH6y
	Xmyyl2qK2DJ40ORhSM41BDQhzwaOYOODmXGGGU9N2uPy5gKHyPYCAyHNtHK27SI3SKGJ/Kxz04E
	berlTiw==
X-Google-Smtp-Source: AGHT+IFfPvs67/UJpu/9kyB3q+XqucTe78Apo5J0t9CmwCnnIvnAeglojVve+6TRV6p2yD+cqIsekg==
X-Received: by 2002:a05:600c:5250:b0:448:e8c0:c778 with SMTP id 5b1f17b1804b1-4538ee61eedmr160326185e9.22.1751383978328;
        Tue, 01 Jul 2025 08:32:58 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c80b5a3sm13435002f8f.40.2025.07.01.08.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:32:57 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/3] perf: arm_spe: Add support for SPE VM interface
Date: Tue, 01 Jul 2025 16:31:56 +0100
Message-Id: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGz/Y2gC/x3MQQqDQAxG4atI1g2MsVrtVcTFqL82gqNMRAri3
 Tt0+S3eu8gQFUbv7KKIU023kJA/Mho+PsxgHZNJnJSucg0vfoWx7eBzZQ0H4uQHsPT9M4cUtXs
 JpXiPmPT7H7fdff8ADND5UmgAAAA=
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Alexandru Elisei <Alexandru.Elisei@arm.com>, 
 Anshuman Khandual <Anshuman.Khandual@arm.com>, 
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, 
 Robin Murphy <Robin.Murphy@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_083300_727457_9E328A4E 
X-CRM114-Status: GOOD (  11.91  )
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

SPE can be used from within a guest as long as the driver adheres to the
new VM interface spec [1]. Because the driver should behave correctly
whether it's running in a guest or not, the first patches are marked as
a fix. Furthermore, in future versions of the architecture the PE will
be allowed to behave in the same way.

The last patch adds new behavior to make it easier for guests to be
able to reserve large buffers. It's not strictly necessary, so it's not
marked as a fix.

[1]: https://developer.arm.com/documentation/den0154/latest/

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (3):
      perf: arm_spe: Add barrier before enabling profiling buffer
      perf: arm_spe: Disable buffer before writing to PMBPTR_EL1 or PMBSR_EL1
      perf: arm_spe: Add support for SPE VM interface

 arch/arm64/include/asm/sysreg.h |  1 +
 arch/arm64/tools/sysreg         |  6 ++++-
 drivers/perf/arm_spe_pmu.c      | 60 ++++++++++++++++++++++++++++++++---------
 3 files changed, 54 insertions(+), 13 deletions(-)
---
base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
change-id: 20250609-james-spe-vm-interface-2bb41e238072

Best regards,
-- 
James Clark <james.clark@linaro.org>


