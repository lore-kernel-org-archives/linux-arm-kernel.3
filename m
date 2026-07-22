Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7A1C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 23:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qgIx2gbKb5iWCG1ogTe9qMQNQTnak53463bbnfl8YvU=; b=xIpxWflrRMY26hbfBKjPkTvc8E
	Gkd45PIBfj6w0gXEXYmEQ5CSEe3ADR/frhpBF8j3uoGiMDPLZiOE6wAJBd7t/wdAz/gZk1aTAVYoS
	FMsYlF+NzzqNaMoreThopJmVLvlZMsmuY+fBmh3yKTD2UmBjd3VjoocQYplek0S0ADija0W2DxmqI
	08bgkiWy9bnmhH4/O/dZ3k7QHGDQ1toIlOE8uVSMVB95RppI9lvwhHddm7Ybcr4rdgDCT3REUj9uJ
	K4CGZ31z+BAY/sL+bbUHRxOY+PtDTBbOk5fsJhvJPPjZ4WOIRUX91mozuZmQU/dxvYbcdG7Hh6qqj
	Mpfdc3sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmgU6-0000000CxSA-413v;
	Wed, 22 Jul 2026 23:36:18 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmgU3-0000000CxQw-34FP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 23:36:17 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-80dc4a68e4aso642197b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 16:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784763374; x=1785368174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qgIx2gbKb5iWCG1ogTe9qMQNQTnak53463bbnfl8YvU=;
        b=n7pnRLrThxiERsDwWOqxGlKKptaZwBO65XGh5khwsLqJ5WxR1rwrdF69ju1nWXfdC+
         9Og4Q4ID7/96bOFWkxP7JeuGZ6QW0372oFs+cC6nzDnKZGWpZhLK0qnHn5hiw8qeM5ua
         sgTLcXqKethwyiVZi3gIuOdG2VTQ1Pu1rEKMI0bCgWdrYIibLvGPmIdHkV2FH8jgpix2
         mkk/ka9Xhb6+yBCcoKgJGbzN05xH/4bO9UmXUxdwjDQJay1R1KmAGYfO/MnFxhThdPUT
         ooLKnRqxNR2xNt1yrNWhrmg+sHJrBuMw5u6eZOP6GMaa7Us/EetY8wlx+KIxdXldLAbJ
         z/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763374; x=1785368174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgIx2gbKb5iWCG1ogTe9qMQNQTnak53463bbnfl8YvU=;
        b=YsNVbdfNdHUwAzbX47oamXEILll3VFKWlM5VHAEibWCOIJ6kmeikVEnlMrMr445Oen
         fP74uJck89gmBg/VyqTkyoiI/Z7c4pSzWLdWOnJ5ITmxqVRRw9grGQrcpjMhaJ9AsaS8
         007BwFP75de/C1rQZlHfA71xcs2c8tJQ4gZO/1uz8ICKMaJM1lQiREQNuulZokMm8R8W
         RljS76jxVrahUVflH31FnO1LVzNxElIxQjQ4fmjlq/j1SIsnu1CJdUskh0XTmromZ9Go
         hnLhVxzAont9IhdNHHD/vYlZHKSN+O/ThbQDsKK8FxD6xXN/Yc3JGM0p9G7HDQIqCzMF
         5tXw==
X-Forwarded-Encrypted: i=1; AHgh+RrR1wF80dS0Fw2wKe7AGPPWz1fzFp52BxZ4P9jKqVOAX4d6/P6U2Lokw5IUdlU4yNm7rnIhuMe5MV9ob/C1DCq/@lists.infradead.org
X-Gm-Message-State: AOJu0YzoJlA8yzf3lDnCy89i3qBVWAEMHm7x5lTHISsUl2b8WFrGYziH
	hyKgxTvCRltJy+2hlv5ZaPTEFN4FBSiR9o1AX80FBkTf7bGZ83f4hIGf
X-Gm-Gg: AR+sD12/33J6VntPDqGVd85dZT4lK1BqGSOcYh1qcZZUSnpSX7mScYmk4eaoakIdkEX
	2fYQK4hXOioRhSJoMKeMmoI4Oa42DTsCuBFyBvXpVpnFCqMReHQeCB+qn971UcBrfGrinREqPEy
	jaZFYxWcH9ZNnwxnnG445WRuXJOZF6L6LqSyCx6FI2eApolEBrAmyQ8nsSHgiHDL7J2CGniBWsA
	neK1tCrs4F1WoIhiOjX8AVCUyQ51FI/ePlELxvFrMXQJDdZCiHZn3SRcgHtcJGBTCrePK2HnyHw
	f+Ul2mcZGf7vpTMm43vmuinIyyIBUa3HxmtpsqsoMiYbNU69P0C7uNB5f1GpJeBe+tPwo9DpIN3
	BvUc3RLdyaaCfpCQAh8GvQmbdqSO26OkX9uWitZuXQBbI840siJcO/Jfb7eTLPcbCO4KgVq1+0I
	98vkw6vUp/Cv8quAnKsjRDnBrYJz8b7QWVaG49
X-Received: by 2002:a05:690c:6c12:b0:81f:4247:de29 with SMTP id 00721157ae682-81f4c3bf31amr2438677b3.68.1784763374425;
        Wed, 22 Jul 2026 16:36:14 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c627c9sm20937027b3.19.2026.07.22.16.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:36:13 -0700 (PDT)
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
Subject: [PATCH v3 0/4] media: rc: sunxi-cir: support the A523/H728/T527 IR receiver
Date: Wed, 22 Jul 2026 19:36:00 -0400
Message-ID: <20260722233604.3001063-1-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_163615_780429_7BD943E8 
X-CRM114-Status: GOOD (  10.01  )
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

Quick series respin for easier application.

This series adds support for the CIR receiver on the
Allwinner A523/T527/H728 family (sun55i).

One-line function name change s_cir -> s_cir_rx at Andre's
suggestion, with his patch for the Avaota A1 applied on top
for convenience.

v2: https://lore.kernel.org/linux-sunxi/20260722201717.2205609-1-utilityemal77@gmail.com/
v1: https://lore.kernel.org/linux-sunxi/20260702214750.3428694-1-utilityemal77@gmail.com/

Andre Przywara (1):
  arm64: dts: allwinner: a523: enable IR on the Avaota A1

Justin Suess (3):
  media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
  arm64: dts: allwinner: a523: add IR receiver nodes
  arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+

 .../media/allwinner,sun4i-a10-ir.yaml         |  8 +++--
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 35 +++++++++++++++++++
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    |  6 ++++
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   |  6 ++++
 4 files changed, 52 insertions(+), 3 deletions(-)


base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
-- 
2.54.0


