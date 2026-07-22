Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431B9C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 20:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=62mD7eBH4bySVV9OXCWZ5h4brKSHdA8TNqCtitgdSko=; b=123y2ZBhGcmhKV3XfGeUK4MWo9
	K/hXns0UfWaqg7QZMM0ib7TDPTU2DytzB1UsheD9JodDQW6AuYt4WZ/kxchusDHxc2T1JGJkODr14
	YIQMwU4rlw/cPG/pdYyY7r86ptQMgW2TGeg2l7+TUDbR2TdDZ4dyhS7AzfXFB2lHTCKUFCopUbu6f
	26hSZ5fUPqVoGexKWThcTjlwu4WnYFnDZ53CDDnpDZpam8UnBlk1X3bwHsvobJID2gf7hhbGQsyxx
	eH2aL4BJ/T+be/tfyotF2Nb8l9VgoOi8nOwYJvOtNkVeCvp/tRQSgR3g7uUx4sMH1djO7FZE0RVXh
	7kNsRKgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdNk-0000000CgvD-2RU2;
	Wed, 22 Jul 2026 20:17:32 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdNi-0000000Cgue-0Qql
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 20:17:31 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-6688a2dceb8so1335628d50.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 13:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784751448; x=1785356248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=62mD7eBH4bySVV9OXCWZ5h4brKSHdA8TNqCtitgdSko=;
        b=OKpIagoLI61UPQZMa7BqigGXC9zvfMav3zDQtRO8Wxh7aM4mL9JpgDsjLujmo/KFM0
         AbCV1hD1xpoc+pLvVK/8eI7nWLrH3VBKbMCG55lXxrUSvIISb/tb9zyi0Tn7hlc3KTTN
         wFixgeFff0z1jUvJZtLD9Pd6xHDc5SXGMVEEB3B35U+bUYM2mX+jlajTF2Jw7n8qHUut
         P7dPg4hMjhkdHnBireFPPUaMEGYF8ZeJu2w/4+r7Il2wEKdNev9jbXnAgnsYpYNCqilE
         Z0D/s0XCtlk1jzzSCwUEIKnMR907A6A9+Z2aRr6a25I7jZi6BLK9ROmjASRXgagW19sK
         ALyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751448; x=1785356248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=62mD7eBH4bySVV9OXCWZ5h4brKSHdA8TNqCtitgdSko=;
        b=VhXyM5xBaWcFT1LC6qj+6ZcdVqNKNEgwGUxAI5mO86wENX7bR3TurF47eoZmzTdrSQ
         6q5T5ysuX7RrydUPpd9v1Xe0SHsxqUN5GS84GASzEPPRRlife+YQBtgIgAmnHjgIh8gI
         ikVbExGPjlxDQjxiiAXQoUgAGJvXzt58jX2L9sSpKInfwqKV7u+I2qURfzN3bjhf677U
         7aooP1ZRLcBojRpOkceRbV6As7A/qtBgPcQp1gZX6lD218lAZt1j+2yPbVe+a/hhCwND
         q7pL8Rhs/CLZob1uuJ76FGZB7F6qN0KrI8BAdzpZr9Lfjq1cQEW1H/wnTF5kKXTJXBnf
         ft1g==
X-Forwarded-Encrypted: i=1; AHgh+RplqHicrJXgtCdaZYqHQdk9OzFS8z8UeRSDs6xTX8MYYa0wheay3Be5XUHWoZJ0LQXCvo0PAMo8vFGuLBGgYENZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1ujozhNsVoiKSCr/lCaruVvZ6l6iMcvUvrc2OqE/mA3TKez4r
	2mo8zf+yMsEy34+qHAjQ27TYrkFEj1F+qSNj20D4HuwwT2qVbfr8998H
X-Gm-Gg: AR+sD10ax4OO4DNxuq6S+wXgd781M3U4zk0e6qd7QTMVMlCEevR41cI67QqPLf3YQSU
	Ry5LMvLct3cRfvOxJmIlCFCihfznlHD/Xvc3KvjmeUOQP9stZA+4NPXBR3oB71W+GXSuTiYSi+z
	cOIRDyggS42q2KQoP0F8HqWOHoVWBJA9P9EwOrKc0EjAyT4yOiDjH3QiHE7mG8zWJts/KqMqj17
	DQ+JTFdouR8mRRAyLAcNfuXZUty3hI+iF5nqhW9bd6tfvI7GMHHBY01wCz8g9I7QFC771go2HVW
	rVs/MTFT6zWTtk5r895cb1Ow+lFmpJd+ss6aTFy50LgegAsDCZLi3LJHDRo7iGlfAO4I3KyfdH1
	fjJAH6EnR6HVPB8UpsxByAJhqSjS82viEBgUc5IWdXxfavNtfnZYMd4DZfj/PW7r/33EQ+udmc5
	6A013YVBps6jYGT/YXs6fhhF7AJTcVfbie4YCTS6OQYd/8bLI=
X-Received: by 2002:a53:b1a4:0:b0:666:515c:522d with SMTP id 956f58d0204a3-668a4c49e16mr24887d50.29.1784751448323;
        Wed, 22 Jul 2026 13:17:28 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6689056dfbasm1958866d50.9.2026.07.22.13.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:17:27 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH v2 0/3] media: rc: sunxi-cir: support the A523/H728/T527 IR receiver
Date: Wed, 22 Jul 2026 16:17:14 -0400
Message-ID: <20260722201717.2205609-1-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_131730_148913_51EB89B9 
X-CRM114-Status: GOOD (  12.57  )
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

Sorry for the delay,

This is v2 of the series that adds support for the CIR
receiver found in the Allwinner A523/T527/H728 family (sun55i).

Unlike the previous version of the series, this version has no driver changes,
and just uses a fallback compatible and enables the receiver.

Tested again on my X96Q Pro+ (H728) TV box with the Google TV remote that
came in the box (using NEC keymap). Was able to press buttons and
get readings from lirc / ir-keytable again.

The series is (re)based on tag v7.2-rc4 on mainline.

Justin Suess (3):
  media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
  arm64: dts: allwinner: a523: add IR receiver nodes
  arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+

 .../media/allwinner,sun4i-a10-ir.yaml         |  8 ++++--
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 28 +++++++++++++++++++
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    |  6 ++++
 3 files changed, 39 insertions(+), 3 deletions(-)


base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
-- 
2.54.0


