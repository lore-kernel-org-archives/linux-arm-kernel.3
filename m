Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4103C02182
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 07:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C9i7gm4WAxSUWE4yayXltdWJDnwH6ceARKDHxirqIGo=; b=ZWLt0RYEd4XNETf6iLLEg9ige0
	reFzbEbKa4KEsLrVYBPHSqIGPxmlJgbW8dj/W6bJ6hFbljPf3FhUK1kx30yhKhXVQ3d3Vqnmrxt3L
	FgBH6WK71I79ausSGKBXwYbYVY7oOw5mPRoGSin9LAON3Rr/pU5p1s6rbtvAHatVo5lgEOgFg4Ios
	Z8JC6IC6I/BV0S7VDAZvM1m9eZYJERakAti3p+qMf59TDGXtWS0EmiP9hGyNF/RSJe/e6AbfMTg2a
	RDDywLf/yJUSCHSPvvAcVCBAuoMH026YbjO8ISyW9ZkKaGnhYcOGPIYtXjZtRMNXeFWIPFsZoxYxd
	3qPIN/ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbaG5-0000000GBrc-0Kv7;
	Sat, 25 Jan 2025 07:07:09 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbaEP-0000000GBfQ-29Z0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 07:05:27 +0000
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 3EA3711400C5;
	Sat, 25 Jan 2025 02:05:21 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 25 Jan 2025 02:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1737788721; x=1737875121; bh=C9i7gm4WAx
	SUWE4yayXltdWJDnwH6ceARKDHxirqIGo=; b=sVRBfj0+MaZlDukOD5hReT6NgI
	lh0uIVp+Lbz3fv2xLDquWXv3gOH8G6X1YRcjDerLSSj/xvV70UYGZ7zvb1wbb7We
	0skXvBOo63LiwWi5y9b+l8Mry6Z48MqNqSscfgS7sAvpIEpQdDPLMVbyJsgH8EPk
	WB50zZQUx2u9cpzQ2NnPbX5lawS7nK2kImBL78REq9oAkCMF8n8faKyuTqFsgbrU
	io6HBh3PtIoeoydWpTjzTs8jtvBPiYgMi1hQ9U5U36kqiuHt5MCV/+Lhxu7boA07
	juqVSFUaA6y7UCtHfJHiWcFHn/UqqbVofkY3+Qg1CL0tQS7G0x63YN6SMIAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1737788721; x=1737875121; bh=C9i7gm4WAxSUWE4yayXltdWJDnwH6ceARKD
	HxirqIGo=; b=v2u+DZnMyOTKZJolmZf9caq1hXRxjaoG3wUIdZI7byacovVY+uE
	iAD+ecT23FAwKAamCIevSwmjk4ybJF+GmD19Wgt/tdhRCe0SkTelCYhlo/mrtQln
	BToQ+k9+qpVLSLRUb2HAuaPgMljDvjCk5vCZMh90T3zo1X+58X32V4LcHMg/BoKD
	krfK8U+sqgV/omvudGNq77nfTsvYsJ0105v8poMcLvi1biKnIr2BEjF4vxsWuqrT
	6UWuPohQxbhoFz4QZPoYnDqxm4WUg0w7QAusQeNEuBmtNDF2c55MNwY3Tpn8x9Kp
	8IYmMMud6FYpF9igesKKSkX/yJ/2qWgV1Cg==
X-ME-Sender: <xms:L42UZ_1hoYkfk0gHnFhAwrDXhTyTJiBvFeIKj5ZGUyu-zABfthbTvA>
    <xme:L42UZ-Ei8pr06ep39HAzdeV20bTYvUeA2uZPnXgv_tt0FXEMCLQEVtPxeThLFrjSM
    icBmV9WJnNPsGMqTQ>
X-ME-Received: <xmr:L42UZ_5XO8GmmJrMoL05_e1LQxVcySituHjwLaFfVoxbSMDjCR0QHPVqnoW9pQ8LNAf8eWzN7pdfyosrP3Gok9a7QXyear-qGTb0pmhvEazO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgieejhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecu
    hfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtg
    homheqnecuggftrfgrthhtvghrnhepuddvueduueegtdeuffetveevgeehhedvhfefuddu
    veekgffgfedtheegtefhhfffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphht
    thhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifohhoug
    esghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtihifrg
    hisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehlihhnuhigqdhs
    ohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrg
    hrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:L42UZ00XXj7EQp1II1_6eGZHTy_kgqC3j2scXnsKpv5eE26G_PYSHA>
    <xmx:L42UZyHePpRkFETSkVOaywQJP9BhBuuTW44a11ybmkSqCHkO6pv1oQ>
    <xmx:L42UZ1_WqH9Cj3igKMahIzLvwe_wKDUyGCY-5vljhWikKbWd42C8Qg>
    <xmx:L42UZ_kxrn9z3IbY4yazrVWwef04WgQ9jIaLUS6NVXt0wTsoGmQTSw>
    <xmx:MY2UZ-FftMkN0oGL16b1r48GldvxnBTdXrWFkcizIo2dLxCEOzSigy62>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jan 2025 02:05:15 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 0/5] ASoC: sun4i-codec: add headphone dectection for Anbernic RG35XX devices
Date: Sat, 25 Jan 2025 20:00:10 +1300
Message-ID: <20250125070458.13822-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_230525_785760_0A9ED9E5 
X-CRM114-Status: GOOD (  11.11  )
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

Hi All, 

V2 of this patch adding support for headphone detection on the Anbernic RG35XX series. No functional changes on this revision, patches refactored to more clearly represent a single change per individual patch, remove vendor prefixing for the device tree binding, improve documentation of the DAPM widget changes and associated UCM, and small whitespace fixes.

Original message below:

This series adds the required device tree bindings to describe GPIOs for jack detection in the sun4i-codec driver, adds support for jack detection to the codec machine driver, and describes the hardware configuration in the RG35XX DTS. The existing speaker amplifier GPIO pin can then be used in concert with jack detection to enable userspace sound servers (via an ALSA UCM configuration) to disable the speaker route when headphones are connected.

Thanks to Chris Morgan for his assistance putting this series together.

Regards,

Ryan

Chris Morgan (4):
  ASoC: dt-bindings: sun4i-a10-codec: add hp-det-gpios
  ASoC: sun4i-codec: correct dapm widgets and controls for h616
  ASoC: sun4i-codec: support hp-det-gpios property
  arm64: dts: allwinner: h700: Add hp-det-gpios for Anbernic RG35XX

Ryan Walklin (1):
  ASoC: sun4i-codec: change h616 card name

 .../sound/allwinner,sun4i-a10-codec.yaml      |  6 ++
 .../sun50i-h700-anbernic-rg35xx-2024.dts      |  5 +-
 sound/soc/sunxi/sun4i-codec.c                 | 59 ++++++++++++++++++-
 3 files changed, 67 insertions(+), 3 deletions(-)

-- 
2.48.1


