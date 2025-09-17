Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4160FCAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 19:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hrARdai4TIWekf9/RUNeq+VchPKlvV4Ou8tril+TVSA=; b=Ao3wQ+5P+1O7a339tgvAZ2CvPa
	JU2sW4OFoC24gnMmJa1I1n+vXCo1bI4F16AQ0E4AtWFdtmKfEVgC+uyJXstQSkyl9kuVDbxLTSW+o
	S2NWAk5c9nvGZe9m80T+zG9pIBBRpsufCUGI/L34kwIc+QaPFsaQenHZCLwekHkO/JCGkq4C6Nllo
	uhxxrGyEkq0EsvocI35knLgkpMTCH1aA9NGwl+julHbBmRxwqfaQxgYcoRqLecJ9XUl2pupxPBIBd
	uKXGAbxUG9H6t/UwTZDLflsJDOcouCzfPutal7lM3ZhmRvAqwVtUqfsyawHUuQq6EJLAskxIaDuEn
	Rw28s/oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxZK-0000000E9Ne-3u67;
	Wed, 17 Sep 2025 19:11:54 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxZI-0000000E9Jq-2200
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 19:11:53 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3ea1550f175so21334f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 12:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758136310; x=1758741110; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hrARdai4TIWekf9/RUNeq+VchPKlvV4Ou8tril+TVSA=;
        b=38jmZPyrcQIulPPDzdtf5LNGCmDsVhG/ZZtMKJocRPZYcwDtctuJtbDaBt92CvnA/3
         JNo53+UEFLqnqrQMX7AOdlKBz54ExMr3gmsimIHPXMX2CsqwL118qopqS0F/tCzBQZeP
         IHFVQe3t/egd9KC+tJp1Lk3KLqw4ZWqQS3ZW/eKZfKcqH1S6DXbrgdjjKyVqKYdUtct7
         1GFq7VnYhMbJkrW4eTG68s+9Mx/Mt3VzF0QzLtFkad/B55G2E+W6+7pW/7cMyX5P2CzU
         BEx97ANL1vheR8kPvorWMIv9ZcZFx8ZrCj4aCcAlf3xrZlWGQbL5lw8g3gy7WIf2Sqrl
         94hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758136310; x=1758741110;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrARdai4TIWekf9/RUNeq+VchPKlvV4Ou8tril+TVSA=;
        b=wTYodXmA8nxP/UlxYzQHLUE40vLe2NWwhwMYYUtS/9rycdIlkknWAQxWU61MLzONTM
         0aldeHLR0xMHbHECwgEYgE72gZ4OTFilSf2/rtk6HP7+Rn24xbIr7JJpACyVVUX6ACYx
         DApVqSYjvNpAXDNEbPrtxUkHhqDfkUrKRalg4QBf3Deovgm4beV0j2TCdQg8KVhWsCVe
         QCwqQz0orVNqUDNtX9UBRAKUPC2RtT5bAPvFL0tqZQD1IsMe4rJa0Zdk0r2YJcANieCZ
         EV/ElNanxefqlQT0DrBqNJDldH/AIBZ3p6T7dYqH6PJTXn2dxfrLug5YqnOYfA5BMqn/
         kmxw==
X-Forwarded-Encrypted: i=1; AJvYcCV1xGLFw5nkVH58nHMkT02LPe7CrLgq/LWYIbFj1ZlJkIy4y++C49NkRuJUV+h/WyQTMyRkPAuig23HMToy2jS0@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0YdDbMZnewsaCeVEmh2L5piPu8B1fVHXQDfbsZsccbba5SuUt
	QI31AlEt1oDOXQ8h4+kEpbKfH+e7NSfGH2pnYiSABVhwV2FJxkEZVHxksnz6Byb8cZWb2j2XSAT
	n4PmH9Pd9KDNIYQ==
