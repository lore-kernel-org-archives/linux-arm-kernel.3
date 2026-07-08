Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6542AC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 09:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfr7ZZKY7R0Q0fpXvMzQrwETE6t9nlZGm9NBFjMImJA=; b=kFekpF1z68sb/kIx9hinLc3ffH
	hnNoR8O9YYk6lUi6zDbKjjWpu3O8x3JIywfQTN2puhfKxefxjQEuBsB0CokJfDrJk5NyC6399mC6E
	VACDqdsABbWB5CcdWkJ1v7h0UCh+1xRTmVbxtBIuog6cQ2cVwyUINudiL0lmff2twvt066IWGY902
	xzTkE0qV6AOiMdzCk6AQvIcyvsfqSWUTD4iGSL4YBWp4wzL+7dw7+oaiTalORrrSqndhUPGgYeg8c
	PcxVUlIpWvCt0m6qaKOPAA9im5zjvhJhBi02KXGMwe7N4p7VTBqkAJJsGUk52swFlWBUdZpGyJx4W
	5aZJWaiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whO8y-0000000Gfzl-06CV;
	Wed, 08 Jul 2026 09:00:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whO8u-0000000Gfwm-0FLP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 09:00:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CEA6443714;
	Wed,  8 Jul 2026 09:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BCB11F00A3D;
	Wed,  8 Jul 2026 09:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501231;
	bh=qfr7ZZKY7R0Q0fpXvMzQrwETE6t9nlZGm9NBFjMImJA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fbfI+/v8X0xielvI1RsXQ1n5XyY+6FHzeH85+L7HbQJqEtLURu8BrYFRmaTrcMcA9
	 c2bwM7L6mFunuay0XQRUg728UHhWb5bJ7bt9kx9amYn0zNsPVdWqVTLqsvD1xTIcJf
	 805VtogtJ862AoL/1hGAw6DrnuXlRM9Af8UsGe8hg8PupiTZBG/Yssx4iLy0+82xCH
	 ptXNkgKzzg3VptCYACv/NFvfBmpNX/sewiP+YaMHNhtUUjXjOJ9rTWyFw7Cp+g49Rw
	 tjLnLpDtvwCWh/HsUtn8kMRE5sNqdEIbuKvNf40j8+dydPsCiWZ0aOQD8TTO9yE8Fq
	 QrAx9COJvHIPg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 10:00:03 +0100
Subject: [PATCH v4 07/16] firmware: arm_scmi: Use channel ID for transport
 teardown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-7-53142cd60b63@kernel.org>
References: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
In-Reply-To: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2
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

SCMI protocols can share the BASE transport channel when firmware does
not describe a dedicated channel for the protocol. In that case multiple
IDR entries can point at the same scmi_chan_info, whose owning transport
device was created with cinfo->id.

scmi_chan_destroy() used the IDR iterator key when destroying the
transport device. If an alias entry is visited before the owning channel
entry, the lookup can miss the device because the iterator key does not
match the protocol ID used when the transport device was created. The
code then clears cinfo->dev, so the later owning entry skips teardown and
leaks the transport device.

Destroy the transport device using cinfo->id, which is the protocol ID
that owns the channel and was used when creating the transport device.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 8c4a3036ae43..41f1b2c49521 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2896,7 +2896,7 @@ static int scmi_chan_destroy(int id, void *p, void *data)
 		struct scmi_device *sdev = to_scmi_dev(cinfo->dev);
 
 		of_node_put(cinfo->dev->of_node);
-		scmi_device_destroy(info->dev, id, sdev->name);
+		scmi_device_destroy(info->dev, cinfo->id, sdev->name);
 		cinfo->dev = NULL;
 	}
 

-- 
2.43.0


