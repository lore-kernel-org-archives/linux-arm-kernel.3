Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7108CC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EBHchiXE2dARhW+lF5cUbUC3sGgHoglb/2VvCgkoEgQ=; b=qLTmAeIqvrrWiJUK7ZfphxfJtn
	0I8drRo/MkO/t61XQ+QSAYeMaIGhuvhZSbMqY7LTXjbiYw4XCpaTfhSAp0ROnpJOzmYmC3JeDjxH0
	7lW3OGfE9jIKSnThlV8KNlwJWr2CMTYTRNw7bMqD/XKCgSKI38pwaH8urvyAIUoKUpzD1GU2NK9X5
	3zjOCKlbLeznVEiKONQzczP18+eHT1eD6teGIHNv0EGaEQsgdlEfgc97zeEnNOSmgPFc+Ei04h6NA
	v0+7wHa79ADs8CVVqs5PhzPHouNnmwFC3Lqi92Iey68H8cakSHH0GUrS9FtXpkM5R909yOAXFCC5+
	kJ1U0T+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO3g-00000003I5C-1hIp;
	Mon, 27 Jul 2026 16:20:04 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO3d-00000003I3k-2awZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:20:02 +0000
Received: by mail-pj2-x00.google.com with SMTP id d9443c01a7336-2cc73acd2d0so1709275ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 09:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785169200; x=1785774000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EBHchiXE2dARhW+lF5cUbUC3sGgHoglb/2VvCgkoEgQ=;
        b=jso4BYK684eu8/DUvENSM0ppOb1Q4g6L8DrnTAW9UXBsU9jKonTwva2uPkUs/CoR6Z
         SkaPX7XqidPMond4Hefz7gzWIc7fUXv+BYqcxlL1ysaS9UfeRA6M/HDnQlmOad5qthnV
         m+zgtltY+nIIuw8RRSeFDm9TGSnszDcCRw1aXX7n7NSmH9qtHbARZgN2EgpdMALdxoG4
         di/TMzqBakUgjgdGsXIwx24vM7B7s8tY4mc9SZYBwJWCh3j8Ikwhsqk/of5TjHQXam8z
         plGCVjfc+rtBDmqipytRj+CA+LT/BJEMGQJfwPfHg1GnAoPomv5gOzyUDs7udOm+06og
         eoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169200; x=1785774000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBHchiXE2dARhW+lF5cUbUC3sGgHoglb/2VvCgkoEgQ=;
        b=bBSKNtD1S2CRvJHa6na/HNtjicd2zFeokuF+sRCdOUkOofAfETCWPRsjKZ6Zc51b0Z
         tTGRhoXqFHOjH9jfL5Qbai5zZOiMs+T9rBiXIy8GE5q4zU4V7IRFjlkaKyqk96YjInw/
         Z0/X4M2p3/sPwBQvhUtS/TPRc6hUCWc2wHghxYwNB8fJN8FyTFTCmEEac0azdqUP4t9G
         ILbwQJMvi8V4NvP7QA+Vzw9I2Efoordr7AsWBuTgktEuCOEmlJqv6BDXrzDUsOiE5+oE
         6v0o7VvIGWEpGIE4+adDUK571hO2jGgBMKPv+f+Rvfc/P3E89V2ejPzKKToJRkdMi1Cr
         0tlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rop5guZUi5sNsrfkTzDqI1mQzJq1VIX6QPC5RmVLKkHbUzn7D+sCHEVXvUVRNwNy8EkyzdkoM/JeKt0Za0cXDZM@lists.infradead.org
X-Gm-Message-State: AOJu0YzWoAO7MdV3x1ujELYpb0H9GROwmm5HtHypDpSYAKNiohoxXKOj
	VS0a24jc24PEAXjE0nXqlubZk/fBh56qD7mZjriR2CazpgbxaJceEv+1
