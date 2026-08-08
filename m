Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B647C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 11:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Vav1/IZDRyi5TmIe+ztFcmW7gzOkBU4RfYMZP3HSBU=; b=r3dMubcZp1aGj4HuZRr9dbWWMo
	PaF6B2u9PxpQ5VOLnkz/BEqmBtGUxLF2gGCclKqQK79qbNqxo/1kP441+9kD9F3JHOHZ1pZCLqUyj
	D+F4i1CKLUJClMdI8UBB7zYE6i37RdoqO9bTILdc2cWMPzBvvDs6ZpdeRJfrlxdNlyp5qLZvZLsIl
	QEJCho+Ug1b1rK2uJS58Ip5jxXW8NoUn36BghEbCr5h1cV1FT7ngU5yv623V8NtjtYznxBHw5bAge
	tGwQUyhb/TmVjemyFhvnYmKvhkcgncO6F7K1kNpfke6qI7SeErWum6nkfzPuqMotjdGnYMw2YCENz
	yaaDWOxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsf3c-00000009J0o-2EcX;
	Sat, 08 Aug 2026 11:17:40 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsf3a-00000009J0N-21Ba
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 11:17:39 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ccf2360620so3471745ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 04:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786187857; x=1786792657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Vav1/IZDRyi5TmIe+ztFcmW7gzOkBU4RfYMZP3HSBU=;
        b=CtF2Ft1xiwh5i/f51FSkH2blucuF7mBrOvefdJGp6qf4y6wBbhAfGNLf7v0/5l5n89
         ieDF6PNbJujmv5ZRI9atCxbw/lyh7zJY28lDBVDUtDmm22rSKZN1tyAZDbuibwHvfoSk
         0rvfHXjq0qep44Xp+bEti5+bsbeGSJXk1GXA9CwNTJ98+4rC2gg+7fFFf0STn2bjFziM
         m2v4Ljd12nG63U0Ouw4yoICrd4CxgLIYlKPJfku4AzXYA5bc7OYyJGNau+xR/sokDulT
         uBm+70uU4LGQdso2q0OQ5rtXML+wV6AFNbneiGSdbCn6DPq7KHjFyJOXwOMkSfRXRm7Y
         pOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786187857; x=1786792657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Vav1/IZDRyi5TmIe+ztFcmW7gzOkBU4RfYMZP3HSBU=;
        b=C9OlIrlB06idJ+hEnyZX+YnDgvOCHsD8rVyLlwYpodDT+XbREobiY+uoLTQTwD4Jbs
         pkoJJwpZjqsNH+OSvRhsrQVIuIgVUBs/R40E1NYMOMkGhLTDofD9TGVb3AWAt2krnITh
         0jQSq9Au+H3af5XTG+Knx4s2sJ3ln4ADJRA8rIcIYDCqEjs2NnI9qL6ZexeBidwskWqs
         2pSM4KW6XzXsNIPf3MAaOQX843r2CNhEekuNnjlqBOqrc/utGFTr2EUB334bPcfx6B4P
         72454NlvwUGRSww3LgEvKifDgnIcmSxme/X0sxwB6O9u8LviEjxVsNWeUel9KkVkX6uE
         OfEg==
X-Forwarded-Encrypted: i=1; AHgh+RrCX7JObq5KrhjgRvGortL6Qw7JnA8B6t4ZxmUcPr+XqXxGbmgQThAIO4t88D2M9p5tm8Il6gQek/cNTnpLQ53b@lists.infradead.org
X-Gm-Message-State: AOJu0YyRlcilTWmQILaXw4GLluFbSDtUJfz43M8+YQSaPpyT1t0c595u
	lJZKYSjFF00NKj7AVW6RYLOT1WL9wTPI1X5covniokFwpxm5TonakBJ0
