Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DE8D64086
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 03:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:From:To:Subject:
	Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Message-ID:Reply-To:
	Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u8QIkmR80aSLdLEwnCfzx1RlF6or2+uzyuVnxUde/Us=; b=DTktFYO+Eb3oeEChHdFkwcIdIQ
	5KhxUVpLsPGrmtvqP+FpH6gYTK9iwfKfFdleqPa14X/FQ2yLxYLEX/WKSRCvJoPGtLbYlD3yZaIo8
	UkBFkaBacPcTyhMtJnZzfr2mwKrsDuApPLM38/lmenve0hifAL0ZJjwJ0Zz0awxI460FlfVVnzqvL
	kQPhxUP09FmdnRg7ZJpctZUIBvXPQfkFdXCMj7+JATTEXy5XO5VouYEbIYVtzL/vCnqqZKxCg+qZy
	jXEAQF5DTN6nImzwlKvEP9ixFQlKPga6cP1iibOu4sBlYPX7yZ4xrEpu5xzm9JVFklq0EmGSb1Ayz
	88pUd0Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9c0Q-0000000Ca3D-1atM;
	Sat, 09 Nov 2024 03:19:22 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9byb-0000000CZuV-3jKe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 03:17:31 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2e34a089cd3so2293397a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 19:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1731122248; x=1731727048; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u8QIkmR80aSLdLEwnCfzx1RlF6or2+uzyuVnxUde/Us=;
        b=U6IO9ciQ1dkgsEQZm7dDEfrGqy6SIU92Xc9eRYij28F1bjzeQSG/SnzJvIuufI9vP8
         05oZbkcQBq/eNPNrYYa4ZXjwKcHjLloJ1XVkHk49LjURZsSWpx/Xq5GO9NODBVkJY12E
         ujnw7hMhvv/RHUWC/Q5lYEHOVIfc6moBHbzqwbdepTb55ncghN98yecTuMIjcwDHtIgc
         nTwUkpXaBwQ0iQGgSMDtO7i8iuhxhrjbQoUeWVbWJgTkx+gznDIz+aLy7aFH6YprI11Q
         CqERiDijmsaT/PE/Dqobf8jEMO9iyLxahvVS0w/kudtmta+yl4cUCwJw9hIxIkjCdkGU
         aKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731122248; x=1731727048;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8QIkmR80aSLdLEwnCfzx1RlF6or2+uzyuVnxUde/Us=;
        b=Vph7877z/VVC+zBVL9sHpZR/76Vz1x4IKRQw2cF/JsJX1JQbJkbHHmIixuoNm7+LiJ
         ku6VbR43Aig2m3Hfea5PpU1mAwdOhuv2Gh2WAPaFCdN3nCVN8WHBwAcapvTJHwVSEaJ8
         72x1jT5Fr07s29oMo2YNFhbRw7EiltVYwwdBypQF/uvWXkDCpg+llwmtpf6g7icWbV2E
         xpTBWgsCMM8XUb2TzrKaX0nSLaPsmSh9OJgsuW/oOtJhK3dUdVzE3K8U2dGkrVz5VW/X
         NzuPKl7SQuEpCmRQN+jZATWzIR7tLhxJp639uj5wskN/XWfSoaqSEw+HcoiKPwPFmy3A
         RGRg==
X-Forwarded-Encrypted: i=1; AJvYcCUC375U4sdoxt02+3B5PwltzBnsmZWzHabT73SB1CoiL1w9nCzkVGu0LinnSnr9eojnM2GqO6MjFDN+xcUVohCr@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo4pibaHZJ7is1c+r09GL0UlMcHfFMhMBUUlMFJLH6wjtxQXiV
	tmafXpHIZJqnHyEfG0daHcdVY6kLrubWv45+sMTuZK/UZpHMQyNeX2piUwhbJ+Y=
X-Google-Smtp-Source: AGHT+IGtFbIc3xp7+nlqEZa0j0sJmZY3cC42toQ3bvi599ktMH9MhUX+N88CNnSMpusv3us1rV4JJg==
X-Received: by 2002:a17:90b:4c8e:b0:2e2:d434:8547 with SMTP id 98e67ed59e1d1-2e9b16ef532mr7040148a91.7.1731122248571;
        Fri, 08 Nov 2024 19:17:28 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a62b70dsm7125740a91.44.2024.11.08.19.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 19:17:28 -0800 (PST)
Message-ID: <672ed448.170a0220.278901.943b@mx.google.com>
Date: Fri, 08 Nov 2024 19:17:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.12-rc6-200-g563047e691f2
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: arm64
Subject: arm64/for-kernelci baseline: 17 runs,
 4 regressions (v6.12-rc6-200-g563047e691f2)
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_191729_955131_529DF637 
X-CRM114-Status: UNSURE (   3.30  )
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

arm64/for-kernelci baseline: 17 runs, 4 regressions (v6.12-rc6-200-g563047e=
691f2)

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
v6.12-rc6-200-g563047e691f2/plan/baseline/

  Test:     baseline
  Tree:     arm64
  Branch:   for-kernelci
  Describe: v6.12-rc6-200-g563047e691f2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
  SHA:      563047e691f2bdabb809481e1c0f26d171632115 =



Test Regressions
---------------- =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/672eca5998b885ca10c8685d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-2=
00-g563047e691f2/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-2=
00-g563047e691f2/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672eca5998b885ca10c86=
85e
        failing since 23 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/672ec9e1c3ea62e4a9c8685f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-2=
00-g563047e691f2/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-2=
00-g563047e691f2/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672ec9e1c3ea62e4a9c86=
860
        failing since 23 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/672ec9e32cad1191e5c86858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-2=
00-g563047e691f2/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-2=
00-g563047e691f2/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672ec9e32cad1191e5c86=
859
        failing since 23 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/672ec9cd61b144bc8ec869b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-2=
00-g563047e691f2/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-2=
00-g563047e691f2/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672ec9cd61b144bc8ec86=
9b7
        failing since 23 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =20

