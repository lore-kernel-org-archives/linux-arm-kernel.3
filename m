Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D59C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 19:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VCh4FhUfWPAIY5oCHgOyENQTN+HS1fAJsuh3sXLGPjQ=; b=NMok2LNG5ojTHuG48+YMCNzuxC
	a8z5n8uSoaMpne8Pxhkuz7zhUKmnkGRqzDwGUS0slyUCO7tSieIRQToEMnZatYFuKqPhzvZHa75OW
	WZKwRS9DBUEd9JcK9zSBm0kt1fRzeanmGxqVzhqAS7iVGG8ipxwjNj3IuJl3qWOduhBEPI61y2rv7
	Ulqyd0vO9Z/JPGjJ6hH7ftNP7TBLg0RX4pJ6JDRBjY0MvPOWF+omUs9Aprd6jW/YM9SxGrzhR4/lx
	MGxn4kZJ2RmmX4OXRkOZvcq0fhMyz2CHw3L00a6ArSe/mPIq+FvMOWxneGPcowiiheZE/fpJT50RY
	FBZJ/YAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuamh-00000001QLF-0DIQ;
	Thu, 13 Aug 2026 19:08:11 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuamZ-00000001QIz-0SAh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 19:08:06 +0000
Received: by mail-pj2-x04.google.com with SMTP id d9443c01a7336-2cc80544c74so907005ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 12:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786648082; x=1787252882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VCh4FhUfWPAIY5oCHgOyENQTN+HS1fAJsuh3sXLGPjQ=;
        b=Ur9Uqk6lhoCsl8h1wcOCA99NvAZ0KGN+87FV5mKXJAAboDmU+RfOeaXC8NniQdcyX/
         Nl7ICFazLBvPEd3wkfmN3ak0p2tbDPukv91qySFo49oazI9cAxUTbA7b/Fyr2SbSH9DU
         rUw81OvvlJgUxNQQLVhaGU6Plg/y9Fx4agT7P3t2xDzQNRtm5n9W5CdUkiQZyNG0ozRE
         3ja2DJdqaTnv7CDL78DLtu7GwLrQvDLGbILSemLBa/PaCGvvEs/5QMbEXT7fY0sCL0IB
         gcZiTu+sc1jNhpqToLUJbT52nMlFscUor2Hbki6M0b3doII5pgAi99eJY05oM1I0Gx5V
         C5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786648082; x=1787252882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VCh4FhUfWPAIY5oCHgOyENQTN+HS1fAJsuh3sXLGPjQ=;
        b=rXpIclRQKSabyxvd6LVOfYxKc/0cAAIuOQe9TasL5anpnxPluYrWyfc9gFYh4ADkcR
         goE2qVgnA2BBM5FVGabMp1ekJabrNRge/pPVTaTI9Llcyl1BFXEoSV8RsY3IrVzYQ/ZM
         GtZ+78GVU22KwqpQZ+yWessG6lLJ9A2Br9K1Q9lRZy8szOfmDrpC2f87jkmlG8v6cbp1
         AatUHahjTnol9o2bhHGgpCInLcSqDdaPzBkXV6Cjbv0wCmnZogYixtzT1XlO2gA3KPr8
         HGJH9w1Yrjzy9yQGup6ar1AKwdnFa4uLrECNuJjyritmOw3uAAxAYZyCThtFUpz/sFW6
         2eEQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzteGHxKe0HDwXYWgE52zeYpf+8JtaQ+qV1TEM6HzGbzXck4sOcH3tvgqLLx7Wcw0PcGztUgAfguEtYwO7N5EQ@lists.infradead.org
X-Gm-Message-State: AOJu0YytEAkBK+jbHiYkgLKjubGQWsfPtKiR++CcviuZ89czgzRxI2/2
	AjU4AaSD9o0HUPY99diHL0BTQvyL7fga3uayxIXUZxgRpL42OJMVz4EJ
