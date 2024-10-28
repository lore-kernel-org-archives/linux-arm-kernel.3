Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592B4D3E2C1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 19:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:From:To:Subject:
	Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Message-ID:Reply-To:
	Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+KMmOh5WvjZELiasYUozQp/OOyft9O+zabARWiGnzSU=; b=TO5xbutTKBFjgGmMophrIWqlyi
	0/OKymmKzdCrPj3bk1jUpk3B93aScBpRCfA1hnyd1PqeoHdECjQ4lhmuwYw2tzAitwgiKAGoR4y+C
	ss6cKwWqLxEGHBKQnssZDXMKNCl77fB9rGwheCMMbMamQwG4M3eqbPssysnLWcuSWRY3t376ddOCH
	GVZSVvgW8IK87lUHn6SjQJUIOOnl03PGVYNC2Dmvlgw34Rx9nyk4brdo/kZ/xDFrMyQL7WEiTTig/
	f+I9nXmC5tegYcB5f1Yz5NhK6ilr558liC/NcwYXfCl5k5n7klirwbtQ+FAVKubXbAZPrpBHO2hoM
	PN46jwDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5VtQ-0000000C5BH-33gR;
	Mon, 28 Oct 2024 19:59:12 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Vr6-0000000C4lr-3nie
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 19:56:51 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20ca388d242so42025275ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 12:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1730145408; x=1730750208; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+KMmOh5WvjZELiasYUozQp/OOyft9O+zabARWiGnzSU=;
        b=PIRbeYEj56LuU1poFCFe3MY58hS3v35YQ9Sffz5exg3+u1hqmCB7RLjSr1e/cwiCvD
         kSDpylrDM4fdU6HwPyjte2Jh145cJKSc58fbZRwkfQN8NTJUutth+ZR4mrsvlKbdcRix
         xMxj38rFIN8GX67XaezmamG8Tpwc8EB5fvNnB6xsuU2dJHbs8d39T5j0HOelip0VBgKX
         k7h7B6wuvG1IzJQ2ns7InLTZiAhHJlQ4KJdfCEJg6UzudXCDAjHpTDTvSwP3k21sgT8H
         wV+7y8H8gWtRnXqifNj1tZ0YiWbpUOBVfFI262FFSoFre2Gwcy2fh2mmGQ4xw+ChrJsp
         LQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730145408; x=1730750208;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+KMmOh5WvjZELiasYUozQp/OOyft9O+zabARWiGnzSU=;
        b=VR9hym1oqsnIZ/+o+KZaMGTVdydGpPZGxgx8UPip5wLIUrWKP0jaNEMoVVeH+isQIg
         GrZO36muMh9h1xJUIESRCu8Wudul9jB5VlUa5LyRERzi8d2Lfnj44EKiIEYxJO72sDWn
         K12u4surxGIOE0kTGl9SP13PMu2HWuO4kVqyedyt5pvn98grVIiI2mGvaZaAlrXpByrA
         Z5IUGkO54wDxQdvE/9KYn8YavKxrfdOrro6FcL8HieHFwiiuJzbcCQc2qeJggZqSpi5W
         0VKf/6pkt87cwlIoo0BhXJuoMAYTHpIYouridvX8u+a5gqgJjA+wOg5ZWEzv//qcfs7l
         ehOg==
X-Forwarded-Encrypted: i=1; AJvYcCWER/pPeGC4mrg3dLGSa4Aga0B/hCO/aNesBFVeYpZICixdxWuYzec1CR4N7agX79rAmG53irfdCnxsF9Jg2Grt@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7y4NfRPhISfXaDLDtQRQiuCTnnTh0lnDXwPr1eJJKdGevIpyJ
	bqYIJP20O5GXQs7EcKVZnfEzcFlrqk5IdSIhBX8YJaxDbTPWIOWgw8eTDpKhxus=
X-Google-Smtp-Source: AGHT+IGqcPzeP5W0onUzARxlGwHapRbVfUZQUlMArkaEOe3s4YwUF4QgYHHAJ1uyC0F1MU2DKlbqSw==
X-Received: by 2002:a17:902:f612:b0:20c:8f78:67be with SMTP id d9443c01a7336-210c6c3e341mr153160855ad.40.1730145407945;
        Mon, 28 Oct 2024 12:56:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc04ae0esm53843215ad.271.2024.10.28.12.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:56:47 -0700 (PDT)
Message-ID: <671fec7f.170a0220.e1349.4c72@mx.google.com>
Date: Mon, 28 Oct 2024 12:56:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.12-rc5-145-g1bf329c696cf
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: arm64
Subject: arm64/for-kernelci baseline: 16 runs,
 4 regressions (v6.12-rc5-145-g1bf329c696cf)
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_125648_972680_6BF32D6C 
X-CRM114-Status: UNSURE (   4.67  )
X-CRM114-Notice: Please train this message.
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

arm64/for-kernelci baseline: 16 runs, 4 regressions (v6.12-rc5-145-g1bf329c=
696cf)

Regressions Summary
-------------------

platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:  https://kernelci.org/test/job/arm64/branch/for-kernelci/kernel/=
v6.12-rc5-145-g1bf329c696cf/plan/baseline/

  Test:     baseline
  Tree:     arm64
  Branch:   for-kernelci
  Describe: v6.12-rc5-145-g1bf329c696cf
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
  SHA:      1bf329c696cf80000f1098bcdc23534e6fe14fe2 =



Test Regressions
---------------- =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/671fe20d4c49fb3bb9c8685a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc5-1=
45-g1bf329c696cf/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc5-1=
45-g1bf329c696cf/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671fe20d4c49fb3bb9c86=
85b
        failing since 12 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/671fe2c03b644cb195c86862

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc5-1=
45-g1bf329c696cf/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc5-1=
45-g1bf329c696cf/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671fe2c03b644cb195c86=
863
        failing since 12 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/671fe2258cb9008d71c86863

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc5-1=
45-g1bf329c696cf/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc5-1=
45-g1bf329c696cf/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671fe2258cb9008d71c86=
864
        failing since 12 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/671fe20cfd1610de7cc86859

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc5-1=
45-g1bf329c696cf/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc5-1=
45-g1bf329c696cf/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671fe20cfd1610de7cc86=
85a
        failing since 12 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =20

