Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA58ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 12:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MSAYutkZ7+a569qs6E4HPdsGwXOmRZ2wAq/f2x6mExQ=; b=47Pz3ac2mZE/froQCVcfsSQ8sE
	g0lrhaVSRlhHCKPBuu03TMU3Tqj0FE4gVtLKo3z0nptmW6DC1gm2CusOD/rDFw2IqbFZPM0TecUJK
	HZ5Uk3Fsao+E6e8CqLnbMv9vjjZwplmFWp2L92CrPS+p3Pl24a7V8LfV1u8w1XXzBH/5sZGHl6//1
	Nw/HLQu8xVNcAQGqFHdg/slfKFQSF7/oH+xUU7T0q1bIJqSejrWRVobHZ42GAUVzOlXnMsk/wgCx4
	P8koGFo6f+nif2EwLJJ1GsHJBY+hVmvZEe1eYWXWpah6ZgPwhopTSKI0YMN1K7z8iSrNo2MeoCASS
	IvUlVuNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtl8-00000009p6a-2bFI;
	Mon, 03 Nov 2025 12:34:06 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtl5-00000009p5X-35aN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 12:34:05 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47113dfdd20so19092375e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 04:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762173241; x=1762778041; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MSAYutkZ7+a569qs6E4HPdsGwXOmRZ2wAq/f2x6mExQ=;
        b=NsijSIr+/HT7L8/P/uq7Lx2//VyxK/n7/r8Dm/PKBOpnMzwabFGshnmvxx6GqE0EDL
         4Lv11F05tMf6l0dMSgkzcDAJEWdblBIII8GoC4cgzQ/ykIlK7WuKzUqv+VX0wo3ce0qw
         jtoFPAqQFZHrB79wXAfvR3A8hrGtMHeLD98KpEJiaLu82wtjS4/cfn/RoIZiGnpJhNYF
         WcXjDYWP6yLlZP1WOfk5c55iuzFC6Y6HujWnWNYG7MMrNlJDkfiiZ3nc8HBfp7i8XniE
         9irKh9jtdNNqmVDf7Pa3VolK87TsHERBqD96k8QWkkqhTV7FEe7Ihl4aRHyj4x24QkSV
         vumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762173241; x=1762778041;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSAYutkZ7+a569qs6E4HPdsGwXOmRZ2wAq/f2x6mExQ=;
        b=fa+ie34s8Y/zS472r2Djwv7PZSMc+gqmCzpuRU2hMZcltzqqM7go/Wl+t/gWhgNrgt
         BBFIA7XMwKqO9nY8HX/92AIXttSgDX5qwEmFNfJ8bE10uQdroZb1MdXNU+4QExml7EcC
         TyuRCnPwdiesqHg42FBiShI5AFrDjjo9RV8klZku9ia8xwOighgQMKTdNGif0ugQP44x
         FCzmtKfrEYZTwEIg8b2nhLCweef1zs45Ffj/Ivhj6Hs/HNjkWg6GzJ1MAJ8vlfiTCgvG
         uJuFIKR+xIXbCf5BUjt2Id9msZcTSBjFPp+fjVW+1hOFZgd7xziqi1B2IR5wJ8LZcYu0
         Lz6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUOxbLXhYr2ZRx30TpOks1lZlp0IoX3J5ZIMutM2qbGDHB3zKpy3AMHdgCzMIbRIsTRg6k0P1p0/P2Rq3+e+3G@lists.infradead.org
X-Gm-Message-State: AOJu0YzVnDPl/2qtQzue/qA60OXE8LO651P9ywNOlDhEXqbenc5jKXDG
	n0a8m2aXy0modVUxdZBSA8mvv1k78GKh7G1ak5CHdJmZXnPYdWz4RRir1Kmy/0FhkCaj4Dptj7F
	IK2sQL9LN+UNkxA==
X-Google-Smtp-Source: AGHT+IE3BVSRA1xaeeR33gXX0nVF0a1SF+382+YyhshPRNKnmANoXw9zOSGPxjdhjzWLcN6ym2yRotwlAcsWrA==
X-Received: from wmbgz3.prod.google.com ([2002:a05:600c:8883:b0:477:df7:b01a])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e08:b0:471:3b6:f2d with SMTP id 5b1f17b1804b1-477308aeaeamr104092065e9.38.1762173241601;
 Mon, 03 Nov 2025 04:34:01 -0800 (PST)
