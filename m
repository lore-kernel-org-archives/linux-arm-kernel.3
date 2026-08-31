Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0F2C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 04:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIs4JGkCZbe1hIfuDPjKMzbKJ3jJLbxC1l4hzdrLCRw=; b=DbH369cmkBDDVGWk/3YPV8Rd1p
	9XMf4pFc/eMJjCeLM+XtWnXuaxgkkFcYNxUFUAJ4+bTSX5i4GqX8J2+W3j8xt4TuU4BIVd500qE8n
	pmQSonV91B07rhAizCYNNq3z+3BXE4DWUCnrSCJBg9AUN1qm6xCtPQsUQsmecjnkPZAMWLOqo6hFO
	FkYlBxW2dPQqsm3n4cE9Ku+Pz1j3N8X7LjaeNbZSMGYCVkzJ+3iTpnMyFdYTbSd4eWeJBuF6oUP9m
	EscgnR4cl4pYM7ikK9xk4FH88EJFp51NbrtkTvjwWzfrv4njCXcwxbN8nx1GI6+UpzjlTXuVN/ZqX
	EavKByeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0tKP-00000008RSf-2maN;
	Mon, 31 Aug 2026 04:09:01 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0tKN-00000008RR2-1340;
	Mon, 31 Aug 2026 04:09:00 +0000
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 0257B1D000E2;
	Mon, 31 Aug 2026 00:08:57 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 31 Aug 2026 00:08:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788149337; x=
	1788235737; bh=hIs4JGkCZbe1hIfuDPjKMzbKJ3jJLbxC1l4hzdrLCRw=; b=E
	8pZHUcVLQvAb9Kgjubjwm/Ld0np+aGC3ErcEQxRDLT2HKAm/TmlMPKNMMv243BTi
	T420BLre0i6eyYxPz8ITnTw0c6LFHySmNGSbm80O74z2u9EmDo+jZ+67/v0g2BuJ
	5Udvwvmfz2R2bt4tVVyWJRAH0V/jEGDeMNbCnZSfc8udSRASie1xdMb35ytfx5uy
	ny2wfeHWXx/IcbMBWaj6dKPEMFWaHiC0WzzpVpy5jYjSucQ7pIa3mBUUg0ZFLuke
	Cz/eguGr9QV2qXFsCqt81R9ZZeWmq2gS2XYGcL6Ey6FXIQC8sigSMfIbhAzTHXAm
	6GDAD9pjGPXoRL3MEpmuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1788149337; x=1788235737; bh=h
	Is4JGkCZbe1hIfuDPjKMzbKJ3jJLbxC1l4hzdrLCRw=; b=bhsAaFmL1Wp+dzjqo
	npS282jlOpW20qL+xudgXs2azhnv28dJy2jGLYESsJsrDMz7qzpZJQ4SKYVaZC3d
	eNvO2UwokvVpa7kE86QEwKsPZBgmSF58wORzF52mHbcu3sClIV9uHN/BIi1BDjPs
	7/v1MrikSnmsYJe7EXUsdEMAbBRYvNVM9Sh/b6V4D6YIBAP0WXlLAIPcFnby3gwq
	b9//L1M44JrYoTB2s/14yRNA6F8Iqf4AfX0GCfeMYrWgGwOY/MuYEcATI2bjdhvG
	r1ISJvQVKjwNnWiFnD0hSODOJxBTp86zIw7zDau5EKlO6SjynHicIeYN9tAMb8Yz
	hyuiQ==
X-ME-Sender: <xms:Wf6Uaq2gOgj7i7PL58hqcCOFDKMaM6Iq1PdPTCaQd8hxj62tYi8Y0Q>
    <xme:Wf6Uas9WsHNm5dvhOvcf_6jwJBj8R2hlZGYSwaX8OLSrc6JDw-wWIB3-Hy5JtgFnB
    6MXR33HGxkX-nYwmBcJ58nOX-HnJX8HUmKNW2nkpgM4XXxyZ5n52NEh>
