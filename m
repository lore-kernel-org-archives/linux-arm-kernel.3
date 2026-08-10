Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05553C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 07:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x0hr8unAYinQKuZq1YaxgLfSO4H3IM1KbKSRWUiG5Qs=; b=O7Vy8YBZzxOEdrFBjcEUxMLQT7
	lLcRR2nKYMVgMIVWqekOWsYe+I+ZSNsxtYlj41gLMegRm5WKdi8rwMopfkZ9/fat9JZfPimoW4L7d
	3X5Tc0/HTbkbj3Gpgc7xe9y+zdK4Ltb8e6MzfWtgHKavNzbalK0h+HeqpxercVcwAdznNP0SBpXwK
	ikmx10JNEdzi63cdzWaqHW1125d55kGpBF81hnQf4t10kKbWVSl+zX14lzblmupU66UUy+vvAexSA
	NQO6Qh0aWHASL7vkMRuDVHyVCsdlMBg5QfwVsT5O3mgDDGl6oWO2XjkHEvV7TN/cssHAvYPuanMcj
	vlGHDOuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKbO-0000000BDDN-0TxF;
	Mon, 10 Aug 2026 07:39:18 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKbK-0000000BDCz-04PG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 07:39:16 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-6685483aad2so2293223d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 00:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786347552; cv=none;
        d=google.com; s=arc-20260327;
        b=IsRKiwTTYPTN5EIhJNHOmpFJgt2NPVWFjQ+pIhklIcLP4aSW9yG0pD2iAZej8ccUuu
         enekwNCcIxNoj5dT5/MbD8ymY9fQol6g3k5f4RpgEstoXjLmGx1VpJc7Ls5tHBo0e2/D
         F+StfoXFD/vNm9kmKMwnKRe4CQ0X3pNd0mbp4WlGrl1+P/AdtWJic71J0kLZp58ftBdC
         h+vZxtQ0GeltSbrEcd2hFYOCTo+F5bQrvyatnaZkXxwm0WDEuNR5YfSPaB3MTzkwjnU9
         3weXaIRfg2seFnArKn7vHg1wG/WYo90kZdZneP1Zlehk3Kn4XT9zBn2MjgBhv3bCH4VY
         qQ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=x0hr8unAYinQKuZq1YaxgLfSO4H3IM1KbKSRWUiG5Qs=;
        fh=2dTHC6FSDCGA831XNOk87vVt1u2pzUVZeCGGFJ4poDg=;
        b=Q5NwhfCAHF/KnZanMrJdwOOPlsdQ8pQq3Ee4xcy0LuO8MbE/SgTSYv4xRrZ20nhW2u
         0AEJ7u8MRzARBKthASweiTPJY4G1yBZnfkm4+lvINmy8oXz3c29PrLD+Ilt5YmFj4qJA
         +fBP8pB8DC8SPfSevyLb59N6vDWux2fc71z6/ISRdm+oPJDMGebUsWRPeGMk1wj8lf4B
         J1iPuS6glkzbFUSDtoKwl2mCU4zFZpKbNA1MYo/gNsHv0ZDXBRgw5WYBEOSSpANrhipI
         GEkNWhKWnPUrYDEEepicFaKV5apkPdIgtLBiX2Q0sLGxPrH4tqAqZXwV4WymRX6z9ml7
         m4Wg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1786347552; x=1786952352; darn=lists.infradead.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x0hr8unAYinQKuZq1YaxgLfSO4H3IM1KbKSRWUiG5Qs=;
        b=fopbqiw2/8fykcHA6f5pFQefD9qoBFXl2XqHDcLVECrUSydbpP2uHzhmLeWBGj0nOK
         z6x5v3fCYVwGjL2ErJX/v3skn3lNKHjbvyns8CkAcx+nm89x3eU6VXLq4F0gO5hKrEZi
         LfFCkve8KRJFUUAIonZblqD4vveYBzgXfSf+MhE7oC/ODZqNZIE1BFiAOT/hT/TxfSPb
         2sgGQA/E6GXfbeD9JkXh2X+MOb3dlEWicGPKdYnr94FKx5g0obcQ6SY1LAnMxI4Y3p11
         l4SZAKENwrj6rZsWBoxf9iPHSIb5tjUOEaPOuoEjhPCS2KiznvLfmbkd2eAz8g6A/PdX
         tjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786347552; x=1786952352;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0hr8unAYinQKuZq1YaxgLfSO4H3IM1KbKSRWUiG5Qs=;
        b=DbNuRqby7/4mWGiaLl4flhfjphDMp3xvTGSIA0gP6Bj+mtMyUS7S7wfKxqiwT9cp5m
         coCG/ywG8bx5ZHdjJ9F3RDwSbi48Qem/nLLMebPbsfDxwDe0D6MRL188Y0FIqNdr1h96
         b80wy/n3axP3EcbrRDSmJxfls4h/1+Zvgpb44oUN8AvR6l+XQ75KAA+sIheeNkIwt424
         gZ+hePZXOOiKa6eRq1ItwA2HopJpBfSPAIPnmgoS6P3a8ro4jOAnIcS5FUhwoUPvsJWM
         U03qLj6m668LS57926uugAArgOdE/qcMYHxkrw0/4Zxx4OHLtKSyakUtp5XTAB3UrL63
         jakQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+V1Xwk2UVpuJK/pvrmpEYhdFnQHJFyYRCVkalZxRRDV3pbCpKWdM7+J/WiaD/9PsrB7+3BcSGMShttXR/5tmw@lists.infradead.org
