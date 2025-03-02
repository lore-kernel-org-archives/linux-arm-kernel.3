Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB666C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 11:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z7Y/TKSfcKjLz+8BY7qiShSlDpuTu6NU1rFgchBJCvQ=; b=nZWJ668vBffrDUBhyK46DRofAw
	O1RleTSJ4FQXoHXBQQpsol5A1JNVggR5jJhLUQ/WdF/ncJLUkk+GvJ/8M4lbuQHe7CDtvxvXOy+V+
	iw2Ky/R8OG95geFFRvybGkwJyIcldVBfzZFX8zFfyWlPUO+6O6CMmkwZNU0KAbgFA7y5eqasWSg2o
	3PWPZLKTdYfIaEyF15MigA5ry9sSNbxCI1MHr7Kp23IbWkH+7QUxvTKr3m8xbghEboOr4XJqQZvvJ
	2ipk3Gdlg8QMijCMKHu/WWiQjjG6LKNw2S/6kLSLMAHOkXbzAQiamkdD3qQWxLLFF3NPWW8A46p0I
	NNld9+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tohgN-0000000FvGZ-3XnC;
	Sun, 02 Mar 2025 11:40:31 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tohep-0000000FvBK-2qcH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 11:38:57 +0000
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 0A33C1140132;
	Sun,  2 Mar 2025 06:38:52 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sun, 02 Mar 2025 06:38:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1740915531; x=1741001931; bh=Z7Y/TKSfcK
	jLz+8BY7qiShSlDpuTu6NU1rFgchBJCvQ=; b=ijsAh4yDeENoiS+vJz+z5+exXs
	FT3TIu9GqgbOBXZRb73E4TcQb2FaEnRnT30r1t5J8TRg2xNk7Lk7he3HsL1IvX8E
	mANGlNaQHKpHmervHmqafCY3AdiNwS2lSk43baVh/XzczvQ2o/5LL2Y/GoGI8kg1
	S6p9Qm1UzE0dUPDAwX2GtsRWXufhZk1W8E7Cxkoey/K5Rb/jnRiyFYuFfCoq99OZ
	5mOQJ+khSrIyDKzFUxXhwwfAxucD40rbyXeiHckkOq6UwOevduaQ0c+ZhVV7WOLm
	zaThmwkc2kT54/C/EerCOmVBC6wuEJbWfl249QRwRbzlFYHbfEPCC+NBBs5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1740915531; x=1741001931; bh=Z7Y/TKSfcKjLz+8BY7qiShSlDpuTu6NU1rF
	gchBJCvQ=; b=Thwnl+G1wJ/fJM/Fx1BsZ25YSJGThHZa1pT03BGuEpPW5a40qzy
	He1KBq/xDmBXtq5hwHrSTSYK3J8k1lCJCJ3bggctBvq/+2WLy36dYvpHrCNCUt3b
	eycPB+vYjcFgvKuIIPM0vkKHWfMv5t5zouG2z9zuACm3fGywKZSZ16K0TN0wLI1s
	2LAuftua4Zm2/TPyIa9PKExM52pXu9nty60NaJPsFfRV37tHe7M25sq+boClscAI
	5IHMBvugl+xPn/QjpyWOzLtkB59OdW2P6TURlEpRMG1ZiS1pQH2L3WfeyMtsWdcD
	lB5UlNYCip/4ndnjQBaFM4gaPHFfr0njrRA==
X-ME-Sender: <xms:S0PEZyHLFxfCdY8wN8-nu41tgFU3C4wFlxBtvivA7EqcfEmpr_tZCg>
    <xme:S0PEZzU_A15PH_ta0tbr_WRnZCwBCJPo5vPHPlZbOegBPO6mWmSCkZoecDh9L5ZQw
    aNQ6np296170oORoRU>
X-ME-Received: <xmr:S0PEZ8LfZyS478PA4J4OCbaz3M4ndGGlpby7rtYE0-jH9bNDcQqr99ssQnGyaZcylIlT5GpgrUEkv6VDs2tYrqYGLDmf0MYKDsT_qVna6vQaOB-Uzz7XtC6lFuMAdJs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelieduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvve
    fufffkofgggfestdekredtredttdenucfhrhhomhepufhvvghnucfrvghtvghruceoshhv
    vghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtthgvrhhnpeduieeihfegte
    fgkedtieffkefhjeegieekffdtgffhgeevgeekgeejteeuffdvieenucffohhmrghinhep
    ghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggprhgtphhtthho
    peegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsohgtsehlihhsthhsrdhlih
    hnuhigrdguvghvpdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggv
    vhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfh
    hrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:S0PEZ8H9_ZqYgeGp__YKoPT_aiX2gi4ga2cJe79FR64V2L54l7g7og>
    <xmx:S0PEZ4U1ULgt9SaJPW4O3j0KDik3IYjQh8URDSO_iCgPAmpfupeHCw>
    <xmx:S0PEZ_Pjvrf0sLpbu2zLoF-AsWV2UL_g463u2E8OFGClcQ5T23MmXQ>
    <xmx:S0PEZ_3xtA1gDzJD_CFlchcgM1Ni_Nve8l8DCZfG7lALpJsZ960eCQ>
    <xmx:S0PEZ2zjIZjNbN_UqBpiXntYgfHxkMctUo2js0cbu_bbqjge51_SsAU3>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Mar 2025 06:38:50 -0500 (EST)
From: Sven Peter <sven@svenpeter.dev>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Apple SoC RTKit IPC library updates for v6.15
Date: Sun,  2 Mar 2025 12:38:42 +0100
Message-Id: <20250302113842.58092-1-sven@svenpeter.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_033856_138876_F7E3475F 
X-CRM114-Status: UNSURE (   8.60  )
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

Please merge these Apple SoC RTKit IPC library updates for v6.15.
This batch includes a bunch of minor improvements and bugfixes mostly
required for our downstream drivers (e.g. DCP) which we are planning to
upstream in the next months.
There's one API change which requires a single line adjustment to our
NVMe driver as well which has been reviewed by a NVMe maintainer.


Best,


Sven

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://github.com/AsahiLinux/linux.git tags/asahi-soc-rtkit-6.15

for you to fetch changes up to e210227f0259d2666cc41b28ed1b7b0b0a99ed4d:

  soc: apple: rtkit: Cut syslog messages after the first '\0' (2025-02-28 21:36:45 +0000)

----------------------------------------------------------------
Apple SoC RTKit IPC library updates for 6.15:

- Additional logging for errors
- A few minor improvements and bugfixes required for drivers that are
  yet to be upstreamed

----------------------------------------------------------------
Asahi Lina (2):
      soc: apple: rtkit: Check & log more failures
      soc: apple: rtkit: Pass the crashlog to the crashed() callback

Harshit Mogalapalli (1):
      soc: apple: rtkit: Fix use-after-free in apple_rtkit_crashlog_rx()

Hector Martin (1):
      soc: apple: rtkit: Implement OSLog buffers properly

Janne Grunau (3):
      soc: apple: rtkit: Add and use PWR_STATE_INIT instead of _ON
      soc: apple: rtkit: Use high prio work queue
      soc: apple: rtkit: Cut syslog messages after the first '\0'

 drivers/nvme/host/apple.c          |   2 +-
 drivers/soc/apple/rtkit-internal.h |   1 +
 drivers/soc/apple/rtkit.c          | 112 +++++++++++++++++++++++++------------
 include/linux/soc/apple/rtkit.h    |   2 +-
 4 files changed, 78 insertions(+), 39 deletions(-)

