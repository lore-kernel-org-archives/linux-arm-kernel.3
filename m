Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAECC61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 21:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4N2Z9Nu76llWCIDOn2i9yQBrPhlyiZyTva3R2V2uoo=; b=PFLYcX3cd01AFu/2HnQuW+ylJc
	rmrx3mfCiBN7M1ZMH6Ye3f3mDls4eM7f0vk5vl3Tw0nFaVOyq283fsACLwtM/YR/S/yy7fYMki+gh
	7MIEiOZDkwUkUw+W4kdorlx2iFe3NGZP2uHxCHEEN2b8E7UvTnL7RCIC0dNQBIY1bGCHdD3pD0q+6
	9hb1sWy6bXYJL5Ek3gsdocKXRrwy8NNtsnZdX0/6pKt0sv/1Uh4TNu3C5RjN6hME6SniO3c3EYHz2
	GCq1yV7Q8k1xwb+xIXIGVmRmSsV7Femzi/5/dPAaFbm74SkVRlszO9K2DjoTCjiO6uWxDRFerHiH+
	I3AepqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19qm-0000000AYYr-3msk;
	Mon, 31 Aug 2026 21:47:32 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19qj-0000000AYXn-2CiG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 21:47:30 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-3a20dec69f9so31418901fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 14:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788212847; x=1788817647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E4N2Z9Nu76llWCIDOn2i9yQBrPhlyiZyTva3R2V2uoo=;
        b=YbnM32K+Ba3v+G09T/Ptp0K+GGT9ysV9HhYfzq4uEDrcp+cHRFzNvOPXJ4U5qJ0Dq5
         f9IV6PWrsqFv7mnt512c8e/LMLeDzJZEqVAUah8rSWKVrPjHKpljONviABhUaAv/e1jM
         MlwZDgxrOTP0CYaU1hYMs4d/CQjV5K/1T5e5M3P/tcAmb3FJYksfMLCrT/MixRfBZSuN
         2TR7m5xlmaPXhZc1WS5k3058z8/FTp6eOUcsfCSxRUesiI4+Ypwv9bsor95+Af9X7zgP
         3EuxQ7ePZDRPs+5IwnYJFh3akiZj9wZUVuUUt2RKLaPHICp2aNrs2oKn9qacvqOLWTWO
         9szA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788212847; x=1788817647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E4N2Z9Nu76llWCIDOn2i9yQBrPhlyiZyTva3R2V2uoo=;
        b=mHyguDBp1/zt0OxNM52kVX/PL7U77yj85ISRFtdgKaKUvW6lTH7zTqkzLv9smrrU3q
         OChB+omjCjhxORWYqkXD70ppnZuwvTkWzy77w83GFD3oOYX2TTKF6eLdf4Ujam73CiIM
         UxF13lwYT50YPo5AuQiC1c1zirlw2VtlxIAS27ij0dPEYIztycwVOF/VHaOo+YLY6YM4
         yKF5U3xryH+5f9m7/JBMGPg9ZevvBNaXx7aYGjc+TCfEammhLu1J7l4AbLUJnZ6jG300
         v+mY/3QshDFvW7qQ+O86afHGziipLuw070dPK6CXbNhUG3qOzLc2Fi6mKec342AAbvGK
         OCjQ==
X-Forwarded-Encrypted: i=1; AKwUvBycRgxT6OV8pgN6NCt+ULg9cqNoIMvJIo6f0YpcvdUjt9LuqVzqs1whwxEuqeErfwryboupI3phTwOURs8GRcrE@lists.infradead.org
X-Gm-Message-State: AFuF++nfBi2cVBZs8ol2R/UwNSX9zcbWWTL8O+8jb+rfMfBhuS6j+CVZ
	G6OKc2crpGBYDHGDRpzZnDwhSC2/yP1ia6hrD8h/AOXwUFl/g5V702o=
X-Gm-Gg: AYBFou2w0cN6GMygfKuxmlMNBJwFcw4w1SDTlUtjsOH0uEuna/o5zrioQEBjVFv+OKm
	Iv9gdIfz7hUjx1XXigdi8rvBh3n8ErRFBQQEAt9X8ShYAO5Kqq+/YjhLoYOZrKsnBWcxOYjceXQ
	Bhnh5DrUFaG/jTSwiJFEwJPKpunEfMN5pXDMVP6xfmS7wft6icsKrXMQXYERBqp3GZVPJ9VsmOn
	u8rbBhzvI4oRpzlG7do+uUBFlHsBTe4GplAOVRfO60C2c//ozcF5M5jA4hG69KjKl8aCy/M+qb3
	Qc/6JnIIUJ6thpeRrEfIEx1UbeTZK95I08NonfIaJTBkJo2NQCumsglKCC6xJzJcN8SSNlHdKNO
	qk+F21yfzGXFX0+vQn/40tt71cqdNT1S88xAVIXhBem6D+JdeYRydz+wuWmLdf8B73o8NcehQQu
	JoxtIQMrkl2SVajFykKJiVbmX+m7jCqv2tkRRsqISYT3EqgvAksf+cfAlUkKQJ
