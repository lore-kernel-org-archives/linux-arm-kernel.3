Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA55C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 18:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7WZ6ucwFbC6JXfCd6WZ/sAB/uQVxlCCUJ68rPn9Ax2o=; b=4VIvDGLJ5/Q/lE
	Nf3s2Z+O+yscWbpzU8EfMhh4UNyK1tGfoV4tmvo0TUy4GxIynezAjWnhQHPtJaqRa2JJ810pHpBQd
	5PyySh9cPZgBCMYDRGrOTqJQafnnUx0Gzcf8yK0WWjVmsxcdA5w3iM2e6LHC3UWY0YVWN5ETtuwzR
	Sz+MvJ3QxhJPCWzg4tNg3c3fU4jAXcuUhgDKiFD1tJmOiRPuyiOwMQ/E/unt74iLR/5NHqTqWr+E5
	HzdpDhaGm6o4zfR0Ws1ssfYtjmk62O+mT+p7FeHx21HAx4yQOwbq8AWoYiPZ6cmvbAwa4wveqqfDU
	k5Mq3qKb0/ogtT+cidgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ii2-000000036iY-25kS;
	Mon, 21 Sep 2026 18:25:46 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ihw-000000036hB-49t2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 18:25:43 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so2851762a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 11:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790015140; x=1790619940; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7WZ6ucwFbC6JXfCd6WZ/sAB/uQVxlCCUJ68rPn9Ax2o=;
        b=LuScU3sLFNjXzQqyO2tWWWr211iSrqcdg9VnyFlDEn9TjxLHoL08SVSb7ek5UAwPlV
         rMbATXhu8kxy3pYJBZItjW6MWpIDM4emc2LhdIu9Fh807x/z2W1lg1Vkj/rFL0rRgjUw
         ivNr07xlPWDpbmqRo3J8Ikou7TSB8+NmZRnoG8OpAEi2VgUUw8BnWPCXeYzy6Ri1W90t
         8VRGyFNTJ8/jERZQUxNSK4O2t/t+hxxtbmM5WBhFZUnc+LvDWRWy3U6bExASSZgps06u
         +brv89IYE3HHyW/BEMH+ERlpk++E5VxdIOeqzpDYyWUiwv6caaVNG8S8rVMRtkZ9BEIA
         naxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015140; x=1790619940;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7WZ6ucwFbC6JXfCd6WZ/sAB/uQVxlCCUJ68rPn9Ax2o=;
        b=wQYbngJG1/rm1EjRznN9OgmrVh+nthLqQAarBQ5npOTSuQnf5u181zj6ylY9YRzvcp
         MYTe2wXacKFRdSTW6V2fNq7a6n7uyre3MiJSHEDFmlDwKX3VBSv9dMhudlDw2l+LDJMi
         Louet7X1iIgwGypWOX43kGLhBc0UKezeVoY3mE+r5Bj5db76IgzJOAtMCI99GGv3bJzz
         fcxZXL4v+l8PthwrnjxI3di/IcfX1zEGLtnS2RCLW3HzpeTteacL4gC7tK8vlpxo0yBl
         lXLH2z7uS6ZSwf0Uq/0H18bh6T8hdaYxDdg9fhbuRfG/uRL4/lONcgN5+I9odRCIRrJC
         KWoQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4Iqi9l/nwHcU2VzWMybr1PTIBo8sPVSL5FeXzb+9+vbPlLDcHUKUDAbmlccPM+r73GsyTblL8AMnGeMojWOIk@lists.infradead.org
X-Gm-Message-State: AFuF++k2KGk7YHO9g8DOvDvd1tG6Jn6gF4QUar4C2D1srYDQdeAuzTfh
	nS28Zs+BLrdMPwvBGRJ9juHs5xSixXyyDU+/+HmLeptHBGH5WRpXWyG4/PwnEurcfM8=
