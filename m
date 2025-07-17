Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AD4C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 11:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mAACpfGyk3MwPoipC2ki2uMiRAbAIIEPvB/FFT1yZo=; b=QH30vnMm1g/jVVtuFlzSLorgD5
	IYigy+nc5u0UVC5FwPkvE5Eo1ZDWJxkNEPWMJ7gvgCYIXmNPhb5HM2Lzwz7KFwilF3S5FAy4I9QVZ
	UDjV7pbZ55sI98EDgGzTeIDqqJc/iYJTxtlakNHdQAmZsec5usjdPKhIfnlnrXlCxYPYg9VRFu7ET
	7mUzJNdBdJkZa4xRoFjvgAGcsnnLYjDrgk2wHye8hbHHEYNJI33FwaWJZDInZDZ9f6gTy8ey4/1zW
	Z9N4RyyZba4HZjr5u0i8TQCx6hvlpMcPPh+bGfxUi0NswR8Fg6z00yAhTN9OA4iExVrQZuKhlRE5v
	D5/cxZJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucN4N-0000000A0aj-1tWD;
	Thu, 17 Jul 2025 11:46:35 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucM7o-00000009soy-1fO4;
	Thu, 17 Jul 2025 10:46:05 +0000
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 501251AE2;
	Thu, 17 Jul 2025 12:45:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749129;
	bh=RMEJm/E/usNBixZcp+GBwmSg7HkpwQhhGNile6Mrpfg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mNMMVCC3G4ShiWZaEq6mzKdKIIvbhdEhL7lYffpkMdsnQ8rw855e7y4uYYRfcWRhu
	 MDeoCR7C5xJ3069Xg2L5eDFf/fkDtZY6DWvkWVs0dC5CTpZlOi4+ophz1HfJjGUH9C
	 B3wRa0M3acbQn4AYBwnnZLC98kKE37EQT6466KZk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:41 +0200
Subject: [PATCH 15/26] media: v4l2_subdev: Introduce default context
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-15-81ac18979c03@ideasonboard.com>
References: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
In-Reply-To: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5859;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=RMEJm/E/usNBixZcp+GBwmSg7HkpwQhhGNile6Mrpfg=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRQARFaawY5Ymb5LCqC6Mrgnq+bBHXeD5/Vw
 bms7lMdbF2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUUAAKCRByNAaPFqFW
 PBGkD/4uAZ7atbk/AkFfdYiHt0SfIDUqI6aViU0Mtz0FbtztrBockfTaMn+bueBtFJoYyIzcpx4
 XO+LGYBxU9aaEh0+LL/6T62Bey/7IjbwVemMjGn0wK4UZGiusTTQD2PvLAMA/KwO2bWs+GpZTg4
 Knk11XQu6ppEBLrTntpaJQVvOiW3Cu3Z8bRMRYHf1D7mUyjT1fymUflQ4FstF4DEFnjjg48AP0s
 V+5trxEaV4C5irKmPRPM3swpDPDIH7lKbLTqhoLkY9mlwv1Adr6xGg3UkuGEMVx/lLtih04+iHx
 khz1JBWiL6Sd1+xBByDonmHY3XsbOp4SoNo95KaRGg6GPScH8xmuxmDO7dFFanSwHHkNDbkf7yj
 6IqRJ1J7i4QvJuWmzEgQjpkJTQ1s39Q57AVwRRyW0fSBeNo69MTBjYUotTw09yP4TdUkmrhrl4p
 ngdPZkIUoUKKNPffqRW0fiOtuxZKlpqNh3AOldf9mnI4jxAMSexk8gRk5EMJekXlUbVpHJKlTdA
 yvmTSpexf5Vb1IqZqCVHSXawZtzw77omwsZbHuddY7bORnaEEARz9cdaz1SdFxGB9UiXQVxud+T
 Fp64lSgAK1EBd22vq3dXzctq4RGapKoWRMeZ2OWkzU2G4ot0bVpR77YndVTo7KX+TJutcW0IeLs
 a0G453vqAkf1Ftg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_034604_613707_7E7C61A9 
X-CRM114-Status: GOOD (  18.21  )
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

Introduce a default context for v4l2 subdvice.

Drivers ported to use multi-context support that used to work with a
non-context aware userspace (which doesn't call VIDIOC_SUBDEV_BIND_CONTEXT)
shall continue to work even if they are context aware.

Provide a default context in the v4l2 subdev and bind it to the media
device default context when the subdevice is fully registered by
providing a v4l2_subdev_registered() function.

Release the context when the subdevice gets unregistered by the core,
providing a v4l2_subdev_unregistered() helper.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-device.c | 11 +++-----
 drivers/media/v4l2-core/v4l2-subdev.c | 50 +++++++++++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 29 ++++++++++++++++++++
 3 files changed, 83 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
index 5e537454f5cd71b3c50a2a2864642f7d5548047b..bf3ebd77b7bb8b13c849a89d01e6d889e8a2e4fd 100644
--- a/drivers/media/v4l2-core/v4l2-device.c
+++ b/drivers/media/v4l2-core/v4l2-device.c
@@ -146,11 +146,9 @@ int __v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
 	}
 #endif
 
