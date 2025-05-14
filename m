Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E12C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 18:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tbczOHxH5xeXjhHWZ9EOwnhdlN/ab5dNN31HcEDVis4=; b=xQkmVxSeOXaMvj
	hg97CCu6D+4O3ZEtsCP6MDg5TvMxKAD9OVytvq7WOJiIwMtJW9N+ub6S97QpuzWfZiC6FS3lrDnR1
	+KFNQGZiB3AD1P53VGl7TVJbWFTANtvD/xvBDwmvuc6ENqzS9awOuTvRp5rCJIBpQLynVG1zrEmXP
	iHoqTZ6xw0DRYJBiSOIXe4w2p5pk0lQonTfiNdWwKe3YqfF7LjzRoQY1Zs+ZSvHqfHuGlCw3RDQeG
	460QHxZVY4m1IUObp4hGijOS4Oea6KtsTvXfSOQJSWxk9F8pb590tBlIz2oUN9C/Do/BuG5Jy1sUH
	I20so+SZNaIcoJyYsZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGvM-0000000G1tf-3tzT;
	Wed, 14 May 2025 18:33:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFFcW-0000000Fq6d-2JIw;
	Wed, 14 May 2025 17:10:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 02C6C629DA;
	Wed, 14 May 2025 17:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDAAC4CEE3;
	Wed, 14 May 2025 17:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747242615;
	bh=36/dH5xRVrtHH1eTmliW3XuJouu5VZHY85/K/slXbSM=;
	h=From:Subject:Date:To:Cc:From;
	b=CaljmCiOSsL2kgudEDasFhJkTW0yq7Y2fyDhvyCrzHu9MzmiDOiRtz8APrOHfNUwn
	 Se2+l02vsof/BtUoO0eaO+Gvf32lCABCj2qb9C49ftgEIDnuZKXVZECOA0DVVbeLNt
	 t8lFGvqPT/UrjGZg5TqImKoUsUt8HFQrMk3PGJ08vkU+gGoJ7r6eUuQoBt+7r4vpJ8
	 +eVIsNsYRyIq/OHdNEbyWgDZchgBShq+9H9ctxTDoZzDVhPB/2kahZS0etw+SywVWC
	 hCxOsHZN6sDqCmvXW/8sVRqVC3+O0weCTd/8bBHDCMdwsqprfdfhz1VshMdSDlBCEW
	 9SwLRW/zk12Bg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 0/2] net: airoha: Add per-flow stats support to hw
 flowtable offloading
Date: Wed, 14 May 2025 19:09:56 +0200
Message-Id: <20250514-airoha-en7581-flowstats-v1-0-c00ede12a2ca@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGTOJGgC/x3MSwqAMAwA0atI1gasWn9XERfFphqQVhpRQby7x
 eVbzDwgFJkEhuyBSCcLB5+g8gzm1fiFkG0ylEWpi1ppNBzDapB8qzuFbguXHOYQbKnpZ1c529c
 WUr1Hcnz/53F63w/WUNxlaQAAAA==
X-Change-ID: 20250415-airoha-en7581-flowstats-7e69cf3fd94d
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
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

Introduce per-flow stats accounting to the flowtable hw offload in the
airoha_eth driver. Flow stats are split in the PPE and NPU modules:
- PPE: accounts for high 32bit of per-flow stats
- NPU: accounts for low 32bit of per-flow stats

---
Lorenzo Bianconi (2):
      net: airoha: npu: Move memory allocation in airoha_npu_send_msg() caller
      net: airoha: Add FLOW_CLS_STATS callback support

 drivers/net/ethernet/airoha/Kconfig              |   7 +
 drivers/net/ethernet/airoha/airoha_eth.h         |  33 +++
 drivers/net/ethernet/airoha/airoha_npu.c         | 175 ++++++++++-----
 drivers/net/ethernet/airoha/airoha_npu.h         |   4 +-
 drivers/net/ethernet/airoha/airoha_ppe.c         | 265 +++++++++++++++++++++--
 drivers/net/ethernet/airoha/airoha_ppe_debugfs.c |   9 +-
 6 files changed, 420 insertions(+), 73 deletions(-)
---
base-commit: 664bf117a30804b442a88a8462591bb23f5a0f22
change-id: 20250415-airoha-en7581-flowstats-7e69cf3fd94d

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


