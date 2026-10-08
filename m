Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9A8CA600D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 16:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=85BR7qHH4G0CBb5vxlCQpLUFJ3RuaLjxlde617uk3v4=; b=StLdI90Aud3KkhgjDWji78blnF
	GNGEmd/NjOoa+558jda6BwvOOEojKUg8hEIN6u1Q69o2kf1nrzL1RiagS/AHbo4tWJATib3eCr4j3
	AUkIyZOup4TSHOAcgi/m3IXuRtXPrcPjFc+9E7COr6td1Wm1VwzpdVJUoR+6PNC/SHIsAb6z9CVq8
	M5zLgJ/vjStJzT5WhgGdvS2RF8r6yGZxh1L+9YKRUDQukdWvz2uJCj8oiUZnLASag3iuC7lEzYx30
	d8/ZCkZmWZm6iRcYpvPTFYTgfNlqiPWRHGtQfFOo3zWgMbfM4AincrvA0P6HUOmHKeoUzCuIzlkyb
	+uY4iEaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEqZy-00000004e9n-3Lsk;
	Thu, 08 Oct 2026 16:02:46 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEqZv-00000004e9K-44Ly
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 16:02:45 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2e836252e1dso1349685ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 09:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1791475362; x=1792080162; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=85BR7qHH4G0CBb5vxlCQpLUFJ3RuaLjxlde617uk3v4=;
        b=Mz4bqRvuVbkQ9hHzbnQEv6RWzlGo80i/4VMpFA2yGnExStuxrZ7hBmm+szAtsrHE2c
         BnCm3tXJzGNrh9sFTGqhvnIM8XYconIpUk5pSXhKfbFQe9uk3jj2fw9LtGSGjWbitWOF
         YApoiQn1uS6cPqyT9fAXyFwbmtYRKdbZHBShLe+3Rxk+zojgO+ZWOj53tWFkqzoE116Y
         I+GU50WKQ9uCcztRCsa+9wUzWmJjgp2fKPgCrNbmn3XkqGZANIYhoeCCmBaZcfsupyD7
         +Z8oFLNHXCRoedLGH3pTmm95j15Q4lgJarTbsPt+DA0xJKvXKU292nc7yfBwtFOlggau
         3zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791475362; x=1792080162;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=85BR7qHH4G0CBb5vxlCQpLUFJ3RuaLjxlde617uk3v4=;
        b=LZ0izXVqor/X3kyvcIEIT/OFDV735tsHA5FwjXPnphV+tiywF8mY7m5i97/sqx516J
         k2iXcLrk5Ne/A8gWSbcKASLFlQxOrQRnVBL+jck/kPMa+uZqt9UihXchX7OMwDoLfYI+
         rhKjJGRZMv7Hd09o2p4MsQNBDxxc2ADzoADLGBq0ojyH37Ftqy6gntQoNikRrxI7OKMj
         Rd+guIs9k+WY3cjO0ZdnweyF9A+vFSLl2ZArhVlYTd9bQ+0RfSPtBc4Jx8PviO4u8BB2
         LFKv3788pE5aiD3PTqR/u+rotrTdtb4WVIhEyNpUuiD284VusPvv/gb+5CcWKV5LXEBH
         vdkw==
X-Gm-Message-State: AFq9FYJ3M5m+Ht8MWuO1oZbfgIzZm3CsbbbgLDyn86y5priOWxTbRldJ
	zoN6+2hbfNLXMCi9DpD01zy/OmcZTbsFRWFKnntOBiJlFgXEQKaKthsSe9yLfk+Rkzo4UPQiNYf
	g7DiKhlQ=
X-Gm-Gg: AYBFou3/vpupqWMwvwP3CKV+Esk1VLvI+RickRECxLNZbfIBPwihEtzGgSMv1335ekD
	EDdjhTqwzUpS84TlyIAULZpbZ7lWYTunhKwMBhRy5JRnFy2klkwxG4wG9VSGXX4FRv4tb1zqS/b
	X9/OEilHll3ygp3k3b8AUZ/8+ia0wfi8y05TiCUbwcV8WmEKFb3m0s6T0a+pJR45xt+E4nnn1jd
	bWLruePCwgitm0CFbaHERWdYnD2Dt9/aL/VloMXqHKE+Oz3cYJPObEKIaKOHPHc5ryIQr6+r3Ho
	u9eiwnO2RvG+duqwjhCXKvC3yzX0WNbjnUmo16hyC9ZKP9OcMKkiwr+NpCDUS3veWvUzuk0WIwU
	ZIlfksA9+6qfMl+C2yD6j9KnPGMBOFPS6/A0SjtBra3HBYjFQejwYb0RYDbcSIgrDGJHbuAaWk0
	8ju590nl7HGbneIQByS9/qcIuhGEWnPsXN0yFH8fC9hYcAOuAX91YIuqBL4GshB0Xjb4+GlzuxR
	A==
X-Received: by 2002:a17:903:2a84:b0:2e3:980:dfd6 with SMTP id d9443c01a7336-2e6004e9e7fmr50032605ad.38.1791475362381;
        Thu, 08 Oct 2026 09:02:42 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60494c323sm27461895ad.69.2026.10.08.09.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:02:41 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 08 Oct 2026 09:02:38 -0700
Subject: [PATCH] i2c: xiic: NACK the last byte of an SMBus block read
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-i2c-xiic-block-read-nack-v1-1-94882af6e598@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrDsQIyr0KtJFMjPW0RIl0SKId
 2+0u/ct3n9AkqiS4FkcEOWrSeeQUT4KoMGFt6ByNlhjm9KYFtUS7qqE/jPThFEcY3B5sfVtVXv
 HzBXk+xKl1/1Od6+/0+ZHofXqwXn+AHNvzQZ8AAAA
