Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E057CE6B253
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 12:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BiN29CI2quVy9Vm2GzAx3LhypcTi59G2l37bGW9+GCk=; b=w37ZJven1Lo2N+DJlSHedwyW3t
	rHQpKZ1ZDD4aAN3ezzoo3UniBkGAYS92U95DzUkbY6+Y08yaDiDb/awzHqMdQgJiRG2Z532LFiu2H
	wOeqElk55UpuNuJ4xvtjGyq/JPhwN0y6WT/969vWIxcMzBU/EKX5v5/xSPzsOel+L4dyv3ryXFe8T
	mqz8rzsU0FmhwShvWBytd5GzaY6ioZpJwhl9Pu/M8RE3o8hOvpAL1Kr+0qCDbY8Wnfvqbk9FsmFcy
	B6M2C+U7De4WwSvmGdPnJd++o95jhQUezQc2KeH/mH1td3e3sgLMw2tVxZjY08pMOXJxj5Ozip5T6
	vqBfUduw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qsx-00000007401-18x4;
	Fri, 01 Nov 2024 12:36:23 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qds-00000006xqq-0rC3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 12:20:42 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-6e3a97a6010so21181907b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 05:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1730463638; x=1731068438; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BiN29CI2quVy9Vm2GzAx3LhypcTi59G2l37bGW9+GCk=;
        b=Gjs+LodhFRvp/L2qG6uL9+PMhfF4S2IbqZeNtGZfucCmGJJ/+K+wyIo2e2+Ex2BDPu
         Dq9K0u1osfugSPxXYf87LwQEjUSWC7xGONzojLbiNCUm83rFNeFDaBY8+yEBE8CICZgz
         md+KBhp2VSMeLHcZD5+OeCRn1nPWkp01zqrrav9F2fBe6NH1/MbFFkq3C7r9okuoezYx
         ZVicd1/EOYUroUDLVdf9Nt/WWrdWZxXmIXRmIWtfaYQ0Ge4PZqfPDIoFwQEgmNSK53F2
         ylmxBoH65Qo1GznhxXkRaGKKqIE8WfzBlhib7QFMjOG1VjJq6zBDuX8CoI6E3+zFDmev
         T//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730463638; x=1731068438;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BiN29CI2quVy9Vm2GzAx3LhypcTi59G2l37bGW9+GCk=;
        b=Ujh4Kx0byot8IGDf+2bXsXQ5XFeJBP1PQyTrVVLfSdhB/0O1y5kIMzjnz1+v+gZMyV
         BtfJX4opjzPYwpnfvuVfR8oiV4z/a5tXj6pWzjtVAATl6gOuXGrIaFBHwrdk3FTBmXXE
         WEEYcxXK3exu0/SMGA24/yNQ2Doh3T3nYP1+6GTkJhLCPXtwewCfZFTDdKybl7iRvqoh
         vZKYV5TH00LgCmz/O+Ls95P5epIKyQMwYIR87cZT8fJaoHwSiwOL6XjdjzdZL0n0+2Tf
         Toptm6t4p5AqJFa2CXaYoBROwHnviyw1tblAI3UizTubD1ZsicmTUJQSuC9gm+AFpuZP
         /vaw==
X-Gm-Message-State: AOJu0Yy0zVI1YcNUNKjFij5FGyKkkZWEz30SOfy6AkOiYiJfkZUTvXoN
	+UeLZmH9hZOH0+OQ+HirtXJvYUnINIBVEByhacKgCDgI5z8t3O+ZAHgGNtjFlefi+CH0hltvxkb
	/DErAaCplmhmankd5lyIHlT+Loec6qzS374tILA5Am0x9pA+o4RHr
X-Google-Smtp-Source: AGHT+IGiatrvMrvxZscERsQ21uX2HkHIP+GuHqrpYy8p/qFDcGOHRnNAk7qOgs/wRZs4lFQ8e52gaucLrpreO4x2Dhc=
X-Received: by 2002:a05:690c:2d08:b0:6e3:10e7:b418 with SMTP id
 00721157ae682-6e9d8b554acmr161862977b3.46.1730463638444; Fri, 01 Nov 2024
 05:20:38 -0700 (PDT)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Fri, 1 Nov 2024 13:20:27 +0100
Message-ID: <CAHTX3dK9PKmG_UG4MW=x5KmZCrd5PkcAZiNVgPFQ_zsPRgu+dg@mail.gmail.com>
Subject: [GIT PULL] arm64: dts: ZynqMP SOC changes for 6.13
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_052040_712184_70BF5F11 
X-CRM114-Status: GOOD (  10.40  )
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

please pull the following changes to your tree. All of them are
related to the firmware interface.

Thanks,
Michal

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-6.13

for you to fetch changes up to 55ed774d0130adaa4ef12aefeb8e0638011cbe43:

  firmware: xilinx: fix feature check logic for TF-A specific APIs
(2024-10-02 12:55:51 +0200)

----------------------------------------------------------------
arm64: ZynqMP SoC changes for 6.13

event_manager:
- cleanup error path

firmware:
- add support for new SMC layout
- fix feature check logic
- extend debug interface
- update reset ID format
- report about unsupported feature in pinctrl

----------------------------------------------------------------
Gaosheng Cui (1):
      drivers: soc: xilinx: add the missing kfree in xlnx_add_cb_for_suspend()

Ronak Jain (5):
      firmware: xilinx: Add missing debug firmware interfaces
      firmware: xilinx: use u32 for reset ID in reset APIs
      firmware: xilinx: add a warning print for unsupported feature
      firmware: xilinx: add support for new SMC call format
      firmware: xilinx: fix feature check logic for TF-A specific APIs

 drivers/firmware/xilinx/zynqmp-debug.c  | 162 +++++++++++++++++++-
 drivers/firmware/xilinx/zynqmp.c        | 153 ++++++++++++++++--
 drivers/soc/xilinx/xlnx_event_manager.c |   4 +-
 include/linux/firmware/xlnx-zynqmp.h    |  39 ++++-
 4 files changed, 340 insertions(+), 18 deletions(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

