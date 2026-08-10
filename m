Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C61C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/bAxJNp2NmtcJDSfK/A8JjF0qJRtyo/oUMnpIAtF1l8=; b=ovndj5Fp5D4U4lTMdwkazrQBTd
	SeMmTtHad/6mThbA2QNMt41G1FPF0L5SvzHO3oJKv3rYRiDNpByggKAgdA2cpqeBuQh05NkhaRJzF
	lnSiR91pOw53Q0UvAmRRWX8lkDZSEBy91qkN+w4z2S1V8ZSo+LmrEKq4sWel+hZ9WV4K6DmZK2PW/
	zS5qRGCwSleYs7Wdy2dKw+uWiFIrW50JpKjbBhBfmsJsmiHO4V/jgyJaKorBjv7WpZ5izU9tF444Y
	IFeceQcGaLZx/sBxRiXHa4n2nz2Jh/rsLG31cH2QRjlfdUzxRNhASsNkraMzvHoQfdYSCqJpEPjd+
	dKwz+Jpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtV2U-0000000Cf8M-0Wku;
	Mon, 10 Aug 2026 18:47:58 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtV2R-0000000Cf6r-4333
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:47:57 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-ca24d39d8a4so1422442a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 11:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786387674; x=1786992474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/bAxJNp2NmtcJDSfK/A8JjF0qJRtyo/oUMnpIAtF1l8=;
        b=F1uV5FUdj1JSm+5/Dqi+QHvX4UhsWRC890QSu3tBAtcmGla/dQCtv62WIqbfkS76xI
         6zDWRwItw4Tu7Iume31D+TEOTGPvtAlFdRKdWEjEzacSoAD3g5xQnJflEXzZ7RmAoT6B
         IDF3C33X4FHU55thQ2fRTfQSSfAEZ7HD54/Qwa9U4WZQsjJl+RK5U4wTT976dfBCmJDr
         A2XFpudqZ9L8XWJP5seGIL4OT8a01myqNNkYm0mRfsVrZEGQZoUcCpRvdVyF9UHrWALq
         OfvzzwFMBBuGj/COZp+GprqNSYjLQxxwpg901/DE9VPYhk/vjczEvDJPqkpYMXm2L3bu
         qzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786387674; x=1786992474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/bAxJNp2NmtcJDSfK/A8JjF0qJRtyo/oUMnpIAtF1l8=;
        b=ekaD0wohjDjkSkdYRbewkqodwNrW7Twfm2avajZrACD8qnDsHpmUF21pF1U9DdlxrJ
         dJtYHxF7QRVK3hBpZgl1dT7FiAPQOqgnLoJ1yPqS3o2ozZMhmaBrKrgULMe0pGZgaFBF
         GZIGcw4Zr19wSMhddUd5e8LTQt+CQiQ49mZoMtHDnlzIccuwrjvjZdBRu3kT3Car0b/u
         SPP3id8Wu3EmSI5ippWX8/FK+Drwv22dSHzvgu+0N3vnQrh/WAsbsLkrT9VMBdCjwqJd
         NNa/ZBSGG5EIcfmmMmXsMEjtx/4ZA9JDLxpBgu5rSNQRdBmnoJ2IkblAJSr3fMJjyIlh
         thbg==
X-Forwarded-Encrypted: i=1; AHgh+RpKHYnKKCDcsUka/Z2Lk4bV2FNMS7iwd8OWKg06gBqd+Q/dVWX/5EM5Ck2H1lUs6sjBTl0+EwHmQKZIGJkOWay5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+EOjWlHw6YtnLjf890Sj0gpqn9hpWxZjOSRU8ioLl6c9Hqzna
	D2F6vARkVyKvIuf7pYJ+HQj9l+qOKlgX4uh3emp5g17qkUVEYGLBB7r9
X-Gm-Gg: AR+sD11CC8bj9LPNWdfF0IeGfZfhrEZ9DbTO+rdTz2Kn/kD3sGubQUOqHH4z7kheZdP
	U8QFbRGbjsFWEPshvxla2UxCYe+w6nhAGy1Ti1Yanry0rn6QbcjxTuI6fGpRyqXiF/OCisvzYWK
	nfgj6kXTghusood+YlZlMUwyIZ5OJzq7vZx/jd+XuLaH6+GNRIZ8INPGqcoHxOXhNXTPkZ3oQ3g
	TaTef1HtozgnmQ2BxrtVT7VJlQcongng5x7TkcU66oYIElFWHZcgSrbyQFVWhzrNEinz2JCANPP
	dGrENp9+1Y+PFdBRkl9THOq3clyZOxLbHkeTa9YtM7l9vmNpaf8fOSpRRtog3fnsvNrehGf108/
	DuvNNYBl0o5WGdbrG/e6VEMDnHGQKMEk0Iu2XVdAy7HG1sgDbQbQsE7rjsdpSCbbRHSO8/Xq8gi
	fWmQxIT5dEjPHQvf8ZIOCtA4TlfJUpifoZZhyRNngud1LDbb7eu6v2Pw==
X-Received: by 2002:a05:6a00:3987:b0:837:e9cc:d46e with SMTP id d2e1a72fcca58-84f9c965aacmr3341745b3a.21.1786387674437;
        Mon, 10 Aug 2026 11:47:54 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:72::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51d88dsm4244979b3a.29.2026.08.10.11.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:47:54 -0700 (PDT)
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
	alice.kernel@fastmail.im,
	dtatulea@nvidia.com,
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
Subject: [PATCH net-next 0/3] xsk: pre-existing AF_XDP TX metadata fixes from Sashiko
Date: Mon, 10 Aug 2026 11:47:50 -0700
Message-ID: <20260810184753.135756-1-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_114756_007068_248CE5A4 
X-CRM114-Status: UNSURE (   9.24  )
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

A few fixes to address pre-existing issues from Sashiko review.

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


