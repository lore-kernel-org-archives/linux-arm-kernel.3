Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C7BC61DE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 07:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k5ZBAdrL5zAROsitwyWfoRyQ13QRzPrvVonWTF5O0i8=; b=UzNSqU10d23aa3Ud6gUmdH+z9T
	6Zkre+EQOhW50r1zMGVwkQnbeJCKAMnv/Le8ZVUGbhz9U7ldhxruFAUG1LRbL4X7dAeNKOUKZ7LIa
	24ZRLF9QhaWFWQicNRTg+rV+WZWPiEMViVntS6rCADu8jOC0DCc++cVX1TaKQLRKUENbchuAOr1iu
	l5R0aLxoEW31kMcbfRIKOCrGcBanoVOdcqT/1pJie768N8JZJGwv4pGBFxe63Zbf+Zw5Q/WjG3N33
	z5YJvmRktRXlRHzDhe7wbDQR6VDFI9MOG9bh91SfUsQwaRh1Y4f2HHV5Ql+ORlblfLjOfbh/JMssV
	P+IwnwwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0aQN-00000007Ys5-2u1g;
	Sun, 30 Aug 2026 07:57:55 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0aQK-00000007YrP-3Rpb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 07:57:54 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so20784665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 00:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788076670; x=1788681470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k5ZBAdrL5zAROsitwyWfoRyQ13QRzPrvVonWTF5O0i8=;
        b=CLReI1s1GF9jjhw2CEucgJSx4lNz2XFRYsZY9C6qrcGS7VnYe8xI4r/NucxIfwlXHQ
         YZFAZy6Pu/8aEndIMk+l5UQaEpt583y/t5Rj0SCb2eb0IOnkUslPb3sMBIrPZ37X15Eo
         cqkJKyteNsrBcjrIeQVSu1Yq8r5KOhW40cucdlwPanCI3aS9P2ioMsN9QRdUx3Q1menw
         Amb1pr3oNMjv+M6FrAMg/o6FtNTCaEWwjayOWBKFTxlaGeHEVlyjaDypihF64iEph59K
         XMf2ph6WwfCnVrpNQbZxl6EgfvKqB0zrbZmk1pHb6BYFPIbylSPRHQnRhMglYoE9hIqh
         6lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788076670; x=1788681470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5ZBAdrL5zAROsitwyWfoRyQ13QRzPrvVonWTF5O0i8=;
        b=c+p6/8wluuZnMLo0AHNPpSXGHW/85tCe/ji3pnHX3+j7fDuvXeEDk+z+4AWv8Bvk3o
         JnzmwT3cyeNdIU3aZateVKeP2ysE0RV1tklOM9gsUMfb7BoHNg3aM2e2Gq6K05AIDunC
         TyPsE8nnE3et1oDkJH9Eu4sbDBaGn/vYsirm7jZbEJ8cM1u9pMvbFbR9y8Lb17v95DVH
         TrVhdjoWYiJYO4Nd3LKUyhNW5iC11z0zlxHP+Y7BJ9E9hk40vKruIhd+UXMi2zBH+Vlm
         7/j4R1BoltMXxIpPL63bdvt50wccon3GDfoRJFicHnowz+i0pMVyALXdP1RQ+OSwmTbl
         9SLA==
X-Forwarded-Encrypted: i=1; AHgh+RoDBvtgFfaWvsi0ztNojNwb48vu+mfBL2GG0k/425xZlhG3B5QmyYZMtvBeRjys+FJirBlB1J8uesmTtXjSDWZ5@lists.infradead.org
X-Gm-Message-State: AFuF++mnz9iEkpjoPbJYUjyBnLK05Y6Jql+kVbTkJA8Piq7n19p1FOgy
	veF8hnBQoCk8YEn/OL62qVG7z4jejXwEoyspYi+XqlcdnuKUTuu2ulU=
X-Gm-Gg: AR+sD10/DLdg/oKE/2DG0Vzuw4Imhr8u5x6cZbwJhrdGD6j+80SUgCW4m70kFoHgH+H
	/a0H8MVcCBIyUc8JdsQgude346tsDdOdiOt++cQMczwy2qtIcDb2InuDhsFE83YxmBB9cQzvUFZ
	10xH2bfoEAAXasWTPJ7nLXK3pndchn+6cDN1aHYHEVCFJF1rySMDP8EizH0V9iIZqg6MB/tsEGz
	y5tY9NgrOiGhGnv4WET3gTjPkxtinNLEVNmVG3foklb8Y+fyBK1hjvKvbjOlhgNVXMkRtHMVyky
	+yZQpQc8R2g8pB8s27HJMH2CTVfOiXlvmW5JQNThcFmGmvC3Hjf+FUKW7tEBwox1IwK0cWTjWi9
	9rgUm19WCjkyljbx4BeechrhFuanbYT16vIWzEOyaA3OEfZ+TXLwEcpzAZWxGIPuprB4/MIEvjq
	ox6e1n8qSVn6zzGWi1wjkM+IDF6P1AZXpMutzw7Vm8IrzaeBYOfG0=
