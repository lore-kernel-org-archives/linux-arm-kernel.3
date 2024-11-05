Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5E0D2B941
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 15:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:From:To:Subject:
	Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Message-ID:Reply-To:
	Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IHekj1dShc4b5Lb3vcX2Lhe3eVM2iwquAnAFbvInQzU=; b=UfR1/NsAdUKEO24UJo9KwnLK4A
	9M+qSssAwCx5jCijKBB2TOZTVOQX6AfLXtmEHVZqEIFDpUJjlVpR6wVXpbuSp375YOM4QF2R7iexJ
	ZfxYyvimDWW0lu3kOZNgwH0/KsBJG4AEZMZ9wfc57bbqoig91xwgQHvp8Vmpcv68ySHgNR81YGxEl
	NeUqJR7amxPCBGq0/ZMLAyPfBmanPcG2T7YmbuKfgSyEBrZtAhIcF1wJbk9aw/jkaxnJmje3MmKRU
	+jcinpho2zRfVDgunoWA7R/mKoijDW4KOsRTlj4fFb6sHqW4c3U0zSB251AFxbgzSBNbIQ6fTtiHx
	dNdCvYFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LkR-0000000HTEK-3WeD;
	Tue, 05 Nov 2024 15:45:39 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Lii-0000000HSp9-2veH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 15:43:54 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7205b6f51f3so4746039b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 07:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1730821432; x=1731426232; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IHekj1dShc4b5Lb3vcX2Lhe3eVM2iwquAnAFbvInQzU=;
        b=YxAol/ZRYJF1imTRhTnx/FvTPIEPjfNO2N8z84YEgp07hH/ZRGMNghI1NurdvMw+rM
         Rii/VtPlPRnuYO9Ihl5k/OTxylKDPdfGCXkJxEwXa+tGEmqVLrp1z7aJG31usza44412
         IOiZSO0nnYz6WzUEmTaWbwBXSZpxLa78A3wvvjI4bARuzlW9YfrXKZZXuwkxDs8IDo2M
         qknXoR0jQwqzoyEOtKXQT3D7YuF6PY1FFRFjkVjMWnv1Jd4QtI7zydDZe9qUtFyLzeI8
         x0l3o/gOSO0Rn/NP8DG/mDGIMLWOILqK/bDGBGN4SITZ0SddiUEUtEj45t8vWD7OmQ+3
         qdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730821432; x=1731426232;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHekj1dShc4b5Lb3vcX2Lhe3eVM2iwquAnAFbvInQzU=;
        b=M5dKE99rknAmRmzY+RctNV0NvpCw0t2iycsGg+2CE3iR1hNriklMnqTqu/o6QOnJw7
         VilTfXN9oMDzwnWLopKieps6HRLbNonsGOyBSYs5Nw6vfsd32wN1g19sMv8VGMvmkjkb
         MqA6fKi+wkhXjsZHCE8CCAb0W/8IexMBNBec0ks6f6aaZRt87ZVJ0rs1VgjovrmAYJ13
         BO/ke0RnMDsJD6VxojrzD8H/YR5hhX5qx9L+/nYJz28EI/X+exMXm3O37427a12Fx5oJ
         ReSCoMmrUJsbK5hgwk5mLh26hgPA2IFz7QJ9FvPJ1TIEGBX79HJR9sqwvTktLcTmYM5w
         EfAw==
X-Forwarded-Encrypted: i=1; AJvYcCXiQvXM0sIUftpm+Mv+sBV6o2ssO8vjkd/eSuwHKJRxZ99KP203TWQw5+SjuvV9YRBCc91ZZ0XP67CJrFmN1t4K@lists.infradead.org
X-Gm-Message-State: AOJu0YxdeWj0zAKERadgaJN3rkX/ZAcygBdA4Z6M8H+RdwkVRaFuGoax
	1iDl50Ie5Bbg48SmeaTULMm9TbieKrWEGGOAgz2BECefwZBZiGDA/ls8U+SBmecQezhqwPhXSik
	U
X-Google-Smtp-Source: AGHT+IH0iLhorl/bfC5OXZaiugIOOdJdTjwTCz8W2SZIB/kDLKn733kJNrhYKy2DpuXNyAvrRlOvDQ==
X-Received: by 2002:a05:6a00:218a:b0:71d:f15e:d026 with SMTP id d2e1a72fcca58-720c988341dmr23710688b3a.3.1730821431736;
        Tue, 05 Nov 2024 07:43:51 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc3155c5sm9806155b3a.194.2024.11.05.07.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 07:43:51 -0800 (PST)
Message-ID: <672a3d37.050a0220.708c6.d37a@mx.google.com>
Date: Tue, 05 Nov 2024 07:43:51 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.12-rc6-169-g8936d33c1f697
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: arm64
Subject: arm64/for-kernelci baseline: 15 runs,
 4 regressions (v6.12-rc6-169-g8936d33c1f697)
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_074352_762388_EA4357B0 
X-CRM114-Status: UNSURE (   3.84  )
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

arm64/for-kernelci baseline: 15 runs, 4 regressions (v6.12-rc6-169-g8936d33=
c1f697)

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
v6.12-rc6-169-g8936d33c1f697/plan/baseline/

  Test:     baseline
  Tree:     arm64
  Branch:   for-kernelci
  Describe: v6.12-rc6-169-g8936d33c1f697
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
  SHA:      8936d33c1f697ce59b16896fcb793f23368e456c =



Test Regressions
---------------- =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/672a32edfa3564fa6bc8685b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
69-g8936d33c1f697/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vi=
rt-gicv2.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
69-g8936d33c1f697/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vi=
rt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672a32edfa3564fa6bc86=
85c
        failing since 19 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/672a32efb35ffbf2b1c86858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
69-g8936d33c1f697/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vi=
rt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
69-g8936d33c1f697/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vi=
rt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672a32efb35ffbf2b1c86=
859
        failing since 19 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/672a32ebfa3564fa6bc86856

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
69-g8936d33c1f697/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vi=
rt-gicv3.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
69-g8936d33c1f697/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vi=
rt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672a32ebfa3564fa6bc86=
857
        failing since 19 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/672a32e586cd2e69f2c86871

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
69-g8936d33c1f697/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vi=
rt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
69-g8936d33c1f697/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vi=
rt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672a32e586cd2e69f2c86=
872
        failing since 19 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =20

