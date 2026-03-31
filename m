Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDCB10F92E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 16:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WknxB7BlqisH6Zvww+cbKHxPeTuxJGYJCxx5qD7dZkE=; b=VG9yknlWLMLsX/xit5N1vLI1S0
	8Iik7aLOgqXzC6y+Op3GUXlJDMI4SzZ8P5Z8OZH6UI12eNOkTI9FvcHENyDY/KUL9knAItrQHZQxQ
	NVnmDRAm33/tkjdeMmNd+/+xL9Xn3CrO9gC1Z34gxuXHcuCHRPiIISHrVYa+prA4mBCQzF7woXU+y
	AKSn1j2VFdsaA34tJ8/TJTJCRJz+BAB0FF3Ez3cpQDEeTY53PZZHwij6E9VySYYJ83knkcBUeEzVi
	gvl1EI/idPnElLttU7o/zHTWzfa9qWZZBo0r38bvQbh8EW7lfAoNQqMVjKZl39/3h+yOStCmzIZ0u
	iW/kbUYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cJl-0000000DHoo-0Rj8;
	Tue, 31 Mar 2026 16:51:53 +0000
Received: from fsn-vps-1.bereza.email ([162.55.44.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cJi-0000000DHo8-2Pgm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 16:51:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bereza.email; s=mail;
	t=1774975460; bh=9PyHENddhGjJqQ3dIJrsaurapatYX0PZNL/WyIPsycU=;
	h=From:Date:Subject:To:Cc:From;
	b=0bhZXFkZ8tmu2R82WFklCpkQlIQx74k1AOnQWpeuPqlbOcibVoPZkRpHuO8a+GkZe
	 WzUEKi0EF0WeLB6NlvJ5PG4cxnGMO827wAxQpJ0SiraVIBFwnGU0v6LwYFQFUPaEuV
	 9XdsAfsiJP0GFVq5rWPU2xz3PHBwRymk7kr5IhrD9SekexTznbdI8fMOR8GsZnknjv
	 Ak3LoSaagaeYqXNCScR1v8p/DsfWFcq1ztuM4gAoU4Oh/i5XXis2Jzmf1EURQFQAQs
	 2YeTvmF+2ZtOz9qYGaUwms9V4EPFJigHvSfd84EmLFnOym0X1Qva1RDdqYW5OjnwfY
	 b02aave3JMFZw==
Received: from [127.0.1.1] (pd95bbad8.dip0.t-ipconnect.de [217.91.186.216])
	by fsn-vps-1.bereza.email (Postfix) with ESMTPSA id 5FC5F60F1B;
	Tue, 31 Mar 2026 18:44:20 +0200 (CEST)
From: Alex Bereza <alex@bereza.email>
Date: Tue, 31 Mar 2026 18:44:00 +0200
Subject: [PATCH] dmaengine: xilinx_dma: Fix CPU stall in
 xilinx_dma_poll_timeout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-fix-atomic-poll-timeout-regression-v1-1-5b7bd96eaca0@bereza.email>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQqDMBAFf0X23IXUiIX+Sukhxhe7RY1sYimI/
 95Yj3OYmY0SVJDoXm2k+EiSOBe4XiryLzcPYOkLU23q1lhrOMiXXY6TeF7iOHKWCXHNrBgU6dC
 5CQ1s54IN/Y1KaFEU6z95PE9Oa/eGz0eZ9v0H2q6Fh4YAAAA=
X-Change-ID: 20260330-fix-atomic-poll-timeout-regression-4f4e3baf3fd7
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Tony Lindgren <tony@atomide.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alex Bereza <alex@bereza.email>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_095150_788707_F2F80D70 
X-CRM114-Status: GOOD (  19.86  )
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

Currently when calling xilinx_dma_poll_timeout with delay_us=0 and a
condition that is never fulfilled, the CPU busy-waits for prolonged time
and the timeout triggers only with a massive delay causing a CPU stall.

This happens due to a huge underestimation of wall clock time in
poll_timeout_us_atomic. Commit 7349a69cf312 ("iopoll: Do not use
timekeeping in read_poll_timeout_atomic()") changed the behavior to no
longer use ktime_get at the expense of underestimation of wall clock
time which appears to be very large for delay_us=0. Instead of timing
out after approximately XILINX_DMA_LOOP_COUNT microseconds, the timeout
takes XILINX_DMA_LOOP_COUNT * 1000 * (time that the overhead of the for
loop in poll_timeout_us_atomic takes) which is in the range of several
minutes for XILINX_DMA_LOOP_COUNT=1000000. Fix this by using a non-zero
value for delay_us. Use delay_us=10 to keep the delay in the hot path of
starting DMA transfers minimal but still avoid CPU stalls in case of
unexpected hardware failures.

One-off measurement with delay_us=0 causes the cpu to busy wait around 7
minutes in the timeout case. After applying this patch with delay_us=10
the measured timeout was 1053428 microseconds which is roughly
equivalent to the expected 1000000 microseconds specified in
XILINX_DMA_POLL_TIMEOUT_US.

Rename XILINX_DMA_LOOP_COUNT to XILINX_DMA_POLL_TIMEOUT_US because the
former is incorrect. It is a timeout value for polling various register
bits in microseconds. It is not a loop count. Add a constant
XILINX_DMA_POLL_DELAY_US for delay_us value.

Fixes: 7349a69cf312 ("iopoll: Do not use timekeeping in read_poll_timeout_atomic()")
Signed-off-by: Alex Bereza <alex@bereza.email>
---
Hi, in addition to this patch I also have a question: what is the point
of atomically polling for the HALTED or IDLE bit in the stop_transfer
functions? Does device_terminate_all really need to be callable from
atomic context? If not, one could switch to polling non-atomically and
avoid burning CPU cycles.

As this is my first patch, please feel free to point me in the right
direction if I am missing anything.
---
 drivers/dma/xilinx/xilinx_dma.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 02a05f215614..8556c357b665 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -165,8 +165,10 @@
 #define XILINX_DMA_FLUSH_MM2S		2
 #define XILINX_DMA_FLUSH_BOTH		1
 
-/* Delay loop counter to prevent hardware failure */
-#define XILINX_DMA_LOOP_COUNT		1000000
+/* Timeout for polling various registers */
+#define XILINX_DMA_POLL_TIMEOUT_US		1000000
+/* Delay between polls (avoid a delay of 0 to prevent CPU stalls) */
+#define XILINX_DMA_POLL_DELAY_US		10
 
 /* AXI DMA Specific Registers/Offsets */
 #define XILINX_DMA_REG_SRCDSTADDR	0x18
@@ -1332,8 +1334,9 @@ static int xilinx_dma_stop_transfer(struct xilinx_dma_chan *chan)
 
 	/* Wait for the hardware to halt */
 	return xilinx_dma_poll_timeout(chan, XILINX_DMA_REG_DMASR, val,
-				       val & XILINX_DMA_DMASR_HALTED, 0,
-				       XILINX_DMA_LOOP_COUNT);
+				       val & XILINX_DMA_DMASR_HALTED,
+				       XILINX_DMA_POLL_DELAY_US,
+				       XILINX_DMA_POLL_TIMEOUT_US);
 }
 
 /**
@@ -1347,8 +1350,9 @@ static int xilinx_cdma_stop_transfer(struct xilinx_dma_chan *chan)
 	u32 val;
 
 	return xilinx_dma_poll_timeout(chan, XILINX_DMA_REG_DMASR, val,
-				       val & XILINX_DMA_DMASR_IDLE, 0,
-				       XILINX_DMA_LOOP_COUNT);
+				       val & XILINX_DMA_DMASR_IDLE,
+				       XILINX_DMA_POLL_DELAY_US,
+				       XILINX_DMA_POLL_TIMEOUT_US);
 }
 
 /**
@@ -1364,8 +1368,9 @@ static void xilinx_dma_start(struct xilinx_dma_chan *chan)
 
 	/* Wait for the hardware to start */
 	err = xilinx_dma_poll_timeout(chan, XILINX_DMA_REG_DMASR, val,
-				      !(val & XILINX_DMA_DMASR_HALTED), 0,
-				      XILINX_DMA_LOOP_COUNT);
+				      !(val & XILINX_DMA_DMASR_HALTED),
+				      XILINX_DMA_POLL_DELAY_US,
+				      XILINX_DMA_POLL_TIMEOUT_US);
 
 	if (err) {
 		dev_err(chan->dev, "Cannot start channel %p: %x\n",
@@ -1780,8 +1785,9 @@ static int xilinx_dma_reset(struct xilinx_dma_chan *chan)
 
 	/* Wait for the hardware to finish reset */
 	err = xilinx_dma_poll_timeout(chan, XILINX_DMA_REG_DMACR, tmp,
-				      !(tmp & XILINX_DMA_DMACR_RESET), 0,
-				      XILINX_DMA_LOOP_COUNT);
+				      !(tmp & XILINX_DMA_DMACR_RESET),
+				      XILINX_DMA_POLL_DELAY_US,
+				      XILINX_DMA_POLL_TIMEOUT_US);
 
 	if (err) {
 		dev_err(chan->dev, "reset timeout, cr %x, sr %x\n",

---
base-commit: b7560798466a07d9c3fb011698e92c335ab28baf
change-id: 20260330-fix-atomic-poll-timeout-regression-4f4e3baf3fd7

Best regards,
--  
Alex Bereza <alex@bereza.email>