X-Received: by 2002:a05:651c:b23:b0:3a3:314:8c8a with SMTP id 38308e7fff4ca-3a3031499camr62394581fa.14.1788212846426;
        Mon, 31 Aug 2026 14:47:26 -0700 (PDT)
Received: from fedora ([92.36.9.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a31550cefbsm18299201fa.9.2026.08.31.14.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:47:26 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: upstream@airoha.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH net v2 0/3] net: airoha: fix silent RX loss on the shared CPU ring
Date: Tue,  1 Sep 2026 00:46:58 +0100
Message-ID: <20260831234701.206021-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830095717.37218-1-sochnev.v.74@gmail.com>
References: <20260830095717.37218-1-sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_144729_579109_62F61F5F 
X-CRM114-Status: GOOD (  15.50  )
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

All three target net. v1 split them across net/net-next; with the ring
size now shown to be load bearing, they belong together.

Answers to the v1 review:

- "fill_rx_queue() overwrites the DONE bit written by hw" - no. I
  implemented that check anyway (bail out in fill_rx_queue(), clear the
  bit in rx_process()) and it never fired once, while the ring was
  demonstrably stalled: the descriptor at q->head never had
  QDMA_DESC_DONE_MASK set, so there was nothing to catch. Worse,
  clearing desc->ctrl outright also wipes QDMA_DESC_LEN_MASK, which
  fill_rx_queue() writes as the buffer size and hw reads back - RX then
  delivers poisoned pages. That version is dropped.

- "have you tried to just increase the queue size" - yes, and that is
  the fix. Ring 4 at 16 stalls roughly every 35 s under repeated PPPoE
  dial-up and negotiation never completes; at 128 nothing triggered
  across 500 forced reconnects over 20 h. Patch 3.

- "is QDMA_DESC_DROP_MASK set when the issue occurs" - no, never, for
  the whole duration of the stall.

- default RX_DSCP_NUM raised 16 -> 32 per the vendor SDK, as asked.

- recovery pause measured at 986-1131 us over 13 events, against the
  50 ms read_poll_timeout() ceiling.

- style: RCT, verbose comments gone, and the !q->ndesc check dropped -
  the bit is only set from rx_process(), which cannot run on a ring
  without descriptors.

One cost worth flagging: the detector adds an uncached REG_RX_DMA_IDX
read to every rx_process() call that ends on a non-DONE descriptor. airoha_qdma_rx_napi_poll() loops while the last
pass reaped anything, so that is once or twice per NAPI poll, on every
ring, not just the one that can stall. Gating it on the previous poll
having reaped nothing would keep it off busy rings and only delays
detection by about one poll, since q->tail is frozen from the moment
the stall begins. I left it ungated as I have no profiling either way -
happy to add the gate if you prefer it.

A question for the airoha folks: during the stall REG_RX_DMA_IDX keeps advancing while
REG_RX_CPU_IDX stays put and the consumer never sees another DONE. Is
there a documented condition under which hw stops writing completions
back to a ring, or a constraint on RX_CPU_IDX that the driver is
violating by leaving one descriptor unposted?

The rx_stall_recover ethtool counter from v1 is dropped here - new ABI
does not belong in a fix - and will follow for net-next.

Tested on Nokia XG-040G-MF (AN7583) on a live PPPoE line, in both
configurations: as sent, and with stock ring sizes so the recovery path
actually executes.

Vitaliy Sochnev (3):
  net: airoha: handle RX_NO_CPU_DSCP interrupt, not just RX_DONE
  net: airoha: recover RX ring after hw completion stall
  net: airoha: grow the small RX rings

 drivers/net/ethernet/airoha/airoha_eth.c  | 114 ++++++++++++++++++++--
 drivers/net/ethernet/airoha/airoha_eth.h  |  11 ++-
 drivers/net/ethernet/airoha/airoha_regs.h |   2 +
 3 files changed, 120 insertions(+), 7 deletions(-)

-- 
2.55.0