X-ME-Received: <xmr:Wf6UagP3vo8NhjRBt_3ZdMwAk0oorpL8euwrXFixgSN5rIpl_JkQH5_X8RQWhjYaMbJBC4-wxg>
X-ME-Proxy-Cause: dmFkZTGgZgR+VcPfe+PhAzOLd0oIFeQYFsXhiZHiqFEfJLX+Zh5ZMdMCmp7DSb14qyqV39
    jp/P4WoX1+fWMg7xKNkg19erm52kJxQUcTYbC3fhf7J3kTCWp177f4eiTLGImcgm9FlW/K
    919HsGQiniAe1IB7e9jl0y2Y9dxEodpqsZNpi/Wh8/Y0aGqz1kZ0NysbtBSq+wCn4J8DOp
    NMVeqNR7AEscaSespCcNi1Tsf5l8QtvZS5D7uic9GEJ8sDuUqjUvTw65giXWj5Lizkd8mk
    k6Wvf2Wg5sOErrVa3i9eyoCaEv0ghglB6LbcQ07PYZ4WQgjzQYOd+k7ebFmJtNV5tyGOHS
    zTJJZx80ECWdSg9j5XiBIbNOlMZg9QwpKpxsCOFk32pvKKdsLoMSJOE7c9JVQsoUpu/28e
    +vrvdprSsbE13gthPaFucmO0+rmPbyv2EuyNyUqociW/jap1JKUinQXv4sUQFfauRTsFta
    Z0jJE1Cm0LNL+lkZ9HITGHm5YASNOz/PPzKcM7k0tbvwEXKBTFeNm691AuIafCTPm3X5Li
    hhXbTqG3k+gScBTPxD6CQyjbDCApuZdaAkj5Rso7Vx5lngWtTs8x2/aFfA9QdYra4lpEYw
    eyqr55AST8M8YddVoXATxMoHjCS8E0aIqzd2vf2y03UDMB/88rpGQ/gGUQOg
X-ME-Proxy: <xmx:Wf6UaoCVsP65DeZ-XJnUYQV3lwCgVtSvzk1YkxIQijBi65qCIuJNEw>
    <xmx:Wf6UaqN8CCDy1VcxRSv4Z_M9nVAsqZy1QE56ohewEYN01oWdE9qnAQ>
    <xmx:Wf6UambJtdaW3LaiEwD6m8tfI-uQ9KhbnQfjfFsdJAivqMQTdQYY_g>
    <xmx:Wf6UahMgsfoNV1WQEN6rPZNSLH30JqZ5JbEP1Leu62c8QfkShugZrQ>
    <xmx:Wf6Uahcj-crIppvml_D_YcnZb7zrnpT2X3sbUIFjjgWhVcjPuju4GtpN>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Aug 2026 00:08:50 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH v10 04/13] accel/rocket: factor the completion tail out of the IRQ handler
Date: Mon, 31 Aug 2026 16:07:55 +1200
Message-ID: <20260831040804.24111-5-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831040804.24111-1-gahing@gahingwoo.com>
References: <20260831040804.24111-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_210859_331039_1CADED54 
X-CRM114-Status: GOOD (  13.92  )
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

rocket_job_handle_irq() stops the block and then either starts the job's
next task or retires the job. The second half is a step of its own and
reads better with a name, now that taking the register writes under
job_lock has moved it a level deeper inside the scoped guard.

Move it to rocket_job_next_locked(). The early return that used to leave
the handler now leaves the helper, which is the same thing here: the
scoped guard drops job_lock either way and nothing follows it.

Doing it as its own patch keeps the locking fix at the head of the
series minimal, so a bisect that stops before this one gets that fix and
nothing else. There is one caller, and no functional change.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
Reviewed-by: Igor Paunovic <royalnet026@gmail.com>
---
 drivers/accel/rocket/rocket_job.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index a89ab49e1..69e29f40f 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -341,6 +341,25 @@ static struct dma_fence *rocket_job_run(struct drm_sched_job *sched_job)
 	return ERR_PTR(ret);
 }
 
+/* Start the job's next task, or retire it. Caller holds job_lock. */
+static void rocket_job_next_locked(struct rocket_core *core)
+{
+	lockdep_assert_held(&core->job_lock);
+
+	if (!core->in_flight_job)
+		return;
+
+	if (core->in_flight_job->next_task_idx < core->in_flight_job->task_count) {
+		rocket_job_hw_submit(core, core->in_flight_job);
+		return;
+	}
+
+	iommu_detach_group(NULL, iommu_group_get(core->dev));
+	dma_fence_signal(core->in_flight_job->done_fence);
+	pm_runtime_put_autosuspend(core->dev);
+	core->in_flight_job = NULL;
+}
+
 static void rocket_job_handle_irq(struct rocket_core *core)
 {
 	pm_runtime_mark_last_busy(core->dev);
@@ -354,17 +373,7 @@ static void rocket_job_handle_irq(struct rocket_core *core)
 		rocket_pc_writel(core, OPERATION_ENABLE, 0x0);
 		rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
 
-		if (core->in_flight_job) {
-			if (core->in_flight_job->next_task_idx < core->in_flight_job->task_count) {
-				rocket_job_hw_submit(core, core->in_flight_job);
-				return;
-			}
-
-			iommu_detach_group(NULL, iommu_group_get(core->dev));
-			dma_fence_signal(core->in_flight_job->done_fence);
-			pm_runtime_put_autosuspend(core->dev);
-			core->in_flight_job = NULL;
-		}
+		rocket_job_next_locked(core);
 	}
 }
 
-- 
2.43.0