X-Gm-Gg: AYBFou1I3yPPlLC1yQXQP7G93lkMPiByMkV4qkIl2xOY8Z3BXFMCrKWHOlvwDCMPAbq
	vPdbfRN5CgG/Yh7iB1utkQTeXzzGGoLuenr16cc/VgJhMvMN/1Yo1Hdc1VcI1h2rXfozh3l2Y8Q
	Om4uS6b6VDqzg2P6idunStu6FrD4On894JDqW0hn9ZvQiY+TmP6mapaDymsEriAAISnBbYcKHu+
	u5bi8K+DjyyrGWqJnFU6Oj9egNh0GVvKqKplRCx9Fpp7LQ6hGylk7yFiORVcRXptxAIWW7agRcO
	axazPPYyOuUWjbxHHVHNwl10x26UZsNyjwukAnxYi/2EU0I1ZheDDGumDtSyP4MmloJZaMDZ5G2
	mrkspWWUE8LFxWrEZ4QB/+cQfOATwAR793hmGlZwqdy0hrF9kLgJBoNuvySDJGhX+1XAhNR+43K
	O4z/7TbEp/hLInj3rYYqtDz0W/X808oOsTvvDYKkxpZ3feQ/NCeNie3PKQ2Aia+bTAuE6S2sygG
	w==
X-Received: by 2002:a05:6a21:4910:b0:3d9:6f0:b42f with SMTP id adf61e73a8af0-3dd8c541c53mr19754832637.17.1790015139867;
        Mon, 21 Sep 2026 11:25:39 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144df9ad683sm12408974c88.6.2026.09.21.11.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:25:39 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v5 0/3] i2c: xiic: fix SMBus block read and PEC support
Date: Mon, 21 Sep 2026 11:25:35 -0700
Message-Id: <20260921-i2c-xiic-v5-0-2fca81e810ea@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NwW6DMBAE0F+JfI6r3TWGuKf+R9WDbZawOUCEK
 aKK+Pfa6SFUyXGkeTM3lXgSTur9cFMTL5JkHHKwx4OKvR/OrKXNWRFQDRU1WijqVSRq8hwsIEc
 gr3L9OnEn633q8+svp+9w4TgXXxq9pHmcfu5fC5bei9kFNWiuCZrOeW99+zHwOvfj9c2LKrsLP
 aRF3EnKMmJtThADWlc9SbOXZidNkTGY2DUQPJgnWT2kA7eTVZaEp7YzyK414Z/ctu0XkELjv2E
 BAAA=
X-Change-ID: 20260427-i2c-xiic-2aeb501ec02a
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Raviteja Narayanam <raviteja.narayanam@xilinx.com>, 
 Wolfram Sang <wsa@kernel.org>, 
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790015138; l=6288;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=z82WFFnTz6orAZijm6PSC8AN4/nvOe4c7HMWdDPok8k=;
 b=+f2rZdGD7vVkqwFoaOq3oqWwQUpg6Ned/tAtNmC7pzEDfyE0mRnYln8DBQOhPr8/+ynDQuHaT
 XhH0KjxjZbqD8rf3ceAC/h0Un2+vkGjKUOV9MJtbxCuReI5fg6pLDEy
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_112541_062157_72B98247 
X-CRM114-Status: GOOD (  23.30  )
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

This series fixes three independent bugs in the Xilinx AXI IIC driver
that together make SMBus block reads with PEC return -EBADMSG or -EIO
on otherwise clean transfers. They only surface when the client has
I2C_CLIENT_PEC set; non-PEC block reads happen to mask each issue in
turn.

The problems were uncovered driving an adm1266 PMBus device behind a
Xilinx AXI IIC FPGA block and reading its 64-byte blackbox record.

Patch 1 stops xiic_smbus_block_read_setup() from truncating rx_msg->len.
The i2c core appends a byte to msg->len when PEC is enabled, so
overwriting the length to "block size + 1" silently drops the PEC byte
and i2c_smbus_check_pec() then reads the last payload byte as the PEC.

Patch 2 raises the RX_FULL threshold so the interrupt only fires once
every remaining byte (payload plus optional PEC) is already buffered in
the FIFO. The previous threshold of rxmsg_len - 2 caused the
bytes_rem == 1 path in xiic_read_rx() to NACK a byte still on the wire.
The chunk-vs-defer guard now also accounts for the PEC byte so a
rxmsg_len == IIC_RX_FIFO_DEPTH PEC-enabled read does not push
XIIC_RFD_REG_OFFSET past its 4-bit range.

Patch 3 stops the BNB handler from forcing tx_msg->len = 1 to signal
completion. tx_msg and rx_msg alias the same i2c_msg during a receive,
so this also clobbered rx_msg->len; and because tx_pos is already at 2
in the PEC case, the unsigned subtraction in xiic_tx_space() underflowed
and the STATE_DONE check fell through to STATE_ERROR. Advancing tx_pos
up to msg->len drives tx_space to zero without touching the length.

