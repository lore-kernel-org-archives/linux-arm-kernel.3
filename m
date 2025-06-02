Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5440C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 10:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kDCAKzzp4kJ7326lYSzAlqb4H4Rzowzo8Ib7HjjuGOI=; b=gV4bxm50S7tsU0
	loYc1hKl4u7Q7B/W6dlaRFwcMpVngLX8tAFUUqGy64sz/HkQ7/BxjMCEYR/WSjuqoYmonj2XBOY34
	kbjuDexxWLWJTDanrPpJhFsYyhytTi2f0d6YKeG07rX0lcfYVigGd9WDzbXPBJ8bQqcSbcAMLc8KI
	PuaUB3AA4MBZksQKzJ9QBPhzKE9pkS/MS5NUm9+X8rUuRaB41ICYFqDe8pD52bKxs8vuDk+2FwEyE
	AJS3Ybdj8BY/Fx6Xla7rWm3TPOqfoGNWELfu74Fp1jNDzhrK+4qQivGB90bf9J5sft3dR9fV2vyFE
	bOhq7r0QpEVSnpNKFWUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM2rr-00000007F6F-3n3X;
	Mon, 02 Jun 2025 10:58:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM2pg-00000007Elq-3UCf;
	Mon, 02 Jun 2025 10:55:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3358C61154;
	Mon,  2 Jun 2025 10:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37ACC4CEF1;
	Mon,  2 Jun 2025 10:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748861756;
	bh=CNEuqINln8xoGOt137lfp3l1+JiSb5Impr5Rqb39m34=;
	h=From:Subject:Date:To:Cc:From;
	b=pPuWMH/ztPzZjmTHRmB9cntwUBLPXObLyPRCaE58XESTgG2SsVymcgOdcDVeqdvpI
	 IH6KWlt8Z8mhBTzRdEM+dOseRpNfyB5RexRmwOxPdAnuSFXil2dgt/XTy9tWpcuUXm
	 QFWg6/vI/MZSQTZNGf0npGy7ZKP1Z4J1yHm3gvOkn7U8NiTI0EjjdsUP9NcxKu+qx1
	 f1jh4juiXrPZJ4NggIM32ttWIzauftSdi4E6mTpsNZuN1v9OWEux/ax77GemyD7Xyj
	 uGMtR2OSH2gcWdzeY62XtFKi8Zqd5BhEG+T4iPoE4QWWN/UVaiys4acjHyl/ko+S19
	 jQiERfNeivDqA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net v2 0/3] net: airoha: Fix IPv6 hw acceleration
Date: Mon, 02 Jun 2025 12:55:36 +0200
Message-Id: <20250602-airoha-flowtable-ipv6-fix-v2-0-3287f8b55214@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACiDPWgC/42NQQ6CMBBFr0Jm7ZhSLQVW3sOwqDDARELJlFQN4
 e5WTuDyvZ///waBhClAnW0gFDmwnxPoUwbt6OaBkLvEoJU2yugKHYsfHfaTf63uMaV8iQX2/Mb
 KFi5vqVRkO0j9RSjpY/veJB45rF4+x1XMf/af1ZijQttaMhdHqjTX25NkpunsZYBm3/cv6m3CK
 8MAAAA=
X-Change-ID: 20250529-airoha-flowtable-ipv6-fix-976a1ce80e7d
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michal Kubiak <michal.kubiak@intel.com>, 
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

Fix IPv6 hw acceleration in bridge mode resolving ib2 and
airoha_foe_mac_info_common overwrite in
airoha_ppe_foe_commit_subflow_entry routine.
Introduce UPDMEM source-mac table used to set source mac address for
L3 IPv6 hw accelerated traffic.

---
Changes in v2:
- improve commit logs
- move smac_id configuration for L2 mode in a dedicated patch
- Link to v1: https://lore.kernel.org/r/20250529-airoha-flowtable-ipv6-fix-v1-0-7c7e53ae0854@kernel.org

---
Lorenzo Bianconi (3):
      net: airoha: Initialize PPE UPDMEM source-mac table
      net: airoha: Fix IPv6 hw acceleration in bridge mode
      net: airoha: Fix smac_id configuration in bridge mode

 drivers/net/ethernet/airoha/airoha_eth.c  |  2 ++
 drivers/net/ethernet/airoha/airoha_eth.h  |  1 +
 drivers/net/ethernet/airoha/airoha_ppe.c  | 54 ++++++++++++++++++++++++-------
 drivers/net/ethernet/airoha/airoha_regs.h | 10 ++++++
 4 files changed, 55 insertions(+), 12 deletions(-)
---
base-commit: 558428921eddbd5083fe8116e31b8af460712f44
change-id: 20250529-airoha-flowtable-ipv6-fix-976a1ce80e7d

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