X-Gm-Gg: AR+sD122sExjw/jHZUVDUPiTzSrrVFhhVbO4ruNTJJtNWig5xtVcXu+crH4HLHmtQ+F
	xb9I1Brt22bLdBXh9Yb2DeiXqWi4yHanksZWAs5wZs4T36fTX43S2wbqdR7ma0O77OsL2gQj/kk
	l8G1BuiFOxHvzP9/dENjay5mhJOQ4LviiUVcwXbLoQkmevfYa3AMhJ7WrsTGfVLZGeTYMnEQuUH
	atP827+BOWN9hid0GiCrujD9oRuXCfGGH5YxtBBmIR3iHOanoFwGpPCOFqxY++b9YcMwbcUGjAR
	c1YFfEyhBqXWft45oBmBGc07sfnSz/+m4TPds/ikP7ZmGH8wLaIjrsr7ayu718hsldqJr8ZB2HU
	YKnHUnZRnupTIprMDnK1sgUEpppRsbG3/vhccB0ycOlqVHvCgAHT6C0Odk4MD1e0Dn77mZYIPZl
	Y4xcIyJbMwEy3EyKrSxnXV+GVfv8E926pPjQ1K/43U2UYZOj+8/AUECQ==
X-Received: by 2002:a17:903:1b66:b0:2cf:b68a:340 with SMTP id d9443c01a7336-2d3b0c43462mr1698315ad.10.1786648081499;
        Thu, 13 Aug 2026 12:08:01 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:43::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aeb78d20sm1310695ad.57.2026.08.13.12.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 12:08:00 -0700 (PDT)
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
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	aleksander.lobakin@intel.com,
	horms@kernel.org,
	magnus.karlsson@intel.com,
	maciej.fijalkowski@intel.com,
	sdf@fomichev.me,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	witu@nvidia.com,
	martin.lau@kernel.org,
	yoong.siang.song@intel.com,
	rohan.g.thomas@intel.com,
	intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net v2 0/3] xsk: pre-existing AF_XDP TX metadata fixes from Sashiko
Date: Thu, 13 Aug 2026 12:07:57 -0700
Message-ID: <20260813190800.222527-1-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_120803_549450_09F1D0D6 
X-CRM114-Status: GOOD (  12.16  )
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

A few fixes to address pre-existing issues from Sashiko review.

Notes on the feedback from net-next v1 posting [0]:
- It correctly complains about ABI breakage for 32 bit systems, added
  an explanation why I think we unlikely to have any 32 bit users with
  launch time
- mlx5 batching (pre existing) - I think my point in the comment still
  stays (that we do not make it worse)
- stmmac recycled descriptors (pre existing) - seems valid but I don't feel
  confident sending a vibe-coded fix
- stmmac queueMaxSDU vs taprio offload - don't think this is real but
  we can fix separately later if it is (the existing issue with breaking
  xsk seems more real)

v2:
- target net, address clashiko feedback (mostly here and other commit
  descriptions)

0: from https://netdev-ai.bots.linux.dev/sashiko/#/message/20260810184753.135756-1-sdf%40fomichev.me

Stanislav Fomichev (3):
  xsk: align TX metadata layout across ABIs
  xsk: honor XDP_TX_METADATA in zero-copy path
  net: stmmac: skip queueMaxSDU check for AF_XDP

 drivers/net/ethernet/intel/igc/igc_main.c     |  3 ++-
 .../ethernet/mellanox/mlx5/core/en/xsk/tx.c   |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++-------
 include/net/libeth/xsk.h                      |  2 +-
 include/net/xdp_sock_drv.h                    | 22 +++++++++++--------
 include/net/xsk_buff_pool.h                   |  3 ++-
 include/uapi/linux/if_xdp.h                   |  1 +
 net/xdp/xsk_buff_pool.c                       |  7 ++++--
 tools/include/uapi/linux/if_xdp.h             |  1 +
 9 files changed, 28 insertions(+), 23 deletions(-)

-- 
2.53.0-Meta


