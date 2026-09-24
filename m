Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25374C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 01:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z4iKJgi7tP9mJr36Cxt/ObqVMb0Szzyv3xqf2EEz8Ts=; b=OeRalv0vEXYDfB
	TKwfcjRaxY/obPIKoqyA5dw62IfTaUwBBAGubX7KehkIqgCYPFNlD4yjN519zxykInjVoeQ7g4mtX
	5IJmkpM+epcJgr+7uog8Vy6VbgvBPzl+2apAlo+/Sfm1mD4SarYx4X1YUnzn2ZlfDjk/2OUqnjlRs
	rGPoC4d4nraS2fZUJq2MZCk7fDJncfKXQ8RRZGRev9ldIV/RO9EjrHs2+sIj4uXg8VL5iwwM2VoSF
	fo03BvQoJy7lOn3nouevftNQLyrDjAtRr+zmYKXpRUeREYAXjL5eDdEYJtqho1+33D2scwnC/xcTv
	b+VReCoHt9G/b501rsRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9YWv-00000009ovM-2oUF;
	Thu, 24 Sep 2026 01:45:45 +0000
Received: from mail-dl2-x0e.google.com ([2607:f8b0:4864:38::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9YWs-00000009ouZ-3NBe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 01:45:44 +0000
Received: by mail-dl2-x0e.google.com with SMTP id a92af1059eb24-144f089b1e3so1384076c88.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 18:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790214341; x=1790819141; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z4iKJgi7tP9mJr36Cxt/ObqVMb0Szzyv3xqf2EEz8Ts=;
        b=OKhdlmQFh7SlTUGqSaI60MKwpy+CoJCIS+k2q1Goa2DyizPsQwwxKvsDYzpqyaciOZ
         4l3QpwXhVBA+1TjLAa+mANxUj82ja3+/ueQ4GJDJqhdORvrlQ0nRhxcoXfrJPzi/aFlf
         E7G6TbZ00ajtCL+EldjK6xGJw63IgSJFhni/iBhS/8C1Cvr7207VaB5Mleiffl8sCt/F
         gvKbO65uNWDYjKwS5JZXDngcoghDGt2l2+qGoAOcA5pPsCX/qjM3rnmnFGuC0giZQVxw
         CqFYkdftgVPLtkKVtkV9OTR8t689aGwfTDFPDrbqgwcFIC4vA/QT9X1OWrMYUUVUYMtP
         dg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790214341; x=1790819141;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z4iKJgi7tP9mJr36Cxt/ObqVMb0Szzyv3xqf2EEz8Ts=;
        b=tIUTuXEZfZ0T/Q5jOg6dg2P76ACznPIoFRiFexu7hIkMEAmGIcWGrcdP2wAxbJpqY8
         q8jeteGf6RDD413Ht0CpsZj/euT7zvStfOdnS+lfEXfLltmb3ULQrsXJivAutBGfKdWo
         9LylLBRoYpo/0WlnO1xFIDOHFhwQLsMvZstB4v/KkVUMifsB5hUOke1UwERkaqy3dnEj
         dG9+xw1W1DnkAVzmcLRUdlvuxYGr1eBenPz90/P3j3dARL47GTMU0iMdjmXCv26bclSV
         MGDa0tUol2Z8vr3gMXndmIDRiNYcyvMsHY0lApSNLhG6wTp5jqjKmBTxk1ugv122E0SJ
         k21A==
X-Forwarded-Encrypted: i=1; AKwUvBwZiylgdfUKMqN7/MhsYD5Qc4Na6+BvBo1JgtX/kL6oZyJz7vpE7dj+KDq3zI6ng3R9bIne6MDw3Rbe27B574x/@lists.infradead.org
X-Gm-Message-State: AFuF++lNujHrwQqWOoD7nZCmwIA/5joElNwSTxvQbU1LS/w6NWdw7aq0
	u+UTF2yeP0NnaXLRFzhLpnF1x62LfnJMIN/rRuq/LpeQvV1XlfC6h2a2iBzOhoUhmVo=
X-Gm-Gg: AYBFou3oMV6hjVTaLoYNkneY0XaUnsJbwdbrccgbmlwGX1XB9VfD6bv92xm4wyHRbpe
	QIwCGO8UgGC798WJLE2trpDScE3eoPmiVJxuPq3nbo+hiTL5gMNl2YYzn/6X+nuF55LqTp/mvOM
	nMMf3IxgYibl+OjrS9eXMrkwcOq0QPhoHVbVlalesGdTCRtpYpBSCoVYR3W/E3wbLgjUPJxWz4t
	6pHuH0Tc9Z6hp7fQ0bTFgKCvE3wv9Y27qm5Rjn+sBKttrQY9FpMo2FNvEVya/9P5fR+VHWhOWAP
	Rpr/nbiXAgbv6zcbg/4Iu3QncZyHRVJDuJQSphQY1NyASM9Gtdu8NRfuvLjlScBthRcWx3DtjqB
	lh81zLaUaV10Tlb5WHrvHrJ+LCMRU/rxCdVvVeH4/urEv5sseex+Sh1i5A0+akYx6UnyT2x46BP
	BOI5iLqnNxv1bqZRQz48qRbhwaBXoH2DRjj0+HX4UFanGPqDnjOWktWru+GSgBxSXK6aYOnmUIA
	A==
X-Received: by 2002:a05:7022:108d:b0:143:7cca:e14 with SMTP id a92af1059eb24-14503f6a36emr566935c88.12.1790214340945;
        Wed, 23 Sep 2026 18:45:40 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14501794269sm2927598c88.8.2026.09.23.18.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 18:45:40 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v6 0/3] i2c: xiic: fix SMBus block read and PEC support
Date: Wed, 23 Sep 2026 18:45:35 -0700
Message-Id: <20260923-i2c-xiic-v6-0-3a15b6397f5a@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OwU6EMBAG4FfZ9GzNzJQC9eR7GA9tmUo9wIYiw
 Wx4d9v1sDV4/JP/+2duIvESOYmXy00svMUU5ymH9uki/GinD5ZxyFkQUAsNdTKSl3uMXpJlpwH
 ZA1mR69eFQ9zvU2/vvzl9uU/2a/GlMca0zsv3/daGpffP7IYSJLcEXTDWaju8Tryv43x9tlGU3
 Y0eUiNWkrL02KoevENtmpNUtVSVVEV6p3zowFlQJ9k8pAFTySZLwn4ICtkMyp2kriTV3+oig7c
 9co/A9o88juMH8mUNRJsBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790214340; l=6768;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=yGtXtCYinasdAFxp/SWjOdDVLqrPg7lxhXfn7Zxmgk0=;
 b=ZntK8vvb8eZuSwnNMfSKNtHX/ynXJZAvqc+vDq3/jm2ZMZ2T2ad0sF32ghHGbKBO7HAUUEWMl
 M3s8wyovRaeA7HFb1Y813Jz3PYqEoLe4fiYSLS7H24rR2OfH0c83mvk
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_184542_856646_C86CD5FD 
X-CRM114-Status: GOOD (  24.34  )
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
Changes in v6:
- Patch 1: also trim rx_msg->len in xiic_recv_atomic() (Andi). An
  I2C_M_RECV_LEN message forces standard mode for the whole transfer,
  so an atomic SMBus block read reaches the same padded branch but
  completed without the trim. The trim moved into a small helper,
  xiic_smbus_trim_len(), now called from both sites that clear rx_msg.
- Patches 2 and 3 unchanged.
- Link to v5: https://patch.msgid.link/20260921-i2c-xiic-v5-0-2fca81e810ea@nexthop.ai

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

 drivers/i2c/busses/i2c-xiic.c | 60 +++++++++++++++++++++++++++++++------------
 1 file changed, 43 insertions(+), 17 deletions(-)
---
base-commit: 70eda68668d1476b459b64e69b8f36659fa9dfa8
change-id: 20260427-i2c-xiic-2aeb501ec02a

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>