X-Gm-Gg: AR+sD10igVaQ5S4FKlrVG/tESZ7OCqFee3slzPzh7rlDo0D5OPMKloSmVjzYb5PR3nl
	TKEXaAKYk4OXevSmQFu3oQtsR6JJ9xcrJ4zAb1ilSJ5qo+Su1uImvRLq42Ol+1PJbL34P7eFdZJ
	33S/QmNGRwdK0YxMnVhkSqN5LYMs95i7Fmb58n4KgwpbHwOtNyjRcKtXnxJTYy5Gv9PuhpojbwA
	lUw9Zce08V2goNCNMugqj/DRtbIzwGhnC7TRWAO2EuYylc0iWjRWZY5NOoVa8Pnupc3T9X4+/+N
	f86f6/og9bDCDTddbgyuDdiWYKr2BjljGtjqPQMIWoe6tezo66DIVzhOY2K9WgG7S5tDd8mS0+f
	yPAWPc3doBbO5cKM6BuspPG+zMt5v9xL64QBMWv4wJRSCb+IZockpyKSnSXF6GP07prq7NA==
X-Received: by 2002:a17:903:9ce:b0:2ca:c847:8e41 with SMTP id d9443c01a7336-2d00e7f7ca8mr978145ad.11.1785169200191;
        Mon, 27 Jul 2026 09:20:00 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:2::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5c7678sm38144985ad.18.2026.07.27.09.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:19:59 -0700 (PDT)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	andrew+netdev@lunn.ch,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	aleksander.lobakin@intel.com,
	horms@kernel.org,
	magnus.karlsson@intel.com,
	maciej.fijalkowski@intel.com,
	witu@nvidia.com,
	alice.kernel@fastmail.im,
	dtatulea@nvidia.com,
	yoong.siang.song@intel.com,
	martin.lau@kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	leon@kernel.org,
	AutonomousCodeSecurity@microsoft.com,
	"Cen Zhang (Microsoft)" <blbllhy@gmail.com>
Subject: [PATCH net 0/6] xsk: harden TX metadata validation against races
Date: Mon, 27 Jul 2026 09:19:53 -0700
Message-ID: <20260727161959.885642-1-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_092001_685070_2EC00245 
X-CRM114-Status: UNSURE (   8.92  )
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

Cen Zhang reported a KASAN out-of-bounds read when AF_XDP is configured
with a TX metadata area smaller than struct xsk_tx_metadata. The metadata
is also shared with user space, so reading its flags more than once can
produce inconsistent validation and processing decisions.

Require enough space for the flags and one request field, validate the
launch-time field against the configured metadata length, and use one
snapshot of the flags while processing each request. Carry the validated
decision through completion handling so later user-space changes cannot
enable an unrequested completion timestamp.

Reported-by: AutonomousCodeSecurity@microsoft.com
Reported-by: Cen Zhang (Microsoft) <blbllhy@gmail.com>
Link: https://lore.kernel.org/netdev/20260720155210.34229-1-blbllhy@gmail.com/

Stanislav Fomichev (6):
  xsk: require at least 16 bytes of TX metadata
  xsk: pass TX metadata pointer by reference
  xsk: clear metadata pointer when no timestamp is requested
  xsk: validate launch-time metadata size
  xsk: move xsk_tx_metadata_request() to xdp_sock_drv.h
  xsk: validate metadata when processing requests

 drivers/net/ethernet/intel/igc/igc_main.c     |  2 +-
 drivers/net/ethernet/mellanox/mlx5/core/en.h  |  2 +-
 .../net/ethernet/mellanox/mlx5/core/en/xdp.c  | 15 ++--
 .../net/ethernet/mellanox/mlx5/core/en/xdp.h  |  4 +-
 .../ethernet/mellanox/mlx5/core/en/xsk/tx.c   |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  4 +-
 include/net/libeth/xsk.h                      |  2 +-
 include/net/xdp_sock.h                        | 45 ++---------
 include/net/xdp_sock_drv.h                    | 77 ++++++++++++++++---
 net/xdp/xdp_umem.c                            |  2 +
 net/xdp/xsk.c                                 | 11 ++-
 net/xdp/xsk_buff_pool.c                       |  6 +-
 12 files changed, 101 insertions(+), 71 deletions(-)

-- 
2.53.0-Meta


