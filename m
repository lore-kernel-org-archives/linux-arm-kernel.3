Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D138D5C0E5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 15:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:From:To:Subject:
	Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Message-ID:Reply-To:
	Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3jRoK44OrWTIrL7ynmK5thmnwI+TO1BOrOKphbS+Fbw=; b=qihNhKW4rfQQPbHOABzTS7yCbU
	lwCVIvhsVCVbkn8L/WG59dQF74EYCh6ZACx8EzdHPz+nxnGZSVApWE3bqHtR4krAgjaBD+7PJc7Gl
	b3FTfmEmsAyen1rwqOA+phl1TzwDeISjimg2wEomqLwbKdNAdEBxhAhAfiewlR9CMUxpB5/DM08OA
	MLf6vRdJ5a5iyjjg+hze/rFsx1oJnOW1lyB5Yiety044+XJSkSXL403g6YYd9L3gBC9es3T0D6zs8
	YINwOFMQtmw43MDbEseV6cf/kLHC6oIQH+OwmnmuogBfAjbmu+lzh9BNm4DlD/yeD1BxMTadGTyjT
	7Bd1Vd6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QcK-0000000AyiQ-3GAZ;
	Fri, 08 Nov 2024 15:09:48 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Q3A-0000000Arc2-0rvE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 14:33:25 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20ce65c8e13so24498525ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 06:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1731076403; x=1731681203; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3jRoK44OrWTIrL7ynmK5thmnwI+TO1BOrOKphbS+Fbw=;
        b=yFUjaQZQcVaYkiVEXo0yOVIJqPfP8ig4cUAnU/Dd4J2TN8WOgjkfVDm8uB1xoTkpSA
         P1rxpk2RnM/NyJyZLs5fAb7AEKEPdr/rDN8Olw75mslCtlaR4i4KBldPb+WjSHV5AsQT
         0J6w37IQKVS1bKZWord5W9KK0oXeMlW2E2BpWQKfHTjfcT4A30SU2QEsXw+ZCgTTMB7a
         0HSb2bnvhWJmmjtn2N4jKQVgj1+KartryDnQt/Jusl1Q8Xe+G2+wDYh7oFh/4VwnP//m
         2fwG0lqVIokrajDLYSFqQe2PbS+vaKQUf1Lk2QugAqFLSUwh0xvTIUPhvN+sPAF7f2wE
         E5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731076403; x=1731681203;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jRoK44OrWTIrL7ynmK5thmnwI+TO1BOrOKphbS+Fbw=;
        b=dsXsw9GnskKRmW/BluoA1Q7aLEMWr5KAPTHa47Lqc30z/CuRxybgsfHCneARNPm03H
         FXJxyMp4pPXul4Z7MgtWc0wDMlZXBZC5uLeWYz6N9aP8/HfZ/sFi8uG6UldTgIU7H3zn
         hQaIDqJG073K1o47VIpsrMP0HFMfOb0vBjuOKRgoS3eud7GWeOLJpevfkFd0KmcVyOGP
         7lqirRDUMBepbm8K9krQ/3BzY7q7m19TPWXmXzQ6MVhf7Oq1mIxhdsOA34arO5XRr92S
         oiX0+DNwOp/E7tb9IUJ074cNG987v80gFZZrGtF1AKrBbbdlTrZpXqGRl6kHZLTTYdOD
         TD7w==
X-Forwarded-Encrypted: i=1; AJvYcCXHnpLUx+eyl/J9r59voSm1vTDvfSVEZOWxnJwe8GKBDFsIBiX5znngkB7n9ztPcrGIQrTjAlPJ6qlRrwMOP88f@lists.infradead.org
X-Gm-Message-State: AOJu0YxbelsUrJ5nD6KczRYrFC2i9pM+aVsb+/irexoc8OCi+ermdhbN
	yzfUNoZNzXVnzvUSJmKvJKBBQlMowm1oAJufk15GxBUL1hSLiYiVzwzQAmKqb0w=
X-Google-Smtp-Source: AGHT+IFLOwtAJTf4i2qdQcqWjZd68adE1DtYZ2vnnwc/mZrye7oG+gYXrz28Spn7kFaRnXh6qA572w==
X-Received: by 2002:a17:903:2ace:b0:211:31ac:89e0 with SMTP id d9443c01a7336-211834dfd86mr39850105ad.4.1731076402840;
        Fri, 08 Nov 2024 06:33:22 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177ddd675sm30824455ad.73.2024.11.08.06.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 06:33:22 -0800 (PST)
Message-ID: <672e2132.170a0220.2dee40.f2df@mx.google.com>
Date: Fri, 08 Nov 2024 06:33:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.12-rc6-196-gca3a5c08a5ef
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: arm64
Subject: arm64/for-kernelci baseline: 13 runs,
 4 regressions (v6.12-rc6-196-gca3a5c08a5ef)
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_063324_319528_94E68637 
X-CRM114-Status: UNSURE (   3.43  )
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

arm64/for-kernelci baseline: 13 runs, 4 regressions (v6.12-rc6-196-gca3a5c0=
8a5ef)

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
v6.12-rc6-196-gca3a5c08a5ef/plan/baseline/

  Test:     baseline
  Tree:     arm64
  Branch:   for-kernelci
  Describe: v6.12-rc6-196-gca3a5c08a5ef
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
  SHA:      ca3a5c08a5ef1ee11c65c83b95d47117edf24e77 =



Test Regressions
---------------- =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/672e16c8cfc4e85f70c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
96-gca3a5c08a5ef/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
96-gca3a5c08a5ef/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672e16c8cfc4e85f70c86=
856
        failing since 22 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/672e16c99006f738d4c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
96-gca3a5c08a5ef/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
96-gca3a5c08a5ef/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672e16c99006f738d4c86=
856
        failing since 22 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/672e16dc9006f738d4c8685b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
96-gca3a5c08a5ef/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
96-gca3a5c08a5ef/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672e16dc9006f738d4c86=
85c
        failing since 22 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/672e16e29006f738d4c86860

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
96-gca3a5c08a5ef/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
96-gca3a5c08a5ef/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672e16e29006f738d4c86=
861
        failing since 22 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =20

