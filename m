Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBD2FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 00:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L7zCK9SoOwwyw2JGl5V8XqCOVYXnfPWvhYkrH4ssZ7U=; b=0h/U1ThVJ1q+vSFyQibpFEHmqE
	gIu194IAglYCLKhBLImhlWWebmJsAECQhRPOtpQ8c2wXUYc2UHVcTTkmRv2xQ5U8oWPEf8D1DfLNI
	m8dPKDmRtZrqLGX4eRnn07OmKuBN94JGlgc5aqu0YRGbaZYXH2dwD0+50wON/18F2Y3/gqOfzmHW6
	9j+EDr7Brlsst/6GahAncc5V0x7V+8PvOv3/B5w7vRbTwpx51bTjYsQVtGPsxILGuMUW5lFGPjyA9
	RYgaT/TBrpJ45EdmVOG+GQOWeF6HDs/N+AqdzBJirL+lONdZ7VUh2Zl8fzy6NBlxp3kc6TW9r/a0B
	w61hVihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHW9c-00000000Kdq-1CGX;
	Tue, 28 Apr 2026 00:18:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHW9T-00000000KaS-2uIE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 00:18:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EEFB41567;
	Tue, 28 Apr 2026 00:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C828C19425;
	Tue, 28 Apr 2026 00:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777335490;
	bh=CsiHZ5vb7Sf7aVyvtEGZ7+CNeUx8W/SFG7JbsXLjEQE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Ou9HWgAWpBeePErzoQtCce8S3PWmyMP2WhR/V0s0A9Bod3jf+PusGVYD18z0QfjlN
	 6UD5FuWmiylBa4vWydKoWnn/Xf0ZsJCjqsfDKPqLERYppyfBpPF2/r7m7bJ8kh5P2Y
	 Ojligkc0ohRUwKmvLgVgW8SbJbNzeZ0NSqDsUSA+/avOqr8hovXDpglsOP+KJJTkIG
	 B65esENZh7ozi9GZ+kOi4FMfmZqge7b4en7vO+qJgjBffKeo6joPP+zqwD9LgR1wcV
	 Pqkg7kjjS2t3fkNncxrIk+cS8SGcljGuxfLyc46HYw9hCyn7mIw1e0wZA8AwBcOiRB
	 hNOW+bqH/k6dQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E22FF886D;
	Tue, 28 Apr 2026 00:18:10 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Subject: [PATCH 0/3] i2c: xiic: fix SMBus block read and PEC support
Date: Mon, 27 Apr 2026 17:18:05 -0700
Message-Id: <20260427-i2c-xiic-v1-0-e6207f9aa5ad@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL3872kC/yXMSwqAMAxF0a1IxhZq8ANuRRzUGDUOqrQqQuner
 To8cN8L4NkJe2izAI4v8bLZhCLPgBZjZ1YyJgNqrHWJjRIkdYuQQsNDpQsmjQZSvjue5P6uuv6
 3P4eV6Xj3EOMD+w3U4mwAAAA=
X-Change-ID: 20260427-i2c-xiic-2aeb501ec02a
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2226;
 i=abdurrahman@nexthop.ai; h=from:subject:message-id;
 bh=CsiHZ5vb7Sf7aVyvtEGZ7+CNeUx8W/SFG7JbsXLjEQE=;
 b=owJ4nJvAy8zAJbYltPXv6rsCXxhPqyUxZL7/c1CCcemG8lNB+zimTlrSqKJ59d31H1dZVm4w5
 98clSr9LMigo5SFQYyLQVZMkWXOI/83bR1tERtiDtnDzGFlAhnCwMUpABOZspaRYfvjn5c6/q7r
 K/zJrHWW7Wi07ZYaD+d7W91UKkJ+MvtfMWBkuPRz4joViehXlfpOOT+yFizSF1rYPEfR2m31H6k
 rynYrmQAl5VAE
X-Developer-Key: i=abdurrahman@nexthop.ai; a=openpgp;
 fpr=9CE24FEC86888658B05CC23FB45585FDABDD10F4
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/default with
 auth_id=756
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_171811_778004_141FE041 
X-CRM114-Status: GOOD (  11.28  )
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
Reply-To: abdurrahman@nexthop.ai
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
Abdurrahman Hussain (3):
      i2c: xiic: preserve PEC byte length in SMBus block read setup
      i2c: xiic: defer RX_FULL until all trailing bytes are in FIFO
      i2c: xiic: don't clobber msg->len to signal block-read completion

 drivers/i2c/busses/i2c-xiic.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260427-i2c-xiic-2aeb501ec02a

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>



