Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6ED1CA6018
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 01:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cfdw+audQWp9HNvQGo23exvCo4IIEY6hjGNhPZtb1Is=; b=2SK189JbbD4qBzV8GhGeUkmHiP
	K7Gny3+nBs/xlpEZRuHO8lB/dP1TyIreUsHeJXP5rat7J1LHqB9VvnVsEY5B2O3XNH2Ecek4iF6Oe
	10SGSbt6Qh7pd/2LbQYdljwBTtxYzNd7p1QnWR0fDvo9ba2uATboPzagSwYuNdZ2afiBnmWhqZs4x
	A5gd+At8oXL+4WkBdsG0J4SQ/tp1gzaJ/uiQLm1yfQFmYsXqPsTEgBE8DfM40dV8Ml+0FJevCzVBf
	PnL0+iCYzz3muRd15xfsKzLOORsOmP4gcOIYhl0yCI0og1D3ZVHsyY6kC1TFP7NFNX03Bq3BsmvyW
	S+su+ajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEyzo-00000005Dpk-0ZLh;
	Fri, 09 Oct 2026 01:02:00 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEyzl-00000005DpA-1GWb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 01:01:58 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-3518cbe59b0so852248eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 18:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1791507716; x=1792112516; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cfdw+audQWp9HNvQGo23exvCo4IIEY6hjGNhPZtb1Is=;
        b=g5IJofXtiBmmIMnAqIt+DhcHDNrI/14YQpH4Fh4vlgKsmYNiHdxWSV2Vb28YscVQ5u
         07hT9Vo2WdH5hFkg/AKSsnXyTMP1+fpPf+2FPTYaiDW7jnJWbWS5GlYAOAeRC5rU6bOf
         eIjNtKbNuIls1hQfaD4vTYYaiI8w+1Dllc6XbDVdN94ueT9k3nxyWBN1LTV3HIaD0K/N
         jZpFh5OJqnPCncSfUaBB/OymqJJTmcs2SMIpM0XOw1fAq4I3yTz6Q4Y6sEv9vEIgwDN5
         agVdKfySEM7Kr95mwrnaqlHKz+LSaP0E0nTNim440PY70M6tvWonvCECMj+zFGGPC1iG
         2vVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791507716; x=1792112516;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cfdw+audQWp9HNvQGo23exvCo4IIEY6hjGNhPZtb1Is=;
        b=RM0AKKWCdLDwRC0nGkpezDAHm4Z8g7IiXNAFJLNKTjxOuTDS6RiaZ+NviEAJSf0emD
         +J3jZtPj2la1EaYYR/Dy+T3v2kLJcykRYSnxNN6PKbAQBvqf50zuxCOigE/y3/u8mo43
         IDHZNdnKp13H8tvUnl31HWIxMAb9OxzIl7CQMAFKg1C6JcKyFcZIwhy2Q1ejtarP+iMN
         7YNSJdRlYg6nLjqKfBOzzonZoUWh3TtX26pKjSWP50fBWITNSCBoEc5xofyKU9CuAil1
         w0CIICTYu8YfdQjxr9fq/JFlcWM/LvV59zWlSnJgR2tXC1ECte5kUNE8zPtU/j1sVRZk
         qdiA==
X-Gm-Message-State: AFq9FYI5Fn+Upw1EgI97/1E/FIKMsdS28ybHMT+cvri4ZoeDicZTmGtg
	66zF7bvMFmRdMrO1PtK9t5Ydjzgs9ky8auJCuCyob3LX6h6A/HxHsd11CqGzYLz4HvE=
