Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01145EA3C5C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 10:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/73f3/gKMGjhlSVUm1EFqbVBE3w9N0gOSLL9TifoTSo=; b=u2D5xo7rlqTH5DmizEXb12BQMl
	a4DRjm1QXpYg0sJVzSDfE+jWtcMvtBdW1z0U9TRzI9pf6Re0Kg4dXdetyoNAKBvmezDUSkRf8INWi
	chXH8Uo1a0rZyHmoTcJhplppzpE3P5f3YgQiL5zXOVZ9bWAv4ppF2oHQvb/DRQk5Sl5AP5hgCz0TJ
	1DK84D/rtgATbNZ8lqdGKib5XHkeYdpAHoFwLFfZ7iZHP77TruDRfjKaMxBXPxf6ZPwVmKMGDYEnq
	LN7XL05PeF2puJh8Il3ubm0og8kN7MXPdh9g37HPfl+/1Cv0YcL2bGUIZG3uVycXNsHVjYm8HiCpm
	u8qC6gSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9IY-0000000C1Gg-0VyV;
	Fri, 10 Apr 2026 10:41:14 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9IT-0000000C1EX-3ZOu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 10:41:10 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-38dd9c6840aso16060151fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 03:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775817668; x=1776422468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/73f3/gKMGjhlSVUm1EFqbVBE3w9N0gOSLL9TifoTSo=;
        b=ajS9/Lruf2RnLZGSPh9etYCgyPYN5BY2tMYbC3lYQbTM7EcNbSFTobfBnMs0iw7Dqv
         GJ7C5g08VM2JHtA7A+IWoLNg1SPf2lAQjeY4mIftBJkcGokpP6rSbp3fWL3CKvzmwLd6
         lFFHTgZe6COrROu/nX3/tNJnt5jpYDPuaRmYNWIZkEYtqX+Df4Qrw2t/Dgib2x/HjrG3
         YaMw+KttqAoTruVFS7mFiwRbClLhV0VrrbGAgTGrIpoZr9qMVgzWhagOX9npL2BKCFjS
         29NAB3eqzwyXcOblrOj7WZlGqfn+SMGqrxZHduNdGlJLMMLgF3xfMh/OLPL7dLwk0b9n
         Wpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775817668; x=1776422468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/73f3/gKMGjhlSVUm1EFqbVBE3w9N0gOSLL9TifoTSo=;
        b=tDnIaKGKUvvWIV2quKh9Dihb9dQa/hj4PVXbgD5buDRG7M0KVQnxBjAU3GAtgey3bT
         54Zp3W/eQ3PT5WkJnPpCHwE0S2ITEYEoDu1ZVHKodtbJXgsIxcgmiQ0oh+xWZJpVGRyM
         AHQFgaPUI9DDwg90IWRNb5YbANNUTJ40ziIXi7jt6ewTAeaQER/x5CmVA2qgZm7SUJKc
         2YlKy6Gwjnb9UKMVoNdXkaCRfx0R/0FvXomCuCcEZ8kRJl6XCeJJFCtoCsRbx8VPotGe
         vuBchd56k389++MnfoNcK+HXDICje6mXfDoNystMneDDIsfhc6unrRGDntVY7A1fSWar
         Qjag==
X-Forwarded-Encrypted: i=1; AJvYcCWsW7czYIzqTk8MpxmV9McsmVnzTIK9YA4h5zsuPzRDltbUHYZ9HaABEn0WPYq+9TM0UI0XVfCd/TklLJUUVrGz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpsg3VxJe+ATswgC5ST40BrHVef+CUN235Vkaa0tFYGwpzewOu
	jEgzQ40pkBFvqqKt2mVnzL2/fipDaqVXHgPw7l7aYAmm+J3Gh2asfEy+Pf4zzszV8RY=