Date: Mon,  3 Nov 2025 12:33:48 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251103123355.1769093-1-smostafa@google.com>
Subject: [PATCH v6 0/4] Move io-pgtable-arm selftest to KUnit
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_043403_817672_BF444616 
X-CRM114-Status: GOOD (  23.44  )
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

This is a small series to clean up the io-pgtable-arm library.

The first patch is a small clean up to reduce the depedencies of the
test before moving it.

The second patch was originally part of the SMMUv3 KVM driver support[1],
which needed to factor out the kernel code from the io-pgtable-arm
library, and based on Jason=E2=80=99s suggestion this can be taken out as a
cleanup, and a step further to convert it to kunit.

The second patch just moves the code to a new file with no other changes,
so it can be easier to review with =E2=80=9C--color-moved=E2=80=9D

The third patch converts the sefltest to be modular, that is useful as
kunit can be a module and it can run anytime after boot.

The fourth patch registers the test using kunit, and converges some of
the APIs, some notes about that:

Granularity of tests:
---------------------
To make the series easier to review, the series changes the test to run in
kunit without making intrusive changes to the test itself.
It=E2=80=99s possible to refactor the tests to have smaller granularity (al=
though
I think that would make it less efficient as we might create the same io-pg=
table
config multiple times) and integrate them in kunit as multiple tests, that
change would be more intrusive, if you think that is the right approach,
I can add a couple of more patches re-writing the tests.

Other changes:
--------------
- Also, to make the test changes minimal, and the fail messages similar,
  =E2=80=9CKUNIT_FAIL()=E2=80=9D is used to fail all tests instead of using=
 KUNIT specific
  assertions.

- Instead of using faux device, we rely on kunit_device_register()

- The WARN is removed when a test fails, as that doesn=E2=80=99t seem to be=
 a pattern
  used with kunit.


You can find the instructions on how to run kunit in the last patch commit =
message.

A failure at the test with the new implementation look as
[   55.631877]     # arm_lpae_do_selftests: pgsize_bitmap 0x20010000, IAS 4=
4 OAS 48
[   55.632135]     # arm_lpae_do_selftests: EXPECTATION FAILED at drivers/i=
ommu/io-pgtable-arm-selftests.c:144
[   55.632135] test failed for fmt idx 0

Changes in v6:
--------------
- Remove arm_lpae_dump_ops()
- Simplify __FAIL()

v5: https://lore.kernel.org/linux-iommu/20250929155001.3287719-1-smostafa@g=
oogle.com/

Changes in v5:
--------------
- Rebase on iommu/next tree
- Collected Jason and Praan Rbs
- Move back #include <slab.h> to the main file.

v4: https://lore.kernel.org/linux-iommu/20250922090003.686704-1-smostafa@go=
ogle.com/

Main changes in v4:
-------------------
- Remove one missed __init.
- Change the kconfig dependencies back as it broke ARM
https://lore.kernel.org/all/202509201819.f369wBHc-lkp@intel.com/

v3: https://lore.kernel.org/all/20250919133316.2741279-1-smostafa@google.co=
m/

Main changes in v3:
-------------------
- Move back unused code
- Simplify printing based on Jason comments + some renames
- Collect Jasons Rb
v2: https://lore.kernel.org/all/20250917191143.3847487-1-smostafa@google.co=
m/

Main changes in v2:
-------------------
- Make the test modular
v1: https://lore.kernel.org/linux-iommu/20250917140216.2199055-1-smostafa@g=
oogle.com/

[1] https://lore.kernel.org/all/20250819215156.2494305-5-smostafa@google.co=
m/


Mostafa Saleh (4):
  iommu/io-pgtable-arm: Remove arm_lpae_dump_ops()
  iommu/io-pgtable-arm: Move selftests to a separate file
  iommu/io-pgtable-arm-selftests: Modularize the test
  iommu/io-pgtable-arm-selftests: Use KUnit

 drivers/iommu/Kconfig                    |  11 +-
 drivers/iommu/Makefile                   |   1 +
 drivers/iommu/io-pgtable-arm-selftests.c | 214 +++++++++++++++++++++++
 drivers/iommu/io-pgtable-arm.c           | 203 ---------------------
 4 files changed, 221 insertions(+), 208 deletions(-)
 create mode 100644 drivers/iommu/io-pgtable-arm-selftests.c


base-commit: 6146a0f1dfae5d37442a9ddcba012add260bceb0
--=20
2.51.1.930.gacf6e81ea2-goog


