Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A66C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 15:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tSXxaoqaOmMa3Slznv8S2xnGouiZjQdl/76oRMg/G00=; b=3+8YL1M1BPqcpFd2NRGyB0x1X1
	Co26G6/n4V2uNq3N+GEFgyKMFHygfFgQ8lscLm8nUvk8x1Ojum0S4VY0QiD807l/z7nfIR9K2zoDq
	3jirhicqQpcZBi92YBjRUD97ZGjDiYXQP6hzFt7fIazHcztcD/SCVAGVcK/CggclxFiKn8r6V3A/5
	gmT/7OXwtFQcIYE2/ZChO7MJNJXNafaKJpNF1+BTZCM1ukn/2ThrPGACNOWLn3QSiaEDvRg9FP+aZ
	fDFa130+DUhrBAkj2cdkJOYWxxDU4nI3NNF4Wx/KCGGyhDv/FEzx83+AI6kc1jDfP/vAZ5MnO5DYf
	HkSPrNYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6hQ-0000000EVqk-2LmF;
	Fri, 14 Mar 2025 15:11:48 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6bY-0000000EV5d-0kTX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 15:05:45 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e455bf1f4d3so1732916276.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 08:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1741964742; x=1742569542; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tSXxaoqaOmMa3Slznv8S2xnGouiZjQdl/76oRMg/G00=;
        b=Vvwf066UoaqbwuLTmLGGKLZ/1YaJObnhVqeRbvFsXr/FqywC4UzZHHNto3+7YUuwjv
         4pBe7+ZfpYCitcqRTiRoH+jhh1hh/WT/853I9VGwZPHC+foGDjoKUCDADH8aoSfqxbWk
         dBDAKbVvggiRaSjtQScuNZTQ8eysyNFvQUR1f2kSZBfVzhiJEUey8IkB8VqgTspbb1M1
         YQQGfbAMHnNzwqi939TH3uTJysS/TNywc/dcZIs3jnu2e0AysA0OGUsse3aigTX1h8Wl
         GmNmh93n5Ei57vAi6j6y57+FGYA+4gAXBoP05v2YQfRtHlrWxun+oD5tvZrbsc9Yzriu
         DTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741964742; x=1742569542;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tSXxaoqaOmMa3Slznv8S2xnGouiZjQdl/76oRMg/G00=;
        b=leizucU0J8Ay5uy5AqnAx/Eht5B8ta8n+VnfZa1l6tR/lbeV1fLY2PvTJGHxkwvph3
         xTyZ0urO39sJzKWQfzFwmxwfcMVaj6Ua5+NBGS4dgV6LOKPH/HXG05d6rBYsKYf87293
         Hh8GVngtWbqQ+SbYtyL7itdJUdLjYSh5vjQ/yoiybXAEiYk6dcoHPD5VwoYTNbj8mWHh
         GKSDHJl0R7SpylVCqHsAUL0VVxDPtwwLsyyig4B3kcqrjIlh3w0a6FifGMsxpBA2yujx
         riFDINbm1wBw406F5fJ+M+S3EVr2VqyelsIdY1OKbQaKiWDbs5FI9Mgtw0kPTs2Mxh2O
         nGCw==
X-Gm-Message-State: AOJu0YyAzQ/EjpLoaoXYGV3Oy6+TYqyL3aB+FyCVBlWQm4GHyLcRVKl1
	o9pYehlrBtEkGU+gX+qrKHReWn7QC/BQjlxzCXC/oHrjFYnjJT6pfUtTG0IekhE79lC6Z8zK+Dc
	N+w0a6o2amQwCLNrRHKEvXtLtkqoplUYBOz4TSXAgRbrdFZehpz/u
X-Gm-Gg: ASbGncuE8YYmAdfpaSl/4ulIgVme9pYTcS3xWInETjaNmnoplJfuMDWjSgbmbzYzI24
	yKq9+uEQBxzX23PvK3JdD7dEbH0FVXeKnyEoe8gM3lqsNw3FP4D/KFfqDqkSsdUe8RiJ9vS2w8p
	9v72bnfQ+LxZEFy4Z0djeOGf8g8w0=
X-Google-Smtp-Source: AGHT+IErmmVkyNQov5Nd1+Xs71JZWSwc57b2CHBJnpd+Wy8GkZC/5L2QJoES2aegCf8CKQTf+m44eDFuMReFg2cWef4=
X-Received: by 2002:a05:690c:6404:b0:6f9:447d:d1a2 with SMTP id
 00721157ae682-6ff45ff5cc7mr31632587b3.29.1741964742689; Fri, 14 Mar 2025
 08:05:42 -0700 (PDT)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Fri, 14 Mar 2025 16:05:32 +0100
X-Gm-Features: AQ5f1JpYX8ZmFDvOocARvlWoAwlfJN6MLmhqbrBxLvebmV4tl_7rNn7qQnD9bs0
Message-ID: <CAHTX3d+T+_zvwAVqGO+J_+Yia+wXAGsaEbPi1ye1AUYXoq6dmw@mail.gmail.com>
Subject: [GIT PULL] arm64: ZynqMP SoC changes for v6.15
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_080544_222875_9ABC534A 
X-CRM114-Status: GOOD (  10.43  )
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

please pull this patch to your tree. Tree is based on v6.13-rc1 but
that shouldn't be a problem.
There is no conflict with the latest Linus tree and also don't see any
issue with Linux next.
The patch is pretty much cleanup because firmware is not using that
parameters anyway.

Thanks,
Michal


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-6.15

for you to fetch changes up to 5abc174016052caff1bcf4cedb159bd388411e98:

  firmware: xilinx: Dont send linux address to get fpga config get
status (2025-02-17 15:40:01 +0100)

----------------------------------------------------------------
arm64: ZynqMP SoC changes for 6.15

- Align fpga config status with firmware

----------------------------------------------------------------
Siva Durga Prasad Paladugu (1):
      firmware: xilinx: Dont send linux address to get fpga config get status

 drivers/firmware/xilinx/zynqmp.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

