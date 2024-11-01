Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748AEE6B254
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 12:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nDPdY+/4invWPUONVGXUjS95GHw2AfhJ6NmBgm0MP/c=; b=d6opTyoINpFtyJAbT7+epLDXFq
	cwSSnP1erh2/jPRBiPtL6hf1uTPZ2tX8Pai9W0hRL0jnxEW/qztONSK5apKo/qKt4jlo/TkolLCKi
	CcyWVFxpHp9I8CxI5G3SLkviElo3OwNnp/FMFj2xqdSUf9tgFMsB/ELPvBUrXdRUjArPdFLPffZCd
	oda3NMDi1a7A6WzJddUm7WKOMtTP8lk5QMpcxXYp2V07eI6vnwmsTPHWG408bZFzGwD5Q/isFif66
	a3xkCTTv/cC4Cj73uNvceTiQuAT52lWUGBOT7+oif25Wv19Ab0p6sv+9NzDF68e0r97su/aVgYI3a
	7/MpT+bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6r19-000000075I3-00SY;
	Fri, 01 Nov 2024 12:44:43 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qzF-000000074y4-2q0r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 12:42:47 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e290d5f83bcso1914163276.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 05:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1730464964; x=1731069764; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nDPdY+/4invWPUONVGXUjS95GHw2AfhJ6NmBgm0MP/c=;
        b=CC8BTm+s+2AeZT98eLZp7s+vva3jLwa68BFhV6aJxKk+70moDgdukADeqHbPLwB2J/
         coFQ6OsDDHq0R1zIpbY6OY4rmOB5HsiIkGFRx4fU2u6NdQnDWvygT4M+X1isDEjn4Kkf
         bSz2t2/vPJazJNtSti7Eo+zIopzfLgsjB2vArHLrBpHEDsCHdESLmKl3ELde3RdMFjll
         rU84i/f8j14yY21vvIXVqDgfeSmUcFdgv2w1x5QWt2gY4DMiDSJtWcFXDNsIRPHnhAMM
         ddqEUMvjkE+GeID9lmGL2nnKf5Cd4PpC0D5ul7Qtp9sekzso/EwXuIhkA8LuwtNejz1K
         iZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730464964; x=1731069764;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nDPdY+/4invWPUONVGXUjS95GHw2AfhJ6NmBgm0MP/c=;
        b=IY4AyLXTtLLOvxF06w9wRFr6glCGHd3Jm7oLY5OyI6UJMbKleNApKTlW85SPt5Rx4I
         xuaI1e8CH+xVFBddXKv8hcB0vK8j8HDjEV9tv2Eo9oa98MvVCOXc0l5StKl/IL94VE7A
         l5vtbmNBrHqF1UsV6HKCYV6ykF6gBiozF6c9rmtvNJog2BEIL6dSeZ4kWxksjGkDyIKn
         OUwfL/5meHRr4XrznwzFCYUjRsGX+ca8ps89lpPGt8USMFeyaC3x9ZhFFp+KvBJSfwfR
         Z2ryecMsQqMjrZVd/EjWUYwdp2qDKWfWlFYfi1xT8UxW9sWf0Pwd19l5VFBurhVfG40X
         pDCw==
X-Gm-Message-State: AOJu0Yzxb5deqsO2dR6GCv+abHMgNApC00BMJokJ+PqV+ncQxhgMqJlc
	rrBx5dDldEjQwuE+QUKSUtHvIWV6fyAgx75FC8Jh37HWn+iwbzFn0484B/416KS1R0AKPH0Yqdr
	JnT/Z4KVX8puZ24J09NuW6upTuUc9fHTbdvC1oEV9PKNPexpPYdxj
X-Google-Smtp-Source: AGHT+IGmpmK40uDFDGtbHZhk+AvfupqtNOoAgSUIlP0YIN83OzjCHSLPIM772jSFQMYyHAoAA3dt882tFrIsPSQsGrQ=
X-Received: by 2002:a05:6902:4ac:b0:e2b:dbf6:34ca with SMTP id
 3f1490d57ef6-e3302660c43mr2471614276.36.1730464964320; Fri, 01 Nov 2024
 05:42:44 -0700 (PDT)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Fri, 1 Nov 2024 13:42:32 +0100
Message-ID: <CAHTX3d+x1WrXhsp6+PQbo-B3T9q21tqE1RkhVsh0r7my3vH37g@mail.gmail.com>
Subject: [GIT PULL] arm64: dts: ZynqMP DT changes for 6.13
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_054245_741721_A0D5CC52 
X-CRM114-Status: UNSURE (   9.14  )
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

please pull these 3 patches to your tree.

Thanks,
Michal

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-6.13

for you to fetch changes up to d57df7a7b78eecfe65cb358faf27ad5872bd297f:

  arm64: zynqmp: Add thermal zones (2024-10-02 09:21:26 +0200)

----------------------------------------------------------------
arm64: ZynqMP DT changes for 6.13

- Enable AMS for all boards including HWMON
- Add thermal zones

----------------------------------------------------------------
Sean Anderson (3):
      arm64: zynqmp: Enable AMS for all boards
      arm64: zynqmp: Expose AMS to userspace as HWMON
      arm64: zynqmp: Add thermal zones

 arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts |  18 ----
 arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts |   4 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts |   4 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts |   4 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts |   4 -
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi            | 101 +++++++++++++++++++-
 6 files changed, 100 insertions(+), 35 deletions(-)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

