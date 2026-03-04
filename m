Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C06FEDEC02
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 03:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+UX3cCFsEn7IKh2oIgy8th+LH6QgE2NnzyAhbtsRwgI=; b=I+Uhg2+mcPg/W9
	7X2PMuMNXQ3hS0B78dK42zX1uefpLFWYZfEZfM0SLKUzYYpWgrpqG3HR1lVK7Ct+u77Oia9Ymdv1B
	PubtKp5zULGLP4ZHWLsIifN/lOTtlGt87A8piv1nvSE2pfhQbrG77sQfOUZ2V4JO+0tcRXpbdCKr3
	C9DZIVx97jgWfEKkaPRJ2CWc6zYvEyPXgQz4XLv78zE5Mcjl1uu1mo8uZBSHEdIfbXwUoN0gtj9aP
	6rdNXj7bnNLyBhnWi6BnTW3CZbvTNribKO4aq+yMMG409rGdREkISkDPIpFAlBjuxOWJtdEnpNiZ2
	VppTPTQ2ykzeH28y7xyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxd9h-0000000GOIH-31zL;
	Wed, 04 Mar 2026 03:44:13 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxd9e-0000000GOHP-3KGL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 03:44:12 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-899fc9853b7so36551836d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 19:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772595849; x=1773200649; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+UX3cCFsEn7IKh2oIgy8th+LH6QgE2NnzyAhbtsRwgI=;
        b=F+wBT51V1eKd1p4e2DYSLDF3nQFoThm8slefo/9Qj0h4ywNict5qsAYggQPc8RQg0m
         Jc1F/DLGDoDoHRZj1R72sHfoX5rvL4PkJ9r4klugDZo8ri0rtL9GQsYdEp6EBBs+waa0
         yyy76FQ2jNBrCrO6sBzhGUKINrSclFi8f5A/oTiajW3stUm4vvlJPwg+k8Che8b7P04Q
         X7Opz6j9cge+hHBLY8komUhftg8f4ANA5RNNfK261uVZ13YQGTeMxlmiCOLGyCP/jUd0
         Zogko74zh7JOhfJ7y2xY/CKhd0aWLOXCtguav1Q2IVZcgeRxGMgZb3sBvtQUSwGNdPnE
         7AzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772595849; x=1773200649;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UX3cCFsEn7IKh2oIgy8th+LH6QgE2NnzyAhbtsRwgI=;
        b=WJV84yDtIafiUrrZhkfEHeQgn42MVUcMfI8cu/cLSD5yS7g86fzkDaq2dKeigGSQLg
         i3dnT9aCG/PuhL8LGAUEk0wq63urC2ZMm42yQBL8AEVKOZFLTKGseWVqTs1lRXEakx2j
         h+lSLBMZYRzrcVgTmYGzTLygb5NuPYPUkAwjyfOGnHxj1q4V2CWR/VewXO0wpIjJ0S3P
         94HaGIGhcOI0pevRzSe4oB4JTMMXEDxqv1pAFO89xOEX3/7IhmBXl1o8WDgTlA8eDk28
         jQBvtWGJ2nDyJMiZW3aCfz/3l8KnKJUfRR4nNWpLiMitCDAc9nqQiZJVpiHA3c483LuU
         IYhA==
X-Forwarded-Encrypted: i=1; AJvYcCWrbGMXQH3d8mnroRShvudBCH3ClffthqSUq120gDoLXqR0es1m/u1hew2c8ltrWsBRoW8eVZ2Va3iV8NJ98wy+@lists.infradead.org
X-Gm-Message-State: AOJu0YyJl2CT/DIcjFDMuoOp7DlBB52mMv0rJWUD/LCzevy0efn6fkY1
	QiXZ+N66Hb6/3bKa31MxmfDAFAa0oY041szs83eR8x6TizowtxUMVS4x
X-Gm-Gg: ATEYQzz5sqpex7QOaJOqH5MPrQN5Rs6GJGX5VOECmOOKbB3kA0JIWsOyThMsCmsAf0r
	K1MAcJ9etBj8UdaZ9MTtlO58QtJD+zinrpuKL3bGo2GJ9a+CKztccEhrlOG59GJma5nRT8dm8e2
	5ia2jsmUKEtlhV7hnbLE4edOlj1S3Lp+Lhh7YtE8t6aWlf3dhylMOmjP9hS7JimxDhawDhzxBB0
	9GVolgU0YQ3XM9wg7/FRwvuA+XZeFKn6QwtlWjQs/X4xiYyn0jcPqyQhIn9lpep1iXfPNtreRqG
	GU4RMxuwdGLh4wSov0BPQ9qAu+XclX9BOrbyYNv2+14K10tzigJDas+JQ0efpHUm6NTjuaRJU1x
	fLSRL53koxR9jrQWuv5E+v0/1zZi1t5Bd0/diRrtDlq9+oXcGkK1sKyJWCKdiLPFM1gVD+fMURI
	EEhV5Mwa3SeF4nLpqZFPjyqty3fu/miqTwD2UA6Q==
X-Received: by 2002:a05:6214:1d06:b0:89a:ec6:101f with SMTP id 6a1803df08f44-89a1998c1e7mr7800326d6.1.1772595848813;
        Tue, 03 Mar 2026 19:44:08 -0800 (PST)
Received: from [172.17.0.2] ([134.128.219.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899e608cfc6sm88603286d6.14.2026.03.03.19.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 19:44:08 -0800 (PST)
From: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH 0/2] allwinner: a733: Add A733 PCK600 Power Domain
 Controller Support
Date: Wed, 04 Mar 2026 03:43:43 +0000
Message-Id: <20260304-b4-pck600-a733-v1-0-2f54efdb8cc2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG+qp2kC/x3MQQqAIBBA0avIrBuYUrS6SrSonGoIShQikO6et
 HyL/zMkjsIJepUh8i1JrrOgrhQs+3RujOKLoaHGkiaDs8GwHJYIJ6c11q4jJjatNx2UKERe5fm
 Hw/i+Hwha8cxgAAAA
X-Change-ID: 20260304-b4-pck600-a733-1790e0e48d49
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_194410_867746_C1AFFEFF 
X-CRM114-Status: UNSURE (   9.55  )
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

Hi everyone,

This series is to introduce Allwinner A733 PCK600 Power Domain
Controller.

Allwinner A733 has this one power domain controller, PCK600, which
shares the same BSP drivers according to the package provided by 
Radxa[1]. Unlike A523, A733 does not require the resets. Apart 
from that, driver wise, everything else is the same. 

Add support for A733 power domain controller by making resets optional
on sun55i-pck600 driver, adding A733 sunxi_pck600_desc and dt-bindings 
definitions.
Tested on Radxa Cubie A7Z.

[1] https://github.com/radxa/allwinner-bsp

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
Yuanshen Cao (2):
      dt-bindings: power: Add Support for Allwinner A733 PCK600 Power Domain Controller
      pmdomain: sunxi: Add support for A733 to Allwinner PCK600 driver

 .../bindings/power/allwinner,sun20i-d1-ppu.yaml    | 17 ++++++-
 drivers/pmdomain/sunxi/sun55i-pck600.c             | 53 ++++++++++++++++++++--
 .../power/allwinner,sun60i-a733-pck-600.h          | 18 ++++++++
 3 files changed, 82 insertions(+), 6 deletions(-)
---
base-commit: 0031c06807cfa8aa51a759ff8aa09e1aa48149af
change-id: 20260304-b4-pck600-a733-1790e0e48d49

Best regards,
-- 
Yuanshen Cao <alex.caoys@gmail.com>


