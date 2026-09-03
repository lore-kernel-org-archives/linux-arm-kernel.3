Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609DFC624DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 05:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e0L5I00LVPm1n5KknkVUHbQar9pWV7FvX71s/9jXU4U=; b=PnUTJdg7lubzCX
	iQi/A6CpLULPDSzpldmy4r27qdDgVNdnCuERnXBVSWvVYC82gfZVaLWaC9zL45K6RSlfl7t+1GvIw
	PoOvNSXcIbrVkq1Ib1cJmCBra/Jqhn5CEhKXofTBr0PmIRQMJDuSU99NhcANVS9VYeCMHQymxrOdj
	Y7pA8iwmfp17pvfwZTQnHfpH87tAt4z+PEnJkx0O2WU49RLAP9PAXMKblEjCBGqe3SwazNAYe7Ly+
	0dB+GsML3BSDvWCoBtlbRUD+LQvkKtEB9qzj/btuqXHK2T0owEUy283UnqM516eA+u1/RjIi+k95k
	I6YnA7DvRMlLaEKeb2+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x209u-0000000GPMA-2fTq;
	Thu, 03 Sep 2026 05:38:46 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x209p-0000000GPJi-0kcG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 05:38:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1788413921; x=1819949921;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=DGHMa0elmHe7zroIZqViDotdXzPUEOAZSse6uP5DSf8=;
  b=rRSInq62k4yz9tf0WeM7nRm4WUbNsV+4jlh7G9Ii+mtjRso3My5GqPl0
   9x8jI8EM3kJtojrAQqPGy+gOoCpOJUu/k5aStfxNfx/0agvxNSdHuk+N3
   fFncF+s/flqfWXC1Qf8HngfDxY9YjR47XcMW/qh6DW3v/bLTJp+bwpnxx
   0PfdBts57cTzu8cZjpNaqfaHUjUaoeDigHv8zgdQzGYHGTdx2Y2misLXV
   zDcohNse1BhmgcPlsNcBGdTriP3OpX3sHiV9P1Syk3zr5Gn+gA72GJFdC
   Xkn4Z4Ac4olYpZrBrIM4N/S9rvX8+vBwULzHu71ldaQ+tswkqJ6GxRVMn
   w==;
X-CSE-ConnectionGUID: HwvXeYcWThWecnr8u3ngag==
X-CSE-MsgGUID: eAjQHc2aQXO0OmiFZTH/9g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:38:37 +0300
X-CSE-ConnectionGUID: 1R5tgvQmQ1eeiTDezhVfyQ==
X-CSE-MsgGUID: DRImNC4JT0mItxgK7dbeRw==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.2])
  by ces03_data.me-corp.lan with SMTP; 03 Sep 2026 08:45:04 +0300
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 03 Sep 2026 08:38:35 +0300
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Subject: [PATCH v2 00/12] I2C - detailed transfer reporting in case of a
 fault
Date: Thu, 03 Sep 2026 08:38:07 +0300
Message-Id: <20260903-i2c-fault-reporting-v2-0-fedeb91792e6@mobileye.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL8HmWoC/32NQQqDMBBFryKz7hQzQtCueo/iIsaJDqiRJJWKe
 PemHqDL9+C/f0DkIBzhURwQeJMofslAtwLsaJaBUfrMQCXpUlOFQhadeU8JA68+JFkGbKjStjH
 OWeohL9fATj5X9dVmHiUmH/brZFM/+7+3KSxR950ytTGdU/Vz9p1MvPPd+hna8zy/ranRl7kAA
 AA=
X-Change-ID: 20260623-i2c-fault-reporting-9236c9affc2d
To: Andi Shyti <andi.shyti@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Dmitry Guzman <Dmitry.Guzman@mobileye.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_223841_701454_AADA8CB0 
X-CRM114-Status: GOOD (  22.69  )
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

The existing API has function `i2c_xfer` that transfers one or more
messages, and it only returns a single error code if the transfer was
failed. It doesn't allow to know how many of the messages were
transferred successfully, neither how many bytes were transferred in the
message that caused the fault, and also it drops all data received from
target device before the fault. There is a comment about this in
drivers/i2c/i2c-core-base.c: "REVISIT the fault reporting model here is
weak".

This patch series implements new API function `i2c_xfer_v2` that does
the same as `i2c_xfer` but also returns detailed transfer report, including
number of messages and bytes transferred before the fault. This also allows
client to get the bytes read from the target before the fault occurred.

For user space clients, new ioctl `I2C_RDWR_V2` is introduced.

