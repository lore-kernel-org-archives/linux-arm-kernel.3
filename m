Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529C7C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 03:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nnisdB6KB45Bg6Nb3/4+Xt2dI22OpNwKJQSmbNlQCBI=; b=ROWpCk9qnQkNBhFgmVkhTqLs2c
	v0F+qvPykb11vEhDc9MxnQKksqXqSuwod6CRm4gn+YXRmTVJ2zgJtkA+rj49/y2u6K9fg1DuqkMI8
	PA8PpsAKqpKrKvOKUTas+zSWuR3SLUS04IQpVFGrfy9QDvWBIyreZK5QPh8pu3dRmz2o7UD63O8/c
	dzbxZFj4i63uu9tYsSN4wkM6tQ9YRTnd9wkmVd6wsUOl2f9mBg7RQ3VJHmh2LP7ZCVDnJsk6eAbaP
	P5lgXI2eb3TY1LrwHdN6NrkodW1loyoOHkL1ICnQBzWdigXKjyDs99xrXW8w50mUHwMi4wEjubfEN
	ctvtHkmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPYJH-0000000C2XK-2WSZ;
	Thu, 12 Jun 2025 03:08:59 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVya-0000000Bncl-3nPY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 00:39:29 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7cadd46ea9aso62320085a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 17:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749688767; x=1750293567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nnisdB6KB45Bg6Nb3/4+Xt2dI22OpNwKJQSmbNlQCBI=;
        b=LDaqOtqc7ylia/Ksg5e0kgtYSlwzij7w+R6nuW+6bXFy62EgrnqkTvuEvy3V4ExtLj
         Ltbl/iBeRgrTNGBEJUboFEoFIFK5zU0nC2ikaNU6uiKfsAzra/g4na70cOKDuy2MKcE9
         I6F5bSlr3YoAXpaHTljcqYH3WiHeNERW8JJFoia9/pzDR4W5fXkB9VdqKDxrAgVKkLEX
         ePWhloqw7fAW4ktvMfV73EklkT/9jeJLW9hctzUOpMIn6MTEoAlyAcosgCopMScYLV/M
         O5bSAgLFmiBqBVTcqjzSoB067e6Z/TG6OnYjJWerg6z9BIB7Sw3KxX/w6Wpsvee83Tkm
         F7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749688767; x=1750293567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnisdB6KB45Bg6Nb3/4+Xt2dI22OpNwKJQSmbNlQCBI=;
        b=Se3ZWfpjthAfWGqX3WzUDnegJ32SdB1HxQ+3TTghASkVrJteaV6KH/9Tj/3e/SdYDz
         5zjGJ7pdtXzh3hP+1arsSKFSzZ5nFOz6COlv8Y0RR7FfQd20hO7FAN7nAa7N/fYHGzf4
         rCJbRLqILn14BSzP5YYzGrIqXLfC2qyoGDlHDVBPcULChkwXmFEkVXNtDeyqIk/3Ygf5
         Bl9ZC/Tdv2nV9jiQSSkivYUUOkO94gdP7H9B/sbKPCiqb0Q36u2f5o7ZxCKLasTSGagR
         pc0PBheAR2jKghDpvPxrsVVn81BgQ8XeYSXUmn06okkSB/t0jRYtRztm3aM1qMDARqcP
         O/Cw==
X-Gm-Message-State: AOJu0YxUAjgip82OLuVSGcCW/rU5+kFEN6KyhsgOAt9IwDg+8j8yahEQ
	FlwQMVHydu+q1R6lvmh798Zl742RjYboPkGcIsMPmpDP599qy/11gApUje2yzg==
X-Gm-Gg: ASbGncsFCIJublchs8DkjPhudTO7hTZVHM0gr275t5Anu+FuWKyNA2/ztqnrgitXhce
	NLWGnmAkoJG8RZn5k60iQZRisfCAkPmsg5oLMVriT6pN8Ze76a/LX6nEgHgtH2wSBy7qLGR+r02
	VDok0i1xmPGnzW6M4MkIwcuGh9fk/I1tLa9xU96Y3UtDA7p79+P08FsG/xt7JFlXvFCk61SO8dH
	Np8fe5/MB9FpcE2QDGaBd2eRGdL+ES4Hk+QqNbrFZf2ZC3/3WNvGOhfaFu/VdcFlcZoF5aUZsyx
	wRLMApm4kw7lQpPiifoWXPbTa7U9R4yBcCw/Pf2Nkqj28wq/7fcJICHsp8QdTo+yrcmzAvXgboj
	29fFjGz4sNOt83BQDpMmGVa7rhFMXEOOdKdBFq7f/z0B2GIA=
X-Google-Smtp-Source: AGHT+IGavGO8UOvSglJRlraCBSQ61kmbOdGvSpPmLRVt0vmZVnRVxF+/QqyPrkh4gyH41hL+GauK6A==
X-Received: by 2002:a05:620a:394d:b0:7d0:a0f2:e6b1 with SMTP id af79cd13be357-7d3b2a5946dmr238452185a.32.1749688767146;
        Wed, 11 Jun 2025 17:39:27 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b528c300sm35935485a.101.2025.06.11.17.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 17:39:26 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 0/4] Increase i.MX8MP VPU
Date: Wed, 11 Jun 2025 19:39:18 -0500
Message-ID: <20250612003924.178251-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_173928_940979_CBC4960A 
X-CRM114-Status: UNSURE (   7.70  )
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

Some of the VPU clocks are under rated, even for nominal ratings.
Fix the nominial VPU clocks and clock parents, then introduce
the overdrive clock rates.  The fluster scores don't change,
but they do go faster.

This series was adapted from an RFC from Marco Felsch which
was setup to introduce the VC8000E encoder and extacted the
parts that affect the existing infrastructure.

V2:  The only change is 4/4.  Patches 1-3 are all unchanged.

Adam Ford (2):
  arm64: dts: imx8mp-nominal: Explicitly configure nominal VPU clocks
  arm64: dts: imx8mp: Configure VPU clocks for overdrive

Marco Felsch (2):
  arm64: dts: imx8mp: drop gpcv2 vpu power-domains and clocks
  arm64: dts: imx8mp: fix VPU_BUS clock setting

 .../boot/dts/freescale/imx8mp-nominal.dtsi    | 18 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     | 23 +++++++------------
 2 files changed, 26 insertions(+), 15 deletions(-)

-- 
2.48.1


