Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516BECCF2C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 08:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sgtC2P0mVvpRBC7CXn0tmQZFh0DfwTg0wP6M7ECQQ44=; b=zUKc6Qfz1W9B7KRpIxrSo5l/iX
	EXEaEAyK2ZXl5ehOlC/2Qhr0tRyvYuSDdNCQS1EGcN7AIADjRthWS5S3b3Ed3JKgD6aDOAkDD/fpV
	pbbTZAQvCtyGHwwBkv5PeI00OPTiNG9SVAGgAcopde1rIUkyFzLltFCsmSUWjwfvTZ9eDB0nNY4QY
	YOgg2SFy66FHpd9n9cK3lP321ynjLSH6HVovuou0NPmeIZbggAC1ClAUDr/63HPUbV4bq6g/gaerW
	Uf3CdU0XuoPFacrqrJMDQS/PuTLOtHonduUv4yUYwqb9PNH1lAc//TcWL2dv0nk9TJJwzBUaiUas4
	GxXCLrow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkqg-00000001ZZm-18Ma;
	Mon, 19 Jan 2026 08:42:59 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkqc-00000001ZZ6-0Tor
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 08:42:56 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-6446c2bbfe3so3173553d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 00:42:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768812172; cv=none;
        d=google.com; s=arc-20240605;
        b=aaifZpWLdmPUibFRtARSfNqPboARxfhd1uuKYv0/jaNbnlrxsJNyXwdy9CgQRDJiUo
         jOU8EK+XFwQ8dvEeqhHBFNdM0zqyuVxhknEqa0q2hme4F8gNjzubuVHde6ITOZwJxodu
         D6FSfjJhAxhRGyNNrrXR9HIbthibaK3Ccx0MKa8ro/LgP/e1IPfRj59bqb2B2cYTtzS4
         Aoc+k5qQtUqx6TrkTQYPnEb4RaELTpXdYY2qnUfO8JnDdL8LMdh7Hor9DRJ81WJgdvLc
         yKgVltkr+SBbQ4eGbDeTPuhZKNy/1qJJwXnFhkJ6zn0SuEXkyAe+3jJUtB5baumKIdMH
         r7wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=sgtC2P0mVvpRBC7CXn0tmQZFh0DfwTg0wP6M7ECQQ44=;
        fh=ngnzniW9/251Blo+3H7OvJM/allDljIxuXeYmmxYfks=;
        b=ggTbN9onQdgqOm2ufPoBNV6ELgP3fP8rV3GN0d1ZVpRhRnpGE6FVY+iWk4vJ16e9G6
         cP38R0h2myU2IIw7jksoSmzdGSloFw0VdduyiwjffZjmXHrRDJjLDKfF+cwJ5g0s/zFg
         b4ZeDV1FhJew3VboZDu8kHzeCWVxQYhbIVpsMR8l64sdGFIz664XFvRwwLoMdMOahu0T
         qzN16gMx4A7sTDGNrAjLdOPKxSuPjKyD3PYa6haADVYtC6x7gz2rcQPqz/rvW5iu2y6y
         UIwQ5u3oJzckzyYc1DER4OIn/+9pd/zoJJI86/4AGp0bmEfDnm7+EUgS5YE6VPGuAHn7
         Z/Zw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1768812172; x=1769416972; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sgtC2P0mVvpRBC7CXn0tmQZFh0DfwTg0wP6M7ECQQ44=;
        b=U4NWhn8TUpmIA2wIAu8YNxA6WSmir5A/8WNu6NkwKhBbeJ0aD9DhPFgxdmNtOOOKtX
         KwsD4QEVUIM8+FcP1xqIUjyHmgUT9J6PKLFSCq/ECt59Ef69oQN3OLL28c4vZzo9kXXp
         XHlWxExdOMkXiGuoWgpOmJ7En/hWt/bd5fQFQPf8AnEUYjxS966IIJ5t5CG7jwPSR4KQ
         1i88M0xwtadr6R5KbZXqbbj+Ht6TLIdwHhS7GxYK2Hl1eZTF3YanxG8aAE2rBsDpWodB
         IyVm2pKtZlRxz9XJ7I3AQnEaQ7EBgfDHE3R/dgKiVotI97JqquMpE+I6kttLkEiTr1TL
         rL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768812172; x=1769416972;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sgtC2P0mVvpRBC7CXn0tmQZFh0DfwTg0wP6M7ECQQ44=;
        b=R9xdFNhCrL5oQ+coEXpKceu1d2wFGKw9jd2LM1SUd2HDZjc3XCiD/qhQdACQhKaN9a
         O2XelgYgXohnYFKyZGLCnc831zlMBknIwp5gm4uqBfynRFExlTzugZtaVAhNxJHJs2yx
         IJ3X5wUA+3jNh2mQTBvj5uHlik25RUQfVOVFViPtRbGzKBEACNNZs4PiQpFInqWWaWc8
         KBYVTWoEAIRVWbw5t79sB7/gcP8dpleMXtTQSsiiT/7/xke4RwEka4rSsMl90mgTnHfw
         gpc9yF7o5WWhqJ1kCrc4sI4kaZSWDzfkzaF5r4TPF3GNv1obpQfQwe3TbbvSgOOdb2rJ
         r3CA==
