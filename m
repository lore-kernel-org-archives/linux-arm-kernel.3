Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF63C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 06:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTWsfLJS/81iyczYbFu23mRRJqJRdNk8TSWy7ODIao4=; b=Wedt2Z23uKGddxqj0WUhYt5JLN
	Xw7t0Gd4/9nAKD0N4XStVjY2rIaiRNfmrScK/CR/6lkoxjF/YpJTaYq++OXTgx6dcRF0YeYJ+sZU4
	C0/WJyvxVEbDQ84ec2t1qybO5NCdPziYX+N/7kAPFlbrX4bkmr2f17BlhBpPgSX1FK20PKFNx4zM6
	+nErumjbiGJzrwY9T67/K04loJv9vt7s8PX2fK8mQil5oKbO5Mu1oLMTJ+JZsWt0DxyR3xk7KFSil
	oENylC++4Lg9kg2zmJx+9KuidZqHbyreK8o9Glcn8mPl+t1/JJTtFXBmyynGEJEJwGTUpyxK2natI
	b3BZ50aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJS5-0000000B5M5-0sGF;
	Mon, 10 Aug 2026 06:25:37 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJS3-0000000B5Kw-07Uh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 06:25:36 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso11992615ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 23:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786343134; x=1786947934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTWsfLJS/81iyczYbFu23mRRJqJRdNk8TSWy7ODIao4=;
        b=o9FZEtkA9mACkmDeLsGngCXqIND6pM9YF3pMQm1MZY4HD97nRNE6Ql/YnWekcAt7Cq
         QAXK6qZZl7WCjqj1/6YQge5h/w/avp32LD+Naf3OiyQeVd5qlkggZVoE6f3avJlWz71v
         0htM3WACUi+cMx94bGtzBOl4pG5tY4kh7TvtY9pWCoa9qoZy7fWgl2sMTwM3+u+8GodG
         5fVhyrfVeQAokJC5bbZ2xD2T/GGZBVMB3JT1LA6+29d5fJV8Js6ZDiK2DJCc8HkfN/QM
         sHFoEzyO6Mzy3l7+eJ5k3ixRTkcpFAwojJ6x2yEDKD/80fzVtrkPJwDWAscvmMOzIMFB
         QuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786343134; x=1786947934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hTWsfLJS/81iyczYbFu23mRRJqJRdNk8TSWy7ODIao4=;
        b=MVLp43TvwypVg7Ec1kMW0LfIuZM34ZS/T3rBb/GHM5FtuiWuoPUv5ilqN8WLAFsSVh
         KQhOt7X9OvnZ9sQEqwgYvGFqmewvXr1KZTVBmP5/hHI9lVk98zhbpEQYSib70aKoISxi
         /l2VwCKk7LSfjM4xYD0cua+TtPNHRQuAmtq9KmQ6DNrjcxEek8kRuGiuSHb/ciwM+oUp
         NDBivOa+WJlMeDbHl1BIKZycXZR1sJpGxCeMKLo+DzBmmubbDQwa0K9tNI9BUHvWsG+E
         pb8Kzd3wsGZ62iUZzioTl4uZoLfWBSfwrCe4VRkcu0scvX2wtTen9cXPI1j5dSLGsJBb
         tW+Q==
X-Forwarded-Encrypted: i=1; AHgh+RptwB0Q+oxl2TXwzutaXPTU5OVB13/u0LN5WK7N1KR+d51R7+KKdb9KPcoAbVwPBgZNhQH+OgHVIqEQ25uc/6WI@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+v5yLkYp3LVt5zk88NEFvommkCT0uTALJFkZuFaTZ+gEPptYZ
	7jWT9JITe+XBiZAei3xpIqiJs4D/Mha+OzUa96B7edTmqgivJaGZKFPC
