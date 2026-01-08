Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD24BD1D492
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 21:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W96A5mcg05fjBbNAtxHc0fLKwlj7SwmDpRTKq/eAKgE=; b=mk/Yia621CP24p
	1x9Uzedrs2jElxkJ62xqp+FiLra0WrRCTbzJVZp1+KWYrZIYqLWr6Kh47gJRe08WzpyJnPNwxz3EH
	eYSv2c81us1UVmbZpeYMY2ijA0HZ+FG07IFY2A08ZTkl2eXHtedzHHlIoy9MBXVJSVumDxk4PAAbi
	/hAsMaTT968J8BVBWKnmGYoLUH5xfWcxiL4E4kbwLunGyaBj53jvw7kAizmHkhj8QU/YSFfGOjcsu
	39WJstayF/NiNglELvqoEv/FxRjsda5xzsaP2UZj2csSO6+2Pzx6pH1RfVmcfUDNqCWogBLDL39yV
	kxT1t+1fYEBlOMkxaoUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxBR-00000000rTz-2xtu;
	Thu, 08 Jan 2026 21:04:41 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxBO-00000000rSq-18q2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 21:04:41 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E6B7714000BE;
	Thu,  8 Jan 2026 16:04:33 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 08 Jan 2026 16:04:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1767906273; x=1767992673; bh=W9
	6A5mcg05fjBbNAtxHc0fLKwlj7SwmDpRTKq/eAKgE=; b=dyPX3adZgfLbchr98P
	Ul7MIm3M8JssszyuYFO3k8Y5r+UMTZcArDepG3rPixHowrhJoh+ZycBNPmK1j7tX
	Yf4gjuj/H1aeNP+XSgLqblFpYQMUlXZeTtNgD50CP8W076D5F3Wi1tsg6R41TYwC
	kSvmrYadVUT4k3COLmHIWNDa2nwKNMIGjIZy0+YItzBYNoMISHpkmesUEg3GZrEA
	8McOi128SA7OKGnYW+eFE2QqQjWLPCi8LBe1+dmkhjCDItkgI2tELm0USXsHtdW5
	GcmEY/kxjBqQ17GZdFCLJEs6j69Pf+1tDx3vjk6jy8tEICfeF5rs/x8Uq01absEI
	l7qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1767906273; x=1767992673; bh=W96A5mcg05fjBbNAtxHc0fLKwlj7
	SwmDpRTKq/eAKgE=; b=RjIJoAcLcl5RPNQ2M+ORnhwi2bNYcjR15ZaoJZkZH6mx
	PmdWsWfnnxtXm0SLHOPt5YwDUBmkMO0ARnp18x7DBR0VNOtn8fqn2YFLOHxGTT4s
	lDUSxW8a/qpjzU8KV8Xwn0smlGV4h+olI77NBK6p+xL185u0yHjQZL56bEHQRnjU
	IIMZYkYaIYeyacLTBmwmxk+ENj14bJxE8HdesNsHnXlG8yRfYFCgdbb5OMbeBtgD
	WK0A5UY82F2pX1fxA/sHxIHwnBtZU4sQTgOrfZYkuAyD/sd7MNkDo26Ojjjcd/p2
	zbLDRhO+lJ1+qqf9xC8IL5ubFX2TnX5OZ2RqnZG01A==
X-ME-Sender: <xms:4BtgaYRyPVgcJGnsjgG-duJinFTdfM41y-nbUQez6AFN8fMnKBEQdA>
    <xme:4BtgacT5KTbRI2R1O5YRUWP6MvtgTdTIxtA9Odz51q-LtJor-t8jCYqWqh3yLxBlt
    x9NzpKWiUJ32y74wMWRMRu3qeQdpGUPAKeTp670l_vI5AQEYxAKHw>
