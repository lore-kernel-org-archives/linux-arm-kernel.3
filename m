Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79265D1BDE0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 18:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:From:To:Subject:
	Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Message-ID:Reply-To:
	Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rEpnmPHXRjoFqkv5T9fJ2GQePKB42N+JPvhiOZ1DYoc=; b=FQrJ+DUslYAKC4ymJ/1oedtRug
	SV33gbq/0Tsgo9BZAoQDiXoDwyt4WDRoOF7iUpsvoT8lNhg6LjhGx51qkzPunEWDwLaxNvOdA/pQr
	mnTNpfJ7POC1JU5cH4wIdxNQoBxNxfSe42JnVVUy4dylu0mMyeOUNzbc9xIFwpM/Lpi7mjRHrmPId
	yKx8R0BzyVuZl6R871uVwTOP+zfgJp0hoIqQd+OBrGeJKGmf+Sosqsd163As/i767fA2HLRwf5QfJ
	LWVYMZeCLvNCVL0Y12MTeszUj73lKFKQ7+aC/xXOCMXegr25ezBXJqvvCvlHMSbXH3Q87XoILqMCk
	VNTMcwwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t827k-0000000EolH-2lOO;
	Mon, 04 Nov 2024 18:48:24 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t824N-0000000Enxq-2EIh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 18:44:57 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-72061bfec2dso4259940b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 10:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1730745894; x=1731350694; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rEpnmPHXRjoFqkv5T9fJ2GQePKB42N+JPvhiOZ1DYoc=;
        b=t89rweyvVfs/JmpksEyhrZ5PEheQm6N6tXvPoAQ2Ff4ldfAiJK/uvLS2JSfy0SHAnJ
         KNo6cwNgN2ROfeHsxK10/Mr4fHY5K4UF/y71fnuYlC2/o0uQ4E4/GnIfXWVnrbZHWoQC
         vPjD3u7rgaujC2GncYL3z+27oZdeqqIUDBTZHR3fgCT2/z7hJ7Vr20h9N6OCwU1rtDiG
         4K2Nl6dEnwZJmMt56WXyNxFLWvsMuoc8J92ypjtfomdQKovaqxij/uPf1Fh4Q4Y2gSKF
         DbKjhqiC/K5BTaWj1kY6pchZIydj1S2Bm8k/i/laC9agW9mc3USikg8tA+4SlBxwDUtu
         zjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730745894; x=1731350694;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEpnmPHXRjoFqkv5T9fJ2GQePKB42N+JPvhiOZ1DYoc=;
        b=MR7Z2acQqLW4qoHm3KP5qhPutZUTQJSp7IMu2UhnEQ4+zMSRWt48hnn1SHPzhNA8Vh
         2x+fVcr3Kvfd4ANuEDzR55qTaPbz8FyUu/42KPsZVE/M65j/Rr8iACCQoKvsRnsHoMZ4
         0ANc3dnROkzPRn1XIk2wuG1DKBEx7WWVOvyyMvKKHIWah6kfYPNRDQXAiwcB7lIqUtjw
         RBAxnXbHUmgTAaULGrdooHgKfW/CgS4Rf82H0Onv45O986WZef3l2+r/hH8N9MzM0U8P
         e5mcsNB0nr8+zDQaB3zV9vENNFQWVXxek1P7wyT/eePTQS4xX7M3VXhX8kU8d6KuFYTR
         9/VA==
X-Forwarded-Encrypted: i=1; AJvYcCUJxoV77GyTXXwhEOdXkBR07kcHkOYc20rw/ft7PvqdZ+wlLf/uTo2GZaHcd1NmSwJPsVga9wBPW5hx6dAezrMH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6b318FsEZlPHFx3iJNRx8och1NGHyK7TY1Ho/CkI+FkFXC9li
	v1z5hvUEcaI9a4+S3FOlSnzcKYxcT+VRUJy9nq6eqg7M6baHB3RYFa9ic/XllEw=
X-Google-Smtp-Source: AGHT+IE+BaAo5SbGEMzwlw+85LMjWu9HB7UK6HJpJPq03wxwYg+Q39bdpjqi2dusjD7N0Y6gkVxBnw==
X-Received: by 2002:a05:6a00:b53:b0:71e:104d:6316 with SMTP id d2e1a72fcca58-720c99b5db3mr19046060b3a.21.1730745894069;
        Mon, 04 Nov 2024 10:44:54 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1e5625sm7823279b3a.53.2024.11.04.10.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 10:44:53 -0800 (PST)
Message-ID: <67291625.050a0220.566e3.269d@mx.google.com>
Date: Mon, 04 Nov 2024 10:44:53 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.12-rc6-162-g46f782153ea2
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: arm64
Subject: arm64/for-kernelci baseline: 15 runs,
 4 regressions (v6.12-rc6-162-g46f782153ea2)
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_104455_597524_09B1C5DD 
X-CRM114-Status: UNSURE (   3.65  )
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

arm64/for-kernelci baseline: 15 runs, 4 regressions (v6.12-rc6-162-g46f7821=
53ea2)

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
v6.12-rc6-162-g46f782153ea2/plan/baseline/

  Test:     baseline
  Tree:     arm64
  Branch:   for-kernelci
  Describe: v6.12-rc6-162-g46f782153ea2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
  SHA:      46f782153ea2c67ebd059b467cc09cf6161ad90c =



Test Regressions
---------------- =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/67290bd13bfccec309c868c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
62-g46f782153ea2/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
62-g46f782153ea2/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67290bd13bfccec309c86=
8c3
        failing since 18 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/67290be65675ceb374c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
62-g46f782153ea2/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
62-g46f782153ea2/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67290be65675ceb374c86=
856
        failing since 18 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/67290bdc3bfccec309c868cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
62-g46f782153ea2/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
62-g46f782153ea2/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67290bdc3bfccec309c86=
8d0
        failing since 18 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/67290bbd8212aa0194c86859

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
62-g46f782153ea2/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
62-g46f782153ea2/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67290bbd8212aa0194c86=
85a
        failing since 18 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =20

