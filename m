Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6EECAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 15:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GeGiAhQBgE5SioCpTqIS2Jf/K9QNAbJm22HCuBejOhw=; b=y1moNaRY0oyNnukEoWrqXDiXpE
	tR0OMY3YY7oLigWeOhCzmLJQa+c9H+lNOvRRq2MPI/2QNykanP1Lcs2SMCLP+Dy/n6C8EVckuj2Px
	FR9A1W2SO8FcaAJ6tEjErhZYpe17wgINsctLuSKPeO7mqhKkCYDYIolbKEtlu+tnBpmprzfDuVyEO
	jy1KcFBQvxQ+IBylw8TRlQ2Fwxa7+AV9tBf/nEG1ohEfihSWsxd1WfYme7rMPrmkoVUJGyWzQZImw
	BGIZomPnDBMuBfi6s5vpuXaP9Gf1IJVBWOTxJGCnEN0UDGi/fAMxCuudeQT2FE4Z7xLkpH/jmxGTu
	fcii+f1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3G8o-00000002paF-0aTU;
	Mon, 29 Sep 2025 15:50:18 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3G8h-00000002pWf-13GW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 15:50:12 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3fba0d9eb87so2771062f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 08:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759161007; x=1759765807; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GeGiAhQBgE5SioCpTqIS2Jf/K9QNAbJm22HCuBejOhw=;
        b=vd0ZlqWdzYsDX9WSpwTvH1faTz+nHfHEZ50WIxEFqpuYP/SrZCgMoPdvxXgk0k+uh6
         RB2Yg/QoqDa0DJlJYKDenIoI9Kv/phQeOJVsxC+sP7fROJ1wVzsMeZ7q6buK7/gUAa4/
         v81ut8Rwmvrp1jDt5GJ9/PrYhRZigNvavqfMY3SRdH76nF6AWRzikY+rNVjM1SFREMP9
         fopwEsrIItLLSUzAkKqfARoV3Gvtnypuqj3SyvDDTLsUmw+B6WG/kRSzp7SbEqQeOYLJ
         5xLkRaiLUGI2WrlJSd49M09nuICXr29ah2CFS1OWRjVq9iAcyOZhZ/Rloiuz8XeBDUPS
         1GGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759161007; x=1759765807;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GeGiAhQBgE5SioCpTqIS2Jf/K9QNAbJm22HCuBejOhw=;
        b=tflLLHDPfei9UyKqaLz6lA1y5SstbgHfL7cxIjjgUM+eed5mF97uY3IIFS89KG6Q4y
         0KnaagoeCnJ1bOOjlfoWaG8G/85a+g9SihvwboKaSgjQCd38QIC7bawg2FjNtrPfDdVJ
         1klhnNN5C5K52UIFkenW0336GlqTP/fGcnRiq9dx/ECGLMrU8JSqZYPhD78wKa/onrju
         wCjUxrZlNfJPbNnKkg70bva+2tyv+lPTs4yiCogmwMrwe9DiOz37qvsWPfrEraF4f5sO
         6b3cCddVDCR9slmxrxxKep9oTQHdiaObR9ITuUR2LgvB5PLQldnfST7Sw1a0jyal+5x0
         uXug==
X-Forwarded-Encrypted: i=1; AJvYcCUwN2lFofx1C55UsGwbfY8NtA6TfcSUv9Kn8fwN0s0QI7qtGE10/mRV6ucMiBODLfh6sBObKeLifbg89pb0epV1@lists.infradead.org
X-Gm-Message-State: AOJu0YyUKhTQ9ctjPUGrKxdMBxNZqomw4rzlGgmBiztH1+U2xkN/ciI7
	DaEZTUpbV3uYqESTFOkeZyfSrUPB/mpkej0Ciw8KMMW6kDpFcgtIlG2Kx6YEIUYhiBUCrTcV09L
	GRhZ8bKxJO07qCg==
X-Google-Smtp-Source: AGHT+IEICyelSc+dhdigiShqJvTBGgipfMzl1NQ4eObmUtfk5GsCQRpuD8i813yQYt9a5FCkGAW67AoXY8BgRw==
X-Received: from wmoz15.prod.google.com ([2002:a05:600c:78f:b0:458:bdde:5c9b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4024:b0:3ec:d7c4:25d5 with SMTP id ffacd0b85a97d-40e4be0cb3amr13969388f8f.50.1759161007523;
 Mon, 29 Sep 2025 08:50:07 -0700 (PDT)
Date: Mon, 29 Sep 2025 15:49:55 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.536.g15c5d4f767-goog
Message-ID: <20250929155001.3287719-1-smostafa@google.com>
Subject: [PATCH v5 0/4] Move io-pgtable-arm selftest to KUnit
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_085011_311168_DC57443E 
X-CRM114-Status: GOOD (  24.07  )
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
  iommu/io-pgtable-arm: Simplify error prints for selftests
  iommu/io-pgtable-arm: Move selftests to a separate file
  iommu/io-pgtable-arm-selftests: Modularize the test
  iommu/io-pgtable-arm-selftests: Use KUnit

 drivers/iommu/Kconfig                    |  11 +-
 drivers/iommu/Makefile                   |   1 +
 drivers/iommu/io-pgtable-arm-selftests.c | 221 +++++++++++++++++++++++
 drivers/iommu/io-pgtable-arm.c           | 203 ---------------------
 4 files changed, 228 insertions(+), 208 deletions(-)
 create mode 100644 drivers/iommu/io-pgtable-arm-selftests.c


base-commit: 5f4b8c03f41782f37d278946296d9443a7194153
--=20
2.51.0.536.g15c5d4f767-goog