X-ME-Received: <xmr:4BtgaT1735cg4KmX5GiyOTj5YDKzwH8dGssqoDE6RadOs7BK1jzMpJW5ujxrZBSNzyc2bJvakOqDHt5cRtowqrxNBenw1yeS4l5BMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeileekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhephfdtue
    duleejffduvdehkeeutdefhfdtvdeiieegheffleefvedvhfeggeegffefnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurd
    hnvghtpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghsrghhiheslh
    hishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehmrghrtggrnhesmhgrrhgtrghn
    rdhsthdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnh
    gvrghlsehgohhmphgrrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhn
    vghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheptghonhhorh
    doughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhes
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrd
    horhhg
X-ME-Proxy: <xmx:4BtgaeySxgJD3WNuhBlsMmkfJKF1KmNx5I59yNgdAb9n1xgFFzmY8Q>
    <xmx:4BtgaXx5CioNL8x3TWO6STlkWfw0PcMZuKeJPMXJqLJqrPN0A0Z9Qg>
    <xmx:4BtgaS8VsXPVJc6tjiL8282t3kK6Bz6Mxs0E74Ctij3iBsXe5IWnyQ>
    <xmx:4BtgaZ-MOWxuvK4qiifNe6m1YIQp5xqwQkhn_zy-v1AQymxFgRpTMA>
    <xmx:4RtgaQvob1Vbt0UsOpRleF2HpumRcbO3Aw1hMzG1yaO0RKsjqv4NnJqA>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jan 2026 16:04:31 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH 0/3] arm64: dts: apple: Small pmgr fixes
Date: Thu, 08 Jan 2026 22:04:00 +0100
Message-Id: <20260108-apple-dt-pmgr-fixes-v1-0-cfdce629c0a8@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMAbYGkC/x3LQQqAIBBA0avErBtQIZGuEi1EJxsoE40IxLsnL
 R+fX6FQZiowDxUyPVz4ih1yHMDtNgZC9t2ghNJCCoM2pYPQ35jOkHHjlwp6p7U1ejKWPPQzZfp
 DH5e1tQ+e96CIZQAAAA==
X-Change-ID: 20260108-apple-dt-pmgr-fixes-dc66a8658aed
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, stable@vger.kernel.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1540; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=UEe2GBpmdFannk+xLx6SfquIM4myIvY07R/tNzyF4Pk=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhswE6TucWyZYyJ88H191ouFzrYu2wWTm6RWPevWS1808b
 CqjYxHUUcrCIMbFICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCJqCQz/M5U3yn7J9H45hZMn
 5ZSwzxmupkffLVaEXBNQTN214HCNEyPDubnfGBzttwcHy+559rrmdHp+wqJ5PI+2bCtJbT3364o
 zLwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_130439_596787_38634321 
X-CRM114-Status: UNSURE (   9.00  )
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

This series contains 3 small pmgr related fixes for Apple silicon
devices with M1 and M2.

1. Prevent the display controller and DPTX phy from powered down after
   initial boot on the M2 Mac mini. This is the only fix worthwhile for
   stable kernels. Given how long it has been broken and that it's not a
   regression I think it can wait to the next merge window and get
   backported from there into stable kernels.

2. Mark ps_atc?_usb_aon as always-on. This is required to keep the soon
   to be suported USB type-c working across suspend an resume. The later
   submitted devicetrees for M1 Pro/Max/Ultra, M2 and M2 Pro/Max/Ultra
   already have this property since the initial change. Only the
   separate for M1 was forgotten.

3. Model the hidden dependency between GPU and pmp as power-domain
   dependency. This is required to avoid crashing the GPU firmware
   immediately after booting.

Signed-off-by: Janne Grunau <j@jannau.net>
---
Hector Martin (1):
      arm64: dts: apple: t8103: Mark ATC USB AON domains as always-on

Janne Grunau (2):
      arm64: dts: apple: t8112-j473: Keep the HDMI port powered on
      arm64: dts: apple: t8103: Add ps_pmp dependency to ps_gfx

 arch/arm64/boot/dts/apple/t8103-pmgr.dtsi |  3 +++
 arch/arm64/boot/dts/apple/t8112-j473.dts  | 19 +++++++++++++++++++
 2 files changed, 22 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260108-apple-dt-pmgr-fixes-dc66a8658aed

Best regards,
-- 
Janne Grunau <j@jannau.net>