X-Received: by 2002:a05:600c:8b35:b0:493:c634:952 with SMTP id 5b1f17b1804b1-49b91c3c91bmr265871445e9.7.1788076670012;
        Sun, 30 Aug 2026 00:57:50 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd53a4678sm14757875e9.13.2026.08.30.00.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 00:57:49 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH 0/4] net: airoha: fix silent RX packet loss on ring 4
Date: Sun, 30 Aug 2026 10:57:13 +0100
Message-ID: <20260830095717.37218-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_005752_899196_BD4A0EDB 
X-CRM114-Status: GOOD (  15.42  )
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

This series fixes silent RX packet loss on the airoha_eth driver that
shows up as PPPoE/DHCP negotiation randomly failing to complete
(reported and reproduced on Nokia XG-040G-MF, AN7583). Two independent
causes were found on the same ring - ring 4, the shared "force to CPU"
ring that several unrelated control protocols get routed onto - so
they're posted together for context even though patch 1 targets net
and patches 2-4 target net-next:

  1/4 (net):      RX_NO_CPU_DSCP interrupt was unmasked but never
                   handled, so a ring drained to zero descriptors
                   never got NAPI rescheduled to refill it. Plain bug
                   fix, no new behavior beyond "stuck ring recovers".

  2/4 (net-next): a second, independent cause: hardware can complete
                   a descriptor past the software-posted boundary
                   before it's been reposted, wedging the strictly
                   sequential consumer forever even though real frames
                   are sitting further along in the ring. Detected via
                   comparing hw's own RX_DMA_IDX against the sw
                   consumer across polls, recovered via a deferred
                   ring resync. Marked net-next rather than net
                   because I can't currently offer a fresh
                   reproduction to back it up - see the patch itself
                   for what evidence it does rest on.

  3/4 (net-next): new ethtool -S counter for observing when 2/4's
                   recovery fires. New ABI, split out from the fix
                   itself, no correctness impact either way.

  4/4 (net-next): grow ring 4 from 16 to 128 descriptors, since the
                   race in 2/4 is correlated with this specific ring's
                   idle-to-first-frame burst pattern. On its own this
                   doesn't fix anything - it exists to make the race
                   in 2/4 harder to hit - so it only makes sense
                   alongside 2/4, hence net-next timing here too.

Some background on how these were found and tested, and answers to a
couple of questions I expect to come up, since they already did during
downstream review:

- All four were developed, build- and stress-tested against a 6.18
  base as part of an OpenWrt PR (openwrt/openwrt#24872) before being
  rebased here against current net/net-next. 1/4 and 4/4 have real
  hardware evidence: 1/4 fixes a reproduced-on-hardware bug tracked at
  the issue linked in its commit; 4/4's 128-descriptor ring survived
  500+ forced PPPoE/DHCP reconnect cycles (~20h+) on real hardware with
  zero drops, both with and without 2/4 present.

- 2/4's race itself did not reproduce during ~57 combined hours of
  fresh stress-testing this round (with and without the fix present,
  same test methodology as above) - its rx_stall_recover counter (3/4)
  never incremented once. The case for 2/4 rests on earlier, less
  controlled field/downstream testing that did point at this exact
  race, not on a fresh trigger from this round. I'm not confident
  enough in that to call it a `net` fix, hence net-next.

- 2/4 and 1/4 each carry an open question in their commit messages
  (an MMIO-read cost on the RX hot path for 2/4, an interrupt-storm
  question for 1/4) that came up during the downstream review -
  answered inline there rather than left for a first pass here.

Vitaliy Sochnev (4):
  net: airoha: handle RX_NO_CPU_DSCP interrupt, not just RX_DONE
  net: airoha: recover RX ring after hw completion race
  net: airoha: add rx_stall_recover ethtool counter
  net: airoha: grow RX ring 4 to 128 descriptors

 drivers/net/ethernet/airoha/airoha_eth.c | 207 ++++++++++++++++++++++-
 drivers/net/ethernet/airoha/airoha_eth.h |  22 +++
 2 files changed, 223 insertions(+), 6 deletions(-)

-- 
2.55.0


