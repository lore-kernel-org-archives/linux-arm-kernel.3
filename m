Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E67C44503
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 09:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFSMF/UUQ/jmj4LT03D5ukygscU0JNIQNzF2vvZDJ4k=; b=EJoxsd+WDBTXKgKU+zEymVMz3H
	+YqLvDnNXo1kYDjoN3K1f+hYVSOl5ruZZKSf9YyCjY8y1TcyFn3QCV1F/maFZsxxjFkpsjS0sycJM
	sgA5E1mSuA7bUI4kHh3NedoQYrvztv3pCCnaJn4az653Vl5RXWN59dM1WZn00U077hIPffLZ42Ivt
	ayarAou08kpw+/ATSeQo8aKv4DZAPw7Es6oIcvwRpHhG2MsmsMnllc4VaiwhKt+wQcJTTCoxQFvfL
	BKDxxYnx+PhYFrVtHBPKEof8K5AJt1yA9/bkhtlykRnQR9AwbWyDW0AzcLyWK/gDm3RIHlprx2+S+
	vz+j66Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whO8x-0000000GfyW-1evl;
	Wed, 08 Jul 2026 09:00:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whO8s-0000000Gfvx-2qVU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 09:00:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 247DA6001A;
	Wed,  8 Jul 2026 09:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484021F00A3D;
	Wed,  8 Jul 2026 09:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501229;
	bh=EFSMF/UUQ/jmj4LT03D5ukygscU0JNIQNzF2vvZDJ4k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fm96ya9Lx5ykmSLDc5Dq5mu/CNPVnbAUim/eDPtYdyc7gh+RRv4aLruwZzcXf6g60
	 r0b3R3jjv6ysiwddJGZd3vsjESEz3LmgjOohoHsvFpsGoqX+hjk6IC/WgwNPIUf+8h
	 g9UZcOTAnezryqMUAiQ/4hibQ5UjSJU2Y8xiDqMvQxd8v1Ow2TdBL8JlZU2Z49BSMi
	 4S2hXlmM86EbAZedfZWXxYazN3YRI8ehkFCsFp1PmGAjCH+YminAjLA8GRnF/shUWL
	 QV+uCiltELxIfbwZVTp92gZIJZrRveVWPhxRfsqM0ZEG8SBXxB0lwC0LM3G30RsfR7
	 yMYsA6rPf0Adw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 10:00:01 +0100
Subject: [PATCH v4 05/16] firmware: arm_scmi: Avoid IDR updates while
 cleaning channels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-5-53142cd60b63@kernel.org>
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

scmi_cleanup_channels() walks the TX/RX channel IDRs with
idr_for_each() to free transport resources and destroy the dedicated
transport devices before calling idr_destroy().

The destroy callback removed each entry from the same IDR being walked.
That is not needed for this cleanup path, and it is unsafe because
idr_for_each() has not advanced its radix-tree iterator while the
callback is running. Removing the current entry from the callback can
invalidate the iterator state. The callback also cannot be protected by
rcu_read_lock(), because scmi_device_destroy() may sleep.

Leave IDR teardown to the following idr_destroy() call and keep the
callback limited to device destruction.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 9428c0777899..3b0c8b6087e6 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2885,7 +2885,7 @@ static int scmi_channels_setup(struct scmi_info *info)
 	return 0;
 }
 
-static int scmi_chan_destroy(int id, void *p, void *idr)
+static int scmi_chan_destroy(int id, void *p, void *data)
 {
 	struct scmi_chan_info *cinfo = p;
 
@@ -2898,8 +2898,6 @@ static int scmi_chan_destroy(int id, void *p, void *idr)
 		cinfo->dev = NULL;
 	}
 
-	idr_remove(idr, id);
-
 	return 0;
 }
 

-- 
2.43.0