X-Gm-Gg: AYBFou1OFVqjxi7/k5/TyNkOxPGOEoEVTUaX6oRU+JU7GzC51YHsvRDvZPWNE/i0yHi
	P/oK/h9tGSuk5nIFJC0HMEZTJrrTzr37AUkDrEqqUskyDT1aNNy07XWx4Z59Fc46idvtNGkJP7m
	ALkNBmS2tJtCc6a+CErJQ5dHqqJtoq5bLA+cPhCd/Tzu6bDmwDCMRwYceRrKno1kNTm0HBp76EY
	uXFDXyHKB6M0wBCUH3/aKrahAPtTtrqJwujpjEO4+T0Q+48hB+CczDzD7EDDeEJk+fgoe6C259B
	jTNQHLTunfx59dZeJv+H0sOJ7SwgtK2O9AuKRoCnLblAfCJcX+/DLZc0k7OE0wUEEUC2DaxCMIi
	JYZ+BYKPF6Q+6jSHsOO1QwUybTsZ8Y9SBPPcRYtaqhoCDwoUBqtPhcYwIFvqmX8nJtT98vzaymA
	JOYDml1pRi8RC9BhMxOwqxCRJQU+LpeLH4UreiWbEo3B/Q3iXnE4jX+sNveF3XEli72weQ9t90C
	Q==
X-Received: by 2002:a05:7301:71a4:b0:351:8d12:8d51 with SMTP id 5a478bee46e88-3537e029678mr656518eec.12.1791507716097;
        Thu, 08 Oct 2026 18:01:56 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cad9e53sm1828189eec.22.2026.10.08.18.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:01:54 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 08 Oct 2026 18:01:51 -0700
Subject: [PATCH v2] Revert "i2c: xiic: defer RX_FULL until all trailing
 bytes are in FIFO"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-i2c-xiic-block-read-nack-v2-1-76735ed0b0bf@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBREf4V07TW0CBRX/odh0cdFrpqWtEgwh
 H+3YFy6m5PMzFlYxEAY2TlbWMCJInmXQBwyZnrlbghkEzORi4rneQ0kDMxEBvTTmwcEVBacSsk
 KXRelVtbagqX5ELCjeb++tl+OL31HM25/W6OnOPrw3t0T33o/jfyvmThwaE5SCtVVWDby4nAee
 z8cFbF2XdcPj+4utNMAAAA=
X-Change-ID: 20261007-i2c-xiic-block-read-nack-d2b735baddd3
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Siddarth Chilukuri <siddarth@nexthop.ai>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791507714; l=6106;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=VvsfpHaXhPNuOESsbmKbjgRvCxu9b+24W1f2Ek0pgic=;
 b=/KyL2DEQwNeonF4R2JIRTXoPa/R37jOZKzBl58ZI/KbkjAxzRoUZW15Fu1AHYWej2PQxpNhaU
 /VCjW/w3r/xB4GHtakMz3rYqKCPkhGfVPvwld0UWk/LLDV0xLnscUNd
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_180157_359345_1F62F682 
X-CRM114-Status: GOOD (  24.67  )
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

This reverts commit e6fe3ea04f0113fe4d47c03d76e03805a4768ca7.

That commit raised the Rx FIFO threshold for an SMBus block read whose
trailing bytes fit in the FIFO, on the grounds that firing RX_FULL with
the last byte still in flight made xiic_read_rx() NACK, and so truncate,
that byte. NACKing the last byte does not truncate it: it is how a
master ends a read. The byte is still clocked in and is drained on the
bytes_rem == 0 path that follows, which also issues the STOP.

What the higher threshold does instead is skip the bytes_rem == 1
branch, the only place that sets NO_ACK, so every trailing byte is now
ACKed. Having had its last byte ACKed, the target goes on to drive the
next one, and the STOP that follows lands in the middle of it.

Some targets ride this out; others are left wedged until the next
transactions clock them free. A TDK FS1412 fails the two transfers that
follow any block read, so it never probes: pmbus reads MFR_ID as a block
and then VOUT_MODE as a byte. A Renesas RAA228246 and one RAA228244 on
the same controller fail the plain block read itself and the byte read
after it.

