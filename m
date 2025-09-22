Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923B7CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 09:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SJqhgJyvnD5d6YT81nFGxO9YqrSRYT6f3jsmSzdijO4=; b=iRXDbL8FEM0wcdAK5+4RTSMWJS
	drlzBg4pCeZm1AgtItB449XrP4Eql7ORD+UTGfbO5sUvJUAdJMYS2Fyk1V+k3FxXbgKvWmPACU+t0
	aHDVcCMxNsaMc7uzqn8EU742u0bE+jlZS27Rtpm3dZY432x1Vh+M4RwhmFcz+AcN/0JjUzj8G4ZGc
	6SLqnMLRwkFXSvVRu2CDFMGSirR/QsQ7qQzEvQu5c/SHSsTOI2BdAYD/IdP68QAT0ZzYvZ6HNV6B2
	V0lszHznacpElGNA8WHbcEU/Ixbgd1iG6JjSAzYAvNL4rMU2BMolIx2Hz8bLjm9O1+THvbFBcLq1K
	sQfMVQ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0cP9-00000009otc-2INs;
	Mon, 22 Sep 2025 09:00:15 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0cP2-00000009oq3-0U4s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 09:00:10 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b042eb3ac03so46920166b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 02:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758531605; x=1759136405; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SJqhgJyvnD5d6YT81nFGxO9YqrSRYT6f3jsmSzdijO4=;
        b=GZBuOs33sjTGyErU2vTi9Qx/lVm9N+Wk6CRJjW7igHx6rqS/pnuTQatSxOt3h5j/OS
         DX/A5GAiRQ0TLb8izCXgYz2yLVTyh+8iV+wWSHY8cYwz2ZM7pI15zv/zlZRqA6wAGhMp
         I829uup0/RiDnbZ7Z3ST07iCHf32ubeaVQu0jQmZs5+XbsB5I94TZoPPftyLBJRWIbyH
         tL7H9/QhUxkVKlQ3/gu6/Yjh206C6uVXZS93EjPNXdgE25p8pKtmIIRN7E8Epys7on4z
         qisWKARlfnnYEvd90ifLqTQboLvDIAOAvvremsMYUX/AUswGzhhvN3C+UQEvqFqhNzmg
         QWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758531605; x=1759136405;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJqhgJyvnD5d6YT81nFGxO9YqrSRYT6f3jsmSzdijO4=;
        b=m4S3N2YOASQi2pRHOCWt3eghQd2jzKRO13Et+pfbc8svontuzdhIjd2tdgpdWq/IZ5
         LgiVm0uzP7WewvfT8HrK9fXuNlWdpTnIwtfAF8ZeE7s/lRf3YRq6Zwq8+Ysuz+sKusTV
         WyouTdVUHVTCozOut22jg5HD9FhfgJXXdWKXTmQA4N7Md4IBohY8y1ecPIiPafPHD4oi
         dbm8rOf3LSJ1XVfJfCf6T3Oi/BdcLuIWEYBhxd1r3d75KCcMk7AFPt1iz2NNA6hp6N4F
         BCCaIUnUf/uJc4rJJ7JEvThQNFap/Rzdvua7ULzgMLO2jDTJr4b4K/Yv27rimk1PWpxE
         VMPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfQ8JBsoxHt7SmcqJ2WrJt4xh65g0XaI09XJj/PBGo6XEfOCszz9u3Yu2KMu9TYJrqcnDJlMH8I3Wfvoy/XcvQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz40bNzd9gpdfp5dt+A7MusXlMVvjySNbTYqDH3LuhyolVM8yiW
	ZhJm7lQT56sCEbkyUrBATEDZ5G/Yy2QDggR65XJAIjXlB3eohsJTPWbkMZp/hWnwMp1rvxduqpJ
	HSS6fHQYN4f1P0w==
X-Google-Smtp-Source: AGHT+IF+yNxN8u0Kn/bBdnRnggKLG4SBwNB4ClzRlBvae+pc7iApwAt2kx062VQ8LZ+b/9dnodHumoEI9ZZgHg==
X-Received: from edf16.prod.google.com ([2002:a05:6402:21d0:b0:633:2fbe:a0c9])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:948c:b0:b14:53a0:5c61 with SMTP id a640c23a62f3a-b24eca014ccmr1430032766b.12.1758531605450;
 Mon, 22 Sep 2025 02:00:05 -0700 (PDT)
Date: Mon, 22 Sep 2025 08:59:24 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250922090003.686704-1-smostafa@google.com>
Subject: [PATCH v4 0/4] Move io-pgtable-arm selftest to KUnit
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_020008_176005_FEE19523 
X-CRM114-Status: GOOD (  23.57  )
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


Main changes in v4:
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
 drivers/iommu/io-pgtable-arm-selftests.c | 222 +++++++++++++++++++++++
 drivers/iommu/io-pgtable-arm.c           | 204 ---------------------
 4 files changed, 229 insertions(+), 209 deletions(-)
 create mode 100644 drivers/iommu/io-pgtable-arm-selftests.c


base-commit: 07e27ad16399afcd693be20211b0dfae63e0615f
--=20
2.51.0.534.gc79095c0ca-goog


