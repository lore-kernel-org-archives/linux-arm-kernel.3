Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DFE606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 23:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LwhQ5LZX;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=fUNAteZQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4+rS0wK0oVNjux8X4W6P7uAb/RVdgsNqhchwPp6akbA=; b=LwhQ5LZXS8FOIdp6ZaaHqNRl2W
	ToIk2jwPy0+thzT71H4e/KFxJDN8udwDlB/CXmUjpnIJ89DgWiNWY5PEj5BVU9QBqbUaUVL6JTgx0
	tFlp/2n6pCBC9wDdCJfwK7jANv+GlVfd97gKkBdub9MUWX4rYMqEmglOgYrTG/XuBVZ9qBksD9nTW
	asxcbzJXUrP/mzgGyrJpr2eUebDhg9ue+oDqBrLhOfnvVYdnu0b35sM0kH+VmJ4lFSNdjF6gnPAd6
	xBUmfINzj4RRllFTRZ4w4hT+8WmRMJGEPJnX4cjhD+bU3t/6q0KYVQeK7UtLXb4vh5pIczUP+KVNw
	BPXNc4Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMw6V-0000000CjQz-40qC;
	Fri, 30 Oct 2026 23:33:47 +0000
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.77.92])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMw6T-0000000CjQW-3Ywk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 23:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793403225; x=1824939225;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4+rS0wK0oVNjux8X4W6P7uAb/RVdgsNqhchwPp6akbA=;
  b=fUNAteZQOCR3LXoizhsAS1MXOxnRD/G+Au+Lrnmt3LBwifmF1G8PVSIB
   /UPxUD4RxEB/aNs0GJkZ+CzJHhPouXrSWWPaBhy+UBt3c70gtMAcxaCHV
   Lll94DBz9Ef2j7HLwCuZ/5J8u3BHBF3ggOsu3bLg0MCv2XUrT7kTZ7Cmu
   7CGk8v/QzDRRJXm9D0JIucUEY6747gZc32qv15pTmA0+QeWJ20BkUNZ4L
   VhdZ+nJWYeYv1zW8qIPE4EVgy5hiNynPMFqLW520kUoc9NbZjApM6wXF+
   5fR/IIFjGB9DFV4LGXspQhXpYxrrsiF9MjgIHth0k3d4/sXxRZ3vUHl2L
   A==;
X-CSE-ConnectionGUID: 4UoJthxyQJyZqYOlQWKSMQ==
X-CSE-MsgGUID: SdOzf7QYSdaHTdIx/n2sVw==
X-IronPort-AV: E=Sophos;i="6.27,186,1787011200"; 
   d="scan'208";a="32707811"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 23:33:42 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:16913]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.15.208:2525] with esmtp (Farcaster)
 id fbf9af3f-28d4-4345-b824-9a52f8440b54; Fri, 30 Oct 2026 23:33:42 +0000 (UTC)
X-Farcaster-Flow-ID: fbf9af3f-28d4-4345-b824-9a52f8440b54
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Fri, 30 Oct 2026 23:33:41 +0000
Received: from dev-dsk-patrzhan-2a-52a3f46b.us-west-2.amazon.com
 (172.22.91.11) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Fri, 30 Oct 2026
 23:33:41 +0000
From: Patrick Zhang <patrzhan@amazon.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol
	<mailhol@kernel.org>, <linux-can@vger.kernel.org>
CC: Pavel Pisa <pisa@cmp.felk.cvut.cz>, Ondrej Ille <ondrej.ille@gmail.com>,
	Harini T <harini.t@amd.com>, Michal Simek <michal.simek@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/3] can: enable NAPI before starting the controller in three drivers
Date: Fri, 30 Oct 2026 23:33:27 +0000
Message-ID: <20261030233330.3483988-1-patrzhan@amazon.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA004.ant.amazon.com (10.13.139.19) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_163345_951513_7F502DBC 
X-CRM114-Status: GOOD (  20.27  )
X-Spam-Score: -11.9 (-----------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Three CAN drivers open the device in the order "start the controller
and unmask its RX interrupt, then napi_enable()". Each of them has an
ISR that masks the RX interrupt before calling napi_schedule(), and a
poll that is the only place the RX interrupt is unmasked again. A frame
that arrives between the controller start and napi_enable() is handled
by the ISR, which masks RX and calls napi_schedule() on a NAPI instance
that is still disabled. napi_schedule_prep() sees NAPI_STATE_SCHED set
and drops the schedule. napi_enable() clears SCHED without scheduling.
Nothing ever polls, so RX stays masked and the interface receives no
data frames until the next close. In ctucanfd and xilinx_can, transmit
keeps working. ctucanfd counts no errors, so the failure is silent
there. xilinx_can counts RX FIFO overflows once the FIFO fills. In
ifi_canfd the TX wake-up interrupt is masked too, so transmit also
stops.

The affected drivers are ctucanfd, xilinx_can and ifi_canfd. The fix is
the same in each: call napi_enable() before the controller start, so
that an early RX interrupt can schedule the poll, and call
napi_disable() on the error path if the start can fail. ifi_canfd has
no reset in open() outside its start function, so that patch also
splits the reset out of ifi_canfd_start() and enables NAPI between the
reset and the start.

Patch 1 (ctucanfd) was tested on QEMU with the ctucan_pci device.
Patch 2 (xilinx_can) was tested on a Versal board. Patch 3 (ifi_canfd)
is from code inspection only. I do not have the hardware, so it is
compile tested only. The sequence is the same as in the other two
drivers, and I would appreciate a test from someone who has an IFI CAN
FD core.

The bug has been present since each driver was added, so each patch
has a Fixes: tag pointing at the commit that added the driver.
Patches 1 and 2 are marked for stable backport. Patch 3 is not,
because it is untested. The patches are independent and can be
applied separately.

I looked at the other NAPI users under drivers/net/can. at91_can had
the same persistent-mask pattern in 6.6 but no longer masks RX in its
ISR since the conversion to rx-offload, so I left it alone; ti_hecc and
virtio_can start the device before napi_enable() but do not leave RX
masked, so a dropped first schedule only delays the first frame. All
the others enable NAPI before the device can interrupt.

Changes in v2:
- Patch 1: add Acked-by and Tested-by from Pavel
- Patch 2: correct the commit message, which said no error counter
  moves during the stall; the RX overflow interrupt stays enabled and
  counts rx_over_errors
- Patch 3: split the reset out of ifi_canfd_start() and enable NAPI
  after it, with synchronize_irq() in between, so the poll cannot race
  with the reset (reported by the netdev AI review). This replaces the
  ifi_canfd_stop() call proposed in my reply to that review; see the
  patch notes
- Patches 2 and 3: name the related fixes by subject
- Rebased on current linux-can main
- v1: https://lore.kernel.org/r/20261021205924.2538511-1-patrzhan@amazon.com

Patrick Zhang (3):
  can: ctucanfd: enable NAPI before starting the controller
  can: xilinx_can: enable NAPI before starting the controller
  can: ifi_canfd: enable NAPI before starting the controller

 drivers/net/can/ctucanfd/ctucanfd_base.c |  6 +++++-
 drivers/net/can/ifi_canfd/ifi_canfd.c    | 17 ++++++++++++++---
 drivers/net/can/xilinx_can.c             |  6 +++++-
 3 files changed, 24 insertions(+), 5 deletions(-)


base-commit: abeacca61eea4f6803df4a595b656ea45c2d3249
-- 
2.50.1

