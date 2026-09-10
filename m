Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CA4C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 03:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9tvnuGvnbgY2VToM5oSZ6NV1NviBjBV50tr9v/KS1Rw=; b=e2gmO2k+CmZSMM
	wEByWLv+EUTnhgVMCmym37FyaZEKglAyY+aGtlpJf9okUACRnx/SKLdnfYhfroWZ8IiZXTK1cSQbD
	ft/a+WeUBO7NeS9yQAazYuxk4BbOnTWLHHCMS42z/kDQJ5YR/leegh1S7olTOVr2oQwrbOjHH8Lx5
	wctZqlusGMo/VOKkebQbxHz5ynpR911zMaAp+TCBOLUH1jKFK/KzQBETBYmJg6AKkDgKO0va6kIsA
	4jR4vGDfp1rA2jXK8GNkf4kFsLGVSKRWGKplBOho2mEes54Y+qU0YdScW0fNU2xCviJ00aWzutGXq
	BYEXxfjNkuBAb2dVGYpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Vdz-0000000DJYV-0gDV;
	Thu, 10 Sep 2026 03:40:11 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Vdw-0000000DJWe-2Qvc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 03:40:10 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d90ba1d807so12175575ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 20:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1789011607; x=1789616407; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9tvnuGvnbgY2VToM5oSZ6NV1NviBjBV50tr9v/KS1Rw=;
        b=hFKsKw7xUE5iSjibxlNO+4CDr81tTLo+TOWgDPGLKqa+WlSXs6GxqMC6gQbBg2A968
         HLnCUyssvUhoEQrKIhKVOJLE0k77/+CYHAqwwIU2WmnicankqwkJHDXvRhgNQJ2G1T+N
         aVmDVuR/fYIZbvVz/VsRw96dM8bS4niOyFKWkTM6UQXcAWquZrxAF9odP68Jo1J5Pqtd
         oYkpFYXbCD5rgfcLE5M0it+c3T6J5O+D9EVOimpqaEg8GonPz82MJYvajxBbcdazuMK/
         6xkT+FkUj0RHPlwxM5iT+X4rjOLD2DyWEW46iRyIfE1KU4GiN21ssGy9Iw925fZyln3Z
         iDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011607; x=1789616407;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9tvnuGvnbgY2VToM5oSZ6NV1NviBjBV50tr9v/KS1Rw=;
        b=WKh4g3OTPaBRRjmzR2tjRiRNBuY1hIklD0qTrDkG+vJ1wR0u8hnl2QjHUjIdxeQUU+
         g0aG7241l15zA+t7nGDNqxuuNUAYvefHBdBB/uDXFKwpLesx9rSqoSY9Iv0txXcnvLCW
         50a3c7b8iANgo5UEoliMn8UJiVWV/0wZ4aD1Dby7/nXqiVD/up5kMWI5LP1DYRCgvly7
         A0zY/jh9A3xszRMcYl8ABq5c03d/hDVgAY6dqOCdzuJM2Qp7CbzhiSvUb3Ypqly2VyTx
         Ybj0aycMFCgJSOJaYDQGx/jaEad+YDerXPwZtlrGezGpEfW8RevwXVrtDrvwgfFF2fbD
         Gohw==
X-Forwarded-Encrypted: i=1; AKwUvBzC/Cwruw08slBmxoyMzhTtQkL+VMrLNqx+gV7pVY+RM7F+/85rgBPW9PMCOhUXSzWFAuAUNnhlCwOoVIWQe7gE@lists.infradead.org
X-Gm-Message-State: AFuF++k03+yVm39HGNfDeQIj1LYffuCnWnoBwB9Q5ijq0h7aUg5FtekF
	sXJf1hiKVbK698HXWN1shI5zIi7AbVoRRKRtA5z81Rv6UhciioHeR2u1eP8KaFNAAsc=
X-Gm-Gg: AYBFou3fW2G61UdfBx4Qx6q39MubXCaew/OCBFXq+UnfBR4BtRlRmF79WdBhNdlNmDI
	GVvshsiW3x4DA00JRN/Yq1WgE0P26mq2lYHiP6Sb4K6jbnIJLOMbjhzRlcYBBQE89waxGYE26dC
	6sEfgotnty+3flXmaLo9nsvhRtmCWyajY35sQjIotbRxI9mlvetl7UPAgu0wmzMHr3iMTiaPpCS
	kCGqQgsBYpzK9DHT8ESe3PZCmO/MvmX0W6dSis1/Vsi7Lx5ZACrvGxyxsDYlcskbbLyUwSEsk7Y
	ezhPoxJ63GUTKY8h0VubpcO6QhaMPPMeRL4Bq/JolGkKkFBmlytWHKR1YMlf2EbS4DZ7puGYL/x
	Apz4zYF7Zz3Ex/BrxvjTV7cnBXCM1YvUlQT5AFf9YuoZPAh5a4eOAl5//h9qvJg2moLSH6T6dMq
	QiBCcA43VsISqHaqwxBwbwhMXt3b+YEMhcGkOfquW0Md1LmNUIzMNulZDX3FTXNeiHyGrAAOy4T
	g==
X-Received: by 2002:a17:90b:4d82:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39d70b1c7demr6759612a91.19.1789011606787;
        Wed, 09 Sep 2026 20:40:06 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm58294850c88.5.2026.09.09.20.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 20:40:06 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v4 0/3] i2c: xiic: fix SMBus block read and PEC support
Date: Wed, 09 Sep 2026 20:40:02 -0700
Message-Id: <20260909-i2c-xiic-v4-0-218df31e9d3b@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NzQ6CMBAE4FcxPVuz3fKjnnwP46FdF1kPQCgSD
 OHdpXgQo8dJ5psZVeBWOKjjZlQt9xKkruaQbDeKSlfdWMt1zgoBM0gw14KkBxHS6NinYJgAnZr
 rTcuFDMvU+fLO4eHvTF30sVFK6Or2uXz1Jvb+zPZGg+YMIS8OzqXueqp46Mq62TlRcbfHj0yNW
 UmcJZnM7oG8SQ/Jj7RraVfSRkneUpGDd2C/5DRNL/JdYaUnAQAA
X-Change-ID: 20260427-i2c-xiic-2aeb501ec02a
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789011605; l=4845;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=fbHi+gXipZ3MdJzUzGm17xyICy+psgM5NB9TegAjnbE=;
 b=eDbI2iJM9vlheW6MkxLftANxs15Q0mkunMHPY+vnwmNkGk9UhcI0COOQSQQkgyjLbZLAg15V4
 WNvZR3kEIlbBURSHHd2H5X8EFDVCg+GZcFxab0YYLifnqs1W+ib0/an
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_204008_641402_836C6A09 
X-CRM114-Status: GOOD (  19.44  )
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

---
Abdurrahman Hussain (3):
      i2c: xiic: preserve PEC byte length in SMBus block read setup
      i2c: xiic: defer RX_FULL until all trailing bytes are in FIFO
      i2c: xiic: don't clobber msg->len to signal block-read completion

 drivers/i2c/busses/i2c-xiic.c | 67 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 50 insertions(+), 17 deletions(-)
---
base-commit: 70eda68668d1476b459b64e69b8f36659fa9dfa8
change-id: 20260427-i2c-xiic-2aeb501ec02a

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>


