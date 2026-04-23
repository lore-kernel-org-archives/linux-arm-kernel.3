Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D1FFDEE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=01LiWtizoFsYLgbrSHDfCbjty9gM6V4P76wUHHJkQZw=; b=q6id6cNfN1VUfDlAgQ/rStNEN+
	acxxVYZyasK6FaCY5AHYEyEO/8PFBpttrDpuegHXbxszR/BN6lsrzCDM8f68sJ16E6wK+RduWq+zO
	I39hnk16C6MJWiGr2HIx4m3eU0viQ5uTxuOXYQiOOyhRHPDTuk/k0ShNr5knvNt8GzIZmr5bnI112
	632RU1sqtbH4QrFn2RmJZP6uzbrF4NO8n5lwam4bhjcMbx+APfW2NFYq7sJOP2rJUfPoQshRY4XSX
	CC/TzOaBB+9XsV5gDkowc19DOx8hVT/PADXHzZYOKGAc5xy5JxFedC9rjhyFVGatL5c6NThrnXSL2
	EZnuTsjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFy2Q-0000000C43y-2uOv;
	Thu, 23 Apr 2026 17:40:30 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFy2O-0000000C43c-0aF7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:40:30 +0000
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7ED2C14000A4;
	Thu, 23 Apr 2026 13:40:26 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Thu, 23 Apr 2026 13:40:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kevinmehall.net;
	 h=cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1776966026; x=1777052426; bh=01LiWtizoFsYLgbrSHDfC
	bjty9gM6V4P76wUHHJkQZw=; b=tku6KaFneBXtTj8b6/gB170QNGT47snJVk2Va
	SGDTaF9NIgwuZs5k5nhcrQrwBuddfPTT8B91OZ1QR71sgtEoSAX5Ez/CycVq2iKl
	meON4Rfoh2ge/1hU4zQWq+NAO8UIhWznR2TBGmerljau9RnYUO2AZA6BD9W2fK8A
	znATskO3OvsqWMJgbJPIqiuvAxzcMtPiYtgmgyUg2qzXvVlmxLcB9DFeAxYEfPmq
	NN3iwTS/YI4TDo0piMUtydLEGxj8mYyxtuOGo2rm6+rx5Vu018ZG2WkkbL2ANie3
	rgKBfTzWwXAglAi0X/lBAjLdus3xK5sClU0oxvFwTfrakQViQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776966026; x=1777052426; bh=01LiWtizoFsYLgbrSHDfCbjty9gM6V4P76w
	UHHJkQZw=; b=phGDolUioigZJsGUmKx5LQgy/WlWo0BRUG9PM1Hy7GnH0uC55Pw
	oppC7EBmDbDBlKycgAGMYR1OEBb1J5aOsMhmytumFOE4P9Lf7PelAvRGc8A6GYLn
	0CDNo2Igx56EmgMrx0FBu7O6ElCMRRgC7Uw+KNzx50kMD/6/yjsQYDAYfz7HBX5S
	5soaMAsK6rJNx6dHqcaqDJ/ECBSmt8WF4uBmU9QLxMJC0vjBsAeci8R1tvDXssuT
	nMydGei0ERPfYB4M9dIXJbelDHTycbxV2MErRHFUfwXa5jxTpYZrY9cu7ujZKdsF
	W8HbFs9wTG8vzLnTwb07HvnjlpCE3zfwaEA==
X-ME-Sender: <xms:iVnqaVCbKKVT6DjPHsbHyMehSaZ3QQ87grEbmvFLHSx7pOvu74VlKQ>
    <xme:iVnqabsRBh7k5LCgQi8dzMb_PtppwoHXvVRJlg3cqsUtVUsRQhChHw6Obuh_Q44H3
    sEO_nztkyzDilz0F92koPmidRyPsC9utlBFZS9IRShOujy0DJ_BiA>
X-ME-Received: <xmr:iVnqacJQYkhw4C_ETbWQKkMzsnaV7sjcsJUBSdHdjM-Imldjiwz-9M2D8LC1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeijeejjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepmfgvvhhinhcuofgvhhgr
    lhhluceokhhmsehkvghvihhnmhgvhhgrlhhlrdhnvghtqeenucggtffrrghtthgvrhhnpe
    ejteeludehkeffudegheelkefgleethffgieefffetvdekfeelgeejueeuffehjeenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkmheskhgvvh
    hinhhmvghhrghllhdrnhgvthdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhp
    ohhuthdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopeifvghnsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhskhhr
    rggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrg
    hnugdrohhrghdprhgtphhtthhopehmihhrkhhoqdguvghvkihlihhnuhigsehnrghnlhdr
    uggvpdhrtghpthhtoheprhhstgesrhhunhhtuhigrdgtohhmpdhrtghpthhtoheplhhinh
    hugidqshhpihesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
    qdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtph
    htthhopehlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:iVnqaaY0uzf8MaQEk7Y6fOm7YW3jNMEqmZvNgOCyjWRF3ml6Vbrttw>
    <xmx:iVnqaWDSWGBy9RCNlT74hbhBE6HxtRegRYRUIQLhvEXQvpHzKjsWNA>
    <xmx:iVnqacalOPrqjsTwgMRoQ0GlsDOXZ7WrSX-8i3fNg16sONahIQPiOQ>
    <xmx:iVnqaWmUYcUeje8QvJ50XYlxfvBq9xHGAH3g-gNAoj263khJDXVfcA>
    <xmx:ilnqaTUreEHB4w3ngZJ8u52gKs36ylFp6GHUAsjppZT4qoht3ybUlprD>
Feedback-ID: i421842c8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Apr 2026 13:40:24 -0400 (EDT)
From: Kevin Mehall <km@kevinmehall.net>
To: Mark Brown <broonie@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Mirko Vogt <mirko-dev|linux@nanl.de>,
	Ralf Schlatterbeck <rsc@runtux.com>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] spi: sun6i: Fix chip select handling around autosuspend
Date: Thu, 23 Apr 2026 11:39:59 -0600
Message-ID: <20260423174001.2797797-1-km@kevinmehall.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_104028_991561_F9D2A21F 
X-CRM114-Status: UNSURE (   6.77  )
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

Move the initialization of the SUN6I_TFR_CTL_REG bits out of
sun6i_spi_transfer_one() into earlier callbacks to fix two bugs:

 - With a native chip select, the setup_delay is not correctly applied to
   the first transfer after autosuspend.
 - With a GPIO chip select, the CS is asserted before SCK is driven to the
   correct initial level per the SPI mode. When the mode is set, it can
   cause an extra SCK transition with CS low and corrupt the transfer.
 
Changes since the previous single patch:
 - Move the line that sets `SUN6I_TFR_CTL_CS_MANUAL` into
  `sun6i_spi_set_cs()` rather than into `sun6i_spi_prepare_message()`.
  This change is now a separate commit.

Kevin Mehall (2):
  spi: sun6i: Honor CS setup delay on the first transfer with native CS
  spi: sun6i: Set SPI mode in prepare_message

 drivers/spi/spi-sun6i.c | 74 +++++++++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 29 deletions(-)


base-commit: 028ef9c96e96197026887c0f092424679298aae8
-- 
2.53.0


