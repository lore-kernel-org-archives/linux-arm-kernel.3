Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB2BE6F062
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 21:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:From:To:Subject:
	Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Message-ID:Reply-To:
	Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tooOI/Bt/tx7D1qtKHtczsshjuHCAzc6Ov9SlYZA4O8=; b=LbiSLg6Fyli9NjBLY4vx7MSvOX
	t6OQbbbtB5WSm34HubtQfDdH46SNMQ+wFoKQO+i+MfS0IdzX3rqnWFR1W2fAKZ5KDmv9D8+ubistk
	JeLM500b38Q6GeawUqLLoihbFto148qnCc3RVmJijzs85rnhkExt7RKfl0ddkWl/5DA+gMtH7DLFU
	QlFHUXbzBWZcwj3s6uhAWS8XwuP99UhgkxbrFp3fVtNaCuSLQEgP456QvtC+eZjls6tZMg6+JSmr+
	iwncYmUVWnO9d1jfJhyC2cN/X/G+1Ih4hnhOZuybdoWe9nIXsxQ2uHAOLg8t6IsunBq6qBvBwrqpA
	QJknt6HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6yw3-00000008KPK-1zf4;
	Fri, 01 Nov 2024 21:11:59 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ysa-00000008Jvq-13en
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 21:08:25 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20c77459558so21443855ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 14:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1730495303; x=1731100103; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tooOI/Bt/tx7D1qtKHtczsshjuHCAzc6Ov9SlYZA4O8=;
        b=iLa/A3MgLJzCeFuNxOeBqRwaHuB6W6RfXXkxgBLynw1wx/GVXY+IwEeTEnIf82ORYn
         N2gLiNCXGTHw3Yl/AZPJfCNNmL1A5KjFKSRhG69H+tSwGmP48vjMKbFvm+XT28t4A4Je
         kJGO6LK2vs+Rngjv6nUCCqwuC4K6tS8F7YMh4KEQFzLfKEq/C+6Jx1r4zbtfVqQUaWOq
         uTv8jg+JCAteteidkYvF9wzrhC2hhUnfaK3f+99TXiKVWX1zoGjn84lnDWLjKTwhmwoS
         AC8e9agxLsb0/i80qdIds8yky0/CKZfL1ZJpHWp5LKtrcSXiVGDgV66XNEA2bBgPr72r
         f5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730495303; x=1731100103;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tooOI/Bt/tx7D1qtKHtczsshjuHCAzc6Ov9SlYZA4O8=;
        b=gzmwGoyAx4nz22lQuEmFGh1xQ2Sz3UtjEeSrG0q3pP7OgzeEYTOW+HGiYvphpMjxjJ
         rWg4L8b9t3PCqNtfP2XwzeKX4tiiJq9KyR5WIBYpe1S4CX3ytz+/wXHmr3r3BKLHKTJZ
         xkJcozwtfvuyuMGtn/liXN+4l7fQdEPZt/h0j+V4/GnR4B8HanWRm9NdmXrldTVE/XsE
         MNxOSMVSKLMaS+EBn6vb9i8JxhSBdB5tqe6YIk04PpT3HnCHqhdF4Bk0WwSxzJffC/tR
         2/oB1QVpOIhjCLbRYzcUstP8DWCYmb2Xzp/WEIpqZbjIp9D2z9o/YfggxkugSCpe/7l+
         Tgiw==
X-Forwarded-Encrypted: i=1; AJvYcCX72sqJYrp/8F1VidTWStpXVq2CJV+nA0mouB6lbcP9GHhIGFzeD5VL6+2tnHBxa7GlL/BGEww19mVfQphu8tNJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwrTfanV13BEimnLaOPJhpqmN6rsn+Ohze3AcZPgrVCf+Oriv8s
	hfaKVbzGDVm5MC+/AB9dtgEYIuNb/jf7bWnQp4FjVm5K+Pt3VrpYGDJp64AhUUJ/VVUfLUmqadk
	F
X-Google-Smtp-Source: AGHT+IG4Fp+nS/UxPHw2LKCnSzO8RtMLa1Eo2qBYKDA/9emNljAHPT9g3xSerwyfAFDdu6HG/XxfNw==
X-Received: by 2002:a17:903:910:b0:20c:c88b:511b with SMTP id d9443c01a7336-210f764f777mr153155465ad.33.1730495303335;
        Fri, 01 Nov 2024 14:08:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c1122sm25303375ad.214.2024.11.01.14.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 14:08:22 -0700 (PDT)
Message-ID: <67254346.170a0220.36a303.e8c0@mx.google.com>
Date: Fri, 01 Nov 2024 14:08:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.12-rc5-158-g5283dc78f4da
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: arm64
Subject: arm64/for-kernelci baseline: 14 runs,
 4 regressions (v6.12-rc5-158-g5283dc78f4da)
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_140824_315894_9CF4E723 
X-CRM114-Status: UNSURE (   4.99  )
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

arm64/for-kernelci baseline: 14 runs, 4 regressions (v6.12-rc5-158-g5283dc7=
8f4da)

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
v6.12-rc5-158-g5283dc78f4da/plan/baseline/

  Test:     baseline
  Tree:     arm64
  Branch:   for-kernelci
  Describe: v6.12-rc5-158-g5283dc78f4da
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
  SHA:      5283dc78f4da5400f2ec24794239a785b6d6241c =



Test Regressions
---------------- =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/672538d8d219d11423c86857

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc5-1=
58-g5283dc78f4da/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc5-1=
58-g5283dc78f4da/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672538d8d219d11423c86=
858
        failing since 16 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/6725390324f667ba1bc8686e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc5-1=
58-g5283dc78f4da/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc5-1=
58-g5283dc78f4da/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6725390324f667ba1bc86=
86f
        failing since 16 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/672539010a917dcf92c8685f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc5-1=
58-g5283dc78f4da/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc5-1=
58-g5283dc78f4da/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672539010a917dcf92c86=
860
        failing since 16 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =



platform                   | arch  | lab         | compiler | defconfig | r=
egressions
---------------------------+-------+-------------+----------+-----------+--=
----------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie | gcc-12   | defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/672538fe24f667ba1bc86862

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc5-1=
58-g5283dc78f4da/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//arm64/for-kernelci/v6.12-rc5-1=
58-g5283dc78f4da/arm64/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672538fe24f667ba1bc86=
863
        failing since 16 days (last pass: v6.12-rc3-58-g3d363ba041e1, first=
 fail: v6.12-rc3-67-gb9e20acb61ba) =

 =20