X-Gm-Message-State: AOJu0YzCuoAwIhuJk9DboXkMpTvgkleHK2wGonoe81DbJ6or0znm3hte
	mZ6wEj1QoWebZC37c/UW6wed7pNtr1xpbdjMIWgc+JcXmlc22t172D+Dbm3zDUdui02LZI8G+Ur
	5RwRno7Qhg8opLjejL4lmlPyVNrbhEZlHc9i5yGcHoOWT7xwu5Vb8lgryods=
X-Gm-Gg: AR+sD11Zc7FIkdKYnYX6JmaGMoh8YL1621NaZzEsePz/wLd+m5Oi7r9c/Fy0XoMAZw4
	51RADl7rskw+UTBLbzDwYOpjFobyHB49zuBylpjCXGM7jaLAksrBezjCSPIJ6LBXry+L9SVTsv7
	WJ4VTQPLm3CAE/O3iTlxZXeo9pZRDYKFs9Bp/g+6rDgEJRHlwaq7RG6paN/72HaEaF+7gVODbmT
	R8RAJAtrpdQGqztPXRG//pdF/NDI2GPaK6ekNpWQxLX7Cq1WX+KiV5tg8u0qqx7MW5TsOodH5ph
	Mvg1et7/n3vsXB49wb99ixDaNmCHLYm22qoOrGID3qrTASkGMvftJPzUC1mUq3o8fQ62rn5M/wk
	PeBsCRHZ+i24f
X-Received: by 2002:a05:690e:484f:b0:667:f400:e822 with SMTP id
 956f58d0204a3-66ad70d7b43mr8102878d50.3.1786347551846; Mon, 10 Aug 2026
 00:39:11 -0700 (PDT)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Mon, 10 Aug 2026 09:39:00 +0200
X-Gm-Features: AUfX_mwm-VSARJdjmBVxW3y3JAraNv39DE_9u5wiI1HnW3prEfrLSXtM1nRalxA
Message-ID: <CAHTX3dKTNZJjcCVeAKA4KX-JcoJct72S1t2XuycDhcuSvOMhgA@mail.gmail.com>
Subject: [GIT PULL] arm64: AMD/Xilinx SOC changes for v7.3
To: SoC Team <soc@kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_003914_315839_0A9C30EA 
X-CRM114-Status: GOOD (  10.42  )
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

please pull these SOC changes to your tree. I have applied Jay's
patches last week to
see conflicts via Linux next but before creating tag I found that
there are missing links
that's why I have updated the top 5 patches today.

Thanks,
Michal



The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-7.3

for you to fetch changes up to 0e8860367da261116cd290bcd6a54d2e597a0c5c:

  firmware: xilinx: Clear firmware notifiers across kexec transitions
(2026-08-10 09:30:44 +0200)

----------------------------------------------------------------
arm64: Xilinx SOC changes for 7.3

firmware:
- Feature check improvements
- Clean up firmware and EL3 state on kexec

soc:
- Remove redundant dev_err()

----------------------------------------------------------------
Jay Buddhabhatti (5):
      firmware: xilinx: Use TF-A feature check for TF-A-specific APIs
      firmware: xilinx: Propagate actual error from feature check
      firmware: xilinx: Add support to clear EL3 PM state
      firmware: xilinx: Release all peripheral devices from firmware
      firmware: xilinx: Clear firmware notifiers across kexec transitions

Pan Chuang (1):
      soc: xilinx: Remove redundant dev_err()

 drivers/firmware/xilinx/zynqmp.c     | 108 +++++++++++++++++---
 drivers/soc/xilinx/zynqmp_power.c    |   5 +-
 include/linux/firmware/xlnx-zynqmp.h |  10 +-
 3 files changed, 103 insertions(+), 20 deletions(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

