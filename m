Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49A9CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M+WV/M9sCxg4oVrUwsnl0xElto9Nq++mIAPkSFcaPZo=; b=SHeLUIjK0DmapI
	miTXES2tL69QyqrZGhIJU55DZ56/mrOccekb9ZwdfqRTVXuwMRyWmFf4DrMmc3atWdoK1/BID/bCq
	SPo1Liky2ipX/Aoh/ZDMtzuaiTZd0nftjwH5Oji1th+wksIkH11uFk/LyfRj0K9tnvnMqrJ2xAIxw
	Sltequ1z8yPdBoZIw8mWfcrXA5pjB77NL+CObjdBcteucIapXQlFecTjlmQbup33rmVyOCY5dUulo
	x12OQhFPSXlIh6i/OCFosWpn8zPjUQSzqQAII52yVTlMArZcqfHUtvS50yF5s4mZynnZjf/pgDXnm
	XQKRsGWpUX+vgz3KirdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6Wx-00000002761-1IFQ;
	Wed, 13 May 2026 10:09:31 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6Ws-0000000273R-3X7x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 10:09:29 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-134ac81c445so495516c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 03:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778666965; x=1779271765; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M+WV/M9sCxg4oVrUwsnl0xElto9Nq++mIAPkSFcaPZo=;
        b=hPxZDckxNDwfdC/9o7Cf79nGE4hW8QxBaQKf9iY90v8v45aWi03BseQ7KBNZ7X/D+k
         eXs2nmX7AVu0bO4JR9U7V5BbvxIHMxDGBBw3KlwHxrFaDfKkl8SqslWyhgtXkQ6gY3WY
         fma7CBRAFLH3m+6DjVAG2Yq3hawhqdpk738d5Pph7vHMUAOzf41BLMvfNNhibqBf4Iz2
         jpRZ8HRpfbDhEMO4ZYkBgBWFfrnBTwhhna+fciIODBJcPX2wXw0/bn4yqA1tzRuFr91H
         8BO8CP8xPdcSy6EvVuT7B7IStr38dw3SQvAcFn/dJW8cs9qNaktqkyPqrO4+BNExfB9b
         aEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778666965; x=1779271765;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+WV/M9sCxg4oVrUwsnl0xElto9Nq++mIAPkSFcaPZo=;
        b=NibwK3mhn/jSMqhBrcgps7xkbD3UI1+WvxJt9FReWt40ZL7GptlCjaC67mDwr7xr+v
         1jMoPb1E7zXz7jsdrzKgdtKckT2gD8QvxasG4FBWK7IulbI3N8v11r9TsVvv8InKTQvq
         qb03OE5nJo8b2TjRvGqXfLAC7NSINXPiNlON+ojc2m+fAm4dfcwl5PkW6dsIroQYD/31
         PBbXBpNiAWxJxa1FbdFmuVESuKPSucP/Xc04Jen7vorRzmfuszWLOcLiPQAJPQXNpMCh
         6EPGs9ux5yaSZm38w6pP6HiGWPwAonZ7SSPZPKpCE632qyzEz5f3zau1omX6zmUANWSL
         HPVQ==
X-Gm-Message-State: AOJu0YyEd80s2lnM1iaTxYjQbnEa7CleLm1V5eEB839T00F37ucHaOkc
	WKes6kD/jL4RNpkM51RIasLZ0prGRvxpmmMzf1/jmUU+LQwl7Lpo9te6jXkHmIVWKNw=
X-Gm-Gg: Acq92OFjnmkgSe7ZbjpDOnKx9+SQVonvTx8nCQxcNIJT5RXp/b7E79uA9T0AJ4qzV/c
	1/jEg9Y9xFxjb4Q76/aIyRVwCHHJEwKuh6dadND1oWl7HBA3SYtefz1qPv00uUWIhUe+1yhZTMK
	4IiMhmPiVeDnJsSz8eAkIrldZkkZIPJShf3hCd9/ee/hQxR5hdEQbQgztjZxYNjqKqT/FWGEcOH
	VAW6wKTZcOW3lqOtKc8lkoIleqvwWXUXyBOFp3jDajIuN/uSVI/TAf1MVoV5gkKv/aiwtcHrwEu
	bmYvYcIp3gfb3RIA7lrcuwv041eTfSMDSID29v4/NgVaC7RFSGBgPmLIwXXF4jxx/LLB7kM5sI0
	OGrTsQ4CKGf01V10Ak+FJHBrCI6+CZkxD0blDEACs/0oPVWc4nctRvvRIH77vIEqsHKd87b562n
	35UG1wNwcA1OzjVktDQ43XxayZDhE9QAw+KFx0
X-Received: by 2002:a05:7022:ec8c:b0:12d:ea4f:99de with SMTP id a92af1059eb24-13428b94b05mr1542456c88.0.1778666965091;
        Wed, 13 May 2026 03:09:25 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-132787673ffsm29430265c88.15.2026.05.13.03.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:09:24 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v3 0/3] i2c: xiic: fix SMBus block read and PEC support
Date: Wed, 13 May 2026 03:09:21 -0700
Message-Id: <20260513-i2c-xiic-v3-0-ccb3cf70ba03@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANFNBGoC/22NQQ6CMBBFr0K6tqYdKKgr72FclGGQcQGkxQZDu
 LstLtTE5Uv+e38RnhyTF6dsEY4Cex76CPkuE9jZ/kaSm8gCFJSqgEoyoJyZUYKl2ihNqMCKOB8
 dtTxvqcv1zf5R3wmn5KdFx34a3HP7Cjrt/mSDlkpSCapqj9Ya25x7mqduGPeWReoG+JhG6y8To
 om6zA8Ka22OxY+5rusLyUL6Ru0AAAA=
X-Change-ID: 20260427-i2c-xiic-2aeb501ec02a
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778666964; l=4599;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=PzxUW1DNjcl44XkB1JuwkIwAKhSKInH4tg3oF/0gwyI=;
 b=mJDPH4cweyl0MFWuO5Mf6LeZYckeVb4rLBuXwUD0udCirdUzHfiAMxZfMEAfCH9YxjPJGyLfj
 8GwEDoyPKTWCQS7YXAKT0dF20SRW0uHr66VlE0tH81aReZ7S3NRpLtN
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_030926_900761_C3EADC1C 
X-CRM114-Status: GOOD (  17.36  )
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
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Abdurrahman Hussain (3):
      i2c: xiic: preserve PEC byte length in SMBus block read setup
      i2c: xiic: defer RX_FULL until all trailing bytes are in FIFO
      i2c: xiic: don't clobber msg->len to signal block-read completion

 drivers/i2c/busses/i2c-xiic.c | 67 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 50 insertions(+), 17 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260427-i2c-xiic-2aeb501ec02a

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>