Patch for `i2c-tools` user space utility that introduces support of this
feature:

https://lore.kernel.org/linux-i2c/20260623-i2c_detailed_report-v1-1-b67259a31a9d@mobileye.com/

A usage example (the first message changes the target address, so the
second message is not ACKed):

    # i2ctransfer -r -y 0 w2@0x20 0 0x55 r1
    Error: No such device or address at message 1
    1 out of 2 messages sent
    #

In this patchset, the introduced functionality is implemented in
`i2c-nomadik` and `i2c-designware` drivers. Several other improvements in
these drivers related to fault handling are also included in this patchset.

`i2c-nomadik` driver has been tested on EyeQ6H.

`i2c-designware` driver has been tested on EyeQ6L+.

The implementation is split up into patches:

Patch #1 Introduce callback `xfer_v2` in struct `i2c_algorithm`,
	 function `i2c_xfer_v2`, ioctl `I2C_RDWR_V2`, structures for I2C
	 transfer reporting and implement all driver-independent functionality.
Patch #2 Optimize struct layout in `i2c-nomadik`.
Patch #3 Remove automatic retransfer in `i2c-nomadik`.
Patch #4 Fix error codes returned by `xfer` callback in `i2c-nomadik`.
Patch #5 Replace `dev_err` with `dev_dbg` on I2C faults in `i2c-nomadik`.
Patch #6 Add quirks that describe some limitations of `i2c-nomadik`.
Patch #7 Add support for `xfer_v2` in `i2c-nomadik`.
Patch #8 Fix error codes returned by `xfer` callback in
	  `i2c-designware`.
Patch #9 Reset SMBUS_READ_BLOCK_DATA bit in functionality mask for
	  `designware` variants without EMPTYFIFO_HOLD_MASTER feature.
Patch #10 Terminate transfer if spurious STOP is detected in
	  `i2c-designware` driver.
Patch #11 Separate `i2c_algorithm` structure for AMD_NAVI_GPU variant of
	  designware controller.
Patch #12 Add support for `xfer_v2` in `i2c-designware` driver.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
Changes in v2:
- Add support for detailed transfer reporting in designware driver (patches
  #8..#12).
- Change `unsigned char` into `u8` in patch #2.
- Added code-review trailers for patches #3..#7.
- Rebase on new kernel version (no conflicting code changes).
- Link to v1: https://lore.kernel.org/r/20260623-i2c-fault-reporting-v1-0-6db1a8aabf18@mobileye.com

---
Dmitry Guzman (12):
      i2c: core: add I2C_XFER_V2 - support for detailed transfer reporting
      i2c: nomadik: optimize struct layout, change unsigned char into u8
      i2c: nomadik: do not try to retransmit I2C message series on errors
      i2c: nomadik: return proper fault codes
      i2c: nomadik: change print level for fault messages to debug
      i2c: nomadik: add quirks max_len=2047 and no_zero_len_read
      i2c: nomadik: add support for I2C_XFER_V2 - detailed fault reporting
      i2c: designware: return proper fault codes
      i2c: designware: no SMBUS_READ_BLOCK_DATA without EMPTYFIFO_HOLD_MASTER
      i2c: designware: stop transfer if spurious STOP is detected
      i2c: designware: use separate `i2c_algorithm` for AMD_NAVI_GPU
      i2c: designware: add support for I2C_XFER_V2 - detailed fault reporting

 Documentation/i2c/dev-interface.rst        |  46 +++++++++
 drivers/i2c/busses/i2c-designware-common.c |  23 ++++-
 drivers/i2c/busses/i2c-designware-core.h   |  14 ++-
 drivers/i2c/busses/i2c-designware-master.c | 160 ++++++++++++++++++++++++++---
 drivers/i2c/busses/i2c-nomadik.c           | 111 ++++++++++++++------
 drivers/i2c/i2c-core-base.c                | 107 +++++++++++++------
 drivers/i2c/i2c-dev.c                      |  79 +++++++++++---
 include/linux/i2c.h                        |  12 +++
 include/trace/events/i2c.h                 |   6 +-
 include/uapi/linux/i2c-dev.h               |   9 ++
 include/uapi/linux/i2c.h                   |  21 ++++
 11 files changed, 489 insertions(+), 99 deletions(-)
---
base-commit: 940de590b839f71d6dc846160534bf202401b8b7
change-id: 20260623-i2c-fault-reporting-9236c9affc2d

Best regards,
-- 
Dmitry Guzman <Dmitry.Guzman@mobileye.com>


