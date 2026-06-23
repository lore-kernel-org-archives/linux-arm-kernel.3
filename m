Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB077CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 16:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aohL6hDoCgWJdXA9xgE/yy8KPWEbQukKh/gs00uM5EU=; b=12kbR2cR9fDWTN
	tH5xS+SP/MCcLcuKXYBPOqeapMJ2PNZ285f556FBUjwlu/K2KxF9j2IpwBJHrAPQK7xXUJS0ugEV4
	9KkEDrkJCNOevGl7IMuyE/mpqLP7sYmBQTq/p6WrzatfO6u9Uxoj3PNjuFxB4zjkbVXYa0/41rLNZ
	m2/+FIMytg+jxmlSQSPBbhqF81U5dqX+83+O/NobIKDrCpVY+6g51DJ7ZOUdRHZaO+kgvap2rBgAB
	ViJaIEnL4xI91ApUZbmsvrZRElAHCiZCjcDNJkdpGWsAnRPN5a0Tf6+odX83ioPyCcXxVBt/8fYgN
	7TSCSKkDztqfmQifHrpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc431-00000006d2Q-2zf9;
	Tue, 23 Jun 2026 16:32:27 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc42x-00000006cyj-3Oi4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 16:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1782232343; x=1813768343;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=7D9n4G2VjlN0quJaHg5EJso3RvCYIN2+BPYWUvKiBhE=;
  b=rTdcenS1EI4I3yk7p4zSFKs8sppwOXtsDLuUou/cHOhHI+KjgIfgQX17
   Pns5NIlF2De8+E56mY/xWbzAw4P+4EJ1W6uosjxGgbQpS6aKSOjz6+ZN4
   vVLS3hlfJI1AWWjuGh/wfxva6T8pQsbHdsXGjf8NamncqWbDE7WrNidBQ
   eCL8lGhmYz75oPTZf8VGKl+z1wxpCYYEcKuVECjTNLWV1ysrIIr4fsCqg
   oZcEPgwDXnHfox5B8330EBUc9SLvtK/p2uJAmoZwqOL486Taxys2uAUUw
   ezSWJZhMGrMMQIe4Fd4+H15R38/DfYZIURBBltVuHS+jhzwOPT0oOj3IB
   w==;
X-CSE-ConnectionGUID: nFvDdvEHSKuJi7qhGz+91g==
X-CSE-MsgGUID: 4oC86uQcQ/GxIKpIoWdS0A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 19:32:19 +0300
X-CSE-ConnectionGUID: QoDWkqHUTOuIdYE3NPUUvw==
X-CSE-MsgGUID: DSID08ozSY2lIAbbZOkm2Q==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 23 Jun 2026 19:37:27 +0300
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Tue, 23 Jun 2026 19:32:18 +0300
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Subject: [PATCH 0/7] I2C - detailed transfer reporting in case of a fault
Date: Tue, 23 Jun 2026 19:31:47 +0300
Message-Id: <20260623-i2c-fault-reporting-v1-0-6db1a8aabf18@mobileye.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPS0OmoC/x3MMQqAMAxA0atIZgMaoVCvIg6lTWtAqqQqgnh3i
 +Mb/n+gsAoXGJsHlC8psuWKvm3ALy4nRgnVQB2ZztCAQh6jO9cDlfdND8kJLQ3GWxejpwC13JW
 j3P91mt/3A5KDRu9lAAAA
X-Change-ID: 20260623-i2c-fault-reporting-9236c9affc2d
To: Andi Shyti <andi.shyti@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Dmitry Guzman <Dmitry.Guzman@mobileye.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_093224_347533_1C93AE09 
X-CRM114-Status: GOOD (  17.79  )
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

In this patchset, the introduced functionality is implemented in
`i2c-nomadik` driver. Several other improvements in this driver related
to fault handling are also included in this patchset. It has been tested
on EyeQ6H-EPM6 board.

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

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
Dmitry Guzman (7):
      i2c: add I2C_XFER_V2 - support for detailed transfer reporting
      i2c: nomadik: optimize layout of struct nmk_i2c_dev
      i2c: nomadik: do not try to retransmit I2C message series on errors
      i2c: nomadik: return proper fault codes
      i2c: nomadik: change print level for fault messages to debug
      i2c: nomadik: add quirks max_len=2047 and no_zero_len_read
      i2c: nomadik: add support for I2C_XFER_V2 - detailed fault reporting

 Documentation/i2c/dev-interface.rst |  46 ++++++++++++++++
 drivers/i2c/busses/i2c-nomadik.c    | 105 ++++++++++++++++++++++++-----------
 drivers/i2c/i2c-core-base.c         | 107 +++++++++++++++++++++++++-----------
 drivers/i2c/i2c-dev.c               |  79 ++++++++++++++++++++++----
 include/linux/i2c.h                 |  12 ++++
 include/trace/events/i2c.h          |   6 +-
 include/uapi/linux/i2c-dev.h        |   9 +++
 include/uapi/linux/i2c.h            |  21 +++++++
 8 files changed, 306 insertions(+), 79 deletions(-)
---
base-commit: 502d801f0ab03e4f32f9a33d203154ce84887921
change-id: 20260623-i2c-fault-reporting-9236c9affc2d

Best regards,
-- 
Dmitry Guzman <Dmitry.Guzman@mobileye.com>