X-Google-Smtp-Source: AGHT+IE/wSFEaSIOL/io/GqUMdS/4N3/l1Wv9TP9hRQ2M6LcztpPNng5dXrReb1gF9DuJgNotR8IDC9W3BF9Qg==
X-Received: from wmlv10.prod.google.com ([2002:a05:600c:214a:b0:45b:9c60:76bb])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:186d:b0:3e7:486b:45cb with SMTP id ffacd0b85a97d-3ecdf9b8549mr2676797f8f.3.1758136309966;
 Wed, 17 Sep 2025 12:11:49 -0700 (PDT)
Date: Wed, 17 Sep 2025 19:11:37 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250917191143.3847487-1-smostafa@google.com>
Subject: [PATCH v2 0/3] Move io-pgtable-arm selftest to KUnit
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_121152_539327_A07126D1 
X-CRM114-Status: GOOD (  23.46  )
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

The first patch was originally part of the SMMUv3 KVM driver support[1],
which needed to factor out the kernel code from the io-pgtable-arm
library, and based on Jason=E2=80=99s suggestion this can be taken out as a
cleanup, and a step further to convert it to kunit.

The first patch just moves the code to a new file with no other changes,
so it can be easier to review with =E2=80=9C--color-moved=E2=80=9D

The second patch converts the sefltest to be modular, that is useful as
kunit can be a module and it can run anytime after boot.

The third patch registers the test using kunit, and converges some of
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


Testing:
--------
- With CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST=3Dy
  It will automatically run at boot as before this patch series.

- Otherwise with CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST=3Dm:
  1) on module load:
     Once the module load the self test will run
     # modprobe io-pgtable-arm-selftests

  2) debugfs
     With CONFIG_KUNIT_DEBUGFS=3Dy You can run the test with
     # echo 1 > /sys/kernel/debug/kunit/io-pgtable-arm-test/run

  3) Using kunit.py
     You can also use the helper script which uses Qemu in the background

     # ./tools/testing/kunit/kunit.py run --build_dir build_kunit_arm64 --a=
rch arm64 \
       --make_options LLVM=3D1 --kunitconfig ./kunit/kunitconfig
      [18:01:09] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D io-pgtable-arm-tes=
t (1 subtest) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
      [18:01:09] [PASSED] arm_lpae_do_selftests
      [18:01:09] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] io-=
pgtable-arm-test =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
      [18:01:09] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

A failure at the test with the new implementation look as

[   66.624469]     # arm_lpae_do_selftests: EXPECTATION FAILED at drivers/i=
ommu/io-pgtable-arm-selftests.c:154
[   66.624505]     # arm_lpae_do_selftests: selftest: test failed for fmt i=
dx 0
[   66.624524]     # arm_lpae_do_selftests: cfg: pgsize_bitmap 0x20010000, =
ias 48-bit
[   66.624669]     # arm_lpae_do_selftests: data: 3 levels, 0x200 pgd_size,=
 16 pg_shift, 13 bits_per_level, pgd @ 00000000f200237d

Main changes in v2:
-------------------
- Make the test modular

v1: https://lore.kernel.org/linux-iommu/20250917140216.2199055-1-smostafa@g=
oogle.com/


[1] https://lore.kernel.org/all/20250819215156.2494305-5-smostafa@google.co=
m/


Mostafa Saleh (3):
  iommu/io-pgtable-arm: Move selftests to a separate file
  iommu/io-pgtable-arm-selftests: Modularize the test
  iommu/io-pgtable-arm-selftests: Use KUnit

 drivers/iommu/Kconfig                    |   4 +-
 drivers/iommu/Makefile                   |   1 +
 drivers/iommu/io-pgtable-arm-selftests.c | 226 +++++++++++++++++++++
 drivers/iommu/io-pgtable-arm.c           | 243 -----------------------
 drivers/iommu/io-pgtable-arm.h           |  41 ++++
 5 files changed, 270 insertions(+), 245 deletions(-)
 create mode 100644 drivers/iommu/io-pgtable-arm-selftests.c

--=20
2.51.0.384.g4c02a37b29-goog


