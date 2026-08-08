Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C8DC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 11:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTWsfLJS/81iyczYbFu23mRRJqJRdNk8TSWy7ODIao4=; b=QZPU1VmLT5gI51fdS5wVA/7Rs7
	56x6nadEu0p04qYULntMt70iTqtCS5MvlbQaeq8L+QwYC6A0TzC9g1K5AF5kYvz0/p4L4W0hISqJl
	7A0dgxjvrTt+MY00ltLFHTRGNKFXBr6vPv4exYxzy8k5SICrfyOcRCTHuxwVKm8a6D6YIP216hpbw
	pN8OQQ/TkoJKW81Q17/Ae41U58y//v7zSGjnhWruZ8qApFrW1zyLmyMZswn/IeWwMSv9/USogQxVw
	Mtm1fvYmvF7/ByynmyG1Y3V1R51VlmC3Ocn6t4hNbyUJywagVQdJM8LhqI3Bcv4e6W1DqujXPeSCs
	cc/TwXhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsesm-00000009IXe-2Dr5;
	Sat, 08 Aug 2026 11:06:28 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsesk-00000009IX7-0eye
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 11:06:27 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38e08baf860so320075a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 04:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786187185; x=1786791985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTWsfLJS/81iyczYbFu23mRRJqJRdNk8TSWy7ODIao4=;
        b=mbnnTH+5Bel5ogW1HGZzw/kS/Ubb8wzekJXPbFWN5VuFvQi1WL/AVD4DAPVZPfxzVB
         9ZmKKYcQrVgyqbmyeFbwaiY5UKQDR7WyLVSt4E7h4x5wcm4NOCzPB2qa7MJA0ifVAWK8
         deMiR9C/VL8MFO7mIHhyp9DUNGc0VpKcspHDphwEWbRCtOndi9ANSTkNlwVYfeI1bIuH
         fjQto/m90QQkpJ5hRNbY+pmVVcDFeXlQqCODczBQS7bBZM/L821D822RYaGl0m3u9a7x
         +7KrTS+mK7SyJB79kgvk9kdIxcrg7Pyoy5fXEOwcgdiC04eXbRdb2iW/DPAcqvtNgES7
         dQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786187185; x=1786791985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hTWsfLJS/81iyczYbFu23mRRJqJRdNk8TSWy7ODIao4=;
        b=oSXVABY4gNw2cHqSGn5EPl8WzIj2yQINonDMSxGp7yKlgaj0hSWoR54WApwvFKYwLW
         4AdSBvor/BEQPqielW5swybEUgAx3U2pJ6RPDHzaaCnIO9ulqvNfj79e1GrO43RTUPvy
         49+0tb2kURKVvNwyYC2QGaBzPXT8qjoWedyqQz4lNUudu+0AtPQ09Skj8SMlAI0Nr4/b
         mqp17EyXSPbEnNZZZANExHSdEdixLEsCNy8o/S1JiAf/s5bCUScAVXna7xaNZItiIXME
         eG58Q0pmKKrPdJ89iYKNJhKqD7SuiDROkNOPSmvwYntU6hsPGlP2k98HR2YDcFdQYd2S
         NCRA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7dEKr/CXeduChCgQBsmdlrXc6Bf6GTfXpYhdXrVdSzrCkPtv/sg00Tjv9fheJCT4y9yzn2ktAuVqhIxkUklgy@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/LmIthMOJddqsvV3JhFHnc36ij9X3DwkaenC/uXqAB1cbRaej
	xaZLHbWh0FW6UmRl8mqRiT6RihimYYOQpsXjmC8tMhbnlNqsUkt4SvBE
X-Gm-Gg: AR+sD10tjnJGzPRgFPr0D92/QE7WyELSfI2eTOrGt8GVco8NiiLBhpbVNCMEJPvcO4y
	sfeQAjhD+SQJSLowIDC/YjQq33/3XYrUykY1waJ9UuAdTvBQgwrrxY1F8d1joMqWrMuHoM2lOas
	pTllFCM0e/OIeTEnHAjx9Ih8vNH3Sp6PinbmowVYw1r0kqBbpm+cdBXM1v6/0eBtB6w+ACGAJCX
	y5Itwe+quwxOFeo85zkd37/R7StVz0wsUQYDhd0fPU7h8EVRPJKk/RxyVX4ZTGT0fIHztpSn1Gb
	ib1CuzYNlu/hjnJDNaZhijxtanvJAtPejvGa8kSeooxDPwHb8tLp5WR2Zu8UzXGXBUtZW03ZrhP
	n+vTeK/ULdc+eDkqB/F8mWNgohuH3VpVrYoNzJr+mfVws9elAvOhBDe41mGwSKi25WzxUX8W3NZ
	BEWgS28ieDnOM7m8zXXK8NwDopT/wV4e1q3pVIvjvOfMGQc+YZWocsbDzT3Fw8bb5iiLKEtRIcP
	TznRg==
X-Received: by 2002:a17:90b:2dc1:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-3903c535d79mr33954628a91.5.1786187185202;
        Sat, 08 Aug 2026 04:06:25 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm15243343c88.6.2026.08.08.04.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 04:06:24 -0700 (PDT)
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
Subject: [PATCH v1 1/3] media: sun4i-csi: fix video device and subdev leak in notify_complete()
Date: Sat,  8 Aug 2026 18:06:15 +0700
Message-Id: <7804a3c87beefde14e0358fa2a11e63005525890.1786184456.git.congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1786184456.git.congnt264@gmail.com>
References: <cover.1786184456.git.congnt264@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_040626_197637_2522B6B3 
X-CRM114-Status: GOOD (  12.99  )
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


