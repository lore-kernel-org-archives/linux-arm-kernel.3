Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B49CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q6nxMY8baHQ9SXUgo7tcneXPgF65eVlp4HOdZrI3XL8=; b=rfollrr02xfElfwInlwdq8tTO1
	mg7YhR8EluVBypQh375xEdBqfGP6Pc9gqghCtUKwjkU3W3L8/OdC/mBgMSrsmiy3awd8Bw9vdXZEx
	iRQAbASUmICh2AnFIbQwEwUVG5/e+LiH9eq/Zf/fEvYBtBazA9RerqtbJsQfHRT5CKDABrnJZpmaL
	bAL3jL0zN+o/Xasl6zco8/MUa41HqtVLpkhgDYSKTrFKQNfY13Xam1955C5b7Kc8qx6dNCX2MKEjg
	xmYm1kzkNL57se5Xa1C2LGSyU34k0w5O0lvhzo2OmxsccuEEespoVJDlF90MfYJum7CQmvelQTWqZ
	jx4u9SDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuFS-000000079cl-3K26;
	Fri, 29 May 2026 10:15:26 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuFP-000000079cJ-48o8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 10:15:26 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-7ddd3d67084so7585587b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 03:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780049722; cv=none;
        d=google.com; s=arc-20240605;
        b=iDprFLWbvX61zjPSULSXU6vK6i55Q50WkcA1M6MRJTSnYoYvn56G9nvdklWXPdVcd9
         ByGevxDh+GbwqfEWGeGOGISzTLEvntzS9/jHk7dIQrnIS0xanwbClQbcyIFfYzVLwHYS
         z+cNYNeZePH0nxHljnvDVwluPBhGCakLmMm3j8j57adBU0pPq86NebBBH7mGAergjJjx
         NaJLrXgAplQJxuqH3DGG2PxEeXWZs48xID8ixVEntbQTS9WlBZ/XK42n2jnEfohdLWy1
         lwxQHveyX6yKG0KIteV0e32etKhSbI1+/QytXNWxypdAkshsIR2lGitprQ5NfXE7kp6g
         agYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Q6nxMY8baHQ9SXUgo7tcneXPgF65eVlp4HOdZrI3XL8=;
        fh=ngnzniW9/251Blo+3H7OvJM/allDljIxuXeYmmxYfks=;
        b=G5CEsD/zenDsjDPgrmTZ3KqwLHZpDgfPM0Mq2JOITd4t8IzglA8PRTzAygb6G1tqgh
         OB2zYT2mPx3z3cZde2MdB4HMDGx+DMaPqY8kk73KMYZ+uOcjtYc+Ad+YWIN0gpCE0UkE
         OzqwsopHxUMLrRZbEyJL/lj3uPCNxwENmjjP3jA/S6dbPwIwdYE0yvvLnc17fR2oE7tO
         wirjDApwjYvQqVS8kokbnpty5K7Vng9VaF0yGcoq3DqlMOQnz3lAy1A89gu7Mayezr/5
         7PMU3iujnAaqph4NU+Sgb8zNTvse4N452zNC1rsycMhCh/oL1+Fali/63KmkA3X6Tg1Z
         Badg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1780049722; x=1780654522; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q6nxMY8baHQ9SXUgo7tcneXPgF65eVlp4HOdZrI3XL8=;
        b=miJP9lRzsRJblsY5knuGuMtz0wcUkhi37SwMQmTwUDeZRRysZJyJC2DPkq2cHFBgZI
         nNUbsN+0dQ3pNnejM5T26+phLFLsLlzPkSiLYALHrwjWRtIVdSTkaZsH10yeN2okkdhD
         w278FfY+kTabh+IojtUavB0WIdeM4ve8zNOyDAVlRbmSsztPoVpx/tO00kJduHVKKMRs
         PNZnQlz6o4HfYV1+UsgxD0dri7OhwS7vXnOOmIFiZ2Lo9c4HWhBAb+QOjgrXQrruTbjn
         fJymIaEtUeqN2iLFO0DRFRYebOq/RGEdwoGsbo0FFg8w4wIFhB/eJzi958xnPf3VOQHa
         z2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049722; x=1780654522;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6nxMY8baHQ9SXUgo7tcneXPgF65eVlp4HOdZrI3XL8=;
        b=a4YJBqg3DnxA4L4EWq81NfhNrkZjx3w4NAkaVdzZumQGqbSWgLcxK2X78FP9LcisBJ
         Fm+e4CG3HNBkQ8KAqq1l3yMRjN+bbcfsHRkQJ6DKCa+SjErbyjyT51Ouss51Xn/sg32p
         T+2AsVNkOhLCUkxv887ZwKOEC+LrbPv8eUwxdqQuZwo0FKL/Z2kTeP03kW2XtVOZVB8E
         rMyk7kSQC4sUfSIWhvktDrUakaiYHDSYBeZwV2obdp/BKRYtXSeJ5W10XvvDIAk4IVBa
         yE2kSrYeeat16xtRtRTcYdz7rmRHq1O64CHSq0Ci9qKRluTvFdaUeZ0Qmb7eieyLYfEA
         NIMg==
