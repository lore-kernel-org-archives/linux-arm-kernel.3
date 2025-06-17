Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4069C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ceoOzzgK5CH8cU70V0ynXbiIuuIAAI8RfuSYibOZhEs=; b=F69SIWJgySDfRo
	Y9dHl8qd40ueOV3LU6Jwlq/Ny97BzWF9/cLEqMaZYpcQXqbkHsEuHt5bkeMoGOLTFUQ3mm1HncF6e
	oIqjfFB8H9Ar06kTJ4/w2OSdAklh006lBVb84tyBhib61VQS+KPWBtgeTXTVkud+igFD3b4jd+Uig
	4utjMVnO47UcrmyzGjJdI6tdobO5a1Qm2EH2Vx8dPXAJHblE3cWaUBGgSlpUEVMzYMfGGs76c11iV
	113lYCyr6k7BEYp/6riP5ADKLR3u1LjSLrgCmVYgWwI7eiWDmbbvDT+T9PdtW2zRsEGcPHqoRnHVs
	LIBQvKAukAmn5LZH/9IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXM3-00000007ZOr-3DA7;
	Tue, 17 Jun 2025 14:32:03 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWlT-00000007R9C-0RCa;
	Tue, 17 Jun 2025 13:54:16 +0000
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2D04496;
	Tue, 17 Jun 2025 15:54:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750168441;
	bh=B/wEmXo11hHDhNREcS4lqaU0yYVoIybs/I7Ns51Y4+M=;
	h=From:Subject:Date:To:Cc:From;
	b=WAvECyDLej6YB7Nr4p0QgtBBRxa3K6a8PYUVHYK/w4XRp1nCFS/leQE1oLMfmx7C6
	 2NO9fCZzZr7jwPg8zwxLcxIuURp3EqejLFM13KY4G9S8qJFSk3PrcOdqK8dxXVXKUt
	 k4yyR3dZev9TEUzCY+wY29ho8BujKibPRu3wVnyQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v8 0/4] media: pisp-be: Split jobs creation and scheduling
Date: Tue, 17 Jun 2025 15:53:58 +0200
Message-Id: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-0-e58ae199c17d@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHZzUWgC/5WQS27DMAxEr2JoHQaSHNNxVr1H0YU+dMIillzJN
 VoEuXuZBNl10QLcDD9vMLyoSoWpqkNzUYVWrpyTiP2mUeHk0pGAo2hltd3podUwc509weQ4nTk
 R1PnMC7xnX0H2o/SOsCKYLgaDZAy1TglsLjTy193o9U30ieuSy/fdd8Vb998WUhqwjajHIUajx
 xeO5GpOPrsStyFP6ua09k96p1Hjn+m90HdocBg1Wuv7X+jXR7BCH5/yuOWRTnlXCWQ+8XJoAnX
 BBRy8pSgH1x9xanC/cQEAAA==
X-Change-ID: 20240930-pispbe-mainline-split-jobs-handling-v6-15dc16e11e3a
To: Naushir Patuck <naush@raspberrypi.com>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3441;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=B/wEmXo11hHDhNREcS4lqaU0yYVoIybs/I7Ns51Y4+M=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoUXOEd2UE0FPDI8aSMq8syacdaXOZA70wDaGAV
 xPcb1e5pGiJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaFFzhAAKCRByNAaPFqFW
 PGOPEACz4XPp+Za3n5vtxK5vkPtlAdFtUwLUul0BsIZH27YgM3HPfWmSdZP+IV4I1E3jjAQbN32
 PjhHVIOwwCG9KhYi0PZ2STEeBWaWP7yEKHityfcT34cQ0+QWGUOpNB2H43OfGzPiuhScURQvmlB
 ZV9u5wLo4zaNw38NGol/0wOfS9+X0f26GmPn55GRcEHDlXlYZuXsBynV0kuOAR4D/FUXyhCOiX3
 6sWogEtan7vlxobx4CBJhjNMcpaaSwt3BeGdW9lOiftRNh1gv0ZeTNhnV+2u28pke24EM60YQPc
 ONYI0YI0n5cy+8SAtyXV3LR40eWiEitrif8KMGMVVQF9CcYx1wJApZvM0eVrnVPbXY1quE3LKa5
 meI1xRralp1R+vBwieOmg2JoxTrpUpwTv2fWJsCC1eBI+ijDAKl/YWC8BidowXZySMEEyMzTx/A
 HBzwSKiCos+RSHm6wJFNevD+YSQZLVr+/JZzaUJUnkInJZh7+DPipKdRx7aPOKeR3WbAYlKJCmp
 nHxcuOa0rpgZpgoxe/1sAD58XxH54HlOH1/ncTkLuW2qcEVDHJ/rRkURnAW+GTnUwg7YIgPstPf
 kq4LFduraVORkh/wvsHvGWsnX2hqCOBm9c1+OjqL2YSsBPOW3ipOAM9pEBOfakfnECTO3hGMhE2
 A2BrsvE5ltBuMKw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_065415_296452_A9BB50F1 
