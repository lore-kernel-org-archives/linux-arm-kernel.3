Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7203D606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2ylTWAaW;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=dbZJrTJI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dGmWGf3sk18wdDPiwQtXXqAqx/6LlKgOLY7+d/ILZ4Y=; b=2ylTWAaWW+uIdN
	NPRIwHlSawB0fGEQmCy+zBclQlAFrgJU4UzBWOpqCkFJp/mzdZuRqLnic+pfCFVJcsNItl9dSQk5b
	7JAOjfxibfzqlH48XNMqnWHqajB3Hoxe6Hd0tn9Pnzf0tgWEMWMlsJ4HPjojEtW6Zrsui2lMYVIM0
	ltKOPtoLbaX2lSpHz5hEMMGHG2jyRU2QELB7dZKZW8fduFPRjnvT2TUZPD3QHpxvShBg4PXx/gBCk
	CNtKHre3F/fXNgG326TFcD5VkrK7a+/Mc4mO1JcMnwxXMNsz+NVSQ5Ka5STlQkDlL1nZUMvHLP8ax
	T7MD09B0em+NkOivrLkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO990-00000001MTg-2f2B;
	Tue, 03 Nov 2026 07:41:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98r-00000001MCc-0VQK;
	Tue, 03 Nov 2026 07:41:15 +0000
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B9897E1;
	Tue,  3 Nov 2026 08:38:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691532;
	bh=FpOG2V9qZc+FAmtb1LE1ngwO1LYVbBSRN9Zl7o78SP0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dbZJrTJIWUeXHSk723zeXipEO44agmxRmzwxXMPSETGyq+Pr0LGDudOSqnufzkmOb
	 QGeDqzScmwFg7Fl9G1ciVGnm9Kn0NmT91hB+tEPbNMQghRj+M84h+E+BuuVqM6osFH
	 OpBAvpuy36RnxtiFxJIMUpH/VF4d+nU0+cpYeo28=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:39 +0000
Subject: [PATCH 03/16] media: v4l2-async: Add devlinks between notifier and
 async subdevices
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-3-08f863b6fdc5@ideasonboard.com>
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
In-Reply-To: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4941;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=FpOG2V9qZc+FAmtb1LE1ngwO1LYVbBSRN9Zl7o78SP0=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6ZAPCc3qpSoGNuPSzTOUZ789ukFFviFMGzu2T
 cV8ZWh9D6aJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaumQDwAKCRDISVd6bEV1
 MkkSEACJwm2M3uTX0thWVJEl+Tdm/XXWfRtzvqQoKNBkyTSRYCE48gx3W7K/OW7EufvSSG7+IHr
 e2FNWACw/cQMN3+IM2KNNTgPaLqzklCFHaLIuccnUpevS1w7lDBdPA7Cx16kBSPjmK3PuzZto0Q
 XBqj6ks3BCN2GkelOtQIrRR1IGdSOx0GiI5dKpa7Q43zfEQPROkOIoDV3j0mkBUIWZ7vcQHOc1N
 Lix9O/0hLNmjLBBQMGVxAGUZsxIDqmV351CujnYXJ+uTjQRgvSnR+dqZyKWr8WtyW6JxZwr41sL
 YBbaWmJOOZiXkN6HWiwZOzjtZYhzwn4ZW1T9vquAEXKeS0fdeMWsNVk9NN1z1jBFuRGuycc59NI
 Swtg272wYIEy7W82/J/MOWcAVIB45zHGg0OUoNHnd/rK2Q6lWdZbMxNpTQqM3SJJW6ADMDaVYMa
 qflJI4oIv/U5TNPfK8IPwd0KctedcIau+P8jL04yX/8S/62XCsIB9A7Xuzb+Zy/rbD2k4lOunPf
 7OyQCwTiVe6jXcWVDG+fL/LEs6DzGMztGYuylnzGePqulbn5zAjPTz6QmQczyVi/5L/o7vae0aI
 gCON/SQpW/OHuI30ZLt0C8qFxkwg6x6Vl0KejLvsRPXT06YybcNWW2dAsof7QxldFCx68JHlHc5
 hypBB5TxbyuFI6g==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234113_351764_F1EADB8A 
X-CRM114-Status: GOOD (  19.37  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When we suspend devices with a live stream running the ordering of
the Power Management .suspend() and .resume() callbacks is important.
We expect that the 'main' driver will stop the stream in its own
.suspend() and restart it in .resume(), which means that it needs to
be first to stop and last to start to ensure that the other devices
in the pipeline are fully available when those callbacks run.

To facilitate this, add device links between the async subdevices and
their associated notifier immediately before calling .complete(). The
new V4L2_DEVICE_FL_IS_OUTPUT flag is checked, and in that case the
consumer and supplier of the device link are reversed.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 107 +++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 460bf3dbbb88264fa63e3808d323d26861c873f5..7199ea244cba6ff1d1ec159ff8d9533418b541e6 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -273,6 +273,107 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
 	return true;
 }
 