X-Gm-Message-State: AOJu0Yyn5AcQwCUreIJTIFsGx3pZPKzHlfXxunYmHdVtrv3Tj18ld6/I
	q9CQaj4Kl2Ad9jtnFgMXzlbxUcoL6TmBqR6Sra4jpmbiC13l/gmhKSJblNmK/FcWi9M9C8tqm3/
	dHIjfQ6cM3TIbPI4U59ZpkS4CXWxNMCdQ0ViiilVJ
X-Gm-Gg: AZuq6aJov/SZoq2qVYkcHZIc8JK4B2FMWNTG354RxgzU+tcYkxWU0+F44Y+u3Apx1Ir
	U5MVsGoqEXRZbKY/7ETLow95f7GzVsMC/i72fw3dcRbK6OH/IiZ8qVeyG3C4urRq0Cf/sbh2Oy/
	325/y+igmfpB1ubUD3Xy5/RbIEdzcpMiHmSGJUlTJHI1SX5kT0Ol4po3pq+tl93zsUMgDqPxOVe
	T9z9pak/cXqndgVq9ya7OBvz8ndrtWQA8i/diKGboJy/Ytm18mAmTmrzdEks4GaoXlHlzMd
X-Received: by 2002:a05:690e:1c1c:b0:646:e354:731e with SMTP id
 956f58d0204a3-649165108f2mr7930276d50.83.1768812172124; Mon, 19 Jan 2026
 00:42:52 -0800 (PST)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Mon, 19 Jan 2026 09:42:41 +0100
X-Gm-Features: AZwV_QgIJrAfcDgAR-LtLEPylnr7b45tioQdIgSQNdPcHEEapR48pT8n2By-VS0
Message-ID: <CAHTX3dJOkqMPogu=HeBtQuVCK3_-73QPVNPco4dxh3AaOOXUhg@mail.gmail.com>
Subject: [GIT PULL] arm64: AMD/Xilinx SOC changes for v6.20
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_004254_407587_A358E493 
X-CRM114-Status: UNSURE (   9.82  )
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

Hi,

please pull these 2 patches to your tree.

Thanks,
Michal


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-6.20

for you to fetch changes up to 1f58ad77a8b49638ad2b95b364cddc12f20cd011:

  cpuidle: zynq: Switch Michal Simek's email to new one (2026-01-12
10:21:30 +0100)

----------------------------------------------------------------
arm64: Xilinx SOC changes for 6.20

- Fix Michal's email in cpuidle driver
- s/system_unbound_wq/system_dfl_wq/g in zynqmp_power

----------------------------------------------------------------
Marco Crivellari (1):
      soc/xilinx: replace use of system_unbound_wq with system_dfl_wq

Michal Simek (1):
      cpuidle: zynq: Switch Michal Simek's email to new one

 drivers/cpuidle/cpuidle-zynq.c    | 2 +-
 drivers/soc/xilinx/zynqmp_power.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