X-CRM114-Status: GOOD (  13.49  )
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

Currently the 'pispbe_schedule()' function does two things:

1) Tries to assemble a job by inspecting all the video node queues
   to make sure all the required buffers are available
2) Submit the job to the hardware

The pispbe_schedule() function is called at:

- video device start_streaming() time
- video device qbuf() time
- irq handler

As assembling a job requires inspecting all queues, it is a rather
time consuming operation which is better not run in IRQ context.

To avoid executing the time consuming job creation in interrupt
context, split the job creation and job scheduling in two distinct
operations. When a well-formed job is created, append it to the
newly introduced 'pispbe->job_queue' where it will be dequeued from
by the scheduling routine.

At start_streaming() and qbuf() time immediately try to schedule a job
if one has been created as the irq handler routine is only called when
a job has completed, and we can't solely rely on it for scheduling new
jobs.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Changes in v8:
- Use automatic release of *job in pispbe_prepare_job()
- Use temporary list to release jobs without holding the main driver
  lock
- Collect tags
- Rebased on rpi-6.6.y: https://github.com/raspberrypi/linux/pull/6905
- Link to v7: https://lore.kernel.org/r/20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com

Changes in v7:
- Rebased on media-committers/next
- Fix lockdep warning by using the proper spinlock_irq() primitive in
  pispbe_prepare_job() which can race with the IRQ handler
- Link to v6: https://lore.kernel.org/r/20240930-pispbe-mainline-split-jobs-handling-v6-v6-0-63d60f9dd10f@ideasonboard.com

v5->v6:
- Make the driver depend on PM
  - Simplify the probe() routine by using pm_runtime_
  - Remove suspend call from remove()

v4->v5:
- Use appropriate locking constructs:
  - spin_lock_irq() for pispbe_prepare_job() called from non irq context
  - spin_lock_irqsave() for pispbe_schedule() called from irq context
  - Remove hw_lock from ready_queue accesses in stop_streaming and
    start_streaming
  - Fix trivial indentation mistake in 4/4

v3->v4:
- Expand commit message in 2/4 to explain why removing validation in schedule()
  is safe
- Drop ready_lock spinlock
- Use non _irqsave version of safe_guard(spinlock
- Support !CONFIG_PM in 4/4 by calling the enable/disable routines directly
  and adjust pm_runtime usage as suggested by Laurent

v2->v3:
- Mark pispbe_runtime_resume() as __maybe_unused
- Add fixes tags where appropriate

v1->v2:
- Add two patches to address Laurent's comments separately
- use scoped_guard() when possible
- Add patch to fix runtime_pm imbalance

---
Jacopo Mondi (4):
      media: pisp_be: Drop reference to non-existing function
      media: pisp_be: Remove config validation from schedule()
      media: pisp_be: Split jobs creation and scheduling
      media: pisp_be: Fix pm_runtime underrun in probe

 drivers/media/platform/raspberrypi/pisp_be/Kconfig |   1 +
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 196 ++++++++++-----------
 2 files changed, 98 insertions(+), 99 deletions(-)
---
base-commit: ce5cac69b2edac3e3246fee03e8f4c2a1075238b
change-id: 20240930-pispbe-mainline-split-jobs-handling-v6-15dc16e11e3a

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