All three patches are pure bug fixes; non-PEC behaviour is unchanged.
Tested on real hardware -- a Xilinx AXI IIC controller talking to an
adm1266, where 64-byte PEC-checked block reads now complete cleanly.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Changes in v5:
- Patch 1: clear smbus_actual_len in xiic_start_recv() so the trim state
  is reset before every receive (Andi). Only the padded branch sets it,
  and a block read aborted by arbitration loss or a TX error returns
  through the error path without reaching the completion site, so a
  stale value could trim the length of an unrelated later read.
- Patch 3: drop the defensive smbus_actual_len reset in the BNB handler,
  now redundant with the reset in patch 1, and the paragraph describing
  it. No other change.
- Patch 2 unchanged.
- All three patches now carry a Fixes: tag and Cc: stable. All three
  bugs were introduced together by e4c1ff772e1a ("i2c: xiic: Add
  smbus_block_read functionality"), first released in v6.3, and a PEC
  block read needs all three to complete, so they should be backported
  as a set.
- Shubhrajyoti Datta's Reviewed-by from v1 is still not carried over.
  Shubhrajyoti, if the current code looks good to you, a fresh tag would
  be appreciated.
- Link to v4: https://patch.msgid.link/20260909-i2c-xiic-v4-0-218df31e9d3b@nexthop.ai

Changes in v4:
- No code changes; resend of v3 to collect Michal Simek's Acked-by
  (given on the v3 cover letter) into each patch.
- Shubhrajyoti Datta's Reviewed-by from v1 is not carried over since all
  three patches have changed since then. Shubhrajyoti, if the current
  code still looks good to you, a fresh tag would be appreciated.
- Link to v3: https://patch.msgid.link/20260513-i2c-xiic-v3-0-ccb3cf70ba03@nexthop.ai

Changes in v3 (addresses the sashiko automated review of v2):
- Patch 1: handle short SMBus block reads where the controller pads
  rx_msg->len up to SMBUS_BLOCK_READ_MIN_LEN for its end-of-message
  workaround. In v2 this branch left the PEC byte at the padded
  offset rather than the actual end-of-payload, so the i2c core's
  PEC validator read past the chip data. Track the on-wire length
  in a new smbus_actual_len field populated in the minlen branch
  of xiic_smbus_block_read_setup(), and trim rx_msg->len back at
  RX_FULL completion before passing the message up. Addresses
  sashiko's v2 note about the pec_len adjustment missing the
  rxmsg_len < 3 padding branch; that branch was indeed the cause
  of pmbus_check_block_register() silently failing on zero-length
  MFR_* fields and skipping debugfs auto-discovery on affected
  hardware.
- Patch 3: defensively reset smbus_actual_len in the BNB completion
  handler so a subsequent non-SMBus transfer cannot see a stale
  trim value from a completed short block read.
- Patch 2 is unchanged from v2. sashiko's two other v2 notes were
  investigated and judged not to require code changes: the concern
  about removed padding in the chunked-vs-deferred drain misread
  the patch (the padding survives via the else branch and the new
  PEC-aware guard preserves the original semantics), and the
  flagged unsigned underflow in xiic_tx_space() is unreachable
  because tx_pos is bounded by tx_msg->len at the call site.
- Link to v2: https://patch.msgid.link/20260511-i2c-xiic-v2-0-c16380cb1594@nexthop.ai

Changes in v2:
- Patch 2: widen the chunk-vs-defer guard in xiic_smbus_block_read_setup()
  to include pec_len, so a 16-byte PEC-enabled block read routes through
  the chunked drain rather than writing 16 into the 4-bit
  XIIC_RFD_REG_OFFSET register. No tree-level change to patches 1 or 3.
- Link to v1: https://patch.msgid.link/20260427-i2c-xiic-v1-0-e6207f9aa5ad@nexthop.ai

To: Michal Simek <michal.simek@amd.com>
To: Andi Shyti <andi.shyti@kernel.org>
To: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To: Wolfram Sang <wsa@kernel.org>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Abdurrahman Hussain (3):
      i2c: xiic: preserve PEC byte length in SMBus block read setup
      i2c: xiic: defer RX_FULL until all trailing bytes are in FIFO
      i2c: xiic: don't clobber msg->len to signal block-read completion

 drivers/i2c/busses/i2c-xiic.c | 54 +++++++++++++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 17 deletions(-)
---
base-commit: 70eda68668d1476b459b64e69b8f36659fa9dfa8
change-id: 20260427-i2c-xiic-2aeb501ec02a

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>