With commit b7e6df2f52ed ("i2c: xiic: preserve PEC byte length in SMBus
block read setup") and commit 840d8acc8792 ("i2c: xiic: don't clobber
msg->len to signal block-read completion") in place, PEC block reads
pass at the original threshold. The PEC failures the reverted commit
attributed to the threshold came from the bugs those two fix; all three
were developed together against an ADM1266, which rides out the extra
ACK, so the regression did not show.

Twenty rounds per device of a block read and a PEC block read of MFR_ID,
each followed by a byte read:

               before                      after
            block  PEC   byte after     block  PEC   byte after
  FS1412    20/20  0/20  20/40 fail     20/20 20/20   0/40 fail
  RAA228246  0/20 20/20  20/40 fail     20/20 20/20   0/40 fail
  RAA228244  0/20 20/20  20/40 fail     20/20 20/20   0/40 fail

A second RAA228244 and an Infineon XDPE1A2G5B passed every round before
and after.

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
the same AXI IIC core fail plain block reads and the transfer
after them. A capture of SCL/SDA taken inside the FPGA shows the
mechanism: after the last byte of an MFR_ID block read the master
drives ACK, the target starts on the next byte with SDA low, and the
STOP the master then attempts never appears, leaving SDA held low. With
this change the last byte is NACKed and the STOP is clean, and all four
pass.

PEC block reads do not regress: 1000 PEC block reads of MFR_ID per
device, each followed by a byte read, on the FS1412, both RAA parts, the
XDPE1A2G5B and a further RAA228244 passed without a failure, both with
this revert alone and with Siddarth's patch on top of it.

With this change a block read ends with a NACK, and so with TX_ERROR,
like any other read. That puts it in the window Siddarth's patch closes,
where xiic_process() sees TX_ERROR before RX_FULL and resets the core
even though the data is already in the Rx FIFO:

  https://lore.kernel.org/linux-i2c/20261005-i2c-xiic-rx-fifo-v1-1-0177ac5f72d7@nexthop.ai/

The two touch different functions and apply cleanly to v7.3-rc6 in
either order.
---
Changes in v2:
- Revert e6fe3ea04f01 outright instead of moving the threshold back by
  truncated), and with b7e6df2f52ed and 840d8acc8792 in place PEC block
  reads pass at the original threshold. The code change is the same
  single line as v1 minus its tail == 1 branch, which could never run
  (Siddarth, Sashiko): reads with fewer than two trailing bytes are
  padded to SMBUS_BLOCK_READ_MIN_LEN first.
  Sashiko review: https://sashiko.dev/#/patchset/20261008-i2c-xiic-block-read-nack-v1-1-94882af6e598%40nexthop.ai
- Link to v1: https://patch.msgid.link/20261008-i2c-xiic-block-read-nack-v1-1-94882af6e598@nexthop.ai

To: Michal Simek <michal.simek@amd.com>
To: Andi Shyti <andi.shyti@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
hand: that commit's premise was wrong (a NACKed last byte is not
---
 drivers/i2c/busses/i2c-xiic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 5e397a7e63f6..76ef9c26ed57 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -569,11 +569,11 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 			i2c->smbus_actual_len = 1 + rxmsg_len + pec_len;
 		} else {
 			/*
-			 * All trailing bytes fit in the Rx FIFO. Defer RX_FULL
-			 * until every one of them is buffered, so the drain
-			 * takes xiic_read_rx()'s bytes_rem == 0 path.
+			 * All trailing bytes fit in the Rx FIFO. The widened
+			 * condition above guarantees rxmsg_len + pec_len >= 2,
+			 * so this cannot underflow.
 			 */
-			rfd_set = rxmsg_len + pec_len - 1;
+			rfd_set = rxmsg_len + pec_len - 2;
 			i2c->rx_msg->len = rxmsg_len + 1 + pec_len;
 		}
 		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rfd_set);

---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261007-i2c-xiic-block-read-nack-d2b735baddd3

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>


