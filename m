Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0D9CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 07:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ApVd1CA9+2PtZ+qnzo0V8UDDKzunnP6ByyqG2o/Ag0U=; b=PqW4N98euWYf7S
	8uWVpTZGQLgK2aG88HzJIALY/37RImIPKInk578KYgx7hgHdO+r6EfNECrR79Cjc6qOecwesiw1kT
	XVbkecfJn7PFNk/QMmlw985KmWJOl1Pmgi6ozIC55knSucs4GgZRjDnjmtdoZ6cz+I5fBFtpQvcC3
	q47tAWjO9eCRTdLaGBlwUdfkpb/s1ejSLT9GoOhPNaHs9M/8/zJHwpnCpZq+YAtftEVstiMEwt0N9
	vGDKcJYd4eGaN9kgTEI6RWhQWwVEf2EM0x0CsnQKOXiDTdBgl5kyoeBmsurymYdaGOJpfKVn+waV+
	t34FiO9ZfTXLa6DRpGlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLLR-0000000Ce81-2eza;
	Mon, 11 May 2026 07:46:29 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLLN-0000000Ce5Z-2RRO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 07:46:27 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2ee990e8597so7079167eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 00:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778485584; x=1779090384; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ApVd1CA9+2PtZ+qnzo0V8UDDKzunnP6ByyqG2o/Ag0U=;
        b=I6vZpVmJP7q+1iIHaeU4AzbraFqe+nBFYMeZ3yEjT3u5da2EdvHtxCKqe0KmJYmKWZ
         PIlM8KFKKiBfCeM10U4wIKjn/QbZrl0o3EpStrxqdU26Zr1yQHASB+LwObCPp0dEcSid
         Jk/QbEqXgRB3+Ky/UWlWmkXmkrXfVxZdaHQdlDXMcVj+jHq1e1Z+ZUHx6deTqcBcpsN/
         OQvF2HDwP69neKbaNSkSalYGlB0iiscSyky3Mo1l9vq0PbOiA/pGH/i7OGhcT3uVZp5m
         OJOCNBdzkzErRqc1ZjRmDe+A2hffOo1WeKmTAo8cvaca04SBseGYFMENAIJynWJMRMjU
         e7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485584; x=1779090384;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApVd1CA9+2PtZ+qnzo0V8UDDKzunnP6ByyqG2o/Ag0U=;
        b=qCLnLbz3XyoKJKmR/vw0BOXYlGXVWM11HD4NlflBigA9jc+unl1tmpG5QhuzNqhEwZ
         pbO58QTM20t8FUs4Cv7IW7SZ8vn7KB9V7sPIFh8ZeqABKchEBEXWrwigPZ3ZqzN1b0ZF
         j3MX1MeYRKhRq1YCV4KG9KjpJnW8N+b6nTjSgeFXL0fnD6Hm5wtieWOOb1eDdo3j9WHq
         ZrJwEU9YKPo8LO7wW2mO9Xuwo3lhaAUh4KEYk5FdZzr6YvYFydRFuOHQi9Sy0HaSDVcz
         NnvBDUopjssEcHeEQrgkI8CJmswuigESfDFB5yzBnDS61kYu8AjNIIQwemytmsAgAioJ
         I+dw==
X-Gm-Message-State: AOJu0Yx+IpeI/6jHDdPiY5gF7spMMT8zMcBXe3zevqGuVZ/OIEN2T80G
	7J8L0fjKuXZgDdCQCztzzSnnAmsqXyHgw5oXedU9vlmq7EGLuyGCs//7VGoY7l2whfZCIds72Ws
	JJIuqV2g=
X-Gm-Gg: Acq92OEQelH3dGXLeoXCmE6xzfG70O4HjDtQxFPCjlOn1e6KYZlwL/C8ma9E0UfRO95
	Wyds1BV4p3pGSNwRIwwAv6buxwbIeudQJDMOylLMW9I70qLT3X9uqViN6uIlxfVKvV6fr5X9lDM
	Ex8er2qymBLI3Hudm0/jz/PN2uAFSj3fsvh4ueFv9VSufsMC5yrX7gqkQXpe/Ft77HafzzvqO/Y
	v+F9gVINvZy7h0VxlzbbKzmcnFOCi5rg1HpP7y0gl0M3pIQO6Bx2yAyK6zXhb1y6GZtURqqVZd+
	LiF0cz77kXcycQXHwHAxm9g+iuK0jbUIEHjdVXrC2voYTUs0rRc6J17fDvvgnCqhUfkbGHPMU8i
	z4qhEHKY25Te0wf8JVhvlHBVe0tbHbtLTdFLFSbCtv7SdJR9IXrIIjVvz1vZ96xf0C4ucci8Bl2
	3FJv5Zxiecq/X7rdNEamjZFUe/J8dYa9eUYUb4
X-Received: by 2002:a05:7300:214f:b0:2ed:e15:c924 with SMTP id 5a478bee46e88-2f54bd89309mr11460917eec.32.1778485583962;
        Mon, 11 May 2026 00:46:23 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e381c9sm12205702eec.26.2026.05.11.00.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:46:23 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v2 0/3] i2c: xiic: fix SMBus block read and PEC support
Date: Mon, 11 May 2026 00:46:11 -0700
Message-Id: <20260511-i2c-xiic-v2-0-c16380cb1594@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEOJAWoC/22NQQ6CMBBFr0JmbU2ZCERX3sOwGMpgxwWQtjY1p
 HeX4tblS95/fwPPTtjDrdrAcRQvy7wDniowluYnKxl3BtTY6gt2StCoJGIUEg+NrtloJNj11fE
 k6Ug9+h/79/BiE8q+GFZ8WNzn+Ip18f5kY6204hZ1N12JGhrvM6dgl/VMAn3O+Qtj5QGuswAAA
 A==
X-Change-ID: 20260427-i2c-xiic-2aeb501ec02a
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778485583; l=2988;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=u5XSrbEDmvqVlQGoyi69nKTGBePD+Zlvy4U3aX6kxbQ=;
 b=DJATSELAqT/i4+OB5Z0NXKmIkGtocX0gHTh2oeoSuMdLxJjkQaymTAncaH3TG31vcQty5no9O
 /H42oDuNzIIC99+4uE1bcYEAVDACo7KExF2gTv7ubbpjLnAMEiv6jwt
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_004625_638233_A54C1F20 
X-CRM114-Status: GOOD (  13.79  )
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

 drivers/i2c/busses/i2c-xiic.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260427-i2c-xiic-2aeb501ec02a

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>


