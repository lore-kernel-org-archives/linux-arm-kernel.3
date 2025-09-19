Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DC0CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 13:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R4GdfKGjcAjHO1Ow9QOdPWWunxjlWYABEGKDu3CoN9g=; b=iV2qTNw4weGKbSermfAI/7hr4g
	tXBcBafdUjXGkwphRZ2UOYao8J50h+Wwj4IITUlgeDHtJ6CX9ATszMGetLQ8NAXmK5r05WpzCKxql
	sJJ7ikSWKTgqZCFlZg2LVygINZU16hH6egGv5IlGLxw6Oqv3fpbxNkwDYr/FDxI1mwbS/jTewUikj
	jx2TKcAe5CDr7Bd2h13P65zdu7Cel7PhJriAEuBscnINGYS7ADSYwxKNA9RHE4MDHWf/wTCxHJT1w
	GQ6etXEiEaBW3SioG5nb46IsBBe5prI9bXZiq1Q2li+0t4aClf+BmxqHYUiPeyZSKCigLW0QAgKYD
	gzMPjhOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbEp-0000000303K-2zIl;
	Fri, 19 Sep 2025 13:33:23 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbEn-0000000302Z-1Nvh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 13:33:22 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3ecdd80ea44so1076486f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 06:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758288799; x=1758893599; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R4GdfKGjcAjHO1Ow9QOdPWWunxjlWYABEGKDu3CoN9g=;
        b=dEDL2n51XDL2uqzNEdHBddnVXnA1pTvbfa4Hhv+9piM7OKBmG8XWJrkoFux3A+iMm9
         ngWKxoU21hbFoCugGE7QCqDf4B2J9UME1DcWiYXM9zDxNCRiciC1dEgSgVfWETyS1eof
         pydTPHQlhdRShd72sdD1KcrFy8aDG8FEySdsDERIKj7l83+GSRtcUXKbKdiKS9PSe5z2
         JRzoqJVv6IWscJkWH4BT0JNMxpF1qS2XzXY+0eQoO65igwRAaVprl7XQC+PpEl26gYOJ
         97SAwU2tqeYAXkk0idUSRsoMObDKsw1YDNlR9GQW183JQMNKB4wL4s0YQDi1AtbhCKcG
         dnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758288799; x=1758893599;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4GdfKGjcAjHO1Ow9QOdPWWunxjlWYABEGKDu3CoN9g=;
        b=Iy2o0QjKPfi9S+q5NeiA2BtiM2aS1NSFoBnCQ9+irHMZ/vScuvHvTAoOul80DwhZpe
         rx/kc+fDqPKvc2d6V140udD0+jRmZycI3oH1IBPUWJTLFJuCfYSPlL6EAggHI1iTNE50
         uCIq/JvhJriDcz2AVF6qglvDjY4v7uZYhb+0jvnmhTCBveSGrV3jsmutURiOcad3VdTv
         n/I+PzsvKwjS9UbhUDqhsdFbKNoOCHSx/Wih/2ff5d1oDIQ+jaf42DeGwlWZYOuXW8IG
         RYyTEErWwSugA/qAeuEWJjMSlDj+zi6dpglIR8OTX83P7HUtf84eoe/yXNVKOmu+SL69
         nwyA==
X-Forwarded-Encrypted: i=1; AJvYcCUttsTippY2cKuW7IFAycEG329opiZHN01kIUgsdqVipI/KtIPXkj04gD9WKH0nnIPEm9GHfnxb+balIKhpJGNQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxGsrwa99rmrdGFLNS+lHzjVy7/xvqEiGusn+w9v5ZNelDIB0Zv
	USYqG6ht3UOjjDOi15eYHrbGoSSotLDFohwEJ1IzkAruxyNtw0b0645V/qITiSf7ALT8Jp+hHi/
	J/Yu95RkxEQYMDQ==
X-Google-Smtp-Source: AGHT+IGBtth11hKgSJrPU0wa9yxisbbeO9r+lcZZZKAbsRwiycsMuFxXsib0bL2/MaLbfaWsBZv3sfUavT1taA==
X-Received: from wrbgx5.prod.google.com ([2002:a05:6000:4705:b0:3ec:b561:7686])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f95:0:b0:3d6:4596:8a3a with SMTP id ffacd0b85a97d-3ee193f90f1mr3383557f8f.17.1758288799288;
 Fri, 19 Sep 2025 06:33:19 -0700 (PDT)
Date: Fri, 19 Sep 2025 13:33:09 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250919133316.2741279-1-smostafa@google.com>
Subject: [PATCH v3 0/4] Move io-pgtable-arm selftest to KUnit
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_063321_406249_47592853 
X-CRM114-Status: GOOD (  23.51  )
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
[  191.675985]     # arm_lpae_do_selftests: selftest: pgsize_bitmap 0x20010=
000, IAS 40 OAS 48
[  191.676057]     # arm_lpae_do_selftests: EXPECTATION FAILED at drivers/i=
ommu/io-pgtable-arm-selftests.c:91
[  191.676087]     # arm_lpae_do_selftests: selftest: test failed for fmt i=
dx 0


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
  iommu/io-pgtable-arm: Simplify error prints for selftests
  iommu/io-pgtable-arm: Move selftests to a separate file
  iommu/io-pgtable-arm-selftests: Modularize the test
  iommu/io-pgtable-arm-selftests: Use KUnit

 drivers/iommu/Kconfig                    |  12 +-
 drivers/iommu/Makefile                   |   1 +
 drivers/iommu/io-pgtable-arm-selftests.c | 222 +++++++++++++++++++++++
 drivers/iommu/io-pgtable-arm.c           | 204 ---------------------
 4 files changed, 230 insertions(+), 209 deletions(-)
 create mode 100644 drivers/iommu/io-pgtable-arm-selftests.c

--=20
2.51.0.534.gc79095c0ca-goog


