Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9D0CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 01:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4788WmMOb8QcQZCKza1zlDpD6qQhfOULV+R7eq25UYE=; b=qwmZpZFbajFwb4sd1P8spzLgZD
	75m/Cd8x3atIf56IKJeXaS2gPNKZ/rm1ojtsowbgWy8c+Bp0qyq6bUzk29VHayLipCwdHa3/hw+8R
	vXqD0UBdh+/gsuBgBVYrwK3cnv3T+gHeOR+fJGExyiwS2bVL48xtvth09J7z3DuHZ6s+PZm8ajCYe
	CUMm0bajivlLXrjJg1x/f0rtVU5CwxooNVrABdd7p4MZlgwbWuzdRYR4V6Evh2EccywgdP597E/5r
	Wu+H3CmYpH30EbWHfp//6dZY1W8g5LXSoc2yRGNa89hgK7bTclcCo8mwRIdX9q6O+zmPckvvShsvL
	/WHIkrbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqMBL-00000006hTU-49tX;
	Mon, 25 Aug 2025 01:39:35 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqM8D-00000006hBY-2zii
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 01:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756085780;
	bh=4788WmMOb8QcQZCKza1zlDpD6qQhfOULV+R7eq25UYE=;
	h=Subject:From:To:Cc:Date;
	b=hYDQYF7ICrPQbbVsQ9aGIrolwpB1J3Xl7bPdu3NyuDciq9+EM38ftWyhio1x04cJR
	 l10v8DPXE3dwOsJVLgYzpCaS/0QhKlpj1ZkX8ydz/89wJ5mLmWEExbZudHAf/mjZE5
	 yxPCl7gn7ruTzxoRtVfORyVa4ete4LN6Amw3kuEnS0QTFz38c6JHcYa6xdismMexyc
	 3wn22phg3f22RIhMQSVQW87dmNmu8V3FbOdMe+TEsc/AhHtbBDS6hIFOk3LJXDe3PF
	 zuYm9BPlJBE3w7gYVxjrJTwnAiTJD/muy1kJbz9OVfznWS9iK91Mq786Ke9RlORuur
	 u8oGISEBNos1Q==
Received: from [192.168.68.112] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9E95964C1A;
	Mon, 25 Aug 2025 09:36:19 +0800 (AWST)
Message-ID: <2d122b5c4a19261148993b66e4b98371a684ba74.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: early driver changes for 6.18
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Mon, 25 Aug 2025 11:06:19 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_183621_946876_5E4D2E37 
X-CRM114-Status: UNSURE (   5.62  )
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

Hello SoC maintainers,

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585=
:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-6.18-drivers-0

for you to fetch changes up to c30dcfd4b5a0f0e3fe7138bf287f6de6b1b00278:

  soc: aspeed: socinfo: Add AST27xx silicon IDs (2025-08-11 09:37:53 +0930)

----------------------------------------------------------------
Early ASPEED driver updates for 6.18

Two small changes, the most interesting being the addition of the silicon I=
Ds
for ASPEED's AST2700 SoC family.

----------------------------------------------------------------
Rob Herring (Arm) (1):
      soc: aspeed: Use of_reserved_mem_region_to_resource() for "memory-reg=
ion"

Ryan Chen (1):
      soc: aspeed: socinfo: Add AST27xx silicon IDs

 drivers/soc/aspeed/aspeed-lpc-ctrl.c | 14 +++-----------
 drivers/soc/aspeed/aspeed-p2a-ctrl.c | 14 +++-----------
 drivers/soc/aspeed/aspeed-socinfo.c  |  4 ++++
 3 files changed, 10 insertions(+), 22 deletions(-)


