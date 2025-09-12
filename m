Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B0ECAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eBXExVx/skyVuxBkLgYtW7V7lv+BvFxXp4wcixH7FuU=; b=HLxb+ujZ5/aINP6mF16JpV4b/Z
	ZjYWSKEgs/RsK72mq5Uvh0csK0aQ6D15NgE3VcIRi43vADQBHIqes2UkhLVXW/03WzD6LMM09/Yzl
	NZVBrssoBcSuMptDJOidKTqXRw0sf1tOOw8z3Cbd/EIycbPZYXKSZAmPB+xR3uEpv9a6K+rpI8gkW
	qcuMf9wORh4OzDHjhB3tpNa+WxCLedvfPlLodEOyoylQmj+8TOlQo9JdbrbdxxyiO9zc1blnuuubl
	4UXJpNBgWQ1Ap6LiaUWbZW4D8bVwyQqZPiM82dU5Z2yQ5T8wWjethU0E8uG+FLjIdN/qonN5uxezi
	iRHLbQiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux20l-00000008to5-1reV;
	Fri, 12 Sep 2025 11:32:15 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux20i-00000008tnA-13DA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:32:14 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-723ad237d1eso16206777b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 04:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1757676730; x=1758281530; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eBXExVx/skyVuxBkLgYtW7V7lv+BvFxXp4wcixH7FuU=;
        b=Y7z6LCkcfwiBCKaJBaCWHFgYqmGo1CfHaRGEyTlU2AYGYNPTxWkTkTp7Pg67SOSVpm
         VYlSB5awJzim0P1rx0zlglRLae6S812usRC8aFOBxNq9x4JjKp06Hfllf3sgOxR5ciR8
         LY2V5sdVyBNKu2o9T89dIUvAk+WcJ9IFeTKndND7iwZmpquNudlX7v2UwHnsS3k5/mbQ
         aRf+nqQvPM4ZMs9ZhreSlWfy/k1EkmZxBdkit9OpkHexiihTqLctEKMqI78l3OUgZXC7
         INtSSILjzsFXPKmFaMELFlk2csRHs7Rd50JfTbnrcoMIAnbZh5584/xa9RjvkN1zqcv4
         /Bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757676730; x=1758281530;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eBXExVx/skyVuxBkLgYtW7V7lv+BvFxXp4wcixH7FuU=;
        b=sG5gYJnqT2jOkM/qPFiPyU+5jim7SieEhDtlF+zabEDaoIm+YHqQeGvUl2lAND5gqj
         Br0of6+c4qgT3BvWexvslvljRaY9/DqZDz/gAeQLnyY383nTX4QTYqTYkkrCmO4JlhsY
         M0NcQwkuPZ14OPk6odsrL/FOLYrvT3tV+ugHuYa6+miEFdCwzih3HjVKKWm+g8nCxV4v
         gKyEG20q1gyn46WilP489eweibduD8WVgX9PwrNe0M5bvguEuxqecCGId+DrwAG4ud5E
         7ehgoG7aM0XZIjWl0EmrPqVmwH52GnaAFmUj1FvdpcJyrhqx5tBv0a0vddNfJnSg+e7L
         HZVQ==
X-Gm-Message-State: AOJu0Yz0GlO6aKOMnwazCtKwX64q7rQIA+19hoGfh0/D5RMMk3yZpudO
	U8dqXW1j8UqkMcJRXzkicEZnjJRVJfLo9BM73vf5VE+6xo8MMGicgMnRknrf4jOvvbc3ibfgP/j
	cZpTgvnsFjKf/z0dQrcXdxpCQnCkB3gZXduXGco43sMhO5Y7Pdvtm5z+43JI=
X-Gm-Gg: ASbGncuy+PEV2sc2x0z9TqBrRKeOAHwR/w5ZcLXd4F7bNTkdUcotk4i1Rbbw1EX9exe
	tNjBGYXRr5HZxfAQNGqvASRVZuIzKQho2xK6+FN1PX/RK3KyrEtCu+VJH42okw2kmgZ3sYQu/5e
	bz9G6skz+3XFbhSQZIcR+tlx83gff70Iv+Ze2XB2XPzqGZutaW7E49v6OVVah6ZIT1Zw0K8XDxc
	cGRiJxYdTX+5DU7Hrs=
X-Google-Smtp-Source: AGHT+IGkV4eMTlmi1qIVJNb1Wgo9JEzjXKTSYr0Yjf3dFzylAi43wPNWTdbdjzP9g3W9gpHIH8R5jXRIDhjMa4QGIv8=
X-Received: by 2002:a05:690c:4484:b0:72a:530:e40f with SMTP id
 00721157ae682-73062ab836cmr20845047b3.3.1757676730353; Fri, 12 Sep 2025
 04:32:10 -0700 (PDT)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Fri, 12 Sep 2025 13:31:59 +0200
X-Gm-Features: Ac12FXzAww08Io2NnWWmI3cEKTVoSzefAeq4FZmqje9fk_DJ_BH9j-DAAlYvzR0
Message-ID: <CAHTX3d+aQHxzkGSseB5e7m8fr5YTKQL4CMoFZF_yXgR_CdATLQ@mail.gmail.com>
Subject: [GIT PULL] arm64: ZynqMP SOC changes for v6.18
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_043212_293862_307F84A7 
X-CRM114-Status: UNSURE (   9.91  )
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

please pull these 4 firmware patches.

Thanks,
Michal

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-6.18

for you to fetch changes up to 25e3ae0ce364fa725a6eea68d63d6a2ee09e019f:

  drivers: firmware: xilinx: Switch to new family code in
zynqmp_pm_get_family_info() (2025-08-29 09:58:45 +0200)

----------------------------------------------------------------
arm64: Xilinx SOC changes for 6.18

firmware:
- Add debugfs interface
- Wire versal-net compatible string
- Change SOC family detection

----------------------------------------------------------------
Jay Buddhabhatti (3):
      firmware: xilinx: Add Versal NET platform compatible string
      drivers: firmware: xilinx: Add unique family code for all platforms
      drivers: firmware: xilinx: Switch to new family code in
zynqmp_pm_get_family_info()

Madhav Bhatt (1):
      firmware: xilinx: Add debugfs support for PM_GET_NODE_STATUS

 drivers/firmware/xilinx/zynqmp-debug.c  |  13 +++
 drivers/firmware/xilinx/zynqmp.c        | 114 +++++++++++++++-----
 drivers/pinctrl/pinctrl-zynqmp.c        |   7 +-
 drivers/soc/xilinx/xlnx_event_manager.c |   8 +-
 drivers/soc/xilinx/zynqmp_power.c       |  10 +-
 include/linux/firmware/xlnx-zynqmp.h    |  30 +++---
 6 files changed, 128 insertions(+), 54 deletions(-)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

