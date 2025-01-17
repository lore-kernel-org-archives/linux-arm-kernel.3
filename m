Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D816C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 16:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CXLyQI6kaMX3IgzR2F4R+3bNoh5Bn8A/463KPWFiGpQ=; b=X/Xd+XANEkrFunktjcxf9BcHk6
	4jGwn2mihwEQnAe+UoIAymAydxy7C9GY9Afz/PfPyWqj03GzDho7VUClQi0fn1q1mzNgE03zD4wcA
	TFQ5MR6YxYFCirDM7Cha7GHAlm2I8BZhvX9dPvPSBl9W5Bh5L4VfMo1o5RmBL/DQ488DY77PQpFuD
	CzoVtW1VfTO4m2nCf9R+rXDXNBMZEmNrnJyep9/pis1xzv4nYUjn5yqUe4h/x7/SrZrPO2w4Tj8+N
	ZLmknlrvab3uQVj8vCptUPvtos77HKNwrmT1L6awrgyRJzH8KfsIeQOlTi/ko4CbRb/QCb2XQMzBh
	O73SBQQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpeo-00000000sMa-1NCV;
	Fri, 17 Jan 2025 16:57:18 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpWy-00000000qVC-46Gi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 16:49:14 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id A2F891140215;
	Fri, 17 Jan 2025 11:49:09 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 17 Jan 2025 11:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1737132549; x=1737218949; bh=CX
	LyQI6kaMX3IgzR2F4R+3bNoh5Bn8A/463KPWFiGpQ=; b=JLE5xpt8jIFYzYDl3G
	ovNWt0YurgcHhrqCHL+vPU0jXzuCTki+fjVumnDoiHqENnGV1H0sDUADqWboKECL
	yCf9blIP8X5uSG2KKzS51nF3/8mCytxP2vhQy70uNgi56E15NBZIBIcoNL/5n3yP
	G68Rerg6bzrsLgKYBovXQlYA+gCFmbvpGZgJZm9UThp9SkGA0PFgS0XAqmPZflHA
	I3E5DOnyyU/LVgHO6OGxi7D7kFQwn87r8+6cwiFvA3y7/ua3PBCWDnYgVS/0gbQC
	aRSJVZVXwHZLvRYYKL/LlUg9sP3T7O8hRcv84bYNhqQMl7du+cqqYCZI+JSGQsl/
	nBzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1737132549; x=1737218949; bh=CXLyQI6kaMX3IgzR2F4R+3bNoh5B
	n8A/463KPWFiGpQ=; b=vOhOfoQaX9ww/MCOpDvWWLoFfwilBvfP2ss0q+cxqJEV
	C3ICsz7zL7FKvrqLISiukDm5oR3x8/xbsHl8SUgt+vHdn0wC/uMGb1gz2LVYp1tz
	Es0WusqEvSBJ4zSETgVYqS9e1WQnDsZzV5VPL2kOSx/1YlUDJzYcyBarVCcROGPV
	jo53Xq4f2Rupl+ELjNmRmES5J2uw9XiJPtX+bw9tUEBiAeycPmj6FdPVvxt9vpEK
	HA5X3NKadIIAzAoKE0ZIJQuv9cYU7uSR3CqnbhAXCQnl2T2aLEjf9cusZybMn1dG
	g7Vcv2eiOhYU2YFMmpttBV0tNAo6HnT7d94oaq3x4Q==
X-ME-Sender: <xms:BYqKZ8hRMYhF8dZK5RW7MxJMS8sM-MeW7GzuyFLYl7yaguUJqKRfZQ>
    <xme:BYqKZ1Cez2igmVjJu2ZTL0LHbkA5U07oDHDC4ISYVphJ_0Vhr0DdUwRWo8Ct5Bu1P
    lIJSS_3O7vS6D12xNI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeifedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkffutgfgsehtjeertdertddtnecu
    hfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvg
    eqnecuggftrfgrthhtvghrnhepgefggefgieehieduffekieefheevteffueehgfehueet
    gfevteejkeehfedvtdehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpphgvnhhguh
    htrhhonhhigidruggvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhu
    nhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlh
    eslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsohgtsehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:BYqKZ0GgwnFsuxdtQL3yWnX3vEM68B2si1phxFFEEkk7u7EhTy5BHg>
    <xmx:BYqKZ9QNqKqodr6qGfpG3Ce-TIUGu6VbvSDWfomXl7y7eSXf1c5wZA>
    <xmx:BYqKZ5wfrnn3DUB7Ag4u-AJL7RR2I0O1IkeSGRvPidkBl9bbat4PVw>
    <xmx:BYqKZ745QCx0ugCRY4J23Ybs7U5d6zJ9UwoFvkiIrlNS6bgzjZd2-w>
    <xmx:BYqKZx_ZQtjn4cKbB3YixZdGK9pSv8HgbJ97TpA-Elu0XGifsjA4vWrq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2CA0B2220072; Fri, 17 Jan 2025 11:49:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 17 Jan 2025 17:47:32 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <99e7cf2a-2578-4b10-819a-16321a7739c7@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 6.13, part 4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_084913_483840_844412EB 
X-CRM114-Status: UNSURE (   6.76  )
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

The following changes since commit 5bc55a333a2f7316b58edc7573e8e893f7acb532:

  Linux 6.13-rc7 (2025-01-12 14:37:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.13-4

for you to fetch changes up to 352bba6c19cdeac107e7fc1684548269e6b0f111:

  Merge tag 'ti-driver-soc-for-v6.14' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into arm/fixes (2025-01-15 15:56:24 +0100)

----------------------------------------------------------------
soc: fixes for 6.13, part 4

Two last minute fixes: one build issue on TI soc drivers,
and a regression in the renesas reset controller driver.

----------------------------------------------------------------
Arnd Bergmann (2):
      Merge tag 'reset-fixes-for-v6.13' of git://git.pengutronix.de/pza/linux into arm/fixes
      Merge tag 'ti-driver-soc-for-v6.14' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into arm/fixes

Claudiu Beznea (1):
      reset: rzg2l-usbphy-ctrl: Assign proper of node to the allocated device

MD Danish Anwar (1):
      soc: ti: pruss: Fix pruss APIs

 drivers/reset/reset-rzg2l-usbphy-ctrl.c |  1 +
 include/linux/pruss_driver.h            | 12 ++++++------
 2 files changed, 7 insertions(+), 6 deletions(-)