X-Gm-Message-State: AOJu0YyZjGIglqlnP4oEgABmlv6RCTu4uq9ZH96UiV3Qmk13CxWI38s2
	7VvHWrQQi/+B+E6sDz0xVxLK/diMu8DB/G7Jyt/faVyFS04fW3jGTGSahoLTPyzdowER7jZ6w3l
	aTeGR+RUMQViBp0SbhkGdjOI1ohNKQt3Ud556kohdbX8k0u1PbI3kZQ==
X-Gm-Gg: Acq92OG/ze87Exc85VVJ7VtNCl7lwh/ztnUVdorvGoFiUQPs5e6V9s4buMMaNCZue12
	JzonGFcFqUzv10dTl7PCTvarEEeonYycN7VQfevC7OJvfEcqNsIQDzBRuZ+OUXmnC7V1TCvHYU2
	3T+OXxBghZUtZMonPCLL70kAmAE9jhkx9D2Q91klcbvyilj3AHn3+vThIoiD6kiB7TZr16gDRTP
	zo1yTta01ZNs03OJF3NjQH1l/Iy4dcUMWFgFzVrnvd6AftIfpFmhV9AuhVJRaOCFgRTGKUd1b7F
	LpC+M9T/4OT5DN6nqELwK24ez9HrrZGi09Nq6XDcW4ecgoqYo2A=
X-Received: by 2002:a05:690e:1514:b0:660:32d9:22c1 with SMTP id
 956f58d0204a3-66052ea82ecmr1238384d50.33.1780049721964; Fri, 29 May 2026
 03:15:21 -0700 (PDT)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Fri, 29 May 2026 12:15:11 +0200
X-Gm-Features: AVHnY4Lal-FfaM_K5u9m3mttSbGCNbBaXcJ-9B1nzkzSgz-ek7xSeV5hmB4qamg
Message-ID: <CAHTX3dKWE6DOPLXPq31wRiXfjac0TVqSOAOLP8itHoGYpF9eBA@mail.gmail.com>
Subject: [GIT PULL] arm64: AMD/Xilinx SOC changes for v7.2
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_031524_189680_95396DA9 
X-CRM114-Status: GOOD (  12.28  )
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

Hi,

please pull these 4 patches to your tree.

Thanks,
Michal

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-7.2

for you to fetch changes up to 47d7bca76dd4f36ba0525d761f247c76ec9e4b17:

  firmware: zynqmp: Add dynamic CSU register discovery and sysfs
interface (2026-05-25 16:09:15 +0200)

----------------------------------------------------------------
arm64: Xilinx SOC changes for 7.2

firmware:
- Add CSU register discovery with sysfs interface

zynqmp_power:
- Fix race condition in event registration
- Fix shutdown and free rx mailbox channel

----------------------------------------------------------------
Prasanna Kumar T S M (2):
      soc: xilinx: Fix race condition in event registration
      soc: xilinx: Shutdown and free rx mailbox channel

Ronak Jain (2):
      Documentation: ABI: add sysfs interface for ZynqMP CSU registers
      firmware: zynqmp: Add dynamic CSU register discovery and sysfs interface

 Documentation/ABI/stable/sysfs-driver-firmware-zynqmp |  33 +++
 MAINTAINERS                                           |  10 +
 drivers/firmware/xilinx/Makefile                      |   2 +-
 drivers/firmware/xilinx/zynqmp-csu-reg.c              | 258
++++++++++++++++++++
 drivers/firmware/xilinx/zynqmp-csu-reg.h              |  18 ++
 drivers/firmware/xilinx/zynqmp.c                      |   6 +
 drivers/soc/xilinx/zynqmp_power.c                     |  47 ++--
 include/linux/firmware/xlnx-zynqmp.h                  |   4 +-
 8 files changed, 349 insertions(+), 29 deletions(-)
 create mode 100644 drivers/firmware/xilinx/zynqmp-csu-reg.c
 create mode 100644 drivers/firmware/xilinx/zynqmp-csu-reg.h


--
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