-	if (sd->internal_ops && sd->internal_ops->registered) {
-		err = sd->internal_ops->registered(sd);
-		if (err)
-			goto error_unregister;
-	}
+	err = v4l2_subdev_registered(sd);
+	if (err)
+		goto error_unregister;
 
 	sd->owner = module;
 
@@ -274,8 +272,7 @@ void v4l2_device_unregister_subdev(struct v4l2_subdev *sd)
 	list_del(&sd->list);
 	spin_unlock(&v4l2_dev->lock);
 
-	if (sd->internal_ops && sd->internal_ops->unregistered)
-		sd->internal_ops->unregistered(sd);
+	v4l2_subdev_unregistered(sd);
 	sd->v4l2_dev = NULL;
 
 #if defined(CONFIG_MEDIA_CONTROLLER)
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 300f84317623dd082a4cd2caec97057f972e82a3..438f51980e5ac0f092ba6b0a979a376133968ddf 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1275,6 +1275,56 @@ const struct v4l2_file_operations v4l2_subdev_fops = {
 	.poll = subdev_poll,
 };
 
+#ifdef CONFIG_MEDIA_CONTROLLER
+static int v4l2_subdev_register_default_context(struct v4l2_subdev *sd)
+{
+	struct media_device_context *mdev_context;
+
+	/* If the driver does not support contexts, return here. */
+	if (!sd->entity.ops || !sd->entity.ops->alloc_context ||
+	    !sd->entity.ops->destroy_context)
+		return 0;
+
+	mdev_context = sd->entity.graph_obj.mdev->default_context;
+	return subdev_do_bind_context(sd, &sd->default_context, mdev_context);
+}
+#endif /* CONFIG_MEDIA_CONTROLLER */
+
+int v4l2_subdev_registered(struct v4l2_subdev *sd)
+{
+	int ret;
+
+#ifdef CONFIG_MEDIA_CONTROLLER
+	ret = v4l2_subdev_register_default_context(sd);
+	if (ret)
+		return ret;
+#endif /* CONFIG_MEDIA_CONTROLLER */
+
+	if (sd->internal_ops && sd->internal_ops->registered) {
+		ret = sd->internal_ops->registered(sd);
+		if (ret)
+			goto err_registered;
+	}
+
+	return 0;
+
+err_registered:
+	if (sd->default_context)
+		v4l2_subdev_context_put(sd->default_context);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_registered);
+
+void v4l2_subdev_unregistered(struct v4l2_subdev *sd)
+{
+	if (sd->default_context)
+		v4l2_subdev_context_put(sd->default_context);
+
+	if (sd->internal_ops && sd->internal_ops->unregistered)
+		sd->internal_ops->unregistered(sd);
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_unregistered);
+
 #ifdef CONFIG_MEDIA_CONTROLLER
 
 int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 9d257b859acafb11cfe6976e906e7baabd0206f6..1fa42a9f322be0be44fc9308744f4f4ae0cf1606 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1130,6 +1130,10 @@ struct v4l2_subdev_platform_data {
  * @active_state: Active state for the subdev (NULL for subdevs tracking the
  *		  state internally). Initialized by calling
  *		  v4l2_subdev_init_finalize().
+ * @default_context: Default context for the subdev, allows to operate
+ *		     context-aware drivers with a context-unaware userspace.
+ *		     It is initialized when the subdev is registered in
+ *		     v4l2_subdev_registered().
  * @enabled_pads: Bitmask of enabled pads used by v4l2_subdev_enable_streams()
  *		  and v4l2_subdev_disable_streams() helper functions for
  *		  fallback cases.
@@ -1182,6 +1186,7 @@ struct v4l2_subdev {
 	 * doesn't support it.
 	 */
 	struct v4l2_subdev_state *active_state;
+	struct v4l2_subdev_context *default_context;
 	u64 enabled_pads;
 	bool s_stream_enabled;
 };
@@ -1286,6 +1291,30 @@ static inline void *v4l2_get_subdev_hostdata(const struct v4l2_subdev *sd)
 	return sd->host_priv;
 }
 
+/**
+ * v4l2_subdev_registered - Subdevice registered notification
+ *
+ * @sd: The subdevice that has been registered
+ *
+ * Notify that a subdevice has been registered by the core. This function wraps
+ * a call to sd->internal_ops->registered (if available) and instantiates the
+ * default v4l2 subdevice context.
+ *
+ * Returns 0 on success, a negative error code otherwise.
+ */
+int v4l2_subdev_registered(struct v4l2_subdev *sd);
+
+/**
+ * v4l2_subdev_unregistered - Subdevice unregistered notification
+ *
+ * @sd: The subdevice that has been unregistered
+ *
+ * Notify that a subdevice has been unregistered by the core. This function
+ * wraps a call to sd->internal_ops->unregistered (if available) and deletes
+ * the default v4l2 subdevice context.
+ */
+void v4l2_subdev_unregistered(struct v4l2_subdev *sd);
+
 #ifdef CONFIG_MEDIA_CONTROLLER
 
 /**

-- 
2.49.0