X-Change-ID: 20261007-i2c-xiic-block-read-nack-d2b735baddd3
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Siddarth Chilukuri <siddarth@nexthop.ai>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791475360; l=4822;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=1I3B0zE9Jl3k4SV939nOeTDGmvV7FCqaULnQQve9RFk=;
 b=WCxGw45Y+qEC2HCOsv+UZ77Ta8l/WlwVssXmZA2am4P0cqqr8eMPr1NWWN5yHOfRg+bHusd3a
 4omlow0Y9A9BczNCaat7wN3FVEnQikLdXd1ANff9FGIVbAKr2Elz5GB
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_090244_035480_042A719B 
X-CRM114-Status: GOOD (  21.58  )
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

Commit e6fe3ea04f01 ("i2c: xiic: defer RX_FULL until all trailing bytes
are in FIFO") raised the Rx FIFO threshold for an SMBus block read whose
trailing bytes fit in the FIFO, so that the drain takes xiic_read_rx()'s
bytes_rem == 0 path. That path skips the bytes_rem == 1 branch, the only
place that sets NO_ACK, so every trailing byte is now ACKed. Having had
its last byte ACKed, the target goes on to drive the next one, and the
STOP that follows lands in the middle of it.

Some targets ride this out; others are left wedged until the next
transactions clock them free. A TDK FS1412 fails the two transfers that
follow any block read, so it never probes: pmbus reads MFR_ID as a block
and then VOUT_MODE as a byte. A Renesas RAA228246 and one RAA228244 on
the same controller show the same pattern.

Program the threshold so that RX_FULL fires with one trailing byte still
to come, letting xiic_read_rx() set NO_ACK for it on the bytes_rem == 1
path, and set NO_ACK straight away when only one trailing byte remains.

Twenty rounds per device of a block read and a PEC block read of MFR_ID,
each followed by a byte read:

               before                      after
            block  PEC   byte after     block  PEC   byte after
  FS1412    20/20  0/20  20/40 fail     20/20 20/20   0/40 fail
  RAA228246  0/20 20/20  20/40 fail     20/20 20/20   0/40 fail
  RAA228244  0/20 20/20  20/40 fail     20/20 20/20   0/40 fail

A second RAA228244 and an Infineon XDPE1A2G5B passed every round before
and after. PEC block reads, which that commit fixed, still pass.

Fixes: e6fe3ea04f01 ("i2c: xiic: defer RX_FULL until all trailing bytes are in FIFO")
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: stable@vger.kernel.org # v6.3+
---
A follow-up to my xiic block-read series, now in 7.3-rc as
b7e6df2f52ed, e6fe3ea04f01 and 840d8acc8792. The second of those
stopped NACKing the final byte of a block read that fits in the Rx
FIFO, which leaves some PMBus targets wedged for the next couple of
transfers.

Tested on a 6.12 kernel carrying that series, against an AXI IIC
controller with an FS1412, RAA228244/RAA228246 and XDPE1A2G5B behind
it, using plain and PEC block reads and the byte reads that follow.

The same happens on a second board, where two of four ISL68225s behind
the same AXI IIC core fail plain block reads and the two transfers
after them. A capture of SCL/SDA taken inside the FPGA shows the
mechanism: after the last byte of an MFR_ID block read the master
drives ACK, the target starts on the next byte with SDA low, and the
STOP the master then attempts never appears, leaving SDA held low. With
this change the last byte is NACKed and the STOP is clean, and all four
pass.

With this change a block read ends with a NACK, and so with TX_ERROR,
like any other read. That puts it in the window Siddarth's patch closes,
where xiic_process() sees TX_ERROR before RX_FULL and resets the core
even though the data is already in the Rx FIFO:

  https://lore.kernel.org/linux-i2c/20261005-i2c-xiic-rx-fifo-v1-1-0177ac5f72d7@nexthop.ai/

The two touch different functions and apply cleanly to v7.3-rc6 in
either order.
---
 drivers/i2c/busses/i2c-xiic.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 5e397a7e63f6..2714fd2231b4 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -568,12 +568,24 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 			i2c->rx_msg->len = SMBUS_BLOCK_READ_MIN_LEN;
 			i2c->smbus_actual_len = 1 + rxmsg_len + pec_len;
 		} else {
+			unsigned int tail = rxmsg_len + pec_len;
+
 			/*
-			 * All trailing bytes fit in the Rx FIFO. Defer RX_FULL
-			 * until every one of them is buffered, so the drain
-			 * takes xiic_read_rx()'s bytes_rem == 0 path.
+			 * All trailing bytes fit in the Rx FIFO. The last one
+			 * must be NACKed or the slave keeps driving SDA into
+			 * the STOP. With one byte left, NACK it now; otherwise
+			 * fire RX_FULL with one byte still to come so
+			 * xiic_read_rx() sets NACK in its bytes_rem == 1 path.
 			 */
-			rfd_set = rxmsg_len + pec_len - 1;
+			if (tail == 1) {
+				u8 cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
+
+				xiic_setreg8(i2c, XIIC_CR_REG_OFFSET,
+					     cr | XIIC_CR_NO_ACK_MASK);
+				rfd_set = 0;
+			} else {
+				rfd_set = tail - 2;
+			}
 			i2c->rx_msg->len = rxmsg_len + 1 + pec_len;
 		}
 		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rfd_set);

---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261007-i2c-xiic-block-read-nack-d2b735baddd3

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>


