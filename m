Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4CDE6B256
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 12:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tQf8a9cyuQhF9yrIlb01NAr4V5CwM2Bx+c7NhZntXuo=; b=REGt+l1Iwmk81aJB2+rWOjB5Xj
	ZL9EwZFu1VFq+p5FnTCeDT9qv5NwSg40Dv3+CBedBqljaH+lTCbBi6DrxSLC9HPBGbHd2mAS1tMHq
	mbUgLCvYJbaoGqzB97aW2iIjmshlujoQ2QdhWI9S3E/otSgfem4x4WMUa3aq5hxSWoWUAr7AeQbpM
	9mcu5pkxS4xyRckRz7N9T16Ue40utosyNkilZk9z1B+ftLSmy/m3oIXTujcDRrHACTMiL5oQ//oFK
	WiY0Wxmpr4RQ0Q1HgdECjq0wRf4KNFQxjSHl0zgRzQ/BJkwreK7Ubp5VGmIqXErUJfhabdXFzpvah
	qTbkfbvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rBC-000000076H7-2na6;
	Fri, 01 Nov 2024 12:55:06 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6r9W-000000075xr-0dM7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 12:53:24 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e29267b4dc4so1771650276.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 05:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1730465600; x=1731070400; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tQf8a9cyuQhF9yrIlb01NAr4V5CwM2Bx+c7NhZntXuo=;
        b=w0o7DW2OewNI9+KbN0+gCHEm2N3uhXoMJ+CLk5vqPizkLR8w/ajHuwZVKpnUj0Gj6O
         KTcDKgfQQZH5kd3AyAeSKv5aXLQy0gHMuThtsV5Icq7rcGgZiHJKJ7ay0AZ1sq/16+aQ
         5zyQayDWPozhIn1QYQoO2+A2cWG/4WVP+tIYoQy6ULpA/a1Lsh2Rg9mKj4AHmgiHjSoJ
         jy7s/HeKd7ktojRYVMmoRXnKqUsJRk0WN9xgBq8kHUeJATGO12jevL8YMFmwV1IODWlz
         m7Supd9NFT+YQdQzxh6C8y/UOut6rM7BaggtfXMtRP35/RmujvsnEkNsSiWgGEVTjH65
         +LGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730465600; x=1731070400;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tQf8a9cyuQhF9yrIlb01NAr4V5CwM2Bx+c7NhZntXuo=;
        b=S7gOiZhxAvIq5ZcMmd8k6bb0XY/I5TlquuVkXeL3QKA12pM0s0TRqMh3ewsAsq+Zxq
         OfJRV+tV7VBudWvaJc1IJ4Hku5uyRrL5+0gFooTu/aJzIDbc3ADuxndtz3+yBId2AMnI
         niWmd3hug+FJJN94/CYNba9HlBESHzdO9/Y7JsgEVK+KxmxuSG8/xPgvGrT692IHATje
         yAQMuNWj4ZYO4Nuoki7GmWI6lAlxZiaHl8qPsjhZahvcuwdQPUeg+fxARIjQuNNEpWGv
         eu5ufJJsKcp5s80sQeVkvME9Ajd5Flt6EpFbCjj/+1Y1pMymdTLcCEjWldm+kPcVvUPe
         rfPw==
X-Gm-Message-State: AOJu0YyxTZBoiZuElIof9Fdk9ZRw112/hAEa+WiL2QyIL/VyFVuM/5gV
	LEayyG0dh6PPLoODlXLrRujxe18ph4a/P4/F32u96L05Lf8r3lZanOBKO5sk9UIeX0cPlu98AMF
	g7ZkXPPvBAZdbRZUF0WAx+DkL5fD+xCgSjPar
X-Google-Smtp-Source: AGHT+IG1ahQw3qC+9Y4Iy2xBQRRLYy86ES6yLyrdUIrfkc3nZ5jEjEIXHn7dXrv3mSphF0f70JvgyciAVVSAKFz+H7k=
X-Received: by 2002:a05:6902:b0e:b0:e30:cbde:1252 with SMTP id
 3f1490d57ef6-e330266ec61mr2258969276.36.1730465599885; Fri, 01 Nov 2024
 05:53:19 -0700 (PDT)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Fri, 1 Nov 2024 13:53:08 +0100
Message-ID: <CAHTX3dKLb4nOVpVvnwyxE6zJZNXpiB4hh=WzpKWwhqP7aLobjw@mail.gmail.com>
Subject: [GIT PULL] ARM: Zynq SoC changes for 6.13
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_055322_211334_E7138DCF 
X-CRM114-Status: UNSURE (   8.57  )
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

please pull this cleanup patch to your tree.

Thanks,
Michal

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynq-soc-for-6.13

for you to fetch changes up to 4972111505158555b9b256f17b032463381bb38e:

  ARM: zynq: Remove unused zynq_slcr_init() declaration (2024-10-02
09:13:08 +0200)

----------------------------------------------------------------
ARM: Zynq SoC changes for 6.13

- cleanup zynq_slcr_init()

----------------------------------------------------------------
Gaosheng Cui (1):
      ARM: zynq: Remove unused zynq_slcr_init() declaration

 arch/arm/mach-zynq/common.h | 1 -
 1 file changed, 1 deletion(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

