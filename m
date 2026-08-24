Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA37C5DF9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 19:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:From:To:Content-Type:
	Message-Id:Date:Mime-Version:Content-Transfer-Encoding:Cc:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=boEOCVgjrCz8ZJeuLRkxsMFBbR7lnEtVxuA2ok9SNbw=; b=X92h25YCKiSCBQ7Q+Gf1UqH7GF
	S8rjedszACUzY2rndDJpK6arZhM+W1G3zaXr6hkg9GCiI1TQWFXf8oCasvd1fG63g9kkE8UtWfii/
	OdDGh7iL25QKgJafyhDxRSs7MV2Ngv+Rq4O5NAf1zK4lPe5X0sY06jTnBaWxeabifriTn045++Qll
	wlCV4AEOtnZCfUuhGrVwUFtYPiRiV64dkAonTfybd+gFyXbDhzxG1T7yuwmFxnLgo9O8Py/Y3L79Z
	itrWNJfukp66WDJC365OX80bDEjZt3olAU5Vt0sZeVb1lT4Z9AkKAFpfW7koD5t+fJDhNyLEMZhar
	McBmrtJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyaRb-0000000HJYD-0uMX;
	Mon, 24 Aug 2026 19:34:55 +0000
Received: from sg-2-5.ptr.blmpb.com ([71.18.227.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyaRW-0000000HJWg-2b35
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 19:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1787600078; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=boEOCVgjrCz8ZJeuLRkxsMFBbR7lnEtVxuA2ok9SNbw=;
 b=o0n4cOye+b/CbYeR8tac8W+3qdhLksSldwTQN9ILNc6QJqk/3oRwKEsZdtLXC643E43ELZ
 oY05E95LaLF69w9TRcY1nnIdZkokrZpkszeFRn/P6IWfrNkXxyWGldrisBGU+x1bjEZccN
 CTS6GyV9c0hi4jXCGfm3/tBxP2krYHMtbNrQjg3JSszOYwziAkeug/drUuNlQ/AhG5sRFL
 MdO1+AIsUf0/JuSMTVAwouWoTB31/RFCl0RZ98WXwkg5CZuX5V9cmEFjYOsTI6z63nClKB
 Zye3D2SNTLt1+Ppeoajbioa6ipXb02ef8GdC+5BEa+992nJVWUG8EsBw38Biaw==
Subject: [PATCH 0/3] media: cancel timeout delayed work before freeing its owner
X-B4-Tracking: v=1; b=H4sIAMWcjGoC/x3MTQqAIBBA4avErBswo4yuEi3KphpCDe0PwrsnL b/Fey8E8kwB2uwFTxcHdjahyDPQ62AXQp6SQQpZi0ZWaGjiAQ825M4Db+c3LDTNSkmh63KEFO6 eZn7+adfH+AFuVrQFZAAAAA==
X-Original-From: Shengzhuo Wei <me@cherr.cc>
Cc: <imx@lists.linux.dev>, <linux-media@vger.kernel.org>, 
	<linux-arm-kernel@lists.infradead.org>, <stable@vger.kernel.org>, 
	"Shengzhuo Wei" <me@cherr.cc>
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
Received: from [192.168.9.107] ([111.42.148.163]) by smtp.feishu.cn with ESMTPS; Tue, 25 Aug 2026 03:34:36 +0800
Mime-Version: 1.0
Date: Tue, 25 Aug 2026 03:34:29 +0800
Message-Id: <20260825-media-timeout-work-v1-0-ebfebbeb6c31@cherr.cc>
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26a8c9ccc+181a27+lists.infradead.org+me@cherr.cc>
X-Change-Id: 20260825-media-timeout-work-1cef7720c63b
To: "Mirela Rabulea" <mirela.rabulea@nxp.com>, 
	"Mauro Carvalho Chehab" <mchehab@kernel.org>, 
	"Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, 
	"Pengutronix Kernel Team" <kernel@pengutronix.de>, 
	"Fabio Estevam" <festevam@gmail.com>, 
	"Hans Verkuil" <hverkuil@kernel.org>, "Ming Qian" <ming.qian@nxp.com>, 
	"Nicolas Dufresne" <nicolas.dufresne@collabora.com>, 
	"Benjamin Gaignard" <benjamin.gaignard@collabora.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>, 
	"Bin Liu" <bin.liu@mediatek.com>, 
	"Matthias Brugger" <matthias.bgg@gmail.com>, 
	"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, 
	"irui wang" <irui.wang@mediatek.com>, "kyrie wu" <kyrie.wu@mediatek.com>
From: "Shengzhuo Wei" <me@cherr.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_123450_868464_E0052C4A 
X-CRM114-Status: UNSURE (   6.43  )
X-CRM114-Notice: Please train this message.
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

Three m2m codec drivers arm a per-job timeout delayed work on the
system workqueue and only cancel it on the job-completion path. If the
hardware never completes the job, the release/remove path frees the
object the timeout callback dereferences (via container_of or through
the m2m device) with the work still pending -- a use-after-free when
the timer expires.

All three are the same missed-twins class as the recent mtk-jpeg
jpeg_work release fix and the host1x timeout-worker fix. In each case
the fix is a single cancel_delayed_work_sync() placed before the object
is freed:

  - mxc-jpeg: cancel ctx->task_timer in mxc_jpeg_release() before
    kfree(ctx); the timer is otherwise only cancelled in the job IRQ.
  - hantro: cancel vpu->watchdog_work in hantro_remove() before
    v4l2_m2m_put() frees the m2m device the watchdog dereferences.
  - mtk-jpeg: cancel jpeg->job_timeout_work in mtk_jpeg_remove()
    before v4l2_m2m_release(); ctx->jpeg_work in the same driver got
    the equivalent fix earlier, the device-level work was missed.

Patches are independent of each other.

---
Shengzhuo Wei (3):
      media: nxp: imx-jpeg: cancel task_timer before freeing ctx
      media: verisilicon: hantro: cancel watchdog work before m2m release
      media: mediatek: jpeg: cancel job timeout work before m2m release

 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 1 +
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c       | 2 ++
 drivers/media/platform/verisilicon/hantro_drv.c      | 1 +
 3 files changed, 4 insertions(+)
---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
change-id: 20260825-media-timeout-work-1cef7720c63b

Best regards,
-- 
Shengzhuo Wei <me@cherr.cc>