X-Gm-Gg: AR+sD11ihiiG0ddNYj575j59cZESFKOIoXrpu+rMnePaqu8knuXCW5RgEvHMAJfgntg
	yRPsvfZ7mZCDYznGEd/f7dPjEc+ENNRukZTIGFgt9jtBFDNkiYfFimnHUfrsOzSZTc8JwfhS3Iv
	1/JLm4bWmhGrTzeOmMJzFGy93pwu6vnUWjH28aMmWn1TtOV9bEWggJZsB7Nf9v5AQeec5e7S+Zn
	RhM4hF52V4n+gCEXas102AOw/YNUMotqrJ+/dFZYlCuhoCBhnvVezxinHJn1tbYezi3z/pPvknF
	eN4R1hz9CUAa6NLwOPLlG+CZrrgSHDPT1/woNYFiPVR9mTxNYyalNs50W5cJpXmaamLc8FgZiXb
	HUMvy5mgWzytaVqxajyT545lSdWBeO/4bAJIIVr/qcs9u7+thyvcz1OlRWrZ6/7lhT9U0JQR9h4
	JXj+aFQ1Ic4nUbtKIUcjwgf2mx2B6XKSqfvVjZKqOR0T3eo+jDMD2wIxeJPzO+q5r354DyCSDoK
	21I/w==
X-Received: by 2002:a05:6300:6d82:10b0:3cb:d156:d362 with SMTP id adf61e73a8af0-3cbd156d365mr11748055637.3.1786343134085;
        Sun, 09 Aug 2026 23:25:34 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb8844fsm40642912eec.16.2026.08.09.23.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 23:25:33 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] media: sun4i-csi: fix video device and subdev leak in notify_complete()
Date: Mon, 10 Aug 2026 13:25:19 +0700
Message-Id: <20260810062521.1709379-2-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260810062521.1709379-1-congnt264@gmail.com>
References: <cover.1786184456.git.congnt264@gmail.com>
 <20260810062521.1709379-1-congnt264@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_232535_088037_CE1465AD 
X-CRM114-Status: GOOD (  14.02  )
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

sun4i_csi_notify_complete() registers the bridge subdev with
v4l2_device_register_subdev() and the video device with
sun4i_csi_v4l2_register() (which calls video_register_device()) before it
creates the media pad links and registers the subdev nodes. If any of the
later steps fail, the error path only unregistered the media device:

	err_clean_media:
		media_device_unregister(&csi->mdev);
		return ret;

The already registered video device and bridge subdev were left behind.
Because this failure propagates back through v4l2_async_nf_register() and
aborts probe, the driver's devm-managed struct sun4i_csi (which embeds the
video_device) is freed while /dev/videoX is still registered, so a
subsequent open() from userspace dereferences freed memory.

Unwind the registrations in reverse order on error, mirroring the teardown
in sun4i_csi_remove(): unregister the video device with
vb2_video_unregister_device() and the bridge subdev with
v4l2_device_unregister_subdev(). Also unwind the intermediate v4l2/media
registration steps so every early return leaves no half-registered state.

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index e53a07b770b7..a8711336a754 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -85,11 +85,11 @@ static int sun4i_csi_notify_complete(struct v4l2_async_notifier *notifier)
 
 	ret = sun4i_csi_v4l2_register(csi);
 	if (ret < 0)
-		return ret;
+		goto err_unregister_subdev;
 
 	ret = media_device_register(&csi->mdev);
 	if (ret)
-		return ret;
+		goto err_unregister_video;
 
 	/* Create link from subdev to main device */
 	ret = media_create_pad_link(&subdev->entity, CSI_SUBDEV_SOURCE,
@@ -114,6 +114,10 @@ static int sun4i_csi_notify_complete(struct v4l2_async_notifier *notifier)
 
 err_clean_media:
 	media_device_unregister(&csi->mdev);
+err_unregister_video:
+	vb2_video_unregister_device(&csi->vdev);
+err_unregister_subdev:
+	v4l2_device_unregister_subdev(subdev);
 
 	return ret;
 }
-- 
2.25.1


