Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36769C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 00:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CtYv2rniHzU2vFxcS+ho+Kqs7Bqn1dNRU/Z0HDfV2JA=; b=rhGmIby760bo8ZMYAbBYH+l07D
	1FT39Ii83Nfv69fy0T0NKt2BVIYrXkNBa1HWQRFZp/WvSt2m4WoD4zGqDndAPVmkz4Qrz0BQUPmpZ
	+iGr1RW4zTKzz0P6fwj8NfOVQ/RsbkXhon4DdCIIsfgl3hLXvsTgGTtJZ8KhKyTSx2gc+I9j8f6mY
	3Zc9NnmOnP+EDPchCS6ig58+//TaQ4XyVCuO5DRgGVfh5q7Xs6JFGvXM88t38M/oe0upctmakuSL1
	rxUmDgt+MXiDSLwJ/GKJNZ4w45YHZ51phfInm3/lbRsR841h6KNABK8TacXXlHkMnY55Wrykdds0x
	PV5H3vNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiMow-00000009Fdk-0dIh;
	Thu, 13 Feb 2025 00:11:10 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLlS-000000097dE-1FFk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 23:03:31 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-54504bf07cdso178439e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 15:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739401408; x=1740006208; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CtYv2rniHzU2vFxcS+ho+Kqs7Bqn1dNRU/Z0HDfV2JA=;
        b=jEdxkvz4rnQiyjHQnKJ/GTpeWnRQTWzZ0KNe5dvtG9kpuBpeCmVgnyRCuoSJNWp/sH
         nIyyk8IL6xNNytXSL3srCW9Jl931TaFgxdDxdEv/4XCwB2WUkoO59mPMnb936nHbQO2F
         fnO3EqAJ3OYdTv31kjtuNA4pEvXhfrJIwO3uV8KAGUlgr2WjM0Kd77gU+4ScqXcRZv6Z
         lzOI2wxcJgWDTl/jrjRJnyLUD/OQBb9ZSSNR3sg3tncFTrcqwtVPnPU91g80Uv8fYzSj
         2EX9izas1rA6+HOCaPAt88jQ2Up4YeLGMngRmIqCBQgD8GNE8Cl2+j1Dq1s2az1VD3R9
         Zmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739401408; x=1740006208;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CtYv2rniHzU2vFxcS+ho+Kqs7Bqn1dNRU/Z0HDfV2JA=;
        b=GqBh8cS/DeX6+qgtRBLSwcEhuLCCb40mywZSIEXwby+TtZYimfDHByfDS3gksGUX78
         PvdEmCl55MKXwDZOxDODVMKn7xGSc5iLkZUhp49kbNc1XOD9XPghIMIeKvo5ecJi2W96
         RsYRYbJAKGB2rdfxyYMW7JXknKN/PsOcsMbHucDCCTQJoIJ97R+pzFj0l22RhGW/i1Tz
         xrlT/VlkCGviYeXowUdYTa/cDfBelRcWpDzb2bWn2r3zDmObBdviMzc5kqpRK4kiyJRr
         uLRvbZ695h97lNdVh0XWWsg7/mnvC6eBGMKhjuvlYLzXPk1CEj4yUWScVsiLbtiDm5/H
         RTNQ==
X-Gm-Message-State: AOJu0YxEFFwchMZvKf44c2B4LREQyMgpc7DBPHRwSKuq/9dFCCxoYCoA
	eC/USZBpZz1i724nSRDK1VEPmaYh10VVtVww3Sum97WMamNXKjNyfNBuKy4HhtVev2aiPqQClk1
	z9cQQt9knp2fbDPq10DbHUgBlk5RXBdHhAynpa5pLVTr78hkTA8E=
X-Gm-Gg: ASbGnctv4o8HxESFRofubOJH3cXBkBl8vQHRD5t9e2XL+tkbHZcZge6ahReAoruLn9D
	bcpLQsVNgwhAkJ8HxauvZ8XLK30nfrJmcsEhIrssiSLFrJzc71Z3lqUMURgIX+CarL0YxXeNa
X-Google-Smtp-Source: AGHT+IGU0fNR7NGIV+pbYdtHPL9rPB+ylJt6zDhg8rnyzbzqbNCMjZDubeVHgGqXHbtCDIdN6Kp3dOr2G2KQTqiizIo=
X-Received: by 2002:a05:6512:2215:b0:540:2da2:f282 with SMTP id
 2adb3069b0e04-5451818959bmr1293353e87.42.1739401408383; Wed, 12 Feb 2025
 15:03:28 -0800 (PST)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Feb 2025 00:03:17 +0100
X-Gm-Features: AWEUYZltIBKIZ_wEzfLw9-I-1IuesZzqcfiOlS0C4ntJaByiJ_E_JlkAr-QVxBY
Message-ID: <CACRpkdbi_A_RCufEZSk0cEoQ_H-s0VLGUzJ9zPQECSvsUP7-dQ@mail.gmail.com>
Subject: [GIT PULL] IXP4xx DTS updates for v6.15
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_150330_352617_E5950C6A 
X-CRM114-Status: UNSURE (   9.31  )
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

Hi SoC maintainers,

here are some minor IXP4xx DTS updates that need to land upstream.

Please pull them in, details in the signed tag!

Yours,
Linus Walleij

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/ixp4xx-dts-soc-for-v6.15

for you to fetch changes up to 3dceb794c09d5f2c474628de45f146b59a8d985d:

  ARM: dts: ixp4xx: Add Netgear WG302 v1 GPIOs (2025-02-12 23:56:31 +0100)

----------------------------------------------------------------
Some minor IXP4xx updates for v6.15:
- Assing the right NPE for EthA
- Fix up erroneous PCI mappings on WG302
- Add LEDs and keys on GPIO to WG302

----------------------------------------------------------------
Linus Walleij (3):
      ARM: dts: Properly assign NPE to ethA
      ARM: dts: ixp4xx: Fix up PCI on WG302
      ARM: dts: ixp4xx: Add Netgear WG302 v1 GPIOs

 .../dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts | 40 +++++++++++++++++++---
 arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi      |  2 +-
 2 files changed, 36 insertions(+), 6 deletions(-)