X-Gm-Gg: AeBDiettRHRs8GOHK6RgHa3ZVLVgI5RU59xerFcEVFp027Yz6Wc/fm2JXYBhjpw3rq7
	+GbQZzZNhJICWH0NwXtg+Xv8QDMVMcY5tAf4j45Ggs0gi/XOkYUgvYMoJdQVBFoScz603KEq0Lo
	hb0GZdkujn1IWcUDjY0PKnySPfMSxh/Bp3F+NhzaLStLCM87ysqsAixT6wZkBYh50G/8Ivr4U8l
	O3ZZowjhvikME5/VOI7GsBZgMyZVDibFFDzNHCYw+lA8MCcclJ96zekIvPYxaDTH/1Eyk5MJPKH
	DuxARfalU8V7Ee+b+b6qdtS3kUGRQ6IVSPHU3bbQZvVrq8Aj+05k7ddojMob3bfmKHQK5DM0HUA
	xpD7T7bE/WIMJpa0K31k/1VwZJkFIJXShdxFjEKUFcMkbYnHXWZAwSfkA8hI/wAfV7OddAaLkZF
	Il0P+P2I7fsB+FTNjtbnHF91aUqOGDp+KsUOYfdPPtTM2raYCfOhBSSqCMkztbeHcquYnc+VcD
X-Received: by 2002:a2e:be9b:0:b0:38c:6b7:ad39 with SMTP id 38308e7fff4ca-38e4bee2130mr9021011fa.13.1775817667538;
        Fri, 10 Apr 2026 03:41:07 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495455acsm5588331fa.23.2026.04.10.03.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:41:06 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-pm@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/9] driver core: Enable suppliers to implement fine grained sync_state support
Date: Fri, 10 Apr 2026 12:40:44 +0200
Message-ID: <20260410104058.83748-2-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410104058.83748-1-ulf.hansson@linaro.org>
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_034109_918518_EDFBC32E 
X-CRM114-Status: GOOD (  22.39  )
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

The common sync_state support isn't fine grained enough for some types of
suppliers, like power domains for example. Especially when a supplier
provides multiple independent power domains, each with their own set of
consumers. In these cases we need to wait for all consumers for all the
provided power domains before invoking the supplier's ->sync_state().

To allow a more fine grained sync_state support to be implemented on per
supplier's driver basis, let's add a new optional callback. As soon as
there is an update worth to consider in regards to managing sync_state for
a supplier device, __device_links_queue_sync_state() invokes the callback.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/base/core.c           | 7 ++++++-
 include/linux/device/driver.h | 7 +++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 09b98f02f559..4085a011d8ca 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1106,7 +1106,9 @@ int device_links_check_suppliers(struct device *dev)
  * Queues a device for a sync_state() callback when the device links write lock
  * isn't held. This allows the sync_state() execution flow to use device links
  * APIs.  The caller must ensure this function is called with
- * device_links_write_lock() held.
+ * device_links_write_lock() held.  Note, if the optional queue_sync_state()
+ * callback has been assigned too, it gets called for every update to allowing a
+ * more fine grained support to be implemented on per supplier basis.
  *
  * This function does a get_device() to make sure the device is not freed while
  * on this list.
@@ -1126,6 +1128,9 @@ static void __device_links_queue_sync_state(struct device *dev,
 	if (dev->state_synced)
 		return;
 
+	if (dev->driver && dev->driver->queue_sync_state)
+		dev->driver->queue_sync_state(dev);
+
 	list_for_each_entry(link, &dev->links.consumers, s_node) {
 		if (!device_link_test(link, DL_FLAG_MANAGED))
 			continue;
diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index bbc67ec513ed..bc9ae1cbe03c 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -68,6 +68,12 @@ enum probe_type {
  *		be called at late_initcall_sync level. If the device has
  *		consumers that are never bound to a driver, this function
  *		will never get called until they do.
+ * @queue_sync_state: Similar to the ->sync_state() callback, but called to
+ *		allow syncing device state to software state in a more fine
+ *		grained way. It is called when there is an updated state that
+ *		may be worth to consider for any of the consumers linked to
+ *		this device. If implemented, the ->sync_state() callback is
+ *		required too.
  * @remove:	Called when the device is removed from the system to
  *		unbind a device from this driver.
  * @shutdown:	Called at shut-down time to quiesce the device.
@@ -110,6 +116,7 @@ struct device_driver {
 
 	int (*probe) (struct device *dev);
 	void (*sync_state)(struct device *dev);
+	void (*queue_sync_state)(struct device *dev);
 	int (*remove) (struct device *dev);
 	void (*shutdown) (struct device *dev);
 	int (*suspend) (struct device *dev, pm_message_t state);
-- 
2.43.0