+static void v4l2_async_nf_remove_device_links(struct v4l2_async_notifier *notifier)
+{
+	struct v4l2_async_connection *asc;
+
+	list_for_each_entry(asc, &notifier->done_list, asc_entry) {
+		struct v4l2_async_notifier *subdev_notifier =
+			v4l2_async_find_subdev_notifier(asc->sd);
+		struct device *consumer, *supplier;
+		struct v4l2_device *v4l2_dev;
+
+		v4l2_dev = v4l2_async_nf_find_v4l2_dev(notifier);
+
+		if (v4l2_dev->flags & V4L2_DEVICE_FL_IS_OUTPUT) {
+			consumer = asc->sd->dev;
+			supplier = notifier_dev(notifier);
+		} else {
+			consumer = notifier_dev(notifier);
+			supplier = asc->sd->dev;
+		}
+
+		device_link_remove(consumer, supplier);
+
+		if (subdev_notifier)
+			v4l2_async_nf_remove_device_links(notifier);
+	}
+}
+
+static int __v4l2_async_nf_create_device_links(struct v4l2_async_notifier *notifier)
+{
+	struct v4l2_async_connection *asc;
+	struct device_link *link;
+	int ret;
+
+	list_for_each_entry(asc, &notifier->done_list, asc_entry) {
+		struct v4l2_async_notifier *subdev_notifier =
+			v4l2_async_find_subdev_notifier(asc->sd);
+		struct device *consumer, *supplier;
+		struct v4l2_device *v4l2_dev;
+
+		if (asc->match.type != V4L2_ASYNC_MATCH_TYPE_FWNODE)
+			continue;
+
+		/*
+		 * The following two checks shouldn't be possible, but better
+		 * safe than oopsing.
+		 */
+		if (!asc->sd) {
+			dev_err(notifier_dev(notifier),
+				"async connection with null sd\n");
+			return -EINVAL;
+		}
+
+		if (!asc->sd->dev) {
+			dev_err(notifier_dev(notifier),
+				"async connection with null device\n");
+			return -EINVAL;
+		}
+
+		v4l2_dev = v4l2_async_nf_find_v4l2_dev(notifier);
+
+		if (v4l2_dev->flags & V4L2_DEVICE_FL_IS_OUTPUT) {
+			consumer = asc->sd->dev;
+			supplier = notifier_dev(notifier);
+		} else {
+			consumer = notifier_dev(notifier);
+			supplier = asc->sd->dev;
+		}
+
+		link = device_link_add(consumer, supplier, 0);
+		if (!link)
+			return -EINVAL;
+
+		if (subdev_notifier) {
+			ret = __v4l2_async_nf_create_device_links(subdev_notifier);
+			if (ret) {
+				device_link_del(link);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int v4l2_async_nf_create_device_links(struct v4l2_async_notifier *notifier)
+{
+	int ret;
+
+	if (!notifier->v4l2_dev) {
+		dev_err(notifier_dev(notifier),
+			"v4l2-async: tried to create devlinks for sub-notifier\n");
+		return -EINVAL;
+	}
+
+	ret = __v4l2_async_nf_create_device_links(notifier);
+	if (ret)
+		v4l2_async_nf_remove_device_links(notifier);
+
+	return ret;
+}
+
 /*
  * Complete the master notifier if possible. This is done when all async
  * sub-devices have been bound; v4l2_device is also available then.
@@ -281,6 +382,7 @@ static int
 v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
 {
 	struct v4l2_async_notifier *__notifier = notifier;
+	int ret;
 
 	/* Quick check whether there are still more sub-devices here. */
 	if (!list_empty(&notifier->waiting_list))
@@ -305,6 +407,10 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
 	if (!v4l2_async_nf_can_complete(notifier))
 		return 0;
 
+	ret = v4l2_async_nf_create_device_links(notifier);
+	if (ret)
+		return ret;
+
 	dev_dbg(notifier_dev(__notifier), "v4l2-async: complete\n");
 
 	return v4l2_async_nf_call_complete(notifier);
@@ -494,6 +600,7 @@ v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier)
 		if (subdev_notifier)
 			v4l2_async_nf_unbind_all_subdevs(subdev_notifier);
 
+		device_link_remove(notifier_dev(notifier), asc->sd->dev);
 		v4l2_async_unbind_subdev_one(notifier, asc);
 	}
 

-- 
2.43.0


