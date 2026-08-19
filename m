Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AF1C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8jkkIHI4R35tfZea7PHfGNfeEKUbdMreB+UNwExCspY=; b=sqglVQg3qQy8vP0EV8r5veZbcs
	iC/36R0wg9SElGPNi7byKlGP1L/uShyq3+THwXRD/IcNBGJcHfob/ukHLGfXF4ClpTq4DotzeEXOZ
	d7nOIguLGORGOHOnupAnUGlTl0CnhiHdvIRRSLTuPV7gQ2efScZkqsXp03eyK3ZmgP9dXgIIOYPWX
	AJgktChLSURGKTf7ED0JqnUu2cF8OOX1asHr2Qlr7+uA83BrMsfNTh+ekQStkZC6AMI+mmAScZEE1
	QvkXbvCPoMYPVLxbF593jCu03VeX12M1BOyN9CTUY87ll7EyL8WjkncEaAGCT4YCafZkZNui5U9/2
	wc52ctZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwio8-0000000A924-3kbk;
	Wed, 19 Aug 2026 16:06:28 +0000
Received: from mail-pj2-x09.google.com ([2607:f8b0:4864:39::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwinK-0000000A8vA-2BJQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:06:27 +0000
Received: by mail-pj2-x09.google.com with SMTP id 98e67ed59e1d1-38eaa0c5df6so135569a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 09:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787155537; x=1787760337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8jkkIHI4R35tfZea7PHfGNfeEKUbdMreB+UNwExCspY=;
        b=TOytNkBb+zBk7xOl9uCATccJhbPGLmeHDu4EzXt5tCdKlskdJLnPAxC+gtJKCNLpU9
         jhln/Q4kxN9/HnfU2zS73Absny12QbTCJ6S7qeWG5eFjR0S5UwJ/4x82r+lrb4VVgLIp
         V+IYVRH4VugtNsbUo3yC9PPijX0a0EPBFcdWaq9+NsOgsSYJSD8fc30AHufDHlmcX7Lg
         VlRd11qPZFymVKdGrZIVo2sZRiaphiTpL8qBlOnRf/G9gsWVVhhSQGC2iUcuCsZkOgjd
         N8xaEe95fxJs3xOy3rr7zJoO9QbyFVYNVxRWVwwOOQLQHpoNh0mIG/oLM00ATzDUN2VH
         Qmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155537; x=1787760337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8jkkIHI4R35tfZea7PHfGNfeEKUbdMreB+UNwExCspY=;
        b=XqWAsIWKxP8A8oLBWc00JIiuQ36VL5UVBnERgJSFI6P6+Y5UhdO0g9q8P1KlaImJ+a
         C8qfi2jvtyKnvCBkeytmyd9PDV40vCaeDbUJS1w6qe4t8bpO03s/djYRbaTIlJWNgWCe
         hrXFbaeKhS4/k5F9UAEYBFdoS4YjAoBMtR6IgnIxptLdw1QiTr/cX/3aKI3wVi7cZ0x2
         HhSIJMyfG/rlhZ2m0tM7Dh13x4pgigj2ph8hdBW/uvr2pQlakAbTLOOHtyDUs8Z7SVZT
         SIsQ5wOkkBGt/k3Ob+exyvj1RwS6EqouiGfMwlCsnkUjG5dQGXu4TYK8BOQBviRJKYZ+
         DtwA==
X-Forwarded-Encrypted: i=1; AHgh+Rou4H3A8r6Gpjy+imofJY52TEyvIKDCZD72lOS9fr2xXOboyz09W0Ey4u8Xm/36tuiKb0mjKhVJEZ1IdyLi9tJH@lists.infradead.org
X-Gm-Message-State: AFuF++lxJ27EmdgJG8waUVgT2ft5ZJdH76v4ZFGXtf3gKl9ODcXiHk8U
	fxwer8GvrMKVPmJ0PV/4Er4HgvpdnI8pW8E6Za6Cr3BZhCK/r/mF7sss
X-Gm-Gg: AR+sD13ORQhz6KDHLO6SVslnRFZEnPRp1ZazmcPxBRCAd0RkA2nheo3wUG8VaiT3XJA
	qtyEZm3uvcI2OXj66TmzelzDoa6KBFXTERdRXN3KPYbxI1U7+gAeG1DhWoc2xuFXKmUNAj9hFnj
	K2vUQ1eOXx8JcxBVWKpfhfIXsw5nX6b0jcvaxeP//T6qQE9CWemglyQnNzDE8ASlyAHwYJ1/7EU
	bEn6nMhwKW66FokXBtzluDFOu3msNRb8pZZZU2u35fWb1DSrymKr5lyyXFqlgytEK7eaokE4QdB
	tnObiYmo54FV0noeGCS2MNQmML7a2ABGo976HHm9nOPvsPL6229DwGdy74xguQwORvJwv7cNQu1
	lSNX+8oi1GiOqmI4SStJYkrtBscIPciW11/EfuPob0iXptvPxhiK7ZsqAjZqr5/Wu6JELWsrlm7
	ugm7MOHjidO+i6ZOaKdffbdrolLQ1/zYfi7RrisrQgblSaErpV+/9jtw==
X-Received: by 2002:a17:90b:2584:b0:38f:de94:bf34 with SMTP id 98e67ed59e1d1-395a074aab8mr140125a91.10.1787155537339;
        Wed, 19 Aug 2026 09:05:37 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4e::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fbbe817sm1267610a91.2.2026.08.19.09.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 09:05:36 -0700 (PDT)
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
	guoren@kernel.org,
	dtatulea@nvidia.com,
	witu@nvidia.com,
	martin.lau@kernel.org,
	yoong.siang.song@intel.com,
	intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org,
	linux-csky@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net v3 0/3] xsk: pre-existing AF_XDP TX metadata fixes from Sashiko
Date: Wed, 19 Aug 2026 09:05:32 -0700
Message-ID: <20260819160535.1472459-1-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_090538_568869_558294BB 
X-CRM114-Status: GOOD (  12.15  )
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

v3:
- update first patch commit description (Arnd)
- replace last patch with a comment (Jakub)

v2:
- target net, address clashiko feedback (mostly here and other commit
  descriptions)

0: from https://netdev-ai.bots.linux.dev/sashiko/#/message/20260810184753.135756-1-sdf%40fomichev.me

Stanislav Fomichev (3):
  xsk: align TX metadata layout across ABIs
  xsk: honor XDP_TX_METADATA in zero-copy path
  net: stmmac: document oversized AF_XDP frame handling

 drivers/net/ethernet/intel/igc/igc_main.c     |  3 ++-
 .../ethernet/mellanox/mlx5/core/en/xsk/tx.c   |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  7 +++++-
 include/net/libeth/xsk.h                      |  2 +-
 include/net/xdp_sock_drv.h                    | 22 +++++++++++--------
 include/net/xsk_buff_pool.h                   |  3 ++-
 include/uapi/linux/if_xdp.h                   |  1 +
 net/xdp/xsk_buff_pool.c                       |  7 ++++--
 tools/include/uapi/linux/if_xdp.h             |  1 +
 9 files changed, 32 insertions(+), 16 deletions(-)

-- 
2.53.0-Meta