X-Gm-Gg: AR+sD114/9r1G8cnWybL+PtEUgKIy34IgxbUg2jqhwwY7WxHq7SsbyY+ALA5e9q2jES
	MA83qjd0gvAdHWaDgvpiBESHSfEFMjYg7PYCExy2j9qH6c4nHLDT16RLXDZjrTiBcQt5AigQyCH
	37m/yoJDKmICecj7dXR9+pAjuR1a3Snar9SGv3c6Qt4NeaYLuzoLWjxu/7YXhC5jQExXOYtGdDP
	mX5MaiL5oSNFdKBD1lNQcQO6o7kGVr/F5WW4Pk24h6qxukxCA1WJhvd2xdH2WqF/KfkjHG3ABnz
	qHQKA0A9XOVRRINgDWfkXlCeSNuoZdytXQxnK2YAihyp5mTzDx062phwZFMbiS7aKGk6AMX3Eaf
	/Q2tWswzfAY+5PA1C7N+u/NKxuXSDDWHjmcW0ffnFINW2nO9gI/UBsCGBmsFLsYkPj4PasOHn/+
	eiDDeEBv/61Xf9zjf+vxmKkGlhJhzpngQvUivtgYGXiHkptrb/IrqujTlT85T3Yrewk+AWssN5Z
	yFcNQ==
X-Received: by 2002:a17:90b:448b:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-3909d8c3b9cmr13238521a91.13.1786187857487;
        Sat, 08 Aug 2026 04:17:37 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde308sm18356313eec.20.2026.08.08.04.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 04:17:37 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v1 3/3] media: sun4i-csi: add notifier unbind callback to drop the source subdev
Date: Sat,  8 Aug 2026 18:17:28 +0700
Message-Id: <61d4901af20a4d2d0f9484328c173bbdfc52ec05.1786184456.git.congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1786184456.git.congnt264@gmail.com>
References: <cover.1786184456.git.congnt264@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_041738_523786_6EE19017 
X-CRM114-Status: GOOD (  14.61  )
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

sun4i_csi_notify_ops only implements .bound and .complete. When the remote
sensor's subdevice goes away (e.g. its module is unloaded), the V4L2 async
core unbinds and frees it, but the driver keeps the stale pointer in
csi->src_subdev and leaves the video node registered.

A subsequent VIDIOC_STREAMON reaches sun4i_csi_start_streaming(), which
calls v4l2_subdev_call(csi->src_subdev, video, s_stream, 1) on the freed
subdev, resulting in a use-after-free.

Add an .unbind callback that unregisters the video device so userspace can
no longer start streaming, and clears csi->src_subdev. Unregistering the
already-unregistered video device again in sun4i_csi_remove() is harmless
(vb2_video_unregister_device() is a no-op when it is not registered).

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 .../media/platform/sunxi/sun4i-csi/sun4i_csi.c  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index a8711336a754..6610ada1c06d 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -122,8 +122,25 @@ static int sun4i_csi_notify_complete(struct v4l2_async_notifier *notifier)
 	return ret;
 }
 
+static void sun4i_csi_notify_unbind(struct v4l2_async_notifier *notifier,
+				    struct v4l2_subdev *subdev,
+				    struct v4l2_async_connection *asd)
+{
+	struct sun4i_csi *csi = container_of(notifier, struct sun4i_csi,
+					     notifier);
+
+	/*
+	 * The remote subdev is being freed. Tear down the video node so
+	 * userspace can no longer reach sun4i_csi_start_streaming() and
+	 * dereference the now dangling source subdev, and drop the pointer.
+	 */
+	vb2_video_unregister_device(&csi->vdev);
+	csi->src_subdev = NULL;
+}
+
 static const struct v4l2_async_notifier_operations sun4i_csi_notify_ops = {
 	.bound		= sun4i_csi_notify_bound,
+	.unbind		= sun4i_csi_notify_unbind,
 	.complete	= sun4i_csi_notify_complete,
 };
 
-- 
2.25.1


