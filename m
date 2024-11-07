Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29659D5D690
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 21:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:From:To:Subject:
	Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Message-ID:Reply-To:
	Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R/uGgDzxBTMwJeme/h8t+/Y5+MaW5JJnJNkGRbB5RAs=; b=WQTH03/9gbXbb35rVlXpY4OdkR
	iO29TU9QkU3dRUc7FUgSnOGpOdC9L9CggOXqQaWL15WkY5AT6dObMIIRTl11uv+aQG/SySlU9BuM4
	Eqc6iho57psxrCHZjdzur3MCih2rOTg3ln0WIuGwOsjo4z1wuL6Y0jCQEPCQ+XXeAajLgi+iVy8o0
	TDcx2OnXutr+VFyaF9Dx5v+T+PNQ7q0WwLAmMkghagmdCT2kazGrakhhSHVqYf9v10ELAwVg7HsK6
	EqK4Bqt3cV7fkbakgIVK4sNAx5qATLrVLj/exwtCqfEzmnHC9ETkolvLg5zb1FvprQZhFll9awO2H
	gVcYh4lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ASv-00000008U0M-46Uz;
	Thu, 07 Nov 2024 21:54:57 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9AR9-00000008Te0-43iy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 21:53:09 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2e2a999b287so1204656a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 13:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1731016386; x=1731621186; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R/uGgDzxBTMwJeme/h8t+/Y5+MaW5JJnJNkGRbB5RAs=;
        b=F93ZarJf/BxYXYLHx4+DtCctk9gmsGAlbhfG0uxhhmhVYEm7GEzkFQlxNGGAfuc2dj
         VSyLvq2YUT8H17RfZx+eqWSHX3yOUXmjpT6tQfXHzc0taTZVtBhFxpCQ6ZdM1xullxtC
         efp2PTeCCeq7si1grSw0heyiqwOmEbdXV2BmCgbohJSYQscS9dOEd8vn/RtneVq6He3v
         bXjZ7X1vdc8wrmcBZQMCnaQQ0qbW+3ne6wv+xatHaswVO+yIC9QzPM75gUOZYKIX6G62
         m2AEUKAUeDZCtRfk1sHl8gO3omN9DXVWbeV4gQ39zQILtzLjl+6rdVJ7qfd+6MvbrAyZ
         eL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731016386; x=1731621186;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/uGgDzxBTMwJeme/h8t+/Y5+MaW5JJnJNkGRbB5RAs=;
        b=ViufeJ3iOLdFPQ/5OBHCE4DokvyS3QNg6b+NiRLbdea/RnrwCegoNu8ysBbHVmaUpp
         EciyvUE7Dya76DXS7rfpQ97spyc+Pfyl3CJcQreeutOa3dIwYbLGn9QVBv5kfIJF5YrD
         UY1Zkh/FsXjK20oRkDtMsT80/bx+ezHTRfYCI1ZHVob6qILhzmuro8jeuVeZo3yUWTE9
         /60vXsud0DM+pgPkYDh5jw3kkcpeROTn1NcEsMLh6YUOZzh420K/XX0PVD28GcOLAidO
         +12dCUMkYnuIMMUk87zDfFjyxUbLK1AD7z696ZE1yY8l4JXoJYk9I/ScVrQoViyFDUoU
         Y4Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWUUEWJNzZcZWkePh8yWf0QWWBlXS8go7d3S4YkPk6B47xRZPLd3XQ19OKhcVlupNVb9EqXOIsILBTUBdfWAjtI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9iC6v8o1vX4EFGl0R2FC6YsmI6DkLOu3Yj1UksDlII/S/4Zh7
	UnTTjDXkbh99sKRJlGps0ObgZC9SPupsB+2v7Mgd53yEAjkmjWFrlNZ5akXsLgs=
X-Google-Smtp-Source: AGHT+IFYtKHCkmnYGMgHehNW90Ih7W2EH62Ir3mEb2k8AkcggJ4PhxCcNsJAMCBgYwLn0r4VtQlZWA==
X-Received: by 2002:a17:90b:1a90:b0:2d3:c638:ec67 with SMTP id 98e67ed59e1d1-2e9b147d4fcmr1058582a91.0.1731016386547;
        Thu, 07 Nov 2024 13:53:06 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9b244d330sm114394a91.21.2024.11.07.13.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 13:53:06 -0800 (PST)
Message-ID: <672d36c2.170a0220.daee.04a2@mx.google.com>
Date: Thu, 07 Nov 2024 13:53:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.12-rc6-194-geb17c12d043da
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: arm64
Subject: arm64/for-kernelci baseline: 16 runs,
 4 regressions (v6.12-rc6-194-geb17c12d043da)
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_135308_032022_FC9CDAC2 
X-CRM114-Status: UNSURE (   3.27  )
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

arm64/for-kernelci baseline: 16 runs, 4 regressions (v6.12-rc6-194-geb17c12=
d043da)

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
v6.12-rc6-194-geb17c12d043da/plan/baseline/

  Test:     baseline
  Tree:     arm64
  Branch:   for-kernelci
  Describe: v6.12-rc6-194-geb17c12d043da
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
  SHA:      eb17c12d043dad3f1ef9376a2d80d7e0a665e887 =



Test Regressions
---------------- =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/672d2c6d0ac9aaabbbc8685e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
94-geb17c12d043da/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vi=
rt-gicv2.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
94-geb17c12d043da/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vi=
rt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672d2c6d0ac9aaabbbc86=
85f
        failing since 22 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/672d2c6b3980bd4bcbc86857

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
94-geb17c12d043da/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vi=
rt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
94-geb17c12d043da/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vi=
rt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672d2c6b3980bd4bcbc86=
858
        failing since 22 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/672d2c6d857e460b7cc8689d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
94-geb17c12d043da/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vi=
rt-gicv3.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
94-geb17c12d043da/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vi=
rt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672d2c6d857e460b7cc86=
89e
        failing since 22 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/672d2c6c7d05eecb17c868ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
94-geb17c12d043da/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vi=
rt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc6-1=
94-geb17c12d043da/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vi=
rt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672d2c6c7d05eecb17c86=
8ae
        failing since 22 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =20

